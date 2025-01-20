@interface FPKnownFolderExistingLocation
+ (BOOL)supportsSecureCoding;
- (FPKnownFolderExistingLocation)initWithCoder:(id)a3;
- (FPKnownFolderExistingLocation)initWithExistingItemIdentifier:(id)a3;
- (NSString)itemIdentifier;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FPKnownFolderExistingLocation

- (FPKnownFolderExistingLocation)initWithExistingItemIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPKnownFolderExistingLocation;
  v5 = [(FPKnownFolderExistingLocation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FPKnownFolderExistingLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPKnownFolderExistingLocation;
  v5 = [(FPKnownFolderExistingLocation *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_itemIdentifier"];
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)description
{
  return self->_itemIdentifier;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void).cxx_destruct
{
}

@end