@interface NSDictionary(HKWorkoutEventMetadata)
- (BOOL)_hk_validateBaseMetadataValueForWorkoutEvent:()HKWorkoutEventMetadata valueContent:key:error:;
- (BOOL)_hk_validateYukonMetadataValueForWorkoutEvent:()HKWorkoutEventMetadata valueContent:key:error:;
- (BOOL)hk_validateMetadataKeysAndValuesForWorkoutEvent:()HKWorkoutEventMetadata applicationSDKVersionToken:error:;
- (uint64_t)_hk_validateMetadataValueForWorkoutEvent:()HKWorkoutEventMetadata valueContent:forKey:applicationSDKVersionToken:error:;
@end

@implementation NSDictionary(HKWorkoutEventMetadata)

- (BOOL)hk_validateMetadataKeysAndValuesForWorkoutEvent:()HKWorkoutEventMetadata applicationSDKVersionToken:error:
{
  id v9 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__30;
  v23 = __Block_byref_object_dispose__30;
  id v24 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __121__NSDictionary_HKWorkoutEventMetadata__hk_validateMetadataKeysAndValuesForWorkoutEvent_applicationSDKVersionToken_error___block_invoke;
  v14[3] = &unk_1E58C4910;
  v16 = &v19;
  uint64_t v17 = a2;
  v14[4] = a1;
  id v10 = v9;
  id v15 = v10;
  uint64_t v18 = a4;
  [a1 enumerateKeysAndObjectsUsingBlock:v14];
  id v11 = (id)v20[5];
  v12 = v11;
  if (v11)
  {
    if (a5) {
      *a5 = v11;
    }
    else {
      _HKLogDroppedError(v11);
    }
  }

  _Block_object_dispose(&v19, 8);
  return v12 == 0;
}

- (BOOL)_hk_validateBaseMetadataValueForWorkoutEvent:()HKWorkoutEventMetadata valueContent:key:error:
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (![@"HKSwimmingStrokeStyle" isEqualToString:v11])
  {
    BOOL v13 = 1;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = (void *)MEMORY[0x1E4F28C58];
    id v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    uint64_t v17 = (objc_class *)objc_opt_class();
    uint64_t v18 = NSStringFromClass(v17);
    objc_msgSend(v14, "hk_assignError:code:format:", a6, 3, @"Invalid class %@ for metadata key: %@. Expected %@.", v16, v11, v18);

LABEL_8:
    BOOL v13 = 0;
    goto LABEL_9;
  }
  uint64_t v12 = [v9 type];
  if (v12 != 3)
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    v20 = _HKWorkoutEventTypeName(v12);
    objc_msgSend(v19, "hk_assignError:code:format:", a6, 3, @"Invalid metadata key %@ for %@", @"HKSwimmingStrokeStyle", v20);

    goto LABEL_8;
  }
  BOOL v13 = +[HKMetadataValidationUtilities hk_validateSwimmingStrokeStyleMetadataValue:v10 error:a6];
LABEL_9:

  return v13;
}

- (BOOL)_hk_validateYukonMetadataValueForWorkoutEvent:()HKWorkoutEventMetadata valueContent:key:error:
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (_hk_validateYukonMetadataValueForWorkoutEvent_valueContent_key_error__onceToken != -1) {
    dispatch_once(&_hk_validateYukonMetadataValueForWorkoutEvent_valueContent_key_error__onceToken, &__block_literal_global_72);
  }
  if (+[HKMetadataValidationUtilities hk_validateMetadataValueClass:v10 forKey:v11 expectedClassLookupTable:_hk_validateYukonMetadataValueForWorkoutEvent_valueContent_key_error__supportedWorkoutKeyLookupTableYukon error:a6])
  {
    uint64_t v12 = @"HKElevationAscended";
    if ([@"HKElevationAscended" isEqualToString:v11]
      || (uint64_t v12 = @"HKElevationDescended",
          [@"HKElevationDescended" isEqualToString:v11]))
    {
      uint64_t v13 = [v9 type];
      id v14 = v10;
      if (HKValidateWorkoutEventTypeSegment(v13, v12, a6))
      {
        id v15 = +[HKUnit meterUnit];
        BOOL v16 = +[HKMetadataValidationUtilities hk_validateQuantityMetadataValue:v12 value:v14 compatibleUnit:v15 error:a6];
      }
      else
      {
        BOOL v16 = 0;
      }
    }
    else if ([@"HKAverageSpeed" isEqualToString:v11] {
           || [@"HKMaximumSpeed" isEqualToString:v11])
    }
    {
      uint64_t v18 = [v9 type];
      id v19 = v10;
      if (HKValidateWorkoutEventTypeSegment(v18, @"HKAverageSpeed", a6))
      {
        v20 = +[HKUnit unitFromString:@"m/s"];
        BOOL v16 = +[HKMetadataValidationUtilities hk_validateQuantityMetadataValue:@"HKAverageSpeed" value:v19 compatibleUnit:v20 error:a6];
      }
      else
      {
        BOOL v16 = 0;
      }
    }
    else if ([@"HKAlpineSlopeGrade" isEqualToString:v11])
    {
      BOOL v16 = HKWorkoutEventValidateAlpineSlopeGradeMetadata([v9 type], v10, a6);
    }
    else
    {
      BOOL v16 = 1;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (uint64_t)_hk_validateMetadataValueForWorkoutEvent:()HKWorkoutEventMetadata valueContent:forKey:applicationSDKVersionToken:error:
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (objc_msgSend(a1, "_hk_validateBaseMetadataValueForWorkoutEvent:valueContent:key:error:", v11, v12, v13, a7))
  {
    if (HKProgramSDKTokenAtLeast()) {
      uint64_t v14 = objc_msgSend(a1, "_hk_validateYukonMetadataValueForWorkoutEvent:valueContent:key:error:", v11, v12, v13, a7);
    }
    else {
      uint64_t v14 = 1;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

@end