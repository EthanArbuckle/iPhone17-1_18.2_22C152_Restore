@interface IDSEndpointTransparencyState
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEndpointTransparencyState:(id)a3;
- (IDSEndpointTransparencyState)initWithCoder:(id)a3;
- (IDSEndpointTransparencyState)initWithPushToken:(id)a3 verificationState:(int64_t)a4;
- (NSData)pushToken;
- (id)description;
- (int64_t)verificationState;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSEndpointTransparencyState

- (IDSEndpointTransparencyState)initWithPushToken:(id)a3 verificationState:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IDSEndpointTransparencyState;
  v8 = [(IDSEndpointTransparencyState *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_pushToken, a3);
    v9->_verificationState = a4;
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v8 = objc_msgSend_pushToken(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_verificationState(self, v9, v10, v11);
  if ((unint64_t)(v12 + 1) > 2) {
    objc_msgSend_stringWithFormat_(v3, v13, @"<%@: %p pushToken: %@, verificationState: %@>", v14, v4, self, v8, @"Unknown");
  }
  else {
  v15 = objc_msgSend_stringWithFormat_(v3, v13, @"<%@: %p pushToken: %@, verificationState: %@>", v14, v4, self, v8, off_1E5975C90[v12 + 1]);
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char isEqualToEndpointTransparencyState = objc_msgSend_isEqualToEndpointTransparencyState_(self, v5, (uint64_t)v4, v6);
  }
  else {
    char isEqualToEndpointTransparencyState = 0;
  }

  return isEqualToEndpointTransparencyState;
}

- (BOOL)isEqualToEndpointTransparencyState:(id)a3
{
  double v6 = (IDSEndpointTransparencyState *)a3;
  uint64_t v10 = v6;
  if (self == v6)
  {
    BOOL v24 = 1;
  }
  else
  {
    if (v6)
    {
      double v11 = objc_msgSend_pushToken(self, v7, v8, v9);
      v17 = objc_msgSend_pushToken(v10, v12, v13, v14);
      if (v11 == v17
        || (objc_msgSend_pushToken(self, v15, v16, v18),
            v3 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend_pushToken(v10, v19, v20, v21),
            id v4 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend_isEqual_(v3, v22, (uint64_t)v4, v23)))
      {
        uint64_t v25 = objc_msgSend_verificationState(self, v15, v16, v18);
        BOOL v24 = v25 == objc_msgSend_verificationState(v10, v26, v27, v28);
        if (v11 == v17)
        {
LABEL_10:

          goto LABEL_11;
        }
      }
      else
      {
        BOOL v24 = 0;
      }

      goto LABEL_10;
    }
    BOOL v24 = 0;
  }
LABEL_11:

  return v24;
}

- (unint64_t)hash
{
  id v4 = objc_msgSend_pushToken(self, a2, v2, v3);
  unint64_t v8 = objc_msgSend_hash(v4, v5, v6, v7);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSEndpointTransparencyState)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  unint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, @"PushToken");
  uint64_t v9 = objc_opt_class();
  uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, v11, @"VerificationState");

  uint64_t v16 = objc_msgSend_integerValue(v12, v13, v14, v15);
  v19 = (IDSEndpointTransparencyState *)objc_msgSend_initWithPushToken_verificationState_(self, v17, (uint64_t)v8, v18, v16);

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v8 = objc_msgSend_pushToken(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, v10, @"PushToken");

  double v11 = NSNumber;
  uint64_t v15 = objc_msgSend_verificationState(self, v12, v13, v14);
  objc_msgSend_numberWithInteger_(v11, v16, v15, v17);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v18, (uint64_t)v20, v19, @"VerificationState");
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (int64_t)verificationState
{
  return self->_verificationState;
}

- (void).cxx_destruct
{
}

@end