@interface CHSWidgetRelevanceKey
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)matches:(id)a3;
- (CHSExtensionIdentity)extensionIdentity;
- (CHSWidgetRelevanceKey)initWithCoder:(id)a3;
- (CHSWidgetRelevanceKey)initWithExtensionIdentity:(id)a3 kind:(id)a4;
- (NSString)kind;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHSWidgetRelevanceKey

- (CHSWidgetRelevanceKey)initWithExtensionIdentity:(id)a3 kind:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CHSWidgetRelevanceKey;
  v8 = [(CHSWidgetRelevanceKey *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    extensionIdentity = v8->_extensionIdentity;
    v8->_extensionIdentity = (CHSExtensionIdentity *)v9;

    uint64_t v11 = [v7 copy];
    kind = v8->_kind;
    v8->_kind = (NSString *)v11;
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  extensionIdentity = self->_extensionIdentity;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __33__CHSWidgetRelevanceKey_isEqual___block_invoke;
  v18[3] = &unk_1E56C81C8;
  id v7 = v4;
  id v19 = v7;
  id v8 = (id)[v5 appendObject:extensionIdentity counterpart:v18];
  kind = self->_kind;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __33__CHSWidgetRelevanceKey_isEqual___block_invoke_2;
  v16 = &unk_1E56C81C8;
  id v10 = v7;
  id v17 = v10;
  id v11 = (id)[v5 appendObject:kind counterpart:&v13];
  LOBYTE(v7) = objc_msgSend(v5, "isEqual", v13, v14, v15, v16);

  return (char)v7;
}

id __33__CHSWidgetRelevanceKey_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

id __33__CHSWidgetRelevanceKey_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 16);
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendObject:self->_extensionIdentity];
  id v5 = (id)[v3 appendString:self->_kind];
  unint64_t v6 = [v3 hash];

  return v6;
}

- (id)description
{
  v2 = NSString;
  extensionIdentity = self->_extensionIdentity;
  id v4 = [(CHSWidgetRelevanceKey *)self kind];
  id v5 = [v2 stringWithFormat:@"%@-%@", extensionIdentity, v4];

  return v5;
}

- (BOOL)matches:(id)a3
{
  id v4 = a3;
  extensionIdentity = self->_extensionIdentity;
  unint64_t v6 = [v4 extensionIdentity];
  if ([(CHSExtensionIdentity *)extensionIdentity isEqual:v6])
  {
    kind = self->_kind;
    id v8 = [v4 kind];
    BOOL v9 = [(NSString *)kind isEqualToString:v8];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CHSWidgetRelevanceKey)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CHSWidgetRelevanceKey;
  id v5 = [(CHSWidgetRelevanceKey *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extensionIdentity"];
    extensionIdentity = v5->_extensionIdentity;
    v5->_extensionIdentity = (CHSExtensionIdentity *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kind"];
    kind = v5->_kind;
    v5->_kind = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_extensionIdentity forKey:@"extensionIdentity"];
  [v4 encodeObject:self->_kind forKey:@"kind"];
}

- (CHSExtensionIdentity)extensionIdentity
{
  return self->_extensionIdentity;
}

- (NSString)kind
{
  return self->_kind;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_extensionIdentity, 0);
}

@end