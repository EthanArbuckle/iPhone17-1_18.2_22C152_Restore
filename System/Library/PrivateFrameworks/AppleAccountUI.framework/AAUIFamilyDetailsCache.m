@interface AAUIFamilyDetailsCache
+ (id)sharedCache;
- (unint64_t)pendingInviteCount;
- (void)invalidate;
@end

@implementation AAUIFamilyDetailsCache

+ (id)sharedCache
{
  if (sharedCache_onceToken_0 != -1) {
    dispatch_once(&sharedCache_onceToken_0, &__block_literal_global_10);
  }
  v2 = (void *)sharedCache__sharedCache;
  return v2;
}

uint64_t __37__AAUIFamilyDetailsCache_sharedCache__block_invoke()
{
  sharedCache__sharedCache = objc_alloc_init(AAUIFamilyDetailsCache);
  return MEMORY[0x270F9A758]();
}

- (void)invalidate
{
  id v2 = [getFAFamilyDetailsCacheClass() sharedCache];
  [v2 invalidate];
}

- (unint64_t)pendingInviteCount
{
  id v2 = [getFAFamilyDetailsCacheClass() sharedCache];
  unint64_t v3 = [v2 pendingInviteCount];

  return v3;
}

@end