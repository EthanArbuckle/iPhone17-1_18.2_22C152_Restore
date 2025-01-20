@interface NSURLSessionTask
- (id)bl_cancelError;
- (id)bl_dataConsumer;
- (id)bl_taskMetrics;
- (int64_t)bl_cancelReason;
- (void)bl_cancelWithReason:(int64_t)a3 error:(id)a4;
- (void)bl_setDataConsumer:(id)a3;
- (void)bl_setTaskMetrics:(id)a3;
@end

@implementation NSURLSessionTask

- (void)bl_cancelWithReason:(int64_t)a3 error:(id)a4
{
  id v6 = a4;
  id value = +[NSNumber numberWithInteger:a3];
  objc_setAssociatedObject(self, "com.apple.bookassetd.cancelError", v6, (void *)0x301);

  objc_setAssociatedObject(self, "com.apple.bookassetd.cancelReason", value, (void *)0x301);
  [(NSURLSessionTask *)self cancel];
}

- (id)bl_cancelError
{
  return objc_getAssociatedObject(self, "com.apple.bookassetd.cancelError");
}

- (int64_t)bl_cancelReason
{
  v2 = objc_getAssociatedObject(self, "com.apple.bookassetd.cancelReason");
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (id)bl_dataConsumer
{
  return objc_getAssociatedObject(self, "com.apple.bookassetd.dataConsumer");
}

- (void)bl_setDataConsumer:(id)a3
{
}

- (id)bl_taskMetrics
{
  return objc_getAssociatedObject(self, "com.apple.bookassetd.taskMetrics");
}

- (void)bl_setTaskMetrics:(id)a3
{
}

@end