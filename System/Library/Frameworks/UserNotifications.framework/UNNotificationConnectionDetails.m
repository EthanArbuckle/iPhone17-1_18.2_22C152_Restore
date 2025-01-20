@interface UNNotificationConnectionDetails
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInternalTool;
- (BSAuditToken)auditToken;
- (NSString)bundleIdentifier;
- (UNNotificationConnectionDetails)initWithAuditToken:(id)a3 bundleIdentifier:(id)a4 internalTool:(BOOL)a5;
- (UNNotificationConnectionDetails)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UNNotificationConnectionDetails

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  v4 = [(UNNotificationConnectionDetails *)self auditToken];
  [v6 encodeObject:v4 forKey:@"auditToken"];

  v5 = [(UNNotificationConnectionDetails *)self bundleIdentifier];
  [v6 encodeObject:v5 forKey:@"bundleIdentifier"];

  objc_msgSend(v6, "encodeBool:forKey:", -[UNNotificationConnectionDetails isInternalTool](self, "isInternalTool"), @"internalTool");
}

- (BOOL)isInternalTool
{
  return self->_internalTool;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BSAuditToken)auditToken
{
  return self->_auditToken;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_auditToken, 0);
}

- (UNNotificationConnectionDetails)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"auditToken"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
  uint64_t v7 = [v4 decodeBoolForKey:@"internalTool"];

  v8 = [(UNNotificationConnectionDetails *)self initWithAuditToken:v5 bundleIdentifier:v6 internalTool:v7];
  return v8;
}

- (UNNotificationConnectionDetails)initWithAuditToken:(id)a3 bundleIdentifier:(id)a4 internalTool:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)UNNotificationConnectionDetails;
  v10 = [(UNNotificationConnectionDetails *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    auditToken = v10->_auditToken;
    v10->_auditToken = (BSAuditToken *)v11;

    uint64_t v13 = [v9 copy];
    bundleIdentifier = v10->_bundleIdentifier;
    v10->_bundleIdentifier = (NSString *)v13;

    v10->_internalTool = a5;
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [(UNNotificationConnectionDetails *)self auditToken];
  id v5 = (id)[v3 appendObject:v4];

  id v6 = [(UNNotificationConnectionDetails *)self bundleIdentifier];
  id v7 = (id)[v3 appendString:v6];

  id v8 = (id)objc_msgSend(v3, "appendBool:", -[UNNotificationConnectionDetails isInternalTool](self, "isInternalTool"));
  unint64_t v9 = [v3 hash];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  id v6 = v4;
  id v7 = [(UNNotificationConnectionDetails *)self auditToken];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __43__UNNotificationConnectionDetails_isEqual___block_invoke;
  v21[3] = &unk_1E5F06230;
  id v8 = v6;
  id v22 = v8;
  id v9 = (id)[v5 appendObject:v7 counterpart:v21];

  v10 = [(UNNotificationConnectionDetails *)self bundleIdentifier];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __43__UNNotificationConnectionDetails_isEqual___block_invoke_2;
  v19[3] = &unk_1E5F06258;
  id v11 = v8;
  id v20 = v11;
  id v12 = (id)[v5 appendString:v10 counterpart:v19];

  uint64_t v13 = [(UNNotificationConnectionDetails *)self isInternalTool];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __43__UNNotificationConnectionDetails_isEqual___block_invoke_3;
  v17[3] = &unk_1E5F06280;
  id v18 = v11;
  id v14 = v11;
  id v15 = (id)[v5 appendBool:v13 counterpart:v17];
  LOBYTE(v13) = [v5 isEqual];

  return v13;
}

uint64_t __43__UNNotificationConnectionDetails_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) auditToken];
}

uint64_t __43__UNNotificationConnectionDetails_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) bundleIdentifier];
}

uint64_t __43__UNNotificationConnectionDetails_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) isInternalTool];
}

- (id)description
{
  return (id)[MEMORY[0x1E4F4F718] descriptionForObject:self];
}

@end