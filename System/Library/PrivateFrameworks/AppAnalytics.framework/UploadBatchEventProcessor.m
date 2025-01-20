@interface UploadBatchEventProcessor
- (void)flushWithCallbackQueue:(id)a3 completion:(id)a4;
@end

@implementation UploadBatchEventProcessor

- (void)flushWithCallbackQueue:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  if (v5)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v5 = sub_1A90BA534;
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = a3;
  swift_retain();
  UploadBatchEventProcessor.flush(callbackQueue:completion:)((uint64_t)v7, (uint64_t)v5, v6);
  sub_1A909E0EC((uint64_t)v5);

  swift_release();
}

@end