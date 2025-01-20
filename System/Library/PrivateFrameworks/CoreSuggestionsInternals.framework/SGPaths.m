@interface SGPaths
+ (id)suggestionsDirectoryFile:(id)a3;
+ (id)suggestionsSubdirectory:(id)a3;
+ (id)topDirectoryCreateIfNeeded:(BOOL)a3;
@end

@implementation SGPaths

+ (id)suggestionsSubdirectory:(id)a3
{
  return (id)[a1 subdirectory:a3 createIfNeeded:1];
}

+ (id)suggestionsDirectoryFile:(id)a3
{
  return (id)[a1 filename:a3 createIfNeeded:1];
}

+ (id)topDirectoryCreateIfNeeded:(BOOL)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__SGPaths_topDirectoryCreateIfNeeded___block_invoke;
  v5[3] = &__block_descriptor_41_e5_v8__0l;
  v5[4] = a1;
  BOOL v6 = a3;
  if (topDirectoryCreateIfNeeded___pasOnceToken2 != -1) {
    dispatch_once(&topDirectoryCreateIfNeeded___pasOnceToken2, v5);
  }
  v3 = (void *)topDirectoryCreateIfNeeded___pasExprOnceResult;
  return v3;
}

void __38__SGPaths_topDirectoryCreateIfNeeded___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v3 = [*(id *)(a1 + 32) topDirectoryWithName:@"Suggestions" createIfNeeded:*(unsigned __int8 *)(a1 + 40)];
  v4 = (void *)topDirectoryCreateIfNeeded___pasExprOnceResult;
  topDirectoryCreateIfNeeded___pasExprOnceResult = v3;
}

@end