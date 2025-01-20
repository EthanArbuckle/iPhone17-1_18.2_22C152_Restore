@interface HMBModelCloudReference
+ (BOOL)includeInModelEncoding;
+ (BOOL)supportsSecureCoding;
+ (id)hmbDecodeData:(id)a3 fromStorageLocation:(unint64_t)a4 error:(id *)a5;
+ (void)applyNativeCKValue:(id)a3 fromSource:(unint64_t)a4 associatingWith:(id)a5 toModel:(id)a6 propertyNamed:(id)a7;
- (BOOL)isEqual:(id)a3;
- (CKReference)reference;
- (HMBCloudZone)cloudZone;
- (HMBModelCloudReference)initWithCoder:(id)a3;
- (HMBModelCloudReference)initWithModelID:(id)a3 action:(unint64_t)a4;
- (id)attributeDescriptions;
- (id)hmbEncodeForStorageLocation:(unint64_t)a3 error:(id *)a4;
- (id)nativeCKValueWithEncodingContext:(id)a3 error:(id *)a4;
- (id)referencedModelFromCloudZone:(id)a3 allowExternalFetch:(BOOL)a4;
- (unint64_t)action;
- (unint64_t)hash;
- (void)associateWithContainer:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAction:(unint64_t)a3;
- (void)setCloudZone:(id)a3;
- (void)setReference:(id)a3;
@end

@implementation HMBModelCloudReference

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cloudZone);
  objc_storeStrong((id *)&self->_reference, 0);
}

- (void)setCloudZone:(id)a3
{
}

- (HMBCloudZone)cloudZone
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudZone);
  return (HMBCloudZone *)WeakRetained;
}

- (void)setReference:(id)a3
{
}

- (CKReference)reference
{
  return self->_reference;
}

- (void)setAction:(unint64_t)a3
{
  self->_action = a3;
}

- (id)hmbEncodeForStorageLocation:(unint64_t)a3 error:(id *)a4
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:a4];
}

- (id)nativeCKValueWithEncodingContext:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_26;
  }
  id v7 = v6;
  objc_opt_class();
  int v8 = objc_opt_isKindOfClass() & 1;
  if (v8) {
    v9 = v7;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  if (!v8) {
LABEL_26:
  }
    _HMFPreconditionFailure();
  v11 = [v7 createdRecords];
  v12 = [(HMBModelReference *)self hmbModelID];
  v13 = [v11 objectForKey:v12];

  if (v13)
  {
LABEL_7:
    v14 = (CKReference *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1A348]), "initWithRecordID:action:", v13, -[HMBModelCloudReference action](self, "action"));
    reference = self->_reference;
    self->_reference = v14;

    v16 = [(HMBModelCloudReference *)self reference];
    goto LABEL_15;
  }
  v17 = [(HMBModelReference *)self localZone];
  v18 = [(HMBModelReference *)self hmbModelID];
  id v34 = 0;
  v19 = [v17 externalIDForModelID:v18 error:&v34];
  id v20 = v34;

  if (!v19)
  {
    if (!v20)
    {
      id v20 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    }
    v27 = (void *)MEMORY[0x1D944CB30]();
    v28 = self;
    v29 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v30 = HMFGetLogIdentifier();
      v31 = [(HMBModelReference *)v28 hmbModelID];
      v32 = [v31 UUIDString];
      *(_DWORD *)buf = 138543874;
      v36 = v30;
      __int16 v37 = 2112;
      v38 = v32;
      __int16 v39 = 2112;
      id v40 = v20;
      _os_log_impl(&dword_1D4693000, v29, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine CKRecordID for model ID %@: %@", buf, 0x20u);
    }
    v13 = 0;
    if (!a4) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  id v33 = v20;
  v13 = [MEMORY[0x1E4F1A2F8] recordIDFromExternalID:v19 error:&v33];
  id v21 = v33;

  if (!v21)
  {

    goto LABEL_7;
  }
  id v20 = v21;
  v22 = (void *)MEMORY[0x1D944CB30]();
  v23 = self;
  v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    v25 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    v36 = v25;
    __int16 v37 = 2112;
    v38 = v19;
    __int16 v39 = 2112;
    id v40 = v20;
    _os_log_impl(&dword_1D4693000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode CKRecordID from external ID %@: %@", buf, 0x20u);
  }
  if (a4)
  {
LABEL_13:
    id v20 = v20;
    *a4 = v20;
  }
LABEL_14:

  v16 = 0;
LABEL_15:

  return v16;
}

- (id)attributeDescriptions
{
  v13.receiver = self;
  v13.super_class = (Class)HMBModelCloudReference;
  v3 = [(HMBModelReference *)&v13 attributeDescriptions];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(HMBModelCloudReference *)self reference];
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  if (v5)
  {
    id v7 = [(HMBModelCloudReference *)self reference];
    int v8 = @"Reference";
  }
  else
  {
    unint64_t v9 = [(HMBModelCloudReference *)self action];
    if (*MEMORY[0x1E4F19D98] == v9)
    {
      id v7 = @"validate";
    }
    else if (v9)
    {
      if (v9 == 1)
      {
        id v7 = @"delete";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"<unknown %lu>", v9);
        id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      id v7 = @"none";
    }
    int v8 = @"Action";
  }
  id v10 = (void *)[v6 initWithName:v8 value:v7];
  [v4 addObject:v10];

  v11 = (void *)[v4 copy];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HMBModelCloudReference;
  id v4 = a3;
  [(HMBModelReference *)&v7 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMBModelCloudReference action](self, "action", v7.receiver, v7.super_class), @"HMB.a");
  v5 = [(HMBModelCloudReference *)self reference];
  id v6 = [v5 recordID];
  [v4 encodeObject:v6 forKey:@"HMB.r"];
}

- (HMBModelCloudReference)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMB.r"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"HMB.a"];
  v10.receiver = self;
  v10.super_class = (Class)HMBModelCloudReference;
  objc_super v7 = [(HMBModelReference *)&v10 initWithCoder:v4];

  if (v7)
  {
    [(HMBModelCloudReference *)v7 setAction:v6];
    if (v5)
    {
      int v8 = (void *)[objc_alloc(MEMORY[0x1E4F1A348]) initWithRecordID:v5 action:v6];
      [(HMBModelCloudReference *)v7 setReference:v8];
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)HMBModelCloudReference;
  unint64_t v3 = [(HMBModelReference *)&v5 hash];
  return [(HMBModelCloudReference *)self action] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_super v5 = v4;
  }
  else {
    objc_super v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    objc_super v7 = [(HMBModelCloudReference *)self reference];

    if (v7 && ([v6 reference], int v8 = objc_claimAutoreleasedReturnValue(), v8, v8))
    {
      unint64_t v9 = [v6 reference];
      objc_super v10 = [(HMBModelCloudReference *)self reference];
      char v11 = [v9 isEqual:v10];
    }
    else
    {
      unint64_t v9 = [(HMBModelReference *)self hmbModelID];
      objc_super v10 = [v6 hmbModelID];
      if ([v9 isEqual:v10])
      {
        unint64_t v12 = [(HMBModelCloudReference *)self action];
        char v11 = v12 == [v6 action];
      }
      else
      {
        char v11 = 0;
      }
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)referencedModelFromCloudZone:(id)a3 allowExternalFetch:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    id v6 = [(HMBModelCloudReference *)self cloudZone];
  }
  objc_super v7 = [v6 localZone];
  if (v7)
  {
    int v8 = (void *)MEMORY[0x1D944CB30]();
    unint64_t v9 = self;
    objc_super v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      char v11 = HMFGetLogIdentifier();
      unint64_t v12 = [(HMBModelReference *)v9 hmbModelID];
      *(_DWORD *)buf = 138543874;
      id v40 = v11;
      __int16 v41 = 2112;
      v42 = v12;
      __int16 v43 = 2112;
      v44 = v7;
      _os_log_impl(&dword_1D4693000, v10, OS_LOG_TYPE_INFO, "%{public}@Looking for referenced model %@ in localZone %@", buf, 0x20u);
    }
    id v38 = 0;
    objc_super v13 = [(HMBModelReference *)v9 referencedModelFromLocalZone:v7 error:&v38];
    id v14 = v38;
    v15 = v14;
    if (v13)
    {
      v16 = [MEMORY[0x1E4F7A0D8] futureWithResult:v13];
LABEL_12:

      goto LABEL_21;
    }
    if (v14)
    {
      v17 = (void *)MEMORY[0x1D944CB30]();
      v18 = v9;
      v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v20 = HMFGetLogIdentifier();
        id v21 = [(HMBModelReference *)v18 hmbModelID];
        *(_DWORD *)buf = 138543618;
        id v40 = v20;
        __int16 v41 = 2112;
        v42 = v21;
        _os_log_impl(&dword_1D4693000, v19, OS_LOG_TYPE_ERROR, "%{public}@Error fetching model %@", buf, 0x16u);
      }
      v22 = (void *)MEMORY[0x1E4F7A0D8];
      v23 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
      v16 = [v22 futureWithError:v23];

      goto LABEL_12;
    }
  }
  v24 = [(HMBModelCloudReference *)self reference];
  v25 = [v24 recordID];

  v26 = (void *)MEMORY[0x1D944CB30]();
  v27 = self;
  v28 = HMFGetOSLogHandle();
  v29 = v28;
  if (v25 && v4)
  {
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v30 = HMFGetLogIdentifier();
      v31 = [(HMBModelReference *)v27 hmbModelID];
      v32 = [(HMBModelCloudReference *)v27 reference];
      *(_DWORD *)buf = 138543874;
      id v40 = v30;
      __int16 v41 = 2112;
      v42 = v31;
      __int16 v43 = 2112;
      v44 = v32;
      _os_log_impl(&dword_1D4693000, v29, OS_LOG_TYPE_INFO, "%{public}@No local model for %@, fetching via CKReference %@", buf, 0x20u);
    }
    v15 = [(HMBModelCloudReference *)v27 reference];
    id v33 = [v15 recordID];
    v16 = [v6 fetchCompleteModelForRecordID:v33];
  }
  else
  {
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      id v34 = HMFGetLogIdentifier();
      v35 = [(HMBModelReference *)v27 hmbModelID];
      *(_DWORD *)buf = 138543618;
      id v40 = v34;
      __int16 v41 = 2112;
      v42 = v35;
      _os_log_impl(&dword_1D4693000, v29, OS_LOG_TYPE_ERROR, "%{public}@Unable to find referenced model %@, no local model and no CKReference to fetch", buf, 0x16u);
    }
    v36 = (void *)MEMORY[0x1E4F7A0D8];
    v15 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    v16 = [v36 futureWithError:v15];
  }
LABEL_21:

  return v16;
}

- (void)associateWithContainer:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_super v5 = v4;
    v12.receiver = self;
    v12.super_class = (Class)HMBModelCloudReference;
    [(HMBModelReference *)&v12 associateWithContainer:v4];
    id v6 = [v5 mirror];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_super v7 = v6;
    }
    else {
      objc_super v7 = 0;
    }
    id v8 = v7;
    id v9 = [(HMBModelCloudReference *)self cloudZone];
    if (!v9) {
      id v9 = v8;
    }
  }
  else
  {
    objc_super v10 = (HMBModelCloudReference *)_HMFPreconditionFailure();
    [(HMBModelCloudReference *)v10 action];
  }
}

- (unint64_t)action
{
  unint64_t v3 = [(HMBModelCloudReference *)self reference];

  if (!v3) {
    return self->_action;
  }
  id v4 = [(HMBModelCloudReference *)self reference];
  unint64_t v5 = [v4 referenceAction];

  return v5;
}

- (HMBModelCloudReference)initWithModelID:(id)a3 action:(unint64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)HMBModelCloudReference;
  result = [(HMBModelReference *)&v6 initWithModelID:a3];
  if (result) {
    result->_action = a4;
  }
  return result;
}

+ (id)hmbDecodeData:(id)a3 fromStorageLocation:(unint64_t)a4 error:(id *)a5
{
  return (id)[MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:a1 fromData:a3 error:a5];
}

+ (void)applyNativeCKValue:(id)a3 fromSource:(unint64_t)a4 associatingWith:(id)a5 toModel:(id)a6 propertyNamed:(id)a7
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = v11;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  id v17 = v16;

  if (v17)
  {
    id v18 = [v13 hmbPropertyNamed:v14];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v19 = v18;
    }
    else {
      v19 = 0;
    }
    id v20 = v19;

    id v54 = a1;
    if (v20)
    {
      v49 = v18;
      id v51 = v14;
      id v52 = v12;
      v53 = v13;
      [v20 associateWithContainer:v12];
      v50 = v17;
      id v21 = [v17 recordID];
      v22 = [v21 zoneID];
      v23 = [v22 zoneName];
      v24 = [v20 reference];
      v25 = [v24 recordID];
      v26 = [v25 zoneID];
      v27 = [v26 zoneName];
      char v28 = [v23 isEqualToString:v27];

      if (v28)
      {
        id v13 = v53;
        id v14 = v51;
        [v53 hmbSetProperty:v20 named:v51];

        id v12 = v52;
        id v17 = v50;
        goto LABEL_22;
      }
      v36 = (void *)MEMORY[0x1D944CB30]();
      id v41 = v54;
      id v38 = HMFGetOSLogHandle();
      id v13 = v53;
      id v14 = v51;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v42 = HMFGetLogIdentifier();
        __int16 v43 = [v53 hmbDescription];
        id v17 = v50;
        [v50 hmbDescription];
        v44 = v48 = v36;
        uint64_t v45 = [v20 reference];
        v46 = [v45 hmbDescription];
        *(_DWORD *)buf = 138544386;
        v56 = v42;
        __int16 v57 = 2112;
        id v58 = v43;
        __int16 v59 = 2112;
        id v60 = v51;
        __int16 v61 = 2112;
        id v62 = v44;
        __int16 v63 = 2112;
        v64 = v46;
        _os_log_impl(&dword_1D4693000, v38, OS_LOG_TYPE_ERROR, "%{public}@Received CKRecord with a HMBModelCloudReference field (%@/%@) where zone name for reference stored in the CKRecord field does not match the zone name in the HMBModel field (%@!=%@)", buf, 0x34u);

        id v13 = v53;
        v36 = v48;

        id v12 = v52;
      }
      else
      {
        id v12 = v52;
        id v17 = v50;
      }
      id v18 = v49;
    }
    else
    {
      v36 = (void *)MEMORY[0x1D944CB30]();
      id v37 = a1;
      id v38 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        __int16 v39 = HMFGetLogIdentifier();
        [v13 hmbDescription];
        id v40 = v47 = v36;
        *(_DWORD *)buf = 138544130;
        v56 = v39;
        __int16 v57 = 2112;
        id v58 = v40;
        __int16 v59 = 2112;
        id v60 = v14;
        __int16 v61 = 2112;
        id v62 = v15;
        _os_log_impl(&dword_1D4693000, v38, OS_LOG_TYPE_ERROR, "%{public}@Received CKRecord with a HMBModelCloudReference field (%@/%@) where the corresponding CKRecord field is not set or not of the expected type (got %@)", buf, 0x2Au);

        v36 = v47;
      }
    }

    goto LABEL_22;
  }
  if (v15)
  {
    id v29 = v14;
    v30 = (void *)MEMORY[0x1D944CB30]();
    id v31 = a1;
    v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      id v33 = HMFGetLogIdentifier();
      [v13 hmbDescription];
      v35 = id v34 = v13;
      *(_DWORD *)buf = 138544130;
      v56 = v33;
      __int16 v57 = 2112;
      id v58 = v15;
      __int16 v59 = 2112;
      id v60 = v35;
      __int16 v61 = 2112;
      id v62 = v29;
      _os_log_impl(&dword_1D4693000, v32, OS_LOG_TYPE_ERROR, "%{public}@Unexpectedly found %@ in CKRecord field for wrapped model value %@/%@ which we expected to be a CKReference (ignoring).", buf, 0x2Au);

      id v13 = v34;
      id v17 = 0;
    }
    id v14 = v29;
  }
LABEL_22:
}

+ (BOOL)includeInModelEncoding
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end