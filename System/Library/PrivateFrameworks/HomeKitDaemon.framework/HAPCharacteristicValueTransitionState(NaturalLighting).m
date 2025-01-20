@interface HAPCharacteristicValueTransitionState(NaturalLighting)
- (HMDNaturalLightingActiveTransitionContext)naturalLightingActiveTransitionContextForCharacteristic:()NaturalLighting;
- (uint64_t)isNaturalLightingEnabledForCharacteristic:()NaturalLighting;
@end

@implementation HAPCharacteristicValueTransitionState(NaturalLighting)

- (HMDNaturalLightingActiveTransitionContext)naturalLightingActiveTransitionContextForCharacteristic:()NaturalLighting
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__25646;
  v36 = __Block_byref_object_dispose__25647;
  id v37 = 0;
  v5 = [a1 activeTransitionContexts];
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  v28 = __114__HAPCharacteristicValueTransitionState_NaturalLighting__naturalLightingActiveTransitionContextForCharacteristic___block_invoke;
  v29 = &unk_264A181B0;
  v31 = &v32;
  id v6 = v4;
  id v30 = v6;
  v7 = objc_msgSend(v5, "na_firstObjectPassingTest:", &v26);

  if (v7)
  {
    v8 = objc_msgSend(v7, "timeElapsedSinceStart", v26, v27, v28, v29);
    v9 = [v8 value];

    if (v9)
    {
      v10 = [(id)v33[5] startTime];
      v11 = [v10 value];

      if (v11)
      {
        v12 = (void *)MEMORY[0x263EFF910];
        [v11 doubleValue];
        v14 = [v12 dateWithTimeIntervalSinceReferenceDate:v13 / 1000.0];
        v15 = [(id)v33[5] transitionChecksum];
        v16 = [v15 value];

        v17 = -[HMDNaturalLightingActiveTransitionContext initWithStartDate:millisecondsElapsedSinceStartDate:transitionChecksum:]([HMDNaturalLightingActiveTransitionContext alloc], "initWithStartDate:millisecondsElapsedSinceStartDate:transitionChecksum:", v14, [v9 unsignedLongLongValue], v16);
      }
      else
      {
        v21 = (void *)MEMORY[0x230FBD990]();
        HMFGetOSLogHandle();
        v22 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = HMFGetLogIdentifier();
          v24 = (void *)v33[5];
          *(_DWORD *)buf = 138543618;
          v39 = v23;
          __int16 v40 = 2112;
          v41 = v24;
          _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Start time missing in the controller context %@", buf, 0x16u);
        }
        v17 = 0;
      }
    }
    else
    {
      v18 = (void *)MEMORY[0x230FBD990]();
      HMFGetOSLogHandle();
      v19 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v39 = v20;
        __int16 v40 = 2112;
        v41 = v7;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Time elapsed since start is missing in the active transition context %@", buf, 0x16u);
      }
      v17 = 0;
    }
  }
  else
  {
    v17 = 0;
  }

  _Block_object_dispose(&v32, 8);
  return v17;
}

- (uint64_t)isNaturalLightingEnabledForCharacteristic:()NaturalLighting
{
  id v4 = a3;
  v5 = [a1 activeTransitionContexts];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __100__HAPCharacteristicValueTransitionState_NaturalLighting__isNaturalLightingEnabledForCharacteristic___block_invoke;
  v9[3] = &unk_264A18188;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = objc_msgSend(v5, "na_any:", v9);

  return v7;
}

@end