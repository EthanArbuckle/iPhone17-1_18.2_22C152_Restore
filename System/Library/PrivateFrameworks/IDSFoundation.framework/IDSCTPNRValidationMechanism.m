@interface IDSCTPNRValidationMechanism
+ (id)SMSLessMechanism;
+ (id)SMSMechanismWithContext:(id)a3;
+ (id)mechanismStringForMechanism:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (IDSCTPNRValidationMechanism)initWithType:(int64_t)a3 context:(id)a4;
- (NSString)context;
- (id)description;
- (int64_t)type;
- (unint64_t)hash;
@end

@implementation IDSCTPNRValidationMechanism

+ (id)SMSMechanismWithContext:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v8 = objc_msgSend_initWithType_context_(v5, v6, 1, v7, v4);

  return v8;
}

+ (id)SMSLessMechanism
{
  id v2 = objc_alloc((Class)a1);
  id v5 = objc_msgSend_initWithType_context_(v2, v3, 2, v4, 0);
  return v5;
}

+ (id)mechanismStringForMechanism:(int64_t)a3
{
  v3 = @"Unknown";
  if (a3 == 2) {
    v3 = @"SMSLess";
  }
  if (a3 == 1) {
    return @"SMS";
  }
  else {
    return v3;
  }
}

- (IDSCTPNRValidationMechanism)initWithType:(int64_t)a3 context:(id)a4
{
  id v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)IDSCTPNRValidationMechanism;
  double v7 = [(IDSCTPNRValidationMechanism *)&v15 init];
  v11 = v7;
  if (v7)
  {
    v7->_type = a3;
    uint64_t v12 = objc_msgSend_copy(v6, v8, v9, v10);
    context = v11->_context;
    v11->_context = (NSString *)v12;
  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v9 = objc_msgSend_type(self, v6, v7, v8);
    uint64_t v13 = objc_msgSend_type(v5, v10, v11, v12);
    v17 = objc_msgSend_context(self, v14, v15, v16);
    v23 = objc_msgSend_context(v5, v18, v19, v20);
    if (v17 == v23)
    {
      char isEqual = 1;
    }
    else
    {
      v25 = objc_msgSend_context(self, v21, v22, v24);
      v29 = objc_msgSend_context(v5, v26, v27, v28);
      char isEqual = objc_msgSend_isEqual_(v25, v30, (uint64_t)v29, v31);
    }
    if (v9 == v13) {
      BOOL v33 = isEqual;
    }
    else {
      BOOL v33 = 0;
    }
  }
  else
  {
    BOOL v33 = 0;
  }

  return v33;
}

- (unint64_t)hash
{
  id v5 = objc_msgSend_context(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(v5, v6, v7, v8);
  unint64_t v13 = objc_msgSend_type(self, v10, v11, v12) ^ v9;

  return v13;
}

- (id)description
{
  unint64_t v5 = objc_msgSend_type(self, a2, v2, v3);
  if (v5 > 2) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = off_1E59753E8[v5];
  }
  double v10 = NSString;
  uint64_t v11 = objc_msgSend_context(self, v6, v7, v8);
  v14 = objc_msgSend_stringWithFormat_(v10, v12, @"IDSCTPRNValidationMechanism { Type: %@, Context: %@ }", v13, v9, v11);

  return v14;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)context
{
  return self->_context;
}

- (void).cxx_destruct
{
}

@end