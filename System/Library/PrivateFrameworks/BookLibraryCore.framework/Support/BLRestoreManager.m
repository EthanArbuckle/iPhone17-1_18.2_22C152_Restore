@interface BLRestoreManager
+ (id)sharedInstance;
- (BLDownloadManager)downloadManager;
- (BLRestoreManager)init;
- (BOOL)_isCellularAccessValueReadyOrAlreadyInUse;
- (BOOL)cellularAccessValueReadyOrAlreadyInUse;
- (BOOL)isCellularAllowed;
- (MBCellularAccess)cellularAccess;
- (MBManager)restoreManager;
- (OS_dispatch_queue)dispatchQueue;
- (int)restoreCellularToken;
- (void)_applyRestoreCellularAccess;
- (void)_waitForCellularAccessValueReady;
- (void)dealloc;
- (void)dq_fetchRestoreCellularAccess;
- (void)dq_setupRestoreStateChangeHandler;
- (void)setCellularAccess:(id)a3;
- (void)setCellularAccessValueReadyOrAlreadyInUse:(BOOL)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setDownloadManager:(id)a3;
- (void)setRestoreCellularToken:(int)a3;
- (void)setRestoreManager:(id)a3;
- (void)setupWithDownloadManager:(id)a3;
@end

@implementation BLRestoreManager

+ (id)sharedInstance
{
  if (qword_1001C80E8 != -1) {
    dispatch_once(&qword_1001C80E8, &stru_1001A0FC0);
  }
  v2 = (void *)qword_1001C80F0;

  return v2;
}

- (BLRestoreManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)BLRestoreManager;
  v2 = [(BLRestoreManager *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->_accessLock._os_unfair_lock_opaque = 0;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.ibooks.BLService.RestoreManager.dispatchQueue", v4);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v5;

    v7 = (MBManager *)objc_alloc_init((Class)MBManager);
    restoreManager = v3->_restoreManager;
    v3->_restoreManager = v7;
  }
  return v3;
}

- (void)dealloc
{
  notify_cancel([(BLRestoreManager *)self restoreCellularToken]);
  v3.receiver = self;
  v3.super_class = (Class)BLRestoreManager;
  [(BLRestoreManager *)&v3 dealloc];
}

- (void)setupWithDownloadManager:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = BLServiceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Restore-Mgr] Setting up restore manager.", buf, 2u);
  }

  [(BLRestoreManager *)self setDownloadManager:v4];
  v6 = [(BLRestoreManager *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005EAC;
  block[3] = &unk_1001A0FE8;
  block[4] = self;
  dispatch_async(v6, block);
}

- (BOOL)isCellularAllowed
{
  v2 = self;
  [(BLRestoreManager *)self _waitForCellularAccessValueReady];
  p_accessLock = &v2->_accessLock;
  os_unfair_lock_lock(&v2->_accessLock);
  id v4 = [(BLRestoreManager *)v2 cellularAccess];
  LOBYTE(v2) = v4 != 0;

  os_unfair_lock_unlock(p_accessLock);
  return (char)v2;
}

- (BOOL)_isCellularAccessValueReadyOrAlreadyInUse
{
  v2 = self;
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  LOBYTE(v2) = [(BLRestoreManager *)v2 cellularAccessValueReadyOrAlreadyInUse];
  os_unfair_lock_unlock(p_accessLock);
  return (char)v2;
}

- (void)_waitForCellularAccessValueReady
{
  unsigned __int8 v3 = [(BLRestoreManager *)self _isCellularAccessValueReadyOrAlreadyInUse];
  id v4 = BLServiceLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Restore-Mgr] Proceeding as if cellular policy is ready", buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Restore-Mgr] Waiting for cellular policy to be ready", buf, 2u);
    }

    v6 = dispatch_group_create();
    dispatch_group_enter(v6);
    v7 = [(BLRestoreManager *)self dispatchQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000610C;
    block[3] = &unk_1001A0FE8;
    id v4 = v6;
    v11 = v4;
    dispatch_async(v7, block);

    dispatch_time_t v8 = dispatch_time(0, 5000000000);
    if (dispatch_group_wait(v4, v8))
    {
      v9 = BLServiceLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "[Restore-Mgr] Timed out waiting for cellular policy", buf, 2u);
      }
    }
    os_unfair_lock_lock(&self->_accessLock);
    [(BLRestoreManager *)self setCellularAccessValueReadyOrAlreadyInUse:1];
    os_unfair_lock_unlock(&self->_accessLock);
  }
}

- (void)_applyRestoreCellularAccess
{
  unsigned __int8 v3 = BLServiceLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(BLRestoreManager *)self cellularAccess];
    int v6 = 138412290;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Restore-Mgr] About to apply cellular policy: %@", (uint8_t *)&v6, 0xCu);
  }
  BOOL v5 = [(BLRestoreManager *)self downloadManager];
  [v5 updatePoliciesForRestoreDownloadsWithCompletion:&stru_1001A1028];
}

- (void)dq_fetchRestoreCellularAccess
{
  unsigned __int8 v3 = [(BLRestoreManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(BLRestoreManager *)self restoreManager];
  id v12 = 0;
  BOOL v5 = [v4 backgroundRestoreCellularAccessWithError:&v12];
  id v6 = v12;

  v7 = BLServiceLog();
  dispatch_time_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[Restore-Mgr] The restore cellular policy changed, but we couldn't fetch it:  %@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[Restore-Mgr] Got cellular policy: %@", buf, 0xCu);
    }

    os_unfair_lock_lock(&self->_accessLock);
    dispatch_time_t v8 = [(BLRestoreManager *)self cellularAccess];
    [(BLRestoreManager *)self setCellularAccess:v5];
    unsigned int v9 = [(BLRestoreManager *)self cellularAccessValueReadyOrAlreadyInUse];
    [(BLRestoreManager *)self setCellularAccessValueReadyOrAlreadyInUse:1];
    os_unfair_lock_unlock(&self->_accessLock);
    if (v9)
    {
      if ((v5 == 0) == (v8 != 0)
        || (unsigned int v10 = [v8 allowsExpensiveNetworkAccess],
            v10 != [v5 allowsExpensiveNetworkAccess]))
      {
        [(BLRestoreManager *)self _applyRestoreCellularAccess];
      }
    }
    else
    {
      v11 = BLServiceLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[Restore-Mgr] Skip cellular policy changed check", buf, 2u);
      }
    }
  }
}

- (void)dq_setupRestoreStateChangeHandler
{
  unsigned __int8 v3 = [(BLRestoreManager *)self dispatchQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (const char *)[kMBBackgroundRestoreCellularAccessChangedNotification UTF8String];
  BOOL v5 = [(BLRestoreManager *)self dispatchQueue];
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100006598;
  handler[3] = &unk_1001A1050;
  handler[4] = self;
  notify_register_dispatch(v4, &self->_restoreCellularToken, v5, handler);

  [(BLRestoreManager *)self dq_fetchRestoreCellularAccess];
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BLDownloadManager)downloadManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_downloadManager);

  return (BLDownloadManager *)WeakRetained;
}

- (void)setDownloadManager:(id)a3
{
}

- (MBManager)restoreManager
{
  return self->_restoreManager;
}

- (void)setRestoreManager:(id)a3
{
}

- (MBCellularAccess)cellularAccess
{
  return self->_cellularAccess;
}

- (void)setCellularAccess:(id)a3
{
}

- (BOOL)cellularAccessValueReadyOrAlreadyInUse
{
  return self->_cellularAccessValueReadyOrAlreadyInUse;
}

- (void)setCellularAccessValueReadyOrAlreadyInUse:(BOOL)a3
{
  self->_cellularAccessValueReadyOrAlreadyInUse = a3;
}

- (int)restoreCellularToken
{
  return self->_restoreCellularToken;
}

- (void)setRestoreCellularToken:(int)a3
{
  self->_restoreCellularToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellularAccess, 0);
  objc_storeStrong((id *)&self->_restoreManager, 0);
  objc_destroyWeak((id *)&self->_downloadManager);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end