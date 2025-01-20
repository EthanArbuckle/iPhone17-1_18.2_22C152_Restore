@interface UnRegisterThemeRef
@end

@implementation UnRegisterThemeRef

void ___UnRegisterThemeRef_block_invoke_2(uint64_t a1)
{
}

void ___UnRegisterThemeRef_block_invoke(uint64_t a1, NSMapTable *table)
{
  v4 = NSMapGet(table, *(const void **)(a1 + 32));
  id v5 = v4;
  NSMapRemove(table, *(const void **)(a1 + 32));
  _CUILog(3, (uint64_t)"CoreUI: CUIThemeStore unregister themeRef %d", v6, v7, v8, v9, v10, v11, *(void *)(a1 + 32));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = ___UnRegisterThemeRef_block_invoke_2;
  block[3] = &unk_1E5A58B10;
  block[4] = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

@end