@interface HMBModelReference
+ (BOOL)supportsSecureCoding;
+ (id)hmbDecodeData:(id)a3 fromStorageLocation:(unint64_t)a4 error:(id *)a5;
+ (id)hmbDecodeQueryableParameter:(id)a3;
+ (id)hmbDescriptionForEncodedQueryableVariable:(id)a3;
+ (id)hmbEncodeQueryableParameter:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HMBLocalZone)localZone;
- (HMBModelReference)initWithCoder:(id)a3;
- (HMBModelReference)initWithModelID:(id)a3;
- (NSUUID)hmbModelID;
- (id)attributeDescriptions;
- (id)hmbEncodeForStorageLocation:(unint64_t)a3 error:(id *)a4;
- (id)isValidForContainer:(id)a3 updatedModelIDs:(id)a4;
- (id)referencedModelFromLocalZone:(id)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)associateWithContainer:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setLocalZone:(id)a3;
@end

@implementation HMBModelReference

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_localZone);
  objc_storeStrong((id *)&self->_hmbModelID, 0);
}

- (void)setLocalZone:(id)a3
{
}

- (HMBLocalZone)localZone
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_localZone);
  return (HMBLocalZone *)WeakRetained;
}

- (NSUUID)hmbModelID
{
  return self->_hmbModelID;
}

- (id)hmbEncodeForStorageLocation:(unint64_t)a3 error:(id *)a4
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:a4];
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMBModelReference *)self hmbModelID];
  v5 = (void *)[v3 initWithName:@"Model ID" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMBModelReference *)self hmbModelID];
  [v4 encodeObject:v5 forKey:@"HMB.m"];
}

- (HMBModelReference)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMB.m"];

  v6 = [(HMBModelReference *)self initWithModelID:v5];
  return v6;
}

- (unint64_t)hash
{
  v2 = [(HMBModelReference *)self hmbModelID];
  unint64_t v3 = [v2 hash];

  return v3;
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
  v7 = [(HMBModelReference *)self hmbModelID];
  v8 = [v6 hmbModelID];

  LOBYTE(v6) = [v7 isEqual:v8];
  return (char)v6;
}

- (id)referencedModelFromLocalZone:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6 || ([(HMBModelReference *)self localZone], (id v6 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = [(HMBModelReference *)self hmbModelID];
    v8 = [v6 fetchModelWithModelID:v7 error:a4];
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] hmfErrorWithCode:8];
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)isValidForContainer:(id)a3 updatedModelIDs:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMBModelReference *)self hmbModelID];
  char v9 = [v7 containsObject:v8];

  if (v9)
  {
    v10 = 0;
  }
  else
  {
    v11 = [v6 localZone];
    v12 = [(HMBModelReference *)self hmbModelID];
    id v20 = 0;
    v13 = [v11 fetchRecordRowWithModelID:v12 returning:0 error:&v20];
    id v14 = v20;

    v10 = 0;
    if (!v13)
    {
      v15 = (void *)MEMORY[0x1D944CB30]();
      v16 = self;
      v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v22 = v18;
        __int16 v23 = 2112;
        v24 = v16;
        __int16 v25 = 2112;
        id v26 = v14;
        _os_log_impl(&dword_1D4693000, v17, OS_LOG_TYPE_ERROR, "%{public}@Cannot validate reference %@ because the referenced model can't be found: %@", buf, 0x20u);
      }
      v10 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:2];
    }
  }
  return v10;
}

- (void)associateWithContainer:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    _HMFPreconditionFailure();
  }
  id v5 = v4;
  id v6 = [(HMBModelReference *)self localZone];

  if (!v6)
  {
    id v7 = [v5 localZone];
    if (v7)
    {
      [(HMBModelReference *)self setLocalZone:v7];
    }
    else
    {
      v8 = (void *)MEMORY[0x1D944CB30]();
      char v9 = self;
      v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = HMFGetLogIdentifier();
        int v12 = 138543618;
        v13 = v11;
        __int16 v14 = 2112;
        v15 = v5;
        _os_log_impl(&dword_1D4693000, v10, OS_LOG_TYPE_ERROR, "%{public}@Local zone for associated container is nil: %@", (uint8_t *)&v12, 0x16u);
      }
    }
  }
}

- (HMBModelReference)initWithModelID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMBModelReference;
  id v6 = [(HMBModelReference *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_hmbModelID, a3);
  }

  return v7;
}

+ (id)hmbDecodeData:(id)a3 fromStorageLocation:(unint64_t)a4 error:(id *)a5
{
  return (id)[MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:a1 fromData:a3 error:a5];
}

+ (id)hmbDescriptionForEncodedQueryableVariable:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F29128] hmbUUIDFromData:v3];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 UUIDString];
  }
  else
  {
    id v7 = NSString;
    v8 = [v3 hmbDescription];
    id v6 = [v7 stringWithFormat:@"<MALFORMED UUID: %@>", v8];
  }
  return v6;
}

+ (id)hmbDecodeQueryableParameter:(id)a3
{
  return (id)[MEMORY[0x1E4F29128] hmbUUIDFromData:a3];
}

+ (id)hmbEncodeQueryableParameter:(id)a3
{
  id v3 = [a3 hmbModelID];
  id v4 = [v3 data];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end