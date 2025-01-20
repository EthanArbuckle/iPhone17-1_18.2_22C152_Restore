@interface PLPhotoLibraryIdentifier
+ (BOOL)supportsSecureCoding;
- (NSString)containerIdentifier;
- (NSString)name;
- (NSString)path;
- (NSString)userDescription;
- (NSString)uuid;
- (PLPhotoLibraryIdentifier)initWithCoder:(id)a3;
- (int64_t)domain;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PLPhotoLibraryIdentifier

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PLPhotoLibraryIdentifier *)self name];
  [v4 encodeObject:v5 forKey:@"Name"];

  v6 = [(PLPhotoLibraryIdentifier *)self userDescription];
  [v4 encodeObject:v6 forKey:@"UserDescription"];

  v7 = [(PLPhotoLibraryIdentifier *)self uuid];
  [v4 encodeObject:v7 forKey:@"UUID"];

  v8 = [(PLPhotoLibraryIdentifier *)self path];
  [v4 encodeObject:v8 forKey:@"Path"];

  id v9 = [(PLPhotoLibraryIdentifier *)self containerIdentifier];
  [v4 encodeObject:v9 forKey:@"ContainerIdentifier"];
}

- (PLPhotoLibraryIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PLPhotoLibraryIdentifier;
  v5 = [(PLPhotoLibraryIdentifier *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UserDescription"];
    userDescription = v5->_userDescription;
    v5->_userDescription = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Path"];
    path = v5->_path;
    v5->_path = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ContainerIdentifier"];
    containerIdentifier = v5->_containerIdentifier;
    v5->_containerIdentifier = (NSString *)v14;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)containerIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (int64_t)domain
{
  return self->_domain;
}

- (NSString)userDescription
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_userDescription, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end