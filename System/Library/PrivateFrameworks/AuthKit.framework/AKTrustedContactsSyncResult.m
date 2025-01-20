@interface AKTrustedContactsSyncResult
+ (BOOL)supportsSecureCoding;
- (AKTrustedContactsSyncResult)initWithCoder:(id)a3;
- (NSArray)orphanedBeneficiaryUUIDs;
- (NSArray)orphanedCustodianUUIDs;
- (NSDictionary)beneficiaryOperationsByID;
- (NSDictionary)custodianOperationsByID;
- (NSString)beneficiaryListVersion;
- (NSString)custodianListVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setBeneficiaryListVersion:(id)a3;
- (void)setBeneficiaryOperationsByID:(id)a3;
- (void)setCustodianListVersion:(id)a3;
- (void)setCustodianOperationsByID:(id)a3;
- (void)setOrphanedBeneficiaryUUIDs:(id)a3;
- (void)setOrphanedCustodianUUIDs:(id)a3;
@end

@implementation AKTrustedContactsSyncResult

- (AKTrustedContactsSyncResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AKTrustedContactsSyncResult *)self init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v8 forKey:@"_custodianUUIDs"];
    orphanedCustodianUUIDs = v5->_orphanedCustodianUUIDs;
    v5->_orphanedCustodianUUIDs = (NSArray *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_custodianListVersion"];
    custodianListVersion = v5->_custodianListVersion;
    v5->_custodianListVersion = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClasses:v8 forKey:@"_beneficiaryUUIDs"];
    orphanedBeneficiaryUUIDs = v5->_orphanedBeneficiaryUUIDs;
    v5->_orphanedBeneficiaryUUIDs = (NSArray *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_beneficiaryListVersion"];
    beneficiaryListVersion = v5->_beneficiaryListVersion;
    v5->_beneficiaryListVersion = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClasses:v12 forKey:@"_custodianOperationsByID"];
    custodianOperationsByID = v5->_custodianOperationsByID;
    v5->_custodianOperationsByID = (NSDictionary *)v21;

    uint64_t v23 = [v4 decodeObjectOfClasses:v12 forKey:@"_beneficiaryOperationsByID"];
    beneficiaryOperationsByID = v5->_beneficiaryOperationsByID;
    v5->_beneficiaryOperationsByID = (NSDictionary *)v23;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  orphanedCustodianUUIDs = self->_orphanedCustodianUUIDs;
  id v5 = a3;
  [v5 encodeObject:orphanedCustodianUUIDs forKey:@"_custodianUUIDs"];
  [v5 encodeObject:self->_custodianListVersion forKey:@"_custodianListVersion"];
  [v5 encodeObject:self->_orphanedBeneficiaryUUIDs forKey:@"_beneficiaryUUIDs"];
  [v5 encodeObject:self->_beneficiaryListVersion forKey:@"_beneficiaryListVersion"];
  [v5 encodeObject:self->_custodianOperationsByID forKey:@"_custodianOperationsByID"];
  [v5 encodeObject:self->_beneficiaryOperationsByID forKey:@"_beneficiaryOperationsByID"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSArray *)self->_orphanedCustodianUUIDs copy];
  v6 = (void *)v4[5];
  v4[5] = v5;

  uint64_t v7 = [(NSString *)self->_custodianListVersion copy];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [(NSArray *)self->_orphanedBeneficiaryUUIDs copy];
  uint64_t v10 = (void *)v4[6];
  v4[6] = v9;

  uint64_t v11 = [(NSString *)self->_beneficiaryListVersion copy];
  v12 = (void *)v4[4];
  v4[4] = v11;

  uint64_t v13 = [(NSDictionary *)self->_custodianOperationsByID copy];
  v14 = (void *)v4[1];
  v4[1] = v13;

  uint64_t v15 = [(NSDictionary *)self->_beneficiaryOperationsByID copy];
  v16 = (void *)v4[2];
  v4[2] = v15;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)debugDescription
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p {\ncustodianListVersion: %@\nbeneficiaryListVersion: %@\n_custodianOperationsByID: %@\n_beneficiaryOperationsByID: %@\n}>", v5, self, self->_custodianListVersion, self->_beneficiaryListVersion, self->_custodianOperationsByID, self->_beneficiaryOperationsByID];

  return v6;
}

- (NSDictionary)custodianOperationsByID
{
  return self->_custodianOperationsByID;
}

- (void)setCustodianOperationsByID:(id)a3
{
}

- (NSDictionary)beneficiaryOperationsByID
{
  return self->_beneficiaryOperationsByID;
}

- (void)setBeneficiaryOperationsByID:(id)a3
{
}

- (NSString)custodianListVersion
{
  return self->_custodianListVersion;
}

- (void)setCustodianListVersion:(id)a3
{
}

- (NSString)beneficiaryListVersion
{
  return self->_beneficiaryListVersion;
}

- (void)setBeneficiaryListVersion:(id)a3
{
}

- (NSArray)orphanedCustodianUUIDs
{
  return self->_orphanedCustodianUUIDs;
}

- (void)setOrphanedCustodianUUIDs:(id)a3
{
}

- (NSArray)orphanedBeneficiaryUUIDs
{
  return self->_orphanedBeneficiaryUUIDs;
}

- (void)setOrphanedBeneficiaryUUIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orphanedBeneficiaryUUIDs, 0);
  objc_storeStrong((id *)&self->_orphanedCustodianUUIDs, 0);
  objc_storeStrong((id *)&self->_beneficiaryListVersion, 0);
  objc_storeStrong((id *)&self->_custodianListVersion, 0);
  objc_storeStrong((id *)&self->_beneficiaryOperationsByID, 0);

  objc_storeStrong((id *)&self->_custodianOperationsByID, 0);
}

@end