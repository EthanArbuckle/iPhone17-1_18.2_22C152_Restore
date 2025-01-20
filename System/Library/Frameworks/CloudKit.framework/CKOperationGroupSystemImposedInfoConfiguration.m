@interface CKOperationGroupSystemImposedInfoConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsCellularAccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUplink;
- (CKOperationGroupSystemImposedInfoConfiguration)initWithCoder:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowsCellularAccess:(BOOL)a3;
- (void)setIsUplink:(BOOL)a3;
@end

@implementation CKOperationGroupSystemImposedInfoConfiguration

- (BOOL)isEqual:(id)a3
{
  v4 = (CKOperationGroupSystemImposedInfoConfiguration *)a3;
  if (self == v4)
  {
    LOBYTE(v16) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int isUplink = objc_msgSend_isUplink(v5, v6, v7, v8);
      if (isUplink == objc_msgSend_isUplink(self, v10, v11, v12))
      {
        int v17 = objc_msgSend_allowsCellularAccess(v5, v13, v14, v15);
        int v16 = v17 ^ objc_msgSend_allowsCellularAccess(self, v18, v19, v20) ^ 1;
      }
      else
      {
        LOBYTE(v16) = 0;
      }
    }
    else
    {
      LOBYTE(v16) = 0;
    }
  }

  return v16;
}

- (unint64_t)hash
{
  if (objc_msgSend_isUplink(self, a2, v2, v3)) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 0;
  }
  return v8 | objc_msgSend_allowsCellularAccess(self, v5, v6, v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v15 = a3;
  v4 = (void *)MEMORY[0x18C12ADA0]();
  uint64_t isUplink = objc_msgSend_isUplink(self, v5, v6, v7);
  objc_msgSend_encodeBool_forKey_(v15, v9, isUplink, @"IsUplink");
  uint64_t v13 = objc_msgSend_allowsCellularAccess(self, v10, v11, v12);
  objc_msgSend_encodeBool_forKey_(v15, v14, v13, @"AllowsCellularAccess");
}

- (CKOperationGroupSystemImposedInfoConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKOperationGroupSystemImposedInfoConfiguration;
  v5 = [(CKOperationGroupSystemImposedInfoConfiguration *)&v12 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x18C12ADA0]();
    v5->_uint64_t isUplink = objc_msgSend_decodeBoolForKey_(v4, v7, @"IsUplink", v8);
    v5->_allowsCellularAccess = objc_msgSend_decodeBoolForKey_(v4, v9, @"AllowsCellularAccess", v10);
  }

  return v5;
}

- (BOOL)isUplink
{
  return self->_isUplink;
}

- (void)setIsUplink:(BOOL)a3
{
  self->_uint64_t isUplink = a3;
}

- (BOOL)allowsCellularAccess
{
  return self->_allowsCellularAccess;
}

- (void)setAllowsCellularAccess:(BOOL)a3
{
  self->_allowsCellularAccess = a3;
}

@end