@interface MOVStreamWriterStateCancelled
- (id)criticalErrorOccurred:(id)a3 context:(id)a4;
- (id)name;
- (int64_t)writerStatus;
- (void)activateWithContext:(id)a3;
@end

@implementation MOVStreamWriterStateCancelled

- (void)activateWithContext:(id)a3
{
}

- (id)criticalErrorOccurred:(id)a3 context:(id)a4
{
  [a4 setCriticalError:a3];
  v4 = objc_opt_new();

  return v4;
}

- (int64_t)writerStatus
{
  return 7;
}

- (id)name
{
  return @"Cancelled";
}

@end