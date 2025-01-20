@interface PHPhotoLibraryIdentifier
+ (BOOL)supportsSecureCoding;
+ (NSString)defaultApplicationContainerIdentifier;
+ (id)defaultApplicationLibraryIdentifierWithContainerIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)archivalStringRepresentation;
- (NSString)containerIdentifier;
- (NSString)uuid;
- (PHPhotoLibraryIdentifier)initWithArchivalStringRepresentation:(id)a3;
- (PHPhotoLibraryIdentifier)initWithCoder:(id)a3;
- (PHPhotoLibraryIdentifier)initWithPLLibraryIdentifier:(id)a3;
- (PLPhotoLibraryIdentifier)pl_libraryIdentifier;
- (PLPhotoLibrarySearchCriteria)librarySearchCriteria;
- (id)description;
- (int64_t)domain;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PHPhotoLibraryIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_uuid, 0);

  objc_storeStrong((id *)&self->_pl_libraryIdentifier, 0);
}

- (PLPhotoLibraryIdentifier)pl_libraryIdentifier
{
  return (PLPhotoLibraryIdentifier *)objc_getProperty(self, a2, 8, 1);
}

- (PLPhotoLibrarySearchCriteria)librarySearchCriteria
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F8AAA8]);
  v4 = [(PHPhotoLibraryIdentifier *)self uuid];
  [v3 setUuid:v4];

  v5 = [(PHPhotoLibraryIdentifier *)self containerIdentifier];
  [v3 setContainerIdentifier:v5];

  return (PLPhotoLibrarySearchCriteria *)v3;
}

- (PHPhotoLibraryIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PHPhotoLibraryIdentifier;
  v5 = [(PHPhotoLibraryIdentifier *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pl_libraryIdentifier"];
    pl_libraryIdentifier = v5->_pl_libraryIdentifier;
    v5->_pl_libraryIdentifier = (PLPhotoLibraryIdentifier *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"containerIdentifier"];
    containerIdentifier = v5->_containerIdentifier;
    v5->_containerIdentifier = (NSString *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"domain"];
    v5->_domain = [v12 integerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  pl_libraryIdentifier = self->_pl_libraryIdentifier;
  id v5 = a3;
  [v5 encodeObject:pl_libraryIdentifier forKey:@"pl_libraryIdentifier"];
  [v5 encodeObject:self->_uuid forKey:@"uuid"];
  [v5 encodeObject:self->_containerIdentifier forKey:@"containerIdentifier"];
  id v6 = [NSNumber numberWithInteger:self->_domain];
  [v5 encodeObject:v6 forKey:@"domain"];
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PHPhotoLibraryIdentifier;
  id v3 = [(PHPhotoLibraryIdentifier *)&v7 description];
  id v4 = [(PHPhotoLibraryIdentifier *)self archivalStringRepresentation];
  id v5 = [v3 stringByAppendingFormat:@": [%@]", v4];

  return v5;
}

- (int64_t)domain
{
  return self->_domain;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (unint64_t)hash
{
  v2 = [(PHPhotoLibraryIdentifier *)self uuid];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PHPhotoLibraryIdentifier *)a3;
  if (self == v4)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [(PHPhotoLibraryIdentifier *)self uuid];
      objc_super v7 = [(PHPhotoLibraryIdentifier *)v5 uuid];
      int IsEqual = PLObjectIsEqual();

      if (IsEqual
        && ([(PHPhotoLibraryIdentifier *)self containerIdentifier],
            v9 = objc_claimAutoreleasedReturnValue(),
            [(PHPhotoLibraryIdentifier *)v5 containerIdentifier],
            uint64_t v10 = objc_claimAutoreleasedReturnValue(),
            int v11 = PLObjectIsEqual(),
            v10,
            v9,
            v11))
      {
        int64_t v12 = [(PHPhotoLibraryIdentifier *)self domain];
        BOOL v13 = v12 == [(PHPhotoLibraryIdentifier *)v5 domain];
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (PHPhotoLibraryIdentifier)initWithPLLibraryIdentifier:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PHPhotoLibraryIdentifier;
  id v6 = [(PHPhotoLibraryIdentifier *)&v13 init];
  objc_super v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pl_libraryIdentifier, a3);
    uint64_t v8 = [(PLPhotoLibraryIdentifier *)v7->_pl_libraryIdentifier uuid];
    uuid = v7->_uuid;
    v7->_uuid = (NSString *)v8;

    uint64_t v10 = [(PLPhotoLibraryIdentifier *)v7->_pl_libraryIdentifier containerIdentifier];
    containerIdentifier = v7->_containerIdentifier;
    v7->_containerIdentifier = (NSString *)v10;

    v7->_domain = [(PLPhotoLibraryIdentifier *)v7->_pl_libraryIdentifier domain];
  }

  return v7;
}

- (PHPhotoLibraryIdentifier)initWithArchivalStringRepresentation:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PHPhotoLibraryIdentifier;
  id v5 = [(PHPhotoLibraryIdentifier *)&v11 init];
  if (v5)
  {
    int v6 = PLPhotoLibraryIdentifierDecodeIdentifierPropertiesFromArchivalStringRepresentation();
    id v7 = 0;
    id v8 = 0;
    if (v6)
    {
      objc_storeStrong((id *)&v5->_uuid, 0);
      objc_storeStrong((id *)&v5->_containerIdentifier, 0);
      v5->_domain = 0;
    }
    if (!v5->_uuid)
    {
      v9 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v4;
        _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_ERROR, "Failed to create identifier from invalid string encoding: %@", buf, 0xCu);
      }

      id v5 = 0;
    }
  }
  return v5;
}

- (NSString)archivalStringRepresentation
{
  unint64_t v3 = [(PHPhotoLibraryIdentifier *)self uuid];
  id v4 = [(PHPhotoLibraryIdentifier *)self containerIdentifier];
  [(PHPhotoLibraryIdentifier *)self domain];
  id v5 = PLPhotoLibraryIdentifierEncodeArchivalStringRepresentationFromIdentifierProperties();

  return (NSString *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultApplicationLibraryIdentifierWithContainerIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [a1 defaultApplicationContainerIdentifier];
  }
  id v7 = v6;
  id v8 = PLPhotoLibraryIdentifierEncodeArchivalStringRepresentationFromIdentifierProperties();
  v9 = (void *)[objc_alloc((Class)a1) initWithArchivalStringRepresentation:v8];

  return v9;
}

+ (NSString)defaultApplicationContainerIdentifier
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  unint64_t v3 = [v2 bundleIdentifier];

  return (NSString *)v3;
}

@end