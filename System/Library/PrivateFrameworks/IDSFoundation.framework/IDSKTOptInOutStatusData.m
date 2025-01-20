@interface IDSKTOptInOutStatusData
+ (BOOL)supportsSecureCoding;
- (IDSKTOptInOutStatusData)initWithCoder:(id)a3;
- (NSData)publicAccountKey;
- (NSNumber)optInStatus;
- (NSString)ktApplication;
- (NSString)serviceIdentifier;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setKtApplication:(id)a3;
- (void)setOptInStatus:(id)a3;
- (void)setPublicAccountKey:(id)a3;
- (void)setServiceIdentifier:(id)a3;
@end

@implementation IDSKTOptInOutStatusData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSKTOptInOutStatusData)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)IDSKTOptInOutStatusData;
  v5 = [(IDSKTOptInOutStatusData *)&v27 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, v8, @"KTOptStatusDataPubAccKey");
    publicAccountKey = v5->_publicAccountKey;
    v5->_publicAccountKey = (NSData *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v14 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, v13, @"KTOptStatusDataOptInStatus");
    optInStatus = v5->_optInStatus;
    v5->_optInStatus = (NSNumber *)v14;

    uint64_t v16 = objc_opt_class();
    uint64_t v19 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v16, v18, @"KTOptStatusKTApplication");
    ktApplication = v5->_ktApplication;
    v5->_ktApplication = (NSString *)v19;

    uint64_t v21 = objc_opt_class();
    uint64_t v24 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v22, v21, v23, @"KTOptStatusServiceIdentifier");
    serviceIdentifier = v5->_serviceIdentifier;
    v5->_serviceIdentifier = (NSString *)v24;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  publicAccountKey = self->_publicAccountKey;
  id v13 = a3;
  objc_msgSend_encodeObject_forKey_(v13, v5, (uint64_t)publicAccountKey, v6, @"KTOptStatusDataPubAccKey");
  objc_msgSend_encodeObject_forKey_(v13, v7, (uint64_t)self->_optInStatus, v8, @"KTOptStatusDataOptInStatus");
  objc_msgSend_encodeObject_forKey_(v13, v9, (uint64_t)self->_ktApplication, v10, @"KTOptStatusKTApplication");
  objc_msgSend_encodeObject_forKey_(v13, v11, (uint64_t)self->_serviceIdentifier, v12, @"KTOptStatusServiceIdentifier");
}

- (id)description
{
  v5 = NSString;
  publicAccountKey = self->_publicAccountKey;
  if (objc_msgSend_BOOLValue(self->_optInStatus, a2, v2, v3)) {
    return (id)objc_msgSend_stringWithFormat_(v5, v7, @"<IDSKTOptInOutStatusData: %p, accountKey: %@, optInStatus: %@, ktApplication: %@, serviceIdentifier: %@>", v8, self, publicAccountKey, @"YES", self->_ktApplication, self->_serviceIdentifier);
  }
  else {
    return (id)objc_msgSend_stringWithFormat_(v5, v7, @"<IDSKTOptInOutStatusData: %p, accountKey: %@, optInStatus: %@, ktApplication: %@, serviceIdentifier: %@>", v8, self, publicAccountKey, @"NO", self->_ktApplication, self->_serviceIdentifier);
  }
}

- (NSData)publicAccountKey
{
  return self->_publicAccountKey;
}

- (void)setPublicAccountKey:(id)a3
{
}

- (NSNumber)optInStatus
{
  return self->_optInStatus;
}

- (void)setOptInStatus:(id)a3
{
}

- (NSString)ktApplication
{
  return self->_ktApplication;
}

- (void)setKtApplication:(id)a3
{
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_ktApplication, 0);
  objc_storeStrong((id *)&self->_optInStatus, 0);
  objc_storeStrong((id *)&self->_publicAccountKey, 0);
}

@end