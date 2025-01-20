@interface IDSPushToken
+ (BOOL)supportsSecureCoding;
+ (IDSPushToken)pushTokenWithData:(id)a3;
+ (IDSPushToken)pushTokenWithData:(id)a3 withServiceLoggingHint:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPushToken:(id)a3;
- (IDSPushToken)initWithCoder:(id)a3;
- (IDSPushToken)initWithData:(id)a3;
- (IDSPushToken)initWithData:(id)a3 withServiceLoggingHint:(id)a4;
- (NSData)rawToken;
- (NSString)serviceLoggingHint;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setServiceLoggingHint:(id)a3;
@end

@implementation IDSPushToken

+ (IDSPushToken)pushTokenWithData:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v8 = objc_msgSend_initWithData_withServiceLoggingHint_(v5, v6, (uint64_t)v4, v7, 0);

  return (IDSPushToken *)v8;
}

+ (IDSPushToken)pushTokenWithData:(id)a3 withServiceLoggingHint:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)a1);
  v11 = objc_msgSend_initWithData_withServiceLoggingHint_(v8, v9, (uint64_t)v7, v10, v6);

  return (IDSPushToken *)v11;
}

- (IDSPushToken)initWithData:(id)a3
{
  return (IDSPushToken *)objc_msgSend_initWithData_withServiceLoggingHint_(self, a2, (uint64_t)a3, v3, 0);
}

- (IDSPushToken)initWithData:(id)a3 withServiceLoggingHint:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v13.receiver = self;
    v13.super_class = (Class)IDSPushToken;
    v9 = [(IDSPushToken *)&v13 init];
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_rawToken, a3);
      objc_storeStrong(p_isa + 2, a4);
    }
    self = p_isa;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isEqualToPushToken:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v5 = objc_msgSend_rawToken(a3, a2, (uint64_t)a3, v3);
  v9 = objc_msgSend_rawToken(self, v6, v7, v8);
  char isEqualToData = objc_msgSend_isEqualToData_(v5, v10, (uint64_t)v9, v11);

  return isEqualToData;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char isEqualToPushToken = objc_msgSend_isEqualToPushToken_(self, v5, (uint64_t)v4, v6);
  }
  else {
    char isEqualToPushToken = 0;
  }

  return isEqualToPushToken;
}

- (unint64_t)hash
{
  id v4 = objc_msgSend_rawToken(self, a2, v2, v3);
  unint64_t v8 = objc_msgSend_hash(v4, v5, v6, v7);

  return v8;
}

- (id)description
{
  double v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = IDSLoggableDescriptionForTokenOnService(self->_rawToken, self->_serviceLoggingHint);
  unint64_t v8 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: %@>", v7, v4, v5);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSPushToken)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  unint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, v7, @"rawToken");
  uint64_t v9 = objc_opt_class();
  v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, v11, @"serviceHint");

  v15 = (IDSPushToken *)objc_msgSend_initWithData_withServiceLoggingHint_(self, v13, (uint64_t)v8, v14, v12);
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v8 = objc_msgSend_rawToken(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, v10, @"rawToken");

  objc_msgSend_serviceLoggingHint(self, v11, v12, v13);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)v16, v15, @"serviceHint");
}

- (NSData)rawToken
{
  return self->_rawToken;
}

- (NSString)serviceLoggingHint
{
  return self->_serviceLoggingHint;
}

- (void)setServiceLoggingHint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceLoggingHint, 0);
  objc_storeStrong((id *)&self->_rawToken, 0);
}

@end