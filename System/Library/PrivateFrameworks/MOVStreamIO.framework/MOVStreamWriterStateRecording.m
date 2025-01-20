@interface MOVStreamWriterStateRecording
- (BOOL)canAppendData:(id)a3;
- (BOOL)canConfigure:(id)a3;
- (BOOL)canFinishRecording:(id)a3;
- (BOOL)canWriteData:(id)a3;
- (BOOL)stopWriterWhenFifosAreEmpty:(id)a3;
- (NSString)name;
- (id)cancelRecording:(id)a3;
- (id)criticalErrorOccurred:(id)a3 context:(id)a4;
- (id)finishRecording:(id)a3;
- (id)forceFinishRecording:(id)a3;
- (int64_t)writerStatus;
@end

@implementation MOVStreamWriterStateRecording

- (BOOL)canConfigure:(id)a3
{
  return 0;
}

- (BOOL)canAppendData:(id)a3
{
  return 1;
}

- (BOOL)canWriteData:(id)a3
{
  return 1;
}

- (BOOL)stopWriterWhenFifosAreEmpty:(id)a3
{
  return 0;
}

- (BOOL)canFinishRecording:(id)a3
{
  return 1;
}

- (id)cancelRecording:(id)a3
{
  v3 = objc_opt_new();

  return v3;
}

- (id)finishRecording:(id)a3
{
  v3 = objc_opt_new();

  return v3;
}

- (id)forceFinishRecording:(id)a3
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

- (int64_t)writerStatus
{
  return 3;
}

- (NSString)name
{
  return (NSString *)@"Recording";
}

@end