@interface HKCloudSyncRequest
+ (BOOL)supportsSecureCoding;
+ (id)emptySyncRequest;
- (BOOL)allowCellular;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalent:(id)a3;
- (BOOL)matchesFilter:(unint64_t)a3;
- (HKChangesSyncRequest)changesSyncRequest;
- (HKCloudSyncRequest)init;
- (HKCloudSyncRequest)initWithChangesSyncRequest:(id)a3;
- (HKCloudSyncRequest)initWithChangesSyncRequest:(id)a3 contextSyncRequest:(id)a4 stateSyncRequest:(id)a5 medicalIDSyncRequest:(id)a6 summarySharingSyncRequest:(id)a7;
- (HKCloudSyncRequest)initWithChangesSyncRequest:(id)a3 contextSyncRequest:(id)a4 stateSyncRequest:(id)a5 medicalIDSyncRequest:(id)a6 summarySharingSyncRequest:(id)a7 allowCellular:(BOOL)a8 qualityOfService:(int64_t)a9;
- (HKCloudSyncRequest)initWithCoder:(id)a3;
- (HKCloudSyncRequest)initWithContextSyncRequest:(id)a3;
- (HKCloudSyncRequest)initWithIdentifier:(id)a3 changesSyncRequest:(id)a4 contextSyncRequest:(id)a5 stateSyncRequest:(id)a6 medicalIDSyncRequest:(id)a7 summarySharingSyncRequest:(id)a8 allowCellular:(BOOL)a9 qualityOfService:(int64_t)a10;
- (HKCloudSyncRequest)initWithMedicalIDSyncRequest:(id)a3;
- (HKCloudSyncRequest)initWithStateSyncRequest:(id)a3;
- (HKCloudSyncRequest)initWithSummarySharingSyncRequest:(id)a3;
- (HKContextSyncRequest)contextSyncRequest;
- (HKMedicalIDSyncRequest)medicalIDSyncRequest;
- (HKStateSyncRequest)stateSyncRequest;
- (HKSummarySharingSyncRequest)summarySharingSyncRequest;
- (NSUUID)identifier;
- (id)description;
- (id)requestByMergingRequest:(id)a3;
- (int64_t)qualityOfService;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKCloudSyncRequest

- (HKCloudSyncRequest)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKCloudSyncRequest)initWithIdentifier:(id)a3 changesSyncRequest:(id)a4 contextSyncRequest:(id)a5 stateSyncRequest:(id)a6 medicalIDSyncRequest:(id)a7 summarySharingSyncRequest:(id)a8 allowCellular:(BOOL)a9 qualityOfService:(int64_t)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  v36.receiver = self;
  v36.super_class = (Class)HKCloudSyncRequest;
  v22 = [(HKCloudSyncRequest *)&v36 init];
  if (v22)
  {
    uint64_t v23 = [v16 copy];
    identifier = v22->_identifier;
    v22->_identifier = (NSUUID *)v23;

    uint64_t v25 = [v17 copy];
    changesSyncRequest = v22->_changesSyncRequest;
    v22->_changesSyncRequest = (HKChangesSyncRequest *)v25;

    uint64_t v27 = [v18 copy];
    contextSyncRequest = v22->_contextSyncRequest;
    v22->_contextSyncRequest = (HKContextSyncRequest *)v27;

    uint64_t v29 = [v19 copy];
    stateSyncRequest = v22->_stateSyncRequest;
    v22->_stateSyncRequest = (HKStateSyncRequest *)v29;

    uint64_t v31 = [v20 copy];
    medicalIDSyncRequest = v22->_medicalIDSyncRequest;
    v22->_medicalIDSyncRequest = (HKMedicalIDSyncRequest *)v31;

    uint64_t v33 = [v21 copy];
    summarySharingSyncRequest = v22->_summarySharingSyncRequest;
    v22->_summarySharingSyncRequest = (HKSummarySharingSyncRequest *)v33;

    v22->_allowCellular = a9;
    v22->_qualityOfService = a10;
  }

  return v22;
}

- (HKCloudSyncRequest)initWithChangesSyncRequest:(id)a3 contextSyncRequest:(id)a4 stateSyncRequest:(id)a5 medicalIDSyncRequest:(id)a6 summarySharingSyncRequest:(id)a7 allowCellular:(BOOL)a8 qualityOfService:(int64_t)a9
{
  v15 = (void *)MEMORY[0x1E4F29128];
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  id v21 = [v15 UUID];
  LOBYTE(v24) = a8;
  v22 = [(HKCloudSyncRequest *)self initWithIdentifier:v21 changesSyncRequest:v20 contextSyncRequest:v19 stateSyncRequest:v18 medicalIDSyncRequest:v17 summarySharingSyncRequest:v16 allowCellular:v24 qualityOfService:a9];

  return v22;
}

- (HKCloudSyncRequest)initWithChangesSyncRequest:(id)a3 contextSyncRequest:(id)a4 stateSyncRequest:(id)a5 medicalIDSyncRequest:(id)a6 summarySharingSyncRequest:(id)a7
{
  return [(HKCloudSyncRequest *)self initWithChangesSyncRequest:a3 contextSyncRequest:a4 stateSyncRequest:a5 medicalIDSyncRequest:a6 summarySharingSyncRequest:a7 allowCellular:0 qualityOfService:-1];
}

- (HKCloudSyncRequest)initWithChangesSyncRequest:(id)a3
{
  return [(HKCloudSyncRequest *)self initWithChangesSyncRequest:a3 contextSyncRequest:0 stateSyncRequest:0 medicalIDSyncRequest:0 summarySharingSyncRequest:0];
}

- (HKCloudSyncRequest)initWithContextSyncRequest:(id)a3
{
  return [(HKCloudSyncRequest *)self initWithChangesSyncRequest:0 contextSyncRequest:a3 stateSyncRequest:0 medicalIDSyncRequest:0 summarySharingSyncRequest:0];
}

- (HKCloudSyncRequest)initWithStateSyncRequest:(id)a3
{
  return [(HKCloudSyncRequest *)self initWithChangesSyncRequest:0 contextSyncRequest:0 stateSyncRequest:a3 medicalIDSyncRequest:0 summarySharingSyncRequest:0];
}

- (HKCloudSyncRequest)initWithMedicalIDSyncRequest:(id)a3
{
  return [(HKCloudSyncRequest *)self initWithChangesSyncRequest:0 contextSyncRequest:0 stateSyncRequest:0 medicalIDSyncRequest:a3 summarySharingSyncRequest:0];
}

- (HKCloudSyncRequest)initWithSummarySharingSyncRequest:(id)a3
{
  return [(HKCloudSyncRequest *)self initWithChangesSyncRequest:0 contextSyncRequest:0 stateSyncRequest:0 medicalIDSyncRequest:0 summarySharingSyncRequest:a3];
}

- (id)requestByMergingRequest:(id)a3
{
  id v4 = a3;
  v5 = [v4 changesSyncRequest];
  if (v5)
  {
    v6 = [v4 changesSyncRequest];
    v7 = [(HKCloudSyncRequest *)self changesSyncRequest];
    v8 = [v6 requestByMergingRequest:v7];
  }
  else
  {
    v8 = [(HKCloudSyncRequest *)self changesSyncRequest];
  }

  v9 = [v4 contextSyncRequest];
  if (v9)
  {
    v10 = [v4 contextSyncRequest];
    v11 = [(HKCloudSyncRequest *)self contextSyncRequest];
    v12 = [v10 requestByMergingRequest:v11];
  }
  else
  {
    v12 = [(HKCloudSyncRequest *)self contextSyncRequest];
  }

  v13 = [v4 stateSyncRequest];
  if (v13)
  {
    v14 = [v4 stateSyncRequest];
    v15 = [(HKCloudSyncRequest *)self stateSyncRequest];
    id v16 = [v14 requestByMergingRequest:v15];
  }
  else
  {
    id v16 = [(HKCloudSyncRequest *)self stateSyncRequest];
  }

  id v17 = [v4 medicalIDSyncRequest];
  if (v17)
  {
    id v18 = [v4 medicalIDSyncRequest];
    id v19 = [(HKCloudSyncRequest *)self medicalIDSyncRequest];
    id v20 = [v18 requestByMergingRequest:v19];
  }
  else
  {
    id v20 = [(HKCloudSyncRequest *)self medicalIDSyncRequest];
  }

  id v21 = [v4 summarySharingSyncRequest];
  if (v21)
  {
    v22 = [v4 summarySharingSyncRequest];
    uint64_t v23 = [(HKCloudSyncRequest *)self summarySharingSyncRequest];
    uint64_t v24 = [v22 requestByMergingRequest:v23];
  }
  else
  {
    uint64_t v24 = [(HKCloudSyncRequest *)self summarySharingSyncRequest];
  }

  uint64_t v25 = [HKCloudSyncRequest alloc];
  if ([(HKCloudSyncRequest *)self allowCellular]) {
    uint64_t v26 = 1;
  }
  else {
    uint64_t v26 = [v4 allowCellular];
  }
  int64_t v27 = [(HKCloudSyncRequest *)self qualityOfService];
  uint64_t v28 = [v4 qualityOfService];
  if (v27 <= v28) {
    uint64_t v29 = v28;
  }
  else {
    uint64_t v29 = v27;
  }
  v30 = [(HKCloudSyncRequest *)v25 initWithChangesSyncRequest:v8 contextSyncRequest:v12 stateSyncRequest:v16 medicalIDSyncRequest:v20 summarySharingSyncRequest:v24 allowCellular:v26 qualityOfService:v29];

  return v30;
}

+ (id)emptySyncRequest
{
  v2 = (void *)[objc_alloc((Class)a1) initWithChangesSyncRequest:0 contextSyncRequest:0 stateSyncRequest:0 medicalIDSyncRequest:0 summarySharingSyncRequest:0 allowCellular:0 qualityOfService:-1];

  return v2;
}

- (BOOL)isEquivalent:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  v5 = [v4 changesSyncRequest];
  v6 = v5;
  changesSyncRequest = self->_changesSyncRequest;
  if (v5 == changesSyncRequest)
  {
  }
  else
  {
    if (!changesSyncRequest) {
      goto LABEL_26;
    }
    v8 = [v4 changesSyncRequest];
    int v9 = [v8 isEqual:self->_changesSyncRequest];

    if (!v9) {
      goto LABEL_27;
    }
  }
  v10 = [v4 contextSyncRequest];
  v6 = v10;
  contextSyncRequest = self->_contextSyncRequest;
  if (v10 == contextSyncRequest)
  {
  }
  else
  {
    if (!contextSyncRequest) {
      goto LABEL_26;
    }
    v12 = [v4 contextSyncRequest];
    int v13 = [v12 isEqual:self->_contextSyncRequest];

    if (!v13) {
      goto LABEL_27;
    }
  }
  v14 = [v4 stateSyncRequest];
  v6 = v14;
  stateSyncRequest = self->_stateSyncRequest;
  if (v14 == stateSyncRequest)
  {
  }
  else
  {
    if (!stateSyncRequest) {
      goto LABEL_26;
    }
    id v16 = [v4 stateSyncRequest];
    int v17 = [v16 isEqual:self->_stateSyncRequest];

    if (!v17) {
      goto LABEL_27;
    }
  }
  id v18 = [v4 summarySharingSyncRequest];
  v6 = v18;
  summarySharingSyncRequest = self->_summarySharingSyncRequest;
  if (v18 == summarySharingSyncRequest)
  {
  }
  else
  {
    if (!summarySharingSyncRequest) {
      goto LABEL_26;
    }
    id v20 = [v4 summarySharingSyncRequest];
    int v21 = [v20 isEqual:self->_summarySharingSyncRequest];

    if (!v21) {
      goto LABEL_27;
    }
  }
  v22 = [v4 medicalIDSyncRequest];
  v6 = v22;
  medicalIDSyncRequest = self->_medicalIDSyncRequest;
  if (v22 != medicalIDSyncRequest)
  {
    if (medicalIDSyncRequest)
    {
      uint64_t v24 = [v4 medicalIDSyncRequest];
      int v25 = [v24 isEqual:self->_medicalIDSyncRequest];

      if (!v25) {
        goto LABEL_27;
      }
      goto LABEL_30;
    }
LABEL_26:

    goto LABEL_27;
  }

LABEL_30:
  if (self->_allowCellular == [v4 allowCellular])
  {
    BOOL v26 = [v4 qualityOfService] == self->_qualityOfService;
    goto LABEL_28;
  }
LABEL_27:
  BOOL v26 = 0;
LABEL_28:

  return v26;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![(HKCloudSyncRequest *)self isEquivalent:v4]) {
    goto LABEL_9;
  }
  v5 = [v4 identifier];
  v6 = v5;
  identifier = self->_identifier;
  if (v5 == identifier)
  {
  }
  else
  {
    if (!identifier)
    {

LABEL_9:
      BOOL v10 = 0;
      goto LABEL_10;
    }
    v8 = [v4 identifier];
    char v9 = [v8 isEqual:self->_identifier];

    if ((v9 & 1) == 0) {
      goto LABEL_9;
    }
  }
  BOOL v10 = 1;
LABEL_10:

  return v10;
}

- (BOOL)matchesFilter:(unint64_t)a3
{
  char v3 = a3;
  if (a3)
  {
    v14 = [(HKCloudSyncRequest *)self changesSyncRequest];
    BOOL v5 = v14 == 0;

    if ((v3 & 2) != 0)
    {
LABEL_3:
      v6 = [(HKCloudSyncRequest *)self contextSyncRequest];
      BOOL v7 = v6 == 0;

      if ((v3 & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v5 = 0;
    if ((a3 & 2) != 0) {
      goto LABEL_3;
    }
  }
  BOOL v7 = 0;
  if ((v3 & 4) != 0)
  {
LABEL_4:
    v8 = [(HKCloudSyncRequest *)self stateSyncRequest];
    BOOL v9 = v8 == 0;

    if ((v3 & 8) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    BOOL v11 = 1;
    if ((v3 & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    BOOL v13 = 1;
    return v11 & ~(v5 || v7 || v9) & v13;
  }
LABEL_9:
  BOOL v9 = 0;
  if ((v3 & 8) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  BOOL v10 = [(HKCloudSyncRequest *)self medicalIDSyncRequest];
  BOOL v11 = v10 != 0;

  if ((v3 & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  v12 = [(HKCloudSyncRequest *)self summarySharingSyncRequest];
  BOOL v13 = v12 != 0;

  return v11 & ~(v5 || v7 || v9) & v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  changesSyncRequest = self->_changesSyncRequest;
  id v5 = a3;
  [v5 encodeObject:changesSyncRequest forKey:@"changesSyncRequest"];
  [v5 encodeObject:self->_contextSyncRequest forKey:@"contextSyncRequest"];
  [v5 encodeObject:self->_stateSyncRequest forKey:@"stateSyncRequest"];
  [v5 encodeObject:self->_medicalIDSyncRequest forKey:@"medicalIDSyncRequest"];
  [v5 encodeObject:self->_summarySharingSyncRequest forKey:@"summarySharingSyncRequest"];
  [v5 encodeObject:self->_identifier forKey:@"requestIdentifier"];
  [v5 encodeBool:self->_allowCellular forKey:@"allowCellular"];
  [v5 encodeInteger:self->_qualityOfService forKey:@"qualityOfService"];
}

- (HKCloudSyncRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestIdentifier"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"changesSyncRequest"];
    BOOL v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contextSyncRequest"];
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stateSyncRequest"];
    BOOL v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"medicalIDSyncRequest"];
    BOOL v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"summarySharingSyncRequest"];
    LOBYTE(v13) = [v4 decodeBoolForKey:@"allowCellular"];
    self = -[HKCloudSyncRequest initWithIdentifier:changesSyncRequest:contextSyncRequest:stateSyncRequest:medicalIDSyncRequest:summarySharingSyncRequest:allowCellular:qualityOfService:](self, "initWithIdentifier:changesSyncRequest:contextSyncRequest:stateSyncRequest:medicalIDSyncRequest:summarySharingSyncRequest:allowCellular:qualityOfService:", v5, v6, v7, v8, v9, v10, v13, [v4 decodeIntegerForKey:@"qualityOfService"]);

    BOOL v11 = self;
  }
  else
  {
    v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4865 userInfo:0];
    [v4 failWithError:v6];
    BOOL v11 = 0;
  }

  return v11;
}

- (id)description
{
  uint64_t v13 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v3 = objc_opt_class();
  id v4 = [(HKCloudSyncRequest *)self identifier];
  id v5 = [v4 UUIDString];
  v6 = [(HKCloudSyncRequest *)self changesSyncRequest];
  BOOL v7 = [(HKCloudSyncRequest *)self contextSyncRequest];
  v8 = [(HKCloudSyncRequest *)self stateSyncRequest];
  BOOL v9 = [(HKCloudSyncRequest *)self medicalIDSyncRequest];
  BOOL v10 = [(HKCloudSyncRequest *)self summarySharingSyncRequest];
  BOOL v11 = [v13 stringWithFormat:@"<%@:%p %@\n| Changes Sync Request: %@\n| Context Sync Request: %@\n| State Sync Request: %@\n| Medical ID Sync Request: %@\n| Summary Sharing Sync Request: %@\n| Allow Cellular: %d\n| Quality of Service: %ld\n", v3, self, v5, v6, v7, v8, v9, v10, -[HKCloudSyncRequest allowCellular](self, "allowCellular"), -[HKCloudSyncRequest qualityOfService](self, "qualityOfService")];

  return v11;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (HKChangesSyncRequest)changesSyncRequest
{
  return self->_changesSyncRequest;
}

- (HKContextSyncRequest)contextSyncRequest
{
  return self->_contextSyncRequest;
}

- (HKStateSyncRequest)stateSyncRequest
{
  return self->_stateSyncRequest;
}

- (HKMedicalIDSyncRequest)medicalIDSyncRequest
{
  return self->_medicalIDSyncRequest;
}

- (HKSummarySharingSyncRequest)summarySharingSyncRequest
{
  return self->_summarySharingSyncRequest;
}

- (BOOL)allowCellular
{
  return self->_allowCellular;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summarySharingSyncRequest, 0);
  objc_storeStrong((id *)&self->_medicalIDSyncRequest, 0);
  objc_storeStrong((id *)&self->_stateSyncRequest, 0);
  objc_storeStrong((id *)&self->_contextSyncRequest, 0);
  objc_storeStrong((id *)&self->_changesSyncRequest, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end