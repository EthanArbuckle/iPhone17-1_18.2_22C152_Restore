@interface DOCNodeStartupManager
+ (DOCNodeStartupManager)shared;
- (BOOL)isStarted;
- (void)_start;
- (void)setIsStarted:(BOOL)a3;
- (void)startIfNeeded;
@end

@implementation DOCNodeStartupManager

uint64_t __38__DOCNodeStartupManager_startIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _start];
}

+ (DOCNodeStartupManager)shared
{
  if (shared_onceToken_1 != -1) {
    dispatch_once(&shared_onceToken_1, &__block_literal_global_14);
  }
  v2 = (void *)shared_shared;
  return (DOCNodeStartupManager *)v2;
}

- (void)_start
{
  v2 = os_log_create("com.apple.DocumentManager", "PointsOfInterest");
  os_signpost_id_t v3 = os_signpost_id_generate(v2);
  v4 = v2;
  v5 = v4;
  if (v3 - 1 > 0xFFFFFFFFFFFFFFFDLL)
  {

    StartFINode();
    v7 = v5;
  }
  else
  {
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_213670000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "Files-FINode.start", (const char *)&unk_2136A6D6B, buf, 2u);
    }

    StartFINode();
    v6 = v5;
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)v8 = 0;
      _os_signpost_emit_with_name_impl(&dword_213670000, v6, OS_SIGNPOST_INTERVAL_END, v3, "Files-FINode.start", (const char *)&unk_2136A6D6B, v8, 2u);
    }
  }
}

- (void)startIfNeeded
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__DOCNodeStartupManager_startIfNeeded__block_invoke;
  block[3] = &unk_2641B55D8;
  block[4] = self;
  if (startIfNeeded_onceToken != -1) {
    dispatch_once(&startIfNeeded_onceToken, block);
  }
}

uint64_t __31__DOCNodeStartupManager_shared__block_invoke()
{
  v0 = objc_alloc_init(DOCNodeStartupManager);
  uint64_t v1 = shared_shared;
  shared_shared = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (BOOL)isStarted
{
  return self->_isStarted;
}

- (void)setIsStarted:(BOOL)a3
{
  self->_isStarted = a3;
}

@end