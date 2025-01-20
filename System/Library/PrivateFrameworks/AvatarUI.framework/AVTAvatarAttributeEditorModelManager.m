@interface AVTAvatarAttributeEditorModelManager
- (AVTAvatarAttributeEditorModelManager)initWithAvatarRecord:(id)a3;
- (AVTAvatarAttributeEditorModelManager)initWithAvatarRecord:(id)a3 coreModel:(id)a4 editorColorsState:(id)a5 imageProvider:(id)a6 colorLayerProvider:(id)a7 preloader:(id)a8 environment:(id)a9 stickerRenderer:(id)a10;
- (AVTAvatarAttributeEditorModelManager)initWithAvatarRecord:(id)a3 coreModel:(id)a4 imageProvider:(id)a5 colorLayerProvider:(id)a6 preloader:(id)a7 environment:(id)a8 stickerRenderer:(id)a9;
- (AVTAvatarAttributeEditorModelManagerDelegate)delegate;
- (AVTAvatarAttributeEditorPreloader)preloader;
- (AVTAvatarAttributeEditorState)editorState;
- (AVTAvatarConfiguration)avatarConfiguration;
- (AVTAvatarConfiguration)presetOverriddenConfiguration;
- (AVTAvatarEditorColorsState)colorsState;
- (AVTAvatarRecord)avatarRecord;
- (AVTColorLayerProvider)colorLayerProvider;
- (AVTCoreModel)coreModel;
- (AVTMemoji)avatar;
- (AVTPresetImageProvider)imageProvider;
- (AVTUIEnvironment)environment;
- (AVTUILogger)logger;
- (AVTUIStickerRenderer)stickerRenderer;
- (BOOL)primaryColorOfCategory:(int64_t)a3 doesMatchColorOfDependentCategory:(int64_t)a4;
- (BOOL)shouldDisplaySectionForCategory:(int64_t)a3;
- (BOOL)shouldDisplaySectionWithDisplayCondition:(id)a3 inCategoryAtIndex:(unint64_t)a4;
- (id)buildInitialEditorState;
- (id)buildUIModel;
- (id)buildUIModelWithSelectedCategory:(id)a3 atIndex:(unint64_t)a4;
- (void)applyConfigurationToAvatar:(id)a3 animated:(BOOL)a4;
- (void)applyPairColorUpdateIfNeeded:(id)a3 forCategoryRight:(int64_t)a4 categoryLeft:(int64_t)a5;
- (void)applyPairColorUpdatesIfNeeded:(id)a3;
- (void)buildIntitialColorsState;
- (void)flushResourcesForEnteringBackground;
- (void)loadResourcesIfNeeded;
- (void)setAvatar:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInitialColorStateForColorPicker:(id)a3 forMulticolor:(BOOL)a4;
- (void)setLogger:(id)a3;
- (void)setPresetOverriddenConfiguration:(id)a3;
- (void)updateAvatarByApplyingPresetOverrides:(id)a3 animated:(BOOL)a4;
- (void)updateAvatarByDeletingSectionItems:(id)a3 animated:(BOOL)a4;
- (void)updateAvatarBySelectingSectionItem:(id)a3 animated:(BOOL)a4;
- (void)updateAvatarBySelectingSupplementalPickerItem:(id)a3 animated:(BOOL)a4;
- (void)updateAvatarRecordFromAvatar;
- (void)updateAvatarWithAvatarUpdater:(id)a3 animated:(BOOL)a4;
- (void)updateEditorStateBySelectingSectionItem:(id)a3 animated:(BOOL)a4;
@end

@implementation AVTAvatarAttributeEditorModelManager

- (AVTAvatarAttributeEditorModelManager)initWithAvatarRecord:(id)a3
{
  id v4 = a3;
  v5 = +[AVTUIEnvironment defaultEnvironment];
  v6 = [v5 editorCoreModel];
  v7 = objc_alloc_init(AVTColorLayerProvider);
  v8 = [(AVTAvatarAttributeEditorModelManager *)self initWithAvatarRecord:v4 coreModel:v6 imageProvider:0 colorLayerProvider:v7 preloader:0 environment:v5 stickerRenderer:0];

  return v8;
}

- (AVTAvatarAttributeEditorModelManager)initWithAvatarRecord:(id)a3 coreModel:(id)a4 imageProvider:(id)a5 colorLayerProvider:(id)a6 preloader:(id)a7 environment:(id)a8 stickerRenderer:(id)a9
{
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  v22 = [AVTAvatarEditorColorsState alloc];
  v23 = [v20 colors];
  v24 = [v23 variationStore];
  v25 = [(AVTAvatarEditorColorsState *)v22 initWithVariationStore:v24];

  v26 = [(AVTAvatarAttributeEditorModelManager *)self initWithAvatarRecord:v21 coreModel:v20 editorColorsState:v25 imageProvider:v19 colorLayerProvider:v18 preloader:v17 environment:v16 stickerRenderer:v15];
  return v26;
}

- (AVTAvatarAttributeEditorModelManager)initWithAvatarRecord:(id)a3 coreModel:(id)a4 editorColorsState:(id)a5 imageProvider:(id)a6 colorLayerProvider:(id)a7 preloader:(id)a8 environment:(id)a9 stickerRenderer:(id)a10
{
  id v16 = a3;
  id v36 = a4;
  id v35 = a5;
  id v34 = a6;
  id v33 = a7;
  id v32 = a8;
  id v17 = a9;
  id v31 = a10;
  v37.receiver = self;
  v37.super_class = (Class)AVTAvatarAttributeEditorModelManager;
  id v18 = [(AVTAvatarAttributeEditorModelManager *)&v37 init];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_environment, a9);
    objc_storeStrong((id *)&v19->_coreModel, a4);
    objc_storeStrong((id *)&v19->_colorsState, a5);
    uint64_t v20 = [v16 copy];
    avatarRecord = v19->_avatarRecord;
    v19->_avatarRecord = (AVTAvatarRecord *)v20;

    uint64_t v22 = [MEMORY[0x263F29730] memojiForRecord:v16 usageIntent:4];
    avatar = v19->_avatar;
    v19->_avatar = (AVTMemoji *)v22;

    uint64_t v24 = +[AVTAvatarConfiguration configurationFromAvatar:v19->_avatar coreModel:v36];
    avatarConfiguration = v19->_avatarConfiguration;
    v19->_avatarConfiguration = (AVTAvatarConfiguration *)v24;

    objc_storeStrong((id *)&v19->_imageProvider, a6);
    objc_storeStrong((id *)&v19->_colorLayerProvider, a7);
    objc_storeStrong((id *)&v19->_stickerRenderer, a10);
    objc_storeStrong((id *)&v19->_preloader, a8);
    uint64_t v26 = [v17 logger];
    logger = v19->_logger;
    v19->_logger = (AVTUILogger *)v26;

    uint64_t v28 = [(AVTAvatarAttributeEditorModelManager *)v19 buildInitialEditorState];
    editorState = v19->_editorState;
    v19->_editorState = (AVTAvatarAttributeEditorState *)v28;

    [(AVTAvatarAttributeEditorModelManager *)v19 buildIntitialColorsState];
  }

  return v19;
}

- (AVTMemoji)avatar
{
  [(AVTAvatarAttributeEditorModelManager *)self loadResourcesIfNeeded];
  avatar = self->_avatar;
  return avatar;
}

- (void)flushResourcesForEnteringBackground
{
  avatar = self->_avatar;
  self->_avatar = 0;

  id v4 = [(AVTAvatarAttributeEditorModelManager *)self environment];
  [v4 flushResourcesForEnteringBackground];
}

- (void)loadResourcesIfNeeded
{
  if (!self->_avatar)
  {
    v3 = (void *)MEMORY[0x263F29730];
    id v4 = [(AVTAvatarAttributeEditorModelManager *)self avatarRecord];
    v5 = [v3 memojiForRecord:v4 usageIntent:4];

    v6 = [(AVTAvatarAttributeEditorModelManager *)self avatarConfiguration];
    [v6 applyToAvatar:v5 animated:0];

    avatar = self->_avatar;
    self->_avatar = v5;
  }
}

- (void)buildIntitialColorsState
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v3 = [(AVTAvatarAttributeEditorModelManager *)self coreModel];
  id v4 = [v3 groups];

  id obj = v4;
  uint64_t v22 = [v4 countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v42;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v42 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = v5;
        v6 = *(void **)(*((void *)&v41 + 1) + 8 * v5);
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v24 = [v6 categories];
        uint64_t v26 = [v24 countByEnumeratingWithState:&v37 objects:v47 count:16];
        if (v26)
        {
          uint64_t v25 = *(void *)v38;
          do
          {
            uint64_t v7 = 0;
            do
            {
              if (*(void *)v38 != v25) {
                objc_enumerationMutation(v24);
              }
              uint64_t v27 = v7;
              v8 = *(void **)(*((void *)&v37 + 1) + 8 * v7);
              long long v33 = 0u;
              long long v34 = 0u;
              long long v35 = 0u;
              long long v36 = 0u;
              id v28 = [v8 pickers];
              uint64_t v9 = [v28 countByEnumeratingWithState:&v33 objects:v46 count:16];
              if (v9)
              {
                uint64_t v10 = v9;
                uint64_t v11 = *(void *)v34;
                do
                {
                  uint64_t v12 = 0;
                  do
                  {
                    if (*(void *)v34 != v11) {
                      objc_enumerationMutation(v28);
                    }
                    v13 = *(void **)(*((void *)&v33 + 1) + 8 * v12);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      id v14 = v13;
                      long long v29 = 0u;
                      long long v30 = 0u;
                      long long v31 = 0u;
                      long long v32 = 0u;
                      id v15 = [v14 subpickers];
                      uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v45 count:16];
                      if (v16)
                      {
                        uint64_t v17 = v16;
                        uint64_t v18 = *(void *)v30;
                        do
                        {
                          uint64_t v19 = 0;
                          do
                          {
                            if (*(void *)v30 != v18) {
                              objc_enumerationMutation(v15);
                            }
                            [(AVTAvatarAttributeEditorModelManager *)self setInitialColorStateForColorPicker:*(void *)(*((void *)&v29 + 1) + 8 * v19++) forMulticolor:1];
                          }
                          while (v17 != v19);
                          uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v45 count:16];
                        }
                        while (v17);
                      }
                    }
                    else
                    {
                      objc_opt_class();
                      if (objc_opt_isKindOfClass()) {
                        [(AVTAvatarAttributeEditorModelManager *)self setInitialColorStateForColorPicker:v13 forMulticolor:0];
                      }
                    }
                    ++v12;
                  }
                  while (v12 != v10);
                  uint64_t v10 = [v28 countByEnumeratingWithState:&v33 objects:v46 count:16];
                }
                while (v10);
              }

              uint64_t v7 = v27 + 1;
            }
            while (v27 + 1 != v26);
            uint64_t v26 = [v24 countByEnumeratingWithState:&v37 objects:v47 count:16];
          }
          while (v26);
        }

        uint64_t v5 = v23 + 1;
      }
      while (v23 + 1 != v22);
      uint64_t v22 = [obj countByEnumeratingWithState:&v41 objects:v48 count:16];
    }
    while (v22);
  }
}

- (BOOL)primaryColorOfCategory:(int64_t)a3 doesMatchColorOfDependentCategory:(int64_t)a4
{
  uint64_t v7 = [(AVTAvatarAttributeEditorModelManager *)self avatarConfiguration];
  v8 = objc_msgSend(v7, "colorPresetForSettingKind:", 1, a3);

  uint64_t v9 = [(AVTAvatarAttributeEditorModelManager *)self avatarConfiguration];
  uint64_t v10 = objc_msgSend(v9, "colorPresetForSettingKind:", 1, a4);

  uint64_t v11 = [v8 colorPreset];
  uint64_t v12 = [v11 name];
  v13 = [v10 colorPreset];
  id v14 = [v13 name];
  if ([v12 isEqualToString:v14])
  {
    id v15 = [v8 colorPreset];
    [v15 variation];
    float v17 = v16;
    uint64_t v18 = [v10 colorPreset];
    [v18 variation];
    BOOL v20 = v17 == v19;
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (void)setInitialColorStateForColorPicker:(id)a3 forMulticolor:(BOOL)a4
{
  BOOL v4 = a4;
  id v15 = a3;
  BOOL v6 = [v15 colorCategory] == 15
    && [(AVTAvatarAttributeEditorModelManager *)self primaryColorOfCategory:1 doesMatchColorOfDependentCategory:15];
  if ([v15 colorCategory] == 16)
  {
    BOOL v7 = [(AVTAvatarAttributeEditorModelManager *)self primaryColorOfCategory:2 doesMatchColorOfDependentCategory:16];
    if (!v4) {
      goto LABEL_9;
    }
LABEL_8:
    if (v6 || v7) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  BOOL v7 = 0;
  if (v4) {
    goto LABEL_8;
  }
LABEL_9:
  uint64_t v8 = [v15 destination];
  uint64_t v9 = [v15 colorCategory];
  uint64_t v10 = [(AVTAvatarAttributeEditorModelManager *)self avatarConfiguration];
  uint64_t v11 = objc_msgSend(v10, "colorPresetForSettingKind:", v8, v9);

  uint64_t v12 = [(AVTAvatarAttributeEditorModelManager *)self colorsState];
  v13 = [v11 colorPreset];
  id v14 = [v11 color];
  [v12 setSelectedColorPreset:v13 forCoreModelColor:v14];

LABEL_10:
}

- (id)buildUIModel
{
  return [(AVTAvatarAttributeEditorModelManager *)self buildUIModelWithSelectedCategory:0 atIndex:0x7FFFFFFFFFFFFFFFLL];
}

- (id)buildUIModelWithSelectedCategory:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  BOOL v7 = [(AVTAvatarAttributeEditorModelManager *)self coreModel];
  uint64_t v8 = [(AVTAvatarAttributeEditorModelManager *)self avatarConfiguration];
  uint64_t v9 = [(AVTAvatarAttributeEditorModelManager *)self imageProvider];
  uint64_t v10 = [(AVTAvatarAttributeEditorModelManager *)self colorLayerProvider];
  uint64_t v11 = [(AVTAvatarAttributeEditorModelManager *)self stickerRenderer];
  uint64_t v12 = +[AVTAvatarAttributeEditorModelBuilder buildDataSourceCategoriesFromCoreModel:v7 selectingFromAvatarConfiguration:v8 imageProvider:v9 colorLayerProvider:v10 stickerRenderer:v11 modelManager:self withSelectedCategory:v6 atIndex:a4];

  return v12;
}

- (id)buildInitialEditorState
{
  v3 = [(AVTAvatarAttributeEditorModelManager *)self coreModel];
  BOOL v4 = [(AVTAvatarAttributeEditorModelManager *)self avatarConfiguration];
  uint64_t v5 = +[AVTAvatarAttributeEditorState buildStateFromCoreModel:v3 avatarConfiguration:v4];

  return v5;
}

- (void)updateAvatarRecordFromAvatar
{
  v3 = [(AVTAvatarAttributeEditorModelManager *)self avatar];
  id v5 = [v3 dataRepresentation];

  if (!v5) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Can't encode avatar"];
  }
  BOOL v4 = [(AVTAvatarAttributeEditorModelManager *)self avatarRecord];
  [v4 setAvatarData:v5];
}

- (void)updateEditorStateBySelectingSectionItem:(id)a3 animated:(BOOL)a4
{
  id v13 = a3;
  uint64_t v5 = [v13 conformsToProtocol:&unk_26BF94248];
  id v6 = v13;
  if (v5)
  {
    id v7 = v13;
    uint64_t v8 = [v7 editorStateUpdater];
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      uint64_t v10 = [(AVTAvatarAttributeEditorModelManager *)self editorState];

      if (v10)
      {
        uint64_t v11 = [v7 editorStateUpdater];
        uint64_t v12 = [(AVTAvatarAttributeEditorModelManager *)self editorState];
        ((void (**)(void, void *))v11)[2](v11, v12);
      }
    }

    id v6 = v13;
  }
  MEMORY[0x270F9A758](v5, v6);
}

- (void)updateAvatarBySelectingSectionItem:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if ([v7 conformsToProtocol:&unk_26BF63C38])
  {
    id v6 = [v7 avatarUpdater];
    [(AVTAvatarAttributeEditorModelManager *)self updateAvatarWithAvatarUpdater:v6 animated:v4];
  }
}

- (void)updateAvatarByDeletingSectionItems:(id)a3 animated:(BOOL)a4
{
  BOOL v17 = a4;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [MEMORY[0x263EFF940] raise:@"AVTTypeMismatchException", @"Unexpected object class for %@", v11 format];
        }
        id v12 = v11;
        id v13 = [v12 removalUpdater];

        if (v13)
        {
          id v14 = [v12 removalUpdater];
          id v15 = (void *)MEMORY[0x210530210]();
          [v5 addObject:v15];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  float v16 = +[AVTAvatarUpdaterFactory updaterForAggregatingUpdaters:v5];
  [(AVTAvatarAttributeEditorModelManager *)self updateAvatarWithAvatarUpdater:v16 animated:v17];
  [(AVTAvatarAttributeEditorModelManager *)self updateAvatarRecordFromAvatar];
}

- (void)updateAvatarBySelectingSupplementalPickerItem:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v13 = a3;
  uint64_t v6 = [v13 editorUpdater];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    uint64_t v8 = [(AVTAvatarAttributeEditorModelManager *)self editorState];

    if (v8)
    {
      uint64_t v9 = [v13 editorUpdater];
      uint64_t v10 = [(AVTAvatarAttributeEditorModelManager *)self editorState];
      ((void (**)(void, void *))v9)[2](v9, v10);
    }
  }
  uint64_t v11 = [v13 avatarUpdater];

  if (v11)
  {
    id v12 = [v13 avatarUpdater];
    [(AVTAvatarAttributeEditorModelManager *)self updateAvatarWithAvatarUpdater:v12 animated:v4];
  }
}

- (void)updateAvatarWithAvatarUpdater:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = (void (**)(id, void *))a3;
  if (v6)
  {
    id v12 = v6;
    uint64_t v7 = [(AVTAvatarAttributeEditorModelManager *)self avatarConfiguration];
    uint64_t v8 = [(AVTAvatarAttributeEditorModelManager *)self avatarConfiguration];
    v12[2](v12, v8);

    uint64_t v9 = [(AVTAvatarAttributeEditorModelManager *)self presetOverriddenConfiguration];

    if (v9)
    {
      uint64_t v10 = [(AVTAvatarAttributeEditorModelManager *)self presetOverriddenConfiguration];

      uint64_t v11 = [(AVTAvatarAttributeEditorModelManager *)self presetOverriddenConfiguration];
      v12[2](v12, v11);

      uint64_t v7 = (void *)v10;
    }
    [(AVTAvatarAttributeEditorModelManager *)self applyConfigurationToAvatar:v7 animated:v4];
    [(AVTAvatarAttributeEditorModelManager *)self updateAvatarRecordFromAvatar];

    uint64_t v6 = v12;
  }
}

- (void)updateAvatarByApplyingPresetOverrides:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = [(AVTAvatarAttributeEditorModelManager *)self avatarConfiguration];
    uint64_t v8 = (void *)[v7 copy];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(v8, "addPreset:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }

    [(AVTAvatarAttributeEditorModelManager *)self setPresetOverriddenConfiguration:v8];
    id v14 = [(AVTAvatarAttributeEditorModelManager *)self presetOverriddenConfiguration];
    [(AVTAvatarAttributeEditorModelManager *)self applyConfigurationToAvatar:v14 animated:v4];
  }
  else
  {
    [(AVTAvatarAttributeEditorModelManager *)self setPresetOverriddenConfiguration:0];
    id v15 = [(AVTAvatarAttributeEditorModelManager *)self avatarConfiguration];
    [(AVTAvatarAttributeEditorModelManager *)self applyConfigurationToAvatar:v15 animated:1];

    [(AVTAvatarAttributeEditorModelManager *)self updateAvatarRecordFromAvatar];
  }
}

- (void)applyPairColorUpdateIfNeeded:(id)a3 forCategoryRight:(int64_t)a4 categoryLeft:(int64_t)a5
{
  id v8 = a3;
  uint64_t v9 = AVTAvatarSettingColorIndexForColorDestination(1);
  uint64_t v10 = [(AVTAvatarAttributeEditorModelManager *)self avatar];
  uint64_t v32 = [v10 colorPresetForCategory:a4 colorIndex:v9];

  uint64_t v11 = [(AVTAvatarAttributeEditorModelManager *)self avatar];
  uint64_t v12 = [v11 colorPresetForCategory:a5 colorIndex:v9];

  id v13 = objc_msgSend(v8, "colorPresetForSettingKind:", 1, a4);
  uint64_t v14 = [v13 colorPreset];

  id v15 = objc_msgSend(v8, "colorPresetForSettingKind:", 1, a5);

  uint64_t v16 = [v15 colorPreset];

  if (v14 | v32)
  {
    long long v17 = [(id)v14 name];
    long long v18 = [(id)v32 name];
    if ([v17 isEqualToString:v18]
      && ([(id)v14 variation], float v20 = v19, objc_msgSend((id)v32, "variation"), v20 == v21)
      || !(v16 | v12))
    {
    }
    else
    {
      uint64_t v22 = [(id)v16 name];
      uint64_t v23 = [(id)v12 name];
      long long v31 = (void *)v22;
      uint64_t v24 = (void *)v22;
      uint64_t v25 = (void *)v23;
      if ([v24 isEqualToString:v23])
      {
        [(id)v16 variation];
        float v27 = v26;
        [(id)v12 variation];
        float v29 = v28;

        if (v27 == v29) {
          goto LABEL_12;
        }
      }
      else
      {
      }
      long long v30 = [(AVTAvatarAttributeEditorModelManager *)self avatar];
      [v30 setColorPreset:v14 forCategory:a4 colorIndex:v9];

      long long v17 = [(AVTAvatarAttributeEditorModelManager *)self avatar];
      [v17 setColorPreset:v16 forCategory:a5 colorIndex:v9];
    }
  }
LABEL_12:
}

- (void)applyPairColorUpdatesIfNeeded:(id)a3
{
  id v4 = a3;
  [(AVTAvatarAttributeEditorModelManager *)self applyPairColorUpdateIfNeeded:v4 forCategoryRight:31 categoryLeft:30];
  [(AVTAvatarAttributeEditorModelManager *)self applyPairColorUpdateIfNeeded:v4 forCategoryRight:26 categoryLeft:25];
}

- (void)applyConfigurationToAvatar:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(AVTAvatarAttributeEditorModelManager *)self applyPairColorUpdatesIfNeeded:v6];
  uint64_t v7 = [(AVTAvatarAttributeEditorModelManager *)self logger];
  id v8 = [v6 description];
  [v7 logUpdatingLiveAvatarWithConfiguration:v8];

  id v9 = [(AVTAvatarAttributeEditorModelManager *)self avatar];
  [v6 applyToAvatar:v9 animated:v4];
}

- (BOOL)shouldDisplaySectionForCategory:(int64_t)a3
{
  uint64_t v5 = [(AVTAvatarAttributeEditorModelManager *)self editorState];
  char v6 = [v5 isCategoryPaired:a3];

  uint64_t v7 = [(AVTAvatarAttributeEditorModelManager *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v8 = [(AVTAvatarAttributeEditorModelManager *)self delegate];
    char v9 = [v8 shouldDisplaySectionForCategory:a3];
  }
  else
  {
    char v9 = 1;
  }

  return v9 & ~v6;
}

- (BOOL)shouldDisplaySectionWithDisplayCondition:(id)a3 inCategoryAtIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(AVTAvatarAttributeEditorModelManager *)self delegate];
  char v8 = [v7 conformsToProtocol:&unk_26BF792E0];

  if ((v8 & 1) == 0)
  {
    char v9 = (void *)MEMORY[0x263EFF940];
    uint64_t v10 = [(AVTAvatarAttributeEditorModelManager *)self delegate];
    [v9 raise:@"AVTTypeMismatchException", @"Unexpected object protocol for %@", v10 format];
  }
  uint64_t v11 = [(AVTAvatarAttributeEditorModelManager *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v12 = [v11 shouldDisplaySectionWithDisplayCondition:v6 inCategoryAtIndex:a4];
  }
  else {
    char v12 = 1;
  }

  return v12;
}

- (void)setAvatar:(id)a3
{
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (AVTAvatarEditorColorsState)colorsState
{
  return self->_colorsState;
}

- (AVTAvatarAttributeEditorState)editorState
{
  return self->_editorState;
}

- (AVTAvatarAttributeEditorModelManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AVTAvatarAttributeEditorModelManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AVTAvatarConfiguration)presetOverriddenConfiguration
{
  return self->_presetOverriddenConfiguration;
}

- (void)setPresetOverriddenConfiguration:(id)a3
{
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTCoreModel)coreModel
{
  return self->_coreModel;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
}

- (AVTAvatarConfiguration)avatarConfiguration
{
  return self->_avatarConfiguration;
}

- (AVTPresetImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (AVTColorLayerProvider)colorLayerProvider
{
  return self->_colorLayerProvider;
}

- (AVTUIStickerRenderer)stickerRenderer
{
  return self->_stickerRenderer;
}

- (AVTAvatarAttributeEditorPreloader)preloader
{
  return self->_preloader;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preloader, 0);
  objc_storeStrong((id *)&self->_stickerRenderer, 0);
  objc_storeStrong((id *)&self->_colorLayerProvider, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_avatarConfiguration, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_coreModel, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_presetOverriddenConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_editorState, 0);
  objc_storeStrong((id *)&self->_colorsState, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
  objc_storeStrong((id *)&self->_avatar, 0);
}

@end