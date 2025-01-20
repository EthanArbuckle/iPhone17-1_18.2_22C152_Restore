@interface BRTrashItem
- (NSFileProviderItemVersion)itemVersion;
- (NSString)filename;
- (NSString)itemIdentifier;
- (NSString)parentItemIdentifier;
- (NSString)typeIdentifier;
- (unint64_t)capabilities;
- (unint64_t)fileSystemFlags;
@end

@implementation BRTrashItem

- (NSString)itemIdentifier
{
  return (NSString *)(id)*MEMORY[0x1E4F25C98];
}

- (NSString)parentItemIdentifier
{
  return (NSString *)(id)*MEMORY[0x1E4F25C68];
}

- (NSString)filename
{
  return (NSString *)@".Trash";
}

- (NSString)typeIdentifier
{
  return (NSString *)[(id)*MEMORY[0x1E4F443C8] identifier];
}

- (NSFileProviderItemVersion)itemVersion
{
  id v2 = objc_alloc(MEMORY[0x1E4F25DC8]);
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = (void *)[v2 initWithContentVersion:v3 metadataVersion:v4];

  return (NSFileProviderItemVersion *)v5;
}

- (unint64_t)capabilities
{
  if (BRIsFPFSEnabled(self, a2)) {
    return 3;
  }
  else {
    return 67;
  }
}

- (unint64_t)fileSystemFlags
{
  return 14;
}

@end