@interface SpectrumRenderer
+ (CGPoint)positionForColor:(id)a1;
+ (id)colorAtLocation:(CGPoint)a3;
- (MTKView)metalView;
- (MTLBuffer)vertexBuffer;
- (MTLCommandQueue)commandQueue;
- (MTLDevice)device;
- (MTLRenderPipelineState)pipelineState;
- (SpectrumRenderer)initWithMetal:(id)a3;
- (void)drawInMTKView:(id)a3;
- (void)initializeVertexBuffer;
- (void)mtkView:(id)a3 drawableSizeWillChange:(CGSize)a4;
- (void)setCommandQueue:(id)a3;
- (void)setDevice:(id)a3;
- (void)setMetalView:(id)a3;
- (void)setPipelineState:(id)a3;
- (void)setVertexBuffer:(id)a3;
- (void)setupRenderPipeline;
- (void)startCapturing;
- (void)stopCapturing;
@end

@implementation SpectrumRenderer

+ (id)colorAtLocation:(CGPoint)a3
{
  CGFloat y = a3.y;
  double v4 = COERCE_DOUBLE(vcvt_f32_f64((float64x2_t)a3));
  float v16 = *(float *)&v4;
  *(__n64 *)v5.i8 = sub_100047CF8(v4);
  int8x16_t v6 = v5;
  float v7 = fabsf(v16);
  float v8 = *(float *)&v6.i32[2];
  *(float *)v9.i32 = fmaxf(fmaxf(*(float *)v6.i32, *(float *)&v6.i32[1]), *(float *)&v6.i32[2]);
  int32x2_t v17 = v9;
  int8x16_t v18 = v6;
  if (v16 >= 0.0)
  {
    float v14 = (float)(1.0 - sub_100047A48(flt_100051360, v7)) / *(float *)v9.i32;
    float32x2_t v12 = vmul_n_f32(*(float32x2_t *)v18.i8, v14);
    HIDWORD(v13) = vextq_s8(v18, v18, 8uLL).i32[1];
    *(float *)&uint64_t v13 = v8 * v14;
  }
  else
  {
    float v10 = sub_100047A48(flt_100051360, 1.0 - v7);
    float32x2_t v11 = (float32x2_t)vdup_lane_s32(v17, 0);
    float32x2_t v12 = vadd_f32(v11, vmul_n_f32(vsub_f32(*(float32x2_t *)v18.i8, v11), v10));
    *(float *)&uint64_t v13 = *(float *)v17.i32 + (float)((float)(v8 - *(float *)v17.i32) * v10);
    HIDWORD(v13) = v18.i32[3];
  }

  return +[UIColor colorWithRed:v12.f32[0] green:v12.f32[1] blue:*(float *)&v13 alpha:*((float *)&v13 + 1)];
}

+ (CGPoint)positionForColor:(id)a1
{
  long long v3 = v2;
  float v4 = *((float *)&v2 + 2);
  float v5 = fmaxf(*(float *)&v2, fmaxf(*((float *)&v2 + 1), *((float *)&v2 + 2)));
  if (v5 >= 1.0)
  {
    *(float *)&long long v2 = fminf(*(float *)&v2, fminf(*((float *)&v2 + 1), *((float *)&v2 + 2))) + -1.0;
    long long v18 = v3;
    int32x2_t v19 = (int32x2_t)v2;
    float v8 = -*(float *)&v2;
    *(float *)&unsigned int v21 = sub_100047BA0(flt_100051360, -*(float *)&v2) + -1.0;
    __asm { FMOV            V2.2D, #1.0 }
    v14.n128_u64[0] = (unint64_t)vcvt_f32_f64(vdivq_f64(vaddq_f64(vcvtq_f64_f32(vsub_f32(*(float32x2_t *)&v18, (float32x2_t)vdup_lane_s32(v19, 0))), _Q2), (float64x2_t)vdupq_lane_s64(COERCE__INT64(v8), 0)));
    *(float *)&unsigned int v15 = ((float)(v4 - *(float *)v19.i32) + 1.0) / v8;
    v14.n128_u64[1] = __PAIR64__(HIDWORD(v18), v15);
    float32x2_t v7 = (float32x2_t)__PAIR64__(COERCE_UNSIGNED_INT(sub_100047F64(v14)), v21);
  }
  else
  {
    v6.n128_u64[0] = (unint64_t)vmul_n_f32(*(float32x2_t *)&v2, 1.0 / v5);
    v6.n128_f32[2] = *((float *)&v3 + 2) * (float)(1.0 / v5);
    v6.n128_u32[3] = HIDWORD(v3);
    float v20 = sub_100047F64(v6);
    v7.f32[0] = sub_100047BA0(flt_100051360, 1.0 - v5);
    v7.f32[1] = v20;
  }
  float64x2_t v16 = vcvtq_f64_f32(v7);
  double v17 = v16.f64[1];
  result.x = v16.f64[0];
  result.CGFloat y = v17;
  return result;
}

- (SpectrumRenderer)initWithMetal:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SpectrumRenderer;
  __n128 v6 = [(SpectrumRenderer *)&v12 init];
  if (v6)
  {
    float32x2_t v7 = (MTLDevice *)MTLCreateSystemDefaultDevice();
    device = v6->_device;
    v6->_device = v7;

    int32x2_t v9 = (MTLCommandQueue *)[(MTLDevice *)v6->_device newCommandQueue];
    commandQueue = v6->_commandQueue;
    v6->_commandQueue = v9;

    objc_storeStrong((id *)&v6->_metalView, a3);
    [(MTKView *)v6->_metalView setDevice:v6->_device];
    [(MTKView *)v6->_metalView setDelegate:v6];
    [(SpectrumRenderer *)v6 initializeVertexBuffer];
    [(SpectrumRenderer *)v6 setupRenderPipeline];
  }

  return v6;
}

- (void)setupRenderPipeline
{
  id v3 = objc_alloc_init((Class)MTLRenderPipelineDescriptor);
  id v4 = [(MTLDevice *)self->_device newDefaultLibrary];
  id v5 = [v4 newFunctionWithName:@"vertexShader"];
  [v3 setVertexFunction:v5];

  id v6 = [v4 newFunctionWithName:@"fragmentShader"];
  [v3 setFragmentFunction:v6];

  MTLPixelFormat v7 = [(MTKView *)self->_metalView colorPixelFormat];
  float v8 = [v3 colorAttachments];
  int32x2_t v9 = [v8 objectAtIndexedSubscript:0];
  [v9 setPixelFormat:v7];

  device = self->_device;
  id v14 = 0;
  float32x2_t v11 = (MTLRenderPipelineState *)[(MTLDevice *)device newRenderPipelineStateWithDescriptor:v3 error:&v14];
  id v12 = v14;
  pipelineState = self->_pipelineState;
  self->_pipelineState = v11;
}

- (void)initializeVertexBuffer
{
  v5[0] = xmmword_100051370;
  v5[1] = unk_100051380;
  v5[2] = xmmword_100051390;
  id v3 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithBytes:v5 length:48 options:0];
  vertexBuffer = self->_vertexBuffer;
  self->_vertexBuffer = v3;
}

- (void)drawInMTKView:(id)a3
{
  id v9 = [(MTLCommandQueue *)self->_commandQueue commandBuffer];
  id v4 = [(MTKView *)self->_metalView currentRenderPassDescriptor];
  id v5 = [v4 colorAttachments];
  id v6 = [v5 objectAtIndexedSubscript:0];
  objc_msgSend(v6, "setClearColor:", 0.0, 0.0, 0.0, 0.0);

  MTLPixelFormat v7 = [v9 renderCommandEncoderWithDescriptor:v4];
  [v7 setRenderPipelineState:self->_pipelineState];
  [v7 setVertexBuffer:self->_vertexBuffer offset:0 atIndex:0];
  [v7 drawPrimitives:3 vertexStart:0 vertexCount:6];
  [v7 endEncoding];
  float v8 = [(MTKView *)self->_metalView currentDrawable];
  [v9 presentDrawable:v8];

  [v9 commit];
}

- (void)mtkView:(id)a3 drawableSizeWillChange:(CGSize)a4
{
}

- (void)startCapturing
{
  id v4 = +[MTLCaptureManager sharedCaptureManager];
  id v3 = objc_alloc_init((Class)MTLCaptureDescriptor);
  [v3 setCaptureObject:self->_device];
  [v4 startCaptureWithDescriptor:v3 error:0];
}

- (void)stopCapturing
{
  id v2 = +[MTLCaptureManager sharedCaptureManager];
  [v2 stopCapture];
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

- (MTKView)metalView
{
  return self->_metalView;
}

- (void)setMetalView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalView, 0);
  objc_storeStrong((id *)&self->_vertexBuffer, 0);
  objc_storeStrong((id *)&self->_pipelineState, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_commandQueue, 0);
}

@end