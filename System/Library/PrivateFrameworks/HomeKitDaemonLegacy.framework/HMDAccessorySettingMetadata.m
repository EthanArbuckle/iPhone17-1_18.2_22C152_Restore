@interface HMDAccessorySettingMetadata
+ (id)settingWithDictonaryRepresentation:(id)a3 parentKeyPath:(id)a4;
+ (id)settingsWithArrayRepresenation:(id)a3 parentKeyPath:(id)a4;
+ (id)valueWithType:(int64_t)a3 constraints:(id)a4 representation:(id)a5;
- (HMDAccessorySettingMergeStrategy)mergeStrategy;
- (HMDAccessorySettingMetadata)initWithName:(id)a3 type:(int64_t)a4 properties:(unint64_t)a5 constraints:(id)a6 mergeStrategy:(id)a7 value:(id)a8 parentKeyPath:(id)a9;
- (NSArray)constraints;
- (NSString)keyPath;
- (NSString)name;
- (NSString)propertyDescription;
- (id)modelWithParentIdentifier:(id)a3;
- (id)modelsWithParentIdentifier:(id)a3;
- (id)value;
- (int64_t)type;
- (unint64_t)properties;
@end

@implementation HMDAccessorySettingMetadata

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_mergeStrategy, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (id)value
{
  return objc_getProperty(self, a2, 56, 1);
}

- (NSArray)constraints
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (HMDAccessorySettingMergeStrategy)mergeStrategy
{
  return (HMDAccessorySettingMergeStrategy *)objc_getProperty(self, a2, 40, 1);
}

- (unint64_t)properties
{
  return self->_properties;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)keyPath
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)modelWithParentIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [HMDAccessorySettingModel alloc];
  v6 = [MEMORY[0x1E4F29128] UUID];
  v7 = [(HMDBackingStoreModelObject *)v5 initWithObjectChangeType:1 uuid:v6 parentUUID:v4];

  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDAccessorySettingMetadata properties](self, "properties"));
  [(HMDAccessorySettingModel *)v7 setProperties:v8];

  v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDAccessorySettingMetadata type](self, "type"));
  [(HMDAccessorySettingModel *)v7 setType:v9];

  v10 = [(HMDAccessorySettingMetadata *)self name];
  [(HMDAccessorySettingModel *)v7 setName:v10];

  v11 = [(HMDAccessorySettingMetadata *)self value];
  v12 = encodeRootObject();
  [(HMDAccessorySettingModel *)v7 setValue:v12];

  [(HMDAccessorySettingModel *)v7 setConfigurationVersion:&unk_1F2DC7A38];
  return v7;
}

- (id)modelsWithParentIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = [(HMDAccessorySettingMetadata *)self modelWithParentIdentifier:a3];
  v5 = [MEMORY[0x1E4F1CA48] arrayWithObject:v4];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v6 = [(HMDAccessorySettingMetadata *)self constraints];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v12 = [v4 uuid];
        v13 = [v11 modelWithParentIdentifier:v12];

        [v13 setObjectChangeType:1];
        [v5 addObject:v13];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  v14 = (void *)[v5 copy];
  return v14;
}

- (NSString)propertyDescription
{
  v3 = NSString;
  id v4 = [(HMDAccessorySettingMetadata *)self name];
  [(HMDAccessorySettingMetadata *)self type];
  v5 = HMAccessorySettingTypeToString();
  [(HMDAccessorySettingMetadata *)self properties];
  v6 = HMAccessorySettingPropertiesToString();
  uint64_t v7 = [(HMDAccessorySettingMetadata *)self value];
  uint64_t v8 = [(HMDAccessorySettingMetadata *)self constraints];
  uint64_t v9 = [v3 stringWithFormat:@", Name = %@, Type = %@, Properties = %@, Value = %@, Constraints = %@", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (HMDAccessorySettingMetadata)initWithName:(id)a3 type:(int64_t)a4 properties:(unint64_t)a5 constraints:(id)a6 mergeStrategy:(id)a7 value:(id)a8 parentKeyPath:(id)a9
{
  id v15 = a3;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  if (v15)
  {
    id v20 = v15;
    if (a4)
    {
      v31.receiver = self;
      v31.super_class = (Class)HMDAccessorySettingMetadata;
      uint64_t v21 = [(HMDAccessorySettingMetadata *)&v31 init];
      if (v21)
      {
        uint64_t v22 = [v20 copy];
        name = v21->_name;
        v21->_name = (NSString *)v22;

        uint64_t v24 = [v19 stringByAppendingFormat:@".%@", v20];
        keyPath = v21->_keyPath;
        v21->_keyPath = (NSString *)v24;

        v21->_type = a4;
        v21->_properties = a5;
        if (v16) {
          v26 = (void *)[v16 copy];
        }
        else {
          v26 = (void *)MEMORY[0x1E4F1CBF0];
        }
        objc_storeStrong((id *)&v21->_constraints, v26);
        if (v16) {

        }
        objc_storeStrong((id *)&v21->_mergeStrategy, a7);
        uint64_t v28 = [v18 copy];
        id value = v21->_value;
        v21->_id value = (id)v28;
      }
      self = v21;
      v27 = self;
    }
    else
    {
      v27 = 0;
    }
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

+ (id)valueWithType:(int64_t)a3 constraints:(id)a4 representation:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = v8;
  switch(a3)
  {
    case 1:
      if (!v8) {
        goto LABEL_13;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_12;
      }
      v10 = (void *)MEMORY[0x1D9452090]();
      v11 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_42;
      }
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v41 = v12;
      __int16 v42 = 2112;
      id v43 = v9;
      v13 = "%{public}@Invalid data value: %@";
      goto LABEL_41;
    case 2:
      if (!v8) {
        goto LABEL_13;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_12;
      }
      v10 = (void *)MEMORY[0x1D9452090]();
      v11 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_42;
      }
      v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v41 = v12;
      __int16 v42 = 2112;
      id v43 = v9;
      v13 = "%{public}@Invalid number value: %@";
      goto LABEL_41;
    case 3:
      if (!v8)
      {
LABEL_13:
        id v14 = [MEMORY[0x1E4F1CA98] null];
        goto LABEL_14;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_12:
        id v14 = v9;
LABEL_14:
        id v15 = v14;
        goto LABEL_44;
      }
      v10 = (void *)MEMORY[0x1D9452090]();
      v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v41 = v12;
        __int16 v42 = 2112;
        id v43 = v9;
        v13 = "%{public}@Invalid string value: %@";
LABEL_41:
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEFAULT, v13, buf, 0x16u);
      }
LABEL_42:

LABEL_43:
      id v15 = 0;
LABEL_44:

      return v15;
    case 4:
      id v16 = v8;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v17 = v16;
      }
      else {
        id v17 = 0;
      }
      id v18 = v17;

      if (v18)
      {
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v35 = v7;
        id v19 = v7;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v36 objects:v46 count:16];
        if (!v20) {
          goto LABEL_30;
        }
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v37;
        while (1)
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v37 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = [*(id *)(*((void *)&v36 + 1) + 8 * i) value];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              v25 = v24;
            }
            else {
              v25 = 0;
            }
            id v15 = v25;

            v26 = [v15 title];
            char v27 = [v26 isEqualToString:v18];

            if (v27)
            {

LABEL_34:
              id v7 = v35;
              goto LABEL_38;
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v36 objects:v46 count:16];
          if (!v21)
          {
LABEL_30:

            uint64_t v28 = (void *)MEMORY[0x1D9452090]();
            v29 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              v30 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543874;
              v41 = v30;
              __int16 v42 = 2112;
              id v43 = v18;
              __int16 v44 = 2112;
              id v45 = v19;
              _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Invalid item with title '%@', constraints: %@", buf, 0x20u);
            }
            id v15 = 0;
            goto LABEL_34;
          }
        }
      }
      objc_super v31 = (void *)MEMORY[0x1D9452090]();
      v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v41 = v33;
        __int16 v42 = 2112;
        id v43 = v16;
        _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@Invalid string value: %@", buf, 0x16u);
      }
      id v15 = 0;
LABEL_38:

      goto LABEL_44;
    default:
      goto LABEL_43;
  }
}

+ (id)settingWithDictonaryRepresentation:(id)a3 parentKeyPath:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(v6, "hmf_stringForKey:", @"Key");
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = v8;
    v11 = objc_msgSend(v6, "hmf_stringForKey:", @"Type");
    if (v11)
    {
      uint64_t v12 = HMAccessorySettingTypeFromString();
      v13 = objc_msgSend(v6, "hmf_arrayForKey:", @"Properties");
      id v14 = v13;
      if (v13)
      {
        id v35 = (objc_class *)a1;
        long long v36 = v11;
        id v38 = v7;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        uint64_t v15 = [v13 countByEnumeratingWithState:&v39 objects:v43 count:16];
        id v37 = v10;
        uint64_t v34 = v12;
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = 0;
          uint64_t v18 = *(void *)v40;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v40 != v18) {
                objc_enumerationMutation(v14);
              }
              id v20 = *(id *)(*((void *)&v39 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                uint64_t v21 = v20;
              }
              else {
                uint64_t v21 = 0;
              }
              id v22 = v21;

              uint64_t v23 = HMAccessorySettingPropertiesFromString();
              v17 |= v23;
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v39 objects:v43 count:16];
          }
          while (v16);
        }
        else
        {
          uint64_t v17 = 0;
        }
        v25 = (void *)MEMORY[0x1E4F2E5E8];
        v26 = objc_msgSend(v6, "hmf_arrayForKey:", @"Constraints");
        char v27 = [v25 constraintsWithArrayRepresenation:v26];

        uint64_t v28 = [HMDAccessorySettingMergeStrategy alloc];
        v29 = [v6 valueForKey:@"MergeStrategy"];
        v30 = [(HMDAccessorySettingMergeStrategy *)v28 initWithMergeStrategy:v29];

        objc_super v31 = [v6 objectForKeyedSubscript:@"Value"];
        v32 = +[HMDAccessorySettingMetadata valueWithType:v34 constraints:v27 representation:v31];

        id v10 = v37;
        id v7 = v38;
        uint64_t v24 = (void *)[[v35 alloc] initWithName:v37 type:v34 properties:v17 constraints:v27 mergeStrategy:v30 value:v32 parentKeyPath:v38];

        v11 = v36;
      }
      else
      {
        uint64_t v24 = 0;
      }
    }
    else
    {
      uint64_t v24 = 0;
    }
  }
  else
  {
    uint64_t v24 = 0;
  }

  return v24;
}

+ (id)settingsWithArrayRepresenation:(id)a3 parentKeyPath:(id)a4
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
          id v14 = +[HMDAccessorySettingMetadata settingWithDictonaryRepresentation:parentKeyPath:](HMDAccessorySettingMetadata, "settingWithDictonaryRepresentation:parentKeyPath:", v13, v6, (void)v17);
          if (v14) {
            [v7 addObject:v14];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  uint64_t v15 = (void *)[v7 copy];
  return v15;
}

@end