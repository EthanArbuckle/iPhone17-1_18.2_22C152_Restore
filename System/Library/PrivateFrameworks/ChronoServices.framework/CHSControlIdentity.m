@interface CHSControlIdentity
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)matches:(id)a3;
- (CHSControlIdentity)initWithCoder:(id)a3;
- (CHSControlIdentity)initWithExtensionIdentity:(id)a3 kind:(id)a4 intent:(id)a5;
- (CHSControlIdentity)initWithExtensionIdentity:(id)a3 kind:(id)a4 intentReference:(id)a5;
- (CHSExtensionIdentity)extensionIdentity;
- (CHSIntentReference)intentReference;
- (NSString)description;
- (NSString)kind;
- (id)_loggingIdentifier;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHSControlIdentity

- (CHSExtensionIdentity)extensionIdentity
{
  return self->_extensionIdentity;
}

- (CHSControlIdentity)initWithExtensionIdentity:(id)a3 kind:(id)a4 intent:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10) {
    v11 = [[CHSIntentReference alloc] initWithIntent:v10];
  }
  else {
    v11 = 0;
  }
  v12 = [(CHSControlIdentity *)self initWithExtensionIdentity:v8 kind:v9 intentReference:v11];

  return v12;
}

- (CHSControlIdentity)initWithExtensionIdentity:(id)a3 kind:(id)a4 intentReference:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CHSControlIdentity;
  v11 = [(CHSControlIdentity *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    extensionIdentity = v11->_extensionIdentity;
    v11->_extensionIdentity = (CHSExtensionIdentity *)v12;

    uint64_t v14 = [v9 copy];
    kind = v11->_kind;
    v11->_kind = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    intentReference = v11->_intentReference;
    v11->_intentReference = (CHSIntentReference *)v16;
  }
  return v11;
}

- (BOOL)matches:(id)a3
{
  id v4 = a3;
  v5 = [(CHSControlIdentity *)self extensionIdentity];
  v6 = [v4 extensionIdentity];
  if (BSEqualObjects())
  {
    v7 = [(CHSControlIdentity *)self kind];
    id v8 = [v4 kind];
    char v9 = BSEqualStrings();
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CHSControlIdentity *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if ([(CHSExtensionIdentity *)self->_extensionIdentity isEqual:v5->_extensionIdentity]
        && [(NSString *)self->_kind isEqualToString:v5->_kind])
      {
        int64_t v6 = [(CHSIntentReference *)self->_intentReference stableHash];
        BOOL v7 = v6 == [(CHSIntentReference *)v5->_intentReference stableHash];
      }
      else
      {
        BOOL v7 = 0;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [(CHSControlIdentity *)self extensionIdentity];
  id v5 = (id)[v3 appendObject:v4];

  int64_t v6 = [(CHSControlIdentity *)self kind];
  id v7 = (id)[v3 appendString:v6];

  id v8 = (id)objc_msgSend(v3, "appendInt64:", -[CHSIntentReference stableHash](self->_intentReference, "stableHash"));
  unint64_t v9 = [v3 hash];

  return v9;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__CHSControlIdentity_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E56C81F0;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [v5 appendProem:0 block:v6];
}

id __51__CHSControlIdentity_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) extensionIdentity];
  id v4 = (id)[v2 appendObject:v3 withName:@"extensionIdentity"];

  id v5 = *(void **)(a1 + 32);
  int64_t v6 = [*(id *)(a1 + 40) kind];
  [v5 appendString:v6 withName:@"kind"];

  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"intent" skipIfNil:1];
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (id)_loggingIdentifier
{
  intentReference = self->_intentReference;
  if (intentReference)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLongLong:", -[CHSIntentReference stableHash](intentReference, "stableHash"));
    id v5 = [v4 stringValue];
  }
  else
  {
    id v5 = @"-";
  }
  int64_t v6 = NSString;
  id v7 = [(CHSExtensionIdentity *)self->_extensionIdentity description];
  id v8 = [v6 stringWithFormat:@"[%@:%@:%@]", v7, self->_kind, v5];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_extensionIdentity forKey:@"extId"];
  [v4 encodeObject:self->_kind forKey:@"kind"];
  [v4 encodeObject:self->_intentReference forKey:@"intentRef"];
}

- (CHSControlIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extId"];
  int64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kind"];
  if ([v4 containsValueForKey:@"intentRef"])
  {
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intentRef"];
  }
  else
  {
    id v7 = 0;
  }
  id v8 = [(CHSControlIdentity *)self initWithExtensionIdentity:v5 kind:v6 intentReference:v7];

  return v8;
}

- (NSString)kind
{
  return self->_kind;
}

- (CHSIntentReference)intentReference
{
  return self->_intentReference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentReference, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_extensionIdentity, 0);
}

@end