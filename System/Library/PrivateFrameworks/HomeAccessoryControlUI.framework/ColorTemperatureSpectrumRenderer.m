@interface ColorTemperatureSpectrumRenderer
+ (CGPoint)positionForColor:(float)a3;
+ (float)colorAtLocation:(CGPoint)a3;
- (CGPoint)positionForColor:(float)a3;
- (ColorTemperatureSpectrumRenderer)initWithMetal:(id)a3 startColor:(unsigned __int16)a4 endColor:(unsigned __int16)a5;
- (MTKView)metalView;
- (MTLBuffer)fragmentShaderArgumentBuffer;
- (MTLBuffer)vertexBuffer;
- (MTLCommandQueue)commandQueue;
- (MTLDevice)device;
- (MTLRenderPipelineState)pipelineState;
- (float)colorAtLocation:(CGPoint)a3;
- (unsigned)endColor;
- (unsigned)startColor;
- (void)drawInMTKView:(id)a3;
- (void)initializeVertexBuffer;
- (void)mtkView:(id)a3 drawableSizeWillChange:(CGSize)a4;
- (void)setCommandQueue:(id)a3;
- (void)setDevice:(id)a3;
- (void)setEndColor:(unsigned __int16)a3;
- (void)setFragmentShaderArgumentBuffer:(id)a3;
- (void)setMetalView:(id)a3;
- (void)setPipelineState:(id)a3;
- (void)setStartColor:(unsigned __int16)a3;
- (void)setVertexBuffer:(id)a3;
- (void)setupRenderPipeline;
@end

@implementation ColorTemperatureSpectrumRenderer

- (ColorTemperatureSpectrumRenderer)initWithMetal:(id)a3 startColor:(unsigned __int16)a4 endColor:(unsigned __int16)a5
{
  id v9 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ColorTemperatureSpectrumRenderer;
  v10 = [(ColorTemperatureSpectrumRenderer *)&v18 init];
  if (v10)
  {
    v11 = (MTLDevice *)MTLCreateSystemDefaultDevice();
    device = v10->_device;
    v10->_device = v11;

    uint64_t v13 = [(MTLDevice *)v10->_device newCommandQueue];
    commandQueue = v10->_commandQueue;
    v10->_commandQueue = (MTLCommandQueue *)v13;

    objc_storeStrong((id *)&v10->_metalView, a3);
    [(MTKView *)v10->_metalView setDevice:v10->_device];
    [(MTKView *)v10->_metalView setDelegate:v10];
    v10->_startColor = a4;
    v10->_endColor = a5;
    [(ColorTemperatureSpectrumRenderer *)v10 initializeVertexBuffer];
    [(ColorTemperatureSpectrumRenderer *)v10 setupRenderPipeline];
    v15 = [MEMORY[0x263F08B88] currentThread];
    v16 = [v15 threadDictionary];
    [v16 setObject:v10 forKey:@"SpectrumRendererThreadLocal"];
  }
  return v10;
}

- (void)setupRenderPipeline
{
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  device = self->_device;
  id v18 = 0;
  v5 = (void *)[(MTLDevice *)device newDefaultLibraryWithBundle:v3 error:&v18];
  id v6 = v18;
  if (v5)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F129C0]);
    v8 = (void *)[v5 newFunctionWithName:@"vertexShader"];
    [v7 setVertexFunction:v8];

    id v9 = (void *)[v5 newFunctionWithName:@"fragmentShader"];
    [v7 setFragmentFunction:v9];

    MTLPixelFormat v10 = [(MTKView *)self->_metalView colorPixelFormat];
    v11 = [v7 colorAttachments];
    v12 = [v11 objectAtIndexedSubscript:0];
    [v12 setPixelFormat:v10];

    uint64_t v13 = self->_device;
    id v17 = v6;
    v14 = (MTLRenderPipelineState *)[(MTLDevice *)v13 newRenderPipelineStateWithDescriptor:v7 error:&v17];
    id v15 = v17;

    pipelineState = self->_pipelineState;
    self->_pipelineState = v14;

    id v6 = v15;
  }
}

- (void)initializeVertexBuffer
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v8[0] = xmmword_251792020;
  v8[1] = unk_251792030;
  v8[2] = xmmword_251792040;
  v3 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithBytes:v8 length:48 options:0];
  vertexBuffer = self->_vertexBuffer;
  self->_vertexBuffer = v3;

  v5 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithLength:4 options:0];
  fragmentShaderArgumentBuffer = self->_fragmentShaderArgumentBuffer;
  self->_fragmentShaderArgumentBuffer = v5;

  id v7 = (_WORD *)[(MTLBuffer *)self->_fragmentShaderArgumentBuffer contents];
  *id v7 = [(ColorTemperatureSpectrumRenderer *)self startColor];
  v7[1] = [(ColorTemperatureSpectrumRenderer *)self endColor];
}

- (void)drawInMTKView:(id)a3
{
  id v9 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  v4 = [(MTKView *)self->_metalView currentRenderPassDescriptor];
  v5 = [v4 colorAttachments];
  id v6 = [v5 objectAtIndexedSubscript:0];
  objc_msgSend(v6, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

  id v7 = [v9 renderCommandEncoderWithDescriptor:v4];
  [v7 setRenderPipelineState:self->_pipelineState];
  [v7 setVertexBuffer:self->_vertexBuffer offset:0 atIndex:0];
  [v7 setFragmentBuffer:self->_fragmentShaderArgumentBuffer offset:0 atIndex:0];
  [v7 drawPrimitives:3 vertexStart:0 vertexCount:6];
  [v7 endEncoding];
  v8 = [(MTKView *)self->_metalView currentDrawable];
  [v9 presentDrawable:v8];

  [v9 commit];
}

- (void)mtkView:(id)a3 drawableSizeWillChange:(CGSize)a4
{
}

- (float)colorAtLocation:(CGPoint)a3
{
  CGFloat x = a3.x;
  id v4 = [(ColorTemperatureSpectrumRenderer *)self fragmentShaderArgumentBuffer];
  v5 = (_DWORD *)[v4 contents];

  *(float *)&CGFloat x = x;
  float v6 = (*(float *)&x + 1.0) * 0.5;
  return fminf(fmaxf((float)(unsigned __int16)*v5 + (float)(v6 * (float)((float)HIWORD(*v5) - (float)(unsigned __int16)*v5)), 0.0), 1000.0);
}

+ (float)colorAtLocation:(CGPoint)a3
{
  CGFloat y = a3.y;
  double x = a3.x;
  v5 = [MEMORY[0x263F08B88] currentThread];
  float v6 = [v5 threadDictionary];
  id v7 = [v6 objectForKey:@"SpectrumRendererThreadLocal"];

  objc_msgSend(v7, "colorAtLocation:", x, y);
  LODWORD(y) = v8;

  return *(float *)&y;
}

- (CGPoint)positionForColor:(float)a3
{
  id v4 = [(ColorTemperatureSpectrumRenderer *)self fragmentShaderArgumentBuffer];
  v5 = (_DWORD *)[v4 contents];

  float v6 = (float)((float)(a3 - (float)(unsigned __int16)*v5) / (float)((float)HIWORD(*v5) - (float)(unsigned __int16)*v5))
     * 2.0
     + -1.0;
  double v7 = v6;
  double v8 = 0.0;
  result.CGFloat y = v8;
  result.double x = v7;
  return result;
}

+ (CGPoint)positionForColor:(float)a3
{
  id v4 = [MEMORY[0x263F08B88] currentThread];
  v5 = [v4 threadDictionary];
  float v6 = [v5 objectForKey:@"SpectrumRendererThreadLocal"];

  *(float *)&double v7 = a3;
  [v6 positionForColor:v7];
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.CGFloat y = v13;
  result.double x = v12;
  return result;
}

- (MTKView)metalView
{
  return self->_metalView;
}

- (void)setMetalView:(id)a3
{
}

- (MTLCommandQueue)commandQueue
{
  return self->_commandQueue;
}

- (void)setCommandQueue:(id)a3
{
}

- (MTLDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (MTLRenderPipelineState)pipelineState
{
  return self->_pipelineState;
}

- (void)setPipelineState:(id)a3
{
}

- (MTLBuffer)vertexBuffer
{
  return self->_vertexBuffer;
}

- (void)setVertexBuffer:(id)a3
{
}

- (MTLBuffer)fragmentShaderArgumentBuffer
{
  return self->_fragmentShaderArgumentBuffer;
}

- (void)setFragmentShaderArgumentBuffer:(id)a3
{
}

- (unsigned)startColor
{
  return self->_startColor;
}

- (void)setStartColor:(unsigned __int16)a3
{
  self->_startColor = a3;
}

- (unsigned)endColor
{
  return self->_endColor;
}

- (void)setEndColor:(unsigned __int16)a3
{
  self->_endColor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fragmentShaderArgumentBuffer, 0);
  objc_storeStrong((id *)&self->_vertexBuffer, 0);
  objc_storeStrong((id *)&self->_pipelineState, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_metalView, 0);
}

@end