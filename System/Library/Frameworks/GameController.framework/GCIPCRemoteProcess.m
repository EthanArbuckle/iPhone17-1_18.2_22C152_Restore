@interface GCIPCRemoteProcess
@end

@implementation GCIPCRemoteProcess

void __37___GCIPCRemoteProcess_addConnection___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 48);
  id v3 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  v5 = [*(id *)(a1 + 32) connectionInvalidationRegistrations];
  char v6 = [v5 containsObject:v3];

  if ((v6 & 1) == 0)
  {
    v10 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 56), *(void *)(a1 + 32), @"GCIPCProcess.m", 97, @"Bug in %s", "-[_GCIPCRemoteProcess addConnection:]_block_invoke");
  }
  v7 = [*(id *)(a1 + 32) connectionInvalidationRegistrations];
  [v7 removeObject:v3];

  v8 = [*(id *)(a1 + 32) connections];
  v9 = (void *)[v8 mutableCopy];

  if (([v9 containsObject:v2] & 1) == 0)
  {
    v11 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 56), *(void *)(a1 + 32), @"GCIPCProcess.m", 101, @"Bug in %s", "-[_GCIPCRemoteProcess addConnection:]_block_invoke");
  }
  if (gc_isInternalBuild())
  {
    v12 = getGCLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v15 = v13;
      __int16 v16 = 2112;
      id v17 = v2;
      _os_log_impl(&dword_220998000, v12, OS_LOG_TYPE_INFO, "%@ removing connection: %@", buf, 0x16u);
    }
  }
  [v9 removeObject:v2];
  [*(id *)(a1 + 32) setConnections:v9];

  objc_sync_exit(v4);
}

@end