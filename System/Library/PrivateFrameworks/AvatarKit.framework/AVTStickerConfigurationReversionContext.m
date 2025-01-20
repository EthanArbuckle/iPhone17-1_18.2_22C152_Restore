@interface AVTStickerConfigurationReversionContext
- (AVTStickerConfigurationReversionContext)init;
- (void)resetForAvatar:(id)a3;
- (void)revertChangesWithScope:(unint64_t)a3 animationDuration:(double)a4;
- (void)saveCustomMaterialPropertyNamed:(id)a3 forMaterial:(id)a4;
- (void)saveExtraCameraNode:(id)a3;
- (void)saveExtraPropsNode:(id)a3;
- (void)saveMorpherOverride:(id)a3;
- (void)savePresetOverride:(id)a3;
- (void)saveShaderModifiers:(id)a3 forMaterial:(id)a4;
- (void)saveShowMemojiBody:(BOOL)a3;
- (void)saveSingleSidedForMaterial:(id)a3;
- (void)saveUpdatePointOfViewFromFramingModeInEnvironment:(id)a3;
@end

@implementation AVTStickerConfigurationReversionContext

- (AVTStickerConfigurationReversionContext)init
{
  v14.receiver = self;
  v14.super_class = (Class)AVTStickerConfigurationReversionContext;
  v2 = [(AVTStickerConfigurationReversionContext *)&v14 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    presetOverrides = v2->_presetOverrides;
    v2->_presetOverrides = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    morpherOverrides = v2->_morpherOverrides;
    v2->_morpherOverrides = v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:0 capacity:0];
    shaderModifiers = v2->_shaderModifiers;
    v2->_shaderModifiers = (NSMapTable *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:0 capacity:0];
    customMaterialProperties = v2->_customMaterialProperties;
    v2->_customMaterialProperties = (NSMapTable *)v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    singleSidedMaterials = v2->_singleSidedMaterials;
    v2->_singleSidedMaterials = v11;
  }
  return v2;
}

- (void)resetForAvatar:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_avatar, a3);
  if ([(NSMutableArray *)self->_presetOverrides count])
  {
    v6 = avt_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[AVTStickerConfigurationReversionContext resetForAvatar:].cold.7(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  if ([(NSMutableArray *)self->_morpherOverrides count])
  {
    objc_super v14 = avt_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[AVTStickerConfigurationReversionContext resetForAvatar:].cold.6(v14, v15, v16, v17, v18, v19, v20, v21);
    }
  }
  if ([(NSMapTable *)self->_shaderModifiers count])
  {
    v22 = avt_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[AVTStickerConfigurationReversionContext resetForAvatar:].cold.5(v22, v23, v24, v25, v26, v27, v28, v29);
    }
  }
  if ([(NSMapTable *)self->_customMaterialProperties count])
  {
    v30 = avt_default_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[AVTStickerConfigurationReversionContext resetForAvatar:].cold.4(v30, v31, v32, v33, v34, v35, v36, v37);
    }
  }
  if ([(NSMutableArray *)self->_singleSidedMaterials count])
  {
    v38 = avt_default_log();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      -[AVTStickerConfigurationReversionContext resetForAvatar:](v38, v39, v40, v41, v42, v43, v44, v45);
    }
  }
  [(NSMutableArray *)self->_presetOverrides removeAllObjects];
  [(NSMutableArray *)self->_morpherOverrides removeAllObjects];
  [(NSMapTable *)self->_shaderModifiers removeAllObjects];
  [(NSMapTable *)self->_customMaterialProperties removeAllObjects];
  [(NSMutableArray *)self->_singleSidedMaterials removeAllObjects];
  if (self->_extraCameraNode)
  {
    v46 = avt_default_log();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      -[AVTStickerConfigurationReversionContext resetForAvatar:](v46, v47, v48, v49, v50, v51, v52, v53);
    }
  }
  if (self->_extraPropsNode)
  {
    v54 = avt_default_log();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
      -[AVTStickerConfigurationReversionContext resetForAvatar:](v54, v55, v56, v57, v58, v59, v60, v61);
    }
  }
  extraCameraNode = self->_extraCameraNode;
  self->_extraCameraNode = 0;

  extraPropsNode = self->_extraPropsNode;
  self->_extraPropsNode = 0;

  showMemojiBody = self->_showMemojiBody;
  self->_showMemojiBody = 0;

  objc_storeWeak((id *)&self->_environmentForPointOfViewUpdateFromFramingMode, 0);
}

- (void)savePresetOverride:(id)a3
{
}

- (void)saveMorpherOverride:(id)a3
{
}

- (void)saveShaderModifiers:(id)a3 forMaterial:(id)a4
{
  shaderModifiers = self->_shaderModifiers;
  if (a3)
  {
    id v8 = a4;
    NSMapInsertIfAbsent(shaderModifiers, v8, a3);
  }
  else
  {
    v6 = (void *)MEMORY[0x263EFF9D0];
    id v7 = a4;
    id v8 = [v6 null];
    NSMapInsertIfAbsent(shaderModifiers, v7, v8);
  }
}

- (void)saveCustomMaterialPropertyNamed:(id)a3 forMaterial:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [(NSMapTable *)self->_customMaterialProperties objectForKey:v6];
  if (!v7)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:1];
    [(NSMapTable *)self->_customMaterialProperties setObject:v7 forKey:v6];
  }
  id v8 = [v7 objectForKeyedSubscript:v11];

  if (!v8)
  {
    uint64_t v9 = [v6 valueForKey:v11];
    if (v9)
    {
      [v7 setObject:v9 forKeyedSubscript:v11];
    }
    else
    {
      uint64_t v10 = [MEMORY[0x263EFF9D0] null];
      [v7 setObject:v10 forKeyedSubscript:v11];
    }
  }
}

- (void)saveSingleSidedForMaterial:(id)a3
{
}

- (void)saveShowMemojiBody:(BOOL)a3
{
  v4 = [NSNumber numberWithBool:a3];
  showMemojiBody = self->_showMemojiBody;
  self->_showMemojiBody = v4;
  MEMORY[0x270F9A758](v4, showMemojiBody);
}

- (void)saveExtraCameraNode:(id)a3
{
  v4 = (SCNNode *)a3;
  if (self->_extraCameraNode)
  {
    id v5 = avt_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[AVTStickerConfigurationReversionContext saveExtraCameraNode:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  extraCameraNode = self->_extraCameraNode;
  self->_extraCameraNode = v4;
}

- (void)saveExtraPropsNode:(id)a3
{
  v4 = (SCNNode *)a3;
  if (self->_extraPropsNode)
  {
    id v5 = avt_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[AVTStickerConfigurationReversionContext saveExtraPropsNode:](v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  extraPropsNode = self->_extraPropsNode;
  self->_extraPropsNode = v4;
}

- (void)saveUpdatePointOfViewFromFramingModeInEnvironment:(id)a3
{
}

- (void)revertChangesWithScope:(unint64_t)a3 animationDuration:(double)a4
{
  uint64_t v78 = *MEMORY[0x263EF8340];
  if (a4 > 0.0)
  {
    [MEMORY[0x263F16B08] begin];
    [MEMORY[0x263F16B08] setAnimationDuration:a4];
    uint64_t v7 = (void *)MEMORY[0x263F16B08];
    uint64_t v8 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
    [v7 setAnimationTimingFunction:v8];
  }
  if (a3 != 1)
  {
    if (a3) {
      goto LABEL_53;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_environmentForPointOfViewUpdateFromFramingMode);

    if (WeakRetained)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_environmentForPointOfViewUpdateFromFramingMode);
      uint64_t v11 = [v10 currentPointOfView];
      extraCameraNode = self->_extraCameraNode;

      if (v11 == extraCameraNode)
      {
        id v13 = objc_loadWeakRetained((id *)&self->_environmentForPointOfViewUpdateFromFramingMode);
        [v13 updatePointOfViewFromFramingMode];
      }
      objc_storeWeak((id *)&self->_environmentForPointOfViewUpdateFromFramingMode, 0);
    }
    [(SCNNode *)self->_extraCameraNode removeFromParentNode];
    objc_super v14 = self->_extraCameraNode;
    self->_extraCameraNode = 0;
  }
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  uint64_t v15 = self->_morpherOverrides;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v69 objects:v77 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v70 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        avatar = self->_avatar;
        v22 = [(AVTAvatar *)avatar avatarNode];
        [v20 applyToAvatar:avatar inHierarchy:v22 reversionContext:0];
      }
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v69 objects:v77 count:16];
    }
    while (v17);
  }

  [(NSMutableArray *)self->_morpherOverrides removeAllObjects];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v23 = self->_presetOverrides;
  uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v65 objects:v76 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v66;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v66 != v26) {
          objc_enumerationMutation(v23);
        }
        [*(id *)(*((void *)&v65 + 1) + 8 * j) applyToAvatar:self->_avatar reversionContext:0];
      }
      uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v65 objects:v76 count:16];
    }
    while (v25);
  }

  [(NSMutableArray *)self->_presetOverrides removeAllObjects];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  uint64_t v28 = [(NSMapTable *)self->_shaderModifiers keyEnumerator];
  uint64_t v29 = [v28 countByEnumeratingWithState:&v61 objects:v75 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v62;
    do
    {
      for (uint64_t k = 0; k != v30; ++k)
      {
        if (*(void *)v62 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v33 = *(void **)(*((void *)&v61 + 1) + 8 * k);
        uint64_t v34 = [(NSMapTable *)self->_shaderModifiers objectForKey:v33];
        uint64_t v35 = [MEMORY[0x263EFF9D0] null];
        int v36 = [v34 isEqual:v35];

        if (v36)
        {

          uint64_t v34 = 0;
        }
        [v33 setShaderModifiers:v34];
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v61 objects:v75 count:16];
    }
    while (v30);
  }

  [(NSMapTable *)self->_shaderModifiers removeAllObjects];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  uint64_t v37 = [(NSMapTable *)self->_customMaterialProperties keyEnumerator];
  uint64_t v38 = [v37 countByEnumeratingWithState:&v57 objects:v74 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v58;
    do
    {
      for (uint64_t m = 0; m != v39; ++m)
      {
        if (*(void *)v58 != v40) {
          objc_enumerationMutation(v37);
        }
        uint64_t v42 = *(void *)(*((void *)&v57 + 1) + 8 * m);
        uint64_t v43 = [(NSMapTable *)self->_customMaterialProperties objectForKey:v42];
        v56[0] = MEMORY[0x263EF8330];
        v56[1] = 3221225472;
        v56[2] = __84__AVTStickerConfigurationReversionContext_revertChangesWithScope_animationDuration___block_invoke;
        v56[3] = &unk_264020818;
        v56[4] = v42;
        [v43 enumerateKeysAndObjectsUsingBlock:v56];
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v57 objects:v74 count:16];
    }
    while (v39);
  }

  [(NSMapTable *)self->_customMaterialProperties removeAllObjects];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v44 = self->_singleSidedMaterials;
  uint64_t v45 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v52 objects:v73 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v53;
    do
    {
      for (uint64_t n = 0; n != v46; ++n)
      {
        if (*(void *)v53 != v47) {
          objc_enumerationMutation(v44);
        }
        objc_msgSend(*(id *)(*((void *)&v52 + 1) + 8 * n), "setDoubleSided:", 0, (void)v52);
      }
      uint64_t v46 = [(NSMutableArray *)v44 countByEnumeratingWithState:&v52 objects:v73 count:16];
    }
    while (v46);
  }

  [(NSMutableArray *)self->_singleSidedMaterials removeAllObjects];
  if (self->_showMemojiBody)
  {
    uint64_t v49 = self->_avatar;
    if ([(NSNumber *)self->_showMemojiBody BOOLValue])
    {
      [(AVTAvatar *)v49 setShowsBody:1];
    }
    else
    {
      [(AVTAvatar *)v49 setShowsBody:0];
      [(AVTAvatar *)v49 setBodyPose:0];
    }
    showMemojiBody = self->_showMemojiBody;
    self->_showMemojiBody = 0;

    [(AVTAvatar *)v49 update];
  }
  [(SCNNode *)self->_extraPropsNode removeFromParentNode];
  extraPropsNode = self->_extraPropsNode;
  self->_extraPropsNode = 0;

LABEL_53:
  if (a4 > 0.0) {
    [MEMORY[0x263F16B08] commit];
  }
}

void __84__AVTStickerConfigurationReversionContext_revertChangesWithScope_animationDuration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x263EFF9D0] null];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {

    id v5 = 0;
  }
  [*(id *)(a1 + 32) setValue:v5 forKey:v8];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_environmentForPointOfViewUpdateFromFramingMode);
  objc_storeStrong((id *)&self->_showMemojiBody, 0);
  objc_storeStrong((id *)&self->_extraPropsNode, 0);
  objc_storeStrong((id *)&self->_extraCameraNode, 0);
  objc_storeStrong((id *)&self->_singleSidedMaterials, 0);
  objc_storeStrong((id *)&self->_customMaterialProperties, 0);
  objc_storeStrong((id *)&self->_shaderModifiers, 0);
  objc_storeStrong((id *)&self->_morpherOverrides, 0);
  objc_storeStrong((id *)&self->_presetOverrides, 0);
  objc_storeStrong((id *)&self->_avatar, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

- (void)resetForAvatar:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)resetForAvatar:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)resetForAvatar:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)resetForAvatar:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)resetForAvatar:(uint64_t)a3 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)resetForAvatar:(uint64_t)a3 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)resetForAvatar:(uint64_t)a3 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)saveExtraCameraNode:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)saveExtraPropsNode:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end