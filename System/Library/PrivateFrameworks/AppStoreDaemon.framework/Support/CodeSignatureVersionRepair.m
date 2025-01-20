@interface CodeSignatureVersionRepair
+ (BOOL)shouldAttemptToRepairApplication:(id)a3 options:(id)a4 logKey:(id)a5;
- (ApplicationRepairDelegate)delegate;
- (BOOL)repairApplication:(id)a3 error:(id *)a4;
- (LogKey)logKey;
- (NSArray)repairedBundleIDs;
- (NSString)repairType;
- (int)fairPlayStatus;
- (void)setDelegate:(id)a3;
- (void)setLogKey:(id)a3;
@end

@implementation CodeSignatureVersionRepair

+ (BOOL)shouldAttemptToRepairApplication:(id)a3 options:(id)a4 logKey:(id)a5
{
  return objc_msgSend(a4, "exitReason", a3) == (id)32;
}

- (BOOL)repairApplication:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = sub_1000184B8;
  v40 = sub_100017E18;
  id v41 = 0;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100422E64;
  v33[3] = &unk_10052A468;
  v33[4] = self;
  v35 = &v36;
  v7 = dispatch_semaphore_create(0);
  v34 = v7;
  v8 = objc_retainBlock(v33);
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = sub_1000184B8;
  v31 = sub_100017E18;
  id v32 = 0;
  v9 = sub_10001A308();
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100423034;
  v26[3] = &unk_100524060;
  v26[4] = self;
  v26[5] = &v27;
  [v9 readUsingSession:v26];

  if (v28[5])
  {
    id v10 = objc_alloc_init((Class)ASDCoastGuard);
    id v11 = [v6 storeItemID];
    if ([v10 isUnrepairableAppWithItemID:v11 externalVersionID:1])
    {
      v12 = [(id)v28[5] evid];
      unsigned __int8 v13 = objc_msgSend(v10, "isUnrepairableAppWithItemID:externalVersionID:", v11, objc_msgSend(v12, "unsignedLongLongValue"));

      if ((v13 & 1) == 0)
      {
        ((void (*)(void *))v8[2])(v8);
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  v14 = +[UpdatesManager sharedManager];
  requestToken = self->_requestToken;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10042308C;
  v22[3] = &unk_10052D9A8;
  v24 = v8;
  v25 = &v36;
  v23 = v7;
  [v14 reloadFromServerWithRequestToken:requestToken replyHandler:v22];

LABEL_7:
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  if (v37[5])
  {
    repairedBundleIDs = self->_repairedBundleIDs;
    self->_repairedBundleIDs = (NSArray *)&__NSArray0__struct;
  }
  else
  {
    bundleID = self->_bundleID;
    v17 = +[NSArray arrayWithObjects:&bundleID count:1];
    repairedBundleIDs = self->_repairedBundleIDs;
    self->_repairedBundleIDs = v17;
  }

  v18 = v37;
  if (a4)
  {
    v19 = (void *)v37[5];
    if (v19)
    {
      *a4 = v19;
      v18 = v37;
    }
  }
  BOOL v20 = v18[5] == 0;
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v36, 8);
  return v20;
}

- (int)fairPlayStatus
{
  return 0;
}

- (NSString)repairType
{
  return (NSString *)@"Code Signature Verification";
}

- (ApplicationRepairDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ApplicationRepairDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (LogKey)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
}

- (NSArray)repairedBundleIDs
{
  return self->_repairedBundleIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repairedBundleIDs, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_requestToken, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end