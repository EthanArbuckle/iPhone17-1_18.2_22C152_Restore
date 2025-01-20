@interface HMDMediaPlaybackActionModel
+ (id)properties;
+ (id)schemaHashRoot;
- (BOOL)validForStorage;
- (id)dependentUUIDs;
- (id)validate;
- (void)loadModelWithActionInformation:(id)a3;
@end

@implementation HMDMediaPlaybackActionModel

- (id)dependentUUIDs
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)HMDMediaPlaybackActionModel;
  v3 = [(HMDBackingStoreModelObject *)&v28 dependentUUIDs];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(HMDBackingStoreModelObject *)self parentUUID];

  if (v5)
  {
    v6 = [(HMDBackingStoreModelObject *)self parentUUID];
    [v4 addObject:v6];
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v7 = [(HMDMediaPlaybackActionModel *)self accessories];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:*(void *)(*((void *)&v24 + 1) + 8 * i)];
        [v4 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v9);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v13 = [(HMDMediaPlaybackActionModel *)self services];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:*(void *)(*((void *)&v20 + 1) + 8 * j)];
        [v4 addObject:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v29 count:16];
    }
    while (v15);
  }

  return v4;
}

- (id)validate
{
  v3 = [(HMDMediaPlaybackActionModel *)self profiles];
  v4 = [(HMDMediaPlaybackActionModel *)self state];
  uint64_t v5 = [v4 integerValue];
  v6 = [(HMDMediaPlaybackActionModel *)self volume];
  BOOL v7 = +[HMDMediaPlaybackAction isPlaybackActionValidWithProfiles:v3 state:v5 volume:v6];

  if (v7)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
  }
  return v8;
}

- (BOOL)validForStorage
{
  v3 = [(HMDMediaPlaybackActionModel *)self profiles];
  if ([v3 count])
  {
    v4 = [(HMDMediaPlaybackActionModel *)self accessories];
    if ([v4 count])
    {
      uint64_t v5 = [(HMDMediaPlaybackActionModel *)self state];
      if ([v5 integerValue])
      {
        BOOL v6 = 1;
      }
      else
      {
        BOOL v7 = [(HMDMediaPlaybackActionModel *)self volume];
        if (v7)
        {
          BOOL v6 = 1;
        }
        else
        {
          uint64_t v8 = [(HMDMediaPlaybackActionModel *)self encodedPlaybackArchive];
          BOOL v6 = v8 != 0;
        }
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)loadModelWithActionInformation:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDMediaPlaybackActionModel;
  [(HMDActionModel *)&v11 loadModelWithActionInformation:v4];
  uint64_t v5 = objc_msgSend(v4, "hmf_numberForKey:", *MEMORY[0x1E4F2D930]);
  [(HMDMediaPlaybackActionModel *)self setState:v5];

  BOOL v6 = objc_msgSend(v4, "hmf_numberForKey:", *MEMORY[0x1E4F2D940]);
  [(HMDMediaPlaybackActionModel *)self setVolume:v6];

  BOOL v7 = objc_msgSend(v4, "hmf_arrayForKey:", *MEMORY[0x1E4F2D920]);
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
    [(HMDMediaPlaybackActionModel *)self setProfiles:v8];
  }
  uint64_t v9 = objc_msgSend(v4, "hmf_dataForKey:", *MEMORY[0x1E4F2D910]);
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:0];
    if (v10) {
      [(HMDMediaPlaybackActionModel *)self setEncodedPlaybackArchive:v10];
    }
  }
}

+ (id)properties
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__HMDMediaPlaybackActionModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_174520 != -1) {
    dispatch_once(&properties_onceToken_174520, block);
  }
  v2 = (void *)properties__properties_174521;
  return v2;
}

void __41__HMDMediaPlaybackActionModel_properties__block_invoke(uint64_t a1)
{
  v23[6] = *MEMORY[0x1E4F143B8];
  v18.receiver = *(id *)(a1 + 32);
  v18.super_class = (Class)&OBJC_METACLASS___HMDMediaPlaybackActionModel;
  v1 = objc_msgSendSuper2(&v18, sel_properties);
  uint64_t v2 = [v1 mutableCopy];
  v3 = (void *)properties__properties_174521;
  properties__properties_174521 = v2;

  v17 = (void *)properties__properties_174521;
  v22[0] = @"accessories";
  uint64_t v4 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  uint64_t v5 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:v4 additionalDecodeClasses:v16];
  v23[0] = v5;
  v22[1] = @"state";
  BOOL v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v23[1] = v6;
  v22[2] = @"volume";
  BOOL v7 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v23[2] = v7;
  v22[3] = @"profiles";
  uint64_t v8 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  uint64_t v10 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:v8 additionalDecodeClasses:v9];
  v23[3] = v10;
  v22[4] = @"encodedPlaybackArchive";
  objc_super v11 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v23[4] = v11;
  v22[5] = @"services";
  uint64_t v12 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  uint64_t v14 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:v12 additionalDecodeClasses:v13];
  v23[5] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:6];
  [v17 addEntriesFromDictionary:v15];
}

+ (id)schemaHashRoot
{
  return @"4E0EC9BD-7632-4738-82B4-5DC5E759C40E";
}

@end