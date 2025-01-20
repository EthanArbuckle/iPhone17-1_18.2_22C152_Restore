@interface LNEnumCaseMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNDisplayRepresentation)displayRepresentation;
- (LNEnumCaseMetadata)initWithCoder:(id)a3;
- (LNEnumCaseMetadata)initWithIdentifier:(id)a3 displayRepresentation:(id)a4;
- (NSString)identifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNEnumCaseMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayRepresentation, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (LNEnumCaseMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayRepresentation"];

  v7 = [(LNEnumCaseMetadata *)self initWithIdentifier:v5 displayRepresentation:v6];
  return v7;
}

- (LNEnumCaseMetadata)initWithIdentifier:(id)a3 displayRepresentation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"LNEnumMetadata.m", 23, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"LNEnumMetadata.m", 24, @"Invalid parameter not satisfying: %@", @"displayRepresentation" object file lineNumber description];

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)LNEnumCaseMetadata;
  v10 = [(LNEnumCaseMetadata *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    objc_storeStrong((id *)&v10->_displayRepresentation, a4);
    v13 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNEnumCaseMetadata *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  id v6 = [(LNEnumCaseMetadata *)self displayRepresentation];
  [v4 encodeObject:v6 forKey:@"displayRepresentation"];
}

- (LNDisplayRepresentation)displayRepresentation
{
  return self->_displayRepresentation;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LNEnumCaseMetadata *)a3;
  v5 = v4;
  if (self != v4)
  {
    id v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_20:

      goto LABEL_21;
    }
    id v7 = [(LNEnumCaseMetadata *)self identifier];
    id v8 = [(LNEnumCaseMetadata *)v6 identifier];
    id v9 = v7;
    id v10 = v8;
    uint64_t v11 = v10;
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
      int v12 = [v9 isEqualToString:v10];

      if (!v12) {
        goto LABEL_19;
      }
    }
    v15 = [(LNEnumCaseMetadata *)self displayRepresentation];
    v16 = [(LNEnumCaseMetadata *)v6 displayRepresentation];
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
  v9.receiver = self;
  v9.super_class = (Class)LNEnumCaseMetadata;
  unint64_t v3 = [(LNEnumCaseMetadata *)&v9 hash];
  id v4 = [(LNEnumCaseMetadata *)self identifier];
  uint64_t v5 = [v4 hash];
  id v6 = [(LNEnumCaseMetadata *)self displayRepresentation];
  unint64_t v7 = v5 ^ [v6 hash] ^ v3;

  return v7;
}

@end