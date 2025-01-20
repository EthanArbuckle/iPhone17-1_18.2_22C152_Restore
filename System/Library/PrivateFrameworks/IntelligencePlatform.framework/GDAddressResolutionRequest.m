@interface GDAddressResolutionRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAddressResolutionRequest:(id)a3;
- (GDAddressResolutionRequest)initWithAddressString:(id)a3;
- (GDAddressResolutionRequest)initWithCoder:(id)a3;
- (NSString)addressString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GDAddressResolutionRequest

- (void).cxx_destruct
{
}

- (NSString)addressString
{
  return self->_addressString;
}

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"<GDAddressResolutionRequest: addressString: %@>", v2, v3, self->_addressString);
}

- (unint64_t)hash
{
  return objc_msgSend_hash(self->_addressString, a2, v2, v3, v4);
}

- (BOOL)isEqualToAddressResolutionRequest:(id)a3
{
  uint64_t v4 = (GDAddressResolutionRequest *)a3;
  v9 = v4;
  if (v4 == self)
  {
    char isEqualToString = 1;
  }
  else if (v4)
  {
    addressString = self->_addressString;
    v11 = objc_msgSend_addressString(v4, v5, v6, v7, v8);
    char isEqualToString = objc_msgSend_isEqualToString_(addressString, v12, (uint64_t)v11, v13, v14);
  }
  else
  {
    char isEqualToString = 0;
  }

  return isEqualToString;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (GDAddressResolutionRequest *)a3;
  if (v4 == self)
  {
    char isEqualToAddressResolutionRequest = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char isEqualToAddressResolutionRequest = objc_msgSend_isEqualToAddressResolutionRequest_(self, v5, (uint64_t)v4, v6, v7);
    }
    else {
      char isEqualToAddressResolutionRequest = 0;
    }
  }

  return isEqualToAddressResolutionRequest;
}

- (GDAddressResolutionRequest)initWithAddressString:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GDAddressResolutionRequest;
  uint64_t v6 = [(GDAddressResolutionRequest *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_addressString, a3);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v6 = objc_msgSend_allocWithZone_(GDAddressResolutionRequest, a2, (uint64_t)a3, v3, v4);
  addressString = self->_addressString;

  return (id)objc_msgSend_initWithAddressString_(v6, v7, (uint64_t)addressString, v8, v9);
}

- (GDAddressResolutionRequest)initWithCoder:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector(sel_addressString);
  uint64_t v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, (uint64_t)v6, v8);

  if (v9)
  {
    self = (GDAddressResolutionRequest *)(id)objc_msgSend_initWithAddressString_(self, v10, (uint64_t)v9, v12, v13);
    uint64_t v14 = self;
  }
  else
  {
    v15 = objc_msgSend_error(v4, v10, v11, v12, v13);

    if (!v15)
    {
      v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = *MEMORY[0x1E4F28568];
      v26[0] = @"GDAddressResolutionRequest addressString could not be decoded";
      v18 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v16, (uint64_t)v26, (uint64_t)&v25, 1);
      v20 = objc_msgSend_errorWithDomain_code_userInfo_(v17, v19, @"GDErrorDomain", 9, (uint64_t)v18);
      objc_msgSend_failWithError_(v4, v21, (uint64_t)v20, v22, v23);
    }
    uint64_t v14 = 0;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  addressString = self->_addressString;
  id v4 = a3;
  NSStringFromSelector(sel_addressString);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v5, (uint64_t)addressString, (uint64_t)v7, v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end