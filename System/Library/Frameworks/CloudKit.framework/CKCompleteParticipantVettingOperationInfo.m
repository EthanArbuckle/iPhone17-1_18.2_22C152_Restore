@interface CKCompleteParticipantVettingOperationInfo
+ (BOOL)supportsSecureCoding;
- (CKCompleteParticipantVettingOperationInfo)initWithCoder:(id)a3;
- (NSData)encryptedKey;
- (NSString)baseToken;
- (NSString)displayedHostname;
- (NSString)routingKey;
- (NSString)vettingEmail;
- (NSString)vettingPhone;
- (NSString)vettingToken;
- (void)encodeWithCoder:(id)a3;
- (void)setBaseToken:(id)a3;
- (void)setDisplayedHostname:(id)a3;
- (void)setEncryptedKey:(id)a3;
- (void)setRoutingKey:(id)a3;
- (void)setVettingEmail:(id)a3;
- (void)setVettingPhone:(id)a3;
- (void)setVettingToken:(id)a3;
@end

@implementation CKCompleteParticipantVettingOperationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x18C12ADA0]();
  v9 = objc_msgSend_vettingToken(self, v6, v7, v8);
  objc_msgSend_encodeObject_forKey_(v4, v10, (uint64_t)v9, @"VettingToken");

  v14 = objc_msgSend_vettingEmail(self, v11, v12, v13);
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v14, @"VettingEmail");

  v19 = objc_msgSend_vettingPhone(self, v16, v17, v18);
  objc_msgSend_encodeObject_forKey_(v4, v20, (uint64_t)v19, @"VettingPhone");

  v24 = objc_msgSend_routingKey(self, v21, v22, v23);
  objc_msgSend_encodeObject_forKey_(v4, v25, (uint64_t)v24, @"RoutingKey");

  v29 = objc_msgSend_encryptedKey(self, v26, v27, v28);
  objc_msgSend_encodeObject_forKey_(v4, v30, (uint64_t)v29, @"EncryptedKey");

  v34 = objc_msgSend_baseToken(self, v31, v32, v33);
  objc_msgSend_encodeObject_forKey_(v4, v35, (uint64_t)v34, @"BaseToken");

  v36.receiver = self;
  v36.super_class = (Class)CKCompleteParticipantVettingOperationInfo;
  [(CKOperationInfo *)&v36 encodeWithCoder:v4];
}

- (CKCompleteParticipantVettingOperationInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)CKCompleteParticipantVettingOperationInfo;
  v5 = [(CKOperationInfo *)&v32 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"VettingToken");
    vettingToken = v5->_vettingToken;
    v5->_vettingToken = (NSString *)v9;

    uint64_t v11 = objc_opt_class();
    uint64_t v13 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"VettingEmail");
    vettingEmail = v5->_vettingEmail;
    v5->_vettingEmail = (NSString *)v13;

    uint64_t v15 = objc_opt_class();
    uint64_t v17 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v16, v15, @"VettingPhone");
    vettingPhone = v5->_vettingPhone;
    v5->_vettingPhone = (NSString *)v17;

    uint64_t v19 = objc_opt_class();
    uint64_t v21 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v20, v19, @"RoutingKey");
    routingKey = v5->_routingKey;
    v5->_routingKey = (NSString *)v21;

    uint64_t v23 = objc_opt_class();
    uint64_t v25 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v24, v23, @"EncryptedKey");
    encryptedKey = v5->_encryptedKey;
    v5->_encryptedKey = (NSData *)v25;

    uint64_t v27 = objc_opt_class();
    uint64_t v29 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v28, v27, @"BaseToken");
    baseToken = v5->_baseToken;
    v5->_baseToken = (NSString *)v29;
  }

  return v5;
}

- (NSString)vettingToken
{
  return self->_vettingToken;
}

- (void)setVettingToken:(id)a3
{
}

- (NSString)vettingEmail
{
  return self->_vettingEmail;
}

- (void)setVettingEmail:(id)a3
{
}

- (NSString)vettingPhone
{
  return self->_vettingPhone;
}

- (void)setVettingPhone:(id)a3
{
}

- (NSString)routingKey
{
  return self->_routingKey;
}

- (void)setRoutingKey:(id)a3
{
}

- (NSData)encryptedKey
{
  return self->_encryptedKey;
}

- (void)setEncryptedKey:(id)a3
{
}

- (NSString)baseToken
{
  return self->_baseToken;
}

- (void)setBaseToken:(id)a3
{
}

- (NSString)displayedHostname
{
  return self->_displayedHostname;
}

- (void)setDisplayedHostname:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedHostname, 0);
  objc_storeStrong((id *)&self->_baseToken, 0);
  objc_storeStrong((id *)&self->_encryptedKey, 0);
  objc_storeStrong((id *)&self->_routingKey, 0);
  objc_storeStrong((id *)&self->_vettingPhone, 0);
  objc_storeStrong((id *)&self->_vettingEmail, 0);

  objc_storeStrong((id *)&self->_vettingToken, 0);
}

@end