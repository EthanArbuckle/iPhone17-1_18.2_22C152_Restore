@interface MOVStreamWriterStateDrainFifo
- (BOOL)canAppendData:(id)a3;
- (BOOL)canConfigure:(id)a3;
- (BOOL)canFinishRecording:(id)a3;
- (BOOL)canWriteData:(id)a3;
- (BOOL)stopWriterWhenFifosAreEmpty:(id)a3;
- (NSString)name;
- (id)cancelRecording:(id)a3;
- (id)criticalErrorOccurred:(id)a3 context:(id)a4;
- (id)forceFinishRecording:(id)a3;
- (id)nextFinishStep:(id)a3;
- (int64_t)writerStatus;
- (void)activateWithContext:(id)a3;
@end

@implementation MOVStreamWriterStateDrainFifo

- (BOOL)canConfigure:(id)a3
{
  return 0;
}

- (BOOL)canAppendData:(id)a3
{
  return 0;
}

- (BOOL)canWriteData:(id)a3
{
  return 1;
}

- (BOOL)stopWriterWhenFifosAreEmpty:(id)a3
{
  return 1;
}

- (BOOL)canFinishRecording:(id)a3
{
  return 0;
}

- (id)cancelRecording:(id)a3
{
  v3 = objc_opt_new();

  return v3;
}

- (id)forceFinishRecording:(id)a3
{
  v3 = objc_opt_new();

  return v3;
}

- (id)nextFinishStep:(id)a3
{
  v3 = objc_opt_new();

  return v3;
}

- (id)criticalErrorOccurred:(id)a3 context:(id)a4
{
  [a4 setCriticalError:a3];
  v4 = objc_opt_new();

  return v4;
}

- (void)activateWithContext:(id)a3
{
}

- (int64_t)writerStatus
{
  return 4;
}

- (NSString)name
{
  return (NSString *)@"Draining FIFO";
}

@end