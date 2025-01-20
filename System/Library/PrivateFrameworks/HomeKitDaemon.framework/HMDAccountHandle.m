@interface HMDAccountHandle
+ (BOOL)supportsSecureCoding;
+ (id)accountHandleForDestination:(id)a3;
+ (id)logCategory;
- (BOOL)isBackingStorageEqual:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocal;
- (BOOL)isLocallyTracked;
- (BOOL)updateBackingModel:(id)a3 error:(id *)a4;
- (CKUserIdentityLookupInfo)cloudKitLookupInfo;
- (CNContact)contact;
- (Class)modelClass;
- (HMDAccountHandle)init;
- (HMDAccountHandle)initWithBackingModel:(id)a3;
- (HMDAccountHandle)initWithCoder:(id)a3;
- (HMDAccountHandle)initWithObjectModel:(id)a3;
- (HMDAccountHandle)initWithURI:(id)a3;
- (HMDAccountHandle)initWithURI:(id)a3 local:(BOOL)a4;
- (IDSURI)URI;
- (NSString)value;
- (NSUUID)identifier;
- (NSUUID)modelIdentifier;
- (NSUUID)modelParentIdentifier;
- (Protocol)backingModelType;
- (id)attributeDescriptions;
- (id)backingStoreObjectsWithChangeType:(unint64_t)a3 version:(int64_t)a4;
- (id)logIdentifier;
- (id)modelBackedObjects;
- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4;
- (id)remoteDestinationString;
- (id)shortDescription;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setLocallyTracked:(BOOL)a3;
- (void)setModelParentIdentifier:(id)a3;
- (void)transactionObjectRemoved:(id)a3 message:(id)a4;
- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5;
@end

@implementation HMDAccountHandle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URI, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_modelParentIdentifier, 0);
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
}

- (void)setLocallyTracked:(BOOL)a3
{
  self->_locallyTracked = a3;
}

- (BOOL)isLocallyTracked
{
  return self->_locallyTracked;
}

- (IDSURI)URI
{
  return (IDSURI *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)isLocal
{
  return self->_local;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)modelParentIdentifier
{
  return self->_modelParentIdentifier;
}

- (NSUUID)modelIdentifier
{
  return self->_modelIdentifier;
}

- (id)logIdentifier
{
  v2 = [(HMDAccountHandle *)self identifier];
  v3 = [v2 UUIDString];

  return v3;
}

- (id)remoteDestinationString
{
  v2 = [(HMDAccountHandle *)self URI];
  v3 = [v2 prefixedURI];

  return v3;
}

- (BOOL)isBackingStorageEqual:(id)a3
{
  v4 = (HMDAccountHandle *)a3;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
  }
  else if ([(HMDAccountHandle *)self isEqual:v4])
  {
    v5 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
    v7 = v6;

    if (v7)
    {
      BOOL v8 = [(HMDAccountHandle *)self isLocal];
      BOOL v9 = v8 ^ [(HMDAccountHandle *)v7 isLocal] ^ 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (id)modelBackedObjects
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = self;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)backingStoreObjectsWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = [(HMDAccountHandle *)self modelObjectWithChangeType:a3 version:a4];
  v5 = (void *)v4;
  if (v4)
  {
    v8[0] = v4;
    v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  }
  else
  {
    v6 = (void *)MEMORY[0x263EFFA68];
  }

  return v6;
}

- (id)modelObjectWithChangeType:(unint64_t)a3 version:(int64_t)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v6 = [(HMDAccountHandle *)self modelParentIdentifier];

  if (v6)
  {
    v7 = [HMDAccountHandleModel alloc];
    BOOL v8 = [(HMDAccountHandle *)self modelIdentifier];
    BOOL v9 = [(HMDAccountHandle *)self modelParentIdentifier];
    v10 = [(HMDBackingStoreModelObject *)v7 initWithObjectChangeType:a3 uuid:v8 parentUUID:v9];

    v11 = [(HMDAccountHandle *)self URI];
    v12 = (void *)[v11 copy];
    [(HMDAccountHandleModel *)v10 setIdsURI:v12];

    v13 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDAccountHandle isLocal](self, "isLocal"));
    [(HMDAccountHandleModel *)v10 setLocal:v13];
  }
  else
  {
    v14 = (void *)MEMORY[0x230FBD990]();
    v15 = self;
    v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      int v19 = 138543362;
      v20 = v17;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Account handle is missing parent identifier, returning nil", (uint8_t *)&v19, 0xCu);
    }
    v10 = 0;
  }
  return v10;
}

- (void)setModelParentIdentifier:(id)a3
{
  id v4 = a3;
  if (!self->_modelParentIdentifier)
  {
    id v10 = v4;
    v5 = (NSUUID *)[v4 copy];
    modelParentIdentifier = self->_modelParentIdentifier;
    self->_modelParentIdentifier = v5;

    id v4 = v10;
    if (!self->_modelIdentifier)
    {
      v7 = [(HMDAccountHandle *)self URI];
      __modelIdentifierForURI(v7, v10);
      BOOL v8 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      modelIdentifier = self->_modelIdentifier;
      self->_modelIdentifier = v8;

      id v4 = v10;
    }
  }
}

- (Class)modelClass
{
  return (Class)objc_opt_class();
}

- (HMDAccountHandle)initWithObjectModel:(id)a3
{
  id v4 = a3;
  v5 = [v4 idsURI];
  v6 = [v4 local];
  v7 = -[HMDAccountHandle initWithURI:local:](self, "initWithURI:local:", v5, [v6 BOOLValue]);

  if (v7)
  {
    BOOL v8 = [v4 uuid];
    uint64_t v9 = [v8 copy];
    modelIdentifier = v7->_modelIdentifier;
    v7->_modelIdentifier = (NSUUID *)v9;

    v11 = [v4 parentUUID];
    uint64_t v12 = [v11 copy];
    modelParentIdentifier = v7->_modelParentIdentifier;
    v7->_modelParentIdentifier = (NSUUID *)v12;
  }
  return v7;
}

- (void)transactionObjectUpdated:(id)a3 newValues:(id)a4 message:(id)a5
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    id v43 = v8;
    v14 = self;
    id v15 = v13;
    id v42 = v10;
    id v16 = v10;
    v17 = [v16 transactionResult];
    if (![v17 source] && !-[HMDAccountHandle isLocallyTracked](v14, "isLocallyTracked"))
    {
      [(HMDAccountHandle *)v14 setLocallyTracked:1];
      [v17 markChanged];
    }
    id v18 = [(HMDAccountHandle *)v14 modelObjectWithChangeType:0 version:4];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v19 = v18;
    }
    else {
      int v19 = 0;
    }
    id v20 = v19;

    if (v20)
    {
      if ([v20 diff:v15 differingFields:0])
      {
        v40 = v15;
        uint64_t v21 = (void *)MEMORY[0x230FBD990]();
        v22 = v14;
        v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v24 = v38 = v21;
          *(_DWORD *)buf = 138543362;
          v45 = v24;
          _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Updating account handle", buf, 0xCu);

          uint64_t v21 = v38;
        }

        uint64_t v25 = [v40 idsURI];
        URI = v22->_URI;
        v22->_URI = (IDSURI *)v25;

        v27 = [v40 local];
        v22->_local = [v27 BOOLValue];

        id v15 = v40;
        [v17 markChanged];
      }
    }
    else
    {
      id v41 = v15;
      v33 = (void *)MEMORY[0x230FBD990]();
      v34 = v14;
      v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v36 = v39 = v33;
        *(_DWORD *)buf = 138543362;
        v45 = v36;
        _os_log_impl(&dword_22F52A000, v35, OS_LOG_TYPE_ERROR, "%{public}@Unable to retrieve model for updated account handle", buf, 0xCu);

        v33 = v39;
      }

      v37 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
      [v16 respondWithError:v37];

      id v15 = v41;
    }

    id v10 = v42;
    id v8 = v43;
  }
  else
  {
    v28 = (void *)MEMORY[0x230FBD990]();
    v29 = self;
    v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v45 = v31;
      __int16 v46 = 2112;
      id v47 = v11;
      __int16 v48 = 2112;
      id v49 = (id)objc_opt_class();
      id v32 = v49;
      _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectUpdated:newValues:message:]", buf, 0x20u);
    }
    v14 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
    [v10 respondWithError:v14];
  }
}

- (void)transactionObjectRemoved:(id)a3 message:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  id v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    id v11 = HMFGetLogIdentifier();
    int v14 = 138543874;
    id v15 = v11;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = (id)objc_opt_class();
    id v12 = v19;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unknown model object (%@) sent to [%@ transactionObjectRemoved:message:]", (uint8_t *)&v14, 0x20u);
  }
  id v13 = [MEMORY[0x263F087E8] hmErrorWithCode:2];
  [v7 respondWithError:v13];
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  id v4 = [(HMDAccountHandle *)self URI];
  [v8 encodeObject:v4 forKey:@"HMD.URI"];

  objc_msgSend(v8, "encodeBool:forKey:", -[HMDAccountHandle isLocal](self, "isLocal"), @"HMD.local");
  if (objc_msgSend(v8, "hmd_isForLocalStore"))
  {
    objc_msgSend(v8, "encodeBool:forKey:", -[HMDAccountHandle isLocallyTracked](self, "isLocallyTracked"), @"HMD.locallyTracked");
    v5 = [(HMDAccountHandle *)self modelIdentifier];
    [v8 encodeObject:v5 forKey:@"HMD.modelIdentifier"];

    id v6 = [(HMDAccountHandle *)self modelParentIdentifier];

    if (v6)
    {
      id v7 = [(HMDAccountHandle *)self modelParentIdentifier];
      [v8 encodeObject:v7 forKey:@"HMD.modelParentIdentifier"];
    }
  }
}

- (HMDAccountHandle)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMD.URI"];
  id v6 = -[HMDAccountHandle initWithURI:local:](self, "initWithURI:local:", v5, [v4 decodeBoolForKey:@"HMD.local"]);
  if (v6)
  {
    v6->_locallyTracked = [v4 decodeBoolForKey:@"HMD.locallyTracked"];
    if ([v4 containsValueForKey:@"HMD.modelParentIdentifier"])
    {
      uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMD.modelParentIdentifier"];
      modelParentIdentifier = v6->_modelParentIdentifier;
      v6->_modelParentIdentifier = (NSUUID *)v7;
    }
    if ([v4 containsValueForKey:@"HMD.modelIdentifier"])
    {
      uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMD.modelIdentifier"];
      modelIdentifier = v6->_modelIdentifier;
      v6->_modelIdentifier = (NSUUID *)v9;
    }
    else
    {
      modelIdentifier = [(HMDAccountHandle *)v6 URI];
      uint64_t v11 = __modelIdentifierForURI(modelIdentifier, 0);
      id v12 = v6->_modelIdentifier;
      v6->_modelIdentifier = (NSUUID *)v11;
    }
  }

  return v6;
}

- (CKUserIdentityLookupInfo)cloudKitLookupInfo
{
  int64_t v3 = [(HMDAccountHandle *)self type];
  if (v3 == 2)
  {
    uint64_t v7 = +[HMDAccountHandleFormatter defaultFormatter];
    v5 = [v7 stringForObjectValue:self];

    if (v5)
    {
      uint64_t v6 = [objc_alloc(MEMORY[0x263EFD888]) initWithPhoneNumber:v5];
      goto LABEL_7;
    }
LABEL_9:
    id v8 = 0;
    goto LABEL_10;
  }
  if (v3 != 1)
  {
    id v8 = 0;
    goto LABEL_11;
  }
  id v4 = +[HMDAccountHandleFormatter defaultFormatter];
  v5 = [v4 stringForObjectValue:self];

  if (!v5) {
    goto LABEL_9;
  }
  uint64_t v6 = [objc_alloc(MEMORY[0x263EFD888]) initWithEmailAddress:v5];
LABEL_7:
  id v8 = (void *)v6;
LABEL_10:

LABEL_11:
  return (CKUserIdentityLookupInfo *)v8;
}

- (CNContact)contact
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__110304;
  uint64_t v9 = __Block_byref_object_dispose__110305;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  void v4[2] = __27__HMDAccountHandle_contact__block_invoke;
  v4[3] = &unk_264A2F0A0;
  v4[4] = self;
  v4[5] = &v5;
  [MEMORY[0x263F424F0] activityWithName:@"Account.Contact" parent:0 options:1 block:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (CNContact *)v2;
}

void __27__HMDAccountHandle_contact__block_invoke(uint64_t a1)
{
  v18[3] = *MEMORY[0x263EF8340];
  if (HMDAccountHandleModelIdentifierNamespaceUUIDString_block_invoke_onceToken != -1) {
    dispatch_once(&HMDAccountHandleModelIdentifierNamespaceUUIDString_block_invoke_onceToken, &__block_literal_global_110310);
  }
  id v17 = *(id *)(a1 + 32);
  uint64_t v2 = [v17 type];
  if (v2 == 1)
  {
    id v8 = (void *)MEMORY[0x263EFE9F8];
    uint64_t v6 = [v17 URI];
    uint64_t v9 = [v6 unprefixedURI];
    uint64_t v7 = [v8 predicateForContactsMatchingEmailAddress:v9];

LABEL_7:
    if (v7)
    {
      uint64_t v10 = *MEMORY[0x263EFDF80];
      v18[0] = *MEMORY[0x263EFE070];
      v18[1] = v10;
      uint64_t v11 = [MEMORY[0x263EFEA20] descriptorForRequiredKeysForStyle:0];
      v18[2] = v11;
      id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:3];

      id v13 = [(id)HMDAccountHandleModelIdentifierNamespaceUUIDString_block_invoke_store unifiedContactsMatchingPredicate:v7 keysToFetch:v12 error:0];
      if ((objc_msgSend(v13, "hmf_isEmpty") & 1) == 0)
      {
        uint64_t v14 = [v13 firstObject];
        uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
        __int16 v16 = *(void **)(v15 + 40);
        *(void *)(v15 + 40) = v14;
      }
    }
    return;
  }
  if (v2 == 2)
  {
    int64_t v3 = (void *)MEMORY[0x263EFEB28];
    id v4 = [v17 URI];
    uint64_t v5 = [v4 unprefixedURI];
    uint64_t v6 = [v3 phoneNumberWithStringValue:v5];

    uint64_t v7 = [MEMORY[0x263EFE9F8] predicateForContactsMatchingPhoneNumber:v6];
    goto LABEL_7;
  }
}

void __27__HMDAccountHandle_contact__block_invoke_2()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFEA58]);
  v1 = (void *)HMDAccountHandleModelIdentifierNamespaceUUIDString_block_invoke_store;
  HMDAccountHandleModelIdentifierNamespaceUUIDString_block_invoke_store = (uint64_t)v0;
}

- (int64_t)type
{
  int64_t v3 = [(HMDAccountHandle *)self URI];
  id v4 = [v3 unprefixedURI];
  char v5 = [v4 _appearsToBeEmail];

  if (v5) {
    return 1;
  }
  uint64_t v7 = [(HMDAccountHandle *)self URI];
  id v8 = [v7 unprefixedURI];
  int v9 = [v8 _appearsToBePhoneNumber];

  if (v9) {
    return 2;
  }
  else {
    return 0;
  }
}

- (id)attributeDescriptions
{
  v21[4] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  id v4 = [(HMDAccountHandle *)self identifier];
  char v5 = [v4 UUIDString];
  uint64_t v6 = (void *)[v3 initWithName:@"ID" value:v5];
  v21[0] = v6;
  id v7 = objc_alloc(MEMORY[0x263F424F8]);
  int64_t v8 = [(HMDAccountHandle *)self type];
  int v9 = @"Unknown";
  if (v8 == 2) {
    int v9 = @"Phone";
  }
  if (v8 == 1) {
    uint64_t v10 = @"Email";
  }
  else {
    uint64_t v10 = v9;
  }
  uint64_t v11 = (void *)[v7 initWithName:@"TP" value:v10];
  v21[1] = v11;
  id v12 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDAccountHandle *)self isLocal];
  id v13 = HMFBooleanToString();
  uint64_t v14 = (void *)[v12 initWithName:@"LC" value:v13];
  v21[2] = v14;
  id v15 = objc_alloc(MEMORY[0x263F424F8]);
  __int16 v16 = [(HMDAccountHandle *)self value];
  id v17 = +[HMDAccountHandleFormatter defaultFormatter];
  __int16 v18 = (void *)[v15 initWithName:@"VA" value:v16 options:0 formatter:v17];
  v21[3] = v18;
  id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:4];

  return v19;
}

- (id)shortDescription
{
  id v3 = NSString;
  id v4 = [(id)objc_opt_class() shortDescription];
  char v5 = [(HMDAccountHandle *)self identifier];
  uint64_t v6 = [v5 UUIDString];
  id v7 = [v3 stringWithFormat:@"%@ %@", v4, v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMDAccountHandle *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v5 = v4;
    }
    else {
      char v5 = 0;
    }
    uint64_t v6 = v5;
    if (v6)
    {
      id v7 = [(HMDAccountHandle *)self URI];
      int64_t v8 = [(HMDAccountHandle *)v6 URI];
      char v9 = [v7 isEqualToURI:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (unint64_t)hash
{
  uint64_t v2 = [(HMDAccountHandle *)self URI];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)value
{
  uint64_t v2 = [(HMDAccountHandle *)self URI];
  unint64_t v3 = [v2 unprefixedURI];

  return (NSString *)v3;
}

- (BOOL)updateBackingModel:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 modelID];
  id v7 = [(HMDAccountHandle *)self modelIdentifier];
  char v8 = [v6 isEqual:v7];

  if (v8)
  {
    char v9 = [(HMDAccountHandle *)self URI];
    uint64_t v10 = [v5 idsURI];
    char v11 = HMFEqualObjects();

    if ((v11 & 1) == 0) {
      [v5 setIdsURI:v9];
    }

    BOOL v12 = [(HMDAccountHandle *)self isLocal];
    id v13 = [v5 local];
    uint64_t v14 = v13;
    if (!v13 || v12 != [v13 BOOLValue])
    {
      id v15 = [NSNumber numberWithBool:v12];
      [v5 setLocal:v15];
    }
    return 1;
  }
  else
  {
    id v17 = (HMDAccountHandle *)_HMFPreconditionFailure();
    return [(HMDAccountHandle *)v17 backingModelType];
  }
}

- (Protocol)backingModelType
{
  return (Protocol *)&unk_26E569980;
}

- (HMDAccountHandle)initWithBackingModel:(id)a3
{
  id v4 = a3;
  id v5 = [v4 idsURI];

  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v6 = [v4 idsURI];
  id v7 = [v4 local];
  char v8 = -[HMDAccountHandle initWithURI:local:](self, "initWithURI:local:", v6, [v7 BOOLValue]);

  if (!v8)
  {
LABEL_5:
    self = v8;
    id v5 = self;
LABEL_6:

    return v5;
  }
  uint64_t v9 = [v4 modelID];
  modelIdentifier = v8->_modelIdentifier;
  v8->_modelIdentifier = (NSUUID *)v9;

  if (v8->_modelIdentifier)
  {
    char v11 = [v4 account];
    uint64_t v12 = [v11 modelID];
    modelParentIdentifier = v8->_modelParentIdentifier;
    v8->_modelParentIdentifier = (NSUUID *)v12;

    if (v8->_modelParentIdentifier) {
      goto LABEL_5;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  id v15 = (HMDAccountHandle *)_HMFPreconditionFailure();
  return [(HMDAccountHandle *)v15 initWithURI:v17 local:v18];
}

- (HMDAccountHandle)initWithURI:(id)a3 local:(BOOL)a4
{
  id v6 = a3;
  if (v6)
  {
    v20.receiver = self;
    v20.super_class = (Class)HMDAccountHandle;
    id v7 = [(HMDAccountHandle *)&v20 init];
    if (v7)
    {
      uint64_t v8 = __identifierForURI_onceToken;
      id v9 = v6;
      if (v8 != -1) {
        dispatch_once(&__identifierForURI_onceToken, &__block_literal_global_459);
      }
      id v10 = objc_alloc(MEMORY[0x263F08C38]);
      uint64_t v11 = __identifierForURI_namespace;
      uint64_t v12 = [v9 prefixedURI];

      id v13 = [v12 dataUsingEncoding:4];
      uint64_t v14 = [v10 initWithNamespace:v11 data:v13];

      identifier = v7->_identifier;
      v7->_identifier = (NSUUID *)v14;

      uint64_t v16 = [v9 copy];
      URI = v7->_URI;
      v7->_URI = (IDSURI *)v16;

      v7->_local = a4;
    }
    self = v7;
    BOOL v18 = self;
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (HMDAccountHandle)initWithURI:(id)a3
{
  return [(HMDAccountHandle *)self initWithURI:a3 local:0];
}

- (HMDAccountHandle)init
{
  uint64_t v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  id v4 = NSString;
  id v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9_110367 != -1) {
    dispatch_once(&logCategory__hmf_once_t9_110367, &__block_literal_global_334);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v10_110368;
  return v2;
}

void __31__HMDAccountHandle_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v10_110368;
  logCategory__hmf_once_v10_110368 = v0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)accountHandleForDestination:(id)a3
{
  uint64_t v3 = (void *)IDSCopyAddressDestinationForDestination();
  if (v3)
  {
    id v4 = +[HMDAccountHandleFormatter defaultFormatter];
    id v5 = [v4 accountHandleFromString:v3];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

@end