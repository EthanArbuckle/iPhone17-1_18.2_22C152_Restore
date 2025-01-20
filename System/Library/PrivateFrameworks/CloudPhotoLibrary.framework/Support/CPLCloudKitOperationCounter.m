@interface CPLCloudKitOperationCounter
- (CPLCloudKitOperationCounter)init;
- (id)status;
- (id)statusObject;
- (void)beginTask:(id)a3;
- (void)endTask:(id)a3 withOperationClasses:(id)a4 operationsAllowingCellular:(id)a5;
@end

@implementation CPLCloudKitOperationCounter

- (CPLCloudKitOperationCounter)init
{
  v6.receiver = self;
  v6.super_class = (Class)CPLCloudKitOperationCounter;
  v2 = [(CPLCloudKitOperationCounter *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    sessions = v2->_sessions;
    v2->_sessions = v3;
  }
  return v2;
}

- (void)beginTask:(id)a3
{
  id v4 = a3;
  if (qword_1002CEAE0 != -1) {
    dispatch_once(&qword_1002CEAE0, &stru_10027A890);
  }
  v5 = (id)qword_1002CEAD8;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000B9E58;
  v9[3] = &unk_100276018;
  v9[4] = self;
  id v10 = v4;
  objc_super v6 = v9;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BA6EC;
  block[3] = &unk_100275DF8;
  id v12 = v6;
  id v7 = v4;
  dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v8);
}

- (void)endTask:(id)a3 withOperationClasses:(id)a4 operationsAllowingCellular:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (qword_1002CEAE0 != -1) {
    dispatch_once(&qword_1002CEAE0, &stru_10027A890);
  }
  v11 = (id)qword_1002CEAD8;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000BA0D4;
  v17[3] = &unk_100277038;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v12 = v17;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BA6EC;
  block[3] = &unk_100275DF8;
  id v22 = v12;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_block_t v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v16);
}

- (id)statusObject
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1000BA208;
  id v10 = sub_1000BA218;
  id v11 = 0;
  if (qword_1002CEAE0 != -1) {
    dispatch_once(&qword_1002CEAE0, &stru_10027A890);
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000BA220;
  v5[3] = &unk_1002768A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)qword_1002CEAD8, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)status
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1000BA208;
  id v10 = sub_1000BA218;
  id v11 = 0;
  if (qword_1002CEAE0 != -1) {
    dispatch_once(&qword_1002CEAE0, &stru_10027A890);
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000BA4A8;
  v5[3] = &unk_1002768A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)qword_1002CEAD8, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
}

@end