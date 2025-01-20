@interface CPLSyncIndicator
+ (void)_doProtected:(id)a3;
+ (void)hideSyncIndicator;
+ (void)setForeground:(BOOL)a3;
+ (void)showSyncIndicator;
@end

@implementation CPLSyncIndicator

+ (void)setForeground:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __34__CPLSyncIndicator_setForeground___block_invoke;
  v3[3] = &__block_descriptor_41_e5_v8__0l;
  BOOL v4 = a3;
  v3[4] = a1;
  [a1 _doProtected:v3];
}

uint64_t __34__CPLSyncIndicator_setForeground___block_invoke(uint64_t result)
{
  int v1 = *(unsigned __int8 *)(result + 40);
  if (v1 != _foreground)
  {
    _foreground = *(unsigned char *)(result + 40);
    if (_showSyncIndicator == 1)
    {
      v2 = *(void **)(result + 32);
      if (v1) {
        return [v2 _reallyShowSyncIndicator];
      }
      else {
        return [v2 _reallyHideSyncIndicator];
      }
    }
  }
  return result;
}

+ (void)hideSyncIndicator
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __37__CPLSyncIndicator_hideSyncIndicator__block_invoke;
  v2[3] = &__block_descriptor_40_e5_v8__0l;
  v2[4] = a1;
  [a1 _doProtected:v2];
}

uint64_t __37__CPLSyncIndicator_hideSyncIndicator__block_invoke(uint64_t result)
{
  if (_showSyncIndicator == 1)
  {
    if (_foreground) {
      result = [*(id *)(result + 32) _reallyHideSyncIndicator];
    }
    _showSyncIndicator = 0;
  }
  return result;
}

+ (void)showSyncIndicator
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __37__CPLSyncIndicator_showSyncIndicator__block_invoke;
  v2[3] = &__block_descriptor_40_e5_v8__0l;
  v2[4] = a1;
  [a1 _doProtected:v2];
}

uint64_t __37__CPLSyncIndicator_showSyncIndicator__block_invoke(uint64_t result)
{
  if ((_showSyncIndicator & 1) == 0)
  {
    if (_foreground) {
      result = [*(id *)(result + 32) _reallyShowSyncIndicator];
    }
    _showSyncIndicator = 1;
  }
  return result;
}

+ (void)_doProtected:(id)a3
{
  uint64_t v3 = _doProtected__onceToken_14580;
  id v4 = a3;
  id v6 = v4;
  if (v3 == -1)
  {
    v5 = v4;
  }
  else
  {
    dispatch_once(&_doProtected__onceToken_14580, &__block_literal_global_14581);
    v5 = v6;
  }
  dispatch_sync((dispatch_queue_t)_doProtected__queue, v5);
}

uint64_t __33__CPLSyncIndicator__doProtected___block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.cpl.syncindicator", 0);
  uint64_t v1 = _doProtected__queue;
  _doProtected__queue = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end