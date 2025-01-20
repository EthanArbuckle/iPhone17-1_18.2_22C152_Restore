@interface PHPhotoLibraryAttributes
- (BOOL)isCloudSyncEnabled;
- (NSString)name;
- (NSString)userDescription;
- (PHPhotoLibraryAttributes)initWithLibraryIdentifier:(id)a3 cplSettings:(id)a4;
- (PHPhotoLibraryIdentifier)identifier;
- (PLCPLSettings)cplSettings;
- (PLPhotoLibraryIdentifier)pl_libraryIdentifier;
- (unsigned)cloudResourcePrefetchMode;
@end

@implementation PHPhotoLibraryAttributes

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_cplSettings, 0);

  objc_storeStrong((id *)&self->_pl_libraryIdentifier, 0);
}

- (PLCPLSettings)cplSettings
{
  return (PLCPLSettings *)objc_getProperty(self, a2, 16, 1);
}

- (PLPhotoLibraryIdentifier)pl_libraryIdentifier
{
  return (PLPhotoLibraryIdentifier *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)userDescription
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (PHPhotoLibraryIdentifier)identifier
{
  return (PHPhotoLibraryIdentifier *)objc_getProperty(self, a2, 24, 1);
}

- (unsigned)cloudResourcePrefetchMode
{
  v2 = [(PHPhotoLibraryAttributes *)self cplSettings];
  uint64_t v3 = [v2 prefetchMode];

  if (v3 == 1) {
    return 2;
  }
  else {
    return v3 == 0;
  }
}

- (BOOL)isCloudSyncEnabled
{
  v2 = [(PHPhotoLibraryAttributes *)self cplSettings];
  char v3 = [v2 isICPLEnabled];

  return v3;
}

- (PHPhotoLibraryAttributes)initWithLibraryIdentifier:(id)a3 cplSettings:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PHPhotoLibraryAttributes;
  v9 = [(PHPhotoLibraryAttributes *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pl_libraryIdentifier, a3);
    objc_storeStrong((id *)&v10->_cplSettings, a4);
    uint64_t v11 = [(PLPhotoLibraryIdentifier *)v10->_pl_libraryIdentifier name];
    name = v10->_name;
    v10->_name = (NSString *)v11;

    uint64_t v13 = [(PLPhotoLibraryIdentifier *)v10->_pl_libraryIdentifier userDescription];
    userDescription = v10->_userDescription;
    v10->_userDescription = (NSString *)v13;
  }
  return v10;
}

@end