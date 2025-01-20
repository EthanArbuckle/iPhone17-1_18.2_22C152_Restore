@interface AVTAvatarAttributeEditorModel
+ (id)diffOfSectionItems:(id)a3 fromSectionItems:(id)a4;
+ (id)diffOfSections:(id)a3 fromSections:(id)a4;
- (AVTAvatarAttributeEditorModel)initWithCategories:(id)a3;
- (NSArray)categories;
- (id)differenceFromModel:(id)a3;
@end

@implementation AVTAvatarAttributeEditorModel

+ (id)diffOfSectionItems:(id)a3 fromSectionItems:(id)a4
{
  return (id)[a3 differenceFromArray:a4 withOptions:0 usingEquivalenceTest:&__block_literal_global_26];
}

uint64_t __69__AVTAvatarAttributeEditorModel_diffOfSectionItems_fromSectionItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 identifier];
  v6 = [v4 identifier];

  uint64_t v7 = [v5 isEqualToString:v6];
  return v7;
}

+ (id)diffOfSections:(id)a3 fromSections:(id)a4
{
  return (id)[a3 differenceFromArray:a4 withOptions:0 usingEquivalenceTest:&__block_literal_global_3_2];
}

uint64_t __61__AVTAvatarAttributeEditorModel_diffOfSections_fromSections___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 identifier];
  v6 = [v4 identifier];

  uint64_t v7 = [v5 isEqualToString:v6];
  return v7;
}

- (AVTAvatarAttributeEditorModel)initWithCategories:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTAvatarAttributeEditorModel;
  v6 = [(AVTAvatarAttributeEditorModel *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_categories, a3);
  }

  return v7;
}

- (id)differenceFromModel:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v36 = [MEMORY[0x263EFF980] array];
  v41 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [v3 categories];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    uint64_t v6 = 0;
    v35 = v3;
    do
    {
      uint64_t v7 = objc_msgSend(v3, "categories", v35);
      v8 = [v7 objectAtIndexedSubscript:v6];

      objc_super v9 = [(AVTAvatarAttributeEditorModel *)self categories];
      uint64_t v40 = v6;
      v10 = [v9 objectAtIndexedSubscript:v6];

      v11 = objc_opt_class();
      v12 = [v10 sections];
      v13 = [v8 sections];
      uint64_t v14 = [v11 diffOfSections:v12 fromSections:v13];

      v37 = (void *)v14;
      [v36 addObject:v14];
      v15 = NSDictionary;
      v39 = v8;
      v16 = [v8 sections];
      v44 = objc_msgSend(v15, "_avtui_dictionaryByIndexingObjectsInArray:by:", v16, &__block_literal_global_8);

      v17 = NSDictionary;
      v38 = v10;
      v18 = [v10 sections];
      v19 = objc_msgSend(v17, "_avtui_dictionaryByIndexingObjectsInArray:by:", v18, &__block_literal_global_10);

      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id obj = [v19 allKeys];
      uint64_t v20 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v46 != v22) {
              objc_enumerationMutation(obj);
            }
            uint64_t v24 = *(void *)(*((void *)&v45 + 1) + 8 * i);
            v25 = [v19 objectForKeyedSubscript:v24];
            v26 = [v44 objectForKeyedSubscript:v24];
            if (v26)
            {
              v27 = objc_opt_class();
              v28 = [v25 sectionItems];
              v29 = [v26 sectionItems];
              v30 = [v27 diffOfSectionItems:v28 fromSectionItems:v29];

              if ([v30 hasChanges]) {
                [v41 setObject:v30 forKeyedSubscript:v24];
              }
            }
          }
          uint64_t v21 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
        }
        while (v21);
      }

      uint64_t v6 = v40 + 1;
      id v3 = v35;
      v31 = [v35 categories];
      unint64_t v32 = [v31 count];
    }
    while (v40 + 1 < v32);
  }
  v33 = [[AVTAvatarAttributeEditorModelDiff alloc] initWithSectionDiffs:v36 sectionItemDiffs:v41];

  return v33;
}

uint64_t __53__AVTAvatarAttributeEditorModel_differenceFromModel___block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

uint64_t __53__AVTAvatarAttributeEditorModel_differenceFromModel___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (NSArray)categories
{
  return self->_categories;
}

- (void).cxx_destruct
{
}

@end