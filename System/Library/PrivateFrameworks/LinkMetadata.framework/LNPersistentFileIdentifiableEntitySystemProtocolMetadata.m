@interface LNPersistentFileIdentifiableEntitySystemProtocolMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNPersistentFileIdentifiableEntitySystemProtocolMetadata)initWithCoder:(id)a3;
- (LNPersistentFileIdentifiableEntitySystemProtocolMetadata)initWithSupportedContentTypes:(id)a3;
- (NSArray)supportedContentTypes;
- (NSString)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNPersistentFileIdentifiableEntitySystemProtocolMetadata

- (void).cxx_destruct
{
}

- (NSArray)supportedContentTypes
{
  return self->_supportedContentTypes;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNPersistentFileIdentifiableEntitySystemProtocolMetadata *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = [(LNPersistentFileIdentifiableEntitySystemProtocolMetadata *)self supportedContentTypes];
        v8 = [(LNPersistentFileIdentifiableEntitySystemProtocolMetadata *)v6 supportedContentTypes];

        if (v7 == v8)
        {
          char v18 = 1;
          goto LABEL_12;
        }
        uint64_t v9 = [(LNPersistentFileIdentifiableEntitySystemProtocolMetadata *)self supportedContentTypes];
        if (!v9
          || (v10 = (void *)v9,
              [(LNPersistentFileIdentifiableEntitySystemProtocolMetadata *)v6 supportedContentTypes], v11 = objc_claimAutoreleasedReturnValue(), v11, v10, !v11))
        {
          char v18 = 0;
          goto LABEL_12;
        }
        v12 = (void *)MEMORY[0x1E4F1CAD0];
        v13 = [(LNPersistentFileIdentifiableEntitySystemProtocolMetadata *)self supportedContentTypes];
        v14 = [v12 setWithArray:v13];
        v15 = (void *)MEMORY[0x1E4F1CAD0];
        v16 = [(LNPersistentFileIdentifiableEntitySystemProtocolMetadata *)v6 supportedContentTypes];
        v17 = [v15 setWithArray:v16];
        char v18 = [v14 isEqualToSet:v17];
      }
      else
      {
        char v18 = 0;
        v13 = v6;
        v6 = 0;
      }
    }
    else
    {
      v13 = 0;
      char v18 = 0;
    }

LABEL_12:
    goto LABEL_13;
  }
  char v18 = 1;
LABEL_13:

  return v18;
}

- (unint64_t)hash
{
  v2 = [(LNPersistentFileIdentifiableEntitySystemProtocolMetadata *)self supportedContentTypes];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(LNPersistentFileIdentifiableEntitySystemProtocolMetadata *)self supportedContentTypes];
  v7 = [v3 stringWithFormat:@"<%@: %p, supportedContentTypes: %@>", v5, self, v6];

  return (NSString *)v7;
}

- (LNPersistentFileIdentifiableEntitySystemProtocolMetadata)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"supportedContentTypes"];

  uint64_t v9 = [(LNPersistentFileIdentifiableEntitySystemProtocolMetadata *)self initWithSupportedContentTypes:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(LNPersistentFileIdentifiableEntitySystemProtocolMetadata *)self supportedContentTypes];
  [v4 encodeObject:v5 forKey:@"supportedContentTypes"];
}

- (LNPersistentFileIdentifiableEntitySystemProtocolMetadata)initWithSupportedContentTypes:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LNPersistentFileIdentifiableEntitySystemProtocolMetadata;
  uint64_t v6 = [(LNPersistentFileIdentifiableEntitySystemProtocolMetadata *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_supportedContentTypes, a3);
    v8 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end