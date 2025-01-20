@interface NSFileProviderKnownFolderLocation
- (NSFileProviderKnownFolderLocation)initWithExistingItemIdentifier:(id)a3;
- (NSFileProviderKnownFolderLocation)initWithParentItemIdentifier:(id)a3 filename:(id)a4;
- (id)asExistingLocation;
- (id)asPathMatchingLocation;
@end

@implementation NSFileProviderKnownFolderLocation

- (NSFileProviderKnownFolderLocation)initWithParentItemIdentifier:(id)a3 filename:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[FPKnownFolderPathMatchingLocation alloc] initWithParentItemIdentifier:v7 filename:v6];

  return &v8->super;
}

- (NSFileProviderKnownFolderLocation)initWithExistingItemIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [[FPKnownFolderExistingLocation alloc] initWithExistingItemIdentifier:v4];

  return &v5->super;
}

- (id)asExistingLocation
{
  return 0;
}

- (id)asPathMatchingLocation
{
  return 0;
}

@end