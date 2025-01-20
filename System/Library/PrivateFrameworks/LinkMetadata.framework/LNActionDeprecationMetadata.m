@interface LNActionDeprecationMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNActionDeprecationMetadata)initWithCoder:(id)a3;
- (LNActionDeprecationMetadata)initWithMessageText:(id)a3 replacedByIntentIdentifier:(id)a4;
- (LNStaticDeferredLocalizedString)messageText;
- (NSString)replacedByIntentIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNActionDeprecationMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacedByIntentIdentifier, 0);
  objc_storeStrong((id *)&self->_messageText, 0);
}

- (NSString)replacedByIntentIdentifier
{
  return self->_replacedByIntentIdentifier;
}

- (LNStaticDeferredLocalizedString)messageText
{
  return self->_messageText;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNActionDeprecationMetadata *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_20:

      goto LABEL_21;
    }
    v7 = [(LNActionDeprecationMetadata *)self messageText];
    v8 = [(LNActionDeprecationMetadata *)v6 messageText];
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
      if (!v9 || !v10)
      {
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      int v12 = [v9 isEqual:v10];

      if (!v12) {
        goto LABEL_19;
      }
    }
    v15 = [(LNActionDeprecationMetadata *)self replacedByIntentIdentifier];
    v16 = [(LNActionDeprecationMetadata *)v6 replacedByIntentIdentifier];
    id v14 = v15;
    id v17 = v16;
    v13 = v17;
    if (v14 == v17)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v14 && v17) {
        LOBYTE(v12) = [v14 isEqual:v17];
      }
    }

    goto LABEL_18;
  }
  LOBYTE(v12) = 1;
LABEL_21:

  return v12;
}

- (unint64_t)hash
{
  v3 = [(LNActionDeprecationMetadata *)self messageText];
  uint64_t v4 = [v3 hash];
  v5 = [(LNActionDeprecationMetadata *)self replacedByIntentIdentifier];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(LNActionDeprecationMetadata *)self messageText];
  v7 = [(LNActionDeprecationMetadata *)self replacedByIntentIdentifier];
  v8 = [v3 stringWithFormat:@"<%@: %p, message: %@, replacedByIntentIdentifier: %@>", v5, self, v6, v7];

  return v8;
}

- (LNActionDeprecationMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"messageText"];
  if (v5)
  {
    unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"replacedByIntentIdentifier"];
    self = [(LNActionDeprecationMetadata *)self initWithMessageText:v5 replacedByIntentIdentifier:v6];

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNActionDeprecationMetadata *)self messageText];
  [v4 encodeObject:v5 forKey:@"messageText"];

  id v6 = [(LNActionDeprecationMetadata *)self replacedByIntentIdentifier];
  [v4 encodeObject:v6 forKey:@"replacedByIntentIdentifier"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(LNActionDeprecationMetadata *)self messageText];
  id v6 = [(LNActionDeprecationMetadata *)self replacedByIntentIdentifier];
  v7 = (void *)[v4 initWithMessageText:v5 replacedByIntentIdentifier:v6];

  return v7;
}

- (LNActionDeprecationMetadata)initWithMessageText:(id)a3 replacedByIntentIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"LNActionDeprecationMetadata.m", 19, @"Invalid parameter not satisfying: %@", @"messageText" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)LNActionDeprecationMetadata;
  id v9 = [(LNActionDeprecationMetadata *)&v17 init];
  if (v9)
  {
    uint64_t v10 = [v7 copy];
    messageText = v9->_messageText;
    v9->_messageText = (LNStaticDeferredLocalizedString *)v10;

    uint64_t v12 = [v8 copy];
    replacedByIntentIdentifier = v9->_replacedByIntentIdentifier;
    v9->_replacedByIntentIdentifier = (NSString *)v12;

    id v14 = v9;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end