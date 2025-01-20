@interface HMDBackingStoreModelObject
+ (BOOL)resolveInstanceMethod:(SEL)a3;
+ (Class)backedObjectClass;
+ (Class)genericRepresentation;
+ (id)bsoSchemaHash;
+ (id)formatValue:(id)a3;
+ (id)logCategory;
+ (id)objectFromCloud:(id)a3 error:(id *)a4;
+ (id)objectFromData:(id)a3 encoding:(unint64_t)a4 error:(id *)a5;
+ (id)objectFromData:(id)a3 encoding:(unint64_t)a4 record:(id)a5 error:(id *)a6;
+ (id)objectFromData:(id)a3 encoding:(unint64_t)a4 rowID:(unint64_t)a5 error:(id *)a6;
+ (id)objectFromDictionaryData:(id)a3 error:(id *)a4;
+ (id)objectFromDictionaryData:(id)a3 type:(id)a4 error:(id *)a5;
+ (id)properties;
+ (id)readonlyBefore;
+ (id)schemaHashRoot;
- (BOOL)_validateType:(id)a3 error:(id *)a4;
- (BOOL)bsoDataVersionOverride;
- (BOOL)bsoIgnoreModel;
- (BOOL)diff:(id)a3 differingFields:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGenericRepresentation;
- (BOOL)isReadOnly;
- (BOOL)isReplayable;
- (BOOL)merge:(id)a3 error:(id *)a4;
- (BOOL)propertyIsAvailable:(id)a3;
- (BOOL)propertyIsReadOnly:(id)a3;
- (BOOL)propertyWasSet:(id)a3;
- (BOOL)validForStorage;
- (CKRecord)bsoRecord;
- (HMDBackingStoreModelObject)initWithObjectChangeType:(unint64_t)a3 uuid:(id)a4 parentUUID:(id)a5;
- (HMDBackingStoreModelObject)initWithUUID:(id)a3;
- (HMDBackingStoreModelObject)initWithUUID:(id)a3 parentUUID:(id)a4;
- (HMDBackingStoreModelObject)initWithVersion:(id)a3 changeType:(unint64_t)a4 uuid:(id)a5 parentUUID:(id)a6;
- (HMDBackingStoreObjectProtocol)bsoDelegate;
- (HMFVersion)bsoDataVersion;
- (HMFVersion)bsoIgnoredBefore;
- (NSSet)dependentUUIDs;
- (NSString)bsoType;
- (NSString)description;
- (NSUUID)parentUUID;
- (NSUUID)uuid;
- (id)backedObjectWithParent:(id)a3 error:(id *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugString:(BOOL)a3;
- (id)debugString:(BOOL)a3 prefix:(id)a4;
- (id)defaultValueForPropertyNamed:(id)a3 isSet:(BOOL *)a4;
- (id)encodeAsNSDictionaryFor:(unint64_t)a3 error:(id *)a4;
- (id)encodeFor:(unint64_t)a3 error:(id *)a4;
- (id)encodeForCloud:(id *)a3;
- (id)encodeWithEncoding:(unint64_t)a3 error:(id *)a4;
- (id)encodeWithEncoding:(unint64_t)a3 for:(unint64_t)a4 error:(id *)a5;
- (id)encodeWithError:(id *)a3;
- (id)logIdentifier;
- (id)merge:(id)a3;
- (id)merge:(id)a3 from:(unint64_t)a4;
- (id)prepareFor:(unint64_t)a3;
- (id)setProperties;
- (id)typeNameForDebug;
- (id)validateType:(id)a3 path:(id)a4;
- (unint64_t)bsoLogRowID;
- (unint64_t)hash;
- (unint64_t)objectChangeType;
- (void)clearVersionOverride;
- (void)dumpDebug;
- (void)dumpDebug:(id)a3;
- (void)dumpWithVerbosity:(BOOL)a3 prefix:(id)a4 logType:(unsigned __int8)a5;
- (void)setBsoDataVersionOverride:(BOOL)a3;
- (void)setBsoDelegate:(id)a3;
- (void)setBsoIgnoredBefore:(id)a3;
- (void)setBsoRecord:(id)a3;
- (void)setBsoType:(id)a3;
- (void)setObjectChangeType:(unint64_t)a3;
- (void)setParentUUID:(id)a3;
- (void)setParentUUIDIfNotNil:(id)a3;
- (void)setPropertyIfNotNil:(id)a3 named:(id)a4;
- (void)setUuid:(id)a3;
@end

@implementation HMDBackingStoreModelObject

- (void)setPropertyIfNotNil:(id)a3 named:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(id)objc_opt_class() properties];
  v9 = [v8 objectForKey:v7];

  if (!v9)
  {
    v10 = (void *)MEMORY[0x1D9452090]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      v14 = [(HMDBackingStoreModelObject *)v11 typeNameForDebug];
      v18 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v18);
      int v25 = 138544130;
      v26 = v13;
      __int16 v27 = 2112;
      id v28 = v7;
      __int16 v29 = 2112;
      v30 = v14;
      __int16 v31 = 2112;
      v32 = v16;
      v17 = "%{public}@Unable to set property %@ of %@ from type %@ (no such property exists)";
      goto LABEL_10;
    }
LABEL_12:

    goto LABEL_13;
  }
  if (![(HMDBackingStoreModelObject *)self propertyIsAvailable:v7])
  {
    v10 = (void *)MEMORY[0x1D9452090]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      v14 = [(HMDBackingStoreModelObject *)v11 typeNameForDebug];
      v19 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v19);
      int v25 = 138544130;
      v26 = v13;
      __int16 v27 = 2112;
      id v28 = v7;
      __int16 v29 = 2112;
      v30 = v14;
      __int16 v31 = 2112;
      v32 = v16;
      v17 = "%{public}@Unable to set property %@ of %@ from type %@ (property is unavailable)";
      goto LABEL_10;
    }
    goto LABEL_12;
  }
  if ([(HMDBackingStoreModelObject *)self propertyIsReadOnly:v7])
  {
    v10 = (void *)MEMORY[0x1D9452090]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      v14 = [(HMDBackingStoreModelObject *)v11 typeNameForDebug];
      v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      int v25 = 138544130;
      v26 = v13;
      __int16 v27 = 2112;
      id v28 = v7;
      __int16 v29 = 2112;
      v30 = v14;
      __int16 v31 = 2112;
      v32 = v16;
      v17 = "%{public}@Unable to set property %@ of %@ from type %@ (property is read-only)";
LABEL_10:
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v25, 0x2Au);
LABEL_11:

      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (!v6)
  {
    [(NSMutableDictionary *)self->_reserved removeObjectForKey:v7];
    goto LABEL_13;
  }
  [v9 classObj];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1D9452090]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    v13 = HMFGetLogIdentifier();
    v14 = [(HMDBackingStoreModelObject *)v11 typeNameForDebug];
    v23 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v23);
    v24 = NSStringFromClass((Class)[v9 classObj]);
    int v25 = 138544386;
    v26 = v13;
    __int16 v27 = 2112;
    id v28 = v7;
    __int16 v29 = 2112;
    v30 = v14;
    __int16 v31 = 2112;
    v32 = v16;
    __int16 v33 = 2112;
    v34 = v24;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to set property %@ of %@ from type %@ (does not match the expected type %@)", (uint8_t *)&v25, 0x34u);

    goto LABEL_11;
  }
  reserved = self->_reserved;
  if (!reserved)
  {
    v21 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    v22 = self->_reserved;
    self->_reserved = v21;

    reserved = self->_reserved;
  }
  [(NSMutableDictionary *)reserved setObject:v6 forKey:v7];
LABEL_13:
}

- (BOOL)propertyIsReadOnly:(id)a3
{
  id v4 = a3;
  if ([(HMDBackingStoreModelObject *)self isReadOnly]
    || ![(HMDBackingStoreModelObject *)self propertyIsAvailable:v4])
  {
    char v8 = 1;
  }
  else
  {
    v5 = [(NSMutableDictionary *)self->_reserved hmf_dictionaryForKey:@"_R"];
    id v6 = [v5 objectForKey:v4];
    BOOL v7 = [(HMDBackingStoreModelObject *)self bsoDataVersionOverride];
    char v8 = 0;
    if (!v7 && v6)
    {
      v9 = +[HMDBackingStoreSingleton dataVersion];
      char v8 = [v9 isLessThanOrEqualTo:v6];
    }
  }

  return v8;
}

- (BOOL)propertyIsAvailable:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() genericRepresentation];
  id v6 = [(NSMutableDictionary *)self->_reserved hmf_dictionaryForKey:@"_U"];
  if ([(id)objc_opt_class() isEqual:v5])
  {
    char v7 = 1;
  }
  else
  {
    char v8 = [v6 objectForKey:v4];
    if (v8)
    {
      v9 = +[HMDBackingStoreSingleton dataVersion];
      char v7 = [v9 isGreaterThan:v8];
    }
    else
    {
      char v7 = 1;
    }
  }
  return v7;
}

+ (Class)genericRepresentation
{
  return (Class)objc_opt_class();
}

- (BOOL)isReadOnly
{
  if ([(HMDBackingStoreModelObject *)self isGenericRepresentation]) {
    return 1;
  }
  v3 = [(id)objc_opt_class() readonlyBefore];
  if (v3)
  {
    id v4 = +[HMDBackingStoreSingleton dataVersion];
    char v2 = [v3 isGreaterThan:v4];
  }
  else
  {
    char v2 = 0;
  }

  return v2;
}

- (BOOL)isGenericRepresentation
{
  uint64_t v2 = [(id)objc_opt_class() genericRepresentation];
  if ([(id)objc_opt_class() isEqual:v2]) {
    return 1;
  }
  id v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  return [v4 isEqual:v5];
}

- (BOOL)bsoDataVersionOverride
{
  return self->_bsoDataVersionOverride;
}

+ (id)readonlyBefore
{
  return 0;
}

- (BOOL)diff:(id)a3 differingFields:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = (id *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id obj = [v6 setProperties];
    uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = 0;
      uint64_t v10 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          v13 = [(NSMutableDictionary *)self->_reserved objectForKey:v12];
          v14 = [v6[1] objectForKey:v12];
          if ((isEqualDeepCompare(v13, v14) & 1) == 0)
          {
            if (!a4)
            {

              goto LABEL_22;
            }
            if (!v9)
            {
              id v9 = [MEMORY[0x1E4F1CA48] array];
            }
            [v9 addObject:v12];
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v9 = 0;
    }

    if (a4)
    {
      id v9 = v9;
      *a4 = v9;
      LOBYTE(a4) = [v9 count] != 0;
    }
  }
  else
  {
    if (a4)
    {
      [MEMORY[0x1E4F1C978] array];
      id v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v9 = 0;
    }
LABEL_22:
    LOBYTE(a4) = 1;
  }

  return (char)a4;
}

- (id)setProperties
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[NSMutableDictionary count](self->_reserved, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_reserved;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "characterAtIndex:", 0, (void)v11) != 95) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (HMDBackingStoreModelObject)initWithVersion:(id)a3 changeType:(unint64_t)a4 uuid:(id)a5 parentUUID:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v27.receiver = self;
  v27.super_class = (Class)HMDBackingStoreModelObject;
  long long v13 = [(HMDBackingStoreModelObject *)&v27 init];
  if (v13)
  {
    long long v14 = +[HMDBackingStoreSingleton sharedInstance];
    v15 = [v14 classToNameTransform];
    uint64_t v16 = [v15 objectForKey:objc_opt_class()];
    bsoType = v13->_bsoType;
    v13->_bsoType = (NSString *)v16;

    if (!v13->_bsoType)
    {
      long long v18 = (objc_class *)objc_opt_class();
      uint64_t v19 = NSStringFromClass(v18);
      long long v20 = v13->_bsoType;
      v13->_bsoType = (NSString *)v19;
    }
    uint64_t v21 = objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSUUID:", v11);
    uuid = v13->_uuid;
    v13->_uuid = (NSUUID *)v21;

    uint64_t v23 = objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSUUID:", v12);
    parentUUID = v13->_parentUUID;
    v13->_parentUUID = (NSUUID *)v23;

    v13->_objectChangeType = a4;
    int v25 = v10;
    if (!v10)
    {
      int v25 = +[HMDBackingStoreSingleton dataVersion];
    }
    objc_storeStrong((id *)&v13->_bsoDataVersion, v25);
    if (!v10) {

    }
    v13->_bsoDataVersionOverride = 1;
  }

  return v13;
}

- (HMDBackingStoreModelObject)initWithObjectChangeType:(unint64_t)a3 uuid:(id)a4 parentUUID:(id)a5
{
  return [(HMDBackingStoreModelObject *)self initWithVersion:0 changeType:a3 uuid:a4 parentUUID:a5];
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bsoRecord, 0);
  objc_storeStrong((id *)&self->_bsoDataVersion, 0);
  objc_storeStrong((id *)&self->_bsoType, 0);
  objc_destroyWeak((id *)&self->_bsoDelegate);
  objc_storeStrong((id *)&self->_parentUUID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_reserved, 0);
}

- (void)setBsoDataVersionOverride:(BOOL)a3
{
  self->_bsoDataVersionOverride = a3;
}

- (void)setBsoRecord:(id)a3
{
}

- (CKRecord)bsoRecord
{
  return self->_bsoRecord;
}

- (void)setObjectChangeType:(unint64_t)a3
{
  self->_objectChangeType = a3;
}

- (unint64_t)objectChangeType
{
  return self->_objectChangeType;
}

- (HMFVersion)bsoDataVersion
{
  return self->_bsoDataVersion;
}

- (unint64_t)bsoLogRowID
{
  return self->_bsoLogRowID;
}

- (void)setBsoType:(id)a3
{
}

- (NSString)bsoType
{
  return self->_bsoType;
}

- (void)setBsoDelegate:(id)a3
{
}

- (HMDBackingStoreObjectProtocol)bsoDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bsoDelegate);
  return (HMDBackingStoreObjectProtocol *)WeakRetained;
}

- (void)setParentUUID:(id)a3
{
}

- (NSUUID)parentUUID
{
  return self->_parentUUID;
}

- (void)setUuid:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v5 = [(HMDBackingStoreModelObject *)self uuid];
  uint64_t v6 = [(HMDBackingStoreModelObject *)self parentUUID];
  uint64_t v7 = (void *)[v4 initWithUUID:v5 parentUUID:v6];

  id v8 = (id)[v7 merge:self];
  return v7;
}

- (id)logIdentifier
{
  return @"BackingStore";
}

- (void)dumpDebug
{
}

- (void)dumpDebug:(id)a3
{
}

- (void)clearVersionOverride
{
}

- (id)debugString:(BOOL)a3 prefix:(id)a4
{
  BOOL v4 = a3;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F28E78] string];
  id v8 = [(HMDBackingStoreModelObject *)self typeNameForDebug];
  [v7 appendFormat:@"%@%@:", v6, v8];

  id v9 = [(HMDBackingStoreModelObject *)self uuid];
  id v10 = [v9 UUIDString];
  [v7 appendFormat:@"\n  uuid: %@", v10];

  id v11 = [(HMDBackingStoreModelObject *)self parentUUID];
  id v12 = [v11 UUIDString];
  [v7 appendFormat:@"\n  parent: %@", v12];

  if (v4)
  {
    long long v13 = [(HMDBackingStoreModelObject *)self bsoDataVersion];
    BOOL v14 = [(HMDBackingStoreModelObject *)self bsoDataVersionOverride];
    v15 = "";
    if (v14) {
      v15 = " (override)";
    }
    [v7 appendFormat:@"\n  version: %@%s", v13, v15];

    uint64_t v16 = [(HMDBackingStoreModelObject *)self bsoIgnoredBefore];
    long long v17 = (void *)v16;
    if (v16) {
      [v7 appendFormat:@"\n  ignore before: %@", v16];
    }
    v40 = v17;
    id v41 = v6;
    [v7 appendString:@"\n  dependents:"];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v18 = [(HMDBackingStoreModelObject *)self dependentUUIDs];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v50 objects:v55 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v51 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = [*(id *)(*((void *)&v50 + 1) + 8 * i) UUIDString];
          [v7 appendFormat:@" %@", v23];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v50 objects:v55 count:16];
      }
      while (v20);
    }
    v44 = v7;

    v24 = [(id)objc_opt_class() properties];
    char v42 = shouldLogPrivateInformation();
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id obj = v24;
    uint64_t v25 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v45 = *(void *)v47;
      objc_super v27 = &stru_1F2C9F1A8;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v47 != v45) {
            objc_enumerationMutation(obj);
          }
          uint64_t v29 = *(void *)(*((void *)&v46 + 1) + 8 * j);
          v30 = [(id)objc_opt_class() properties];
          __int16 v31 = [v30 objectForKey:v29];

          uint64_t v32 = [(NSMutableDictionary *)self->_reserved valueForKey:v29];
          if (v32)
          {
            __int16 v33 = (void *)v32;
            v34 = +[HMDBackingStoreModelObject formatValue:v32];
            uint64_t v35 = v27;
            v36 = v27;
          }
          else
          {
            if (![v31 defaultValueSet]) {
              goto LABEL_31;
            }
            __int16 v33 = [v31 defaultValue];
            v34 = +[HMDBackingStoreModelObject formatValue:v33];
            uint64_t v35 = v27;
            v36 = @" (default)";
          }

          objc_super v27 = v35;
          if ([(HMDBackingStoreModelObject *)self propertyIsReadOnly:v29]) {
            v37 = @" (read-only)";
          }
          else {
            v37 = v35;
          }
          if ([v31 logging] == 3 || (v42 & 1) == 0 && (!v31 || !objc_msgSend(v31, "logging")))
          {
            v38 = @"...";

            v34 = @"...";
          }
          [v44 appendFormat:@"\n  %@%@%@: %@", v29, v37, v36, v34];

LABEL_31:
        }
        uint64_t v26 = [obj countByEnumeratingWithState:&v46 objects:v54 count:16];
      }
      while (v26);
    }

    id v6 = v41;
    uint64_t v7 = v44;
  }

  return v7;
}

- (id)debugString:(BOOL)a3
{
  return [(HMDBackingStoreModelObject *)self debugString:a3 prefix:&stru_1F2C9F1A8];
}

- (void)dumpWithVerbosity:(BOOL)a3 prefix:(id)a4 logType:(unsigned __int8)a5
{
  BOOL v6 = a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = [(HMDBackingStoreModelObject *)self debugString:v6 prefix:v8];
  id v10 = (void *)MEMORY[0x1D9452090]();
  id v11 = self;
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, (os_log_type_t)a5))
  {
    long long v13 = HMFGetLogIdentifier();
    int v14 = 138543618;
    v15 = v13;
    __int16 v16 = 2112;
    long long v17 = v9;
    _os_log_impl(&dword_1D49D5000, v12, (os_log_type_t)a5, "%{public}@HMDBackingStoreModelObject %@", (uint8_t *)&v14, 0x16u);
  }
}

- (NSString)description
{
  v3 = NSString;
  BOOL v4 = [(HMDBackingStoreModelObject *)self typeNameForDebug];
  uint64_t v5 = [(HMDBackingStoreModelObject *)self uuid];
  BOOL v6 = [v5 UUIDString];
  uint64_t v7 = [(HMDBackingStoreModelObject *)self bsoDataVersion];
  id v8 = [v3 stringWithFormat:@"<%@ uuid:%@ version:%@>", v4, v6, v7];

  return (NSString *)v8;
}

- (id)defaultValueForPropertyNamed:(id)a3 isSet:(BOOL *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(id)objc_opt_class() properties];
  id v8 = [v7 objectForKey:v6];

  if (v8)
  {
    if (a4) {
      *a4 = [v8 defaultValueSet];
    }
    id v9 = [v8 defaultValue];
  }
  else
  {
    id v10 = (void *)MEMORY[0x1D9452090]();
    id v11 = self;
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      long long v13 = HMFGetLogIdentifier();
      int v14 = [(HMDBackingStoreModelObject *)v11 typeNameForDebug];
      int v16 = 138543874;
      long long v17 = v13;
      __int16 v18 = 2112;
      id v19 = v6;
      __int16 v20 = 2112;
      uint64_t v21 = v14;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to get default value of property %@ from type %@ (no such property exists)", (uint8_t *)&v16, 0x20u);
    }
    id v9 = 0;
  }

  return v9;
}

- (BOOL)merge:(id)a3 error:(id *)a4
{
  uint64_t v5 = [(HMDBackingStoreModelObject *)self merge:a3 from:0];
  id v6 = v5;
  if (a4) {
    *a4 = v5;
  }

  return v6 == 0;
}

- (id)merge:(id)a3
{
  return [(HMDBackingStoreModelObject *)self merge:a3 from:0];
}

- (id)merge:(id)a3 from:(unint64_t)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (HMDBackingStoreModelObject *)a3;
  id v6 = v5;
  if (v5 == self) {
    goto LABEL_12;
  }
  if (![(HMDBackingStoreModelObject *)v5 bsoIgnoreModel])
  {
    int v14 = [(HMDBackingStoreModelObject *)self bsoType];
    Class v15 = NSClassFromString(v14);

    int v16 = [(HMDBackingStoreModelObject *)v6 bsoType];
    Class v17 = NSClassFromString(v16);

    if (([(objc_class *)v15 isSubclassOfClass:v17] & 1) == 0)
    {
      uint64_t v23 = MEMORY[0x1D9452090]();
      v24 = self;
      uint64_t v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        uint64_t v32 = v26;
        __int16 v33 = 2112;
        Class v34 = v17;
        __int16 v35 = 2112;
        Class v36 = v15;
        _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot merge from model class, %@, to model class, %@", buf, 0x20u);
      }
      long long v13 = (void *)v23;
      goto LABEL_16;
    }
    p_reserved = &self->_reserved;
    id v19 = (void *)[(NSMutableDictionary *)self->_reserved mutableCopy];
    if (!v19)
    {
      id v19 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    reserved = v6->_reserved;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __41__HMDBackingStoreModelObject_merge_from___block_invoke;
    v28[3] = &unk_1E6A121B0;
    v28[4] = self;
    uint64_t v29 = v6;
    id v21 = v19;
    id v30 = v21;
    [(NSMutableDictionary *)reserved enumerateKeysAndObjectsUsingBlock:v28];
    if ([v21 count]) {
      objc_storeStrong((id *)p_reserved, v19);
    }

LABEL_12:
    uint64_t v22 = 0;
    goto LABEL_17;
  }
  uint64_t v7 = MEMORY[0x1D9452090]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = HMFGetLogIdentifier();
    id v11 = +[HMDBackingStoreSingleton dataVersion];
    id v12 = [(HMDBackingStoreModelObject *)v6 bsoIgnoredBefore];
    *(_DWORD *)buf = 138544130;
    uint64_t v32 = v10;
    __int16 v33 = 2112;
    Class v34 = (Class)v6;
    __int16 v35 = 2112;
    Class v36 = v11;
    __int16 v37 = 2112;
    v38 = v12;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Dropping merge merge from model %@ (our version less than ignore before version %@ <= %@)", buf, 0x2Au);
  }
  long long v13 = (void *)v7;
LABEL_16:
  uint64_t v22 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F2D140] code:19 userInfo:0];
LABEL_17:

  return v22;
}

void __41__HMDBackingStoreModelObject_merge_from___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = [v5 characterAtIndex:0];
  id v8 = a1[4];
  if (v7 == 95)
  {
    id v9 = [v8 bsoDataVersion];
    id v10 = [a1[5] bsoDataVersion];
    if (![v9 isLessThan:v10])
    {
LABEL_19:

      goto LABEL_20;
    }
    if ([v5 isEqualToString:@"_U"])
    {

LABEL_12:
      id v9 = [a1[6] objectForKey:v5];
      id v19 = v6;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        __int16 v20 = v19;
      }
      else {
        __int16 v20 = 0;
      }
      id v10 = v20;

      if (v10)
      {
        if (v9)
        {
          [v9 addEntriesFromDictionary:v10];
        }
        else
        {
          id v9 = (void *)[v19 mutableCopy];
          [a1[6] setObject:v9 forKey:v5];
        }
      }
      goto LABEL_19;
    }
    char v18 = [v5 isEqualToString:@"_R"];

    if (v18) {
      goto LABEL_12;
    }
  }
  else if ([v8 propertyIsReadOnly:v5])
  {
    id v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = a1[4];
    long long v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = HMFGetLogIdentifier();
      Class v15 = [a1[4] bsoType];
      int v16 = [a1[4] bsoDataVersion];
      int v21 = 138544130;
      uint64_t v22 = v14;
      __int16 v23 = 2112;
      id v24 = v5;
      __int16 v25 = 2112;
      uint64_t v26 = v15;
      __int16 v27 = 2112;
      id v28 = v16;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to merge %@ property of model class %@ (marked readonly for %@).", (uint8_t *)&v21, 0x2Au);
    }
  }
  else if (v6)
  {
    id v17 = a1[6];
    id v9 = objc_msgSend(v5, "hmf_stringWithSmallestEncoding");
    [v17 setObject:v6 forKey:v9];
LABEL_20:
  }
}

- (BOOL)validForStorage
{
  return 1;
}

- (BOOL)isReplayable
{
  return 1;
}

- (BOOL)propertyWasSet:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_reserved valueForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)setParentUUIDIfNotNil:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_parentUUID = &self->_parentUUID;
  if (!self->_parentUUID) {
    goto LABEL_2;
  }
  int v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = self;
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    id v10 = HMFGetLogIdentifier();
    int v17 = 138543362;
    char v18 = v10;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Parent identifier is already present for this object", (uint8_t *)&v17, 0xCu);
  }
  id v11 = [[HMDAssertionLogEvent alloc] initWithReason:@"Parent identifier is already present for this object"];
  id v12 = +[HMDMetricsManager sharedLogEventSubmitter];
  [v12 submitLogEvent:v11];

  if (*p_parentUUID)
  {
    long long v13 = (void *)MEMORY[0x1D9452090]();
    int v14 = v8;
    Class v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = HMFGetLogIdentifier();
      int v17 = 138543362;
      char v18 = v16;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Parent identifier is already present for this object", (uint8_t *)&v17, 0xCu);
    }
  }
  else
  {
LABEL_2:
    objc_storeStrong((id *)p_parentUUID, a3);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  int v7 = v6;
  if (v6)
  {
    id v8 = [v6 uuid];
    id v9 = [(HMDBackingStoreModelObject *)self uuid];
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
  uint64_t v2 = [(HMDBackingStoreModelObject *)self uuid];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)encodeForCloud:(id *)a3
{
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"ObjectRecord"];
  id v6 = [(HMDBackingStoreModelObject *)self encodeWithEncoding:1 for:1 error:a3];
  if (v6)
  {
    [v5 setObject:&unk_1F2DC9040 forKey:@"k00"];
    int v7 = objc_msgSend(NSString, "stringWithFormat:", @"k%02lu", 1);
    [v5 setObject:v6 forKey:v7];

    id v8 = v5;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)encodeWithEncoding:(unint64_t)a3 for:(unint64_t)a4 error:(id *)a5
{
  [(HMDBackingStoreModelObject *)self clearVersionOverride];
  if (a5)
  {
    *a5 = 0;
    if (a3 != 1)
    {
      id v9 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:3];
      char v10 = 0;
      *a5 = v9;
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  if (a3 == 1)
  {
LABEL_5:
    char v10 = [(HMDBackingStoreModelObject *)self encodeAsNSDictionaryFor:a4 error:a5];
    goto LABEL_7;
  }
  char v10 = 0;
LABEL_7:
  return v10;
}

- (id)encodeFor:(unint64_t)a3 error:(id *)a4
{
  int v7 = [MEMORY[0x1E4F1CA48] array];
  if (a4) {
    *a4 = 0;
  }
  id v8 = [(HMDBackingStoreModelObject *)self encodeWithEncoding:1 for:a3 error:a4];
  if (!v8 || a4 && *a4)
  {
    id v9 = 0;
  }
  else
  {
    [v7 addObject:v8];
    id v9 = v7;
  }

  return v9;
}

- (id)encodeWithEncoding:(unint64_t)a3 error:(id *)a4
{
  return [(HMDBackingStoreModelObject *)self encodeWithEncoding:a3 for:0 error:a4];
}

- (id)encodeWithError:(id *)a3
{
  return [(HMDBackingStoreModelObject *)self encodeFor:0 error:a3];
}

- (id)encodeAsNSDictionaryFor:(unint64_t)a3 error:(id *)a4
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  if (a4) {
    *a4 = 0;
  }
  int v7 = [(HMDBackingStoreModelObject *)self uuid];

  if (!v7)
  {
    if (a4)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:3 userInfo:&unk_1F2DCB7E8];
      long long v49 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v49 = 0;
    }
    goto LABEL_69;
  }
  id v8 = [(HMDBackingStoreModelObject *)self prepareFor:a3];
  if (!v8)
  {
    id v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:4];
  }
  v71 = a4;
  id v9 = [(HMDBackingStoreModelObject *)self bsoDataVersion];
  char v10 = [v9 versionString];
  [v8 setValue:v10 forKey:@"_V"];

  id v11 = [(HMDBackingStoreModelObject *)self bsoType];
  [v8 setValue:v11 forKey:@"_t"];

  id v12 = [(HMDBackingStoreModelObject *)self uuid];
  long long v13 = [v12 UUIDString];
  [v8 setValue:v13 forKey:@"_u"];

  int v14 = [(HMDBackingStoreModelObject *)self parentUUID];

  if (v14)
  {
    Class v15 = [(HMDBackingStoreModelObject *)self parentUUID];
    int v16 = [v15 UUIDString];
    [v8 setValue:v16 forKey:@"_P"];
  }
  int v17 = [(id)objc_opt_class() properties];
  char v18 = [(NSMutableDictionary *)self->_reserved hmf_dictionaryForKey:@"_R"];
  uint64_t v19 = [v18 mutableCopy];

  uint64_t v70 = v19;
  if (!v19)
  {
    uint64_t v70 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
  }
  v72 = self;
  __int16 v20 = [(NSMutableDictionary *)self->_reserved hmf_dictionaryForKey:@"_U"];
  uint64_t v21 = [v20 mutableCopy];

  if (!v21)
  {
    uint64_t v21 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
  }
  v73 = (void *)v21;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v22 = v17;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v79 objects:v90 count:16];
  id v24 = (void *)v70;
  __int16 v25 = v71;
  if (!v23) {
    goto LABEL_46;
  }
  uint64_t v26 = v23;
  uint64_t v74 = *(void *)v80;
  v69 = v8;
  do
  {
    uint64_t v27 = 0;
    do
    {
      if (*(void *)v80 != v74) {
        objc_enumerationMutation(v22);
      }
      uint64_t v28 = *(void *)(*((void *)&v79 + 1) + 8 * v27);
      uint64_t v29 = v22;
      id v30 = [v22 valueForKey:v28];
      __int16 v31 = [v30 readOnly];

      if (v31)
      {
        uint64_t v32 = [v30 readOnly];
        [v24 setObject:v32 forKey:v28];
      }
      __int16 v33 = [v30 unavailable];

      if (v33)
      {
        Class v34 = [v30 unavailable];
        [v73 setObject:v34 forKey:v28];
      }
      __int16 v35 = [v8 valueForKey:v28];
      if (!v35) {
        goto LABEL_23;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_23;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          long long v77 = 0u;
          long long v78 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          v38 = +[HMDBackingStore allowedTypes];
          uint64_t v39 = [v38 countByEnumeratingWithState:&v75 objects:v89 count:16];
          if (v39)
          {
            uint64_t v40 = v39;
            uint64_t v41 = *(void *)v76;
            while (2)
            {
              for (uint64_t i = 0; i != v40; ++i)
              {
                if (*(void *)v76 != v41) {
                  objc_enumerationMutation(v38);
                }
                if (objc_opt_isKindOfClass())
                {

                  id v8 = v69;
                  id v24 = (void *)v70;
                  __int16 v25 = v71;
                  goto LABEL_23;
                }
              }
              uint64_t v40 = [v38 countByEnumeratingWithState:&v75 objects:v89 count:16];
              __int16 v25 = v71;
              if (v40) {
                continue;
              }
              break;
            }
          }

          id v8 = v69;
          if (objc_msgSend((id)objc_msgSend(v30, "classObj"), "isEqual:", objc_opt_class()))
          {
            id v24 = (void *)v70;
            if (v25)
            {
              v55 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v56 = *MEMORY[0x1E4F64ED0];
              v87 = @"message";
              v57 = NSString;
              v58 = (objc_class *)objc_opt_class();
              v59 = NSStringFromClass(v58);
              v60 = [v57 stringWithFormat:@"/%@ (Cannot encode non-standard type %@ as NSObject generic)", v28, v59];
              v88 = v60;
              v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v88 forKeys:&v87 count:1];
              uint64_t v62 = v56;
              id v8 = v69;
              *__int16 v25 = [v55 errorWithDomain:v62 code:3 userInfo:v61];
            }
LABEL_62:
            id v37 = 0;
LABEL_66:

LABEL_67:
            id v22 = v29;

            long long v49 = 0;
            uint64_t v45 = v73;
            goto LABEL_68;
          }
          id v24 = (void *)v70;
          if (![(id)objc_opt_class() conformsToProtocol:&unk_1F2DD01F8]
            || ([(id)objc_opt_class() supportsSecureCoding] & 1) == 0)
          {
            if (v25)
            {
              long long v50 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v51 = *MEMORY[0x1E4F64ED0];
              v85 = @"message";
              long long v52 = [NSString stringWithFormat:@"/%@ (property does not support secureCoding)", v28];
              v86 = v52;
              long long v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v86 forKeys:&v85 count:1];
              uint64_t v54 = v51;
              id v8 = v69;
              *__int16 v25 = [v50 errorWithDomain:v54 code:3 userInfo:v53];
            }
            goto LABEL_62;
          }
          uint64_t v43 = encodeRootObjectForRemoteDeviceOnSameAccountMigrateToHH2(v35, 1, 0);

          if (!v43)
          {
            if (v25)
            {
              v63 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v64 = *MEMORY[0x1E4F64ED0];
              v83 = @"message";
              v65 = [NSString stringWithFormat:@"/%@ (property could not be encoded as NSData)", v28];
              v84 = v65;
              v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v84 forKeys:&v83 count:1];
              uint64_t v67 = v64;
              id v8 = v69;
              *__int16 v25 = [v63 errorWithDomain:v67 code:3 userInfo:v66];
            }
            id v37 = 0;
            __int16 v35 = 0;
            goto LABEL_66;
          }
          [v69 setValue:v43 forKey:v28];
          __int16 v35 = (void *)v43;
LABEL_23:

          goto LABEL_29;
        }
      }
      Class v36 = [(HMDBackingStoreModelObject *)v72 validateType:v35 path:v28];
      id v37 = v36;
      if (v25 && v36)
      {
        id v37 = v36;
        *__int16 v25 = v37;
        goto LABEL_66;
      }

      if (v37) {
        goto LABEL_67;
      }
LABEL_29:
      ++v27;
      id v22 = v29;
    }
    while (v27 != v26);
    uint64_t v44 = [v29 countByEnumeratingWithState:&v79 objects:v90 count:16];
    uint64_t v26 = v44;
  }
  while (v44);
LABEL_46:

  if ([v24 count]) {
    [v8 setObject:v24 forKey:@"_R"];
  }
  uint64_t v45 = v73;
  if ([v73 count]) {
    [v8 setObject:v73 forKey:@"_U"];
  }
  long long v46 = (objc_class *)[(id)objc_opt_class() genericRepresentation];
  if (v46)
  {
    long long v47 = v46;
    if (([(objc_class *)v46 isEqual:objc_opt_class()] & 1) == 0)
    {
      long long v48 = NSStringFromClass(v47);
      [v8 setObject:v48 forKey:@"_G"];
    }
  }
  long long v49 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:0];
LABEL_68:

LABEL_69:
  return v49;
}

- (id)prepareFor:(unint64_t)a3
{
  reserved = self->_reserved;
  if (reserved)
  {
    id v4 = (void *)[(NSMutableDictionary *)reserved mutableCopy];
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:6];
  }
  return v4;
}

- (id)validateType:(id)a3 path:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v32 = 0;
  LODWORD(self) = [(HMDBackingStoreModelObject *)self _validateType:a3 error:&v32];
  id v7 = v32;
  id v8 = v7;
  id v9 = 0;
  if (self)
  {
    char v10 = [v7 userInfo];
    id v11 = [v10 objectForKey:@"pathStack"];
    id v12 = (void *)[v11 mutableCopy];

    long long v13 = [MEMORY[0x1E4F28E78] string];
    [v12 addObject:v6];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    int v14 = [v12 reverseObjectEnumerator];
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

    uint64_t v19 = [v8 userInfo];
    __int16 v20 = [v19 objectForKey:@"errorText"];
    [v13 appendFormat:@" %@", v20];

    uint64_t v21 = [v8 userInfo];
    id v22 = [v21 objectForKey:@"message"];
    [v22 setString:v13];

    uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
    id v24 = [v8 domain];
    uint64_t v25 = [v8 code];
    __int16 v33 = @"message";
    Class v34 = v13;
    uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    id v9 = [v23 errorWithDomain:v24 code:v25 userInfo:v26];
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
  id v7 = +[HMDBackingStore allowedTypes];
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
              if ([(HMDBackingStoreModelObject *)self _validateType:*(void *)(*((void *)&v48 + 1) + 8 * v25) error:a4])
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
            char v18 = [v15 objectForKey:@"pathStack"];
            uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"[%lu]", v23 + v25);
            __int16 v33 = v18;
            Class v34 = v19;
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
                char v18 = [NSString stringWithFormat:@"%@", v31];
                uint64_t v19 = [v37 arrayWithObject:v18];
                v57[1] = v19;
                v56[2] = @"errorText";
                v38 = NSString;
                uint64_t v39 = (objc_class *)objc_opt_class();
                uint64_t v40 = NSStringFromClass(v39);
                uint64_t v41 = [v38 stringWithFormat:@"(key must be of string type (is %@))", v40];
                v57[2] = v41;
                char v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:3];
                *a4 = [v43 errorWithDomain:v36 code:3 userInfo:v42];

                goto LABEL_37;
              }
              uint64_t v15 = [v14 objectForKey:v31];
              if ([(HMDBackingStoreModelObject *)self _validateType:v15 error:a4]) {
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
            char v18 = [*a4 userInfo];
            __int16 v33 = [v18 objectForKey:@"pathStack"];
            uint64_t v19 = v33;
            Class v34 = v31;
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
    char v18 = NSStringFromClass(v17);
    uint64_t v19 = [v16 stringWithFormat:@"(%@ not a valid type within an aggregate type)", v18];
    v61[2] = v19;
    __int16 v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:3];
    *a4 = [v12 errorWithDomain:v13 code:3 userInfo:v20];

    goto LABEL_37;
  }
  BOOL v32 = 1;
LABEL_41:

  return v32;
}

- (NSSet)dependentUUIDs
{
  unint64_t v3 = [(HMDBackingStoreModelObject *)self parentUUID];

  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  if (v3)
  {
    id v5 = [(HMDBackingStoreModelObject *)self parentUUID];
    id v6 = [v4 setWithObject:v5];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CAD0] set];
  }
  return (NSSet *)v6;
}

- (BOOL)bsoIgnoreModel
{
  uint64_t v2 = [(HMDBackingStoreModelObject *)self bsoIgnoredBefore];
  if (v2)
  {
    unint64_t v3 = +[HMDBackingStoreSingleton dataVersion];
    char v4 = [v2 isGreaterThan:v3];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (HMFVersion)bsoIgnoredBefore
{
  return (HMFVersion *)[(NSMutableDictionary *)self->_reserved objectForKey:@"_i"];
}

- (void)setBsoIgnoredBefore:(id)a3
{
  id v4 = a3;
  reserved = self->_reserved;
  id v8 = v4;
  if (!reserved)
  {
    id v6 = [MEMORY[0x1E4F1CA60] dictionary];
    id v7 = self->_reserved;
    self->_reserved = v6;

    id v4 = v8;
    reserved = self->_reserved;
  }
  [(NSMutableDictionary *)reserved setObject:v4 forKey:@"_i"];
}

- (id)backedObjectWithParent:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (objc_class *)[(id)objc_opt_class() backedObjectClass];
  if (v7)
  {
    id v8 = v7;
    id v9 = [v7 alloc];
    uint64_t v10 = v9;
    if (v9
      && [v9 conformsToProtocol:&unk_1F2DD5838]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v11 = (void *)[[v8 alloc] initWithModelObject:self parent:v6 error:a4];
    }
    else if (a4)
    {
      [MEMORY[0x1E4F28C58] hmfErrorWithCode:5];
      id v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v11 = 0;
    }
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] hmfErrorWithCode:5];
    id v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (HMDBackingStoreModelObject)initWithUUID:(id)a3 parentUUID:(id)a4
{
  return [(HMDBackingStoreModelObject *)self initWithVersion:0 changeType:0 uuid:a3 parentUUID:a4];
}

- (HMDBackingStoreModelObject)initWithUUID:(id)a3
{
  return [(HMDBackingStoreModelObject *)self initWithVersion:0 changeType:0 uuid:a3 parentUUID:0];
}

- (id)typeNameForDebug
{
  uint64_t v2 = [(HMDBackingStoreModelObject *)self bsoType];
  unint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  if ([v2 isEqual:v4])
  {
    id v5 = v2;
  }
  else
  {
    id v5 = [NSString stringWithFormat:@"%@/%@", v4, v2];
  }
  id v6 = v5;

  return v6;
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  id v4 = keyFromSelector(a3);
  if (v4
    && ([(id)objc_opt_class() properties],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 objectForKey:v4],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    id v7 = NSStringFromSelector(a3);
    int v8 = [v7 isEqualToString:v4];

    id v9 = (objc_class *)objc_opt_class();
    if (v8)
    {
      uint64_t v10 = "@@:";
      id v11 = (void (*)(void))propertyIMP;
    }
    else
    {
      uint64_t v10 = "v@:@";
      id v11 = (void (*)(void))setPropertyIMP;
    }
    class_addMethod(v9, a3, v11, v10);
    BOOL v12 = 1;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t19_137311 != -1) {
    dispatch_once(&logCategory__hmf_once_t19_137311, &__block_literal_global_137312);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v20_137313;
  return v2;
}

uint64_t __41__HMDBackingStoreModelObject_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v20_137313;
  logCategory__hmf_once_v20_137313 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)formatValue:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = @"<NULL>";
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<NSArray: %lu items>", objc_msgSend(v3, "count"));
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<NSDictionary: %lu items>", objc_msgSend(v3, "count"));
LABEL_7:
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_8:
    id v4 = v5;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = (void *)MEMORY[0x1E4F28DC0];
    int v8 = +[HMDBackingStore allowedTypes];
    uint64_t v25 = 0;
    id v9 = [v7 _strictlyUnarchivedObjectOfClasses:v8 fromData:v3 error:&v25];

    uint64_t v10 = NSString;
    if (v9)
    {
      id v11 = (objc_class *)objc_opt_class();
      BOOL v12 = NSStringFromClass(v11);
      id v4 = [v10 stringWithFormat:@"<%@ / NSData: %lu bytes>", v12, objc_msgSend(v3, "length")];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"<NSData: %lu bytes>", objc_msgSend(v3, "length"));
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v13 = +[HMDBackingStore allowedTypes];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v13);
          }
          if (objc_opt_isKindOfClass())
          {

            id v5 = (__CFString *)v3;
            goto LABEL_8;
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    char v18 = NSString;
    uint64_t v19 = (objc_class *)objc_opt_class();
    __int16 v20 = NSStringFromClass(v19);
    id v4 = [v18 stringWithFormat:@"<%@>", v20];
  }
LABEL_9:

  return v4;
}

+ (id)objectFromCloud:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 objectForKey:@"k00"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    id v9 = objc_msgSend(NSString, "stringWithFormat:", @"k%02lu", objc_msgSend(v8, "unsignedIntValue"));
    uint64_t v10 = [v5 objectForKey:v9];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }
    id v12 = v11;

    if (v12)
    {
      uint64_t v13 = +[HMDBackingStoreModelObject objectFromData:encoding:error:](HMDBackingStoreModelObject, "objectFromData:encoding:error:", v12, [v8 unsignedIntValue], a4);
    }
    else if (a4)
    {
      [MEMORY[0x1E4F28C58] hmfErrorWithCode:8];
      uint64_t v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] hmfErrorWithCode:8];
    uint64_t v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

+ (id)objectFromData:(id)a3 encoding:(unint64_t)a4 record:(id)a5 error:(id *)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = +[HMDBackingStoreModelObject objectFromData:v10 encoding:a4 error:a6];
  if (!v12) {
    goto LABEL_8;
  }
  uint64_t v13 = (void *)MEMORY[0x1D9452090]();
  id v24 = 0;
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v11 error:&v24];
  id v15 = v24;
  uint64_t v16 = [objc_alloc(MEMORY[0x1E4F1A2D8]) initWithCoder:v14];
  uint64_t v17 = (void *)v12[10];
  v12[10] = v16;

  if (v15)
  {
    char v18 = (void *)MEMORY[0x1D9452090]();
    id v19 = a1;
    __int16 v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      long long v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      uint64_t v26 = v21;
      __int16 v27 = 2112;
      uint64_t v28 = v12;
      __int16 v29 = 2112;
      id v30 = v15;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unable to unarchive CKRecord for BSO (%@): %@", buf, 0x20u);
    }
    if (a6) {
      *a6 = v15;
    }

    long long v22 = 0;
  }
  else
  {
LABEL_8:
    long long v22 = v12;
  }

  return v22;
}

+ (id)objectFromData:(id)a3 encoding:(unint64_t)a4 rowID:(unint64_t)a5 error:(id *)a6
{
  id result = +[HMDBackingStoreModelObject objectFromData:a3 encoding:a4 error:a6];
  if (result) {
    *((void *)result + 7) = a5;
  }
  return result;
}

+ (id)objectFromData:(id)a3 encoding:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = v7;
  if (a5) {
    *a5 = 0;
  }
  if (![v7 length]) {
    goto LABEL_9;
  }
  if (a4 == 1)
  {
    id v9 = +[HMDBackingStoreModelObject objectFromDictionaryData:v8 type:0 error:a5];
    if (v9)
    {
      id v10 = v9;
      [v9 clearVersionOverride];
      goto LABEL_10;
    }
  }
  if (a5 && !*a5)
  {
    [MEMORY[0x1E4F28C58] hmfErrorWithCode:3];
    id v10 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_9:
    id v10 = 0;
  }
LABEL_10:

  return v10;
}

+ (id)objectFromDictionaryData:(id)a3 error:(id *)a4
{
  return +[HMDBackingStoreModelObject objectFromDictionaryData:a3 type:0 error:a4];
}

+ (id)objectFromDictionaryData:(id)a3 type:(id)a4 error:(id *)a5
{
  v138[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (NSString *)a4;
  if (a5) {
    *a5 = 0;
  }
  if (![v8 length])
  {
    uint64_t v13 = 0;
    goto LABEL_79;
  }
  id v10 = (void *)MEMORY[0x1D9452090]();
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v8 error:0];
  id v12 = +[HMDBackingStore internalAllowedTypes];
  uint64_t v109 = *MEMORY[0x1E4F284E8];
  uint64_t v13 = objc_msgSend(v11, "decodeObjectOfClasses:forKey:", v12);

  v108 = v13;
  if (!v13)
  {
    uint64_t v67 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F64ED0] code:2 userInfo:0];
    goto LABEL_76;
  }
  id v107 = a1;
  if (!v9)
  {
    id v9 = [v13 valueForKey:@"_t"];
    if (!v9)
    {
      uint64_t v67 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:8];
      uint64_t v74 = (void *)MEMORY[0x1D9452090]();
      id v75 = a1;
      long long v76 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
      {
        long long v77 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v123 = v77;
        __int16 v124 = 2112;
        v125 = v108;
        _os_log_impl(&dword_1D49D5000, v76, OS_LOG_TYPE_ERROR, "%{public}@Received an object with a dictionary missing the kType key: %@", buf, 0x16u);
      }
      long long v78 = (void *)MEMORY[0x1D9452090]();
      id v79 = v75;
      long long v80 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_FAULT))
      {
        long long v81 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v123 = v81;
        _os_log_impl(&dword_1D49D5000, v80, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Received a model missing a critical field.", buf, 0xCu);
      }
      long long v82 = [[HMDAssertionLogEvent alloc] initWithReason:@"Received a model missing a critical field."];
      v83 = +[HMDMetricsManager sharedLogEventSubmitter];
      [v83 submitLogEvent:v82];

      uint64_t v13 = 0;
      id v9 = 0;
      goto LABEL_76;
    }
  }
  uint64_t v14 = +[HMDBackingStoreSingleton sharedInstance];
  id v15 = [v14 nameToClassTransform];
  uint64_t v16 = (objc_class *)[v15 objectForKey:v9];

  if (!v16)
  {
    Class v17 = NSClassFromString(v9);
    if (!v17)
    {
      v84 = [v13 valueForKey:@"_G"];

      v104 = v84;
      if (!v84 || (uint64_t v85 = (uint64_t)NSClassFromString(v84)) == 0) {
        uint64_t v85 = objc_opt_class();
      }
      uint64_t v16 = (objc_class *)v85;
      goto LABEL_11;
    }
    uint64_t v16 = v17;
  }
  v104 = v9;
LABEL_11:
  v105 = v11;
  if (([(objc_class *)v16 isSubclassOfClass:objc_opt_class()] & 1) == 0)
  {
    v68 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v69 = *MEMORY[0x1E4F64ED0];
    v137 = @"message";
    uint64_t v70 = NSString;
    v71 = NSStringFromClass(v16);
    v72 = [v70 stringWithFormat:@"remapped (or explicit map) is not a subclass of HMDBackingStoreModelObject (%@ is not a sub-class of HMDBackingStoreModelObject)", v71];
    v138[0] = v72;
    v73 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v138 forKeys:&v137 count:1];
    uint64_t v67 = [v68 errorWithDomain:v69 code:3 userInfo:v73];

    uint64_t v13 = 0;
    id v9 = v104;
    id v11 = v105;
    goto LABEL_76;
  }
  v102 = v10;
  id v18 = [v16 alloc];
  id v19 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v20 = [v18 initWithVersion:0 changeType:0 uuid:v19 parentUUID:0];

  uint64_t v21 = [v13 mutableCopy];
  long long v22 = *(void **)(v20 + 8);
  *(void *)(v20 + 8) = v21;

  long long v23 = (void *)MEMORY[0x1E4F654F0];
  id v24 = [v13 valueForKey:@"_u"];
  uint64_t v25 = objc_msgSend(v23, "hmf_cachedInstanceForNSString:", v24);
  uint64_t v26 = *(void **)(v20 + 24);
  *(void *)(v20 + 24) = v25;

  __int16 v27 = (void *)MEMORY[0x1E4F654F0];
  [v13 valueForKey:@"_P"];
  v29 = uint64_t v28 = v13;
  uint64_t v30 = objc_msgSend(v27, "hmf_cachedInstanceForNSString:", v29);
  uint64_t v31 = *(void **)(v20 + 32);
  *(void *)(v20 + 32) = v30;

  BOOL v32 = (void *)MEMORY[0x1E4F654E8];
  __int16 v33 = [v28 valueForKey:@"_t"];
  uint64_t v34 = objc_msgSend(v32, "hmf_cachedInstanceForString:", v33);
  __int16 v35 = *(void **)(v20 + 48);
  *(void *)(v20 + 48) = v34;

  objc_msgSend(v28, "hmf_stringForKey:", @"_V");
  uint64_t v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v101 = v36;
  if (!v36)
  {
    uint64_t v13 = [v108 valueForKey:@"_v"];

    if (!v13)
    {
      v96 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v97 = *MEMORY[0x1E4F64ED0];
      v135 = @"message";
      uint64_t v40 = [NSString stringWithFormat:@"expecting a versioning key named %@ but one does not exist", @"_v"];
      v136 = v40;
      v112 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v136 forKeys:&v135 count:1];
      uint64_t v67 = objc_msgSend(v96, "errorWithDomain:code:userInfo:", v97, 3);
      goto LABEL_75;
    }
    uint64_t v36 = @"4.0";
  }
  id v37 = [[HMDHomeKitVersion alloc] initWithVersionString:v36];
  objc_storeStrong((id *)(v20 + 64), v37);
  v38 = *(void **)(v20 + 8);
  v134[0] = @"_P";
  v134[1] = @"_u";
  v134[2] = @"_v";
  v134[3] = @"_t";
  v134[4] = @"_T";
  v134[5] = @"_d";
  v134[6] = @"_G";
  uint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v134 count:7];
  [v38 removeObjectsForKeys:v39];

  uint64_t v40 = [(id)objc_opt_class() properties];
  v112 = +[HMDBackingStore allowedTypes];
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  id obj = [*(id *)(v20 + 8) allKeys];
  uint64_t v41 = [obj countByEnumeratingWithState:&v118 objects:v133 count:16];
  if (!v41)
  {
    uint64_t v67 = 0;
    goto LABEL_74;
  }
  uint64_t v42 = v41;
  v98 = v37;
  v99 = a5;
  id v100 = v8;
  uint64_t v43 = *(void *)v119;
  long long v44 = obj;
  uint64_t v111 = *(void *)v119;
  while (2)
  {
    uint64_t v45 = 0;
    uint64_t v113 = v42;
    do
    {
      if (*(void *)v119 != v43) {
        objc_enumerationMutation(v44);
      }
      long long v46 = *(void **)(*((void *)&v118 + 1) + 8 * v45);
      long long v47 = [v40 valueForKey:v46];
      uint64_t v48 = [*(id *)(v20 + 8) valueForKey:v46];
      long long v49 = (void *)v48;
      if (v47) {
        BOOL v50 = v48 == 0;
      }
      else {
        BOOL v50 = 1;
      }
      if (!v50)
      {
        if (objc_msgSend((id)objc_msgSend(v47, "classObj"), "isEqual:", objc_opt_class()))
        {
          [*(id *)(v20 + 8) removeObjectForKey:v46];
LABEL_53:
          uint64_t v42 = v113;
          goto LABEL_54;
        }
        long long v116 = 0u;
        long long v117 = 0u;
        long long v114 = 0u;
        long long v115 = 0u;
        id v51 = v112;
        uint64_t v52 = [v51 countByEnumeratingWithState:&v114 objects:v132 count:16];
        if (v52)
        {
          uint64_t v53 = v20;
          long long v54 = v40;
          uint64_t v55 = *(void *)v115;
          while (2)
          {
            for (uint64_t i = 0; i != v52; ++i)
            {
              if (*(void *)v115 != v55) {
                objc_enumerationMutation(v51);
              }
              if (objc_opt_isKindOfClass())
              {
                LODWORD(v52) = 1;
                goto LABEL_36;
              }
            }
            uint64_t v52 = [v51 countByEnumeratingWithState:&v114 objects:v132 count:16];
            if (v52) {
              continue;
            }
            break;
          }
LABEL_36:
          uint64_t v40 = v54;
          uint64_t v20 = v53;
          long long v44 = obj;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || v52
          && ((objc_msgSend(v51, "containsObject:", objc_msgSend(v47, "classObj")) & 1) != 0
           || objc_msgSend((id)objc_msgSend(v47, "classObj"), "isEqual:", objc_opt_class())))
        {
          v57 = objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v46);
          [*(id *)(v20 + 8) removeObjectForKey:v46];
          [*(id *)(v20 + 8) setObject:v49 forKey:v57];
LABEL_52:

          uint64_t v43 = v111;
          goto LABEL_53;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!objc_msgSend((id)objc_msgSend(v47, "classObj"), "isEqual:", objc_opt_class()))
          {
            v57 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v49 error:0];
            [v57 _allowDecodingCyclesInSecureMode];
            if (objc_msgSend((id)objc_msgSend(v47, "classObj"), "isSubclassOfClass:", objc_opt_class()))
            {
              v58 = [v47 decodeClasses];
              uint64_t v59 = [v57 decodeObjectOfClasses:v58 forKey:v109];

              long long v49 = (void *)v59;
              long long v44 = obj;
            }
            else
            {
              objc_msgSend(v57, "decodeObjectOfClass:forKey:", objc_msgSend(v47, "classObj"), v109);
              long long v49 = v58 = v49;
            }

            [v57 finishDecoding];
            uint64_t v60 = [*(id *)(v20 + 8) removeObjectForKey:v46];
            if (v49)
            {
              v61 = objc_msgSend(MEMORY[0x1E4F654E8], "hmf_cachedInstanceForString:", v46);
              [*(id *)(v20 + 8) setObject:v49 forKey:v61];
            }
            else
            {
              context = (void *)MEMORY[0x1D9452090](v60);
              id v62 = v107;
              uint64_t v63 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                uint64_t v64 = v103 = v62;
                uint64_t v65 = [v57 error];
                *(_DWORD *)buf = 138543874;
                v123 = v64;
                __int16 v124 = 2112;
                v125 = v46;
                __int16 v126 = 2112;
                uint64_t v127 = v65;
                v66 = (void *)v65;
                _os_log_impl(&dword_1D49D5000, v63, OS_LOG_TYPE_ERROR, "%{public}@failed to unarchive implicitly archived property %@: %@", buf, 0x20u);

                id v62 = v103;
              }

              long long v44 = obj;
            }
            goto LABEL_52;
          }
          v93 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v94 = *MEMORY[0x1E4F64ED0];
          v128 = @"message";
          v90 = [NSString stringWithFormat:@"should not have a internally handled type of NSObject (but we hit one for key %@)", v46];
          v129 = v90;
          uint64_t v91 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v129 forKeys:&v128 count:1];
          uint64_t v67 = [v93 errorWithDomain:v94 code:3 userInfo:v91];
        }
        else
        {
          v86 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v87 = *MEMORY[0x1E4F64ED0];
          v130 = @"message";
          v88 = NSString;
          v89 = (objc_class *)objc_opt_class();
          v90 = NSStringFromClass(v89);
          uint64_t v91 = [v88 stringWithFormat:@"expecting internal storage to be a NSData, but it's a %@", v90];
          v131 = v91;
          v92 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v131 forKeys:&v130 count:1];
          uint64_t v67 = [v86 errorWithDomain:v87 code:3 userInfo:v92];
        }
        uint64_t v20 = 0;
        goto LABEL_73;
      }
LABEL_54:

      ++v45;
    }
    while (v45 != v42);
    uint64_t v42 = [v44 countByEnumeratingWithState:&v118 objects:v133 count:16];
    if (v42) {
      continue;
    }
    break;
  }
  uint64_t v67 = 0;
LABEL_73:
  a5 = v99;
  id v8 = v100;
  id v37 = v98;
LABEL_74:
  uint64_t v13 = (void *)v20;

  uint64_t v20 = (uint64_t)v37;
LABEL_75:
  id v9 = v104;
  id v11 = v105;

  id v10 = v102;
LABEL_76:

  if (a5) {
    *a5 = v67;
  }

LABEL_79:
  return v13;
}

+ (id)bsoSchemaHash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [a1 schemaHashRoot];
  if (v4) {
    [v3 addObject:v4];
  }
  id v5 = [a1 properties];
  id v6 = [v5 allKeys];
  id v7 = [v6 sortedArrayUsingSelector:sel_compare_];
  [v3 addObjectsFromArray:v7];

  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"551E3F88-0C11-4402-A486-6D1EB759AADD"];
  id v9 = (void *)MEMORY[0x1E4F29128];
  id v10 = (void *)[v3 copy];
  id v11 = objc_msgSend(v9, "hm_deriveUUIDFromBaseUUID:withSalts:", v8, v10);
  id v12 = [v11 UUIDString];

  return v12;
}

+ (id)schemaHashRoot
{
  return 0;
}

+ (id)properties
{
  return (id)[MEMORY[0x1E4F1C9E8] dictionary];
}

+ (Class)backedObjectClass
{
  return 0;
}

@end