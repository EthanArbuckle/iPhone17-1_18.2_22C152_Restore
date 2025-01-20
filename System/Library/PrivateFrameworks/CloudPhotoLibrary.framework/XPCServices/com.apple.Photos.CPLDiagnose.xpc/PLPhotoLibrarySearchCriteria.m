@interface PLPhotoLibrarySearchCriteria
+ (BOOL)supportsSecureCoding;
- (NSDictionary)internalTestOptions;
- (NSString)containerIdentifier;
- (NSString)uuid;
- (PLPhotoLibrarySearchCriteria)initWithCoder:(id)a3;
- (int64_t)domain;
- (void)encodeWithCoder:(id)a3;
- (void)setContainerIdentifier:(id)a3;
- (void)setDomain:(int64_t)a3;
- (void)setInternalTestOptions:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation PLPhotoLibrarySearchCriteria

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PLPhotoLibrarySearchCriteria *)self uuid];
  [v4 encodeObject:v5 forKey:@"uuid"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[PLPhotoLibrarySearchCriteria domain](self, "domain"), @"domain");
  v6 = [(PLPhotoLibrarySearchCriteria *)self containerIdentifier];
  [v4 encodeObject:v6 forKey:@"containerIdentifier"];

  id v7 = [(PLPhotoLibrarySearchCriteria *)self internalTestOptions];
  [v4 encodeObject:v7 forKey:@"internalTestOptions"];
}

- (PLPhotoLibrarySearchCriteria)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PLPhotoLibrarySearchCriteria;
  v5 = [(PLPhotoLibrarySearchCriteria *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v6;

    v5->_domain = (int64_t)[v4 decodeIntegerForKey:@"domain"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"containerIdentifier"];
    containerIdentifier = v5->_containerIdentifier;
    v5->_containerIdentifier = (NSString *)v8;

    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"internalTestOptions"];
    internalTestOptions = v5->_internalTestOptions;
    v5->_internalTestOptions = (NSDictionary *)v13;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUuid:(id)a3
{
}

- (int64_t)domain
{
  return self->_domain;
}

- (void)setDomain:(int64_t)a3
{
  self->_domain = a3;
}

- (NSString)containerIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setContainerIdentifier:(id)a3
{
}

- (NSDictionary)internalTestOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInternalTestOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalTestOptions, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end