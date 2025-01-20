@interface HMDLegacyCloudZone
- (HMDLegacyCloudZone)initWithCloudDatabase:(id)a3 configuration:(id)a4 state:(id)a5;
- (NSSet)participants;
- (id)decodeModelFromRecord:(id)a3 externalRecordFields:(id)a4 source:(unint64_t)a5 error:(id *)a6;
- (id)encodeRecordFromModel:(id)a3 existingRecord:(id)a4 encodingContext:(id)a5 error:(id *)a6;
- (id)waitForPendingRebuild;
- (int64_t)keyStatus;
- (void)startUpWithLocalZone:(id)a3;
@end

@implementation HMDLegacyCloudZone

- (void).cxx_destruct
{
}

- (int64_t)keyStatus
{
  return self->_keyStatus;
}

- (NSSet)participants
{
  return self->_participants;
}

- (id)encodeRecordFromModel:(id)a3 existingRecord:(id)a4 encodingContext:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v28 = 0;
  v13 = [(HMBCloudZone *)self modelContainer];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v14 = v13;
  }
  else {
    v14 = 0;
  }
  id v15 = v14;

  if (!v15)
  {
    _HMFPreconditionFailure();
LABEL_16:
    v22 = (HMDLegacyCloudZone *)_HMFPreconditionFailure();
    return [(HMDLegacyCloudZone *)v22 decodeModelFromRecord:v24 externalRecordFields:v25 source:v26 error:v27];
  }
  [v10 hmbAssociateWithContainer:v15];
  id v16 = v10;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v17 = v16;
  }
  else {
    v17 = 0;
  }
  id v18 = v17;

  if (!v18) {
    goto LABEL_16;
  }
  if (a6) {
    v19 = a6;
  }
  else {
    v19 = (id *)&v28;
  }
  v20 = [v18 encodeWithExistingRecord:v11 cloudZone:self modelContainer:v15 error:v19];

  return v20;
}

- (id)decodeModelFromRecord:(id)a3 externalRecordFields:(id)a4 source:(unint64_t)a5 error:(id *)a6
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = [(HMBCloudZone *)self modelContainer];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }
  id v13 = v12;

  if (!v13) {
    _HMFPreconditionFailure();
  }
  v14 = [v9 recordType];
  char v15 = [v14 isEqualToString:@"HomeDataBlob"];

  if (v15)
  {
    id v16 = off_264A124B8;
  }
  else
  {
    v17 = [v9 recordType];
    char v18 = [v17 isEqualToString:@"MetadataBlob"];

    if (v18)
    {
      id v16 = off_264A124B0;
    }
    else
    {
      v19 = [v9 recordType];
      int v20 = [v19 isEqualToString:@"HomeDataBlobV3"];

      if (!v20) {
        goto LABEL_13;
      }
      id v16 = off_264A124C0;
    }
  }
  uint64_t v21 = [(__objc2_class *)*v16 createWithLegacyRecord:v9 modelContainer:v13 error:a6];
  if (v21)
  {
    v22 = (void *)v21;
    SEL v23 = [(HMBCloudZone *)self modelContainer];
    [v22 hmbAssociateWithContainer:v23];

    goto LABEL_19;
  }
LABEL_13:
  id v24 = (void *)MEMORY[0x230FBD990]();
  id v25 = self;
  unint64_t v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    v27 = HMFGetLogIdentifier();
    uint64_t v28 = [v9 hmbDescription];
    int v30 = 138543618;
    v31 = v27;
    __int16 v32 = 2112;
    v33 = v28;
    _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode record %@ from legacy cloud zone.", (uint8_t *)&v30, 0x16u);
  }
  if (a6 && !*a6)
  {
    [MEMORY[0x263F087E8] hmfErrorWithCode:15];
    v22 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
LABEL_19:

  return v22;
}

- (id)waitForPendingRebuild
{
  return (id)[MEMORY[0x263F58190] futureWithNoResult];
}

- (void)startUpWithLocalZone:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)HMDLegacyCloudZone;
  [(HMBCloudZone *)&v3 startUpWithLocalZone:a3];
}

- (HMDLegacyCloudZone)initWithCloudDatabase:(id)a3 configuration:(id)a4 state:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)HMDLegacyCloudZone;
  v5 = [(HMBCloudZone *)&v8 initWithCloudDatabase:a3 configuration:a4 state:a5];
  v6 = v5;
  if (v5) {
    [(HMBCloudZone *)v5 setDefaultDesiredKeys:0];
  }
  return v6;
}

@end