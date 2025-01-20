@interface NTKPrideWeaveSpiroQuad
- (BOOL)prepareForTime:(double)a3;
- (NTKPrideWeaveSpiroQuad)init;
- (double)currentTime;
- (float)rotation;
- (float)thickness;
- (float)timeScale;
- (float)viewMode;
- (float)winding;
- (id)prepareFrameCallback;
- (int)startLoop;
- (void)renderForDisplayWithEncoder:(id)a3;
- (void)setCurrentTime:(double)a3;
- (void)setPrepareFrameCallback:(id)a3;
- (void)setRotation:(float)a3;
- (void)setStartLoop:(int)a3;
- (void)setThickness:(float)a3;
- (void)setTimeScale:(float)a3;
- (void)setTritiumProgress:(float)a3;
- (void)setTritiumProgress:(float)a3 forLoop:(unint64_t)a4;
- (void)setViewMode:(float)a3;
- (void)setWinding:(float)a3;
- (void)setupForQuadView:(id)a3;
@end

@implementation NTKPrideWeaveSpiroQuad

- (NTKPrideWeaveSpiroQuad)init
{
  v13.receiver = self;
  v13.super_class = (Class)NTKPrideWeaveSpiroQuad;
  v2 = [(NTKPrideWeaveSpiroQuad *)&v13 init];
  if (v2)
  {
    uint64_t v3 = +[CLKUIMetalResourceManager sharedDevice];
    device = v2->_device;
    v2->_device = (MTLDevice *)v3;

    v2->_timeScale = 1.0;
    v2->_thickness = 1.0;
    v5 = +[CLKDevice currentDevice];
    [v5 screenBounds];
    double v7 = v6;
    [v5 screenScale];
    *(float *)&double v8 = v8 * v7;
    v2->_uniforms.screenHeight = *(float *)&v8;
    [v5 screenBounds];
    double v10 = v9;
    [v5 screenScale];
    *(float *)&double v11 = v11 * v10;
    v2->_uniforms.screenWidth = *(float *)&v11;
    v2->_uniforms.steps = 128;
  }
  return v2;
}

- (void)setViewMode:(float)a3
{
  self->_viewMode = 0.0;
}

- (void)setTritiumProgress:(float)a3 forLoop:(unint64_t)a4
{
  self->_tritiumProgress[a4] = a3;
}

- (void)setTritiumProgress:(float)a3
{
  for (uint64_t i = 0; i != 11; ++i)
  {
    *(float *)&double v6 = a3;
    [(NTKPrideWeaveSpiroQuad *)self setTritiumProgress:i forLoop:v6];
  }
}

- (void)setupForQuadView:(id)a3
{
  id v4 = a3;
  v5 = +[CLKUIMetalResourceManager sharedDevice];
  double v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [v5 newDefaultLibraryWithBundle:v6 error:0];

  id v8 = [v7 newFunctionWithName:@"spiro_vertex_shader"];
  id v9 = [v7 newFunctionWithName:@"spiro_fragment_shader"];
  id v10 = objc_alloc_init((Class)MTLRenderPipelineDescriptor);
  [v10 setLabel:@"WeaveSpirographPipeline"];
  [v10 setVertexFunction:v8];
  [v10 setFragmentFunction:v9];
  id v11 = [v4 colorPixelFormat];
  v12 = [v10 colorAttachments];
  objc_super v13 = [v12 objectAtIndexedSubscript:0];
  [v13 setPixelFormat:v11];

  [v10 setDepthAttachmentPixelFormat:252];
  v14 = [v10 colorAttachments];
  v15 = [v14 objectAtIndexedSubscript:0];
  [v15 setBlendingEnabled:0];

  [v10 setRasterSampleCount:4];
  id v23 = 0;
  v16 = (MTLRenderPipelineState *)[v5 newRenderPipelineStateWithDescriptor:v10 error:&v23];
  id v17 = v23;
  renderPipelineState = self->_renderPipelineState;
  self->_renderPipelineState = v16;

  if (v17)
  {
    v19 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_17F4C(v17, v19);
    }
  }
  for (uint64_t i = 0; i != 3; ++i)
  {
    v21 = (MTLBuffer *)[v5 newBufferWithLength:528 options:0];
    v22 = self->_curvesBuffer[i];
    self->_curvesBuffer[i] = v21;
  }
}

- (BOOL)prepareForTime:(double)a3
{
  double v4 = (a3 - self->_previousTime) * self->_timeScale;
  BOOL v5 = v4 > 0.0833333333 || v4 < 0.0;
  self->_previousTime = a3;
  if (v5) {
    double v6 = 0.0;
  }
  else {
    double v6 = v4;
  }
  self->_currentTime = self->_currentTime + v6;
  prepareFrameCallback = (void (**)(id, SEL))self->_prepareFrameCallback;
  if (prepareFrameCallback) {
    prepareFrameCallback[2](prepareFrameCallback, a2);
  }
  float thickness = self->_thickness;
  if (thickness != 0.0)
  {
    int v8 = (self->_currentIndex + 1) % 3;
    self->_currentIndex = v8;
    id v9 = (char *)[(MTLBuffer *)self->_curvesBuffer[v8] contents];
    CLKInterpolateBetweenFloatsUnclipped();
    float v11 = v10;
    CLKInterpolateBetweenFloatsUnclipped();
    float v13 = v12;
    CLKInterpolateBetweenFloatsUnclipped();
    uint64_t v14 = 0;
    float v15 = (float)(v11 - v13) * 0.5;
    float v16 = v15 + -0.05;
    double v17 = (float)(v15 + v13);
    v18 = (float *)(v9 + 16);
    do
    {
      double v19 = self->_tritiumProgress[(int)(v14 + [(NTKPrideWeaveSpiroQuad *)self startLoop]) % 11];
      CLKInterpolateBetweenFloatsUnclipped();
      float v21 = v20;
      *(v18 - 4) = v16;
      *(float *)&double v20 = v17 + v19 * -0.05;
      *(v18 - 1) = *(float *)&v20;
      float *v18 = v21;
      *(v18 - 3) = 1.0;
      *(float *)&double v20 = self->_rotation
                     + ((float)((float)(int)v14 / 11.0) + (float)((float)(int)v14 / 11.0)) * 3.14159265;
      *(v18 - 2) = *(float *)&v20;
      CLKUIConvertToRGBfFromSRGBf_fast();
      *((_OWORD *)v18 + 1) = v22;
      ++v14;
      v18 += 12;
    }
    while (v14 != 11);
  }
  return thickness != 0.0;
}

- (void)renderForDisplayWithEncoder:(id)a3
{
  renderPipelineState = self->_renderPipelineState;
  id v5 = a3;
  [v5 setRenderPipelineState:renderPipelineState];
  [v5 setVertexBuffer:self->_curvesBuffer[self->_currentIndex] offset:0 atIndex:0];
  [v5 setVertexBytes:&self->_uniforms length:12 atIndex:1];
  [v5 drawPrimitives:4 vertexStart:0 vertexCount:256 instanceCount:11 baseInstance:0];
}

- (float)winding
{
  return self->_winding;
}

- (void)setWinding:(float)a3
{
  self->_winding = a3;
}

- (float)viewMode
{
  return self->_viewMode;
}

- (float)timeScale
{
  return self->_timeScale;
}

- (void)setTimeScale:(float)a3
{
  self->_timeScale = a3;
}

- (float)rotation
{
  return self->_rotation;
}

- (void)setRotation:(float)a3
{
  self->_rotation = a3;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (void)setCurrentTime:(double)a3
{
  self->_currentTime = a3;
}

- (float)thickness
{
  return self->_thickness;
}

- (void)setThickness:(float)a3
{
  self->_float thickness = a3;
}

- (int)startLoop
{
  return self->_startLoop;
}

- (void)setStartLoop:(int)a3
{
  self->_startLoop = a3;
}

- (id)prepareFrameCallback
{
  return self->_prepareFrameCallback;
}

- (void)setPrepareFrameCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_prepareFrameCallback, 0);
  objc_storeStrong((id *)&self->_device, 0);
  for (uint64_t i = 2; i != -1; --i)
    objc_storeStrong((id *)&self->_curvesBuffer[i], 0);

  objc_storeStrong((id *)&self->_renderPipelineState, 0);
}

@end