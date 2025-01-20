@interface HKSecondaryPairedDeviceConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)secondaryPairedDeviceConfigurationWithNanoRegistryDeviceUUID:(id)a3 setupType:(unint64_t)a4 firstName:(id)a5 lastName:(id)a6;
- (HKSecondaryPairedDeviceConfiguration)initWithCoder:(id)a3;
- (NSDateComponents)dateOfBirth;
- (NSNumber)dsid;
- (NSNumber)guardianDSID;
- (NSString)firstName;
- (NSString)guardianFirstName;
- (NSString)guardianHashedDSID;
- (NSString)guardianLastName;
- (NSString)hashedDSID;
- (NSString)lastName;
- (NSUUID)nanoRegistryDeviceUUID;
- (id)_initWithNanoRegistryDeviceUUID:(id)a3 setupType:(unint64_t)a4 firstName:(id)a5 lastName:(id)a6;
- (id)description;
- (unint64_t)setupType;
- (void)encodeWithCoder:(id)a3;
- (void)setDateOfBirth:(id)a3;
- (void)setDsid:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setGuardianDSID:(id)a3;
- (void)setGuardianFirstName:(id)a3;
- (void)setGuardianHashedDSID:(id)a3;
- (void)setGuardianLastName:(id)a3;
- (void)setHashedDSID:(id)a3;
- (void)setLastName:(id)a3;
- (void)setNanoRegistryDeviceUUID:(id)a3;
- (void)setSetupType:(unint64_t)a3;
@end

@implementation HKSecondaryPairedDeviceConfiguration

+ (id)secondaryPairedDeviceConfigurationWithNanoRegistryDeviceUUID:(id)a3 setupType:(unint64_t)a4 firstName:(id)a5 lastName:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  v13 = (void *)[objc_alloc((Class)a1) _initWithNanoRegistryDeviceUUID:v12 setupType:a4 firstName:v11 lastName:v10];

  return v13;
}

- (id)_initWithNanoRegistryDeviceUUID:(id)a3 setupType:(unint64_t)a4 firstName:(id)a5 lastName:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HKSecondaryPairedDeviceConfiguration;
  v14 = [(HKSecondaryPairedDeviceConfiguration *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_nanoRegistryDeviceUUID, a3);
    v15->_setupType = a4;
    objc_storeStrong((id *)&v15->_firstName, a5);
    objc_storeStrong((id *)&v15->_lastName, a6);
  }

  return v15;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  nanoRegistryDeviceUUID = self->_nanoRegistryDeviceUUID;
  v6 = [NSNumber numberWithUnsignedInteger:self->_setupType];
  v7 = [v3 stringWithFormat:@"<%@:%p, UUID:%@, setupType:%@, dateOfBirth:%@, firstName:%@, lastName:%@, DSID:%@, guardianFirstName:%@, guardianLastName:%@, guardianDSID:%@>", v4, self, nanoRegistryDeviceUUID, v6, self->_dateOfBirth, self->_firstName, self->_lastName, self->_dsid, self->_guardianFirstName, self->_guardianLastName, self->_guardianDSID];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKSecondaryPairedDeviceConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HKSecondaryPairedDeviceConfiguration;
  v5 = [(HKSecondaryPairedDeviceConfiguration *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    nanoRegistryDeviceUUID = v5->_nanoRegistryDeviceUUID;
    v5->_nanoRegistryDeviceUUID = (NSUUID *)v6;

    v5->_setupType = [v4 decodeIntegerForKey:@"setupType"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateOfBirth"];
    dateOfBirth = v5->_dateOfBirth;
    v5->_dateOfBirth = (NSDateComponents *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firstName"];
    firstName = v5->_firstName;
    v5->_firstName = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastName"];
    lastName = v5->_lastName;
    v5->_lastName = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dsid"];
    dsid = v5->_dsid;
    v5->_dsid = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"guardianFirstName"];
    guardianFirstName = v5->_guardianFirstName;
    v5->_guardianFirstName = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"guardianLastName"];
    guardianLastName = v5->_guardianLastName;
    v5->_guardianLastName = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"guardianDSID"];
    guardianDSID = v5->_guardianDSID;
    v5->_guardianDSID = (NSNumber *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  nanoRegistryDeviceUUID = self->_nanoRegistryDeviceUUID;
  id v5 = a3;
  [v5 encodeObject:nanoRegistryDeviceUUID forKey:@"uuid"];
  [v5 encodeObject:self->_dateOfBirth forKey:@"dateOfBirth"];
  [v5 encodeInteger:self->_setupType forKey:@"setupType"];
  [v5 encodeObject:self->_firstName forKey:@"firstName"];
  [v5 encodeObject:self->_lastName forKey:@"lastName"];
  [v5 encodeObject:self->_dsid forKey:@"dsid"];
  [v5 encodeObject:self->_guardianFirstName forKey:@"guardianFirstName"];
  [v5 encodeObject:self->_guardianLastName forKey:@"guardianLastName"];
  [v5 encodeObject:self->_guardianDSID forKey:@"guardianDSID"];
}

- (NSUUID)nanoRegistryDeviceUUID
{
  return self->_nanoRegistryDeviceUUID;
}

- (void)setNanoRegistryDeviceUUID:(id)a3
{
}

- (unint64_t)setupType
{
  return self->_setupType;
}

- (void)setSetupType:(unint64_t)a3
{
  self->_setupType = a3;
}

- (NSDateComponents)dateOfBirth
{
  return self->_dateOfBirth;
}

- (void)setDateOfBirth:(id)a3
{
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
}

- (NSNumber)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
}

- (NSString)guardianFirstName
{
  return self->_guardianFirstName;
}

- (void)setGuardianFirstName:(id)a3
{
}

- (NSString)guardianLastName
{
  return self->_guardianLastName;
}

- (void)setGuardianLastName:(id)a3
{
}

- (NSNumber)guardianDSID
{
  return self->_guardianDSID;
}

- (void)setGuardianDSID:(id)a3
{
}

- (NSString)hashedDSID
{
  return self->_hashedDSID;
}

- (void)setHashedDSID:(id)a3
{
}

- (NSString)guardianHashedDSID
{
  return self->_guardianHashedDSID;
}

- (void)setGuardianHashedDSID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guardianHashedDSID, 0);
  objc_storeStrong((id *)&self->_hashedDSID, 0);
  objc_storeStrong((id *)&self->_guardianDSID, 0);
  objc_storeStrong((id *)&self->_guardianLastName, 0);
  objc_storeStrong((id *)&self->_guardianFirstName, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_dateOfBirth, 0);

  objc_storeStrong((id *)&self->_nanoRegistryDeviceUUID, 0);
}

@end