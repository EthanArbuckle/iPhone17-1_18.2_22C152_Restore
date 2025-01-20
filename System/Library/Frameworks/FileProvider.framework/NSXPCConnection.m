@interface NSXPCConnection
@end

@implementation NSXPCConnection

void __69__NSXPCConnection_FPAdditions__fp_annotateInvocation_withLogSection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v9 = fpfs_adopt_log(*(void **)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  v5 = FPPopLogSectionForBlock(WeakRetained);

  if (v5)
  {
    v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      id v8 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v11 = v5;
      __int16 v12 = 2112;
      v13 = @"(unavailable)";
      __int16 v14 = 2080;
      uint64_t v15 = [v8 fileSystemRepresentation];
      _os_log_debug_impl(&dword_1A33AE000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s ", buf, 0x20u);
    }
  }
  v7 = (void *)MEMORY[0x1A6248B00](*(void *)(a1 + 40));
  [v3 setTarget:v7];

  [v3 invoke];
  objc_storeWeak((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), 0);
  __fp_pop_log(&v9);
}

@end