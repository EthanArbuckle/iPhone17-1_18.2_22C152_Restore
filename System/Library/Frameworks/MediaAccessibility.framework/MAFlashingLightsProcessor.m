@interface MAFlashingLightsProcessor
- (BOOL)canProcessSurface:(IOSurfaceRef)surface;
- (MAFlashingLightsProcessor)init;
- (MAFlashingLightsProcessorResult)processSurface:(IOSurfaceRef)inSurface outSurface:(IOSurfaceRef)outSurface timestamp:(CFAbsoluteTime)timestamp options:(NSDictionary *)options;
- (PSEVideoProcessor)pse;
- (void)setPse:(id)a3;
@end

@implementation MAFlashingLightsProcessor

- (MAFlashingLightsProcessor)init
{
  v7.receiver = self;
  v7.super_class = (Class)MAFlashingLightsProcessor;
  v2 = [(MAFlashingLightsProcessor *)&v7 init];
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2050000000;
  v3 = (void *)getPSEVideoProcessorClass_softClass;
  uint64_t v12 = getPSEVideoProcessorClass_softClass;
  if (!getPSEVideoProcessorClass_softClass)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __getPSEVideoProcessorClass_block_invoke;
    v8[3] = &unk_1E6223850;
    v8[4] = &v9;
    __getPSEVideoProcessorClass_block_invoke((uint64_t)v8);
    v3 = (void *)v10[3];
  }
  v4 = v3;
  _Block_object_dispose(&v9, 8);
  id v5 = objc_alloc_init(v4);
  [(MAFlashingLightsProcessor *)v2 setPse:v5];

  return v2;
}

- (BOOL)canProcessSurface:(IOSurfaceRef)surface
{
  v4 = [(MAFlashingLightsProcessor *)self pse];
  LOBYTE(surface) = [v4 canProcessSurface:surface];

  return (char)surface;
}

- (MAFlashingLightsProcessorResult)processSurface:(IOSurfaceRef)inSurface outSurface:(IOSurfaceRef)outSurface timestamp:(CFAbsoluteTime)timestamp options:(NSDictionary *)options
{
  v10 = options;
  uint64_t v11 = [(MAFlashingLightsProcessor *)self pse];
  char v12 = [v11 canProcessSurface:inSurface];

  if (v12)
  {
    uint64_t v25 = 0;
    v26 = (double *)&v25;
    uint64_t v27 = 0x2020000000;
    uint64_t v28 = 0;
    uint64_t v21 = 0;
    v22 = (double *)&v21;
    uint64_t v23 = 0x2020000000;
    uint64_t v24 = 0;
    v13 = [(MAFlashingLightsProcessor *)self pse];
    [v13 setValidationCallback:&v20];

    v14 = (void *)[(NSDictionary *)v10 mutableCopy];
    if (!v14)
    {
      v14 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    [v14 setObject:&unk_1F1427198 forKeyedSubscript:@"sourceSurfaceEDR"];
    [v14 setObject:&unk_1F1427198 forKeyedSubscript:@"displayEDRFactor"];
    [v14 setObject:&unk_1F14271A8 forKeyedSubscript:@"displayMaxNits"];
    v15 = [(MAFlashingLightsProcessor *)self pse];
    [v15 processSourceSurface:inSurface withTimestamp:outSurface toDestinationSurface:v14 options:timestamp];

    v16 = objc_opt_new();
    [v16 setSurfaceProcessed:1];
    double v17 = v26[3];
    *(float *)&double v17 = v17;
    [v16 setIntensityLevel:v17];
    double v18 = v22[3];
    *(float *)&double v18 = v18;
    [v16 setMitigationLevel:v18];

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v25, 8);
  }
  else
  {
    v16 = objc_opt_new();
  }

  return (MAFlashingLightsProcessorResult *)v16;
}

uint64_t __73__MAFlashingLightsProcessor_processSurface_outSurface_timestamp_options___block_invoke(uint64_t result, double a2, double a3, double a4)
{
  *(double *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a3;
  *(double *)(*(void *)(*(void *)(result + 40) + 8) + 24) = a4;
  return result;
}

- (PSEVideoProcessor)pse
{
  return self->pse;
}

- (void)setPse:(id)a3
{
}

- (void).cxx_destruct
{
}

@end