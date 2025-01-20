@interface NTKPrideSplinesQuad
- ($8EF4127CF77ECA3DDB612FCF233DC3A8)noiseConfiguration;
- (BOOL)enableRecording;
- (BOOL)forceRender;
- (BOOL)postSemaphoreComputeForTime:(double)a3;
- (BOOL)preSemaphoreComputeForTime:(double)a3;
- (BOOL)shouldForceRender;
- (MTLBuffer)currentComputeBuffer;
- (MTLBuffer)currentSplinesBuffer;
- (NTKPrideSplinesQuad)initWithDevice:(id)a3 touchCrownHandler:(id)a4;
- (NTKPrideTouchCrownHandler)touchCrownHandler;
- (double)noiseSamplePositionForControlPoint:inSpline:;
- (float)amplitudeMultiplier;
- (float)ampltiudeForControlPoint:(int)a3 ofSpline:(int)a4;
- (float)combinedAmplitudeForControlPointAtPosition:(float)a3 currentTime:(float)a4 waveSpeed:;
- (float)computeAmplitudeForControlPoint:(int)a3 inSpline:(int)a4 atTime:(double)a5;
- (float)fadeMultiplier;
- (float)globalAmplitudeForTime:(double)a3;
- (float)interpolationStepSizeForSpline:(int)a3;
- (float)vignetteAmount;
- (id)_generateInterpolationPositions;
- (id)computeShaderName;
- (id)fragmentShaderName;
- (id)generateVignetteTextureData;
- (id)getNTKPrideSplineDefinitionFiller;
- (id)snapshot;
- (id)snapshotWithScale:(double)a3;
- (id)snapshotWithSize:(CGSize)a3 scale:(double)a4 apl:(float *)a5;
- (int)currentComputeBufferWidth;
- (int)maxVertsPerSpline;
- (int)numControlPointsPerSpline;
- (int)numSplines;
- (int)numVertsForSpline:(int)a3;
- (int)splineDrawOrder:(int)a3;
- (void)clearWaves;
- (void)computeWithEncoder:(id)a3 pipelineState:(id)a4;
- (void)dealloc;
- (void)forceRenderOnce;
- (void)generateControlPointsForSpline:(int)a3;
- (void)handleSingleTap:(id)a3;
- (void)loadMetalTexturesAndBuffersWithDevice:(id)a3;
- (void)renderWithEncoder:(id)a3;
- (void)setAmplitude:(float)a3 forControlPoint:(int)a4 ofSpline:(int)a5;
- (void)setAmplitudeMultiplier:(float)a3;
- (void)setControlPointsNeedUpdate;
- (void)setFadeMultiplier:(float)a3;
- (void)setIgnoresStrumAndTap:(BOOL)a3;
- (void)setNoise:(int)a3 forControlPoint:(int)a4 inSpline:;
- (void)setPreviousCrownIndex:(int)a3;
- (void)startWavesAtNextRender;
- (void)startWavesAtTime:(double)a3;
- (void)strumToOffset:(double)a3 withVelocity:(double)a4;
- (void)tapAtPoint:(CGPoint)a3 atTime:(double)a4;
@end

@implementation NTKPrideSplinesQuad

- (NTKPrideSplinesQuad)initWithDevice:(id)a3 touchCrownHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)NTKPrideSplinesQuad;
  v8 = [(NTKPrideMetalQuad *)&v15 initWithDevice:v6 initialSemaphoreCount:3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)(v8 + 60), a4);
    [v6 screenBounds];
    float64_t v14 = v10;
    [v6 screenBounds];
    v11.f64[0] = v14;
    v11.f64[1] = v12;
    *(float32x2_t *)(v9 + 140) = vcvt_f32_f64(v11);
    *((_DWORD *)v9 + 42) = 1065353216;
    *((_DWORD *)v9 + 43) = 1065353216;
  }

  return (NTKPrideSplinesQuad *)v9;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NTKPrideSplinesQuad;
  [(NTKPrideMetalQuad *)&v2 dealloc];
}

- (int)splineDrawOrder:(int)a3
{
  return a3;
}

- (int)maxVertsPerSpline
{
  if ([(NTKPrideSplinesQuad *)self numSplines] < 1) {
    return 0;
  }
  int v3 = 0;
  uint64_t v4 = 0;
  do
  {
    signed int v5 = [(NTKPrideSplinesQuad *)self numVertsForSpline:v4];
    if (v3 <= v5) {
      int v3 = v5;
    }
    uint64_t v4 = (v4 + 1);
  }
  while ((int)v4 < [(NTKPrideSplinesQuad *)self numSplines]);
  return v3;
}

- (id)generateVignetteTextureData
{
  objc_super v2 = objc_opt_new();

  return v2;
}

- (float)vignetteAmount
{
  return 1.0;
}

- (id)_generateInterpolationPositions
{
  int v3 = [(NTKPrideSplinesQuad *)self numControlPointsPerSpline];
  int v4 = [(NTKPrideSplinesQuad *)self maxVertsPerSpline];
  if (v4 >= 0) {
    int v5 = v4;
  }
  else {
    int v5 = v4 + 1;
  }
  signed int v6 = vcvtpd_s64_f64((double)(unint64_t)(2 * (int)((2 * v5) & 0xFFFFFFFC)) * 0.015625) << 6;
  *(_DWORD *)&self->_currentBufferIndex = v6;
  id v7 = objc_msgSend(objc_alloc((Class)NSMutableData), "initWithCapacity:", v6 * -[NTKPrideSplinesQuad numSplines](self, "numSplines"));
  if ([(NTKPrideSplinesQuad *)self numSplines] >= 1)
  {
    uint64_t v8 = 0;
    double v9 = (double)v3;
    unint64_t v10 = v6;
    do
    {
      id v11 = objc_alloc_init((Class)NSMutableData);
      int v12 = [(NTKPrideSplinesQuad *)self numVertsForSpline:v8];
      [(NTKPrideSplinesQuad *)self interpolationStepSizeForSpline:v8];
      if (v12 >= 0) {
        int v14 = v12;
      }
      else {
        int v14 = v12 + 1;
      }
      if (v12 >= 2)
      {
        float v15 = v13;
        int v16 = 0;
        int v17 = v14 >> 1;
        do
        {
          float v18 = fmod((float)(v15 * (float)v16), v9);
          unsigned int v19 = v18;
          float v20 = v18 - (float)(unsigned __int16)v18;
          v22[0] = v19;
          v22[1] = (int)(v20 * 65535.0);
          v22[2] = (int)((float)(v20 * v20) * 65535.0);
          v22[3] = (int)((float)(v20 * (float)(v20 * v20)) * 65535.0);
          [v11 appendBytes:v22 length:8];
          ++v16;
        }
        while (v17 != v16);
      }
      while ((unint64_t)[v11 length] < v10)
      {
        LOBYTE(v22[0]) = 0;
        [v11 appendBytes:v22 length:1];
      }
      [v7 appendData:v11];

      uint64_t v8 = (v8 + 1);
    }
    while ((int)v8 < [(NTKPrideSplinesQuad *)self numSplines]);
  }

  return v7;
}

- (void)loadMetalTexturesAndBuffersWithDevice:(id)a3
{
  id v4 = a3;
  for (uint64_t i = 0; i != 24; i += 8)
  {
    id v6 = [v4 newBufferWithLength:2688 options:0];
    id v7 = *(void **)(&self->_controlPointsNeedUpdate + i);
    *(void *)(&self->_controlPointsNeedUpdate + i) = v6;
  }
  int v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  float v18 = sub_5C90;
  unsigned int v19 = &unk_24608;
  float v20 = self;
  id v21 = v4;
  id v8 = v4;
  uint64_t v9 = +[NTKPromise promiseNamed:@"Pride Textures" withBlock:&v16];
  unint64_t v10 = *(void **)&self->_mtlSamplePositionBufferWidth;
  *(void *)&self->_mtlSamplePositionBufferWidth = v9;

  unsigned int v11 = vcvtpd_s64_f64((double)(unint64_t)(16* [(NTKPrideSplinesQuad *)self numControlPointsPerSpline])* 0.015625) << 6;
  HIDWORD(self->_mtlGeneratedTextures) = v11;
  id v12 = objc_msgSend(v8, "newBufferWithLength:options:", (int)(v11 * -[NTKPrideSplinesQuad numSplines](self, "numSplines")), 1);
  float v13 = *(void **)(&self->_mtlComputeBufferWidth + 1);
  *(void *)(&self->_mtlComputeBufferWidth + 1) = v12;

  int v14 = (MTLBuffer *)objc_msgSend(v8, "newBufferWithLength:options:", (int)(-[NTKPrideSplinesQuad numSplines](self, "numSplines") * v11), 32);
  float v15 = *(MTLBuffer **)((char *)&self->_mtlComputeInputBuffer + 4);
  *(MTLBuffer **)((char *)&self->_mtlComputeInputBuffer + 4) = v14;
}

- (id)fragmentShaderName
{
  return @"pride_fragment_shader";
}

- (id)computeShaderName
{
  return @"compute_cubic_coefficients";
}

- (void)computeWithEncoder:(id)a3 pipelineState:(id)a4
{
  id v7 = *(id *)(&self->_mtlComputeBufferWidth + 1);
  id v8 = a4;
  id v9 = a3;
  [v9 setBuffer:v7 offset:0 atIndex:0];
  [v9 setBuffer:*(MTLBuffer **)((char *)&self->_mtlComputeInputBuffer + 4) offset:0 atIndex:1];

  unsigned int v15 = [(NTKPrideSplinesQuad *)self numControlPointsPerSpline];
  [v9 setBytes:&v15 length:4 atIndex:2];
  unsigned int v14 = [(NTKPrideSplinesQuad *)self numSplines];
  [v9 setBytes:&v14 length:4 atIndex:3];
  unint64_t v10 = (unint64_t)[v8 threadExecutionWidth];
  unint64_t v11 = (unint64_t)[v8 maxTotalThreadsPerThreadgroup];

  v13[0] = (v10 + [(NTKPrideSplinesQuad *)self numControlPointsPerSpline] - 1) / v10;
  v13[1] = (v11 / v10 + [(NTKPrideSplinesQuad *)self numSplines] - 1) / (v11 / v10);
  v13[2] = 1;
  v12[0] = v10;
  v12[1] = v11 / v10;
  v12[2] = 1;
  [v9 dispatchThreadgroups:v13 threadsPerThreadgroup:v12];
}

- (void)renderWithEncoder:(id)a3
{
  id v4 = a3;
  id v5 = *(id *)(&self->_mtlComputeBufferWidth + 1);
  id v6 = [(NTKPrideSplinesQuad *)self currentSplinesBuffer];
  id v7 = [*(id *)&self->_mtlSamplePositionBufferWidth object];
  id v8 = [v7 objectAtIndexedSubscript:0];
  [v4 setVertexTexture:v8 atIndex:1];

  [v4 setVertexBuffer:*(MTLBuffer **)((char *)&self->_mtlComputeInputBuffer + 4) offset:0 atIndex:3];
  [v4 setVertexBuffer:v5 offset:0 atIndex:2];
  id v9 = [*(id *)&self->_mtlSamplePositionBufferWidth object];
  unint64_t v10 = [v9 objectAtIndexedSubscript:1];
  [v4 setVertexTexture:v10 atIndex:4];

  unsigned int v15 = [(NTKPrideSplinesQuad *)self numControlPointsPerSpline];
  [v4 setVertexBytes:&v15 length:4 atIndex:8];
  [(NTKPrideSplinesQuad *)self vignetteAmount];
  int v14 = v11;
  [v4 setVertexBytes:&v14 length:4 atIndex:5];
  [v4 setVertexBytes:(char *)&self->_mtlComputeOutputBuffer + 4 length:8 atIndex:6];
  [v4 setVertexBuffer:v6 offset:0 atIndex:0];
  if ([(NTKPrideSplinesQuad *)self numSplinesToDraw] >= 1)
  {
    uint64_t v12 = 0;
    do
    {
      unsigned int v13 = 0;
      unsigned int v13 = [(NTKPrideSplinesQuad *)self splineDrawOrder:v12];
      [v4 setVertexBytes:&v13 length:4 atIndex:7];
      objc_msgSend(v4, "drawPrimitives:vertexStart:vertexCount:", 4, 0, -[NTKPrideSplinesQuad numVertsForSpline:](self, "numVertsForSpline:", v13));
      uint64_t v12 = (v12 + 1);
    }
    while ((int)v12 < [(NTKPrideSplinesQuad *)self numSplinesToDraw]);
  }
}

- (float)combinedAmplitudeForControlPointAtPosition:(float)a3 currentTime:(float)a4 waveSpeed:
{
  uint64_t v11 = 0;
  uint64_t v12 = (float *)&v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  id v5 = *(void **)(&self->super._timeScale + 1);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_63D4;
  v8[3] = &unk_24630;
  v8[5] = *(void *)&a3;
  float v9 = a4;
  int v10 = v4;
  v8[4] = &v11;
  [v5 iterateTouchesWithBlock:v8];
  float v6 = v12[6];
  _Block_object_dispose(&v11, 8);
  return v6;
}

- (BOOL)postSemaphoreComputeForTime:(double)a3
{
  WORD2(self->_mtlSplinesBuffers[2]) = WORD2(self->_mtlSplinesBuffers[2])
                                     + 1
                                     - 3
                                     * ((1431655766
                                       * (unint64_t)(WORD2(self->_mtlSplinesBuffers[2]) + 1)) >> 32);
  id v4 = [(NTKPrideSplinesQuad *)self currentSplinesBuffer];
  [v4 contents];

  id v5 = [(NTKPrideSplinesQuad *)self currentComputeBuffer];
  float v6 = [(NTKPrideSplinesQuad *)self getNTKPrideSplineDefinitionFiller];
  [(NTKPrideSplinesQuad *)self numSplines];
  int v10 = v5;
  id v7 = v6;
  id v8 = v5;
  NTKHighPriorityApply();

  return 1;
}

- (BOOL)forceRender
{
  char v3 = 1;
  BYTE5(self->_touchCrownHandler) = 1;
  id v4 = dispatch_group_create();
  id v5 = [(NTKPrideSplinesQuad *)self quadView];
  unsigned __int8 v6 = [v5 renderSynchronouslyWithImageQueueDiscard:0 inGroup:v4 completion:0];

  if ((v6 & 1) == 0)
  {
    unsigned int v7 = 0;
    do
    {
      unsigned int v8 = v7;
      if (v7 == 9) {
        break;
      }
      float v9 = [(NTKPrideSplinesQuad *)self quadView];
      unsigned int v10 = [v9 renderSynchronouslyWithImageQueueDiscard:0 inGroup:v4 completion:0];

      unsigned int v7 = v8 + 1;
    }
    while (!v10);
    char v3 = v8 < 9;
  }
  dispatch_group_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  BYTE5(self->_touchCrownHandler) = 0;

  return v3;
}

- (id)snapshot
{
  char v3 = +[CLKDevice currentDevice];
  [v3 screenScale];
  id v4 = -[NTKPrideSplinesQuad snapshotWithScale:](self, "snapshotWithScale:");

  return v4;
}

- (id)snapshotWithScale:(double)a3
{
  id v5 = [(NTKPrideSplinesQuad *)self quadView];
  [v5 frame];
  unsigned int v8 = -[NTKPrideSplinesQuad snapshotWithSize:scale:apl:](self, "snapshotWithSize:scale:apl:", 0, v6, v7, a3);

  return v8;
}

- (id)snapshotWithSize:(CGSize)a3 scale:(double)a4 apl:(float *)a5
{
  if (a5)
  {
    double v6 = [(NTKPrideSplinesQuad *)self quadView];
    id v15 = 0;
    [v6 computeAPLAndSnapshot:&v15];
    int v8 = v7;
    id v9 = v15;
    *(_DWORD *)a5 = v8;
  }
  else
  {
    double height = a3.height;
    double width = a3.width;
    uint64_t v13 = [(NTKPrideSplinesQuad *)self quadView];
    objc_msgSend(v13, "snapshotInRect:scale:time:", 0.0, 0.0, width, height, a4, CACurrentMediaTime());
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (BOOL)shouldForceRender
{
  if (BYTE5(self->_touchCrownHandler)) {
    return 1;
  }
  char v3 = [(NTKPrideSplinesQuad *)self quadView];
  unsigned __int8 v4 = [v3 isSnapshotting];

  return v4;
}

- (void)forceRenderOnce
{
  BYTE6(self->_touchCrownHandler) = 1;
}

- (void)startWavesAtNextRender
{
  HIBYTE(self->_touchCrownHandler) = 1;
}

- (void)setControlPointsNeedUpdate
{
  self->_paused = 1;
}

- (void)setFadeMultiplier:(float)a3
{
  *(float *)&self->_enableRecording = a3;
  [(NTKPrideSplinesQuad *)self forceRenderOnce];
}

- (void)setAmplitudeMultiplier:(float)a3
{
  self->_fadeMultiplier = a3;
  [(NTKPrideSplinesQuad *)self forceRenderOnce];
}

- (BOOL)preSemaphoreComputeForTime:(double)a3
{
  if (*(float *)&self->_enableRecording != 0.0 || BYTE6(self->_touchCrownHandler) || BYTE5(self->_touchCrownHandler))
  {
    long long v12 = *(_OWORD *)&a3;
    if (HIBYTE(self->_touchCrownHandler))
    {
      HIBYTE(self->_touchCrownHandler) = 0;
      -[NTKPrideSplinesQuad startWavesAtTime:](self, "startWavesAtTime:");
    }
    BOOL paused = self->_paused;
    self->_BOOL paused = 0;
    [(NTKPrideSplinesQuad *)self globalAmplitudeForTime:v12];
    [(NTKPrideSplinesQuad *)self numSplines];
    NTKHighPriorityApply();
    id v5 = [(NTKPrideSplinesQuad *)self touchCrownHandler];
    LODWORD(v6) = 1064682127;
    [v5 fadeStrumByAmount:v6];

    if ([(NTKPrideSplinesQuad *)self shouldForceRender] || BYTE6(self->_touchCrownHandler) | paused)
    {
      BYTE6(self->_touchCrownHandler) = 0;
LABEL_9:
      [(NTKPrideSplinesQuad *)self noiseConfiguration];
      [(NTKPrideSplinesQuad *)self numSplines];
      NTKHighPriorityApply();
      return 1;
    }
    if ([(NTKPrideSplinesQuad *)self numSplines] >= 1)
    {
      uint64_t v8 = 0;
      while ([(NTKPrideSplinesQuad *)self numControlPointsPerSpline] < 1)
      {
LABEL_16:
        uint64_t v8 = (v8 + 1);
        int v11 = [(NTKPrideSplinesQuad *)self numSplines];
        BOOL result = 0;
        if ((int)v8 >= v11) {
          return result;
        }
      }
      uint64_t v9 = 0;
      while (1)
      {
        [(NTKPrideSplinesQuad *)self ampltiudeForControlPoint:v9 ofSpline:v8];
        if (v10 > 0.0) {
          goto LABEL_9;
        }
        uint64_t v9 = (v9 + 1);
        if ((int)v9 >= [(NTKPrideSplinesQuad *)self numControlPointsPerSpline]) {
          goto LABEL_16;
        }
      }
    }
  }
  return 0;
}

- (void)strumToOffset:(double)a3 withVelocity:(double)a4
{
  if (!BYTE4(self->_touchCrownHandler)) {
    [*(id *)(&self->super._timeScale + 1) strumToOffset:a3 withVelocity:a4];
  }
}

- (void)setPreviousCrownIndex:(int)a3
{
}

- (void)tapAtPoint:(CGPoint)a3 atTime:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  id v12 = [(NTKPrideSplinesQuad *)self quadView];
  [v12 bounds];
  double v9 = x / v8;
  *(float *)&double v9 = x / v8;
  double v11 = y / v10;
  *(float *)&double v11 = y / v10;
  [*(id *)(&self->super._timeScale + 1) startWaveAtX:v9 y:v11 atTime:a4];
}

- (void)handleSingleTap:(id)a3
{
  if (!BYTE4(self->_touchCrownHandler))
  {
    id v4 = a3;
    id v10 = [(NTKPrideSplinesQuad *)self quadView];
    [v4 locationInView:v10];
    double v6 = v5;
    double v8 = v7;

    [(NTKPrideMetalQuad *)self currentTime];
    -[NTKPrideSplinesQuad tapAtPoint:atTime:](self, "tapAtPoint:atTime:", v6, v8, v9);
  }
}

- (void)clearWaves
{
}

- (void)setIgnoresStrumAndTap:(BOOL)a3
{
  BYTE4(self->_touchCrownHandler) = a3;
}

- (NTKPrideTouchCrownHandler)touchCrownHandler
{
  return (NTKPrideTouchCrownHandler *)*(id *)(&self->super._timeScale + 1);
}

- (int)currentComputeBufferWidth
{
  return HIDWORD(self->_mtlGeneratedTextures);
}

- (MTLBuffer)currentComputeBuffer
{
  return (MTLBuffer *)*(id *)(&self->_mtlComputeBufferWidth + 1);
}

- (MTLBuffer)currentSplinesBuffer
{
  return (MTLBuffer *)objc_retainAutoreleaseReturnValue(*((id *)&self->_controlPointsNeedUpdate
                                                        + WORD2(self->_mtlSplinesBuffers[2])));
}

- (BOOL)enableRecording
{
  return BYTE4(self->_frameBufferSize.height);
}

- (float)fadeMultiplier
{
  return *(float *)&self->_enableRecording;
}

- (float)amplitudeMultiplier
{
  return self->_fadeMultiplier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_mtlComputeInputBuffer + 4), 0);
  objc_storeStrong((id *)(&self->_mtlComputeBufferWidth + 1), 0);
  objc_storeStrong((id *)&self->_mtlSamplePositionBufferWidth, 0);
  for (uint64_t i = 16; i != -8; i -= 8)
    objc_storeStrong((id *)(&self->_controlPointsNeedUpdate + i), 0);

  objc_storeStrong((id *)(&self->super._timeScale + 1), 0);
}

- (int)numSplines
{
  uint64_t v2 = sub_705C();
  sub_7040(v2);
  return -1;
}

- (int)numControlPointsPerSpline
{
  uint64_t v2 = sub_705C();
  sub_7040(v2);
  return -1;
}

- (int)numVertsForSpline:(int)a3
{
  uint64_t v3 = sub_705C();
  sub_7040(v3);
  return -1;
}

- (float)interpolationStepSizeForSpline:(int)a3
{
  uint64_t v3 = sub_705C();
  sub_7040(v3);
  return 0.0;
}

- (float)computeAmplitudeForControlPoint:(int)a3 inSpline:(int)a4 atTime:(double)a5
{
  uint64_t v5 = sub_705C();
  sub_7040(v5);
  return 0.0;
}

- (float)globalAmplitudeForTime:(double)a3
{
  uint64_t v3 = sub_705C();
  sub_7040(v3);
  return 0.0;
}

- (void)startWavesAtTime:(double)a3
{
  sub_705C();
  uint64_t v3 = sub_7074();

  _NSRequestConcreteImplementation(v3, v4, v5);
}

- (void)generateControlPointsForSpline:(int)a3
{
  sub_705C();
  uint64_t v3 = sub_7074();

  _NSRequestConcreteImplementation(v3, v4, v5);
}

- (void)setAmplitude:(float)a3 forControlPoint:(int)a4 ofSpline:(int)a5
{
  sub_705C();
  uint64_t v5 = sub_7074();

  _NSRequestConcreteImplementation(v5, v6, v7);
}

- (float)ampltiudeForControlPoint:(int)a3 ofSpline:(int)a4
{
  uint64_t v4 = sub_705C();
  sub_7040(v4);
  return 0.0;
}

- (double)noiseSamplePositionForControlPoint:inSpline:
{
  uint64_t v0 = sub_705C();
  sub_7040(v0);
  return 0.0;
}

- (void)setNoise:(int)a3 forControlPoint:(int)a4 inSpline:
{
  sub_705C();
  uint64_t v4 = sub_7074();

  _NSRequestConcreteImplementation(v4, v5, v6);
}

- ($8EF4127CF77ECA3DDB612FCF233DC3A8)noiseConfiguration
{
  uint64_t v2 = sub_705C();
  sub_7040(v2);
  return 0;
}

- (id)getNTKPrideSplineDefinitionFiller
{
  uint64_t v2 = sub_705C();
  sub_7040(v2);
  return 0;
}

@end