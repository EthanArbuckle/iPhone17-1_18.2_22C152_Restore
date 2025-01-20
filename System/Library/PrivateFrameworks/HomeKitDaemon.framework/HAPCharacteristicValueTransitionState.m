@interface HAPCharacteristicValueTransitionState
@end

@implementation HAPCharacteristicValueTransitionState

BOOL __114__HAPCharacteristicValueTransitionState_NaturalLighting__naturalLightingActiveTransitionContextForCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [v3 controllerContext];
  if (v4)
  {
    id v18 = 0;
    uint64_t v5 = [MEMORY[0x263F35920] parsedFromData:v4 error:&v18];
    id v6 = v18;
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v5;

    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      v9 = [v3 HAPInstanceID];
      v10 = [v9 value];
      v11 = [*(id *)(a1 + 32) instanceID];
      if ([v10 isEqualToNumber:v11]
        && [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isNaturalLightingEnabled])
      {
        v12 = [v3 timeElapsedSinceStart];
        BOOL v13 = v12 != 0;
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      v14 = (void *)MEMORY[0x230FBD990]();
      v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v20 = v16;
        __int16 v21 = 2112;
        v22 = v4;
        __int16 v23 = 2112;
        id v24 = v6;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode controller context %@:%@", buf, 0x20u);
      }
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

BOOL __100__HAPCharacteristicValueTransitionState_NaturalLighting__isNaturalLightingEnabledForCharacteristic___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [v3 controllerContext];
  if (v4)
  {
    id v16 = 0;
    uint64_t v5 = [MEMORY[0x263F35920] parsedFromData:v4 error:&v16];
    id v6 = v16;
    if (v5)
    {
      uint64_t v7 = [v3 HAPInstanceID];
      v8 = [v7 value];
      v9 = [*(id *)(a1 + 32) instanceID];
      if ([v8 isEqualToNumber:v9]
        && [v5 isNaturalLightingEnabled])
      {
        v10 = [v3 timeElapsedSinceStart];
        BOOL v11 = v10 != 0;
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      v12 = (void *)MEMORY[0x230FBD990]();
      BOOL v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        id v18 = v14;
        __int16 v19 = 2112;
        v20 = v4;
        __int16 v21 = 2112;
        id v22 = v6;
        _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode controller context %@:%@", buf, 0x20u);
      }
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

uint64_t __59__HAPCharacteristicValueTransitionState_Validator__isValid__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isValid];
}

@end