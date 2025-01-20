@interface AATrustedContact
+ (BOOL)supportsSecureCoding;
- (AATrustedContact)initWithCoder:(id)a3;
- (AATrustedContact)initWithID:(id)a3 status:(int64_t)a4 handle:(id)a5 firstName:(id)a6 lastName:(id)a7 displayName:(id)a8 isAcceptedAndShared:(BOOL)a9 isIdMSConfirmed:(BOOL)a10 preflightStatus:(int64_t)a11 otCustodianID:(id)a12 keyCreatedOnBuild:(id)a13 repairDate:(id)a14 repairCount:(unint64_t)a15;
- (BOOL)isAcceptedAndShared;
- (BOOL)isIdMSConfirmed;
- (NSString)displayName;
- (NSString)firstName;
- (NSString)handle;
- (NSString)keyCreatedOnBuild;
- (NSString)lastName;
- (NSString)repairDate;
- (NSUUID)custodianID;
- (NSUUID)otCustodianID;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)preflightStatus;
- (int64_t)status;
- (unint64_t)repairCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AATrustedContact

- (AATrustedContact)initWithID:(id)a3 status:(int64_t)a4 handle:(id)a5 firstName:(id)a6 lastName:(id)a7 displayName:(id)a8 isAcceptedAndShared:(BOOL)a9 isIdMSConfirmed:(BOOL)a10 preflightStatus:(int64_t)a11 otCustodianID:(id)a12 keyCreatedOnBuild:(id)a13 repairDate:(id)a14 repairCount:(unint64_t)a15
{
  id v21 = a3;
  id v31 = a5;
  id v22 = a5;
  id obj = a6;
  id v23 = a6;
  id v33 = a7;
  id v24 = a7;
  id v34 = a8;
  id v36 = a8;
  id v25 = a12;
  id v26 = a13;
  id v35 = a14;
  v37.receiver = self;
  v37.super_class = (Class)AATrustedContact;
  v27 = [(AATrustedContact *)&v37 init];
  v28 = v27;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_custodianID, a3);
    v28->_status = a4;
    objc_storeStrong((id *)&v28->_handle, v31);
    objc_storeStrong((id *)&v28->_firstName, obj);
    objc_storeStrong((id *)&v28->_lastName, v33);
    objc_storeStrong((id *)&v28->_displayName, v34);
    v28->_isAcceptedAndShared = a9;
    v28->_isIdMSConfirmed = a10;
    v28->_preflightStatus = a11;
    objc_storeStrong((id *)&v28->_otCustodianID, a12);
    objc_storeStrong((id *)&v28->_keyCreatedOnBuild, a13);
    objc_storeStrong((id *)&v28->_repairDate, a14);
    v28->_repairCount = a15;
  }

  return v28;
}

- (AATrustedContact)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AATrustedContact *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_custodianID"];
    custodianID = v5->_custodianID;
    v5->_custodianID = (NSUUID *)v6;

    v5->_status = [v4 decodeIntegerForKey:@"_status"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_handle"];
    handle = v5->_handle;
    v5->_handle = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_firstName"];
    firstName = v5->_firstName;
    v5->_firstName = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_lastName"];
    lastName = v5->_lastName;
    v5->_lastName = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v14;

    v5->_isAcceptedAndShared = [v4 decodeBoolForKey:@"_isAcceptedAndShared"];
    v5->_isIdMSConfirmed = [v4 decodeBoolForKey:@"_isIdMSConfirmed"];
    v5->_preflightStatus = [v4 decodeIntegerForKey:@"_preflightStatus"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_otCustodianID"];
    otCustodianID = v5->_otCustodianID;
    v5->_otCustodianID = (NSUUID *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_keyCreatedOnBuild"];
    keyCreatedOnBuild = v5->_keyCreatedOnBuild;
    v5->_keyCreatedOnBuild = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_repairDate"];
    repairDate = v5->_repairDate;
    v5->_repairDate = (NSString *)v20;

    v5->_repairCount = [v4 decodeIntegerForKey:@"_repairCount"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  custodianID = self->_custodianID;
  id v5 = a3;
  [v5 encodeObject:custodianID forKey:@"_custodianID"];
  [v5 encodeInteger:self->_status forKey:@"_status"];
  [v5 encodeObject:self->_handle forKey:@"_handle"];
  [v5 encodeObject:self->_firstName forKey:@"_firstName"];
  [v5 encodeObject:self->_lastName forKey:@"_lastName"];
  [v5 encodeObject:self->_displayName forKey:@"_displayName"];
  [v5 encodeBool:self->_isAcceptedAndShared forKey:@"_isAcceptedAndShared"];
  [v5 encodeBool:self->_isIdMSConfirmed forKey:@"_isIdMSConfirmed"];
  [v5 encodeInteger:self->_preflightStatus forKey:@"_preflightStatus"];
  [v5 encodeObject:self->_otCustodianID forKey:@"_otCustodianID"];
  [v5 encodeObject:self->_keyCreatedOnBuild forKey:@"_keyCreatedOnBuild"];
  [v5 encodeObject:self->_repairDate forKey:@"_repairDate"];
  [v5 encodeInteger:self->_repairCount forKey:@"_repairCount"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = [(NSUUID *)self->_custodianID copy];
  uint64_t v6 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v5;

  *(void *)(v4 + 24) = self->_status;
  uint64_t v7 = [(NSString *)self->_handle copy];
  uint64_t v8 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v7;

  uint64_t v9 = [(NSString *)self->_firstName copy];
  uint64_t v10 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v9;

  uint64_t v11 = [(NSString *)self->_lastName copy];
  uint64_t v12 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = v11;

  uint64_t v13 = [(NSString *)self->_displayName copy];
  uint64_t v14 = *(void **)(v4 + 56);
  *(void *)(v4 + 56) = v13;

  *(unsigned char *)(v4 + 8) = self->_isAcceptedAndShared;
  *(unsigned char *)(v4 + 9) = self->_isIdMSConfirmed;
  *(void *)(v4 + 64) = self->_preflightStatus;
  objc_storeStrong((id *)(v4 + 72), self->_otCustodianID);
  objc_storeStrong((id *)(v4 + 80), self->_keyCreatedOnBuild);
  objc_storeStrong((id *)(v4 + 88), self->_repairDate);
  *(void *)(v4 + 96) = self->_repairCount;
  return (id)v4;
}

- (NSUUID)custodianID
{
  return self->_custodianID;
}

- (int64_t)status
{
  return self->_status;
}

- (NSString)handle
{
  return self->_handle;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (BOOL)isAcceptedAndShared
{
  return self->_isAcceptedAndShared;
}

- (BOOL)isIdMSConfirmed
{
  return self->_isIdMSConfirmed;
}

- (int64_t)preflightStatus
{
  return self->_preflightStatus;
}

- (NSUUID)otCustodianID
{
  return self->_otCustodianID;
}

- (NSString)keyCreatedOnBuild
{
  return self->_keyCreatedOnBuild;
}

- (NSString)repairDate
{
  return self->_repairDate;
}

- (unint64_t)repairCount
{
  return self->_repairCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repairDate, 0);
  objc_storeStrong((id *)&self->_keyCreatedOnBuild, 0);
  objc_storeStrong((id *)&self->_otCustodianID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_handle, 0);

  objc_storeStrong((id *)&self->_custodianID, 0);
}

@end