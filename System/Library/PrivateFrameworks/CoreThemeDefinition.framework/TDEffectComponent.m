@interface TDEffectComponent
+ (id)keyPathsForValuesAffectingCUIEffectParameterAngle;
+ (id)keyPathsForValuesAffectingCUIEffectParameterBevelStyle;
+ (id)keyPathsForValuesAffectingCUIEffectParameterBlendMode;
+ (id)keyPathsForValuesAffectingCUIEffectParameterBlurSize;
+ (id)keyPathsForValuesAffectingCUIEffectParameterColor1;
+ (id)keyPathsForValuesAffectingCUIEffectParameterColor2;
+ (id)keyPathsForValuesAffectingCUIEffectParameterOffset;
+ (id)keyPathsForValuesAffectingCUIEffectParameterOpacity;
+ (id)keyPathsForValuesAffectingCUIEffectParameterOpacity2;
+ (id)keyPathsForValuesAffectingCUIEffectParameterSoftenSize;
+ (id)keyPathsForValuesAffectingCUIEffectParameterSpread;
+ (id)keyPathsForValuesAffectingCUIEffectParameterTintable;
- (id)CUIEffectParameterAngle;
- (id)CUIEffectParameterBevelStyle;
- (id)CUIEffectParameterBlendMode;
- (id)CUIEffectParameterBlurSize;
- (id)CUIEffectParameterColor1;
- (id)CUIEffectParameterColor2;
- (id)CUIEffectParameterOffset;
- (id)CUIEffectParameterOpacity;
- (id)CUIEffectParameterOpacity2;
- (id)CUIEffectParameterSoftenSize;
- (id)CUIEffectParameterSpread;
- (id)CUIEffectParameterTintable;
- (id)parameterOfType:(unsigned int)a3;
- (void)addParametersToPreset:(id)a3;
- (void)setEffectParametersFromPreset:(id)a3 atIndex:(unint64_t)a4 withDocument:(id)a5;
- (void)updatePresetParameters:(id)a3 atIndex:(unint64_t)a4;
@end

@implementation TDEffectComponent

- (void)setEffectParametersFromPreset:(id)a3 atIndex:(unint64_t)a4 withDocument:(id)a5
{
  uint64_t v9 = objc_msgSend(a5, "effectTypeWithIdentifier:", objc_msgSend(a3, "effectTypeAtIndex:", a4));
  v10 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:5];
  [(TDEffectComponent *)self setEffectType:v9];
  unint64_t v20 = 0;
  uint64_t v21 = 0;
  [a3 getEffectTuples:&v21 count:&v20 atEffectIndex:a4];
  if (v20)
  {
    uint64_t v11 = 0;
    for (unint64_t i = 0; i < v20; ++i)
    {
      unsigned int v13 = *(_DWORD *)(v21 + v11 + 4);
      double v14 = *(double *)(v21 + v11 + 8);
      uint64_t v15 = [a5 effectParameterTypeWithIdentifier:v13];
      v16 = (void *)[a5 newObjectForEntity:@"EffectParameterValue"];
      [v16 setParameterType:v15];
      [v16 setComponent:self];
      switch(v13)
      {
        case 0u:
        case 1u:
          v17 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:*(void *)&v14];
          [v16 setColorValue:v17];
          goto LABEL_8;
        case 2u:
        case 3u:
          id v18 = objc_alloc(NSNumber);
          *(float *)&double v19 = v14;
          v17 = (void *)[v18 initWithFloat:v19];
          [v16 setFloatValue:v17];
          goto LABEL_8;
        case 4u:
        case 5u:
        case 7u:
        case 8u:
        case 9u:
        case 0xAu:
        case 0xBu:
          v17 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:*(void *)&v14];
          [v16 setIntValue:v17];
          goto LABEL_8;
        case 6u:
          v17 = (void *)[objc_alloc(NSNumber) initWithShort:SLOWORD(v14)];
          [v16 setAngleValue:v17];
LABEL_8:

          break;
        default:
          break;
      }
      [v10 addObject:v16];

      v11 += 16;
    }
  }
  [(TDEffectComponent *)self setParameters:v10];
}

- (void)updatePresetParameters:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v7 = objc_msgSend((id)-[TDEffectComponent effectType](self, "effectType"), "identifier");
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v8 = (void *)[(TDEffectComponent *)self parameters];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        unsigned int v13 = *(void **)(*((void *)&v19 + 1) + 8 * v12);
        uint64_t v14 = objc_msgSend((id)objc_msgSend(v13, "parameterType"), "identifier");
        switch((int)v14)
        {
          case 0:
          case 1:
            uint64_t v15 = (void *)[v13 colorValue];
            goto LABEL_9;
          case 2:
          case 3:
            objc_msgSend((id)objc_msgSend(v13, "floatValue"), "floatValue");
            double v16 = v17;
            break;
          case 4:
          case 5:
          case 7:
          case 8:
          case 9:
          case 10:
          case 11:
            uint64_t v15 = (void *)[v13 intValue];
LABEL_9:
            double v16 = COERCE_DOUBLE([v15 unsignedIntegerValue]);
            break;
          case 6:
            *(void *)&double v16 = (unsigned __int16)objc_msgSend((id)objc_msgSend(v13, "angleValue"), "shortValue");
            break;
          default:
            double v16 = 0.0;
            break;
        }
        [a3 addValue:*(void *)&v16 forParameter:v14 withEffectType:v7 atEffectIndex:a4];
        ++v12;
      }
      while (v10 != v12);
      uint64_t v18 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      uint64_t v10 = v18;
    }
    while (v18);
  }
}

- (void)addParametersToPreset:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)-[TDEffectComponent effectType](self, "effectType"), "identifier");
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v6 = (void *)[(TDEffectComponent *)self parameters];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * v10);
        uint64_t v12 = objc_msgSend((id)objc_msgSend(v11, "parameterType"), "identifier");
        switch((int)v12)
        {
          case 0:
          case 1:
            unsigned int v13 = (void *)[v11 colorValue];
            goto LABEL_9;
          case 2:
          case 3:
            objc_msgSend((id)objc_msgSend(v11, "floatValue"), "floatValue");
            double v14 = v15;
            break;
          case 4:
          case 5:
          case 7:
          case 8:
          case 9:
          case 10:
          case 11:
            unsigned int v13 = (void *)[v11 intValue];
LABEL_9:
            double v14 = COERCE_DOUBLE([v13 unsignedIntegerValue]);
            break;
          case 6:
            *(void *)&double v14 = (unsigned __int16)objc_msgSend((id)objc_msgSend(v11, "angleValue"), "shortValue");
            break;
          default:
            double v14 = 0.0;
            break;
        }
        [a3 appendValue:*(void *)&v14 forParameter:v12 withEffectType:v5];
        ++v10;
      }
      while (v8 != v10);
      uint64_t v16 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v8 = v16;
    }
    while (v16);
  }
}

- (id)parameterOfType:(unsigned int)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v4 = (void *)[(TDEffectComponent *)self parameters];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(v4);
    }
    uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (objc_msgSend((id)objc_msgSend(v9, "parameterType"), "identifier") == a3) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

+ (id)keyPathsForValuesAffectingCUIEffectParameterColor1
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"parameters", 0);
}

- (id)CUIEffectParameterColor1
{
  id v2 = [(TDEffectComponent *)self parameterOfType:0];

  return v2;
}

+ (id)keyPathsForValuesAffectingCUIEffectParameterColor2
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"parameters", 0);
}

- (id)CUIEffectParameterColor2
{
  id v2 = [(TDEffectComponent *)self parameterOfType:1];

  return v2;
}

+ (id)keyPathsForValuesAffectingCUIEffectParameterOpacity
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"parameters", 0);
}

- (id)CUIEffectParameterOpacity
{
  id v2 = [(TDEffectComponent *)self parameterOfType:2];

  return v2;
}

+ (id)keyPathsForValuesAffectingCUIEffectParameterOpacity2
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"parameters", 0);
}

- (id)CUIEffectParameterOpacity2
{
  id v2 = [(TDEffectComponent *)self parameterOfType:3];

  return v2;
}

+ (id)keyPathsForValuesAffectingCUIEffectParameterBlurSize
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"parameters", 0);
}

- (id)CUIEffectParameterBlurSize
{
  id v2 = [(TDEffectComponent *)self parameterOfType:4];

  return v2;
}

+ (id)keyPathsForValuesAffectingCUIEffectParameterOffset
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"parameters", 0);
}

- (id)CUIEffectParameterOffset
{
  id v2 = [(TDEffectComponent *)self parameterOfType:5];

  return v2;
}

+ (id)keyPathsForValuesAffectingCUIEffectParameterAngle
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"parameters", 0);
}

- (id)CUIEffectParameterAngle
{
  id v2 = [(TDEffectComponent *)self parameterOfType:6];

  return v2;
}

+ (id)keyPathsForValuesAffectingCUIEffectParameterBlendMode
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"parameters", 0);
}

- (id)CUIEffectParameterBlendMode
{
  id v2 = [(TDEffectComponent *)self parameterOfType:7];

  return v2;
}

+ (id)keyPathsForValuesAffectingCUIEffectParameterSoftenSize
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"parameters", 0);
}

- (id)CUIEffectParameterSoftenSize
{
  id v2 = [(TDEffectComponent *)self parameterOfType:8];

  return v2;
}

+ (id)keyPathsForValuesAffectingCUIEffectParameterSpread
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"parameters", 0);
}

- (id)CUIEffectParameterSpread
{
  id v2 = [(TDEffectComponent *)self parameterOfType:9];

  return v2;
}

+ (id)keyPathsForValuesAffectingCUIEffectParameterTintable
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"parameters", 0);
}

- (id)CUIEffectParameterTintable
{
  id v2 = [(TDEffectComponent *)self parameterOfType:10];

  return v2;
}

+ (id)keyPathsForValuesAffectingCUIEffectParameterBevelStyle
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"parameters", 0);
}

- (id)CUIEffectParameterBevelStyle
{
  id v2 = [(TDEffectComponent *)self parameterOfType:11];

  return v2;
}

@end