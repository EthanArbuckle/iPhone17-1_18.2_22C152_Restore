@interface HAPCharacteristicValueTransitionControl(NaturalLighting)
- (id)naturalLightingActiveTransitionContextForCharacteristic:()NaturalLighting;
- (uint64_t)naturalLightingEnabledForCharacteristic:()NaturalLighting;
@end

@implementation HAPCharacteristicValueTransitionControl(NaturalLighting)

- (id)naturalLightingActiveTransitionContextForCharacteristic:()NaturalLighting
{
  id v4 = a3;
  v5 = [a1 transitionStart];
  v6 = [v5 transitions];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __116__HAPCharacteristicValueTransitionControl_NaturalLighting__naturalLightingActiveTransitionContextForCharacteristic___block_invoke;
  v11[3] = &unk_264A26D50;
  id v7 = v4;
  id v12 = v7;
  v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v11);

  if (v8)
  {
    v9 = [v8 naturalLightingActiveTransitionContextForCharacteristic:v7];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (uint64_t)naturalLightingEnabledForCharacteristic:()NaturalLighting
{
  id v4 = a3;
  v5 = [a1 transitionStart];
  v6 = [v5 transitions];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __100__HAPCharacteristicValueTransitionControl_NaturalLighting__naturalLightingEnabledForCharacteristic___block_invoke;
  v14[3] = &unk_264A26D50;
  id v7 = v4;
  id v15 = v7;
  v8 = objc_msgSend(v6, "na_firstObjectPassingTest:", v14);

  if (v8)
  {
    v9 = [v8 controllerContext];
    if (v9
      || ([v8 endBehavior], (v9 = objc_claimAutoreleasedReturnValue()) != 0)
      || ([v8 linearTransition], (v9 = objc_claimAutoreleasedReturnValue()) != 0))
    {
    }
    else
    {
      v13 = [v8 linearDerivedTransition];

      if (!v13)
      {
        uint64_t v11 = MEMORY[0x263EFFA80];
        goto LABEL_10;
      }
    }
    v10 = [v8 naturalLightingActiveTransitionContextForCharacteristic:v7];

    if (v10) {
      uint64_t v11 = MEMORY[0x263EFFA88];
    }
    else {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
LABEL_10:

  return v11;
}

@end