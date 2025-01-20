@interface SecureBackupBeginPasscodeRequestResults
+ (BOOL)supportsSecureCoding;
- (NSData)cert;
- (NSString)dsid;
- (NSString)escrowFederation;
- (NSString)iCloudEnvironment;
- (NSString)uuid;
- (SecureBackupBeginPasscodeRequestResults)initWithCoder:(id)a3;
- (SecureBackupBeginPasscodeRequestResults)initWithStoredCertificate:(id)a3 uuid:(id)a4;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SecureBackupBeginPasscodeRequestResults

- (SecureBackupBeginPasscodeRequestResults)initWithStoredCertificate:(id)a3 uuid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)SecureBackupBeginPasscodeRequestResults;
  v10 = [(SecureBackupBeginPasscodeRequestResults *)&v26 init];
  if (v10)
  {
    uint64_t v11 = objc_msgSend_iCloudEnvironment(v6, v8, v9);
    iCloudEnvironment = v10->_iCloudEnvironment;
    v10->_iCloudEnvironment = (NSString *)v11;

    uint64_t v15 = objc_msgSend_escrowBaseURL(v6, v13, v14);
    escrowFederation = v10->_escrowFederation;
    v10->_escrowFederation = (NSString *)v15;

    uint64_t v19 = objc_msgSend_escrowCertificate(v6, v17, v18);
    cert = v10->_cert;
    v10->_cert = (NSData *)v19;

    uint64_t v23 = objc_msgSend_dsid(v6, v21, v22);
    dsid = v10->_dsid;
    v10->_dsid = (NSString *)v23;

    objc_storeStrong((id *)&v10->_uuid, a4);
  }

  return v10;
}

- (id)description
{
  v4 = NSString;
  v5 = objc_msgSend_uuid(self, a2, v2);
  v8 = objc_msgSend_iCloudEnvironment(self, v6, v7);
  uint64_t v11 = objc_msgSend_escrowFederation(self, v9, v10);
  uint64_t v14 = objc_msgSend_cert(self, v12, v13);
  v16 = objc_msgSend_base64EncodedStringWithOptions_(v14, v15, 0);
  uint64_t v19 = objc_msgSend_dsid(self, v17, v18);
  v21 = objc_msgSend_stringWithFormat_(v4, v20, @"<SBBPRR: %@ %@ %@ %@ %@>", v5, v8, v11, v16, v19);

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_iCloudEnvironment(self, v5, v6);
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)v7, @"iCloudEnvironment");

  uint64_t v11 = objc_msgSend_escrowFederation(self, v9, v10);
  objc_msgSend_encodeObject_forKey_(v4, v12, (uint64_t)v11, @"escrowFederation");

  uint64_t v15 = objc_msgSend_cert(self, v13, v14);
  objc_msgSend_encodeObject_forKey_(v4, v16, (uint64_t)v15, @"cert");

  objc_msgSend_dsid(self, v17, v18);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v19, (uint64_t)v20, @"dsid");
}

- (SecureBackupBeginPasscodeRequestResults)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SecureBackupBeginPasscodeRequestResults;
  v5 = [(SecureBackupBeginPasscodeRequestResults *)&v23 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"iCloudEnvironment");
    iCloudEnvironment = v5->_iCloudEnvironment;
    v5->_iCloudEnvironment = (NSString *)v8;

    uint64_t v10 = objc_opt_class();
    uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v10, @"escrowFederation");
    escrowFederation = v5->_escrowFederation;
    v5->_escrowFederation = (NSString *)v12;

    uint64_t v14 = objc_opt_class();
    uint64_t v16 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v15, v14, @"cert");
    cert = v5->_cert;
    v5->_cert = (NSData *)v16;

    uint64_t v18 = objc_opt_class();
    uint64_t v20 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v18, @"dsid");
    dsid = v5->_dsid;
    v5->_dsid = (NSString *)v20;
  }
  return v5;
}

- (NSString)iCloudEnvironment
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)escrowFederation
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)cert
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)dsid
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_cert, 0);
  objc_storeStrong((id *)&self->_escrowFederation, 0);

  objc_storeStrong((id *)&self->_iCloudEnvironment, 0);
}

@end