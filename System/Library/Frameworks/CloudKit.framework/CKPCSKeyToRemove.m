@interface CKPCSKeyToRemove
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CKPCSKeyToRemove)initWithCoder:(id)a3;
- (CKPCSKeyToRemove)initWithKeyID:(id)a3 keyType:(int64_t)a4;
- (NSData)pcsKeyID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initInternal;
- (int64_t)keyType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CKPCSKeyToRemove

- (CKPCSKeyToRemove)initWithKeyID:(id)a3 keyType:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKPCSKeyToRemove;
  v8 = [(CKPCSKeyToRemove *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_pcsKeyID, a3);
    v9->_keyType = a4;
  }

  return v9;
}

- (id)initInternal
{
  v6.receiver = self;
  v6.super_class = (Class)CKPCSKeyToRemove;
  v2 = [(CKPCSKeyToRemove *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    pcsKeyID = v2->_pcsKeyID;
    v2->_pcsKeyID = (NSData *)v3;

    v2->_keyType = 2;
  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)
    && (objc_msgSend_pcsKeyID(self, v8, v9, v10),
        objc_super v11 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_pcsKeyID(v4, v12, v13, v14),
        v15 = objc_claimAutoreleasedReturnValue(),
        int isEqual = objc_msgSend_isEqual_(v11, v16, (uint64_t)v15, v17),
        v15,
        v11,
        isEqual))
  {
    uint64_t v22 = objc_msgSend_keyType(self, v19, v20, v21);
    BOOL v26 = v22 == objc_msgSend_keyType(v4, v23, v24, v25);
  }
  else
  {
    BOOL v26 = 0;
  }

  return v26;
}

- (unint64_t)hash
{
  uint64_t v5 = objc_msgSend_pcsKeyID(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  unint64_t v13 = objc_msgSend_keyType(self, v10, v11, v12) ^ v9;

  return v13;
}

- (id)description
{
  v20.receiver = self;
  v20.super_class = (Class)CKPCSKeyToRemove;
  uint64_t v3 = [(CKPCSKeyToRemove *)&v20 description];
  uint64_t v7 = objc_msgSend_pcsKeyID(self, v4, v5, v6);
  uint64_t v11 = objc_msgSend_description(v7, v8, v9, v10);
  uint64_t v15 = objc_msgSend_keyType(self, v12, v13, v14);
  if ((unint64_t)(v15 - 1) > 2) {
    objc_msgSend_stringByAppendingFormat_(v3, v16, @": keyID:%@ keyType:%@", v17, v11, @"INVALID");
  }
  else {
  v18 = objc_msgSend_stringByAppendingFormat_(v3, v16, @": keyID:%@ keyType:%@", v17, v11, off_1E54652E8[v15 - 1]);
  }

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t v8 = objc_msgSend_pcsKeyID(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_copy(v8, v9, v10, v11);
  uint64_t v16 = objc_msgSend_keyType(self, v13, v14, v15);
  v18 = objc_msgSend_initWithKeyID_keyType_(v4, v17, (uint64_t)v12, v16);

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v14 = a3;
  uint64_t v7 = objc_msgSend_pcsKeyID(self, v4, v5, v6);
  objc_msgSend_encodeObject_forKey_(v14, v8, (uint64_t)v7, @"PCSKeyID");

  uint64_t v12 = objc_msgSend_keyType(self, v9, v10, v11);
  objc_msgSend_encodeInteger_forKey_(v14, v13, v12, @"KeyType");
}

- (CKPCSKeyToRemove)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKPCSKeyToRemove;
  uint64_t v5 = [(CKPCSKeyToRemove *)&v13 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"PCSKeyID");
    pcsKeyID = v5->_pcsKeyID;
    v5->_pcsKeyID = (NSData *)v8;

    v5->_keyType = objc_msgSend_decodeIntegerForKey_(v4, v10, @"KeyType", v11);
  }

  return v5;
}

- (int64_t)keyType
{
  return self->_keyType;
}

- (NSData)pcsKeyID
{
  return self->_pcsKeyID;
}

- (void).cxx_destruct
{
}

@end