@interface CKServerChangeToken
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (CKServerChangeToken)init;
- (CKServerChangeToken)initWithCoder:(id)a3;
- (CKServerChangeToken)initWithData:(id)a3;
- (NSData)data;
- (id)CKPropertiesDescription;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setData_modelMutation:(id)a3;
@end

@implementation CKServerChangeToken

+ (void)initialize
{
  v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = self;

  sub_18AF14F44(v3, v2, 0, 0, 0);
}

- (CKServerChangeToken)init
{
  v2 = [CKException alloc];
  uint64_t v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id v6 = (id)objc_msgSend_initWithCode_format_(v2, v5, 12, @"You can't call init on %@", v4);

  objc_exception_throw(v6);
}

- (CKServerChangeToken)initWithData:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKServerChangeToken;
  v8 = [(CKServerChangeToken *)&v12 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend_copy(v4, v5, v6, v7);
    data = v8->_data;
    v8->_data = (NSData *)v9;
  }
  return v8;
}

- (void)setData_modelMutation:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  id v4 = (void *)MEMORY[0x18C12ADA0]();
  v8 = objc_msgSend_data(self, v5, v6, v7);
  objc_msgSend_encodeObject_forKey_(v10, v9, (uint64_t)v8, @"ChangeTokenData");
}

- (CKServerChangeToken)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKServerChangeToken;
  v5 = [(CKServerChangeToken *)&v12 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x18C12ADA0]();
    uint64_t v7 = objc_opt_class();
    uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"ChangeTokenData");
    data = v5->_data;
    v5->_data = (NSData *)v9;
  }

  return v5;
}

- (id)CKPropertiesDescription
{
  id v4 = NSString;
  v5 = objc_msgSend_data(self, a2, v2, v3);
  v8 = objc_msgSend_base64EncodedStringWithOptions_(v5, v6, 0, v7);
  v11 = objc_msgSend_stringWithFormat_(v4, v9, @"data=%@", v10, v8);

  return v11;
}

- (id)description
{
  return (id)((uint64_t (*)(CKServerChangeToken *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CKServerChangeToken *)a3;
  if (self == v4)
  {
    char v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v9 = objc_msgSend_data(self, v6, v7, v8);
      v13 = objc_msgSend_data(v5, v10, v11, v12);

      char v14 = CKObjectsAreBothNilOrEqual(v9, v13);
    }
    else
    {
      char v14 = 0;
    }
  }

  return v14;
}

- (unint64_t)hash
{
  id v4 = objc_msgSend_data(self, a2, v2, v3);
  unint64_t v8 = objc_msgSend_hash(v4, v5, v6, v7);

  return v8;
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
}

@end