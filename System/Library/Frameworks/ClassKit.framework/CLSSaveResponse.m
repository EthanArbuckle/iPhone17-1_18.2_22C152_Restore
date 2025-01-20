@interface CLSSaveResponse
- (CLSSaveResponse)init;
- (id)completion;
- (id)savedObjectWithObjectID:(id)a3;
- (void)clientRemote_deliverObject:(id)a3;
- (void)clientRemote_saveDone:(id)a3;
- (void)setCompletion:(id)a3;
@end

@implementation CLSSaveResponse

- (CLSSaveResponse)init
{
  v14.receiver = self;
  v14.super_class = (Class)CLSSaveResponse;
  v2 = [(CLSSaveResponse *)&v14 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    objectsByID = v2->_objectsByID;
    v2->_objectsByID = (NSMutableDictionary *)v3;

    v5 = CLSDispatchQueueName(v2, 0);
    v8 = (const char *)objc_msgSend_UTF8String(v5, v6, v7);
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    if (qword_1EB5D4758 != -1) {
      dispatch_once(&qword_1EB5D4758, &unk_1F37A14D0);
    }
    v10 = (id)qword_1EB5D4750;
    dispatch_queue_t v11 = dispatch_queue_create_with_target_V2(v8, v9, v10);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v11;
  }
  return v2;
}

- (id)savedObjectWithObjectID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_1DC6261FC;
  v16 = sub_1DC62620C;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1DC626214;
  block[3] = &unk_1E6C95D68;
  id v10 = v4;
  dispatch_queue_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)clientRemote_deliverObject:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1DC626334;
  block[3] = &unk_1E6C95B30;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)clientRemote_saveDone:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E01A05F0](self->_completion);
  id v6 = v5;
  if (v5)
  {
    queue = self->_queue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1DC62652C;
    v8[3] = &unk_1E6C95DB8;
    id v10 = v5;
    id v9 = v4;
    dispatch_async(queue, v8);
  }
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_objectsByID, 0);
}

@end