@interface CXSenderIdentity
+ (BOOL)supportsSecureCoding;
+ (id)unarchivedObjectClasses;
+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSenderIdentity:(id)a3;
- (CXAccount)account;
- (CXHandle)handle;
- (CXSenderIdentity)initWithCoder:(id)a3;
- (CXSenderIdentity)initWithUUID:(id)a3 account:(id)a4;
- (CXSenderIdentity)initWithUUID:(id)a3 handle:(id)a4 localizedName:(id)a5;
- (NSString)localizedName;
- (NSString)localizedShortName;
- (NSUUID)UUID;
- (id)archivedDataWithError:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CXSenderIdentity

- (CXSenderIdentity)initWithUUID:(id)a3 handle:(id)a4 localizedName:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [CXAccount alloc];
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
  v13 = [(CXAccount *)v11 initWithUUID:v12 description:v8 serviceName:@"Unknown Service" isoCountryCode:@"xw" handle:v9];

  v14 = [(CXSenderIdentity *)self initWithUUID:v10 account:v13];
  return v14;
}

- (CXSenderIdentity)initWithUUID:(id)a3 account:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CXSenderIdentity;
  id v9 = [(CXSenderIdentity *)&v11 init];
  if (v9)
  {
    if (v7)
    {
      if (v8)
      {
LABEL_4:
        objc_storeStrong((id *)&v9->_UUID, a3);
        objc_storeStrong((id *)&v9->_account, a4);
        goto LABEL_5;
      }
    }
    else
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXSenderIdentity initWithUUID:account:]", @"UUID" format];
      if (v8) {
        goto LABEL_4;
      }
    }
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%s: parameter '%@' cannot be nil", "-[CXSenderIdentity initWithUUID:account:]", @"account" format];
    goto LABEL_4;
  }
LABEL_5:

  return v9;
}

- (CXHandle)handle
{
  v2 = [(CXSenderIdentity *)self account];
  v3 = [v2 handle];

  return (CXHandle *)v3;
}

- (NSString)localizedName
{
  v2 = [(CXSenderIdentity *)self account];
  v3 = [v2 accountDescription];

  return (NSString *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(CXSenderIdentity *)self UUID];
  v6 = [(CXSenderIdentity *)self account];
  id v7 = (void *)[v4 initWithUUID:v5 account:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXSenderIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CXSenderIdentity;
  v5 = [(CXSenderIdentity *)&v15 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    id v7 = NSStringFromSelector(sel_account);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    account = v5->_account;
    v5->_account = (CXAccount *)v8;

    uint64_t v10 = objc_opt_class();
    objc_super v11 = NSStringFromSelector(sel_UUID);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CXSenderIdentity *)self account];
  uint64_t v6 = NSStringFromSelector(sel_account);
  [v4 encodeObject:v5 forKey:v6];

  id v8 = [(CXSenderIdentity *)self UUID];
  id v7 = NSStringFromSelector(sel_UUID);
  [v4 encodeObject:v8 forKey:v7];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@ %p ", objc_opt_class(), self];
  id v4 = NSStringFromSelector(sel_UUID);
  v5 = [(CXSenderIdentity *)self UUID];
  [v3 appendFormat:@"%@=%@", v4, v5];

  [v3 appendFormat:@", "];
  uint64_t v6 = NSStringFromSelector(sel_account);
  id v7 = [(CXSenderIdentity *)self account];
  [v3 appendFormat:@"%@=%@", v6, v7];

  [v3 appendFormat:@">"];
  id v8 = (void *)[v3 copy];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(CXSenderIdentity *)self isEqualToSenderIdentity:v4];

  return v5;
}

- (unint64_t)hash
{
  id v3 = [(CXSenderIdentity *)self account];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(CXSenderIdentity *)self UUID];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqualToSenderIdentity:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CXSenderIdentity *)self account];
  unint64_t v6 = [v4 account];
  if ([v5 isEqualToAccount:v6])
  {
    id v7 = [(CXSenderIdentity *)self UUID];
    id v8 = [v4 UUID];
    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)archivedDataWithError:(id *)a3
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:a3];
}

+ (id)unarchivedObjectClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, objc_opt_class(), 0);
}

+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4
{
  unint64_t v6 = (void *)MEMORY[0x1E4F28DC0];
  id v7 = a3;
  id v8 = [a1 unarchivedObjectClasses];
  char v9 = [v6 unarchivedObjectOfClasses:v8 fromData:v7 error:a4];

  return v9;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (CXAccount)account
{
  return self->_account;
}

- (NSString)localizedShortName
{
  return self->_localizedShortName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedShortName, 0);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

@end