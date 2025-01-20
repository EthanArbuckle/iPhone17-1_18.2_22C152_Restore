@interface CKKSPCSIdentityQueryResult
+ (BOOL)supportsSecureCoding;
- (CKKSPCSIdentityQueryResult)initWithCoder:(id)a3;
- (CKKSPCSIdentityQueryResult)initWithServiceNumber:(id)a3 publicKey:(id)a4 zoneID:(id)a5 decryptedRecord:(id)a6;
- (NSDictionary)decryptedRecord;
- (NSNumber)serviceNumber;
- (NSString)publicKey;
- (NSString)zoneID;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDecryptedRecord:(id)a3;
- (void)setPublicKey:(id)a3;
- (void)setServiceNumber:(id)a3;
- (void)setZoneID:(id)a3;
@end

@implementation CKKSPCSIdentityQueryResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decryptedRecord, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);

  objc_storeStrong((id *)&self->_serviceNumber, 0);
}

- (void)setDecryptedRecord:(id)a3
{
}

- (NSDictionary)decryptedRecord
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setZoneID:(id)a3
{
}

- (NSString)zoneID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPublicKey:(id)a3
{
}

- (NSString)publicKey
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setServiceNumber:(id)a3
{
}

- (NSNumber)serviceNumber
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (CKKSPCSIdentityQueryResult)initWithCoder:(id)a3
{
  v19[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CKKSPCSIdentityQueryResult;
  v5 = [(CKKSPCSIdentityQueryResult *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceNumber"];
    serviceNumber = v5->_serviceNumber;
    v5->_serviceNumber = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"zoneID"];
    zoneID = v5->_zoneID;
    v5->_zoneID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publicKey"];
    publicKey = v5->_publicKey;
    v5->_publicKey = (NSString *)v10;

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    v19[3] = objc_opt_class();
    v19[4] = objc_opt_class();
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:5];
    v14 = [v12 setWithArray:v13];

    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"decryptedRecord"];
    decryptedRecord = v5->_decryptedRecord;
    v5->_decryptedRecord = (NSDictionary *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CKKSPCSIdentityQueryResult *)self serviceNumber];
  [v4 encodeObject:v5 forKey:@"serviceNumber"];

  uint64_t v6 = [(CKKSPCSIdentityQueryResult *)self zoneID];
  [v4 encodeObject:v6 forKey:@"zoneID"];

  v7 = [(CKKSPCSIdentityQueryResult *)self publicKey];
  [v4 encodeObject:v7 forKey:@"publicKey"];

  id v8 = [(CKKSPCSIdentityQueryResult *)self decryptedRecord];
  [v4 encodeObject:v8 forKey:@"decryptedRecord"];
}

- (id)description
{
  v3 = NSString;
  id v4 = [(CKKSPCSIdentityQueryResult *)self zoneID];
  v5 = [(CKKSPCSIdentityQueryResult *)self serviceNumber];
  uint64_t v6 = [v3 stringWithFormat:@"<CKKSPCSIdentityQueryResult(%@): %@>", v4, v5];

  return v6;
}

- (CKKSPCSIdentityQueryResult)initWithServiceNumber:(id)a3 publicKey:(id)a4 zoneID:(id)a5 decryptedRecord:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CKKSPCSIdentityQueryResult;
  uint64_t v15 = [(CKKSPCSIdentityQueryResult *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_serviceNumber, a3);
    objc_storeStrong((id *)&v16->_publicKey, a4);
    objc_storeStrong((id *)&v16->_zoneID, a5);
    objc_storeStrong((id *)&v16->_decryptedRecord, a6);
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end