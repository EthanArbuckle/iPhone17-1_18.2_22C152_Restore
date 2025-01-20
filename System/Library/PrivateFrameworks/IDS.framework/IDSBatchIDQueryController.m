@interface IDSBatchIDQueryController
- (IDSBatchIDQueryController)initWithService:(id)a3 delegate:(id)a4 queue:(id)a5;
- (void)dealloc;
- (void)invalidate;
- (void)setDestinations:(id)a3;
@end

@implementation IDSBatchIDQueryController

- (IDSBatchIDQueryController)initWithService:(id)a3 delegate:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (_IDSRunningInDaemon())
  {
    v11 = +[IDSLogging IDQuery];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_191A2A590((uint64_t)self, v11);
    }

    v12 = 0;
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)IDSBatchIDQueryController;
    v13 = [(IDSBatchIDQueryController *)&v21 init];
    if (v13)
    {
      if (qword_1E92DE240 != -1) {
        dispatch_once(&qword_1E92DE240, &unk_1EE2463C8);
      }
      v14 = qword_1E92DE248;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = sub_191954A90;
      v16[3] = &unk_1E5729680;
      v17 = v13;
      id v18 = v8;
      id v19 = v9;
      id v20 = v10;
      dispatch_sync(v14, v16);
    }
    self = v13;
    v12 = self;
  }

  return v12;
}

- (void)dealloc
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_191954B80;
  block[3] = &unk_1E5729000;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)qword_1E92DE248, block);
  v3.receiver = self;
  v3.super_class = (Class)IDSBatchIDQueryController;
  [(IDSBatchIDQueryController *)&v3 dealloc];
}

- (void)setDestinations:(id)a3
{
  id v4 = a3;
  v5 = qword_1E92DE248;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_191954C2C;
  v7[3] = &unk_1E57291B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (void)invalidate
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_191954CB0;
  block[3] = &unk_1E5729000;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)qword_1E92DE248, block);
}

- (void).cxx_destruct
{
}

@end