@interface TDEffectRenditionSpec
+ (id)keyPathsForValuesAffectingCUIShapeEffectOutputOpacity;
+ (id)keyPathsForValuesAffectingCUIShapeEffectShapeOpacity;
- (BOOL)canBePackedWithDocument:(id)a3;
- (TDEffectComponent)CUIShapeEffectOutputOpacity;
- (TDEffectComponent)CUIShapeEffectShapeOpacity;
- (id)componentOfType:(unsigned int)a3;
- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5;
- (id)effectPreset;
- (void)replaceComponentsWithComponentsFromEffectRendition:(id)a3 withDocument:(id)a4;
- (void)setComponentsFromEffectPreset:(id)a3 withDocument:(id)a4;
@end

@implementation TDEffectRenditionSpec

- (void)setComponentsFromEffectPreset:(id)a3 withDocument:(id)a4
{
  uint64_t v7 = [a3 effectCount];
  id v10 = (id)[objc_alloc(MEMORY[0x263EFF9B0]) initWithCapacity:6];
  if (v7)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      v9 = (void *)[a4 newObjectForEntity:@"EffectComponent"];
      [v9 setEffectParametersFromPreset:a3 atIndex:i withDocument:a4];
      [v10 addObject:v9];
    }
  }
  [(TDEffectRenditionSpec *)self setComponents:v10];
}

- (id)effectPreset
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  objc_msgSend((id)-[TDEffectRenditionSpec effectScale](self, "effectScale"), "floatValue");
  v4 = (void *)[objc_alloc(MEMORY[0x263F383C8]) initWithEffectScale:v3];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = (void *)[(TDEffectRenditionSpec *)self components];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        int v12 = [v11 isEnabled];
        int v13 = objc_msgSend((id)objc_msgSend(v11, "effectType"), "identifier");
        if (v13 == 1180787813 || v13 == 1397715043 || v12 != 0) {
          [v11 updatePresetParameters:v4 atIndex:v8++];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
  return v4;
}

- (void)replaceComponentsWithComponentsFromEffectRendition:(id)a3 withDocument:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id obj = (id)[a3 components];
  if ([obj count])
  {
    uint64_t v6 = (void *)[(TDEffectRenditionSpec *)self components];
    v25 = objc_msgSend(MEMORY[0x263EFF9B0], "orderedSetWithCapacity:", objc_msgSend(v6, "count"));
    uint64_t v7 = (void *)[MEMORY[0x263EFF980] array];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v37;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v37 != v10) {
            objc_enumerationMutation(v6);
          }
          [v7 addObject:*(void *)(*((void *)&v36 + 1) + 8 * v11++)];
        }
        while (v9 != v11);
        uint64_t v9 = [v6 countByEnumeratingWithState:&v36 objects:v42 count:16];
      }
      while (v9);
    }
    [(TDEffectRenditionSpec *)self removeComponents:v6];
    [a4 deleteObjects:v7];
    objc_msgSend((id)objc_msgSend(a4, "managedObjectContext"), "processPendingChanges");
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v26 = [obj countByEnumeratingWithState:&v32 objects:v41 count:16];
    if (v26)
    {
      uint64_t v23 = *(void *)v33;
      v24 = self;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v33 != v23) {
            objc_enumerationMutation(obj);
          }
          int v13 = *(void **)(*((void *)&v32 + 1) + 8 * v12);
          v14 = (void *)[a4 newObjectForEntity:@"EffectComponent"];
          v27 = v13;
          v15 = (void *)[v13 parameters];
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v40 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v29;
            do
            {
              uint64_t v19 = 0;
              do
              {
                if (*(void *)v29 != v18) {
                  objc_enumerationMutation(v15);
                }
                long long v20 = *(void **)(*((void *)&v28 + 1) + 8 * v19);
                v21 = (void *)[a4 newObjectForEntity:@"EffectParameterValue"];
                objc_msgSend(v21, "setIntValue:", objc_msgSend(v20, "intValue"));
                objc_msgSend(v21, "setFloatValue:", objc_msgSend(v20, "floatValue"));
                objc_msgSend(v21, "setColorValue:", objc_msgSend(v20, "colorValue"));
                objc_msgSend(v21, "setAngleValue:", objc_msgSend(v20, "angleValue"));
                objc_msgSend(v21, "setParameterType:", objc_msgSend(v20, "parameterType"));
                [v14 addParametersObject:v21];

                ++v19;
              }
              while (v17 != v19);
              uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v40 count:16];
            }
            while (v17);
          }
          objc_msgSend(v14, "setEffectType:", objc_msgSend(v27, "effectType"));
          objc_msgSend(v14, "setIsEnabled:", objc_msgSend(v27, "isEnabled"));
          self = v24;
          [v14 setRendition:v24];
          [v25 addObject:v14];

          ++v12;
        }
        while (v12 != v26);
        uint64_t v26 = [obj countByEnumeratingWithState:&v32 objects:v41 count:16];
      }
      while (v26);
    }
    [(TDEffectRenditionSpec *)self addComponents:v25];
  }
}

- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5
{
  id v7 = [(TDEffectRenditionSpec *)self effectPreset];
  id v8 = objc_alloc(MEMORY[0x263F38370]);
  [v7 effectScale];
  uint64_t v10 = (void *)[v8 initWithShapeEffectPreset:v7 forScaleFactor:v9];
  objc_msgSend(v10, "setTargetPlatform:", objc_msgSend(a5, "targetPlatform"));
  objc_msgSend(v10, "setName:", objc_msgSend((id)objc_msgSend((id)-[TDEffectRenditionSpec production](self, "production"), "partDefinition"), "name"));
  [v10 setColorSpaceID:1];
  objc_msgSend(v10, "setRenditionProperties:", -[TDRenditionSpec propertiesAsDictionary](self, "propertiesAsDictionary"));
  uint64_t v11 = (void *)[v10 CSIRepresentationWithCompression:0];

  return v11;
}

- (BOOL)canBePackedWithDocument:(id)a3
{
  return 0;
}

- (id)componentOfType:(unsigned int)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (a3 != 1397715043 && a3 != 1180787813) {
    return 0;
  }
  v5 = (void *)[(TDEffectRenditionSpec *)self components];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v13;
LABEL_8:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v13 != v8) {
      objc_enumerationMutation(v5);
    }
    uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
    if (objc_msgSend((id)objc_msgSend(v10, "effectType"), "identifier") == a3) {
      return v10;
    }
    if (v7 == ++v9)
    {
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v10 = 0;
      if (v7) {
        goto LABEL_8;
      }
      return v10;
    }
  }
}

+ (id)keyPathsForValuesAffectingCUIShapeEffectShapeOpacity
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"components", 0);
}

- (TDEffectComponent)CUIShapeEffectShapeOpacity
{
  id v2 = [(TDEffectRenditionSpec *)self componentOfType:1397715043];

  return (TDEffectComponent *)v2;
}

+ (id)keyPathsForValuesAffectingCUIShapeEffectOutputOpacity
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"components", 0);
}

- (TDEffectComponent)CUIShapeEffectOutputOpacity
{
  id v2 = [(TDEffectRenditionSpec *)self componentOfType:1180787813];

  return (TDEffectComponent *)v2;
}

@end