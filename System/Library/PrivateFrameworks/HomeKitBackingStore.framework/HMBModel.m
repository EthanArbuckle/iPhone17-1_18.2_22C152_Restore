@interface HMBModel
+ (BOOL)hmbExcludeFromCloudStorage;
+ (BOOL)hmbShouldLogPrivateInformation;
+ (BOOL)propertyDiffersFrom:(id)a3 to:(id)a4;
+ (BOOL)resolveInstanceMethod:(SEL)a3;
+ (Class)hmbGenericRepresentation;
+ (HMFVersion)hmbReadOnlyBefore;
+ (NSArray)hmbQueries;
+ (NSDictionary)hmbProperties;
+ (NSSet)hmbExternalProperties;
+ (NSSet)hmbExternalRecordFields;
+ (NSSet)hmbModelClassesWithQueries;
+ (NSSet)hmbPropertyNames;
+ (NSString)hmbExternalRecordType;
+ (NSUUID)hmbSchemaHashRoot;
+ (id)formattedStringForValue:(id)a3;
+ (id)hmbMutableModelClassesWithQueries;
+ (id)logCategory;
+ (void)hmbPrepareQueries;
- (BOOL)_validateType:(id)a3 error:(id *)a4;
- (BOOL)hmbCanonicalTypeInferred;
- (BOOL)hmbIgnoreModel;
- (BOOL)hmbIsDifferentFromModel:(id)a3 differingFields:(id *)a4;
- (BOOL)hmbIsModelGenericRepresentation;
- (BOOL)hmbIsModelReadOnly;
- (BOOL)hmbPropertyIsAvailable:(id)a3;
- (BOOL)hmbPropertyIsReadOnly:(id)a3;
- (BOOL)hmbPropertyWasSet:(id)a3;
- (BOOL)hmbValidForStorage:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HMBModel)initWithModelID:(id)a3 parentModelID:(id)a4;
- (HMBModelContainer)hmbModelContainer;
- (HMFVersion)hmbContainerDataVersion;
- (HMFVersion)hmbDataVersion;
- (HMFVersion)hmbMinimumSupportedVersion;
- (NSMutableDictionary)hmbReserved;
- (NSSet)hmbReadOnlyProperties;
- (NSSet)hmbSetExternalProperties;
- (NSSet)hmbSetExternalRecordFields;
- (NSSet)hmbSetProperties;
- (NSSet)hmbUnavailableProperties;
- (NSString)debugDescription;
- (NSString)hmbCanonicalType;
- (NSString)hmbDescription;
- (NSString)hmbType;
- (NSUUID)hmbModelID;
- (NSUUID)hmbParentModelID;
- (id)attributeDescriptions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)hmbDefaultValueForPropertyNamed:(id)a3;
- (id)hmbModelByMergingFromModel:(id)a3 isFromCloud:(BOOL)a4 error:(id *)a5;
- (id)hmbModelByMergingSetPropertiesFromModel:(id)a3;
- (id)hmbPrepareForStorageLocation:(unint64_t)a3;
- (id)hmbPropertyNamed:(id)a3;
- (id)hmbPropertyNamed:(id)a3 isSet:(BOOL *)a4;
- (id)populateModelWithDictionary:(id)a3 fromStorageLocation:(unint64_t)a4 using:(id)a5;
- (id)prepareForStorageLocation:(unint64_t)a3 using:(id)a4 updatedModelIDs:(id)a5 error:(id *)a6;
- (id)validateType:(id)a3 path:(id)a4;
- (unint64_t)hash;
- (unint64_t)hmbRecordRow;
- (void)dumpDebug;
- (void)dumpDebug:(id)a3;
- (void)hmbAssociateWithContainer:(id)a3;
- (void)hmbMergeSetPropertiesFromModel:(id)a3;
- (void)hmbSetProperty:(id)a3 named:(id)a4;
- (void)hmbUnsetPropertyNamed:(id)a3;
- (void)setHmbDataVersion:(id)a3;
- (void)setHmbMinimumSupportedVersion:(id)a3;
- (void)setHmbModelContainer:(id)a3;
- (void)setHmbModelID:(id)a3;
- (void)setHmbParentModelID:(id)a3;
- (void)setHmbReadOnlyProperties:(id)a3;
- (void)setHmbRecordRow:(unint64_t)a3;
- (void)setHmbReserved:(id)a3;
- (void)setHmbType:(id)a3;
- (void)setHmbUnavailableProperties:(id)a3;
@end

@implementation HMBModel

- (HMBModel)initWithModelID:(id)a3 parentModelID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HMBModel;
  v9 = [(HMBModel *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_hmbModelID, a3);
    objc_storeStrong((id *)&v10->_hmbParentModelID, a4);
    uint64_t v11 = [MEMORY[0x1E4F1CAD0] set];
    hmbUnavailableProperties = v10->_hmbUnavailableProperties;
    v10->_hmbUnavailableProperties = (NSSet *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CAD0] set];
    hmbReadOnlyProperties = v10->_hmbReadOnlyProperties;
    v10->_hmbReadOnlyProperties = (NSSet *)v13;

    v15 = v10;
  }

  return v10;
}

- (BOOL)hmbPropertyIsAvailable:(id)a3
{
  id v4 = a3;
  v5 = [(HMBModel *)self hmbUnavailableProperties];
  char v6 = [v5 containsObject:v4];

  return v6 ^ 1;
}

- (NSSet)hmbUnavailableProperties
{
  return self->_hmbUnavailableProperties;
}

- (NSMutableDictionary)hmbReserved
{
  return self->_hmbReserved;
}

- (BOOL)hmbPropertyIsReadOnly:(id)a3
{
  id v4 = a3;
  v5 = [(HMBModel *)self hmbReadOnlyProperties];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (NSSet)hmbReadOnlyProperties
{
  return self->_hmbReadOnlyProperties;
}

- (void)setHmbReserved:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hmbModelContainer);
  objc_storeStrong((id *)&self->_hmbReadOnlyProperties, 0);
  objc_storeStrong((id *)&self->_hmbUnavailableProperties, 0);
  objc_storeStrong((id *)&self->_hmbDataVersion, 0);
  objc_storeStrong((id *)&self->_hmbType, 0);
  objc_storeStrong((id *)&self->_hmbParentModelID, 0);
  objc_storeStrong((id *)&self->_hmbModelID, 0);
  objc_storeStrong((id *)&self->_hmbReserved, 0);
}

- (NSUUID)hmbModelID
{
  return self->_hmbModelID;
}

- (void)setHmbModelContainer:(id)a3
{
}

- (HMBModelContainer)hmbModelContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hmbModelContainer);
  return (HMBModelContainer *)WeakRetained;
}

- (BOOL)hmbIgnoreModel
{
  return self->_hmbIgnoreModel;
}

- (void)setHmbReadOnlyProperties:(id)a3
{
}

- (void)setHmbUnavailableProperties:(id)a3
{
}

- (void)setHmbRecordRow:(unint64_t)a3
{
  self->_hmbRecordRow = a3;
}

- (unint64_t)hmbRecordRow
{
  return self->_hmbRecordRow;
}

- (void)setHmbDataVersion:(id)a3
{
}

- (void)setHmbType:(id)a3
{
}

- (void)setHmbParentModelID:(id)a3
{
}

- (NSUUID)hmbParentModelID
{
  return self->_hmbParentModelID;
}

- (void)setHmbModelID:(id)a3
{
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  id v4 = [(HMBModel *)self hmbModelID];
  v5 = (void *)[v3 initWithName:@"UUID" value:v4];
  v8[0] = v5;
  char v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

- (NSString)hmbDescription
{
  id v3 = NSString;
  id v4 = [(HMBModel *)self hmbCanonicalType];
  v5 = [(HMBModel *)self hmbModelID];
  char v6 = [v3 stringWithFormat:@"%@.%@", v4, v5];

  return (NSString *)v6;
}

- (void)dumpDebug
{
}

- (void)dumpDebug:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = [(HMBModel *)self debugDescription];
  v5 = [v4 componentsSeparatedByString:@"\n"];

  id obj = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v11 = (void *)MEMORY[0x1D944CB30]();
        v12 = self;
        uint64_t v13 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v14 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          v22 = v14;
          __int16 v23 = 2112;
          id v24 = v15;
          __int16 v25 = 2112;
          uint64_t v26 = v10;
          _os_log_impl(&dword_1D4693000, v13, OS_LOG_TYPE_INFO, "%{public}@%@%@", buf, 0x20u);
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v27 count:16];
    }
    while (v7);
  }
}

- (NSSet)hmbSetExternalRecordFields
{
  id v3 = [(HMBModel *)self hmbSetExternalProperties];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__HMBModel_hmbSetExternalRecordFields__block_invoke;
  v6[3] = &unk_1E69E9C40;
  v6[4] = self;
  id v4 = objc_msgSend(v3, "na_map:", v6);

  return (NSSet *)v4;
}

id __38__HMBModel_hmbSetExternalRecordFields__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [(id)objc_opt_class() hmbProperties];
  id v4 = [v3 objectForKeyedSubscript:v2];

  v5 = [v4 externalRecordField];

  return v5;
}

- (NSSet)hmbSetExternalProperties
{
  id v3 = [(id)objc_opt_class() hmbExternalProperties];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__HMBModel_hmbSetExternalProperties__block_invoke;
  v6[3] = &unk_1E69EA710;
  v6[4] = self;
  id v4 = objc_msgSend(v3, "na_filter:", v6);

  return (NSSet *)v4;
}

BOOL __36__HMBModel_hmbSetExternalProperties__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 hmbReserved];
  v5 = [v4 objectForKeyedSubscript:v3];

  return v5 != 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(HMBModel *)self hmbModelID];
  uint64_t v6 = [(HMBModel *)self hmbParentModelID];
  uint64_t v7 = [v4 initWithModelID:v5 parentModelID:v6];

  uint64_t v8 = [(NSMutableDictionary *)self->_hmbReserved mutableCopy];
  v9 = *(void **)(v7 + 16);
  *(void *)(v7 + 16) = v8;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_hmbModelContainer);
  objc_storeWeak((id *)(v7 + 80), WeakRetained);

  objc_storeStrong((id *)(v7 + 48), self->_hmbDataVersion);
  objc_storeStrong((id *)(v7 + 40), self->_hmbType);
  objc_storeStrong((id *)(v7 + 64), self->_hmbUnavailableProperties);
  objc_storeStrong((id *)(v7 + 72), self->_hmbReadOnlyProperties);
  *(void *)(v7 + 56) = self->_hmbRecordRow;
  return (id)v7;
}

- (NSString)debugDescription
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28E78] string];
  uint64_t v4 = [(HMBModel *)self hmbCanonicalType];
  v5 = (void *)v4;
  uint64_t v6 = &stru_1F2C3E4E0;
  if (self->_hmbType) {
    uint64_t v7 = &stru_1F2C3E4E0;
  }
  else {
    uint64_t v7 = @" (inferred)";
  }
  [v3 appendFormat:@"%@:%@", v4, v7];

  uint64_t v8 = [(HMBModel *)self hmbModelID];
  v9 = [v8 UUIDString];
  [v3 appendFormat:@"\n  uuid: %@", v9];

  uint64_t v10 = [(HMBModel *)self hmbParentModelID];
  uint64_t v11 = [v10 UUIDString];
  [v3 appendFormat:@"\n  parent: %@", v11];

  if (self->_hmbDataVersion) {
    hmbDataVersion = self->_hmbDataVersion;
  }
  else {
    hmbDataVersion = (HMFVersion *)@"<UNSET>";
  }
  uint64_t v13 = [(HMBModel *)self hmbContainerDataVersion];
  v14 = "";
  if (!v13) {
    v14 = " (override)";
  }
  id v32 = v3;
  [v3 appendFormat:@"\n  version: %@%s", hmbDataVersion, v14];

  id v15 = [(id)objc_opt_class() hmbProperties];
  BOOL v30 = +[HMBModel hmbShouldLogPrivateInformation];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v15;
  uint64_t v16 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v33 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v35 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        long long v20 = [(id)objc_opt_class() hmbProperties];
        v21 = [v20 objectForKey:v19];

        v22 = [(HMBModel *)self hmbReserved];
        __int16 v23 = [v22 valueForKey:v19];

        if (v23)
        {
          id v24 = +[HMBModel formattedStringForValue:v23];
          __int16 v25 = v6;
          uint64_t v26 = v6;
        }
        else
        {
          v27 = [v21 defaultValue];

          if (!v27) {
            goto LABEL_27;
          }
          __int16 v23 = [v21 defaultValue];
          id v24 = +[HMBModel formattedStringForValue:v23];
          __int16 v25 = v6;
          uint64_t v26 = @" (default)";
        }

        uint64_t v6 = v25;
        if ([(HMBModel *)self hmbPropertyIsReadOnly:v19]) {
          uint64_t v28 = @" (read-only)";
        }
        else {
          uint64_t v28 = v25;
        }
        if ([v21 loggingVisibility] == 3
          || !v30 && (!v21 || [v21 loggingVisibility] == 1))
        {

          id v24 = @"...";
        }
        [v32 appendFormat:@"\n  %@%@%@: %@", v19, v28, v26, v24];

LABEL_27:
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v17);
  }

  return (NSString *)v32;
}

- (BOOL)hmbCanonicalTypeInferred
{
  return self->_hmbType == 0;
}

- (NSString)hmbCanonicalType
{
  id v2 = self->_hmbType;
  if (!v2)
  {
    id v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    id v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  char v6 = [(NSString *)v2 isEqual:v5];

  if (v6)
  {
    uint64_t v7 = v2;
  }
  else
  {
    uint64_t v8 = NSString;
    v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    uint64_t v7 = [v8 stringWithFormat:@"%@/%@", v10, v2];
  }
  return v7;
}

- (id)hmbPropertyNamed:(id)a3
{
  return [(HMBModel *)self hmbPropertyNamed:a3 isSet:0];
}

- (id)hmbDefaultValueForPropertyNamed:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(id)objc_opt_class() hmbProperties];
  char v6 = [v5 objectForKey:v4];

  if (v6)
  {
    uint64_t v7 = [v6 defaultValue];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1D944CB30]();
    v9 = self;
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      v12 = [(HMBModel *)v9 hmbCanonicalType];
      int v14 = 138543874;
      id v15 = v11;
      __int16 v16 = 2112;
      id v17 = v4;
      __int16 v18 = 2112;
      uint64_t v19 = v12;
      _os_log_impl(&dword_1D4693000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unable to get default value of property %@ from type %@ (no such property exists)", (uint8_t *)&v14, 0x20u);
    }
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)hmbPropertyNamed:(id)a3 isSet:(BOOL *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(id)objc_opt_class() hmbProperties];
  uint64_t v8 = [v7 objectForKey:v6];

  if (!v8)
  {
    uint64_t v11 = (void *)MEMORY[0x1D944CB30]();
    v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = HMFGetLogIdentifier();
      id v15 = [(HMBModel *)v12 hmbCanonicalType];
      int v17 = 138543874;
      __int16 v18 = v14;
      __int16 v19 = 2112;
      id v20 = v6;
      __int16 v21 = 2112;
      v22 = v15;
      _os_log_impl(&dword_1D4693000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to get value of property %@ from type %@ (no such property exists)", (uint8_t *)&v17, 0x20u);
    }
    goto LABEL_9;
  }
  v9 = [(HMBModel *)self hmbReserved];
  uint64_t v10 = [v9 objectForKey:v6];

  if (a4) {
    *a4 = v10 != 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

LABEL_9:
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)hmbUnsetPropertyNamed:(id)a3
{
}

- (void)hmbSetProperty:(id)a3 named:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9)
  {
    id v7 = v9;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v8 = v7;
  __setProperty(self, v6, v7);
}

- (HMFVersion)hmbMinimumSupportedVersion
{
  id v2 = [(HMBModel *)self hmbReserved];
  id v3 = objc_msgSend(v2, "hmf_stringForKey:", @"_i");

  if (v3) {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F65590]) initWithVersionString:v3];
  }
  else {
    id v4 = 0;
  }

  return (HMFVersion *)v4;
}

- (void)setHmbMinimumSupportedVersion:(id)a3
{
  id v8 = a3;
  id v4 = [(HMBModel *)self hmbReserved];

  if (!v4)
  {
    v5 = [MEMORY[0x1E4F1CA60] dictionary];
    [(HMBModel *)self setHmbReserved:v5];
  }
  id v6 = [v8 versionString];
  id v7 = [(HMBModel *)self hmbReserved];
  [v7 setObject:v6 forKeyedSubscript:@"_i"];
}

- (NSString)hmbType
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  hmbType = self->_hmbType;
  if (hmbType)
  {
    id v3 = hmbType;
  }
  else
  {
    v5 = (void *)MEMORY[0x1D944CB30]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      int v11 = 138543362;
      v12 = v8;
      _os_log_impl(&dword_1D4693000, v7, OS_LOG_TYPE_INFO, "%{public}@[HMBModel hmbType] called without having an associated id<HMBModelContainer>.", (uint8_t *)&v11, 0xCu);
    }
    id v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    id v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)hmbIsDifferentFromModel:(id)a3 differingFields:(id *)a4
{
  id v6 = a3;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = [MEMORY[0x1E4F1CA80] set];
    id v8 = [(id)objc_opt_class() hmbPropertyNames];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    int v14 = __52__HMBModel_hmbIsDifferentFromModel_differingFields___block_invoke;
    id v15 = &unk_1E69E9BF8;
    __int16 v16 = self;
    id v17 = v6;
    id v9 = v7;
    id v18 = v9;
    __int16 v19 = a4;
    [v8 enumerateObjectsUsingBlock:&v12];

    if (a4) {
      *a4 = v9;
    }
    BOOL v10 = objc_msgSend(v9, "count", v12, v13, v14, v15, v16) != 0;
  }
  else
  {
    if (a4)
    {
      *a4 = [(HMBModel *)self hmbSetProperties];
    }
    BOOL v10 = 1;
  }

  return v10;
}

void __52__HMBModel_hmbIsDifferentFromModel_differingFields___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  char v9 = 0;
  id v6 = [*(id *)(a1 + 32) hmbPropertyNamed:v5 isSet:&v9];
  char v8 = 0;
  id v7 = [*(id *)(a1 + 40) hmbPropertyNamed:v5 isSet:&v8];
  if (v9 != v8 || (__isEqualDeepCompare(v6, v7) & 1) == 0)
  {
    [*(id *)(a1 + 48) addObject:v5];
    if (!*(void *)(a1 + 56)) {
      *a3 = 1;
    }
  }
}

- (id)hmbModelByMergingSetPropertiesFromModel:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[(HMBModel *)self copy];
  [v5 hmbMergeSetPropertiesFromModel:v4];

  return v5;
}

- (void)hmbMergeSetPropertiesFromModel:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = objc_msgSend(v4, "hmbSetProperties", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        int v11 = [v4 hmbPropertyNamed:v10 isSet:0];
        [(HMBModel *)self hmbSetProperty:v11 named:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (id)hmbModelByMergingFromModel:(id)a3 isFromCloud:(BOOL)a4 error:(id *)a5
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (HMBModel *)a3;
  char v9 = v8;
  if (v8 == self)
  {
    uint64_t v17 = v8;
    goto LABEL_52;
  }
  BOOL v80 = a4;
  uint64_t v10 = self;
  int v11 = v9;
  if ([(HMBModel *)v10 hmbCanonicalTypeInferred])
  {
    long long v12 = (void *)MEMORY[0x1D944CB30]();
    long long v13 = v10;
    long long v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      long long v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v95 = v15;
      _os_log_impl(&dword_1D4693000, v14, OS_LOG_TYPE_ERROR, "%{public}@[HMBModel hmbMerge:from:] called with nil container on target (worrysome in production code).", buf, 0xCu);
    }
    uint64_t v16 = objc_opt_class();
  }
  else
  {
    id v18 = [(HMBModel *)v10 hmbType];
    uint64_t v16 = (uint64_t)NSClassFromString(v18);
  }
  if ([(HMBModel *)v11 hmbCanonicalTypeInferred])
  {
    __int16 v19 = (void *)MEMORY[0x1D944CB30]();
    id v20 = v10;
    __int16 v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v95 = v22;
      _os_log_impl(&dword_1D4693000, v21, OS_LOG_TYPE_ERROR, "%{public}@[HMBModel hmbMerge:from:] called with nil container on source (worrysome in production code).", buf, 0xCu);
    }
    uint64_t v23 = objc_opt_class();
    if (!v16)
    {
LABEL_19:
      if (!(v16 | v23))
      {
        id v32 = [(HMBModel *)v10 hmbType];
        uint64_t v33 = [(HMBModel *)v11 hmbType];
        char v34 = [v32 isEqualToString:v33];

        uint64_t v35 = MEMORY[0x1D944CB30]();
        long long v36 = v10;
        long long v37 = HMFGetOSLogHandle();
        BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_INFO);
        if (v34)
        {
          if (v38)
          {
            uint64_t v39 = HMFGetLogIdentifier();
            v40 = [(HMBModel *)v36 hmbType];
            *(_DWORD *)buf = 138543618;
            v95 = v39;
            __int16 v96 = 2112;
            v97 = v40;
            _os_log_impl(&dword_1D4693000, v37, OS_LOG_TYPE_INFO, "%{public}@Merging two unknown model objects object using the default rules %@.", buf, 0x16u);
LABEL_29:
          }
        }
        else if (v38)
        {
          uint64_t v39 = HMFGetLogIdentifier();
          v40 = [(HMBModel *)v36 hmbType];
          v51 = [(HMBModel *)v11 hmbType];
          *(_DWORD *)buf = 138543874;
          v95 = v39;
          __int16 v96 = 2112;
          v97 = v40;
          __int16 v98 = 2112;
          v99 = v51;
          _os_log_impl(&dword_1D4693000, v37, OS_LOG_TYPE_INFO, "%{public}@Merging two unknown model objects object using the default rules (%@ and %@)", buf, 0x20u);

          goto LABEL_29;
        }

        v52 = (void *)v35;
LABEL_35:
        goto LABEL_36;
      }
      uint64_t v41 = MEMORY[0x1D944CB30]();
      v42 = v10;
      v43 = HMFGetOSLogHandle();
      v44 = v43;
      if (!v16 || v23)
      {
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          v45 = HMFGetLogIdentifier();
          v46 = [(HMBModel *)v42 hmbType];
          v47 = [(HMBModel *)v11 hmbType];
          *(_DWORD *)buf = 138543874;
          v95 = v45;
          __int16 v96 = 2112;
          v97 = v46;
          __int16 v98 = 2112;
          v99 = v47;
          v48 = "%{public}@Going to merge, but things won't be better until our type flips. (%@ / %@)";
          v49 = v44;
          os_log_type_t v50 = OS_LOG_TYPE_ERROR;
          goto LABEL_33;
        }
      }
      else if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        v45 = HMFGetLogIdentifier();
        v46 = [(HMBModel *)v11 hmbType];
        v47 = [(HMBModel *)v42 hmbType];
        *(_DWORD *)buf = 138543874;
        v95 = v45;
        __int16 v96 = 2112;
        v97 = v46;
        __int16 v98 = 2112;
        v99 = v47;
        v48 = "%{public}@Going to merge unknown (probably from future) model type %@ with %@.";
        v49 = v44;
        os_log_type_t v50 = OS_LOG_TYPE_INFO;
LABEL_33:
        _os_log_impl(&dword_1D4693000, v49, v50, v48, buf, 0x20u);
      }
      v52 = (void *)v41;
      goto LABEL_35;
    }
  }
  else
  {
    id v24 = [(HMBModel *)v11 hmbType];
    uint64_t v23 = (uint64_t)NSClassFromString(v24);

    if (!v16) {
      goto LABEL_19;
    }
  }
  if (!v23) {
    goto LABEL_19;
  }
  if (([(id)v16 isSubclassOfClass:v23] & 1) == 0)
  {
    __int16 v25 = (void *)MEMORY[0x1D944CB30]();
    uint64_t v26 = v10;
    v27 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = HMFGetLogIdentifier();
      v29 = NSStringFromClass((Class)v16);
      BOOL v30 = NSStringFromClass((Class)v23);
      *(_DWORD *)buf = 138543874;
      v95 = v28;
      __int16 v96 = 2112;
      v97 = v29;
      __int16 v98 = 2112;
      v99 = v30;
      _os_log_impl(&dword_1D4693000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot merge. This object %@ is not a sub-class of %@", buf, 0x20u);
    }
    v31 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:3];
    goto LABEL_37;
  }
LABEL_36:
  v31 = 0;
LABEL_37:

  if (v31)
  {
    uint64_t v17 = 0;
    if (a5) {
      *a5 = v31;
    }
  }
  else
  {
    v79 = v9;
    v53 = (void *)[(HMBModel *)v10 copy];
    v54 = [v53 hmbReserved];
    v55 = (void *)[v54 mutableCopy];

    uint64_t v56 = objc_opt_class();
    v57 = [(HMBModel *)v11 hmbReserved];
    v82[0] = MEMORY[0x1E4F143A8];
    v82[1] = 3221225472;
    v82[2] = __57__HMBModel_hmbModelByMergingFromModel_isFromCloud_error___block_invoke;
    v82[3] = &unk_1E69E9BD0;
    id v58 = v53;
    BOOL v88 = v80;
    uint64_t v87 = v56;
    id v83 = v58;
    v84 = v10;
    v59 = v11;
    v85 = v59;
    id v60 = v55;
    id v86 = v60;
    [v57 enumerateKeysAndObjectsUsingBlock:v82];

    [v58 setHmbReserved:v60];
    v61 = v58;
    v62 = v59;
    if (!v61[6]
      || ([v61 hmbDataVersion],
          v63 = objc_claimAutoreleasedReturnValue(),
          [(HMBModel *)v62 hmbDataVersion],
          v64 = objc_claimAutoreleasedReturnValue(),
          char v65 = [v63 isGreaterThanOrEqualTo:v64],
          v64,
          v63,
          (v65 & 1) == 0))
    {
      id v81 = v60;
      v66 = [(HMBModel *)v62 hmbDataVersion];
      v67 = (void *)[v66 copy];
      [v61 setHmbDataVersion:v67];

      long long v91 = 0u;
      long long v92 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      v93[0] = @"_U";
      v93[1] = @"_R";
      v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:2];
      uint64_t v69 = [v68 countByEnumeratingWithState:&v89 objects:buf count:16];
      if (v69)
      {
        uint64_t v70 = v69;
        uint64_t v71 = *(void *)v90;
        do
        {
          for (uint64_t i = 0; i != v70; ++i)
          {
            if (*(void *)v90 != v71) {
              objc_enumerationMutation(v68);
            }
            uint64_t v73 = *(void *)(*((void *)&v89 + 1) + 8 * i);
            v74 = [(HMBModel *)v62 hmbReserved];
            v75 = objc_msgSend(v74, "hmf_dictionaryForKey:", v73);

            v76 = [v61 hmbReserved];
            [v76 setObject:v75 forKey:v73];
          }
          uint64_t v70 = [v68 countByEnumeratingWithState:&v89 objects:buf count:16];
        }
        while (v70);
      }

      __calculateUnavailableReadOnly(v61, 0);
      id v60 = v81;
    }

    v77 = v86;
    uint64_t v17 = v61;

    char v9 = v79;
  }

LABEL_52:
  return v17;
}

void __57__HMBModel_hmbModelByMergingFromModel_isFromCloud_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v5 characterAtIndex:0] == 95) {
    goto LABEL_19;
  }
  uint64_t v7 = [(id)objc_opt_class() hmbPropertyNames];
  int v8 = [v7 containsObject:v5];

  if (!v8) {
    goto LABEL_14;
  }
  if (*(unsigned char *)(a1 + 72))
  {
    char v9 = [*(id *)(a1 + 64) hmbProperties];
    uint64_t v10 = [v9 valueForKey:v5];

    if ([v10 excludeFromCloudStorage])
    {
      int v11 = [v10 externalRecordField];

      if (!v11)
      {
        __int16 v21 = (void *)MEMORY[0x1D944CB30]();
        id v22 = *(id *)(a1 + 40);
        uint64_t v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          id v24 = HMFGetLogIdentifier();
          __int16 v25 = [*(id *)(a1 + 48) hmbType];
          int v26 = 138543874;
          v27 = v24;
          __int16 v28 = 2112;
          id v29 = v25;
          __int16 v30 = 2112;
          id v31 = v5;
          _os_log_impl(&dword_1D4693000, v23, OS_LOG_TYPE_INFO, "%{public}@Model %@ from cloud contained local only property %@, dropping", (uint8_t *)&v26, 0x20u);
        }
        goto LABEL_18;
      }
    }
  }
  if (![*(id *)(a1 + 32) hmbPropertyIsReadOnly:v5])
  {
    id v18 = [*(id *)(a1 + 32) hmbReserved];
    uint64_t v10 = [v18 objectForKeyedSubscript:v5];

    if (objc_opt_respondsToSelector())
    {
      __int16 v19 = *(void **)(a1 + 56);
      id v20 = [v10 hmbObjectByMergingFromObject:v6];
      [v19 setValue:v20 forKey:v5];

LABEL_18:
      goto LABEL_19;
    }

LABEL_14:
    [*(id *)(a1 + 56) setValue:v6 forKey:v5];
    goto LABEL_19;
  }
  long long v12 = (void *)MEMORY[0x1D944CB30]();
  id v13 = *(id *)(a1 + 40);
  long long v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    long long v15 = HMFGetLogIdentifier();
    uint64_t v16 = [*(id *)(a1 + 32) hmbType];
    uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 48);
    int v26 = 138544130;
    v27 = v15;
    __int16 v28 = 2112;
    id v29 = v5;
    __int16 v30 = 2112;
    id v31 = v16;
    __int16 v32 = 2112;
    uint64_t v33 = v17;
    _os_log_impl(&dword_1D4693000, v14, OS_LOG_TYPE_INFO, "%{public}@Unable to merge %@ property of model class %@ (marked readonly for %@).", (uint8_t *)&v26, 0x2Au);
  }
LABEL_19:
}

- (BOOL)hmbValidForStorage:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4) {
    [(HMBModel *)self hmbAssociateWithContainer:v4];
  }
  objc_opt_class();
  if (objc_opt_respondsToSelector())
  {
    id v5 = (void *)MEMORY[0x1D944CB30]();
    id v6 = self;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = HMFGetLogIdentifier();
      char v9 = [(HMBModel *)v6 hmbCanonicalType];
      uint64_t v10 = [(HMBModel *)v6 hmbModelID];
      int v11 = [v10 UUIDString];
      long long v12 = [(HMBModel *)v6 hmbParentModelID];
      id v13 = [v12 UUIDString];
      *(_DWORD *)buf = 138544130;
      id v47 = v8;
      __int16 v48 = 2112;
      v49 = v9;
      __int16 v50 = 2112;
      v51 = v11;
      __int16 v52 = 2112;
      v53 = v13;
      _os_log_impl(&dword_1D4693000, v7, OS_LOG_TYPE_ERROR, "%{public}@Model %@.%@.%@ suppressing validity check due to HMDBackingStoreModelObject backport.", buf, 0x2Au);
    }
    BOOL v14 = 1;
  }
  else
  {
    long long v15 = [(id)objc_opt_class() hmbProperties];
    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x2020000000;
    char v45 = 1;
    uint64_t v16 = [(HMBModel *)self hmbModelID];
    BOOL v17 = v16 == 0;

    if (v17)
    {
      id v18 = (void *)MEMORY[0x1D944CB30]();
      __int16 v19 = self;
      HMFGetOSLogHandle();
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        long long v37 = v18;
        HMFGetLogIdentifier();
        id v21 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v39 = [(HMBModel *)v19 hmbCanonicalType];
        id v22 = [(HMBModel *)v19 hmbModelID];
        uint64_t v23 = [v22 UUIDString];
        id v24 = [(HMBModel *)v19 hmbParentModelID];
        __int16 v25 = [v24 UUIDString];
        *(_DWORD *)buf = 138544130;
        id v47 = v21;
        __int16 v48 = 2112;
        v49 = v39;
        __int16 v50 = 2112;
        v51 = v23;
        __int16 v52 = 2112;
        v53 = v25;
        _os_log_impl(&dword_1D4693000, v20, OS_LOG_TYPE_FAULT, "%{public}@Model %@.%@.%@ is not valid for storage (modelID is not set).", buf, 0x2Au);

        id v18 = v37;
      }

      *((unsigned char *)v43 + 24) = 0;
    }
    int v26 = [(HMBModel *)self hmbParentModelID];
    BOOL v27 = v26 == 0;

    if (v27)
    {
      __int16 v28 = (void *)MEMORY[0x1D944CB30]();
      id v29 = self;
      HMFGetOSLogHandle();
      __int16 v30 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      {
        BOOL v38 = v28;
        HMFGetLogIdentifier();
        id v31 = (id)objc_claimAutoreleasedReturnValue();
        v40 = [(HMBModel *)v29 hmbCanonicalType];
        __int16 v32 = [(HMBModel *)v29 hmbModelID];
        uint64_t v33 = [v32 UUIDString];
        uint64_t v34 = [(HMBModel *)v29 hmbParentModelID];
        uint64_t v35 = [v34 UUIDString];
        *(_DWORD *)buf = 138544130;
        id v47 = v31;
        __int16 v48 = 2112;
        v49 = v40;
        __int16 v50 = 2112;
        v51 = v33;
        __int16 v52 = 2112;
        v53 = v35;
        _os_log_impl(&dword_1D4693000, v30, OS_LOG_TYPE_FAULT, "%{public}@Model %@.%@.%@ is not valid for storage (parentModelID is not set).", buf, 0x2Au);

        __int16 v28 = v38;
      }

      *((unsigned char *)v43 + 24) = 0;
    }
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __31__HMBModel_hmbValidForStorage___block_invoke;
    v41[3] = &unk_1E69E9BA8;
    v41[4] = self;
    v41[5] = &v42;
    objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v41, v38);
    BOOL v14 = *((unsigned char *)v43 + 24) != 0;
    _Block_object_dispose(&v42, 8);
  }
  return v14;
}

void __31__HMBModel_hmbValidForStorage___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (([v8 isOptional] & 1) == 0 && (objc_msgSend(*(id *)(a1 + 32), "hmbPropertyWasSet:", v7) & 1) == 0)
  {
    char v9 = (void *)MEMORY[0x1D944CB30]();
    id v10 = *(id *)(a1 + 32);
    int v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      long long v12 = HMFGetLogIdentifier();
      id v13 = [*(id *)(a1 + 32) hmbCanonicalType];
      BOOL v17 = [*(id *)(a1 + 32) hmbModelID];
      [v17 UUIDString];
      v14 = id v18 = v9;
      uint64_t v16 = [*(id *)(a1 + 32) hmbParentModelID];
      long long v15 = [v16 UUIDString];
      *(_DWORD *)buf = 138544386;
      id v20 = v12;
      __int16 v21 = 2112;
      id v22 = v13;
      __int16 v23 = 2112;
      id v24 = v14;
      __int16 v25 = 2112;
      int v26 = v15;
      __int16 v27 = 2112;
      id v28 = v7;
      _os_log_impl(&dword_1D4693000, v11, OS_LOG_TYPE_FAULT, "%{public}@Model %@.%@.%@ is not valid for storage (field %@ is not set).", buf, 0x34u);

      char v9 = v18;
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (BOOL)hmbIsModelGenericRepresentation
{
  uint64_t v2 = [(id)objc_opt_class() hmbGenericRepresentation];
  if ([(id)objc_opt_class() isEqual:v2]) {
    return 1;
  }
  id v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  return [v4 isEqual:v5];
}

- (BOOL)hmbIsModelReadOnly
{
  if ([(HMBModel *)self hmbIsModelGenericRepresentation]) {
    return 1;
  }
  id v4 = [(id)objc_opt_class() hmbReadOnlyBefore];
  if (v4)
  {
    uint64_t v5 = [(HMBModel *)self hmbContainerDataVersion];
    char v3 = [v4 isGreaterThanOrEqualTo:v5];
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)hmbPropertyWasSet:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMBModel *)self hmbReserved];
  id v6 = [v5 valueForKey:v4];
  if (v6)
  {
    id v7 = [(HMBModel *)self hmbUnavailableProperties];
    int v8 = [v7 containsObject:v4] ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (NSSet)hmbSetProperties
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  char v3 = (void *)MEMORY[0x1E4F1CA80];
  id v4 = [(HMBModel *)self hmbReserved];
  uint64_t v5 = objc_msgSend(v3, "setWithCapacity:", objc_msgSend(v4, "count"));

  id v6 = [(HMBModel *)self hmbUnavailableProperties];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [(HMBModel *)self hmbReserved];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v12 characterAtIndex:0] != 95
          && ([v6 containsObject:v12] & 1) == 0)
        {
          [v5 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return (NSSet *)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 hmbModelID];
    uint64_t v9 = [(HMBModel *)self hmbModelID];
    char v10 = [v8 isEqual:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v2 = [(HMBModel *)self hmbModelID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)prepareForStorageLocation:(unint64_t)a3 using:(id)a4 updatedModelIDs:(id)a5 error:(id *)a6
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  uint64_t v57 = 0;
  id v58 = &v57;
  uint64_t v59 = 0x3032000000;
  id v60 = __Block_byref_object_copy__1911;
  v61 = __Block_byref_object_dispose__1912;
  id v62 = 0;
  long long v12 = [(HMBModel *)self hmbModelID];
  if (!v12
    || ([(HMBModel *)self hmbParentModelID],
        id v13 = objc_claimAutoreleasedReturnValue(),
        BOOL v14 = v13 == 0,
        v13,
        v12,
        v14))
  {
    id v31 = (void *)MEMORY[0x1D944CB30]();
    __int16 v32 = self;
    HMFGetOSLogHandle();
    uint64_t v33 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      uint64_t v34 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v64 = v34;
      __int16 v65 = 2112;
      v66 = v32;
      _os_log_impl(&dword_1D4693000, v33, OS_LOG_TYPE_ERROR, "%{public}@Cannot prepare model for container because modelID or parentModelID are missing: %@", buf, 0x16u);
    }
    if (a6)
    {
      id v35 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:&unk_1F2C4CB70];
LABEL_13:
      id v30 = 0;
      *a6 = v35;
      goto LABEL_28;
    }
LABEL_18:
    id v30 = 0;
    goto LABEL_28;
  }
  if (!self->_hmbDataVersion)
  {
    long long v36 = (void *)MEMORY[0x1D944CB30]();
    long long v37 = self;
    HMFGetOSLogHandle();
    BOOL v38 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      uint64_t v39 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v64 = v39;
      __int16 v65 = 2112;
      v66 = v37;
      _os_log_impl(&dword_1D4693000, v38, OS_LOG_TYPE_ERROR, "%{public}@Cannot prepare model for container because hmbDataVersion is missing: %@", buf, 0x16u);
    }
    if (a6)
    {
      id v35 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:&unk_1F2C4CB98];
      goto LABEL_13;
    }
    goto LABEL_18;
  }
  long long v15 = [(HMBModel *)self hmbPrepareForStorageLocation:a3];
  long long v16 = [(HMBModel *)self hmbDataVersion];
  long long v17 = [v16 versionString];
  [v15 setObject:v17 forKeyedSubscript:@"_V"];

  id v18 = [(HMBModel *)self hmbType];
  [v15 setObject:v18 forKeyedSubscript:@"_T"];

  uint64_t v19 = [(HMBModel *)self hmbModelID];
  id v20 = [v19 UUIDString];
  [v15 setObject:v20 forKeyedSubscript:@"_u"];

  __int16 v21 = [(HMBModel *)self hmbParentModelID];
  id v22 = [v21 UUIDString];
  [v15 setObject:v22 forKeyedSubscript:@"_P"];

  __int16 v23 = [(HMBModel *)self hmbMinimumSupportedVersion];
  LODWORD(v21) = v23 == 0;

  if (v21)
  {
    id v24 = [v15 objectForKeyedSubscript:@"_T"];
    [v15 setObject:v24 forKeyedSubscript:@"_t"];
  }
  __int16 v25 = __modelReferenceFields(self);
  int v26 = [(id)objc_opt_class() hmbProperties];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __66__HMBModel_prepareForStorageLocation_using_updatedModelIDs_error___block_invoke;
  v49[3] = &unk_1E69E9B80;
  id v27 = v15;
  v55 = &v57;
  id v50 = v27;
  v51 = self;
  id v52 = v11;
  id v28 = v25;
  id v53 = v28;
  id v54 = v10;
  unint64_t v56 = a3;
  [v26 enumerateKeysAndObjectsUsingBlock:v49];

  uint64_t v29 = (void *)v58[5];
  if (v29)
  {
    id v30 = 0;
    if (a6) {
      *a6 = v29;
    }
  }
  else
  {
    v40 = [(HMBModel *)self hmbReserved];
    uint64_t v41 = objc_msgSend(v40, "hmf_dictionaryForKey:", @"_R");

    if ([v41 count])
    {
      uint64_t v42 = objc_msgSend(v41, "na_dictionaryByMappingValues:", &__block_literal_global_434);
      [v27 setObject:v42 forKeyedSubscript:@"_R"];
    }
    v43 = [(HMBModel *)self hmbReserved];
    uint64_t v44 = objc_msgSend(v43, "hmf_dictionaryForKey:", @"_U");

    if ([v44 count])
    {
      char v45 = objc_msgSend(v44, "na_dictionaryByMappingValues:", &__block_literal_global_434);
      [v27 setObject:v45 forKeyedSubscript:@"_U"];
    }
    v46 = (objc_class *)[(id)objc_opt_class() hmbGenericRepresentation];
    if (v46 && ([(objc_class *)v46 isEqual:objc_opt_class()] & 1) == 0)
    {
      id v47 = NSStringFromClass(v46);
      [v27 setObject:v47 forKeyedSubscript:@"_G"];
    }
    id v30 = v27;
  }
LABEL_28:
  _Block_object_dispose(&v57, 8);

  return v30;
}

void __66__HMBModel_prepareForStorageLocation_using_updatedModelIDs_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
  if (!v9) {
    goto LABEL_34;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v13 = +[HMBModelContainer allowedTypes];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v56 objects:v70 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v57;
LABEL_8:
        uint64_t v17 = 0;
        while (1)
        {
          if (*(void *)v57 != v16) {
            objc_enumerationMutation(v13);
          }
          if (objc_opt_isKindOfClass()) {
            goto LABEL_33;
          }
          if (v15 == ++v17)
          {
            uint64_t v15 = [v13 countByEnumeratingWithState:&v56 objects:v70 count:16];
            if (v15) {
              goto LABEL_8;
            }
            break;
          }
        }
      }

      if (objc_msgSend((id)objc_msgSend(v8, "classObj"), "isEqual:", objc_opt_class()))
      {
        id v13 = [NSString stringWithFormat:@"Cannot encode value of type %@ for property '%@' requring NSObject type", objc_opt_class(), v7];
        id v18 = (void *)MEMORY[0x1D944CB30]();
        id v19 = *(id *)(a1 + 40);
        id v20 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          __int16 v21 = HMFGetLogIdentifier();
          id v22 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138543874;
          __int16 v65 = v21;
          __int16 v66 = 2112;
          uint64_t v67 = v22;
          __int16 v68 = 2112;
          id v69 = v13;
          _os_log_impl(&dword_1D4693000, v20, OS_LOG_TYPE_ERROR, "%{public}@Cannot prepare model %@ for container: %@", buf, 0x20u);
        }
        __int16 v23 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v24 = *MEMORY[0x1E4F64ED0];
        id v62 = @"message";
        id v63 = v13;
        __int16 v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
        uint64_t v26 = [v23 errorWithDomain:v24 code:3 userInfo:v25];
        uint64_t v27 = *(void *)(*(void *)(a1 + 72) + 8);
        id v28 = *(void **)(v27 + 40);
        *(void *)(v27 + 40) = v26;

        *a4 = 1;
LABEL_33:

        goto LABEL_34;
      }
      if (*(void *)(a1 + 48) && [*(id *)(a1 + 56) containsObject:v7])
      {
        id v29 = v9;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v30 = v29;
        }
        else {
          id v30 = 0;
        }
        id v13 = v30;

        uint64_t v31 = [v13 isValidForContainer:*(void *)(a1 + 64) updatedModelIDs:*(void *)(a1 + 48)];
        uint64_t v32 = *(void *)(*(void *)(a1 + 72) + 8);
        uint64_t v33 = *(void **)(v32 + 40);
        *(void *)(v32 + 40) = v31;

        uint64_t v34 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
        if (v34)
        {
          id v35 = [NSString stringWithFormat:@"/%@ (property could not be validated): %@", v7, v34];
          long long v36 = (void *)MEMORY[0x1D944CB30]();
          id v37 = *(id *)(a1 + 40);
          BOOL v38 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            uint64_t v39 = v54 = v36;
            *(_DWORD *)buf = 138543618;
            __int16 v65 = v39;
            __int16 v66 = 2112;
            uint64_t v67 = v35;
            _os_log_impl(&dword_1D4693000, v38, OS_LOG_TYPE_ERROR, "%{public}@Cannot prepare model for container: %@", buf, 0x16u);

            long long v36 = v54;
          }

          v40 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v41 = *MEMORY[0x1E4F64ED0];
          id v60 = @"message";
          v61 = v35;
          uint64_t v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
          uint64_t v43 = [v40 errorWithDomain:v41 code:3 userInfo:v42];
          uint64_t v44 = *(void *)(*(void *)(a1 + 72) + 8);
          char v45 = *(void **)(v44 + 40);
          *(void *)(v44 + 40) = v43;

          *a4 = 1;
          goto LABEL_33;
        }
      }
      uint64_t v46 = *(void *)(a1 + 80);
      id v47 = *(void **)(a1 + 64);
      uint64_t v48 = *(void *)(*(void *)(a1 + 72) + 8);
      id obj = *(id *)(v48 + 40);
      id v13 = [v47 encodePropertyValue:v9 forProperty:v7 field:v8 storageLocation:v46 error:&obj];
      objc_storeStrong((id *)(v48 + 40), obj);
      if (v13)
      {
        [*(id *)(a1 + 32) setObject:v13 forKeyedSubscript:v7];
      }
      else
      {
        v49 = (void *)MEMORY[0x1D944CB30]();
        id v50 = *(id *)(a1 + 40);
        v51 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          id v52 = HMFGetLogIdentifier();
          id v53 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
          *(_DWORD *)buf = 138543618;
          __int16 v65 = v52;
          __int16 v66 = 2112;
          uint64_t v67 = v53;
          _os_log_impl(&dword_1D4693000, v51, OS_LOG_TYPE_ERROR, "%{public}@Cannot prepare model for container: %@", buf, 0x16u);
        }
        *a4 = 1;
      }
      goto LABEL_33;
    }
  }
  uint64_t v10 = [*(id *)(a1 + 40) validateType:v9 path:v7];
  uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
  long long v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)) {
    *a4 = 1;
  }
LABEL_34:
}

- (id)hmbPrepareForStorageLocation:(unint64_t)a3
{
  id v4 = [(HMBModel *)self hmbReserved];
  uint64_t v5 = (void *)[v4 mutableCopy];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:6];
  }
  id v8 = v7;

  if (a3 == 1)
  {
    uint64_t v9 = [(id)objc_opt_class() hmbProperties];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __41__HMBModel_hmbPrepareForStorageLocation___block_invoke;
    v11[3] = &unk_1E69EA080;
    id v12 = v8;
    [v9 enumerateKeysAndObjectsUsingBlock:v11];
  }
  return v8;
}

void __41__HMBModel_hmbPrepareForStorageLocation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 excludeFromCloudStorage]) {
    [*(id *)(a1 + 32) setObject:0 forKeyedSubscript:v5];
  }
}

- (id)validateType:(id)a3 path:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v32 = 0;
  LODWORD(self) = [(HMBModel *)self _validateType:a3 error:&v32];
  id v7 = v32;
  id v8 = v7;
  uint64_t v9 = 0;
  if (self)
  {
    uint64_t v10 = [v7 userInfo];
    uint64_t v11 = [v10 objectForKey:@"pathStack"];
    id v12 = (void *)[v11 mutableCopy];

    id v13 = [MEMORY[0x1E4F28E78] string];
    [v12 addObject:v6];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v14 = [v12 reverseObjectEnumerator];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v35 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v14);
          }
          [v13 appendFormat:@"/%@", *(void *)(*((void *)&v28 + 1) + 8 * i)];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v35 count:16];
      }
      while (v16);
    }

    id v19 = [v8 userInfo];
    id v20 = [v19 objectForKey:@"errorText"];
    [v13 appendFormat:@" %@", v20];

    __int16 v21 = [v8 userInfo];
    id v22 = [v21 objectForKey:@"message"];
    [v22 setString:v13];

    __int16 v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = [v8 domain];
    uint64_t v25 = [v8 code];
    uint64_t v33 = @"message";
    uint64_t v34 = v13;
    uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    uint64_t v9 = [v23 errorWithDomain:v24 code:v25 userInfo:v26];
  }
  return v9;
}

- (BOOL)_validateType:(id)a3 error:(id *)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a4) {
    *a4 = 0;
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v7 = +[HMBModelContainer allowedTypes];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v52 objects:v62 count:16];
  if (!v8) {
    goto LABEL_11;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v53;
  while (2)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v53 != v10) {
        objc_enumerationMutation(v7);
      }
      if (objc_opt_isKindOfClass())
      {

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v50 = 0u;
          long long v51 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          id v14 = v6;
          uint64_t v21 = [v14 countByEnumeratingWithState:&v48 objects:v59 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = 0;
            uint64_t v24 = *(void *)v49;
LABEL_16:
            uint64_t v25 = 0;
            uint64_t v26 = v23 + v22;
            while (1)
            {
              if (*(void *)v49 != v24) {
                objc_enumerationMutation(v14);
              }
              if ([(HMBModel *)self _validateType:*(void *)(*((void *)&v48 + 1) + 8 * v25) error:a4])
              {
                break;
              }
              if (v22 == ++v25)
              {
                uint64_t v22 = [v14 countByEnumeratingWithState:&v48 objects:v59 count:16];
                uint64_t v23 = v26;
                if (v22) {
                  goto LABEL_16;
                }
                goto LABEL_33;
              }
            }
            if (!a4) {
              goto LABEL_39;
            }
            uint64_t v15 = [*a4 userInfo];
            id v18 = [v15 objectForKey:@"pathStack"];
            id v19 = objc_msgSend(NSString, "stringWithFormat:", @"[%lu]", v23 + v25);
            uint64_t v33 = v18;
            uint64_t v34 = v19;
            goto LABEL_36;
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            BOOL v32 = 0;
            goto LABEL_41;
          }
          long long v46 = 0u;
          long long v47 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          id v14 = v6;
          uint64_t v27 = [v14 countByEnumeratingWithState:&v44 objects:v58 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v29 = *(void *)v45;
LABEL_26:
            uint64_t v30 = 0;
            while (1)
            {
              if (*(void *)v45 != v29) {
                objc_enumerationMutation(v14);
              }
              long long v31 = *(void **)(*((void *)&v44 + 1) + 8 * v30);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!a4) {
                  goto LABEL_39;
                }
                uint64_t v43 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v36 = *MEMORY[0x1E4F64ED0];
                v56[0] = @"message";
                uint64_t v15 = [MEMORY[0x1E4F28E78] string];
                v57[0] = v15;
                v56[1] = @"pathStack";
                id v37 = (void *)MEMORY[0x1E4F1CA48];
                id v18 = [NSString stringWithFormat:@"%@", v31];
                id v19 = [v37 arrayWithObject:v18];
                v57[1] = v19;
                v56[2] = @"errorText";
                BOOL v38 = NSString;
                uint64_t v39 = (objc_class *)objc_opt_class();
                v40 = NSStringFromClass(v39);
                uint64_t v41 = [v38 stringWithFormat:@"(key must be of string type (is %@))", v40];
                v57[2] = v41;
                uint64_t v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:3];
                *a4 = [v43 errorWithDomain:v36 code:3 userInfo:v42];

                goto LABEL_37;
              }
              uint64_t v15 = [v14 objectForKey:v31];
              if ([(HMBModel *)self _validateType:v15 error:a4]) {
                break;
              }

              if (v28 == ++v30)
              {
                uint64_t v28 = [v14 countByEnumeratingWithState:&v44 objects:v58 count:16];
                if (v28) {
                  goto LABEL_26;
                }
                goto LABEL_33;
              }
            }
            if (!a4) {
              goto LABEL_38;
            }
            id v18 = [*a4 userInfo];
            uint64_t v33 = [v18 objectForKey:@"pathStack"];
            id v19 = v33;
            uint64_t v34 = v31;
LABEL_36:
            [v33 addObject:v34];
LABEL_37:

LABEL_38:
LABEL_39:
            BOOL v32 = 1;
LABEL_40:

            goto LABEL_41;
          }
        }
LABEL_33:
        BOOL v32 = 0;
        goto LABEL_40;
      }
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v52 objects:v62 count:16];
    if (v9) {
      continue;
    }
    break;
  }
LABEL_11:

  if (a4)
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F64ED0];
    v60[0] = @"message";
    id v14 = [MEMORY[0x1E4F28E78] string];
    v61[0] = v14;
    v60[1] = @"pathStack";
    uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
    v61[1] = v15;
    v60[2] = @"errorText";
    uint64_t v16 = NSString;
    uint64_t v17 = (objc_class *)objc_opt_class();
    id v18 = NSStringFromClass(v17);
    id v19 = [v16 stringWithFormat:@"(%@ not a valid type within an aggregate type)", v18];
    v61[2] = v19;
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:3];
    *a4 = [v12 errorWithDomain:v13 code:3 userInfo:v20];

    goto LABEL_37;
  }
  BOOL v32 = 1;
LABEL_41:

  return v32;
}

- (HMFVersion)hmbContainerDataVersion
{
  uint64_t v2 = [(HMBModel *)self hmbModelContainer];
  unint64_t v3 = [v2 dataVersion];

  return (HMFVersion *)v3;
}

- (void)hmbAssociateWithContainer:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    _HMFPreconditionFailureWithFormat();
  }
  id v5 = v4;
  uint64_t v6 = [(HMBModel *)self hmbModelContainer];
  if (v6)
  {
    id v7 = (void *)v6;
    uint64_t v8 = [(HMBModel *)self hmbContainerDataVersion];
    uint64_t v9 = [v5 dataVersion];
    char v10 = [v8 isEqual:v9];

    if ((v10 & 1) == 0)
    {
      uint64_t v11 = (void *)MEMORY[0x1D944CB30]();
      id v12 = self;
      uint64_t v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v14 = HMFGetLogIdentifier();
        uint64_t v15 = [(HMBModel *)v12 hmbContainerDataVersion];
        uint64_t v16 = [v5 dataVersion];
        *(_DWORD *)buf = 138543874;
        v40 = v14;
        __int16 v41 = 2112;
        uint64_t v42 = v15;
        __int16 v43 = 2112;
        long long v44 = v16;
        _os_log_impl(&dword_1D4693000, v13, OS_LOG_TYPE_ERROR, "%{public}@Associating with a container with a different data version (%@ != %@).", buf, 0x20u);
      }
    }
  }
  [(HMBModel *)self setHmbModelContainer:v5];
  if (!self->_hmbType)
  {
    uint64_t v17 = [v5 typeNameForModelClass:objc_opt_class()];
    hmbType = self->_hmbType;
    self->_hmbType = v17;
  }
  if (!self->_hmbDataVersion)
  {
    id v19 = [(HMBModel *)self hmbContainerDataVersion];
    [(HMBModel *)self setHmbDataVersion:v19];

    id v20 = [(HMBModel *)self hmbReserved];

    if (!v20)
    {
      uint64_t v21 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
      [(HMBModel *)self setHmbReserved:v21];
    }
    uint64_t v22 = [(HMBModel *)self hmbReserved];
    uint64_t v23 = [v5 readOnlyVersionsForModelClass:objc_opt_class()];
    [v22 setObject:v23 forKey:@"_R"];

    uint64_t v24 = [(HMBModel *)self hmbReserved];
    uint64_t v25 = [v5 unavailableVersionsForModelClass:objc_opt_class()];
    [v24 setObject:v25 forKey:@"_U"];
  }
  __calculateUnavailableReadOnly(self, v5);
  uint64_t v26 = __modelReferenceFields(self);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v35 != v29) {
          objc_enumerationMutation(v26);
        }
        long long v31 = [(HMBModel *)self hmbPropertyNamed:*(void *)(*((void *)&v34 + 1) + 8 * i)];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          BOOL v32 = v31;
        }
        else {
          BOOL v32 = 0;
        }
        id v33 = v32;

        [v33 associateWithContainer:v5];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v28);
  }
}

- (HMFVersion)hmbDataVersion
{
  return self->_hmbDataVersion;
}

- (id)populateModelWithDictionary:(id)a3 fromStorageLocation:(unint64_t)a4 using:(id)a5
{
  v58[6] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  v40 = v7;
  if (!v7) {
    _HMFPreconditionFailure();
  }
  BOOL v38 = v8;
  uint64_t v50 = 0;
  long long v51 = &v50;
  uint64_t v52 = 0x3032000000;
  long long v53 = __Block_byref_object_copy__1911;
  long long v54 = __Block_byref_object_dispose__1912;
  id v55 = 0;
  context = (void *)MEMORY[0x1D944CB30]();
  uint64_t v9 = (void *)[v7 mutableCopy];
  [(HMBModel *)self setHmbReserved:v9];

  id v10 = objc_alloc(MEMORY[0x1E4F29128]);
  uint64_t v11 = [v7 valueForKey:@"_u"];
  id v12 = (void *)[v10 initWithUUIDString:v11];
  [(HMBModel *)self setHmbModelID:v12];

  id v13 = objc_alloc(MEMORY[0x1E4F29128]);
  id v14 = [v7 valueForKey:@"_P"];
  uint64_t v15 = (void *)[v13 initWithUUIDString:v14];
  [(HMBModel *)self setHmbParentModelID:v15];

  uint64_t v16 = [v7 valueForKey:@"_T"];
  [(HMBModel *)self setHmbType:v16];

  id v17 = objc_alloc(MEMORY[0x1E4F65590]);
  id v18 = [v7 valueForKey:@"_V"];
  id v19 = (void *)[v17 initWithVersionString:v18];
  [(HMBModel *)self setHmbDataVersion:v19];

  id v20 = [(HMBModel *)self hmbReserved];
  v58[0] = @"_P";
  v58[1] = @"_u";
  v58[2] = @"_v";
  v58[3] = @"_T";
  v58[4] = @"_G";
  v58[5] = @"_V";
  uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:6];
  [v20 removeObjectsForKeys:v21];

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v56[0] = @"_R";
  v56[1] = @"_U";
  uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v46 objects:v57 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v47 != v24) {
          objc_enumerationMutation(v22);
        }
        uint64_t v26 = *(void *)(*((void *)&v46 + 1) + 8 * i);
        uint64_t v27 = [(HMBModel *)self hmbReserved];
        uint64_t v28 = objc_msgSend(v27, "hmf_dictionaryForKey:", v26);

        if (v28)
        {
          uint64_t v29 = [(HMBModel *)self hmbReserved];
          uint64_t v30 = objc_msgSend(v28, "na_dictionaryByMappingValues:", &__block_literal_global_431);
          [v29 setObject:v30 forKey:v26];
        }
      }
      uint64_t v23 = [v22 countByEnumeratingWithState:&v46 objects:v57 count:16];
    }
    while (v23);
  }

  long long v31 = +[HMBModelContainer allowedTypes];
  BOOL v32 = [(id)objc_opt_class() hmbProperties];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __66__HMBModel_populateModelWithDictionary_fromStorageLocation_using___block_invoke;
  v41[3] = &unk_1E69E9B58;
  v41[4] = self;
  id v33 = v31;
  id v42 = v33;
  long long v44 = &v50;
  id v34 = v38;
  id v43 = v34;
  unint64_t v45 = a4;
  [v32 enumerateKeysAndObjectsUsingBlock:v41];

  id v35 = (id)v51[5];
  _Block_object_dispose(&v50, 8);

  return v35;
}

void __66__HMBModel_populateModelWithDictionary_fromStorageLocation_using___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = [*(id *)(a1 + 32) hmbReserved];
  id v10 = [v9 valueForKey:v7];

  if (v8 && v10)
  {
    if (objc_msgSend((id)objc_msgSend(v8, "classObj"), "isEqual:", objc_opt_class()))
    {
      uint64_t v11 = [*(id *)(a1 + 32) hmbReserved];
      [v11 removeObjectForKey:v7];
    }
    else
    {
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v12 = *(id *)(a1 + 40);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v36 objects:v48 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v37;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v37 != v14) {
              objc_enumerationMutation(v12);
            }
            if (objc_opt_isKindOfClass())
            {
              LODWORD(v13) = 1;
              goto LABEL_15;
            }
          }
          uint64_t v13 = [v12 countByEnumeratingWithState:&v36 objects:v48 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }
LABEL_15:

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        && (!v13
         || (objc_msgSend(*(id *)(a1 + 40), "containsObject:", objc_msgSend(v8, "classObj")) & 1) == 0
         && (objc_msgSend((id)objc_msgSend(v8, "classObj"), "isEqual:", objc_opt_class()) & 1) == 0))
      {
        id v10 = v10;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v16 = v10;
        }
        else {
          uint64_t v16 = 0;
        }
        id v17 = v16;

        if (v17)
        {
          uint64_t v18 = *(void *)(a1 + 64);
          id v19 = *(void **)(a1 + 48);
          uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8);
          id obj = *(id *)(v20 + 40);
          uint64_t v21 = [v19 decodePropertyValueFromData:v17 forProperty:v7 field:v8 storageLocation:v18 error:&obj];
          objc_storeStrong((id *)(v20 + 40), obj);

          if (v21)
          {
            uint64_t v22 = [*(id *)(a1 + 32) hmbReserved];
            [v22 setValue:v21 forKey:v7];

            id v10 = (id)v21;
          }
          else
          {
            uint64_t v30 = (void *)MEMORY[0x1D944CB30]();
            id v31 = *(id *)(a1 + 32);
            BOOL v32 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              id v33 = HMFGetLogIdentifier();
              uint64_t v34 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
              *(_DWORD *)buf = 138543874;
              __int16 v41 = v33;
              __int16 v42 = 2112;
              id v43 = v7;
              __int16 v44 = 2112;
              uint64_t v45 = v34;
              _os_log_impl(&dword_1D4693000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode value for %@ property: %@", buf, 0x20u);
            }
            id v10 = 0;
            *a4 = 1;
          }
        }
        else
        {
          uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v24 = *MEMORY[0x1E4F64ED0];
          long long v46 = @"message";
          uint64_t v25 = [NSString stringWithFormat:@"expecting internal storage to be a NSData, but it's a %@", objc_opt_class()];
          long long v47 = v25;
          uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
          uint64_t v27 = [v23 errorWithDomain:v24 code:3 userInfo:v26];
          uint64_t v28 = *(void *)(*(void *)(a1 + 56) + 8);
          uint64_t v29 = *(void **)(v28 + 40);
          *(void *)(v28 + 40) = v27;

          *a4 = 1;
        }
      }
    }
  }
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  id v5 = keyFromSelector(a3);
  if (v5
    && ([(id)objc_opt_class() hmbProperties],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        [v6 objectForKey:v5],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    id v8 = NSStringFromSelector(a3);
    int v9 = [v8 isEqualToString:v5];

    id v10 = (objc_class *)objc_opt_class();
    if (v9)
    {
      uint64_t v11 = "@@:";
      id v12 = (void (*)(void))propertyIMP;
    }
    else
    {
      uint64_t v11 = "v@:@";
      id v12 = (void (*)(void))setPropertyIMP;
    }
    class_addMethod(v10, a3, v12, v11);
    unsigned __int8 v13 = 1;
  }
  else
  {
    v15.receiver = a1;
    v15.super_class = (Class)&OBJC_METACLASS___HMBModel;
    unsigned __int8 v13 = objc_msgSendSuper2(&v15, sel_resolveInstanceMethod_, a3);
  }

  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t38 != -1) {
    dispatch_once(&logCategory__hmf_once_t38, &__block_literal_global_188);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v39;
  return v2;
}

uint64_t __23__HMBModel_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v39;
  logCategory__hmf_once_long long v39 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (NSSet)hmbExternalRecordFields
{
  unint64_t v3 = [a1 hmbExternalProperties];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__HMBModel_hmbExternalRecordFields__block_invoke;
  v6[3] = &__block_descriptor_40_e28___NSString_16__0__NSString_8l;
  v6[4] = a1;
  id v4 = objc_msgSend(v3, "na_map:", v6);

  return (NSSet *)v4;
}

id __35__HMBModel_hmbExternalRecordFields__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 hmbProperties];
  id v5 = [v4 objectForKeyedSubscript:v3];

  uint64_t v6 = [v5 externalRecordField];

  return v6;
}

+ (NSSet)hmbExternalProperties
{
  if (__modelExternalStorageFields_onceToken != -1) {
    dispatch_once(&__modelExternalStorageFields_onceToken, &__block_literal_global_436);
  }
  os_unfair_lock_lock_with_options();
  id v3 = [(id)__modelExternalStorageFields_externalStorageFields objectForKey:a1];
  if (!v3)
  {
    if ([a1 isSubclassOfClass:objc_opt_class()])
    {
      id v4 = [MEMORY[0x1E4F1CA80] set];
      id v5 = [a1 hmbProperties];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      void v8[2] = ____modelExternalStorageFields_block_invoke_2;
      v8[3] = &unk_1E69EA080;
      id v6 = v4;
      id v9 = v6;
      [v5 enumerateKeysAndObjectsUsingBlock:v8];
      id v3 = v6;
      [(id)__modelExternalStorageFields_externalStorageFields setObject:v3 forKey:a1];
    }
    else
    {
      id v3 = [MEMORY[0x1E4F1CAD0] set];
      [(id)__modelExternalStorageFields_externalStorageFields setObject:v3 forKey:a1];
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__modelExternalStorageFields_lock);
  return (NSSet *)v3;
}

+ (id)formattedStringForValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  if (v5)
  {
    id v6 = @"<NULL>";
    goto LABEL_24;
  }
  id v7 = v3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;

  if (!v9)
  {
    id v10 = v7;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    id v12 = v11;

    if (v12)
    {
      uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"<NSDictionary: %lu items>", objc_msgSend(v12, "count"));
    }
    else
    {
      id v14 = v10;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_super v15 = v14;
      }
      else {
        objc_super v15 = 0;
      }
      id v16 = v15;

      if (v16)
      {
        id v17 = NSString;
        uint64_t v18 = [v16 hmbDescription];

        id v6 = [v17 stringWithFormat:@"<NSData: %@>", v18];

        goto LABEL_22;
      }
      uint64_t v13 = [v14 description];
    }
    id v6 = (__CFString *)v13;
LABEL_22:

    goto LABEL_23;
  }
  objc_msgSend(NSString, "stringWithFormat:", @"<NSArray: %lu items>", objc_msgSend(v9, "count"));
  id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_23:

LABEL_24:
  return v6;
}

+ (BOOL)propertyDiffersFrom:(id)a3 to:(id)a4
{
  return __isEqualDeepCompare(a3, a4) ^ 1;
}

+ (Class)hmbGenericRepresentation
{
  return (Class)objc_opt_class();
}

+ (HMFVersion)hmbReadOnlyBefore
{
  return 0;
}

+ (NSString)hmbExternalRecordType
{
  return (NSString *)@"Record";
}

+ (BOOL)hmbExcludeFromCloudStorage
{
  return 0;
}

+ (NSUUID)hmbSchemaHashRoot
{
  if (hmbSchemaHashRoot_onceToken != -1) {
    dispatch_once(&hmbSchemaHashRoot_onceToken, &__block_literal_global_46);
  }
  uint64_t v2 = (void *)hmbSchemaHashRoot__schemaHashRoot;
  return (NSUUID *)v2;
}

uint64_t __29__HMBModel_hmbSchemaHashRoot__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"551E3F88-0C11-4402-A486-6D1EB759AADD"];
  uint64_t v1 = hmbSchemaHashRoot__schemaHashRoot;
  hmbSchemaHashRoot__schemaHashRoot = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (void)hmbPrepareQueries
{
  id v3 = [a1 hmbQueries];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v6 = [a1 hmbMutableModelClassesWithQueries];
    [v6 addObject:a1];
  }
  else
  {
    id v5 = [a1 hmbProperties];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __29__HMBModel_hmbPrepareQueries__block_invoke;
    v7[3] = &__block_descriptor_40_e40_v32__0__NSString_8__HMBModelField_16_B24l;
    v7[4] = a1;
    [v5 enumerateKeysAndObjectsUsingBlock:v7];
  }
}

void __29__HMBModel_hmbPrepareQueries__block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  id v6 = [a3 encodeBlock];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) hmbMutableModelClassesWithQueries];
    [v7 addObject:*(void *)(a1 + 32)];

    *a4 = 1;
  }
}

+ (NSSet)hmbModelClassesWithQueries
{
  uint64_t v2 = [a1 hmbMutableModelClassesWithQueries];
  id v3 = (void *)[v2 copy];

  return (NSSet *)v3;
}

+ (id)hmbMutableModelClassesWithQueries
{
  if (hmbMutableModelClassesWithQueries_onceToken != -1) {
    dispatch_once(&hmbMutableModelClassesWithQueries_onceToken, &__block_literal_global_1998);
  }
  uint64_t v2 = (void *)hmbMutableModelClassesWithQueries__hmbMutableModelClassesWithQueries;
  return v2;
}

uint64_t __45__HMBModel_hmbMutableModelClassesWithQueries__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v1 = hmbMutableModelClassesWithQueries__hmbMutableModelClassesWithQueries;
  hmbMutableModelClassesWithQueries__hmbMutableModelClassesWithQueries = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (NSArray)hmbQueries
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

+ (NSSet)hmbPropertyNames
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [a1 hmbProperties];
  uint64_t v4 = [v3 allKeys];
  id v5 = [v2 setWithArray:v4];

  return (NSSet *)v5;
}

+ (NSDictionary)hmbProperties
{
  return (NSDictionary *)MEMORY[0x1E4F1CC08];
}

+ (BOOL)hmbShouldLogPrivateInformation
{
  uint64_t v2 = [MEMORY[0x1E4F65530] sharedPreferences];
  id v3 = [v2 preferenceForKey:@"shouldLogPrivateInformation"];
  char v4 = [v3 BOOLValue];

  return v4;
}

@end