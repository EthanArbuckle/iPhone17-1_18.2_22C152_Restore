@interface ICFConfigureGlobals
@end

@implementation ICFConfigureGlobals

uint64_t ___ICFConfigureGlobals_block_invoke()
{
  sFilterLock = (uint64_t)objc_alloc_init(MEMORY[0x263F08AE0]);
  uint64_t v0 = MEMORY[0x263EF83A0];
  return MEMORY[0x270F3CCF0]("com.apple.incoming-call-filter-server-started", 0, v0, &__block_literal_global_5);
}

uint64_t ___ICFConfigureGlobals_block_invoke_2()
{
  uint64_t v0 = ICFDefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2129E5000, v0, OS_LOG_TYPE_DEFAULT, "Server came alive", buf, 2u);
  }
  [(id)sFilterLock lock];
  uint64_t v1 = [(id)sFilterBlocks count];
  v2 = ICFDefaultLog();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
  if (v1)
  {
    if (v3)
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2129E5000, v2, OS_LOG_TYPE_DEFAULT, " => We have active filters, connecting", v6, 2u);
    }
    _ICFConnectToServer();
  }
  else if (v3)
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2129E5000, v2, OS_LOG_TYPE_DEFAULT, " => No active filters, ignoring", v5, 2u);
  }
  return [(id)sFilterLock unlock];
}

@end