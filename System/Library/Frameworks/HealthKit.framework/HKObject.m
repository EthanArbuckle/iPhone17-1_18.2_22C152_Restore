@interface HKObject
+ (BOOL)_isConcreteObjectClass;
+ (BOOL)supportsSecureCoding;
+ (id)_newDataObjectWithMetadata:(id)a3 device:(id)a4 config:(id)a5;
- (BOOL)_shouldNotifyOnInsert;
- (BOOL)_validateForSavingWithClientEntitlements:(id)a3 applicationSDKVersionToken:(unint64_t)a4 isAppleWatch:(BOOL)a5 error:(id *)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)prepareForDelivery:(id *)a3;
- (BOOL)prepareForSaving:(id *)a3;
- (HDDataOriginProvenance)healthd_use_only_dataOriginProvenance;
- (HKContributor)contributor;
- (HKDevice)device;
- (HKObject)init;
- (HKObject)initWithCoder:(id)a3;
- (HKSourceRevision)sourceRevision;
- (NSDate)_creationDate;
- (NSDictionary)metadata;
- (NSString)_sourceBundleIdentifier;
- (NSString)_timeZoneName;
- (NSString)attachmentObjectIdentifier;
- (NSString)attachmentSchemaIdentifier;
- (NSString)description;
- (NSUUID)UUID;
- (double)_creationTimestamp;
- (id)_copyByArchiving;
- (id)_init;
- (id)_source;
- (id)_validateConfiguration;
- (id)_validateConfigurationAllowingPrivateMetadata:(BOOL)a3 applicationSDKVersionToken:(unint64_t)a4;
- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3;
- (id)_valueDescription;
- (id)asJSONObject;
- (int64_t)_externalSyncObjectCode;
- (int64_t)hk_integerValue;
- (unint64_t)hash;
- (void)_setContributor:(id)a3;
- (void)_setCreationDate:(id)a3;
- (void)_setCreationTimestamp:(double)a3;
- (void)_setDevice:(id)a3;
- (void)_setMetadata:(id)a3;
- (void)_setSourceBundleIdentifier:(id)a3;
- (void)_setSourceRevision:(id)a3;
- (void)_setUUID:(id)a3;
- (void)_validateForCreation;
- (void)encodeWithCoder:(id)a3;
- (void)setHealthd_use_only_dataOriginProvenance:(id)a3;
@end

@implementation HKObject

- (void)encodeWithCoder:(id)a3
{
  UUID = self->_UUID;
  id v5 = a3;
  [v5 encodeObject:UUID forKey:@"UUID"];
  [v5 encodeObject:self->_metadata forKey:@"Metadata"];
  [v5 encodeObject:self->_sourceBundleIdentifier forKey:@"SourceBundleID"];
  [v5 encodeObject:self->_sourceRevision forKey:@"SourceRevision"];
  [v5 encodeObject:self->_device forKey:@"Device"];
  [v5 encodeDouble:@"CTS" forKey:self->_creationTimestamp];
  [v5 encodeObject:self->_contributor forKey:@"Contributor"];
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

+ (id)_newDataObjectWithMetadata:(id)a3 device:(id)a4 config:(id)a5
{
  id v9 = a4;
  v10 = (void (**)(id, void *))a5;
  id v11 = a3;
  if (([a1 _isConcreteObjectClass] & 1) == 0)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    v21 = NSStringFromSelector(a2);
    v22 = NSStringFromClass((Class)a1);
    [v20 handleFailureInMethod:a2, a1, @"HKObject.m", 103, @"%@ should not be used for abstract class %@", v21, v22 object file lineNumber description];
  }
  v12 = (void *)[objc_alloc((Class)a1) _init];
  uint64_t v13 = [MEMORY[0x1E4F29128] UUID];
  v14 = (void *)v12[1];
  v12[1] = v13;

  v15 = (void *)v12[3];
  v12[3] = v9;
  id v16 = v9;

  uint64_t v17 = [v11 copy];
  v18 = (void *)v12[4];
  v12[4] = v17;

  if (v10) {
    v10[2](v10, v12);
  }
  [v12 _validateForCreation];

  return v12;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)HKObject;
  id result = [(HKObject *)&v3 init];
  if (result) {
    *((void *)result + 7) = 0x10000000000000;
  }
  return result;
}

- (void)_validateForCreation
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  objc_super v3 = a1;
  v4 = [a2 localizedDescription];
  int v5 = 138412290;
  v6 = v4;
  _os_log_fault_impl(&dword_19C023000, v3, OS_LOG_TYPE_FAULT, "_validateForCreation encountered an error: %@", (uint8_t *)&v5, 0xCu);
}

- (id)_validateConfiguration
{
  uint64_t v3 = HKApplicationSDKVersionToken();

  return -[HKObject _validateWithConfiguration:](self, "_validateWithConfiguration:", 0, v3);
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)_setUUID:(id)a3
{
}

- (HKSourceRevision)sourceRevision
{
  return (HKSourceRevision *)objc_getProperty(self, a2, 16, 1);
}

- (void)_setCreationTimestamp:(double)a3
{
  self->_creationTimestamp = a3;
}

- (void)_setSourceBundleIdentifier:(id)a3
{
}

- (void)_setSourceRevision:(id)a3
{
}

- (NSString)_sourceBundleIdentifier
{
  return self->_sourceBundleIdentifier;
}

- (double)_creationTimestamp
{
  return self->_creationTimestamp;
}

- (BOOL)_shouldNotifyOnInsert
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contributor, 0);
  objc_storeStrong((id *)&self->_sourceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_healthd_use_only_dataOriginProvenance, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_sourceRevision, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

- (void)_setMetadata:(id)a3
{
  self->_metadata = (NSDictionary *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)_setDevice:(id)a3
{
}

- (NSString)description
{
  uint64_t v3 = [(HKObject *)self _valueDescription];
  v4 = (void *)v3;
  int v5 = &stru_1EEC60288;
  if (v3) {
    int v5 = (__CFString *)v3;
  }
  v6 = v5;

  uint64_t v7 = (void *)MEMORY[0x1E4F28E78];
  v8 = [(HKObject *)self UUID];
  id v9 = [v7 stringWithFormat:@"%@ %@ ", v8, v6];

  v10 = [(HKObject *)self sourceRevision];
  if (v10)
  {
    id v11 = [(NSUUID *)self->_UUID UUIDString];
    v12 = [v10 version];
    uint64_t v13 = [v10 productType];
    [v10 operatingSystemVersion];
    v14 = HKNSOperatingSystemVersionString(v24);
    [v9 appendFormat:@"%@, (%@), \"%@\" (%@)", v11, v12, v13, v14];
  }
  v15 = [(HKObject *)self device];
  id v16 = v15;
  if (v15)
  {
    uint64_t v17 = [v15 name];
    [v9 appendFormat:@" \"%@\" ", v17];
  }
  v18 = [(HKObject *)self metadata];
  v19 = v18;
  if (v18 && [v18 count]) {
    [v9 appendFormat:@"metadata: %@", v19];
  }
  v20 = [(HKObject *)self contributor];
  v21 = v20;
  if (v20)
  {
    v22 = [v20 appleID];
    [v9 appendFormat:@", contributor %@", v22];
  }

  return (NSString *)v9;
}

- (HKDevice)device
{
  return (HKDevice *)objc_getProperty(self, a2, 24, 1);
}

- (NSDate)_creationDate
{
  return (NSDate *)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_creationTimestamp];
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_UUID hash];
}

- (id)_source
{
  return [(HKSourceRevision *)self->_sourceRevision source];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    UUID = self->_UUID;
    v6 = [v4 UUID];
    char v7 = [(NSUUID *)UUID isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (HKObject)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = [(HKObject *)self _init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

    v8 = objc_msgSend(MEMORY[0x1E4F1C9E8], "hk_secureCodingClasses");
    id v9 = [v4 decodeObjectOfClasses:v8 forKey:@"Metadata"];
    uint64_t v10 = objc_msgSend(v9, "hk_replaceKeysFromSharedStringCache");
    metadata = v5->_metadata;
    v5->_metadata = (NSDictionary *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SourceBundleID"];
    sourceBundleIdentifier = v5->_sourceBundleIdentifier;
    v5->_sourceBundleIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SourceRevision"];
    sourceRevision = v5->_sourceRevision;
    v5->_sourceRevision = (HKSourceRevision *)v14;

    if (!v5->_sourceRevision)
    {
      id v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Source"];
      if (v16)
      {
        uint64_t v17 = [[HKSourceRevision alloc] _initWithSource:v16];
        v18 = v5->_sourceRevision;
        v5->_sourceRevision = v17;
      }
    }
    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Device"];
    device = v5->_device;
    v5->_device = (HKDevice *)v19;

    if ([v4 containsValueForKey:@"CTS"])
    {
      [v4 decodeDoubleForKey:@"CTS"];
      v5->_creationTimestamp = v21;
    }
    else
    {
      v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CreationDate"];
      [v22 timeIntervalSinceReferenceDate];
      v5->_creationTimestamp = v23;
    }
    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Contributor"];
    contributor = v5->_contributor;
    v5->_contributor = (HKContributor *)v24;
  }
  return v5;
}

- (HKObject)init
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  int v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (id)_copyByArchiving
{
  v2 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  uint64_t v3 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:0];

  return v3;
}

+ (BOOL)_isConcreteObjectClass
{
  return 0;
}

- (NSString)attachmentObjectIdentifier
{
  return [(NSUUID *)self->_UUID UUIDString];
}

- (NSString)attachmentSchemaIdentifier
{
  return (NSString *)@"HKObject";
}

- (BOOL)_validateForSavingWithClientEntitlements:(id)a3 applicationSDKVersionToken:(unint64_t)a4 isAppleWatch:(BOOL)a5 error:(id *)a6
{
  -[HKObject _validateConfigurationAllowingPrivateMetadata:applicationSDKVersionToken:](self, "_validateConfigurationAllowingPrivateMetadata:applicationSDKVersionToken:", [a3 hasPrivateMetadataAccess], a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (a6) {
      *a6 = v7;
    }
    else {
      _HKLogDroppedError(v7);
    }
  }

  return v8 == 0;
}

- (BOOL)prepareForSaving:(id *)a3
{
  return 1;
}

- (BOOL)prepareForDelivery:(id *)a3
{
  return 1;
}

- (id)_validateWithConfiguration:(HKObjectValidationConfiguration)a3
{
  if (self->_UUID)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a2, @"%@: UUID must not be nil"", self);
  }

  return v3;
}

- (id)_validateConfigurationAllowingPrivateMetadata:(BOOL)a3 applicationSDKVersionToken:(unint64_t)a4
{
  BOOL v5 = a3;
  if (a3) {
    uint64_t v7 = 8;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = [(HKObject *)self _validateWithConfiguration:v7];
  if (!v8)
  {
    metadata = self->_metadata;
    id v11 = 0;
    [(NSDictionary *)metadata hk_validateMetadataKeysAndValuesAllowingPrivateMetadataKeys:v5 applicationSDKVersionToken:a4 error:&v11];
    id v8 = v11;
  }

  return v8;
}

- (id)_valueDescription
{
  return 0;
}

- (int64_t)_externalSyncObjectCode
{
  return -1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)_setContributor:(id)a3
{
}

- (void)_setCreationDate:(id)a3
{
  [a3 timeIntervalSinceReferenceDate];
  self->_creationTimestamp = v4;
}

- (NSString)_timeZoneName
{
  uint64_t v3 = [(NSDictionary *)self->_metadata objectForKeyedSubscript:@"HKTimeZone"];
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(NSDictionary *)self->_metadata objectForKeyedSubscript:@"_HKPrivateAutomaticTimeZone"];
  }
  uint64_t v6 = v5;

  return (NSString *)v6;
}

- (HDDataOriginProvenance)healthd_use_only_dataOriginProvenance
{
  return self->_healthd_use_only_dataOriginProvenance;
}

- (void)setHealthd_use_only_dataOriginProvenance:(id)a3
{
}

- (HKContributor)contributor
{
  return self->_contributor;
}

- (int64_t)hk_integerValue
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v3 = (void *)HKLogDefault;
  if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    double v4 = v3;
    id v5 = NSStringFromSelector(a2);
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_19C023000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ is being performed on an HKObject that it is not compatible with. This is probably a mistake.", (uint8_t *)&v7, 0xCu);
  }
  return 0;
}

- (id)asJSONObject
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:20];
  double v4 = [(id)objc_opt_class() description];
  [v3 setObject:v4 forKeyedSubscript:@"class"];

  id v5 = [(HKObject *)self UUID];
  uint64_t v6 = [v5 UUIDString];
  [v3 setObject:v6 forKeyedSubscript:@"UUID"];

  int v7 = [(HKObject *)self sourceRevision];
  id v8 = [v7 asJSONObject];
  [v3 setObject:v8 forKeyedSubscript:@"sourceRevision"];

  uint64_t v9 = [(HKObject *)self metadata];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    id v11 = [(HKObject *)self metadata];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __33__HKObject_HK_JSON__asJSONObject__block_invoke;
    v14[3] = &unk_1E58C0D48;
    id v15 = v10;
    id v12 = v10;
    [v11 enumerateKeysAndObjectsUsingBlock:v14];

    [v3 setObject:v12 forKeyedSubscript:@"metadata"];
  }

  return v3;
}

void __33__HKObject_HK_JSON__asJSONObject__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [v5 asJSONObject];
  id v9 = (id)v7;
  if (v7) {
    id v8 = (id)v7;
  }
  else {
    id v8 = v5;
  }
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v6];
}

@end