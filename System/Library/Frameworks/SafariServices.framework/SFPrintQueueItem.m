@interface SFPrintQueueItem
- (BOOL)initiatedByWebContent;
- (SFPrintQueueItem)initWithFrameHandle:(id)a3 initiatedByWebContent:(BOOL)a4 completionHandler:(id)a5;
- (_WKFrameHandle)frameHandle;
- (void)completeWithResult:(int64_t)a3;
- (void)dealloc;
@end

@implementation SFPrintQueueItem

- (SFPrintQueueItem)initWithFrameHandle:(id)a3 initiatedByWebContent:(BOOL)a4 completionHandler:(id)a5
{
  v8 = (_WKFrameHandle *)a3;
  v16.receiver = self;
  v16.super_class = (Class)SFPrintQueueItem;
  id v9 = a5;
  v10 = [(SFPrintQueueItem *)&v16 init];
  frameHandle = v10->_frameHandle;
  v10->_frameHandle = v8;
  v12 = v8;

  v10->_initiatedByWebContent = a4;
  uint64_t v13 = MEMORY[0x1AD0C36A0](v9);

  id completionHandler = v10->_completionHandler;
  v10->_id completionHandler = (id)v13;

  return v10;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)SFPrintQueueItem;
  [(SFPrintQueueItem *)&v2 dealloc];
}

- (void)completeWithResult:(int64_t)a3
{
  if (!self->_completed)
  {
    id completionHandler = (void (**)(id, int64_t))self->_completionHandler;
    if (completionHandler) {
      completionHandler[2](completionHandler, a3);
    }
    self->_completed = 1;
  }
}

- (_WKFrameHandle)frameHandle
{
  return self->_frameHandle;
}

- (BOOL)initiatedByWebContent
{
  return self->_initiatedByWebContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameHandle, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

@end