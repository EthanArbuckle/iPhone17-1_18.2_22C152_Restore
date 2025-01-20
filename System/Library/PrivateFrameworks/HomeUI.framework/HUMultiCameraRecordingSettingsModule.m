@interface HUMultiCameraRecordingSettingsModule
- (BOOL)shouldShowFooterTitle;
- (HUMultiCameraRecordingSettingsModule)initWithItemUpdater:(id)a3 cameraProfiles:(id)a4 displayStyle:(unint64_t)a5;
- (id)buildSectionsWithDisplayedItems:(id)a3;
- (void)setShouldShowFooterTitle:(BOOL)a3;
@end

@implementation HUMultiCameraRecordingSettingsModule

- (HUMultiCameraRecordingSettingsModule)initWithItemUpdater:(id)a3 cameraProfiles:(id)a4 displayStyle:(unint64_t)a5
{
  v6.receiver = self;
  v6.super_class = (Class)HUMultiCameraRecordingSettingsModule;
  result = [(HUCameraRecordingSettingsModule *)&v6 initWithItemUpdater:a3 cameraProfiles:a4 displayStyle:a5];
  if (result) {
    result->_shouldShowFooterTitle = 0;
  }
  return result;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  objc_super v6 = [(HUCameraRecordingSettingsModule *)self expandableModules];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v24 + 1) + 8 * i) buildSectionsWithDisplayedItems:v4];
        v12 = objc_msgSend(v11, "na_flatMap:", &__block_literal_global_231);
        [v5 addObjectsFromArray:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v8);
  }

  if ([(HUCameraRecordingSettingsModule *)self displayStyle] == 3)
  {
    v13 = [(HUCameraRecordingSettingsModule *)self recordingOptionsItem];
    [v5 addObject:v13];
  }
  v14 = [(HUCameraRecordingSettingsModule *)self cameraProfiles];
  v15 = [v14 anyObject];
  v16 = [v15 accessory];
  v17 = [v16 name];

  v18 = (void *)[objc_alloc(MEMORY[0x1E4F692E8]) initWithIdentifier:v17];
  [v18 setItems:v5];
  [v18 setHeaderTitle:v17];
  if ([(HUMultiCameraRecordingSettingsModule *)self shouldShowFooterTitle])
  {
    v19 = [(HUCameraRecordingSettingsModule *)self _attributedFooterTitle];
    [v18 setAttributedFooterTitle:v19];
  }
  v20 = (void *)MEMORY[0x1E4F69220];
  v28 = v18;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
  v22 = [v20 filterSections:v21 toDisplayedItems:v4];

  return v22;
}

uint64_t __72__HUMultiCameraRecordingSettingsModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  return [a2 items];
}

- (BOOL)shouldShowFooterTitle
{
  return self->_shouldShowFooterTitle;
}

- (void)setShouldShowFooterTitle:(BOOL)a3
{
  self->_shouldShowFooterTitle = a3;
}

@end