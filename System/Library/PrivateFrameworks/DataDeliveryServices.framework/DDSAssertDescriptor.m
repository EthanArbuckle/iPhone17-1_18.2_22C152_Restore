@interface DDSAssertDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDescriptor:(id)a3;
- (DDSAssertDescriptor)init;
- (DDSAssertDescriptor)initWithCoder:(id)a3;
- (DDSAssertDescriptor)initWithPolicy:(id)a3 assertionID:(id)a4 clientID:(id)a5;
- (DDSAssetPolicy)policy;
- (NSString)assertionIdentifier;
- (NSString)clientIdentifier;
- (id)description;
- (id)dumpDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAssertionIdentifier:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setPolicy:(id)a3;
@end

@implementation DDSAssertDescriptor

- (DDSAssertDescriptor)initWithPolicy:(id)a3 assertionID:(id)a4 clientID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)DDSAssertDescriptor;
  v12 = [(DDSAssertDescriptor *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_policy, a3);
    objc_storeStrong((id *)&v13->_assertionIdentifier, a4);
    objc_storeStrong((id *)&v13->_clientIdentifier, a5);
  }

  return v13;
}

- (DDSAssertDescriptor)init
{
  return 0;
}

- (DDSAssertDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DDSAssertDescriptor;
  v5 = [(DDSAssertDescriptor *)&v19 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_policy);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    policy = v5->_policy;
    v5->_policy = (DDSAssetPolicy *)v8;

    uint64_t v10 = objc_opt_class();
    id v11 = NSStringFromSelector(sel_assertionIdentifier);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    assertionIdentifier = v5->_assertionIdentifier;
    v5->_assertionIdentifier = (NSString *)v12;

    uint64_t v14 = objc_opt_class();
    objc_super v15 = NSStringFromSelector(sel_clientIdentifier);
    uint64_t v16 = [v4 decodeObjectOfClass:v14 forKey:v15];
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DDSAssertDescriptor *)self assertionIdentifier];
  uint64_t v6 = NSStringFromSelector(sel_assertionIdentifier);
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(DDSAssertDescriptor *)self clientIdentifier];
  uint64_t v8 = NSStringFromSelector(sel_clientIdentifier);
  [v4 encodeObject:v7 forKey:v8];

  id v10 = [(DDSAssertDescriptor *)self policy];
  id v9 = NSStringFromSelector(sel_policy);
  [v4 encodeObject:v10 forKey:v9];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(DDSAssertDescriptor *)self isEqualToDescriptor:v4];

  return v5;
}

- (BOOL)isEqualToDescriptor:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(DDSAssertDescriptor *)self policy];
  uint64_t v6 = [v4 policy];
  if (DDSObjectsAreEqualOrNil((unint64_t)v5, (uint64_t)v6))
  {
    v7 = [(DDSAssertDescriptor *)self assertionIdentifier];
    uint64_t v8 = [v4 assertionIdentifier];
    if ([v7 isEqualToString:v8])
    {
      id v9 = [(DDSAssertDescriptor *)self clientIdentifier];
      id v10 = [v4 clientIdentifier];
      char v11 = [v9 isEqual:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = [(DDSAssertDescriptor *)self policy];
  uint64_t v4 = [v3 hash];
  BOOL v5 = [(DDSAssertDescriptor *)self assertionIdentifier];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(DDSAssertDescriptor *)self clientIdentifier];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  uint64_t v6 = [(DDSAssertDescriptor *)self assertionIdentifier];
  v7 = [(DDSAssertDescriptor *)self clientIdentifier];
  unint64_t v8 = [v3 stringWithFormat:@"<%@ %p: aID: %@ cID: %@>", v5, self, v6, v7];

  return v8;
}

- (id)dumpDescription
{
  if (DDS_IS_INTERNAL_INSTALL())
  {
    v3 = NSString;
    uint64_t v4 = [(DDSAssertDescriptor *)self assertionIdentifier];
    BOOL v5 = [(DDSAssertDescriptor *)self clientIdentifier];
    uint64_t v6 = [(DDSAssertDescriptor *)self policy];
    v7 = [v6 dumpDescription];
    unint64_t v8 = [v3 stringWithFormat:@"%@, %@ (%@)", v4, v5, v7];
  }
  else
  {
    unint64_t v8 = &stru_1F3FA8828;
  }
  return v8;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSString)assertionIdentifier
{
  return self->_assertionIdentifier;
}

- (void)setAssertionIdentifier:(id)a3
{
}

- (DDSAssetPolicy)policy
{
  return self->_policy;
}

- (void)setPolicy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_assertionIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end