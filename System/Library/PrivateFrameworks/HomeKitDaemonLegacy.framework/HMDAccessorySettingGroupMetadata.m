@interface HMDAccessorySettingGroupMetadata
+ (id)groupWithDictonaryRepresentation:(id)a3 parentKeyPath:(id)a4;
+ (id)groupsWithArrayRepresenation:(id)a3 parentKeyPath:(id)a4;
- (HMDAccessorySettingGroupMetadata)initWithName:(id)a3 settings:(id)a4 groups:(id)a5;
- (HMDAccessorySettingGroupMetadata)initWithName:(id)a3 settings:(id)a4 groups:(id)a5 parentKeyPath:(id)a6;
- (NSArray)groups;
- (NSArray)settings;
- (NSString)keyPath;
- (NSString)name;
- (NSString)propertyDescription;
- (id)modelsWithParentIdentifier:(id)a3;
@end

@implementation HMDAccessorySettingGroupMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSArray)settings
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)groups
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)keyPath
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)modelsWithParentIdentifier:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [HMDAccessorySettingGroupModel alloc];
  v6 = [MEMORY[0x1E4F29128] UUID];
  v7 = [(HMDBackingStoreModelObject *)v5 initWithObjectChangeType:1 uuid:v6 parentUUID:v4];

  v8 = [(HMDAccessorySettingGroupMetadata *)self name];
  [(HMDAccessorySettingGroupModel *)v7 setName:v8];

  v9 = [MEMORY[0x1E4F1CA48] arrayWithObject:v7];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v10 = [(HMDAccessorySettingGroupMetadata *)self settings];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v16 = [(HMDBackingStoreModelObject *)v7 uuid];
        v17 = [v15 modelsWithParentIdentifier:v16];
        [v9 addObjectsFromArray:v17];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v12);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v18 = [(HMDAccessorySettingGroupMetadata *)self groups];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v28 + 1) + 8 * j);
        v24 = [(HMDBackingStoreModelObject *)v7 uuid];
        v25 = [v23 modelsWithParentIdentifier:v24];
        [v9 addObjectsFromArray:v25];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v20);
  }

  v26 = (void *)[v9 copy];
  return v26;
}

- (NSString)propertyDescription
{
  v3 = NSString;
  id v4 = [(HMDAccessorySettingGroupMetadata *)self name];
  v5 = [(HMDAccessorySettingGroupMetadata *)self settings];
  v6 = [(HMDAccessorySettingGroupMetadata *)self groups];
  v7 = [v3 stringWithFormat:@", Name = %@, Settings = %@, Groups = %@", v4, v5, v6];

  return (NSString *)v7;
}

- (HMDAccessorySettingGroupMetadata)initWithName:(id)a3 settings:(id)a4 groups:(id)a5 parentKeyPath:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10)
  {
    id v14 = v10;
    v23.receiver = self;
    v23.super_class = (Class)HMDAccessorySettingGroupMetadata;
    v15 = [(HMDAccessorySettingGroupMetadata *)&v23 init];
    if (v15)
    {
      uint64_t v16 = [v14 copy];
      name = v15->_name;
      v15->_name = (NSString *)v16;

      if (v13)
      {
        v18 = [v13 stringByAppendingFormat:@".%@", v15->_name];
      }
      else
      {
        v18 = v14;
      }
      objc_storeStrong((id *)&v15->_keyPath, v18);
      if (v13) {

      }
      if (v11) {
        uint64_t v20 = (void *)[v11 copy];
      }
      else {
        uint64_t v20 = (void *)MEMORY[0x1E4F1CBF0];
      }
      objc_storeStrong((id *)&v15->_settings, v20);
      if (v11) {

      }
      if (v12) {
        uint64_t v21 = (void *)[v12 copy];
      }
      else {
        uint64_t v21 = (void *)MEMORY[0x1E4F1CBF0];
      }
      objc_storeStrong((id *)&v15->_groups, v21);
      if (v12) {
    }
      }
    self = v15;

    uint64_t v19 = self;
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

- (HMDAccessorySettingGroupMetadata)initWithName:(id)a3 settings:(id)a4 groups:(id)a5
{
  return [(HMDAccessorySettingGroupMetadata *)self initWithName:a3 settings:a4 groups:a5 parentKeyPath:0];
}

+ (id)groupWithDictonaryRepresentation:(id)a3 parentKeyPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 objectForKeyedSubscript:@"Key"];
  v9 = v8;
  if (v6)
  {
    id v10 = [v6 stringByAppendingFormat:@".%@", v8];
  }
  else
  {
    id v10 = v8;
  }
  id v11 = v10;
  id v12 = objc_alloc((Class)a1);
  id v13 = objc_msgSend(v7, "hmf_arrayForKey:", @"Settings");
  id v14 = +[HMDAccessorySettingMetadata settingsWithArrayRepresenation:v13 parentKeyPath:v11];
  v15 = objc_msgSend(v7, "hmf_arrayForKey:", @"Groups");

  uint64_t v16 = +[HMDAccessorySettingGroupMetadata groupsWithArrayRepresenation:v15 parentKeyPath:v11];
  v17 = (void *)[v12 initWithName:v9 settings:v14 groups:v16 parentKeyPath:v6];

  return v17;
}

+ (id)groupsWithArrayRepresenation:(id)a3 parentKeyPath:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v14 = +[HMDAccessorySettingGroupMetadata groupWithDictonaryRepresentation:parentKeyPath:](HMDAccessorySettingGroupMetadata, "groupWithDictonaryRepresentation:parentKeyPath:", v13, v6, (void)v17);
          if (v14) {
            [v7 addObject:v14];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  v15 = (void *)[v7 copy];
  return v15;
}

@end