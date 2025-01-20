@interface CSManagedSearchableIndex
+ (id)defaultSearchableIndex;
- (const)defaultIndexPath;
- (id)addExtensionToken:(id)a3 indexPath:(const char *)a4 connection:(id)a5;
- (id)initialConnection;
- (void)setUISearchEnabled:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation CSManagedSearchableIndex

+ (id)defaultSearchableIndex
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__CSManagedSearchableIndex_defaultSearchableIndex__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultSearchableIndex_onceToken_746 != -1) {
    dispatch_once(&defaultSearchableIndex_onceToken_746, block);
  }
  v2 = (void *)defaultSearchableIndex_sDefaultInstance_745;

  return v2;
}

uint64_t __50__CSManagedSearchableIndex_defaultSearchableIndex__block_invoke(uint64_t a1)
{
  defaultSearchableIndex_sDefaultInstance_745 = [objc_alloc(*(Class *)(a1 + 32)) _initWithName:@"CSSearchableIndexShared" protectionClass:0 bundleIdentifier:0 options:0 disableBatching:1];

  return MEMORY[0x1F41817F8]();
}

- (const)defaultIndexPath
{
  v2 = [(CSSearchableIndex *)self bundleIdentifier];
  CSManagedIndexDefaultPath(v2);
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

- (void)setUISearchEnabled:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = @"0";
  if (v4) {
    v7 = @"1";
  }
  v8 = [NSString stringWithFormat:@"setUISearchEnabled:%@", v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__CSManagedSearchableIndex_setUISearchEnabled_completionHandler___block_invoke;
  v10[3] = &unk_1E5549D78;
  id v11 = v6;
  id v9 = v6;
  [(CSSearchableIndex *)self _issueCommand:v8 completionHandler:v10];
}

void __65__CSManagedSearchableIndex_setUISearchEnabled_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    v5 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __65__CSManagedSearchableIndex_setUISearchEnabled_completionHandler___block_invoke_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __65__CSManagedSearchableIndex_setUISearchEnabled_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18D0E3000, v0, v1, "Error setting managed index UI search enablement: %@", v2, v3, v4, v5, v6);
}

@end