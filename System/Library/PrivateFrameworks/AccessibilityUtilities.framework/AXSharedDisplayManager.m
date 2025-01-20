@interface AXSharedDisplayManager
@end

@implementation AXSharedDisplayManager

void ___AXSharedDisplayManager_block_invoke()
{
  if (_AXSCurrentProcessIsWebContent())
  {
    _AXSharedDisplayManager_CanAccessDisplayManager = 1;
  }
  else
  {
    uint64_t v5 = 0;
    v6 = &v5;
    uint64_t v7 = 0x2050000000;
    v0 = (void *)getAXMDisplayManagerClass_softClass;
    uint64_t v8 = getAXMDisplayManagerClass_softClass;
    if (!getAXMDisplayManagerClass_softClass)
    {
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __getAXMDisplayManagerClass_block_invoke;
      v4[3] = &unk_1E5585E30;
      v4[4] = &v5;
      __getAXMDisplayManagerClass_block_invoke((uint64_t)v4);
      v0 = (void *)v6[3];
    }
    v1 = v0;
    _Block_object_dispose(&v5, 8);
    uint64_t v2 = [[v1 alloc] initWithCompletion:&__block_literal_global_282];
    v3 = (void *)_AXSharedDisplayManager__Shared;
    _AXSharedDisplayManager__Shared = v2;
  }
}

uint64_t ___AXSharedDisplayManager_block_invoke_2()
{
  return AXPerformBlockSynchronouslyOnMainThread();
}

void ___AXSharedDisplayManager_block_invoke_3()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (MEMORY[0x192F9CA10]())
  {
    v0 = AXLogDisplay();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      v1 = _AXSharedDisplayManager();
      uint64_t v2 = [v1 coreAnimationMainDisplay];
      int v3 = 138412290;
      v4 = v2;
      _os_log_impl(&dword_18D308000, v0, OS_LOG_TYPE_DEFAULT, "Did finish initializing AX DisplayManager: %@", (uint8_t *)&v3, 0xCu);
    }
  }
}

@end