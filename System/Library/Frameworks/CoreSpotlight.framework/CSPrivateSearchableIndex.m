@interface CSPrivateSearchableIndex
+ (id)defaultSearchableIndex;
- (const)defaultIndexPath;
- (id)addExtensionToken:(id)a3 indexPath:(const char *)a4 connection:(id)a5;
- (id)initialConnection;
@end

@implementation CSPrivateSearchableIndex

- (const)defaultIndexPath
{
  v2 = [(CSSearchableIndex *)self bundleIdentifier];
  CSPrivateIndexDefaultPath(v2);
  id v3 = objc_claimAutoreleasedReturnValue();
  v4 = (const char *)[v3 UTF8String];

  return v4;
}

- (id)initialConnection
{
  v2 = [(CSUnhousedSearchableIndex *)self resolvedIndexPath];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    v5 = [MEMORY[0x1E4F28B50] mainBundle];
    id v4 = [v5 bundleIdentifier];
  }
  v6 = +[CSUnhousedIndexConnection unhousedIndexConnectionForToken:v4];

  return v6;
}

- (id)addExtensionToken:(id)a3 indexPath:(const char *)a4 connection:(id)a5
{
  return addExtensionToken(a3, a4, a5);
}

+ (id)defaultSearchableIndex
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__CSPrivateSearchableIndex_defaultSearchableIndex__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultSearchableIndex_onceToken_739 != -1) {
    dispatch_once(&defaultSearchableIndex_onceToken_739, block);
  }
  v2 = (void *)defaultSearchableIndex_sDefaultInstance_738;

  return v2;
}

uint64_t __50__CSPrivateSearchableIndex_defaultSearchableIndex__block_invoke(uint64_t a1)
{
  defaultSearchableIndex_sDefaultInstance_738 = [objc_alloc(*(Class *)(a1 + 32)) _initWithName:@"CSSearchableIndexShared" protectionClass:0 bundleIdentifier:0 options:0 disableBatching:1];

  return MEMORY[0x1F41817F8]();
}

@end