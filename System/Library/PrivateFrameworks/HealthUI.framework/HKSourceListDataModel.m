@interface HKSourceListDataModel
- (HKSourceListDataModel)initWithSourceModels:(id)a3;
- (HKSourceListDataModel)initWithSources:(id)a3;
- (NSArray)orderedAppSources;
- (NSArray)orderedClinicalSources;
- (NSArray)orderedDeviceSources;
- (NSArray)orderedResearchStudySources;
- (NSArray)orderedUninstalledAppSources;
- (NSSet)allSources;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_sortSources:(id)a3;
@end

@implementation HKSourceListDataModel

- (HKSourceListDataModel)initWithSources:(id)a3
{
  v4 = objc_msgSend(a3, "hk_map:", &__block_literal_global_51);
  v5 = [(HKSourceListDataModel *)self initWithSourceModels:v4];

  return v5;
}

HKSourceDataModel *__41__HKSourceListDataModel_initWithSources___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[HKSourceDataModel alloc] initWithSource:v2];

  [(HKSourceDataModel *)v3 setInstalled:1];
  return v3;
}

- (HKSourceListDataModel)initWithSourceModels:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HKSourceListDataModel;
  v5 = [(HKSourceListDataModel *)&v8 init];
  v6 = v5;
  if (v5) {
    [(HKSourceListDataModel *)v5 _sortSources:v4];
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithSet:self->_allSources copyItems:1];
  v5 = [v4 allObjects];

  v6 = [+[HKSourceListDataModel allocWithZone:a3] initWithSourceModels:v5];
  return v6;
}

- (void)_sortSources:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  context = (void *)MEMORY[0x1E4E40740]();
  v31 = v3;
  id v4 = (void *)[v3 mutableCopy];
  [v4 sortUsingComparator:&__block_literal_global_326_0];
  id v36 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v39;
    uint64_t v9 = *MEMORY[0x1E4F2BD08];
    uint64_t v37 = *MEMORY[0x1E4F2BD10];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        v12 = [v11 source];
        if (([v12 _isHidden] & 1) == 0)
        {
          v13 = [v12 bundleIdentifier];
          if ([v13 isEqualToString:v9])
          {
          }
          else
          {
            v14 = [v12 bundleIdentifier];
            char v15 = [v14 isEqualToString:v37];

            if ((v15 & 1) == 0)
            {
              if ([v12 _isApplication])
              {
                if ([v11 installed]) {
                  v16 = v36;
                }
                else {
                  v16 = v35;
                }
              }
              else if ([v12 _isResearchStudy])
              {
                v16 = v34;
              }
              else if ([v12 _isClinicalSource])
              {
                v16 = v32;
              }
              else
              {
                v16 = v33;
              }
              [v16 addObject:v11];
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v7);
  }

  v17 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
  allSources = self->_allSources;
  self->_allSources = v17;

  v19 = (NSArray *)[v36 copy];
  orderedAppSources = self->_orderedAppSources;
  self->_orderedAppSources = v19;

  v21 = (NSArray *)[v35 copy];
  orderedUninstalledAppSources = self->_orderedUninstalledAppSources;
  self->_orderedUninstalledAppSources = v21;

  v23 = (NSArray *)[v33 copy];
  orderedDeviceSources = self->_orderedDeviceSources;
  self->_orderedDeviceSources = v23;

  v25 = (NSArray *)[v34 copy];
  orderedResearchStudySources = self->_orderedResearchStudySources;
  self->_orderedResearchStudySources = v25;

  v27 = (NSArray *)[v32 copy];
  orderedClinicalSources = self->_orderedClinicalSources;
  self->_orderedClinicalSources = v27;
}

uint64_t __38__HKSourceListDataModel__sortSources___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 source];
  uint64_t v6 = [v5 name];
  uint64_t v7 = [v4 source];

  uint64_t v8 = [v7 name];
  uint64_t v9 = [v6 localizedCaseInsensitiveCompare:v8];

  return v9;
}

- (NSSet)allSources
{
  return self->_allSources;
}

- (NSArray)orderedAppSources
{
  return self->_orderedAppSources;
}

- (NSArray)orderedUninstalledAppSources
{
  return self->_orderedUninstalledAppSources;
}

- (NSArray)orderedResearchStudySources
{
  return self->_orderedResearchStudySources;
}

- (NSArray)orderedDeviceSources
{
  return self->_orderedDeviceSources;
}

- (NSArray)orderedClinicalSources
{
  return self->_orderedClinicalSources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedClinicalSources, 0);
  objc_storeStrong((id *)&self->_orderedDeviceSources, 0);
  objc_storeStrong((id *)&self->_orderedResearchStudySources, 0);
  objc_storeStrong((id *)&self->_orderedUninstalledAppSources, 0);
  objc_storeStrong((id *)&self->_orderedAppSources, 0);
  objc_storeStrong((id *)&self->_allSources, 0);
}

@end