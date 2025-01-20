@interface NTKPrideMetalQuad
- (BOOL)additiveBlendingEnabled;
- (BOOL)postSemaphoreComputeForTime:(double)a3;
- (BOOL)preSemaphoreComputeForTime:(double)a3;
- (BOOL)prepareForTime:(double)a3;
- (NTKPrideMetalQuad)initWithDevice:(id)a3 initialSemaphoreCount:(int)a4;
- (double)currentTime;
- (float)timeScale;
- (id)clkDevice;
- (id)computePipelineManager;
- (id)computeShaderName;
- (id)fragmentShaderName;
- (id)renderPipelineManager;
- (id)renderPipelineName;
- (id)vertexShaderName;
- (void)dealloc;
- (void)handleScreenOff;
- (void)performOffscreenPassesWithCommandBuffer:(id)a3;
- (void)renderForDisplayWithEncoder:(id)a3;
- (void)setTimeScale:(float)a3;
- (void)setupForQuadView:(id)a3;
@end

@implementation NTKPrideMetalQuad

- (id)computePipelineManager
{
  if (qword_2C8F8 != -1) {
    dispatch_once(&qword_2C8F8, &stru_249D8);
  }
  v2 = (void *)qword_2C8F0;

  return v2;
}

- (id)renderPipelineManager
{
  return 0;
}

- (id)fragmentShaderName
{
  return 0;
}

- (id)vertexShaderName
{
  return 0;
}

- (id)computeShaderName
{
  return 0;
}

- (id)renderPipelineName
{
  return 0;
}

- (BOOL)additiveBlendingEnabled
{
  return 1;
}

- (NTKPrideMetalQuad)initWithDevice:(id)a3 initialSemaphoreCount:(int)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKPrideMetalQuad;
  v7 = [(NTKPrideMetalQuad *)&v10 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_clkDevice, a3);
    v8->_startTime = CACurrentMediaTime();
  }

  return v8;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NTKPrideMetalQuad;
  [(NTKPrideMetalQuad *)&v2 dealloc];
}

- (void)setupForQuadView:(id)a3
{
  id v4 = a3;
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = +[CLKUIMetalResourceManager sharedDevice];
  id v7 = [v6 newDefaultLibraryWithBundle:v5 error:0];
  v8 = [(NTKPrideMetalQuad *)self computePipelineManager];
  v9 = [v8 pipeline];
  mtlComputePipelineState = self->_mtlComputePipelineState;
  self->_mtlComputePipelineState = v9;

  if (!self->_mtlComputePipelineState)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_11EB0;
    v24[3] = &unk_24A00;
    id v25 = v7;
    v26 = self;
    id v27 = v6;
    v11 = +[NTKPromise metalPipelinePromiseNamed:@"Pride Compute Pipeline" withBlock:v24];
    v12 = self->_mtlComputePipelineState;
    self->_mtlComputePipelineState = v11;

    v13 = [(NTKPrideMetalQuad *)self computePipelineManager];
    [v13 setPipeline:self->_mtlComputePipelineState];
  }
  v14 = [(NTKPrideMetalQuad *)self renderPipelineManager];
  v15 = [v14 pipeline];
  mtlPipelineState = self->_mtlPipelineState;
  self->_mtlPipelineState = v15;

  if (!self->_mtlPipelineState)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_12018;
    v20[3] = &unk_24A28;
    v20[4] = self;
    id v21 = v7;
    id v22 = v4;
    id v23 = v6;
    v17 = +[NTKPromise metalPipelinePromiseNamed:@"Pride Render Pipeline" withBlock:v20];
    v18 = self->_mtlPipelineState;
    self->_mtlPipelineState = v17;

    v19 = [(NTKPrideMetalQuad *)self renderPipelineManager];
    [v19 setPipeline:self->_mtlPipelineState];
  }
  [(NTKPrideMetalQuad *)self loadMetalTexturesAndBuffersWithDevice:v6];
}

- (id)clkDevice
{
  return self->_clkDevice;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (void)performOffscreenPassesWithCommandBuffer:(id)a3
{
  if (self->_mtlComputePipelineState)
  {
    id v6 = [a3 computeCommandEncoder];
    id v4 = [(NTKPromise *)self->_mtlComputePipelineState object];
    [v6 setComputePipelineState:v4];

    v5 = [(NTKPromise *)self->_mtlComputePipelineState object];
    [(NTKPrideMetalQuad *)self computeWithEncoder:v6 pipelineState:v5];

    [v6 endEncoding];
  }
}

- (void)renderForDisplayWithEncoder:(id)a3
{
  mtlPipelineState = self->_mtlPipelineState;
  id v6 = a3;
  v5 = [(NTKPromise *)mtlPipelineState object];
  [v6 setRenderPipelineState:v5];

  [(NTKPrideMetalQuad *)self renderWithEncoder:v6];
}

- (BOOL)preSemaphoreComputeForTime:(double)a3
{
  return 0;
}

- (BOOL)postSemaphoreComputeForTime:(double)a3
{
  return 0;
}

- (void)handleScreenOff
{
  double v3 = CACurrentMediaTime();
  self->_startTime = v3 + (float)((float)((float)rand() * -4.6566e-10) * 1024.0);
}

- (BOOL)prepareForTime:(double)a3
{
  v5 = [(NTKPrideMetalQuad *)self quadView];
  [v5 frameNum];
  kdebug_trace();

  self->_currentTime = a3 - self->_startTime;
  BOOL v6 = -[NTKPrideMetalQuad preSemaphoreComputeForTime:](self, "preSemaphoreComputeForTime:");
  if (v6)
  {
    BOOL v6 = [(NTKPrideMetalQuad *)self postSemaphoreComputeForTime:self->_currentTime];
    if (v6)
    {
      id v7 = [(NTKPrideMetalQuad *)self quadView];
      [v7 frameNum];
      kdebug_trace();

      LOBYTE(v6) = 1;
    }
  }
  return v6;
}

- (float)timeScale
{
  return self->_timeScale;
}

- (void)setTimeScale:(float)a3
{
  self->_timeScale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clkDevice, 0);
  objc_storeStrong((id *)&self->_mtlComputePipelineState, 0);

  objc_storeStrong((id *)&self->_mtlPipelineState, 0);
}

@end