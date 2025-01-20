@interface HAPCharacteristicValueTransition(NaturalLighting)
+ (BOOL)canCoalesceTransitionPoint1:()NaturalLighting transitionPoint2:ofCurve:;
+ (id)naturalLightingValueTransitionWithLightProfile:()NaturalLighting naturalLightingEnabled:startDate:dataSource:;
+ (id)transitionPointsByCoalescingTransitionPoints:()NaturalLighting ofCurve:;
+ (uint64_t)updateTransition:()NaturalLighting withCurve:brightnessCharacteristic:millisecondsElapsedSinceStartOfDay:transitionStartTimeInMilliseconds:;
- (HMDNaturalLightingActiveTransitionContext)naturalLightingActiveTransitionContextForCharacteristic:()NaturalLighting;
- (id)naturalLightingActiveTransitionContextLightProfile:()NaturalLighting;
@end

@implementation HAPCharacteristicValueTransition(NaturalLighting)

- (id)naturalLightingActiveTransitionContextLightProfile:()NaturalLighting
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 service];
  uint64_t v6 = *MEMORY[0x1E4F2CE78];
  v7 = [v5 findCharacteristicWithType:*MEMORY[0x1E4F2CE78]];
  if (v7)
  {
    v8 = [a1 naturalLightingActiveTransitionContextForCharacteristic:v7];
  }
  else
  {
    v9 = (void *)MEMORY[0x1D9452090]();
    id v10 = a1;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      int v14 = 138543874;
      v15 = v12;
      __int16 v16 = 2112;
      v17 = v5;
      __int16 v18 = 2112;
      uint64_t v19 = v6;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_ERROR, "%{public}@Service doesn't support Color Temperature Characteristic %@:%@", (uint8_t *)&v14, 0x20u);
    }
    v8 = 0;
  }

  return v8;
}

- (HMDNaturalLightingActiveTransitionContext)naturalLightingActiveTransitionContextForCharacteristic:()NaturalLighting
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 controllerContext];
  if (v5
    || ([a1 endBehavior], (v5 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([a1 linearTransition], (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    v26 = [a1 linearDerivedTransition];

    if (!v26) {
      goto LABEL_20;
    }
  }
  uint64_t v6 = [a1 linearDerivedTransition];
  v7 = [v6 transitionPoints];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    v9 = [a1 controllerContext];
    id v28 = 0;
    id v10 = [MEMORY[0x1E4F5BCB8] parsedFromData:v9 error:&v28];
    id v11 = v28;
    if (!v10)
    {
      uint64_t v20 = (void *)MEMORY[0x1D9452090]();
      v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v30 = v22;
        __int16 v31 = 2112;
        v32 = v9;
        __int16 v33 = 2112;
        id v34 = v11;
        _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode controller context %@:%@", buf, 0x20u);
      }
      uint64_t v19 = 0;
      goto LABEL_18;
    }
    v12 = [v10 startTime];
    v13 = [v12 value];

    if (v13)
    {
      if ([v10 isNaturalLightingEnabled])
      {
        int v14 = (void *)MEMORY[0x1E4F1C9C8];
        [v13 doubleValue];
        __int16 v16 = [v14 dateWithTimeIntervalSinceReferenceDate:v15 / 1000.0];
        v17 = [v10 transitionChecksum];
        __int16 v18 = [v17 value];

        uint64_t v19 = [[HMDNaturalLightingActiveTransitionContext alloc] initWithStartDate:v16 millisecondsElapsedSinceStartDate:0 transitionChecksum:v18];
LABEL_17:

LABEL_18:
        goto LABEL_21;
      }
    }
    else
    {
      v23 = (void *)MEMORY[0x1D9452090]();
      v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v30 = v25;
        __int16 v31 = 2112;
        v32 = v10;
        _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@Start time missing in the controller context %@", buf, 0x16u);
      }
    }
    uint64_t v19 = 0;
    goto LABEL_17;
  }
LABEL_20:
  uint64_t v19 = 0;
LABEL_21:

  return v19;
}

+ (BOOL)canCoalesceTransitionPoint1:()NaturalLighting transitionPoint2:ofCurve:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = objc_msgSend(v7, "colorTemperatureForBrightness:", objc_msgSend(v9, "minimumBrightness"));
  if (v10 == objc_msgSend(v8, "colorTemperatureForBrightness:", objc_msgSend(v9, "minimumBrightness")))
  {
    uint64_t v11 = objc_msgSend(v7, "colorTemperatureForBrightness:", objc_msgSend(v9, "maximumBrightness"));
    BOOL v12 = v11 == objc_msgSend(v8, "colorTemperatureForBrightness:", objc_msgSend(v9, "maximumBrightness"));
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

+ (uint64_t)updateTransition:()NaturalLighting withCurve:brightnessCharacteristic:millisecondsElapsedSinceStartOfDay:transitionStartTimeInMilliseconds:
{
  v77[2] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v66 = a5;
  uint64_t v13 = [objc_alloc(MEMORY[0x1E4F5BCC0]) initWithValue:1];
  id v14 = objc_alloc(MEMORY[0x1E4F5BE68]);
  double v15 = [NSNumber numberWithUnsignedLongLong:a7];
  uint64_t v16 = [v14 initWithValue:v15];

  v77[0] = 0;
  v77[1] = 0;
  v64 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"C4F33DA9-63C9-4C0F-8B89-6C36A33EEF9E"];
  [v64 getUUIDBytes:v77];
  uint64_t v17 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v77 length:16];
  id v18 = objc_alloc(MEMORY[0x1E4F5BCB8]);
  id v19 = objc_alloc(MEMORY[0x1E4F5BE68]);
  uint64_t v20 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v12, "checksum"));
  v21 = (void *)[v19 initWithValue:v20];
  v63 = (void *)v17;
  v65 = (void *)v16;
  v22 = (void *)[v18 initWithIdentifier:v17 startTime:v16 transitionChecksum:v21];

  id v68 = 0;
  v23 = [v22 serializeWithError:&v68];
  id v24 = v68;
  v25 = v24;
  if (v23)
  {
    v59 = v22;
    id v60 = v24;
    [v11 setControllerContext:v23];
    v61 = v11;
    [v11 setEndBehavior:v13];
    v26 = [v12 transitionPointsWithmillisecondsElapsedSinceStartOfDay:a6];
    int v27 = objc_msgSend(v26, "hmf_isEmpty");
    id v28 = (void *)v13;
    if (v27)
    {
      v29 = (void *)MEMORY[0x1D9452090]();
      id v30 = a1;
      __int16 v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        int v32 = v27;
        v34 = __int16 v33 = v28;
        *(_DWORD *)buf = 138543618;
        v70 = v34;
        __int16 v71 = 2112;
        uint64_t v72 = (uint64_t)v26;
        _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_ERROR, "%{public}@No transition points found: %@", buf, 0x16u);

        id v28 = v33;
        int v27 = v32;
      }

      id v11 = v61;
      uint64_t v35 = v66;
    }
    else
    {
      uint64_t v42 = a6;
      v58 = v28;
      v43 = [(id)objc_opt_class() transitionPointsByCoalescingTransitionPoints:v26 ofCurve:v12];

      v44 = (void *)MEMORY[0x1D9452090]();
      id v45 = a1;
      v46 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        v47 = HMFGetLogIdentifier();
        uint64_t v48 = [v43 count];
        v49 = [v43 firstObject];
        *(_DWORD *)buf = 138544130;
        v70 = v47;
        __int16 v71 = 2048;
        uint64_t v72 = v48;
        __int16 v73 = 2112;
        v74 = v49;
        __int16 v75 = 2048;
        uint64_t v76 = v42;
        _os_log_impl(&dword_1D49D5000, v46, OS_LOG_TYPE_INFO, "%{public}@Sending coalesced transition points to accessory, transition points count: %lu, start transition point: %@, time elapsed since start of the day: %llums", buf, 0x2Au);
      }
      *(_DWORD *)buf = [v12 minimumBrightness];
      v50 = [MEMORY[0x1E4F1C9B8] dataWithBytes:buf length:4];
      int v67 = [v12 maximumBrightness];
      v51 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v67 length:4];
      v52 = (void *)[objc_alloc(MEMORY[0x1E4F5BC98]) initWithLowerBound:v50 upperBound:v51];
      id v53 = objc_alloc(MEMORY[0x1E4F5BE68]);
      uint64_t v35 = v66;
      v54 = [v66 instanceID];
      v55 = (void *)[v53 initWithValue:v54];

      v56 = (void *)[objc_alloc(MEMORY[0x1E4F5BC88]) initWithTransitionPoints:v43 sourceHAPInstanceID:v55 sourceValueRange:v52];
      id v11 = v61;
      [v61 setLinearDerivedTransition:v56];

      v26 = v43;
      id v28 = v58;
      int v27 = 0;
    }
    v22 = v59;
    uint64_t v41 = v27 ^ 1u;

    v25 = v60;
  }
  else
  {
    id v28 = (void *)v13;
    v36 = (void *)MEMORY[0x1D9452090]();
    id v37 = a1;
    v38 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v40 = v39 = v25;
      *(_DWORD *)buf = 138543874;
      v70 = v40;
      __int16 v71 = 2112;
      uint64_t v72 = (uint64_t)v22;
      __int16 v73 = 2112;
      v74 = v39;
      _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_ERROR, "%{public}@Failed to serialize controller context %@:%@", buf, 0x20u);

      v25 = v39;
    }

    uint64_t v41 = 0;
    uint64_t v35 = v66;
  }

  return v41;
}

+ (id)transitionPointsByCoalescingTransitionPoints:()NaturalLighting ofCurve:
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v39 = a4;
  v40 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  if ([v5 count] == 1)
  {
    id v7 = 0;
    uint64_t v8 = 0;
    id v9 = 0;
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v8 = 0;
    id v11 = 0;
    unint64_t v12 = 0;
    *(void *)&long long v6 = 138544386;
    long long v36 = v6;
    id v37 = v5;
    do
    {
      id v9 = objc_msgSend(v5, "objectAtIndex:", v12, v36);
      if (v10 && [a1 canCoalesceTransitionPoint1:v9 transitionPoint2:v10 ofCurve:v39])
      {
        uint64_t v38 = v8;
        uint64_t v13 = [v9 targetCompletionDuration];
        id v14 = [v13 value];
        uint64_t v15 = [v14 unsignedLongLongValue];

        uint64_t v16 = (void *)MEMORY[0x1D9452090]();
        id v17 = a1;
        id v18 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          id v19 = HMFGetLogIdentifier();
          *(_DWORD *)buf = v36;
          v43 = v19;
          __int16 v44 = 2112;
          id v45 = v9;
          __int16 v46 = 2048;
          unint64_t v47 = v12 + 1;
          __int16 v48 = 2112;
          v49 = v10;
          __int16 v50 = 2048;
          unint64_t v51 = v12;
          _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Coalescing transition point: %@ at index: %lu with transition point: %@ at index: %lu", buf, 0x34u);

          id v5 = v37;
        }
        uint64_t v8 = v15 + v38;

        id v20 = v9;

        id v7 = v20;
      }
      else
      {
        id v21 = v9;
        v22 = v21;
        if (v11)
        {
          v23 = (void *)[v21 copy];

          id v24 = objc_alloc(MEMORY[0x1E4F5BE68]);
          v25 = [NSNumber numberWithUnsignedLongLong:v8];
          v26 = (void *)[v24 initWithValue:v25];
          [v23 setStartDelayDuration:v26];

          uint64_t v8 = 0;
          id v11 = v23;
        }
        else
        {
          id v11 = v21;
        }
        [v40 addObject:v11];
        id v27 = v22;

        id v7 = 0;
      }

      ++v12;
      uint64_t v10 = v9;
      id v11 = v7;
    }
    while (v12 < [v5 count] - 1);
  }
  id v28 = [v5 lastObject];
  v29 = v28;
  if (v7)
  {
    id v30 = (void *)[v28 copy];

    id v31 = objc_alloc(MEMORY[0x1E4F5BE68]);
    int v32 = [NSNumber numberWithUnsignedLongLong:v8];
    __int16 v33 = (void *)[v31 initWithValue:v32];
    [v30 setStartDelayDuration:v33];

    v29 = v30;
  }
  [v40 addObject:v29];
  id v34 = (void *)[v40 copy];

  return v34;
}

+ (id)naturalLightingValueTransitionWithLightProfile:()NaturalLighting naturalLightingEnabled:startDate:dataSource:
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [v10 accessory];
  id v14 = [v13 home];
  uint64_t v15 = [v14 naturalLightingContext];

  uint64_t v16 = [v15 timeZone];
  if (!v16)
  {
    uint64_t v42 = (void *)MEMORY[0x1D9452090]();
    id v43 = a1;
    __int16 v44 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      id v45 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v73 = v45;
      __int16 v74 = 2112;
      id v75 = v15;
      __int16 v46 = "%{public}@Time zone missing in natural lighting context: %@";
LABEL_20:
      _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_ERROR, v46, buf, 0x16u);
    }
LABEL_21:

    id v40 = 0;
    goto LABEL_38;
  }
  uint64_t v17 = [v11 timeIntervalSinceReferenceDate];
  uint64_t v19 = (uint64_t)(v18 * 1000.0);
  if (v19 <= 0)
  {
    uint64_t v42 = (void *)MEMORY[0x1D9452090](v17);
    id v43 = a1;
    __int16 v44 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      id v45 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v73 = v45;
      __int16 v74 = 2112;
      id v75 = v11;
      __int16 v46 = "%{public}@Date is initialized in the past: %@";
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  uint64_t v20 = [v12 millisecondsElapsedSinceStartOfDayWithDate:v11 timeZone:v16];
  __int16 v71 = [v10 naturalLightingCurve];
  if (!v71)
  {
    unint64_t v47 = (void *)MEMORY[0x1D9452090]();
    id v48 = a1;
    v49 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      __int16 v50 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      __int16 v73 = v50;
      __int16 v74 = 2112;
      id v75 = 0;
      __int16 v76 = 2112;
      id v77 = v10;
      _os_log_impl(&dword_1D49D5000, v49, OS_LOG_TYPE_ERROR, "%{public}@Natural lighting curve is not set on light profile %@:%@", buf, 0x20u);
    }
    id v40 = 0;
    id v30 = 0;
    goto LABEL_37;
  }
  id v69 = v11;
  id v21 = [v10 service];
  v22 = (void *)*MEMORY[0x1E4F2CE78];
  v70 = [v21 findCharacteristicWithType:*MEMORY[0x1E4F2CE78]];
  if (!v70)
  {
    unint64_t v51 = (void *)MEMORY[0x1D9452090]();
    id v52 = a1;
    id v53 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      v54 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      __int16 v73 = v54;
      __int16 v74 = 2112;
      id v75 = v21;
      __int16 v76 = 2112;
      id v77 = v22;
      _os_log_impl(&dword_1D49D5000, v53, OS_LOG_TYPE_ERROR, "%{public}@Service doesn't support Color Temperature Characteristic %@:%@", buf, 0x20u);
    }
    id v40 = 0;
    id v30 = v71;
    goto LABEL_36;
  }
  v23 = (void *)*MEMORY[0x1E4F2CE60];
  id v68 = v21;
  uint64_t v24 = [v21 findCharacteristicWithType:*MEMORY[0x1E4F2CE60]];
  int v67 = (void *)v24;
  if (!v24)
  {
    v55 = (void *)MEMORY[0x1D9452090]();
    id v56 = a1;
    v57 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      v58 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      __int16 v73 = v58;
      __int16 v74 = 2112;
      id v75 = v21;
      __int16 v76 = 2112;
      id v77 = v23;
      _os_log_impl(&dword_1D49D5000, v57, OS_LOG_TYPE_ERROR, "%{public}@Service doesn't support brightness Characteristic %@:%@", buf, 0x20u);
    }
    id v40 = 0;
    id v30 = v71;
    goto LABEL_35;
  }
  uint64_t v25 = v24;
  id v66 = v12;
  id v26 = objc_alloc(MEMORY[0x1E4F5BE68]);
  id v27 = [v70 instanceID];
  id v28 = (void *)[v26 initWithValue:v27];

  id v29 = objc_alloc_init(MEMORY[0x1E4F5BCA0]);
  [v29 setHAPInstanceID:v28];
  if (a4)
  {
    v65 = v29;
    id v30 = v71;
    if (([(id)objc_opt_class() updateTransition:v29 withCurve:v71 brightnessCharacteristic:v25 millisecondsElapsedSinceStartOfDay:v20 transitionStartTimeInMilliseconds:v19] & 1) == 0)
    {
      v64 = v28;
      v59 = (void *)MEMORY[0x1D9452090]();
      id v60 = a1;
      v61 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        v62 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v73 = v62;
        _os_log_impl(&dword_1D49D5000, v61, OS_LOG_TYPE_ERROR, "%{public}@Failed to update transition with Natural Lighting Curve", buf, 0xCu);
      }
      id v40 = 0;
      uint64_t v41 = v65;
      id v12 = v66;
      id v28 = v64;
      goto LABEL_34;
    }
    if ([v71 colorTemperatureNotifyIntervalThresholdInMilliseconds])
    {
      id v31 = objc_alloc(MEMORY[0x1E4F5BE68]);
      int v32 = v28;
      __int16 v33 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v71, "colorTemperatureNotifyIntervalThresholdInMilliseconds"));
      id v34 = (void *)[v31 initWithValue:v33];
      [v65 setNotifyTimeIntervalThreshold:v34];

      id v28 = v32;
    }
    if ([v71 colorTemperatureUpdateIntervalInMilliseconds])
    {
      id v35 = objc_alloc(MEMORY[0x1E4F5BE68]);
      long long v36 = v28;
      id v37 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v71, "colorTemperatureUpdateIntervalInMilliseconds"));
      uint64_t v38 = (void *)[v35 initWithValue:v37];
      [v65 setValueUpdateTimeInterval:v38];

      id v28 = v36;
    }
    *(_DWORD *)buf = [v71 colorTemperatureNotifyValueChangeThreshold];
    if (*(int *)buf >= 1)
    {
      id v39 = [MEMORY[0x1E4F1C9B8] dataWithBytes:buf length:4];
      [v65 setNotifyValueChangeThreshold:v39];
    }
    id v29 = v65;
  }
  id v40 = v29;
  uint64_t v41 = v29;
  id v12 = v66;
  id v30 = v71;
LABEL_34:

LABEL_35:
  id v21 = v68;

LABEL_36:
  id v11 = v69;
LABEL_37:

LABEL_38:
  return v40;
}

@end