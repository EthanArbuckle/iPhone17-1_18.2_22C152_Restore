@interface AVTAvatarAttributeEditorCategory
- (AVTAvatarAttributeEditorCategory)initWithSectionProviders:(id)a3 localizedName:(id)a4 previewMode:(id)a5 modelGroup:(id)a6 symbolNames:(id)a7;
- (AVTAvatarAttributeEditorPreviewMode)previewMode;
- (AVTCoreModelGroup)modelGroup;
- (NSArray)sectionProviders;
- (NSArray)sections;
- (NSDictionary)symbolNames;
- (NSString)description;
- (NSString)localizedName;
- (id)representedAVTPresetResources;
- (id)symbolNameProvider;
@end

@implementation AVTAvatarAttributeEditorCategory

- (AVTAvatarAttributeEditorCategory)initWithSectionProviders:(id)a3 localizedName:(id)a4 previewMode:(id)a5 modelGroup:(id)a6 symbolNames:(id)a7
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v41.receiver = self;
  v41.super_class = (Class)AVTAvatarAttributeEditorCategory;
  v17 = [(AVTAvatarAttributeEditorCategory *)&v41 init];
  if (v17)
  {
    id v32 = v16;
    id v33 = v15;
    id v34 = v14;
    id obj = a7;
    v36 = v13;
    uint64_t v18 = [v12 copy];
    sectionProviders = v17->_sectionProviders;
    v17->_sectionProviders = (NSArray *)v18;

    v20 = [MEMORY[0x263EFF980] array];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v21 = v12;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v38;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v38 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = [*(id *)(*((void *)&v37 + 1) + 8 * v25) sections];
          [v20 addObjectsFromArray:v26];

          ++v25;
        }
        while (v23 != v25);
        uint64_t v23 = [v21 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v23);
    }

    uint64_t v27 = [v20 copy];
    sections = v17->_sections;
    v17->_sections = (NSArray *)v27;

    id v13 = v36;
    uint64_t v29 = [v36 copy];
    localizedName = v17->_localizedName;
    v17->_localizedName = (NSString *)v29;

    objc_storeStrong((id *)&v17->_previewMode, a5);
    objc_storeStrong((id *)&v17->_modelGroup, a6);
    objc_storeStrong((id *)&v17->_symbolNames, obj);

    id v15 = v33;
    id v14 = v34;
    id v16 = v32;
  }

  return v17;
}

- (id)symbolNameProvider
{
  v2 = [(AVTAvatarAttributeEditorCategory *)self symbolNames];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__AVTAvatarAttributeEditorCategory_symbolNameProvider__block_invoke;
  v6[3] = &unk_263FF00A0;
  id v7 = v2;
  id v3 = v2;
  v4 = (void *)[v6 copy];

  return v4;
}

id __54__AVTAvatarAttributeEditorCategory_symbolNameProvider__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  v4 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:a2];
  v5 = [v3 objectForKey:v4];

  if (!v5)
  {
    v6 = *(void **)(a1 + 32);
    id v7 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:1];
    v5 = [v6 objectForKey:v7];
  }
  return v5;
}

- (NSString)description
{
  v12.receiver = self;
  v12.super_class = (Class)AVTAvatarAttributeEditorCategory;
  id v3 = [(AVTAvatarAttributeEditorCategory *)&v12 description];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(AVTAvatarAttributeEditorCategory *)self localizedName];
  v6 = [(AVTAvatarAttributeEditorCategory *)self sections];
  id v7 = objc_msgSend(v6, "avt_description");
  v8 = [(AVTAvatarAttributeEditorCategory *)self symbolNames];
  v9 = [v8 allValues];
  [v4 appendFormat:@" name: %@, sections: %@, symbols: %@", v5, v7, v9];

  v10 = (void *)[v4 copy];
  return (NSString *)v10;
}

- (NSArray)sectionProviders
{
  return self->_sectionProviders;
}

- (NSArray)sections
{
  return self->_sections;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (AVTAvatarAttributeEditorPreviewMode)previewMode
{
  return self->_previewMode;
}

- (NSDictionary)symbolNames
{
  return self->_symbolNames;
}

- (AVTCoreModelGroup)modelGroup
{
  return self->_modelGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelGroup, 0);
  objc_storeStrong((id *)&self->_symbolNames, 0);
  objc_storeStrong((id *)&self->_previewMode, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_sectionProviders, 0);
}

- (id)representedAVTPresetResources
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v4 = [(AVTAvatarAttributeEditorCategory *)self modelGroup];
  v5 = [v4 categories];

  id obj = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v22 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        v10 = [v9 presets];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v24;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v24 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = *(void **)(*((void *)&v23 + 1) + 8 * j);
              id v16 = [AVTPresetResources alloc];
              v17 = [v15 preset];
              uint64_t v18 = [(AVTPresetResources *)v16 initWithPreset:v17];

              [v3 addObject:v18];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v12);
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v7);
  }

  v19 = (void *)[v3 copy];
  return v19;
}

@end