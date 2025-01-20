@interface AVTStickerProp
+ (BOOL)getOrientToCameraInDictionary:(id)a3;
+ (BOOL)getRenderLastInDictionary:(id)a3;
+ (CGSize)getSizeInDictionary:(id)a3;
+ (__n128)getPositionInDictionary:(void *)a3;
+ (__n128)getRotationInDictionary:(void *)a3;
+ (__n128)getScaleInDictionary:(void *)a3;
+ (float)getOpacityInDictionary:(id)a3;
+ (id)adjustmentFromDictionary:(id)a3 presetCategory:(id)a4;
+ (id)cacheKeyForSize:(CGSize)a3 position:(id)a4 rotation:(id)a5 scale:palettesDescriptions:filePath:;
+ (id)propFromDictionary:(id)a3 assetsPath:(id)a4;
+ (id)stickerPropCache;
+ (void)applyPalettesForAvatar:(id)a3 toNode:(id)a4 palettesDescriptions:(id)a5;
- (AVTStickerProp)initWithSize:(CGSize)a3 scale:(BOOL)a4 position:(BOOL)a5 renderLast:(id)a6 orientToCamera:(id)a7 rotation:(id)a8 palettesDescriptions:shaderModifiers:adjustments:;
- (BOOL)orientToCamera;
- (BOOL)renderLast;
- (BOOL)wantsTimedUpdates;
- (CGSize)size;
- (NSArray)adjustments;
- (NSArray)palettesDescriptions;
- (NSArray)shaderModifiers;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)nodeName;
- (NSString)originalName;
- (SCNNode)node;
- (__n128)position;
- (__n128)rotation;
- (__n128)scale;
- (double)opacity;
- (id)cloneWithShaderModifiers:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryWithTargetPath:(id)a3;
- (void)applyCamera:(id)a3 toNode:(id)a4 distToHead:(double)a5;
- (void)buildNodeForAvatar:(id)a3 withCamera:(id)a4 options:(id)a5 completionHandler:(id)a6;
- (void)setNode:(id)a3;
- (void)setOpacity:(double)a3;
- (void)setOriginalName:(id)a3;
- (void)setPosition:(AVTStickerProp *)self;
- (void)setRotation:(AVTStickerProp *)self;
- (void)setScale:(AVTStickerProp *)self;
- (void)setShaderModifiers:(id)a3;
@end

@implementation AVTStickerProp

+ (id)stickerPropCache
{
  if (stickerPropCache_onceToken != -1) {
    dispatch_once(&stickerPropCache_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)stickerPropCache_kCache;
  return v2;
}

uint64_t __34__AVTStickerProp_stickerPropCache__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF8E0]);
  uint64_t v1 = stickerPropCache_kCache;
  stickerPropCache_kCache = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

+ (id)cacheKeyForSize:(CGSize)a3 position:(id)a4 rotation:(id)a5 scale:palettesDescriptions:filePath:
{
  long long v21 = v6;
  long long v22 = v7;
  long long v20 = v5;
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v11 = a5;
  v12 = [a4 componentsJoinedByString:@","];
  v13 = [NSURL fileURLWithPath:v11 isDirectory:0];

  v14 = [v13 standardizedURL];
  v15 = [v14 absoluteString];

  v16 = NSString;
  v24.CGFloat width = width;
  v24.CGFloat height = height;
  v17 = NSStringFromCGSize(v24);
  v18 = [v16 stringWithFormat:@"%@.%@.%f%f%f.%f%f%f.%f%f%f.%@", v15, v17, *(float *)&v20, *((float *)&v20 + 1), *((float *)&v20 + 2), *(float *)&v21, *((float *)&v21 + 1), *((float *)&v21 + 2), *(float *)&v22, *((float *)&v22 + 1), *((float *)&v22 + 2), v12];

  return v18;
}

+ (BOOL)getOrientToCameraInDictionary:(id)a3
{
  v3 = [a3 objectForKey:@"orientToCamera"];
  v4 = v3;
  if (v3) {
    char v5 = [v3 BOOLValue];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

+ (BOOL)getRenderLastInDictionary:(id)a3
{
  v3 = [a3 objectForKey:@"renderLast"];
  v4 = v3;
  if (v3) {
    char v5 = [v3 BOOLValue];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

+ (CGSize)getSizeInDictionary:(id)a3
{
  v3 = [a3 objectForKey:@"size"];
  v4 = v3;
  if (v3)
  {
    char v5 = [v3 objectForKeyedSubscript:@"width"];
    [v5 floatValue];
    double v7 = v6;
    v8 = [v4 objectForKeyedSubscript:@"height"];
    [v8 floatValue];
    double v10 = v9;
  }
  else
  {
    double v7 = *MEMORY[0x263F001B0];
    double v10 = *(double *)(MEMORY[0x263F001B0] + 8);
  }

  double v11 = v7;
  double v12 = v10;
  result.CGFloat height = v12;
  result.CGFloat width = v11;
  return result;
}

+ (__n128)getPositionInDictionary:(void *)a3
{
  v3 = [a3 objectForKey:@"position"];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v4 = [v3 objectForKeyedSubscript:@"x"];
      [v4 floatValue];
      *(void *)&long long v15 = v5;
      float v6 = [v3 objectForKeyedSubscript:@"y"];
      [v6 floatValue];
      int v14 = v7;
      v8 = [v3 objectForKeyedSubscript:@"z"];
      [v8 floatValue];
      long long v9 = v15;
      DWORD1(v9) = v14;
      DWORD2(v9) = v10;
      long long v16 = v9;
    }
    else
    {
      [v3 floatValue];
      *(void *)&long long v11 = 0;
      *((void *)&v11 + 1) = v12;
      long long v16 = v11;
    }
  }
  else
  {
    long long v16 = 0u;
  }

  return (__n128)v16;
}

+ (__n128)getRotationInDictionary:(void *)a3
{
  v3 = [a3 objectForKey:@"rotation"];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v4 = [v3 objectForKeyedSubscript:@"x"];
      [v4 floatValue];
      *(void *)&long long v15 = v5;
      float v6 = [v3 objectForKeyedSubscript:@"y"];
      [v6 floatValue];
      int v14 = v7;
      v8 = [v3 objectForKeyedSubscript:@"z"];
      [v8 floatValue];
      long long v9 = v15;
      DWORD1(v9) = v14;
      DWORD2(v9) = v10;
      long long v16 = v9;
    }
    else
    {
      [v3 floatValue];
      *(void *)&long long v11 = 0;
      *((void *)&v11 + 1) = v12;
      long long v16 = v11;
    }
  }
  else
  {
    long long v16 = 0u;
  }

  return (__n128)v16;
}

+ (__n128)getScaleInDictionary:(void *)a3
{
  v3 = [a3 objectForKey:@"scale"];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v4 = [v3 objectForKeyedSubscript:@"x"];
      [v4 floatValue];
      *(void *)&long long v23 = v5;
      float v6 = [v3 objectForKeyedSubscript:@"y"];
      [v6 floatValue];
      int v21 = v7;
      v8 = [v3 objectForKeyedSubscript:@"z"];
      [v8 floatValue];
      long long v9 = v23;
      DWORD1(v9) = v21;
      DWORD2(v9) = v10;
      long long v24 = v9;
    }
    else
    {
      [v3 floatValue];
      *(void *)&long long v23 = v16;
      [v3 floatValue];
      int v22 = v17;
      [v3 floatValue];
      long long v18 = v23;
      DWORD1(v18) = v22;
      DWORD2(v18) = v19;
      long long v24 = v18;
    }
  }
  else
  {
    __asm { FMOV            V0.4S, #1.0 }
    long long v24 = _Q0;
  }

  return (__n128)v24;
}

+ (id)adjustmentFromDictionary:(id)a3 presetCategory:(id)a4
{
  id v6 = a3;
  uint64_t v7 = AVTPresetCategoryFromString(a4);
  [a1 getPositionInDictionary:v6];
  double v16 = v8;
  [a1 getRotationInDictionary:v6];
  double v15 = v9;
  [a1 getScaleInDictionary:v6];
  double v14 = v10;
  long long v11 = [v6 objectForKey:@"value"];

  unsigned int v12 = [[AVTStickerPropAdjustTransformProperty alloc] initWithPresetCategory:v7 presetValue:v11 position:v16 rotation:v15 scale:v14];
  return v12;
}

+ (float)getOpacityInDictionary:(id)a3
{
  v3 = [a3 objectForKey:@"opacity"];
  float v4 = 1.0;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v3 floatValue];
      float v4 = v5;
    }
  }

  return v4;
}

+ (id)propFromDictionary:(id)a3 assetsPath:(id)a4
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  [a1 getSizeInDictionary:v6];
  double v9 = v8;
  double v11 = v10;
  [a1 getPositionInDictionary:v6];
  double v58 = v12;
  [a1 getRotationInDictionary:v6];
  double v57 = v13;
  [a1 getScaleInDictionary:v6];
  double v56 = v14;
  [a1 getOpacityInDictionary:v6];
  float v16 = v15;
  unsigned int v54 = [a1 getOrientToCameraInDictionary:v6];
  unsigned int v55 = [a1 getRenderLastInDictionary:v6];
  uint64_t v59 = [v6 objectForKey:@"palettes"];
  int v17 = [MEMORY[0x263EFF980] array];
  long long v18 = [v6 objectForKey:@"adjustments"];
  objc_opt_class();
  v60 = v18;
  v65 = v7;
  v61 = v6;
  if (objc_opt_isKindOfClass())
  {
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v19 = v18;
    uint64_t v66 = [v19 countByEnumeratingWithState:&v76 objects:v82 count:16];
    if (v66)
    {
      uint64_t v20 = *(void *)v77;
      uint64_t v62 = *(void *)v77;
      id v64 = v19;
      do
      {
        for (uint64_t i = 0; i != v66; ++i)
        {
          if (*(void *)v77 != v20) {
            objc_enumerationMutation(v19);
          }
          uint64_t v22 = *(void *)(*((void *)&v76 + 1) + 8 * i);
          long long v23 = [v19 objectForKey:v22];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v24 = [a1 adjustmentFromDictionary:v23 presetCategory:v22];
            [v17 addObject:v24];
          }
          else
          {
            long long v74 = 0u;
            long long v75 = 0u;
            long long v72 = 0u;
            long long v73 = 0u;
            id v24 = v23;
            uint64_t v25 = [v24 countByEnumeratingWithState:&v72 objects:v81 count:16];
            if (v25)
            {
              uint64_t v26 = v25;
              uint64_t v27 = *(void *)v73;
              do
              {
                for (uint64_t j = 0; j != v26; ++j)
                {
                  if (*(void *)v73 != v27) {
                    objc_enumerationMutation(v24);
                  }
                  v29 = [a1 adjustmentFromDictionary:*(void *)(*((void *)&v72 + 1) + 8 * j) presetCategory:v22];
                  [v17 addObject:v29];
                }
                uint64_t v26 = [v24 countByEnumeratingWithState:&v72 objects:v81 count:16];
              }
              while (v26);
              id v19 = v64;
              id v7 = v65;
              uint64_t v20 = v62;
            }
            else
            {
              id v7 = v65;
            }
          }
        }
        uint64_t v66 = [v19 countByEnumeratingWithState:&v76 objects:v82 count:16];
      }
      while (v66);
    }

    id v6 = v61;
  }
  v30 = [MEMORY[0x263EFF980] array];
  v31 = [v6 objectForKey:@"shaders"];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v68 objects:v80 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v69;
    do
    {
      for (uint64_t k = 0; k != v33; ++k)
      {
        if (*(void *)v69 != v34) {
          objc_enumerationMutation(v31);
        }
        v36 = +[AVTStickerShaderModifier shaderModifierFromDictionary:*(void *)(*((void *)&v68 + 1) + 8 * k) assetsPath:v7];
        if (v36) {
          [v30 addObject:v36];
        }
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v68 objects:v80 count:16];
    }
    while (v33);
  }
  v67 = [a1 stickerPropCache];
  v37 = v61;
  v38 = [v61 objectForKey:@"image"];
  if (v38)
  {
    v39 = [v65 stringByAppendingPathComponent:v38];
    v40 = [v39 stringByStandardizingPath];

    v41 = (void *)v59;
    v42 = objc_msgSend((id)objc_opt_class(), "cacheKeyForSize:position:rotation:scale:palettesDescriptions:filePath:", v59, v40, v9, v11, v58, v57, v56);
    v43 = [v67 objectForKey:v42];
    if (v43)
    {
      v44 = v43;
      v45 = v38;
      if (v30)
      {
        uint64_t v46 = [(AVTStickerProp *)v43 cloneWithShaderModifiers:v30];

        v44 = (AVTStickerImageProp *)v46;
      }
      v38 = v45;
      v41 = (void *)v59;
    }
    else
    {
      v44 = -[AVTStickerImageProp initWithImageAtPath:size:scale:position:renderLast:orientToCamera:rotation:palettesDescriptions:modifiers:adjustments:]([AVTStickerImageProp alloc], "initWithImageAtPath:size:scale:position:renderLast:orientToCamera:rotation:palettesDescriptions:modifiers:adjustments:", v40, v55, v54, v59, v30, v17, v9, v11, v56, v58, v57);
      [(AVTStickerProp *)v44 setOriginalName:v38];
      [(AVTStickerProp *)v44 setOpacity:v16];
      [v67 setObject:v44 forKey:v42];
    }
    goto LABEL_48;
  }
  v40 = [v61 objectForKey:@"scene"];
  v41 = (void *)v59;
  if (!v40)
  {
    v44 = 0;
    goto LABEL_49;
  }
  v47 = [v65 stringByAppendingPathComponent:v40];
  v42 = [v47 stringByStandardizingPath];

  v48 = objc_msgSend((id)objc_opt_class(), "cacheKeyForSize:position:rotation:scale:palettesDescriptions:filePath:", v59, v42, v9, v11, v58, v57, v56);
  v49 = [v67 objectForKey:v48];
  if (!v49)
  {
    v63 = [NSURL fileURLWithPath:v42 isDirectory:0];
    v51 = objc_msgSend(MEMORY[0x263F16AD8], "avt_rootNodeForSceneAtURL:options:error:");
    v44 = (AVTStickerImageProp *)0;
    if (v44)
    {
      v52 = avt_default_log();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
        +[AVTStickerProp propFromDictionary:assetsPath:]((uint64_t)v42, v44, v52);
      }

      v41 = (void *)v59;
    }
    v50 = [[AVTStickerSceneProp alloc] initWithRootNode:v51 scale:v55 position:v41 rotation:v30 renderLast:v17 palettesDescriptions:v56 modifiers:v58 adjustments:v57];
    [(AVTStickerProp *)v50 setOriginalName:v40];
    [(AVTStickerProp *)v50 setOpacity:v16];
    [v67 setObject:v50 forKey:v48];

    goto LABEL_46;
  }
  v44 = v49;
  if (v30)
  {
    v50 = [(AVTStickerProp *)v49 cloneWithShaderModifiers:v30];
LABEL_46:

    v44 = (AVTStickerImageProp *)v50;
    v37 = v61;
    v41 = (void *)v59;
  }

LABEL_48:
LABEL_49:

  return v44;
}

+ (void)applyPalettesForAvatar:(id)a3 toNode:(id)a4 palettesDescriptions:(id)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v26 = a4;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v23 = v7;
    id v25 = v7;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v22 = v8;
    obuint64_t j = v8;
    uint64_t v9 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v33 != v11) {
            objc_enumerationMutation(obj);
          }
          double v13 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          double v14 = objc_msgSend(v13, "objectForKey:", @"material", v22);
          id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
          v29[0] = MEMORY[0x263EF8330];
          v29[1] = 3221225472;
          v29[2] = __69__AVTStickerProp_applyPalettesForAvatar_toNode_palettesDescriptions___block_invoke;
          v29[3] = &unk_26401F5D0;
          id v30 = v14;
          id v31 = v15;
          id v16 = v15;
          id v17 = v14;
          [v26 enumerateHierarchyUsingBlock:v29];
          long long v18 = [v13 objectForKey:@"palette"];
          id v19 = [v25 colorPresetForCategory:AVTColorCategoryFromString(v18)];
          uint64_t v20 = [v19 makeMaterial];
          v27[0] = MEMORY[0x263EF8330];
          v27[1] = 3221225472;
          v27[2] = __69__AVTStickerProp_applyPalettesForAvatar_toNode_palettesDescriptions___block_invoke_2;
          v27[3] = &unk_264020438;
          id v28 = v20;
          id v21 = v20;
          [v16 enumerateObjectsUsingBlock:v27];
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v10);
    }

    id v8 = v22;
    id v7 = v23;
  }
}

void __69__AVTStickerProp_applyPalettesForAvatar_toNode_palettesDescriptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v3 = [a2 geometry];
    float v4 = [v3 materials];

    uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v10 = [v9 name];
          int v11 = [v10 isEqualToString:*(void *)(a1 + 32)];

          if (v11) {
            [*(id *)(a1 + 40) addObject:v9];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v6);
    }
  }
  else
  {
    double v12 = *(void **)(a1 + 40);
    id v14 = [a2 geometry];
    double v13 = [v14 firstMaterial];
    [v12 addObject:v13];
  }
}

uint64_t __69__AVTStickerProp_applyPalettesForAvatar_toNode_palettesDescriptions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) applyToSceneKitMaterial:a2];
}

- (AVTStickerProp)initWithSize:(CGSize)a3 scale:(BOOL)a4 position:(BOOL)a5 renderLast:(id)a6 orientToCamera:(id)a7 rotation:(id)a8 palettesDescriptions:shaderModifiers:adjustments:
{
  long long v28 = v9;
  long long v29 = v10;
  long long v27 = v8;
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  v30.receiver = self;
  v30.super_class = (Class)AVTStickerProp;
  id v22 = [(AVTStickerProp *)&v30 init];
  id v23 = v22;
  if (v22)
  {
    v22->_size.CGFloat width = width;
    v22->_size.CGFloat height = height;
    *(_OWORD *)v22->_position = v28;
    *(_OWORD *)v22->_scale = v27;
    v22->_opacity = 1.0;
    v22->_renderLast = a4;
    v22->_orientToCamera = a5;
    *(_OWORD *)v22->_rotation = v29;
    objc_storeStrong((id *)&v22->_palettesDescriptions, a6);
    uint64_t v24 = [v20 copy];
    shaderModifiers = v23->_shaderModifiers;
    v23->_shaderModifiers = (NSArray *)v24;

    objc_storeStrong((id *)&v23->_adjustments, a8);
  }

  return v23;
}

- (void)setPosition:(AVTStickerProp *)self
{
  *(_OWORD *)self->_position = v2;
  [(AVTStickerProp *)self setNode:0];
}

- (void)setScale:(AVTStickerProp *)self
{
  *(_OWORD *)self->_scale = v2;
  [(AVTStickerProp *)self setNode:0];
}

- (void)setRotation:(AVTStickerProp *)self
{
  *(_OWORD *)self->_rotation = v2;
  [(AVTStickerProp *)self setNode:0];
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
  [(AVTStickerProp *)self setNode:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  float v4 = [AVTStickerProp alloc];
  [(AVTStickerProp *)self size];
  double v6 = v5;
  double v8 = v7;
  [(AVTStickerProp *)self scale];
  double v21 = v9;
  [(AVTStickerProp *)self position];
  double v20 = v10;
  BOOL v11 = [(AVTStickerProp *)self renderLast];
  BOOL v12 = [(AVTStickerProp *)self orientToCamera];
  [(AVTStickerProp *)self rotation];
  double v19 = v13;
  id v14 = [(AVTStickerProp *)self palettesDescriptions];
  long long v15 = [(AVTStickerProp *)self shaderModifiers];
  long long v16 = [(AVTStickerProp *)self adjustments];
  long long v17 = -[AVTStickerProp initWithSize:scale:position:renderLast:orientToCamera:rotation:palettesDescriptions:shaderModifiers:adjustments:](v4, "initWithSize:scale:position:renderLast:orientToCamera:rotation:palettesDescriptions:shaderModifiers:adjustments:", v11, v12, v14, v15, v16, v6, v8, v21, v20, v19);

  return v17;
}

- (id)cloneWithShaderModifiers:(id)a3
{
  id v4 = a3;
  double v5 = (void *)[(AVTStickerProp *)self copy];
  double v6 = [(AVTStickerProp *)self node];
  [v5 setNode:v6];

  [v5 setShaderModifiers:v4];
  return v5;
}

- (void)setNode:(id)a3
{
  double v7 = (SCNNode *)a3;
  if (self->_node != v7)
  {
    double v5 = [(AVTStickerProp *)self nodeName];
    [(SCNNode *)v7 setName:v5];

    if ([(AVTStickerProp *)self renderLast]) {
      uint64_t v6 = 100;
    }
    else {
      uint64_t v6 = 0;
    }
    [(SCNNode *)v7 setRenderingOrder:v6];
    objc_storeStrong((id *)&self->_node, a3);
  }
}

- (NSString)identifier
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  double v5 = [(AVTStickerProp *)self originalName];
  uint64_t v6 = [v3 stringWithFormat:@"%@-%@", v4, v5];

  return (NSString *)v6;
}

- (NSString)nodeName
{
  long long v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AVTStickerProp hash](self, "hash"));
  v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (NSString)displayName
{
  long long v2 = [(AVTStickerProp *)self originalName];
  v3 = [v2 lastPathComponent];
  uint64_t v4 = [v3 stringByDeletingPathExtension];

  return (NSString *)v4;
}

- (void)applyCamera:(id)a3 toNode:(id)a4 distToHead:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [(AVTStickerProp *)self orientToCamera];
  if (v8 && v9 && v10)
  {
    [v9 simdPosition];
    [v9 setSimdPosition:v11];
    [(AVTStickerProp *)self size];
    double v12 = 1.0;
    if (v13 > 0.0)
    {
      [(AVTStickerProp *)self size];
      double v15 = v14;
      [(AVTStickerProp *)self size];
      double v12 = v15 / v16;
    }
    [(AVTStickerProp *)self position];
    double v18 = (v17 - a5) * -2.0;
    double v19 = [v8 camera];
    [v19 fieldOfView];
    *(float *)&double v20 = v20 * 3.14159265 * 0.5 / 180.0;
    double v21 = tanf(*(float *)&v20);

    id v22 = [v9 geometry];
    objc_msgSend(v22, "setWidth:");
    [v22 setHeight:v18 * v21];
    [v9 simdPosition];
    unsigned int v32 = v23;
    [v9 simdPosition];
    v25.f64[0] = v12 * (v18 * v21);
    v25.f64[1] = v18 * v21;
    float64x2_t v26 = vmulq_f64(v25, vcvtq_f64_f32((float32x2_t)__PAIR64__(v24, v32)));
    __asm { FMOV            V1.2D, #0.5 }
    double v33 = COERCE_DOUBLE(vcvt_f32_f64(vmulq_f64(v26, _Q1)));
    [v9 simdPosition];
    [v9 setSimdPosition:v33];
    [v9 transform];
    [v8 convertTransform:v35 toNode:0];
    v34[0] = v36;
    v34[1] = v37;
    v34[2] = v38;
    v34[3] = v39;
    [v9 setTransform:v34];
  }
}

- (void)buildNodeForAvatar:(id)a3 withCamera:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  double v7 = (void (**)(id, id))a6;
  id v8 = [(AVTStickerProp *)self node];
  AVTCloneNodesAndMaterials(v8);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  v7[2](v7, v9);
}

- (BOOL)wantsTimedUpdates
{
  return 0;
}

- (id)dictionaryWithTargetPath:(id)a3
{
  v48[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [MEMORY[0x263EFF9A0] dictionary];
  [(AVTStickerProp *)self size];
  if (v7 != *MEMORY[0x263F001B0] || v6 != *(double *)(MEMORY[0x263F001B0] + 8))
  {
    v47[0] = @"width";
    id v9 = NSNumber;
    [(AVTStickerProp *)self size];
    *(float *)&double v10 = v10;
    double v11 = [v9 numberWithFloat:v10];
    v47[1] = @"height";
    v48[0] = v11;
    double v12 = NSNumber;
    [(AVTStickerProp *)self size];
    *(float *)&double v14 = v13;
    double v15 = [v12 numberWithFloat:v14];
    v48[1] = v15;
    double v16 = [NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:2];
    [v5 setObject:v16 forKeyedSubscript:@"size"];
  }
  [(AVTStickerProp *)self position];
  uint32x4_t v18 = (uint32x4_t)vceqzq_f32(v17);
  v18.i32[3] = v18.i32[2];
  if ((vminvq_u32(v18) & 0x80000000) == 0)
  {
    [(AVTStickerProp *)self position];
    double v20 = plistWithVector(v19);
    [v5 setObject:v20 forKeyedSubscript:@"position"];
  }
  if (![(AVTStickerProp *)self orientToCamera])
  {
    double v21 = objc_msgSend(NSNumber, "numberWithBool:", -[AVTStickerProp orientToCamera](self, "orientToCamera"));
    [v5 setObject:v21 forKeyedSubscript:@"orientToCamera"];
  }
  [(AVTStickerProp *)self rotation];
  uint32x4_t v23 = (uint32x4_t)vceqzq_f32(v22);
  v23.i32[3] = v23.i32[2];
  if ((vminvq_u32(v23) & 0x80000000) == 0)
  {
    [(AVTStickerProp *)self rotation];
    float64x2_t v25 = plistWithVector(v24);
    [v5 setObject:v25 forKeyedSubscript:@"rotation"];
  }
  [(AVTStickerProp *)self scale];
  uint32x4_t v27 = (uint32x4_t)vceqq_f32(v26, (float32x4_t)xmmword_20B88FE60);
  v27.i32[3] = v27.i32[2];
  if ((vminvq_u32(v27) & 0x80000000) == 0)
  {
    [(AVTStickerProp *)self scale];
    long long v29 = plistWithVector(v28);
    [v5 setObject:v29 forKeyedSubscript:@"scale"];
  }
  [(AVTStickerProp *)self opacity];
  if (v30 != 1.0)
  {
    [(AVTStickerProp *)self opacity];
    unsigned int v32 = numberFromDouble(v31);
    [v5 setObject:v32 forKeyedSubscript:@"opacity"];
  }
  if (![(AVTStickerProp *)self renderLast])
  {
    double v33 = objc_msgSend(NSNumber, "numberWithBool:", -[AVTStickerProp renderLast](self, "renderLast"));
    [v5 setObject:v33 forKeyedSubscript:@"renderLast"];
  }
  if ([(NSArray *)self->_shaderModifiers count])
  {
    long long v34 = [MEMORY[0x263EFF980] array];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v35 = self->_shaderModifiers;
    uint64_t v36 = [(NSArray *)v35 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v37; ++i)
        {
          if (*(void *)v43 != v38) {
            objc_enumerationMutation(v35);
          }
          v40 = objc_msgSend(*(id *)(*((void *)&v42 + 1) + 8 * i), "dictionaryWithTargetPath:", v4, (void)v42);
          [v34 addObject:v40];
        }
        uint64_t v37 = [(NSArray *)v35 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v37);
    }

    [v5 setObject:v34 forKeyedSubscript:@"shaders"];
  }
  if ([(NSArray *)self->_palettesDescriptions count]) {
    [v5 setObject:self->_palettesDescriptions forKeyedSubscript:@"palettes"];
  }

  return v5;
}

- (SCNNode)node
{
  return self->_node;
}

- (NSString)originalName
{
  return self->_originalName;
}

- (void)setOriginalName:(id)a3
{
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)orientToCamera
{
  return self->_orientToCamera;
}

- (BOOL)renderLast
{
  return self->_renderLast;
}

- (NSArray)palettesDescriptions
{
  return self->_palettesDescriptions;
}

- (NSArray)shaderModifiers
{
  return self->_shaderModifiers;
}

- (void)setShaderModifiers:(id)a3
{
}

- (NSArray)adjustments
{
  return self->_adjustments;
}

- (__n128)position
{
  return a1[5];
}

- (__n128)scale
{
  return a1[6];
}

- (__n128)rotation
{
  return a1[7];
}

- (double)opacity
{
  return self->_opacity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adjustments, 0);
  objc_storeStrong((id *)&self->_shaderModifiers, 0);
  objc_storeStrong((id *)&self->_palettesDescriptions, 0);
  objc_storeStrong((id *)&self->_originalName, 0);
  objc_storeStrong((id *)&self->_node, 0);
}

+ (void)propFromDictionary:(NSObject *)a3 assetsPath:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  double v5 = [a2 description];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_20B819000, a3, OS_LOG_TYPE_ERROR, "Error: could not load sticker scene prop at %@ with error: %@", (uint8_t *)&v6, 0x16u);
}

@end