@interface FKPaymentPass
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (FKPaymentPass)initWithCoder:(id)a3;
- (NSArray)associatedStoreIdentifiers;
- (NSSet)associatedApplicationIdentifiers;
- (NSSet)paymentApplications;
- (NSString)issuerCountryCode;
- (NSString)localizedDescription;
- (NSString)organizationName;
- (NSString)partnerOrgID;
- (NSString)passTypeIdentifier;
- (NSString)primaryAccountIdentifier;
- (NSString)primaryPaymentApplicationDisplayName;
- (NSString)primaryPaymentApplicationPaymentType;
- (NSString)serialNumber;
- (NSString)uniqueID;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAssociatedApplicationIdentifiers:(id)a3;
- (void)setAssociatedStoreIdentifiers:(id)a3;
- (void)setIssuerCountryCode:(id)a3;
- (void)setLocalizedDescription:(id)a3;
- (void)setOrganizationName:(id)a3;
- (void)setPartnerOrgID:(id)a3;
- (void)setPassTypeIdentifier:(id)a3;
- (void)setPaymentApplications:(id)a3;
- (void)setPrimaryAccountIdentifier:(id)a3;
- (void)setPrimaryPaymentApplicationDisplayName:(id)a3;
- (void)setPrimaryPaymentApplicationPaymentType:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setUniqueID:(id)a3;
@end

@implementation FKPaymentPass

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FKPaymentPass)initWithCoder:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)FKPaymentPass;
  v5 = [(FKPaymentPass *)&v42 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueID"];
    uniqueID = v5->_uniqueID;
    v5->_uniqueID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serialNumber"];
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passTypeIdentifier"];
    passTypeIdentifier = v5->_passTypeIdentifier;
    v5->_passTypeIdentifier = (NSString *)v10;

    id v12 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "initWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"associatedApplicationIdentifiers"];
    associatedApplicationIdentifiers = v5->_associatedApplicationIdentifiers;
    v5->_associatedApplicationIdentifiers = (NSSet *)v15;

    id v17 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v18 = objc_opt_class();
    v19 = objc_msgSend(v17, "initWithObjects:", v18, objc_opt_class(), 0);
    uint64_t v20 = [v4 decodeObjectOfClasses:v19 forKey:@"associatedStoreIdentifiers"];
    associatedStoreIdentifiers = v5->_associatedStoreIdentifiers;
    v5->_associatedStoreIdentifiers = (NSArray *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryAccountIdentifier"];
    primaryAccountIdentifier = v5->_primaryAccountIdentifier;
    v5->_primaryAccountIdentifier = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"issuerCountryCode"];
    issuerCountryCode = v5->_issuerCountryCode;
    v5->_issuerCountryCode = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryPaymentApplicationPaymentType"];
    primaryPaymentApplicationPaymentType = v5->_primaryPaymentApplicationPaymentType;
    v5->_primaryPaymentApplicationPaymentType = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"organizationName"];
    organizationName = v5->_organizationName;
    v5->_organizationName = (NSString *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedDescription"];
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryPaymentApplicationDisplayName"];
    primaryPaymentApplicationDisplayName = v5->_primaryPaymentApplicationDisplayName;
    v5->_primaryPaymentApplicationDisplayName = (NSString *)v32;

    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"partnerOrgID"];
    partnerOrgID = v5->_partnerOrgID;
    v5->_partnerOrgID = (NSString *)v34;

    id v36 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v37 = objc_opt_class();
    v38 = objc_msgSend(v36, "initWithObjects:", v37, objc_opt_class(), 0);
    uint64_t v39 = [v4 decodeObjectOfClasses:v38 forKey:@"paymentApplications"];
    paymentApplications = v5->_paymentApplications;
    v5->_paymentApplications = (NSSet *)v39;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uniqueID = self->_uniqueID;
  id v5 = a3;
  [v5 encodeObject:uniqueID forKey:@"uniqueID"];
  [v5 encodeObject:self->_serialNumber forKey:@"serialNumber"];
  [v5 encodeObject:self->_passTypeIdentifier forKey:@"passTypeIdentifier"];
  [v5 encodeObject:self->_associatedApplicationIdentifiers forKey:@"associatedApplicationIdentifiers"];
  [v5 encodeObject:self->_associatedStoreIdentifiers forKey:@"associatedStoreIdentifiers"];
  [v5 encodeObject:self->_primaryAccountIdentifier forKey:@"primaryAccountIdentifier"];
  [v5 encodeObject:self->_issuerCountryCode forKey:@"issuerCountryCode"];
  [v5 encodeObject:self->_primaryPaymentApplicationPaymentType forKey:@"primaryPaymentApplicationPaymentType"];
  [v5 encodeObject:self->_organizationName forKey:@"organizationName"];
  [v5 encodeObject:self->_localizedDescription forKey:@"localizedDescription"];
  [v5 encodeObject:self->_primaryPaymentApplicationDisplayName forKey:@"primaryPaymentApplicationDisplayName"];
  [v5 encodeObject:self->_partnerOrgID forKey:@"partnerOrgID"];
  [v5 encodeObject:self->_paymentApplications forKey:@"paymentApplications"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(FKPaymentPass);
  uint64_t v5 = [(NSString *)self->_uniqueID copy];
  uniqueID = v4->_uniqueID;
  v4->_uniqueID = (NSString *)v5;

  uint64_t v7 = [(NSString *)self->_serialNumber copy];
  serialNumber = v4->_serialNumber;
  v4->_serialNumber = (NSString *)v7;

  uint64_t v9 = [(NSString *)self->_passTypeIdentifier copy];
  passTypeIdentifier = v4->_passTypeIdentifier;
  v4->_passTypeIdentifier = (NSString *)v9;

  uint64_t v11 = [(NSSet *)self->_associatedApplicationIdentifiers copy];
  associatedApplicationIdentifiers = v4->_associatedApplicationIdentifiers;
  v4->_associatedApplicationIdentifiers = (NSSet *)v11;

  uint64_t v13 = [(NSArray *)self->_associatedStoreIdentifiers copy];
  associatedStoreIdentifiers = v4->_associatedStoreIdentifiers;
  v4->_associatedStoreIdentifiers = (NSArray *)v13;

  uint64_t v15 = [(NSString *)self->_primaryAccountIdentifier copy];
  primaryAccountIdentifier = v4->_primaryAccountIdentifier;
  v4->_primaryAccountIdentifier = (NSString *)v15;

  uint64_t v17 = [(NSString *)self->_issuerCountryCode copy];
  issuerCountryCode = v4->_issuerCountryCode;
  v4->_issuerCountryCode = (NSString *)v17;

  uint64_t v19 = [(NSString *)self->_primaryPaymentApplicationPaymentType copy];
  primaryPaymentApplicationPaymentType = v4->_primaryPaymentApplicationPaymentType;
  v4->_primaryPaymentApplicationPaymentType = (NSString *)v19;

  uint64_t v21 = [(NSString *)self->_organizationName copy];
  organizationName = v4->_organizationName;
  v4->_organizationName = (NSString *)v21;

  uint64_t v23 = [(NSString *)self->_localizedDescription copy];
  localizedDescription = v4->_localizedDescription;
  v4->_localizedDescription = (NSString *)v23;

  uint64_t v25 = [(NSString *)self->_primaryPaymentApplicationDisplayName copy];
  primaryPaymentApplicationDisplayName = v4->_primaryPaymentApplicationDisplayName;
  v4->_primaryPaymentApplicationDisplayName = (NSString *)v25;

  uint64_t v27 = [(NSString *)self->_partnerOrgID copy];
  partnerOrgID = v4->_partnerOrgID;
  v4->_partnerOrgID = (NSString *)v27;

  uint64_t v29 = [(NSSet *)self->_paymentApplications copy];
  paymentApplications = v4->_paymentApplications;
  v4->_paymentApplications = (NSSet *)v29;

  return v4;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v3 safelyAddObject:self->_uniqueID];
  [v3 safelyAddObject:self->_serialNumber];
  [v3 safelyAddObject:self->_passTypeIdentifier];
  [v3 safelyAddObject:self->_associatedApplicationIdentifiers];
  [v3 safelyAddObject:self->_associatedStoreIdentifiers];
  [v3 safelyAddObject:self->_primaryAccountIdentifier];
  [v3 safelyAddObject:self->_issuerCountryCode];
  [v3 safelyAddObject:self->_primaryPaymentApplicationPaymentType];
  [v3 safelyAddObject:self->_organizationName];
  [v3 safelyAddObject:self->_localizedDescription];
  [v3 safelyAddObject:self->_primaryPaymentApplicationDisplayName];
  [v3 safelyAddObject:self->_partnerOrgID];
  [v3 safelyAddObject:self->_paymentApplications];
  unint64_t v4 = FKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (FKPaymentPass *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    char v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    if (FKEqualObjects(self->_serialNumber, v6[2])
      && FKEqualObjects(self->_uniqueID, v6[1])
      && FKEqualObjects(self->_passTypeIdentifier, v6[3])
      && FKEqualObjects(self->_associatedApplicationIdentifiers, v6[4])
      && FKEqualObjects(self->_associatedStoreIdentifiers, v6[5])
      && FKEqualObjects(self->_primaryAccountIdentifier, v6[7])
      && FKEqualObjects(self->_issuerCountryCode, v6[6])
      && FKEqualObjects(self->_primaryPaymentApplicationPaymentType, v6[10])
      && FKEqualObjects(self->_organizationName, v6[8])
      && FKEqualObjects(self->_localizedDescription, v6[9])
      && FKEqualObjects(self->_primaryPaymentApplicationDisplayName, v6[11])
      && FKEqualObjects(self->_partnerOrgID, v6[12]))
    {
      char v7 = FKEqualObjects(self->_paymentApplications, v6[13]);
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
}

- (NSSet)associatedApplicationIdentifiers
{
  return self->_associatedApplicationIdentifiers;
}

- (void)setAssociatedApplicationIdentifiers:(id)a3
{
}

- (NSArray)associatedStoreIdentifiers
{
  return self->_associatedStoreIdentifiers;
}

- (void)setAssociatedStoreIdentifiers:(id)a3
{
}

- (NSString)issuerCountryCode
{
  return self->_issuerCountryCode;
}

- (void)setIssuerCountryCode:(id)a3
{
}

- (NSString)primaryAccountIdentifier
{
  return self->_primaryAccountIdentifier;
}

- (void)setPrimaryAccountIdentifier:(id)a3
{
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void)setOrganizationName:(id)a3
{
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
}

- (NSString)primaryPaymentApplicationPaymentType
{
  return self->_primaryPaymentApplicationPaymentType;
}

- (void)setPrimaryPaymentApplicationPaymentType:(id)a3
{
}

- (NSString)primaryPaymentApplicationDisplayName
{
  return self->_primaryPaymentApplicationDisplayName;
}

- (void)setPrimaryPaymentApplicationDisplayName:(id)a3
{
}

- (NSString)partnerOrgID
{
  return self->_partnerOrgID;
}

- (void)setPartnerOrgID:(id)a3
{
}

- (NSSet)paymentApplications
{
  return self->_paymentApplications;
}

- (void)setPaymentApplications:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentApplications, 0);
  objc_storeStrong((id *)&self->_partnerOrgID, 0);
  objc_storeStrong((id *)&self->_primaryPaymentApplicationDisplayName, 0);
  objc_storeStrong((id *)&self->_primaryPaymentApplicationPaymentType, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_primaryAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_issuerCountryCode, 0);
  objc_storeStrong((id *)&self->_associatedStoreIdentifiers, 0);
  objc_storeStrong((id *)&self->_associatedApplicationIdentifiers, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);

  objc_storeStrong((id *)&self->_uniqueID, 0);
}

@end