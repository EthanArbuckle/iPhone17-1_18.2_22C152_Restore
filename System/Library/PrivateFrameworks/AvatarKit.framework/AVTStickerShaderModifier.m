@interface AVTStickerShaderModifier
+ (id)encapsulateShaderData:(id)a3;
+ (id)entryPointForModifierName:(id)a3;
+ (id)shaderModifierCache;
+ (id)shaderModifierFromDictionary:(id)a3 assetsPath:(id)a4;
- (AVTStickerShaderModifier)initWithEntryPoint:(id)a3 nodeNames:(id)a4 data:(id)a5 properties:(id)a6 forceDoubleSided:(BOOL)a7;
- (BOOL)forceDoubleSided;
- (NSArray)properties;
- (NSDictionary)dictionary;
- (NSString)data;
- (NSString)entryPoint;
- (id)cloneWithProperties:(id)a3;
- (id)description;
- (id)dictionaryWithTargetPath:(id)a3;
- (id)nodeNames;
- (void)applyToAllMaterialsOfNode:(id)a3 options:(id)a4 reversionContext:(id)a5;
- (void)applyToMatchedMaterialsOfAvatar:(id)a3 inHierarchy:(id)a4 options:(id)a5 reversionContext:(id)a6;
- (void)applyToMaterial:(id)a3 options:(id)a4 reversionContext:(id)a5;
- (void)setDictionary:(id)a3;
@end

@implementation AVTStickerShaderModifier

+ (id)shaderModifierCache
{
  if (shaderModifierCache_onceToken != -1) {
    dispatch_once(&shaderModifierCache_onceToken, &__block_literal_global_100_0);
  }
  v2 = (void *)shaderModifierCache_kCache;
  return v2;
}

uint64_t __47__AVTStickerShaderModifier_shaderModifierCache__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF8E0]);
  uint64_t v1 = shaderModifierCache_kCache;
  shaderModifierCache_kCache = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)shaderModifierFromDictionary:(id)a3 assetsPath:(id)a4
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 objectForKey:@"modifier"];
  v42 = [a1 entryPointForModifierName:v8];
  v9 = [v6 objectForKeyedSubscript:@"node"];
  v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [v6 objectForKeyedSubscript:@"geometry"];
  }
  v12 = v11;

  id v13 = v12;
  objc_opt_class();
  v44 = v13;
  if (objc_opt_isKindOfClass())
  {
    v44 = [v13 componentsJoinedByString:@"|"];
  }
  v14 = [v6 objectForKey:@"forceDoubleSided"];
  v41 = v14;
  if (v14) {
    unsigned int v37 = [v14 BOOLValue];
  }
  else {
    unsigned int v37 = 0;
  }
  v15 = [a1 shaderModifierCache];
  v16 = [v6 objectForKey:@"file"];
  uint64_t v17 = [v7 stringByAppendingPathComponent:v16];
  v18 = NSString;
  v43 = (void *)v17;
  v19 = objc_msgSend(NSURL, "fileURLWithPath:isDirectory:");
  v20 = [v19 standardizedURL];
  v21 = [v20 absoluteString];
  v22 = [v18 stringWithFormat:@"%@.%@.%@", v21, v8, v44];

  v40 = v16;
  if (!v16)
  {
    v24 = 0;
    goto LABEL_28;
  }
  v23 = [v15 objectForKey:v22];
  if (v23)
  {
    v39 = 0;
  }
  else
  {
    v39 = [NSString stringWithContentsOfFile:v43 encoding:4 error:0];
    if (!v39)
    {
      v24 = 0;
      goto LABEL_28;
    }
  }
  v38 = v22;
  id v35 = v13;
  v36 = v8;
  v25 = [MEMORY[0x263EFF980] array];
  v26 = [v6 objectForKey:@"properties"];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v46 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = +[AVTStickerShaderModifierProperty shaderModifierPropertyFromDictionary:*(void *)(*((void *)&v45 + 1) + 8 * i) assetsPath:v7];
        if (v31) {
          [v25 addObject:v31];
        }
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v45 objects:v49 count:16];
    }
    while (v28);
  }
  v32 = v23;
  if (v23)
  {
    v24 = v32;
    id v13 = v35;
    v16 = v40;
    if ([v25 count])
    {
      v24 = [(AVTStickerShaderModifier *)v32 cloneWithProperties:v25];
    }
  }
  else
  {
    id v13 = v35;
    v24 = [[AVTStickerShaderModifier alloc] initWithEntryPoint:v42 nodeNames:v35 data:v39 properties:v25 forceDoubleSided:v37];
    [(AVTStickerShaderModifier *)v24 setDictionary:v6];
    [v15 setObject:v24 forKey:v38];
    v16 = v40;
  }
  v33 = [v16 lastPathComponent];
  v24->_isCropShaderModifier = [v33 isEqualToString:@"crop_at_worldPosY.metal"];

  v8 = v36;
  v22 = v38;
LABEL_28:

  return v24;
}

+ (id)entryPointForModifierName:(id)a3
{
  id v3 = a3;
  char v4 = [v3 isEqualToString:@"fragment"];
  v5 = (id *)MEMORY[0x263F16BD8];
  if ((v4 & 1) == 0)
  {
    if ([v3 isEqualToString:@"surface"])
    {
      v5 = (id *)MEMORY[0x263F16BF0];
    }
    else if ([v3 isEqualToString:@"vertex"])
    {
      v5 = (id *)MEMORY[0x263F16BE0];
    }
    else if ([v3 isEqualToString:@"lightingModel"])
    {
      v5 = (id *)MEMORY[0x263F16BE8];
    }
  }
  id v6 = *v5;

  return v6;
}

+ (id)encapsulateShaderData:(id)a3
{
  id v3 = a3;
  char v4 = v3;
  if (([v3 containsString:@"// ==== STICKER SHADER MODIFIER START ===="] & 1) == 0)
  {
    char v4 = [NSString stringWithFormat:@"\n%@\n%@\n%@\n", @"// ==== STICKER SHADER MODIFIER START ====", v3, @"// ==== STICKER SHADER MODIFIER END ===="];
  }
  return v4;
}

- (AVTStickerShaderModifier)initWithEntryPoint:(id)a3 nodeNames:(id)a4 data:(id)a5 properties:(id)a6 forceDoubleSided:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)AVTStickerShaderModifier;
  uint64_t v17 = [(AVTStickerShaderModifier *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_entryPoint, a3);
    objc_storeStrong(&v18->_nodeNames, a4);
    objc_storeStrong((id *)&v18->_data, a5);
    objc_storeStrong((id *)&v18->_properties, a6);
    v18->_forceDoubleSided = a7;
  }

  return v18;
}

- (id)cloneWithProperties:(id)a3
{
  id v4 = a3;
  v5 = [AVTStickerShaderModifier alloc];
  id v6 = [(AVTStickerShaderModifier *)self entryPoint];
  id v7 = [(AVTStickerShaderModifier *)self nodeNames];
  v8 = [(AVTStickerShaderModifier *)self data];
  v9 = [(AVTStickerShaderModifier *)v5 initWithEntryPoint:v6 nodeNames:v7 data:v8 properties:v4 forceDoubleSided:[(AVTStickerShaderModifier *)self forceDoubleSided]];

  return v9;
}

- (void)applyToMaterial:(id)a3 options:(id)a4 reversionContext:(id)a5
{
  v31[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!self->_isCropShaderModifier || [v9 useLegacyCorrectClippingImplementation])
  {
    id v11 = [v8 shaderModifiers];
    v12 = [v11 objectForKeyedSubscript:self->_entryPoint];
    if (([v12 containsString:self->_data] & 1) == 0)
    {
      id v13 = AVTMergeShaderModifiersForEntryPoint(v12, 0, self->_data, 0);
      if (v13)
      {
        [v10 saveShaderModifiers:v11 forMaterial:v8];
        if ([v11 count])
        {
          id v14 = (void *)[v11 mutableCopy];
          [v14 setObject:v13 forKeyedSubscript:self->_entryPoint];
        }
        else
        {
          entryPoint = self->_entryPoint;
          v31[0] = v13;
          id v14 = [NSDictionary dictionaryWithObjects:v31 forKeys:&entryPoint count:1];
        }
        [v8 setShaderModifiers:v14];
      }
    }
    id v24 = v9;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v15 = [(AVTStickerShaderModifier *)self properties];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v15);
          }
          objc_super v20 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          v21 = [v20 name];
          [v10 saveCustomMaterialPropertyNamed:v21 forMaterial:v8];
          v22 = [v20 effectiveValue];
          [v8 setValue:v22 forKey:v21];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v17);
    }

    if ([(AVTStickerShaderModifier *)self forceDoubleSided]
      && ([v8 isDoubleSided] & 1) == 0)
    {
      [v10 saveSingleSidedForMaterial:v8];
      [v8 setDoubleSided:1];
    }

    id v9 = v24;
  }
}

- (void)applyToAllMaterialsOfNode:(id)a3 options:(id)a4 reversionContext:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = objc_msgSend(a3, "geometry", 0);
  id v11 = [v10 materials];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        [(AVTStickerShaderModifier *)self applyToMaterial:*(void *)(*((void *)&v16 + 1) + 8 * v15++) options:v8 reversionContext:v9];
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (void)applyToMatchedMaterialsOfAvatar:(id)a3 inHierarchy:(id)a4 options:(id)a5 reversionContext:(id)a6
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [a3 nodesMatchingStickerPattern:self->_nodeNames inHierarchy:a4 options:2 includingDerivedNodes:0];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        [(AVTStickerShaderModifier *)self applyToAllMaterialsOfNode:*(void *)(*((void *)&v17 + 1) + 8 * v16++) options:v10 reversionContext:v11];
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }
}

- (id)dictionaryWithTargetPath:(id)a3
{
  id v3 = [(AVTStickerShaderModifier *)self dictionary];
  id v4 = (void *)[v3 mutableCopy];

  return v4;
}

- (id)description
{
  id v3 = NSString;
  id v4 = [(AVTStickerShaderModifier *)self nodeNames];
  v5 = [(AVTStickerShaderModifier *)self entryPoint];
  id v6 = [v3 stringWithFormat:@"<AVTStickerShaderModifier: %p>(%@ %@)", self, v4, v5];

  return v6;
}

- (NSString)entryPoint
{
  return self->_entryPoint;
}

- (id)nodeNames
{
  return self->_nodeNames;
}

- (NSString)data
{
  return self->_data;
}

- (NSArray)properties
{
  return self->_properties;
}

- (BOOL)forceDoubleSided
{
  return self->_forceDoubleSided;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong(&self->_nodeNames, 0);
  objc_storeStrong((id *)&self->_entryPoint, 0);
}

@end