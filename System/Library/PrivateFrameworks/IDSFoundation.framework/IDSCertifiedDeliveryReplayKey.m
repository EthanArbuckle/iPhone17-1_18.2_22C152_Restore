@interface IDSCertifiedDeliveryReplayKey
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToReplayKey:(id)a3;
- (IDSCertifiedDeliveryReplayKey)initWithCoder:(id)a3;
- (IDSCertifiedDeliveryReplayKey)initWithHash:(id)a3;
- (IDSCertifiedDeliveryReplayKey)initWithPayload:(id)a3 legacyIdentity:(id)a4;
- (NSData)payloadHash;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setPayloadHash:(id)a3;
@end

@implementation IDSCertifiedDeliveryReplayKey

- (IDSCertifiedDeliveryReplayKey)initWithPayload:(id)a3 legacyIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)IDSCertifiedDeliveryReplayKey;
  v9 = [(IDSCertifiedDeliveryReplayKey *)&v28 init];
  if (!v9) {
    goto LABEL_7;
  }
  if (v7)
  {
    id v27 = 0;
    v11 = objc_msgSend_protectedHashOfMessageData_error_(v7, v8, (uint64_t)v6, v10, &v27);
    id v12 = v27;
    uint64_t v16 = objc_msgSend_copy(v11, v13, v14, v15);
  }
  else
  {
    v11 = objc_msgSend_computeHashForMessage_(IDSNGMMessageHasher, v8, (uint64_t)v6, v10);
    uint64_t v16 = objc_msgSend_copy(v11, v17, v18, v19);
    id v12 = 0;
  }
  payloadHash = v9->_payloadHash;
  v9->_payloadHash = (NSData *)v16;

  if (v9->_payloadHash)
  {

LABEL_7:
    v24 = v9;
    goto LABEL_11;
  }
  v25 = objc_msgSend_delivery(IDSFoundationLog, v21, v22, v23);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
    sub_19DB7DEA4(v7 == 0, (uint64_t)v12, v25);
  }

  v24 = 0;
LABEL_11:

  return v24;
}

- (IDSCertifiedDeliveryReplayKey)initWithHash:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IDSCertifiedDeliveryReplayKey;
  id v6 = [(IDSCertifiedDeliveryReplayKey *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    if (!v5)
    {
      v8 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v6->_payloadHash, a3);
  }
  v8 = v7;
LABEL_6:

  return v8;
}

- (BOOL)isEqualToReplayKey:(id)a3
{
  id v5 = objc_msgSend_payloadHash(a3, a2, (uint64_t)a3, v3);
  LOBYTE(self) = objc_msgSend_isEqual_(v5, v6, (uint64_t)self->_payloadHash, v7);

  return (char)self;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char isEqualToReplayKey = objc_msgSend_isEqualToReplayKey_(self, v5, (uint64_t)v4, v6);
  }
  else {
    char isEqualToReplayKey = 0;
  }

  return isEqualToReplayKey;
}

- (unint64_t)hash
{
  return objc_msgSend_hash(self->_payloadHash, a2, v2, v3);
}

- (id)description
{
  double v3 = NSString;
  uint64_t v4 = objc_opt_class();
  return (id)objc_msgSend_stringWithFormat_(v3, v5, @"<%@: %p { hash: %@ }>", v6, v4, self, self->_payloadHash);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSCertifiedDeliveryReplayKey)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, @"hash");

  v11 = (IDSCertifiedDeliveryReplayKey *)objc_msgSend_initWithHash_(self, v9, (uint64_t)v8, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_payloadHash, v3, @"hash");
}

- (NSData)payloadHash
{
  return self->_payloadHash;
}

- (void)setPayloadHash:(id)a3
{
}

- (void).cxx_destruct
{
}

@end