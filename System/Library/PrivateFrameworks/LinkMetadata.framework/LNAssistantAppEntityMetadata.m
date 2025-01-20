@interface LNAssistantAppEntityMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNAssistantAppEntityMetadata)initWithCoder:(id)a3;
- (LNAssistantAppEntityMetadata)initWithEntityIdentifier:(id)a3 kind:(int64_t)a4 phraseTemplates:(id)a5;
- (NSArray)phraseTemplates;
- (NSString)entityIdentifier;
- (id)description;
- (int64_t)kind;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNAssistantAppEntityMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phraseTemplates, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

- (NSArray)phraseTemplates
{
  return self->_phraseTemplates;
}

- (int64_t)kind
{
  return self->_kind;
}

- (NSString)entityIdentifier
{
  return self->_entityIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNAssistantAppEntityMetadata *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_22:

      goto LABEL_23;
    }
    v7 = [(LNAssistantAppEntityMetadata *)self entityIdentifier];
    v8 = [(LNAssistantAppEntityMetadata *)v6 entityIdentifier];
    id v9 = v7;
    id v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      id v14 = v9;
      if (!v9 || !v10) {
        goto LABEL_20;
      }
      int v12 = [v9 isEqualToString:v10];

      if (!v12) {
        goto LABEL_21;
      }
    }
    int64_t v15 = [(LNAssistantAppEntityMetadata *)self kind];
    if (v15 != [(LNAssistantAppEntityMetadata *)v6 kind])
    {
      LOBYTE(v12) = 0;
LABEL_21:

      goto LABEL_22;
    }
    v16 = [(LNAssistantAppEntityMetadata *)self phraseTemplates];
    v17 = [(LNAssistantAppEntityMetadata *)v6 phraseTemplates];
    id v14 = v16;
    id v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v14 && v18) {
        LOBYTE(v12) = [v14 isEqualToArray:v18];
      }
    }

LABEL_20:
    goto LABEL_21;
  }
  LOBYTE(v12) = 1;
LABEL_23:

  return v12;
}

- (unint64_t)hash
{
  v3 = [(LNAssistantAppEntityMetadata *)self entityIdentifier];
  uint64_t v4 = [v3 hash];
  int64_t v5 = [(LNAssistantAppEntityMetadata *)self kind] ^ v4;
  v6 = [(LNAssistantAppEntityMetadata *)self phraseTemplates];
  unint64_t v7 = v5 ^ [v6 hash];

  return v7;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  int64_t v5 = NSStringFromClass(v4);
  v6 = [(LNAssistantAppEntityMetadata *)self entityIdentifier];
  int64_t v7 = [(LNAssistantAppEntityMetadata *)self kind];
  v8 = [(LNAssistantAppEntityMetadata *)self phraseTemplates];
  id v9 = [v3 stringWithFormat:@"<%@: %p, entityIdentifier: %@, kind: %ld, phraseTemplates: %@>", v5, self, v6, v7, v8];

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(LNAssistantAppEntityMetadata *)self entityIdentifier];
  [v4 encodeObject:v5 forKey:@"entityIdentifier"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[LNAssistantAppEntityMetadata kind](self, "kind"), @"kind");
  id v6 = [(LNAssistantAppEntityMetadata *)self phraseTemplates];
  [v4 encodeObject:v6 forKey:@"phraseTemplates"];
}

- (LNAssistantAppEntityMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  int64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entityIdentifier"];
  if (v5)
  {
    id v6 = (LNAssistantAppEntityMetadata *)[v4 decodeIntegerForKey:@"kind"];
    if (v6)
    {
      int64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v8 = objc_opt_class();
      id v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
      id v10 = [v4 decodeObjectOfClasses:v9 forKey:@"phraseTemplates"];

      if (v10) {
        id v6 = [[LNAssistantAppEntityMetadata alloc] initWithEntityIdentifier:v5 kind:v6 phraseTemplates:v10];
      }
      else {
        id v6 = 0;
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (LNAssistantAppEntityMetadata)initWithEntityIdentifier:(id)a3 kind:(int64_t)a4 phraseTemplates:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"LNAssistantAppEntityMetadata.m", 21, @"Invalid parameter not satisfying: %@", @"entityIdentifier" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"LNAssistantAppEntityMetadata.m", 22, @"Invalid parameter not satisfying: %@", @"phraseTemplates" object file lineNumber description];

LABEL_3:
  v21.receiver = self;
  v21.super_class = (Class)LNAssistantAppEntityMetadata;
  int v12 = [(LNAssistantAppEntityMetadata *)&v21 init];
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    entityIdentifier = v12->_entityIdentifier;
    v12->_entityIdentifier = (NSString *)v13;

    v12->_kind = a4;
    uint64_t v15 = [v11 copy];
    phraseTemplates = v12->_phraseTemplates;
    v12->_phraseTemplates = (NSArray *)v15;

    v17 = v12;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end