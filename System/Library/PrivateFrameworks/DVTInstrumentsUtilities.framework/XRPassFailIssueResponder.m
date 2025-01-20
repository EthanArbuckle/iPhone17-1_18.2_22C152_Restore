@interface XRPassFailIssueResponder
- (BOOL)failureOccurred;
- (XRPassFailIssueResponder)init;
- (XRPassFailIssueResponder)initWithNextResponder:(id)a3;
- (id)failures;
- (void)handleIssue:(id)a3 type:(signed __int16)a4 from:(id)a5;
@end

@implementation XRPassFailIssueResponder

- (XRPassFailIssueResponder)initWithNextResponder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)XRPassFailIssueResponder;
  v5 = [(XRPassFailIssueResponder *)&v11 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    uniqueErrors = v5->_uniqueErrors;
    v5->_uniqueErrors = (NSMutableArray *)v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.dt.pass-fail.unique-error", 0);
    uniqueErrorsQueue = v5->_uniqueErrorsQueue;
    v5->_uniqueErrorsQueue = (OS_dispatch_queue *)v8;

    objc_storeWeak((id *)&v5->_nextResponder, v4);
  }

  return v5;
}

- (XRPassFailIssueResponder)init
{
  return (XRPassFailIssueResponder *)((uint64_t (*)(XRPassFailIssueResponder *, char *, void))MEMORY[0x270F9A6D0])(self, sel_initWithNextResponder_, 0);
}

- (void)handleIssue:(id)a3 type:(signed __int16)a4 from:(id)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (!v6)
  {
    uniqueErrorsQueue = self->_uniqueErrorsQueue;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = sub_234583188;
    v13[3] = &unk_264BF0D90;
    v13[4] = self;
    id v14 = v8;
    dispatch_async(uniqueErrorsQueue, v13);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_nextResponder);
  [v12 handleIssue:v6 type:(uint64_t)v8 from:(uint64_t)v9];
}

- (BOOL)failureOccurred
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uniqueErrorsQueue = self->_uniqueErrorsQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_234583240;
  v5[3] = &unk_264BF1DC8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(uniqueErrorsQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)failures
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = sub_234583370;
  v10 = sub_234583380;
  id v11 = 0;
  uniqueErrorsQueue = self->_uniqueErrorsQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_234583388;
  v5[3] = &unk_264BF1DC8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(uniqueErrorsQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueErrorsQueue, 0);
  objc_storeStrong((id *)&self->_uniqueErrors, 0);

  objc_destroyWeak((id *)&self->_nextResponder);
}

@end