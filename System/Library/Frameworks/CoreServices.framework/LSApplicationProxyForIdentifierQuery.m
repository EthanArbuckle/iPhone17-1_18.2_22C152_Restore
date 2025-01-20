@interface LSApplicationProxyForIdentifierQuery
@end

@implementation LSApplicationProxyForIdentifierQuery

void __71___LSApplicationProxyForIdentifierQuery_alwaysAllowedBundleIdentifiers__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1ECB43B58];
  v1 = (void *)+[_LSApplicationProxyForIdentifierQuery alwaysAllowedBundleIdentifiers]::result;
  +[_LSApplicationProxyForIdentifierQuery alwaysAllowedBundleIdentifiers]::result = v0;
}

@end