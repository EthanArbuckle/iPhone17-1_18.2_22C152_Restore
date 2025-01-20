@interface NSExtensionContextEmitNotifications
@end

@implementation NSExtensionContextEmitNotifications

void ___NSExtensionContextEmitNotifications_block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "_extensionContextForUUID:");
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (_NSExtensionDummyExtensionContext_onceToken != -1) {
      dispatch_once(&_NSExtensionDummyExtensionContext_onceToken, &__block_literal_global_178);
    }
    id v2 = (id)_NSExtensionDummyExtensionContext_context;
  }
  v3 = v2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = ___NSExtensionContextEmitNotifications_block_invoke_2;
  v5[3] = &unk_1E573CF18;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v8 = v3;
  id v9 = *(id *)(a1 + 64);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t ___NSExtensionContextEmitNotifications_block_invoke_2(void *a1)
{
  Class Class = objc_getClass("UIApplication");
  if (Class)
  {
    v3 = [(objc_class *)Class performSelector:sel_sharedApplication];
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:a1[4] object:v3 userInfo:0];
  }
  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:a1[5] object:a1[6] userInfo:0];

  id v6 = *(uint64_t (**)(void))(a1[7] + 16);

  return v6();
}

@end