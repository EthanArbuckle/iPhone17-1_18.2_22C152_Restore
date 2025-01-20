@interface VKPitchGenerator
+ (id)AXVectorKitBundle;
+ (id)defaultSoundFileURL;
+ (id)fourPitchesSoundFileArray;
+ (id)twoPitchesSoundFileArray;
- (NSArray)fourPitchesThresholdArray;
- (NSNumber)intercept;
- (NSNumber)maxPitch;
- (NSNumber)minPitch;
- (NSNumber)slope;
- (NSNumber)twoPitchesThreshold;
- (VKPitchGenerator)initWithFourPitchesThresholdArray:(id)a3;
- (VKPitchGenerator)initWithMinPitch:(id)a3 maxPitch:(id)a4 minDepth:(id)a5 maxDepth:(id)a6;
- (VKPitchGenerator)initWithPitchMode:(int64_t)a3 minDepth:(id)a4 maxDepth:(id)a5 minPtich:(id)a6 maxPitch:(id)a7 twoPitchesThreshold:(id)a8 fourPitchesThresholdArray:(id)a9;
- (VKPitchGenerator)initWithTwoPitchesThreshold:(id)a3;
- (float)pitchForDepth:(int)a3;
- (id)fileForDepthInUnit:(double)a3;
- (int64_t)pitchMode;
- (void)setFourPitchesThresholdArray:(id)a3;
- (void)setIntercept:(id)a3;
- (void)setMaxPitch:(id)a3;
- (void)setMinPitch:(id)a3;
- (void)setPitchMode:(int64_t)a3;
- (void)setSlope:(id)a3;
- (void)setTwoPitchesThreshold:(id)a3;
@end

@implementation VKPitchGenerator

+ (id)AXVectorKitBundle
{
  v2 = (void *)MEMORY[0x263F086E0];
  uint64_t v3 = objc_opt_class();

  return (id)[v2 bundleForClass:v3];
}

+ (id)defaultSoundFileURL
{
  v2 = +[VKPitchGenerator AXVectorKitBundle];
  uint64_t v3 = [v2 URLForResource:@"3beacon" withExtension:@"aiff"];

  return v3;
}

+ (id)fourPitchesSoundFileArray
{
  v12[4] = *MEMORY[0x263EF8340];
  v2 = +[VKPitchGenerator AXVectorKitBundle];
  uint64_t v3 = [v2 URLForResource:@"4beacon" withExtension:@"aiff"];

  v4 = +[VKPitchGenerator AXVectorKitBundle];
  v5 = [v4 URLForResource:@"3beacon" withExtension:@"aiff"];

  v6 = +[VKPitchGenerator AXVectorKitBundle];
  v7 = [v6 URLForResource:@"2beacon" withExtension:@"aiff"];

  v8 = +[VKPitchGenerator AXVectorKitBundle];
  v9 = [v8 URLForResource:@"1beacon" withExtension:@"aiff"];

  v12[0] = v3;
  v12[1] = v5;
  v12[2] = v7;
  v12[3] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:4];

  return v10;
}

+ (id)twoPitchesSoundFileArray
{
  v8[2] = *MEMORY[0x263EF8340];
  v2 = +[VKPitchGenerator AXVectorKitBundle];
  uint64_t v3 = [v2 URLForResource:@"4beacon" withExtension:@"aiff"];

  v4 = +[VKPitchGenerator AXVectorKitBundle];
  v5 = [v4 URLForResource:@"3beacon" withExtension:@"aiff"];

  v8[0] = v3;
  v8[1] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];

  return v6;
}

- (VKPitchGenerator)initWithPitchMode:(int64_t)a3 minDepth:(id)a4 maxDepth:(id)a5 minPtich:(id)a6 maxPitch:(id)a7 twoPitchesThreshold:(id)a8 fourPitchesThresholdArray:(id)a9
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v39 = a8;
  id v38 = a9;
  v40.receiver = self;
  v40.super_class = (Class)VKPitchGenerator;
  v19 = [(VKPitchGenerator *)&v40 init];
  v20 = v19;
  if (v19)
  {
    v19->_pitchMode = a3;
    objc_storeStrong((id *)&v19->_minPitch, a6);
    objc_storeStrong((id *)&v20->_maxPitch, a7);
    objc_storeStrong((id *)&v20->_twoPitchesThreshold, a8);
    objc_storeStrong((id *)&v20->_fourPitchesThresholdArray, a9);
    if (v16 && v15 && v17 && v18)
    {
      [v18 floatValue];
      float v22 = v21;
      [v17 floatValue];
      float v24 = v23;
      [v15 floatValue];
      float v26 = v25;
      [v16 floatValue];
      float v28 = (float)(v22 - v24) / (float)(v27 - v26);
      *(float *)&double v29 = v24 - (float)(v28 * v27);
      uint64_t v30 = [NSNumber numberWithFloat:v29];
      intercept = v20->_intercept;
      v20->_intercept = (NSNumber *)v30;

      *(float *)&double v32 = v28;
      uint64_t v33 = [NSNumber numberWithFloat:v32];
      slope = v20->_slope;
      v20->_slope = (NSNumber *)v33;
    }
    else
    {
      v35 = v20->_slope;
      v20->_slope = 0;

      slope = v20->_intercept;
      v20->_intercept = 0;
    }

    v36 = v20;
  }

  return v20;
}

- (VKPitchGenerator)initWithMinPitch:(id)a3 maxPitch:(id)a4 minDepth:(id)a5 maxDepth:(id)a6
{
  return [(VKPitchGenerator *)self initWithPitchMode:0 minDepth:a5 maxDepth:a6 minPtich:a3 maxPitch:a4 twoPitchesThreshold:0 fourPitchesThresholdArray:0];
}

- (VKPitchGenerator)initWithTwoPitchesThreshold:(id)a3
{
  return [(VKPitchGenerator *)self initWithPitchMode:1 minDepth:0 maxDepth:0 minPtich:0 maxPitch:0 twoPitchesThreshold:a3 fourPitchesThresholdArray:0];
}

- (VKPitchGenerator)initWithFourPitchesThresholdArray:(id)a3
{
  return [(VKPitchGenerator *)self initWithPitchMode:2 minDepth:0 maxDepth:0 minPtich:0 maxPitch:0 twoPitchesThreshold:0 fourPitchesThresholdArray:a3];
}

- (float)pitchForDepth:(int)a3
{
  if (self->_pitchMode) {
    return 1.0;
  }
  if (!self->_minPitch) {
    return 1.0;
  }
  maxPitch = self->_maxPitch;
  if (!maxPitch || !self->_slope || !self->_intercept) {
    return 1.0;
  }
  [(NSNumber *)maxPitch floatValue];
  float v8 = v7;
  [(NSNumber *)self->_minPitch floatValue];
  float v10 = v9;
  [(NSNumber *)self->_slope floatValue];
  float v12 = v11;
  float v13 = (float)a3;
  [(NSNumber *)self->_intercept floatValue];
  if (v10 <= (float)(v14 + (float)(v12 * (float)a3)))
  {
    [(NSNumber *)self->_slope floatValue];
    float v17 = v16;
    [(NSNumber *)self->_intercept floatValue];
    float v15 = v18 + (float)(v17 * v13);
  }
  else
  {
    [(NSNumber *)self->_minPitch floatValue];
  }
  if (v8 >= v15)
  {
    [(NSNumber *)self->_minPitch floatValue];
    float v21 = v20;
    [(NSNumber *)self->_slope floatValue];
    float v23 = v22;
    [(NSNumber *)self->_intercept floatValue];
    if (v21 <= (float)(v24 + (float)(v23 * v13)))
    {
      [(NSNumber *)self->_slope floatValue];
      float v26 = v25;
      [(NSNumber *)self->_intercept floatValue];
      return v27 + (float)(v26 * v13);
    }
    minPitch = self->_minPitch;
  }
  else
  {
    minPitch = self->_maxPitch;
  }

  [(NSNumber *)minPitch floatValue];
  return result;
}

- (id)fileForDepthInUnit:(double)a3
{
  id v4 = self;
  int64_t pitchMode = self->_pitchMode;
  switch(pitchMode)
  {
    case 2:
      fourPitchesThresholdArray = self->_fourPitchesThresholdArray;
      if (!fourPitchesThresholdArray) {
        goto LABEL_11;
      }
      float v7 = [(NSArray *)fourPitchesThresholdArray lastObject];
      [v7 doubleValue];
      double v9 = v8;

      if (v9 >= a3)
      {
        uint64_t v19 = 0;
        float v20 = &v19;
        uint64_t v21 = 0x3032000000;
        float v22 = __Block_byref_object_copy__4;
        float v23 = __Block_byref_object_dispose__4;
        id v24 = 0;
        float v16 = [v4 fourPitchesThresholdArray];
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __39__VKPitchGenerator_fileForDepthInUnit___block_invoke;
        v18[3] = &unk_265163088;
        *(double *)&v18[5] = a3;
        v18[4] = &v19;
        [v16 enumerateObjectsUsingBlock:v18];

        id v4 = (id)v20[5];
        _Block_object_dispose(&v19, 8);

        break;
      }
      float v10 = +[VKPitchGenerator fourPitchesSoundFileArray];
      float v11 = v10;
      goto LABEL_10;
    case 1:
      twoPitchesThreshold = self->_twoPitchesThreshold;
      if (!twoPitchesThreshold) {
        goto LABEL_11;
      }
      [(NSNumber *)twoPitchesThreshold doubleValue];
      double v14 = v13;
      float v10 = +[VKPitchGenerator twoPitchesSoundFileArray];
      float v11 = v10;
      if (v14 >= a3)
      {
        uint64_t v15 = [v10 firstObject];
        goto LABEL_13;
      }
LABEL_10:
      uint64_t v15 = [v10 lastObject];
LABEL_13:
      id v4 = (id)v15;

      break;
    case 0:
LABEL_11:
      id v4 = +[VKPitchGenerator defaultSoundFileURL];
      break;
  }

  return v4;
}

void __39__VKPitchGenerator_fileForDepthInUnit___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  double v7 = *(double *)(a1 + 40);
  [a2 doubleValue];
  if (v7 <= v8)
  {
    double v9 = +[VKPitchGenerator fourPitchesSoundFileArray];
    uint64_t v10 = [v9 objectAtIndexedSubscript:a3];
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    float v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    *a4 = 1;
  }
}

- (int64_t)pitchMode
{
  return self->_pitchMode;
}

- (void)setPitchMode:(int64_t)a3
{
  self->_int64_t pitchMode = a3;
}

- (NSNumber)minPitch
{
  return self->_minPitch;
}

- (void)setMinPitch:(id)a3
{
}

- (NSNumber)maxPitch
{
  return self->_maxPitch;
}

- (void)setMaxPitch:(id)a3
{
}

- (NSNumber)twoPitchesThreshold
{
  return self->_twoPitchesThreshold;
}

- (void)setTwoPitchesThreshold:(id)a3
{
}

- (NSArray)fourPitchesThresholdArray
{
  return self->_fourPitchesThresholdArray;
}

- (void)setFourPitchesThresholdArray:(id)a3
{
}

- (NSNumber)slope
{
  return self->_slope;
}

- (void)setSlope:(id)a3
{
}

- (NSNumber)intercept
{
  return self->_intercept;
}

- (void)setIntercept:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intercept, 0);
  objc_storeStrong((id *)&self->_slope, 0);
  objc_storeStrong((id *)&self->_fourPitchesThresholdArray, 0);
  objc_storeStrong((id *)&self->_twoPitchesThreshold, 0);
  objc_storeStrong((id *)&self->_maxPitch, 0);

  objc_storeStrong((id *)&self->_minPitch, 0);
}

@end