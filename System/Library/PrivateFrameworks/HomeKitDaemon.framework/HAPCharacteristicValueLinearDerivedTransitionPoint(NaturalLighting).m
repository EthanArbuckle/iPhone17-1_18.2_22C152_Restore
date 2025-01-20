@interface HAPCharacteristicValueLinearDerivedTransitionPoint(NaturalLighting)
+ (id)transitionPointWithMinimumBrightness:()NaturalLighting minimumBrightnessColorTemperature:maximumBrightness:maximumBrightnessColorTemperature:targetCompletionDuration:;
+ (uint64_t)transitionPointWithPreviousTransitionPoint:()NaturalLighting nextTransitionPoint:timeElapsedSincePreviousTransitionPoint:minimumBrightness:maximumBrightness:;
- (unint64_t)colorTemperatureForBrightness:()NaturalLighting;
@end

@implementation HAPCharacteristicValueLinearDerivedTransitionPoint(NaturalLighting)

- (unint64_t)colorTemperatureForBrightness:()NaturalLighting
{
  v5 = [a1 scale];
  v6 = [v5 value];
  [v6 floatValue];
  float v8 = v7;
  float v9 = (float)a3;
  v10 = [a1 offset];
  v11 = [v10 value];
  [v11 floatValue];
  unint64_t v13 = llroundf(v12 + (float)(v8 * v9));

  return v13;
}

+ (uint64_t)transitionPointWithPreviousTransitionPoint:()NaturalLighting nextTransitionPoint:timeElapsedSincePreviousTransitionPoint:minimumBrightness:maximumBrightness:
{
  id v11 = a4;
  id v12 = a3;
  unint64_t v13 = [v12 scale];
  v14 = [v13 value];
  [v14 floatValue];
  float v16 = v15;
  v17 = [v12 offset];
  v18 = [v17 value];
  [v18 floatValue];
  float v20 = v19 + (float)(v16 * (float)a6);

  v21 = [v12 scale];
  v22 = [v21 value];
  [v22 floatValue];
  float v24 = v23;
  v25 = [v12 offset];

  v26 = [v25 value];
  [v26 floatValue];
  float v28 = v27 + (float)(v24 * (float)a7);

  v29 = [v11 scale];
  v30 = [v29 value];
  [v30 floatValue];
  float v32 = v31;
  v33 = [v11 offset];
  v34 = [v33 value];
  [v34 floatValue];
  float v36 = v35 + (float)(v32 * (float)a6);

  v37 = [v11 scale];
  v38 = [v37 value];
  [v38 floatValue];
  float v40 = v39;
  v41 = [v11 offset];
  v42 = [v41 value];
  [v42 floatValue];
  float v44 = v43 + (float)(v40 * (float)a7);

  v45 = [v11 targetCompletionDuration];

  v46 = [v45 value];
  unint64_t v47 = [v46 unsignedLongLongValue];

  v48 = (void *)MEMORY[0x263F358F8];
  return [v48 transitionPointWithMinimumBrightness:a6 minimumBrightnessColorTemperature:(uint64_t)(float)(v20 + (float)((float)((float)(v36 - v20) / (float)v47) * (float)a5)) maximumBrightness:a7 maximumBrightnessColorTemperature:(uint64_t)(float)(v28 + (float)((float)((float)(v44 - v28) / (float)v47) * (float)a5)) targetCompletionDuration:0];
}

+ (id)transitionPointWithMinimumBrightness:()NaturalLighting minimumBrightnessColorTemperature:maximumBrightness:maximumBrightnessColorTemperature:targetCompletionDuration:
{
  if (a5 <= a3)
  {
    float v23 = (HMDCameraRecordingManagerDependencyFactory *)_HMFPreconditionFailure();
    return [(HMDCameraRecordingManagerDependencyFactory *)v23 createRecordingSessionRetryContextWithWorkQueue:v25];
  }
  else
  {
    float v8 = (float)(a6 - a4) / (float)(a5 - a3);
    float v9 = (float)a4 - (float)(v8 * (float)a3);
    id v10 = objc_alloc(MEMORY[0x263F35AE0]);
    *(float *)&double v11 = v8;
    id v12 = [NSNumber numberWithFloat:v11];
    unint64_t v13 = (void *)[v10 initWithValue:v12];

    id v14 = objc_alloc(MEMORY[0x263F35AE0]);
    *(float *)&double v15 = v9;
    float v16 = [NSNumber numberWithFloat:v15];
    v17 = (void *)[v14 initWithValue:v16];

    id v18 = objc_alloc(MEMORY[0x263F35AF0]);
    float v19 = [NSNumber numberWithUnsignedLongLong:a7];
    float v20 = (void *)[v18 initWithValue:v19];

    v21 = (void *)[objc_alloc(MEMORY[0x263F358F8]) initWithScale:v13 offset:v17 targetCompletionDuration:v20 startDelayDuration:0];
    return v21;
  }
}

@end