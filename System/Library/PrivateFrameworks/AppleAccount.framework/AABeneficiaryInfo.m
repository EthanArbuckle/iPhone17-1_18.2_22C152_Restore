@interface AABeneficiaryInfo
+ (BOOL)supportsSecureCoding;
- (AABeneficiaryInfo)initWithBeneficiaryID:(id)a3 benefactorAltDSID:(id)a4 handle:(id)a5;
- (AABeneficiaryInfo)initWithBeneficiaryID:(id)a3 benefactorAltDSID:(id)a4 handle:(id)a5 otPeerID:(id)a6 repairDate:(id)a7 repairCount:(unint64_t)a8 recordBuildVersion:(id)a9;
- (AABeneficiaryInfo)initWithCoder:(id)a3;
- (NSString)description;
- (NSString)handle;
- (NSString)recordBuildVersion;
- (NSString)repairDate;
- (NSUUID)otPeerID;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)repairCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AABeneficiaryInfo

- (AABeneficiaryInfo)initWithBeneficiaryID:(id)a3 benefactorAltDSID:(id)a4 handle:(id)a5
{
  return [(AABeneficiaryInfo *)self initWithBeneficiaryID:a3 benefactorAltDSID:a4 handle:a5 otPeerID:0 repairDate:0 repairCount:0 recordBuildVersion:0];
}

- (AABeneficiaryInfo)initWithBeneficiaryID:(id)a3 benefactorAltDSID:(id)a4 handle:(id)a5 otPeerID:(id)a6 repairDate:(id)a7 repairCount:(unint64_t)a8 recordBuildVersion:(id)a9
{
  id v22 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a9;
  v23.receiver = self;
  v23.super_class = (Class)AABeneficiaryInfo;
  v18 = [(AABeneficiary *)&v23 initWithBeneficiaryID:a3 benefactorAltDSID:a4];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_handle, a5);
    objc_storeStrong((id *)&v19->_otPeerID, a6);
    objc_storeStrong((id *)&v19->_repairDate, a7);
    v19->_repairCount = a8;
    objc_storeStrong((id *)&v19->_recordBuildVersion, a9);
  }

  return v19;
}

- (AABeneficiaryInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AABeneficiaryInfo;
  v5 = [(AABeneficiary *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_handle"];
    handle = v5->_handle;
    v5->_handle = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_otPeerID"];
    otPeerID = v5->_otPeerID;
    v5->_otPeerID = (NSUUID *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_repairDate"];
    repairDate = v5->_repairDate;
    v5->_repairDate = (NSString *)v10;

    v5->_repairCount = [v4 decodeIntegerForKey:@"_repairCount"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_recordBuildVersion"];
    recordBuildVersion = v5->_recordBuildVersion;
    v5->_recordBuildVersion = (NSString *)v12;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AABeneficiaryInfo;
  id v4 = [(AABeneficiary *)&v8 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_handle copy];
  uint64_t v6 = (void *)*((void *)v4 + 4);
  *((void *)v4 + 4) = v5;

  objc_storeStrong((id *)v4 + 5, self->_otPeerID);
  objc_storeStrong((id *)v4 + 6, self->_repairDate);
  *((void *)v4 + 7) = self->_repairCount;
  objc_storeStrong((id *)v4 + 8, self->_recordBuildVersion);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AABeneficiaryInfo;
  id v4 = a3;
  [(AABeneficiary *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_handle, @"_handle", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_otPeerID forKey:@"_otPeerID"];
  [v4 encodeObject:self->_repairDate forKey:@"_repairDate"];
  [v4 encodeInteger:self->_repairCount forKey:@"_repairCount"];
  [v4 encodeObject:self->_recordBuildVersion forKey:@"_recordBuildVersion"];
}

- (NSString)description
{
  v3 = NSString;
  id v4 = [(AABeneficiary *)self accessKey];
  objc_super v5 = [v4 claimTokenString];
  uint64_t v6 = [(AABeneficiary *)self accessKey];
  v7 = [v6 wrappingKeyString];
  v21 = [v3 stringWithFormat:@"%@-%@", v5, v7];

  v20 = NSString;
  v22.receiver = self;
  v22.super_class = (Class)AABeneficiaryInfo;
  objc_super v8 = [(AABeneficiary *)&v22 description];
  handle = self->_handle;
  v9 = [(AABeneficiary *)self accessKey];
  uint64_t v10 = [v9 claimTokenString];
  v11 = [(AABeneficiary *)self accessKey];
  uint64_t v12 = [v11 wrappingKeyString];
  v13 = [(AABeneficiaryInfo *)self otPeerID];
  v14 = [(AABeneficiaryInfo *)self repairDate];
  unint64_t v15 = [(AABeneficiaryInfo *)self repairCount];
  id v16 = [(AABeneficiaryInfo *)self recordBuildVersion];
  id v17 = [v20 stringWithFormat:@"%@ \nHandle: %@ \nClaim Code: %@\nAccess Key: %@\nFull Access Key: %@\nOTPeerID: %@\nRepair Date: %@\nRepair Count: %lu\nRecord Build Version: %@", v8, handle, v10, v12, v21, v13, v14, v15, v16];

  return (NSString *)v17;
}

- (NSString)handle
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)otPeerID
{
  return self->_otPeerID;
}

- (NSString)repairDate
{
  return self->_repairDate;
}

- (unint64_t)repairCount
{
  return self->_repairCount;
}

- (NSString)recordBuildVersion
{
  return self->_recordBuildVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordBuildVersion, 0);
  objc_storeStrong((id *)&self->_repairDate, 0);
  objc_storeStrong((id *)&self->_otPeerID, 0);

  objc_storeStrong((id *)&self->_handle, 0);
}

@end