@interface SetupGSXPCConn
@end

@implementation SetupGSXPCConn

void ___SetupGSXPCConn_block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

void ___SetupGSXPCConn_block_invoke_2(uint64_t a1)
{
  v2 = gs_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    ___SetupGSXPCConn_block_invoke_2_cold_1(v2);
  }

  v3 = sDaemonTrackerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___SetupGSXPCConn_block_invoke_130;
  block[3] = &unk_1E6C9F028;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  dispatch_async(v3, block);
  objc_destroyWeak(&v5);
}

void ___SetupGSXPCConn_block_invoke_130(uint64_t a1)
{
  uint64_t v1 = sDaemonConn;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if ((id)v1 == WeakRetained)
  {
    v3 = (void *)sDaemonConn;
    sDaemonConn = 0;

    v4 = (void *)sDaemonProxy;
    sDaemonProxy = 0;

    id v5 = +[GSStorageManager manager];
    [v5 _connectionWithDaemonWasLost];
  }
}

void ___SetupGSXPCConn_block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1DC715000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] revisiond died or is absent; retry connecting\n",
    v1,
    2u);
}

@end