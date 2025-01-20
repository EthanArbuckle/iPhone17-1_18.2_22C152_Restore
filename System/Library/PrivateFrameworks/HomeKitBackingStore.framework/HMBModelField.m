@interface HMBModelField
+ (HMBModelField)fieldWithClass:(Class)a3;
+ (HMBModelField)fieldWithClass:(Class)a3 options:(id)a4;
+ (id)deprecatedField;
+ (id)optionalFieldWithClass:(Class)a3;
+ (id)optionalFieldWithClass:(Class)a3 options:(id)a4;
- (BOOL)conformsToHMBModelNativeCKWrapper;
- (BOOL)encrypted;
- (BOOL)excludeFromCloudStorage;
- (BOOL)isOptional;
- (Class)classObj;
- (HMBModelField)initWithClass:(Class)a3;
- (HMBModelField)initWithClass:(Class)a3 options:(id)a4;
- (HMFVersion)readonlyVersion;
- (HMFVersion)unavailableVersion;
- (NSString)externalRecordField;
- (id)decodeBlock;
- (id)decodeQueryableValue:(id)a3;
- (id)defaultValue;
- (id)description;
- (id)descriptionBlock;
- (id)descriptionForEncodedQueryableValue:(id)a3;
- (id)encodeBlock;
- (id)encodeQueryableValue:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)loggingVisibility;
- (void)setConformsToHMBModelNativeCKWrapper:(BOOL)a3;
- (void)setDecodeBlock:(id)a3;
- (void)setDefaultValue:(id)a3;
- (void)setDescriptionBlock:(id)a3;
- (void)setEncodeBlock:(id)a3;
- (void)setEncrypted:(BOOL)a3;
- (void)setExcludeFromCloudStorage:(BOOL)a3;
- (void)setExternalRecordField:(id)a3;
- (void)setLoggingVisibility:(unint64_t)a3;
- (void)setOptional:(BOOL)a3;
- (void)setReadonlyVersion:(id)a3;
- (void)setUnavailableVersion:(id)a3;
@end

@implementation HMBModelField

- (Class)classObj
{
  return self->_classObj;
}

- (id)defaultValue
{
  return self->_defaultValue;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_descriptionBlock, 0);
  objc_storeStrong(&self->_decodeBlock, 0);
  objc_storeStrong(&self->_encodeBlock, 0);
  objc_storeStrong((id *)&self->_unavailableVersion, 0);
  objc_storeStrong((id *)&self->_readonlyVersion, 0);
  objc_storeStrong(&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_externalRecordField, 0);
  objc_storeStrong((id *)&self->_classObj, 0);
}

- (void)setDescriptionBlock:(id)a3
{
}

- (id)descriptionBlock
{
  return self->_descriptionBlock;
}

- (void)setDecodeBlock:(id)a3
{
}

- (id)decodeBlock
{
  return self->_decodeBlock;
}

- (void)setEncodeBlock:(id)a3
{
}

- (id)encodeBlock
{
  return self->_encodeBlock;
}

- (void)setConformsToHMBModelNativeCKWrapper:(BOOL)a3
{
  self->_conformsToHMBModelNativeCKWrapper = a3;
}

- (BOOL)conformsToHMBModelNativeCKWrapper
{
  return self->_conformsToHMBModelNativeCKWrapper;
}

- (void)setUnavailableVersion:(id)a3
{
}

- (HMFVersion)unavailableVersion
{
  return self->_unavailableVersion;
}

- (void)setReadonlyVersion:(id)a3
{
}

- (HMFVersion)readonlyVersion
{
  return self->_readonlyVersion;
}

- (void)setLoggingVisibility:(unint64_t)a3
{
  self->_loggingVisibility = a3;
}

- (unint64_t)loggingVisibility
{
  return self->_loggingVisibility;
}

- (void)setOptional:(BOOL)a3
{
  self->_optional = a3;
}

- (BOOL)isOptional
{
  return self->_optional;
}

- (void)setExcludeFromCloudStorage:(BOOL)a3
{
  self->_excludeFromCloudStorage = a3;
}

- (BOOL)excludeFromCloudStorage
{
  return self->_excludeFromCloudStorage;
}

- (void)setExternalRecordField:(id)a3
{
}

- (NSString)externalRecordField
{
  return self->_externalRecordField;
}

- (void)setEncrypted:(BOOL)a3
{
  self->_encrypted = a3;
}

- (BOOL)encrypted
{
  return self->_encrypted;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [(HMBModelField *)+[HMBMutableModelField allocWithZone:a3] initWithClass:[(HMBModelField *)self classObj]];
  [(HMBModelField *)v4 setOptional:[(HMBModelField *)self isOptional]];
  [(HMBModelField *)v4 setLoggingVisibility:[(HMBModelField *)self loggingVisibility]];
  v5 = [(HMBModelField *)self defaultValue];
  [(HMBModelField *)v4 setDefaultValue:v5];

  v6 = [(HMBModelField *)self readonlyVersion];
  [(HMBModelField *)v4 setReadonlyVersion:v6];

  v7 = [(HMBModelField *)self unavailableVersion];
  [(HMBModelField *)v4 setUnavailableVersion:v7];

  v8 = [(HMBModelField *)self externalRecordField];
  [(HMBModelField *)v4 setExternalRecordField:v8];

  [(HMBModelField *)v4 setConformsToHMBModelNativeCKWrapper:[(HMBModelField *)self conformsToHMBModelNativeCKWrapper]];
  [(HMBModelField *)v4 setExcludeFromCloudStorage:[(HMBModelField *)self excludeFromCloudStorage]];
  v9 = [(HMBModelField *)self encodeBlock];
  [(HMBModelField *)v4 setEncodeBlock:v9];

  v10 = [(HMBModelField *)self decodeBlock];
  [(HMBModelField *)v4 setDecodeBlock:v10];

  v11 = [(HMBModelField *)self descriptionBlock];
  [(HMBModelField *)v4 setDescriptionBlock:v11];

  return v4;
}

+ (id)deprecatedField
{
  v2 = [HMBMutableModelField alloc];
  v3 = [(HMBModelField *)v2 initWithClass:objc_opt_class() options:MEMORY[0x1E4F1CBF0]];
  [(HMBModelField *)v3 setLoggingVisibility:1];
  v4 = (void *)[(HMBMutableModelField *)v3 copy];

  return v4;
}

+ (id)optionalFieldWithClass:(Class)a3 options:(id)a4
{
  id v5 = a4;
  v6 = [(HMBModelField *)[HMBMutableModelField alloc] initWithClass:a3 options:v5];

  [(HMBModelField *)v6 setOptional:1];
  v7 = (void *)[(HMBMutableModelField *)v6 copy];

  return v7;
}

+ (HMBModelField)fieldWithClass:(Class)a3 options:(id)a4
{
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) initWithClass:a3 options:v6];

  return (HMBModelField *)v7;
}

+ (id)optionalFieldWithClass:(Class)a3
{
  v4 = [HMBMutableModelField alloc];
  id v5 = [(HMBModelField *)v4 initWithClass:a3 options:MEMORY[0x1E4F1CBF0]];
  [(HMBModelField *)v5 setOptional:1];
  id v6 = (void *)[(HMBMutableModelField *)v5 copy];

  return v6;
}

+ (HMBModelField)fieldWithClass:(Class)a3
{
  id v4 = objc_alloc((Class)a1);
  id v5 = (void *)[v4 initWithClass:a3 options:MEMORY[0x1E4F1CBF0]];
  return (HMBModelField *)v5;
}

- (id)descriptionForEncodedQueryableValue:(id)a3
{
  id v4 = a3;
  id v5 = [(HMBModelField *)self descriptionBlock];

  if (v5)
  {
    id v6 = [(HMBModelField *)self descriptionBlock];
    v7 = ((void (**)(void, id))v6)[2](v6, v4);

    return v7;
  }
  else
  {
    v9 = (HMBModelField *)_HMFPreconditionFailure();
    return [(HMBModelField *)v9 decodeQueryableValue:v11];
  }
}

- (id)decodeQueryableValue:(id)a3
{
  id v4 = a3;
  id v5 = [(HMBModelField *)self decodeBlock];

  if (v5)
  {
    id v6 = [(HMBModelField *)self decodeBlock];
    v7 = ((void (**)(void, id))v6)[2](v6, v4);

    return v7;
  }
  else
  {
    v9 = (HMBModelField *)_HMFPreconditionFailure();
    return [(HMBModelField *)v9 encodeQueryableValue:v11];
  }
}

- (id)encodeQueryableValue:(id)a3
{
  id v4 = a3;
  [(HMBModelField *)self classObj];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  id v5 = [(HMBModelField *)self encodeBlock];

  if (!v5)
  {
LABEL_7:
    v9 = (HMBModelField *)_HMFPreconditionFailure();
    [(HMBModelField *)v9 setDefaultValue:v11];
    return result;
  }
  id v6 = [(HMBModelField *)self encodeBlock];
  v7 = ((void (**)(void, id))v6)[2](v6, v4);

  return v7;
}

- (void)setDefaultValue:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5 && ([(HMBModelField *)self classObj], (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v6 = (void *)MEMORY[0x1D944CB30]();
    v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      SEL v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      v12 = NSStringFromClass([(HMBModelField *)v7 classObj]);
      int v13 = 138544130;
      v14 = v9;
      __int16 v15 = 2112;
      id v16 = v5;
      __int16 v17 = 2112;
      v18 = v11;
      __int16 v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_1D4693000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unable to set a default value %@ of type %@ when the stored type is %@", (uint8_t *)&v13, 0x2Au);
    }
  }
  else
  {
    objc_storeStrong(&self->_defaultValue, a3);
  }
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = NSStringFromClass([(HMBModelField *)self classObj]);
  id v5 = [v3 stringWithFormat:@"<HMBModelField class: %@", v4];

  if ([(HMBModelField *)self isOptional]) {
    [v5 appendFormat:@" optional: YES"];
  }
  id v6 = [(HMBModelField *)self externalRecordField];

  if (v6)
  {
    v7 = [(HMBModelField *)self externalRecordField];
    [v5 appendFormat:@" recordField: %@", v7];
  }
  if ([(HMBModelField *)self loggingVisibility]) {
    objc_msgSend(v5, "appendFormat:", @" loggingVisibility: %ld", -[HMBModelField loggingVisibility](self, "loggingVisibility"));
  }
  v8 = [(HMBModelField *)self defaultValue];

  if (v8)
  {
    v9 = [(HMBModelField *)self defaultValue];
    [v5 appendFormat:@" defaultValue: %@", v9];
  }
  SEL v10 = [(HMBModelField *)self readonlyVersion];

  if (v10)
  {
    id v11 = [(HMBModelField *)self readonlyVersion];
    [v5 appendFormat:@" readonlyVersion: %@", v11];
  }
  v12 = [(HMBModelField *)self unavailableVersion];

  if (v12)
  {
    int v13 = [(HMBModelField *)self unavailableVersion];
    [v5 appendFormat:@" unavailableVersion: %@", v13];
  }
  [v5 appendString:@">"];
  v14 = (void *)[v5 copy];

  return v14;
}

- (HMBModelField)initWithClass:(Class)a3 options:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v32.receiver = self;
  v32.super_class = (Class)HMBModelField;
  v7 = [(HMBModelField *)&v32 init];
  v8 = v7;
  if (!v7) {
    goto LABEL_25;
  }
  objc_storeStrong((id *)&v7->_classObj, a3);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v29;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v28 + 1) + 8 * v13++) applyTo:v8];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v11);
  }

  v8->_excludeFromCloudStorage = 0;
  int v14 = [(objc_class *)a3 conformsToProtocol:&unk_1F2C52AF0];
  v8->_conformsToHMBModelNativeCKWrapper = v14;
  __int16 v15 = [(HMBModelField *)v8 externalRecordField];

  if (v14)
  {
    if (v15)
    {
      if (objc_opt_respondsToSelector())
      {
        char v16 = [(objc_class *)a3 includeInModelEncoding] ^ 1;
LABEL_16:
        v8->_excludeFromCloudStorage = v16;
        goto LABEL_17;
      }
LABEL_15:
      char v16 = 1;
      goto LABEL_16;
    }
    _HMFPreconditionFailure();
LABEL_27:
    _HMFPreconditionFailure();
  }
  if (v15)
  {
    if ([(objc_class *)a3 conformsToProtocol:&unk_1F2C5DCE0]) {
      goto LABEL_15;
    }
    goto LABEL_27;
  }
LABEL_17:
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v17 = v9;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v25;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v25 != v20) {
          objc_enumerationMutation(v17);
        }
        objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v21++), "applyTo:", v8, (void)v24);
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v19);
  }

  v8->_loggingVisibility = 0;
  v22 = v8;
LABEL_25:

  return v8;
}

- (HMBModelField)initWithClass:(Class)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HMBModelField;
  id v4 = [(HMBModelField *)&v8 init];
  id v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_classObj, a3);
    v5->_loggingVisibility = 0;
    id v6 = v5;
  }

  return v5;
}

@end