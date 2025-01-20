@interface _SFBSKWebClipCache
+ (id)sharedWebClipCache;
- (NSArray)webClipURLs;
- (void)_reloadWebClips;
- (void)_setWebClipURLs:(id *)a1;
@end

@implementation _SFBSKWebClipCache

+ (id)sharedWebClipCache
{
  if (+[_SFBSKWebClipCache sharedWebClipCache]::once != -1) {
    dispatch_once(&+[_SFBSKWebClipCache sharedWebClipCache]::once, &__block_literal_global_8);
  }
  v2 = (void *)+[_SFBSKWebClipCache sharedWebClipCache]::cache;

  return v2;
}

- (void)_reloadWebClips
{
  if (a1)
  {
    v2 = WBS_LOG_CHANNEL_PREFIXWebApp();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A690B000, v2, OS_LOG_TYPE_DEFAULT, "Fetching web clips", buf, 2u);
    }
    v3 = (void *)MEMORY[0x1E4F50C30];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __37___SFBSKWebClipCache__reloadWebClips__block_invoke;
    v5[3] = &unk_1E5C73720;
    v5[4] = a1;
    id v4 = a1;
    [v3 fetchWebClipsURLWithCompletionHandler:v5];
  }
}

- (void)_setWebClipURLs:(id *)a1
{
  id v4 = a2;
  if (a1 && ([a1[1] isEqualToArray:v4] & 1) == 0)
  {
    objc_storeStrong(a1 + 1, a2);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38___SFBSKWebClipCache__setWebClipURLs___block_invoke;
    block[3] = &unk_1E5C73108;
    block[4] = a1;
    v5 = a1;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (NSArray)webClipURLs
{
  return self->_webClipURLs;
}

- (void).cxx_destruct
{
}

@end