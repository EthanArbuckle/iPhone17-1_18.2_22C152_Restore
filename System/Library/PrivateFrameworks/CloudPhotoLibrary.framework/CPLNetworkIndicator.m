@interface CPLNetworkIndicator
+ (void)_doProtected:(id)a3;
+ (void)_reallyHideNetworkIndicatorForBundleWithIdentifierLocked:(id)a3;
+ (void)_reallyShowNetworkIndicatorForBundleWithIdentifierLocked:(id)a3;
+ (void)hideNetworkIndicatorForBundleWithIdentifier:(id)a3;
+ (void)showNetworkIndicatorForBundleWithIdentifier:(id)a3;
@end

@implementation CPLNetworkIndicator

+ (void)hideNetworkIndicatorForBundleWithIdentifier:(id)a3
{
  v5 = (__CFString *)a3;
  v6 = @"com.apple.mobileslideshow";
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__CPLNetworkIndicator_hideNetworkIndicatorForBundleWithIdentifier___block_invoke;
  v8[3] = &unk_1E60AAE80;
  if (v5) {
    v6 = v5;
  }
  v9 = v6;
  SEL v10 = a2;
  id v11 = a1;
  v7 = v6;
  [a1 _doProtected:v8];
}

uint64_t __67__CPLNetworkIndicator_hideNetworkIndicatorForBundleWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (([(id)bundleIdentifiersWithNetworkIndicator containsObject:*(void *)(a1 + 32)] & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      v5 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
        uint64_t v7 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v14 = v6;
        __int16 v15 = 2112;
        uint64_t v16 = v7;
        _os_log_impl(&dword_1B4CAC000, v5, OS_LOG_TYPE_ERROR, "%@ was called too many times for %@", buf, 0x16u);
      }
    }
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    id v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/CPLNetworkIndicator.m"];
    v12 = NSStringFromSelector(*(SEL *)(a1 + 40));
    [v8 handleFailureInMethod:v9, v10, v11, 71, @"%@ was called too many times for %@", v12, *(void *)(a1 + 32) object file lineNumber description];

    abort();
  }
  [(id)bundleIdentifiersWithNetworkIndicator removeObject:*(void *)(a1 + 32)];
  uint64_t result = [(id)bundleIdentifiersWithNetworkIndicator containsObject:*(void *)(a1 + 32)];
  if ((result & 1) == 0)
  {
    v3 = *(void **)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 32);
    return [v3 _reallyHideNetworkIndicatorForBundleWithIdentifierLocked:v4];
  }
  return result;
}

+ (void)showNetworkIndicatorForBundleWithIdentifier:(id)a3
{
  uint64_t v4 = (__CFString *)a3;
  v5 = @"com.apple.mobileslideshow";
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__CPLNetworkIndicator_showNetworkIndicatorForBundleWithIdentifier___block_invoke;
  v7[3] = &unk_1E60A6598;
  if (v4) {
    v5 = v4;
  }
  v8 = v5;
  id v9 = a1;
  v6 = v5;
  [a1 _doProtected:v7];
}

uint64_t __67__CPLNetworkIndicator_showNetworkIndicatorForBundleWithIdentifier___block_invoke(uint64_t a1)
{
  if (([(id)bundleIdentifiersWithNetworkIndicator containsObject:*(void *)(a1 + 32)] & 1) == 0) {
    [*(id *)(a1 + 40) _reallyShowNetworkIndicatorForBundleWithIdentifierLocked:*(void *)(a1 + 32)];
  }
  v2 = (void *)bundleIdentifiersWithNetworkIndicator;
  uint64_t v3 = *(void *)(a1 + 32);
  return [v2 addObject:v3];
}

+ (void)_doProtected:(id)a3
{
  id v3 = a3;
  if (_doProtected__onceToken_22091 != -1) {
    dispatch_once(&_doProtected__onceToken_22091, &__block_literal_global_22092);
  }
  uint64_t v4 = (void *)_doProtected__queue_22093;
  id v5 = v3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_22094;
  block[3] = &unk_1E60A6978;
  id v9 = v5;
  v6 = v4;
  dispatch_block_t v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v6, v7);
}

uint64_t __36__CPLNetworkIndicator__doProtected___block_invoke()
{
  v0 = CPLCopyDefaultSerialQueueAttributes();
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.cpl.networkindicator", v0);
  v2 = (void *)_doProtected__queue_22093;
  _doProtected__queue_22093 = (uint64_t)v1;

  id v3 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  uint64_t v4 = bundleIdentifiersWithNetworkIndicator;
  bundleIdentifiersWithNetworkIndicator = (uint64_t)v3;
  return MEMORY[0x1F41817F8](v3, v4);
}

+ (void)_reallyHideNetworkIndicatorForBundleWithIdentifierLocked:(id)a3
{
  if (__SBSSetStatusBarShowsActivityForApplication) {
    __SBSSetStatusBarShowsActivityForApplication(0, a3, 3600);
  }
}

+ (void)_reallyShowNetworkIndicatorForBundleWithIdentifierLocked:(id)a3
{
  if (__SBSSetStatusBarShowsActivityForApplication) {
    __SBSSetStatusBarShowsActivityForApplication(1, a3, 3600);
  }
}

@end