@interface CXAccount
+ (BOOL)supportsSecureCoding;
+ (NSSet)unarchivedObjectClasses;
+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAccount:(id)a3;
- (CXAccount)init;
- (CXAccount)initWithCoder:(id)a3;
- (CXAccount)initWithUUID:(id)a3 description:(id)a4 serviceName:(id)a5 isoCountryCode:(id)a6 handle:(id)a7;
- (CXAccount)initWithUUID:(id)a3 description:(id)a4 serviceName:(id)a5 isoCountryCode:(id)a6 handle:(id)a7 shortLabel:(id)a8;
- (CXHandle)handle;
- (NSString)accountDescription;
- (NSString)isoCountryCode;
- (NSString)serviceName;
- (NSString)shortLabel;
- (NSUUID)UUID;
- (id)archivedDataWithError:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CXAccount

- (CXAccount)init
{
  return 0;
}

- (CXAccount)initWithUUID:(id)a3 description:(id)a4 serviceName:(id)a5 isoCountryCode:(id)a6 handle:(id)a7
{
  return [(CXAccount *)self initWithUUID:a3 description:a4 serviceName:a5 isoCountryCode:a6 handle:a7 shortLabel:&stru_1EFC26730];
}

- (CXAccount)initWithUUID:(id)a3 description:(id)a4 serviceName:(id)a5 isoCountryCode:(id)a6 handle:(id)a7 shortLabel:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v31.receiver = self;
  v31.super_class = (Class)CXAccount;
  v21 = [(CXAccount *)&v31 init];
  if (v21)
  {
    if (v15)
    {
      if (v16) {
        goto LABEL_4;
      }
    }
    else
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXAccount initWithUUID:description:serviceName:isoCountryCode:handle:shortLabel:]", @"UUID" format];
      if (v16)
      {
LABEL_4:
        if (v17) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXAccount initWithUUID:description:serviceName:isoCountryCode:handle:shortLabel:]", @"description" format];
    if (v17)
    {
LABEL_5:
      if (v18) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_11:
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXAccount initWithUUID:description:serviceName:isoCountryCode:handle:shortLabel:]", @"serviceName" format];
    if (v18)
    {
LABEL_6:
      if (v20)
      {
LABEL_7:
        objc_storeStrong((id *)&v21->_UUID, a3);
        uint64_t v22 = [v16 copy];
        accountDescription = v21->_accountDescription;
        v21->_accountDescription = (NSString *)v22;

        uint64_t v24 = [v17 copy];
        serviceName = v21->_serviceName;
        v21->_serviceName = (NSString *)v24;

        uint64_t v26 = [v18 copy];
        isoCountryCode = v21->_isoCountryCode;
        v21->_isoCountryCode = (NSString *)v26;

        objc_storeStrong((id *)&v21->_handle, a7);
        uint64_t v28 = [v20 copy];
        shortLabel = v21->_shortLabel;
        v21->_shortLabel = (NSString *)v28;

        goto LABEL_8;
      }
LABEL_13:
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXAccount initWithUUID:description:serviceName:isoCountryCode:handle:shortLabel:]", @"shortLabel" format];
      goto LABEL_7;
    }
LABEL_12:
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXAccount initWithUUID:description:serviceName:isoCountryCode:handle:shortLabel:]", @"isoCountryCode" format];
    if (v20) {
      goto LABEL_7;
    }
    goto LABEL_13;
  }
LABEL_8:

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(CXAccount *)self UUID];
  v6 = [(CXAccount *)self accountDescription];
  v7 = [(CXAccount *)self serviceName];
  v8 = [(CXAccount *)self isoCountryCode];
  v9 = [(CXAccount *)self handle];
  v10 = (void *)[v4 initWithUUID:v5 description:v6 serviceName:v7 isoCountryCode:v8 handle:v9];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXAccount)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CXAccount;
  v5 = [(CXAccount *)&v31 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_accountDescription);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    accountDescription = v5->_accountDescription;
    v5->_accountDescription = (NSString *)v8;

    uint64_t v10 = objc_opt_class();
    v11 = NSStringFromSelector(sel_handle);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    handle = v5->_handle;
    v5->_handle = (CXHandle *)v12;

    uint64_t v14 = objc_opt_class();
    id v15 = NSStringFromSelector(sel_isoCountryCode);
    uint64_t v16 = [v4 decodeObjectOfClass:v14 forKey:v15];
    isoCountryCode = v5->_isoCountryCode;
    v5->_isoCountryCode = (NSString *)v16;

    uint64_t v18 = objc_opt_class();
    id v19 = NSStringFromSelector(sel_serviceName);
    uint64_t v20 = [v4 decodeObjectOfClass:v18 forKey:v19];
    serviceName = v5->_serviceName;
    v5->_serviceName = (NSString *)v20;

    uint64_t v22 = objc_opt_class();
    v23 = NSStringFromSelector(sel_UUID);
    uint64_t v24 = [v4 decodeObjectOfClass:v22 forKey:v23];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v24;

    uint64_t v26 = objc_opt_class();
    v27 = NSStringFromSelector(sel_shortLabel);
    uint64_t v28 = [v4 decodeObjectOfClass:v26 forKey:v27];
    shortLabel = v5->_shortLabel;
    v5->_shortLabel = (NSString *)v28;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CXAccount *)self accountDescription];
  uint64_t v6 = NSStringFromSelector(sel_accountDescription);
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(CXAccount *)self handle];
  uint64_t v8 = NSStringFromSelector(sel_handle);
  [v4 encodeObject:v7 forKey:v8];

  v9 = [(CXAccount *)self isoCountryCode];
  uint64_t v10 = NSStringFromSelector(sel_isoCountryCode);
  [v4 encodeObject:v9 forKey:v10];

  v11 = [(CXAccount *)self serviceName];
  uint64_t v12 = NSStringFromSelector(sel_serviceName);
  [v4 encodeObject:v11 forKey:v12];

  v13 = [(CXAccount *)self UUID];
  uint64_t v14 = NSStringFromSelector(sel_UUID);
  [v4 encodeObject:v13 forKey:v14];

  id v16 = [(CXAccount *)self shortLabel];
  id v15 = NSStringFromSelector(sel_shortLabel);
  [v4 encodeObject:v16 forKey:v15];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@ %p ", objc_opt_class(), self];
  id v4 = NSStringFromSelector(sel_UUID);
  v5 = [(CXAccount *)self UUID];
  [v3 appendFormat:@"%@=%@", v4, v5];

  [v3 appendFormat:@", "];
  uint64_t v6 = NSStringFromSelector(sel_isoCountryCode);
  v7 = [(CXAccount *)self isoCountryCode];
  [v3 appendFormat:@"%@=%@", v6, v7];

  [v3 appendFormat:@", "];
  uint64_t v8 = NSStringFromSelector(sel_accountDescription);
  v9 = [(CXAccount *)self accountDescription];
  [v3 appendFormat:@"%@=%@", v8, v9];

  [v3 appendFormat:@", "];
  uint64_t v10 = NSStringFromSelector(sel_shortLabel);
  v11 = [(CXAccount *)self shortLabel];
  [v3 appendFormat:@"%@=%@", v10, v11];

  [v3 appendFormat:@", "];
  uint64_t v12 = NSStringFromSelector(sel_serviceName);
  v13 = [(CXAccount *)self serviceName];
  [v3 appendFormat:@"%@=%@", v12, v13];

  [v3 appendFormat:@", "];
  uint64_t v14 = NSStringFromSelector(sel_handle);
  id v15 = [(CXAccount *)self handle];
  [v3 appendFormat:@"%@=%@", v14, v15];

  [v3 appendFormat:@">"];
  id v16 = (void *)[v3 copy];

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(CXAccount *)self isEqualToAccount:v4];

  return v5;
}

- (unint64_t)hash
{
  id v3 = [(CXAccount *)self accountDescription];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(CXAccount *)self isoCountryCode];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(CXAccount *)self handle];
  uint64_t v8 = [v7 hash];
  v9 = [(CXAccount *)self serviceName];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v11 = [(CXAccount *)self UUID];
  uint64_t v12 = [v11 hash];
  v13 = [(CXAccount *)self shortLabel];
  unint64_t v14 = v10 ^ v12 ^ [v13 hash];

  return v14;
}

- (BOOL)isEqualToAccount:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CXAccount *)self accountDescription];
  uint64_t v6 = [v4 accountDescription];
  if ([v5 isEqualToString:v6])
  {
    v7 = [(CXAccount *)self isoCountryCode];
    uint64_t v8 = [v4 isoCountryCode];
    if ([v7 isEqualToString:v8])
    {
      uint64_t v9 = [(CXAccount *)self handle];
      uint64_t v10 = [v4 handle];
      if (v9 | v10 && ![(id)v9 isEqual:v10])
      {
        char v15 = 0;
      }
      else
      {
        v11 = [(CXAccount *)self serviceName];
        uint64_t v12 = [v4 serviceName];
        if ([v11 isEqualToString:v12])
        {
          id v19 = v11;
          v13 = [(CXAccount *)self UUID];
          [v4 UUID];
          uint64_t v18 = v20 = v13;
          if (objc_msgSend(v13, "isEqual:"))
          {
            unint64_t v14 = [(CXAccount *)self shortLabel];
            id v17 = [v4 shortLabel];
            char v15 = [v14 isEqual:v17];
          }
          else
          {
            char v15 = 0;
          }
          v11 = v19;
        }
        else
        {
          char v15 = 0;
        }
      }
    }
    else
    {
      char v15 = 0;
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (id)archivedDataWithError:(id *)a3
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:a3];
}

+ (NSSet)unarchivedObjectClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  return (NSSet *)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, objc_opt_class(), 0);
}

+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F28DC0];
  id v7 = a3;
  uint64_t v8 = [a1 unarchivedObjectClasses];
  uint64_t v9 = [v6 unarchivedObjectOfClasses:v8 fromData:v7 error:a4];

  return v9;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSString)accountDescription
{
  return self->_accountDescription;
}

- (NSString)shortLabel
{
  return self->_shortLabel;
}

- (CXHandle)handle
{
  return self->_handle;
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_shortLabel, 0);
  objc_storeStrong((id *)&self->_accountDescription, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

@end