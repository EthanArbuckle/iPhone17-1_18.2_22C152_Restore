@interface NSFileProviderKnownFolderLocations
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldCreateBinaryCompatibilitySymlink;
- (NSFileProviderKnownFolderLocation)desktopLocation;
- (NSFileProviderKnownFolderLocation)documentsLocation;
- (NSFileProviderKnownFolderLocations)init;
- (NSFileProviderKnownFolderLocations)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)providedKnownFolders;
- (void)encodeWithCoder:(id)a3;
- (void)setDesktopLocation:(id)a3;
- (void)setDocumentsLocation:(id)a3;
- (void)setShouldCreateBinaryCompatibilitySymlink:(BOOL)a3;
@end

@implementation NSFileProviderKnownFolderLocations

- (NSFileProviderKnownFolderLocations)init
{
  v3.receiver = self;
  v3.super_class = (Class)NSFileProviderKnownFolderLocations;
  result = [(NSFileProviderKnownFolderLocations *)&v3 init];
  if (result) {
    result->_shouldCreateBinaryCompatibilitySymlink = 1;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSFileProviderKnownFolderLocations)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NSFileProviderKnownFolderLocations;
  v5 = [(NSFileProviderKnownFolderLocations *)&v13 init];
  if (v5)
  {
    v5->_shouldCreateBinaryCompatibilitySymlink = [v4 decodeBoolForKey:@"_shouldCreateBinaryCompatibilitySymlink"];
    v6 = knownFolderLocationConcreteClasses();
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"_desktopLocation"];
    desktopLocation = v5->_desktopLocation;
    v5->_desktopLocation = (NSFileProviderKnownFolderLocation *)v7;

    v9 = knownFolderLocationConcreteClasses();
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"_documentsLocation"];
    documentsLocation = v5->_documentsLocation;
    v5->_documentsLocation = (NSFileProviderKnownFolderLocation *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL shouldCreateBinaryCompatibilitySymlink = self->_shouldCreateBinaryCompatibilitySymlink;
  id v5 = a3;
  [v5 encodeBool:shouldCreateBinaryCompatibilitySymlink forKey:@"_shouldCreateBinaryCompatibilitySymlink"];
  [v5 encodeObject:self->_desktopLocation forKey:@"_desktopLocation"];
  [v5 encodeObject:self->_documentsLocation forKey:@"_documentsLocation"];
}

- (unint64_t)providedKnownFolders
{
  if (self->_documentsLocation) {
    return (self->_desktopLocation != 0) | 2;
  }
  else {
    return self->_desktopLocation != 0;
  }
}

- (id)description
{
  uint64_t v2 = 89;
  if (!self->_shouldCreateBinaryCompatibilitySymlink) {
    uint64_t v2 = 78;
  }
  return (id)[NSString stringWithFormat:@"<KFLocations desktop:%@ documents:%@ lnk:%c>", self->_desktopLocation, self->_documentsLocation, v2];
}

- (BOOL)shouldCreateBinaryCompatibilitySymlink
{
  return self->_shouldCreateBinaryCompatibilitySymlink;
}

- (void)setShouldCreateBinaryCompatibilitySymlink:(BOOL)a3
{
  self->_BOOL shouldCreateBinaryCompatibilitySymlink = a3;
}

- (NSFileProviderKnownFolderLocation)desktopLocation
{
  return self->_desktopLocation;
}

- (void)setDesktopLocation:(id)a3
{
}

- (NSFileProviderKnownFolderLocation)documentsLocation
{
  return self->_documentsLocation;
}

- (void)setDocumentsLocation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentsLocation, 0);

  objc_storeStrong((id *)&self->_desktopLocation, 0);
}

@end