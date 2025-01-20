@interface AVAssetWriterFailedTerminalHelper
- (AVAssetWriterFailedTerminalHelper)initWithConfigurationState:(id)a3;
- (AVAssetWriterFailedTerminalHelper)initWithConfigurationState:(id)a3 terminalError:(id)a4;
- (BOOL)_isDefunct;
- (id)error;
- (int64_t)status;
- (void)dealloc;
- (void)finishWritingWithCompletionHandler:(id)a3;
@end

@implementation AVAssetWriterFailedTerminalHelper

- (AVAssetWriterFailedTerminalHelper)initWithConfigurationState:(id)a3
{
  v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], objc_msgSend(NSString, "stringWithFormat:", @"Not available.  Use %@ instead.", NSStringFromSelector(sel_initWithConfigurationState_terminalError_)), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (AVAssetWriterFailedTerminalHelper)initWithConfigurationState:(id)a3 terminalError:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)AVAssetWriterFailedTerminalHelper;
  v6 = [(AVAssetWriterTerminalHelper *)&v15 initWithConfigurationState:a3];
  v12 = v6;
  if (!a4)
  {
    v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v6, a2, @"invalid parameter not satisfying: %s", v7, v8, v9, v10, v11, (uint64_t)"terminalError != nil"), 0 reason userInfo];
    objc_exception_throw(v14);
  }
  if (v6) {
    v6->_terminalError = (NSError *)objc_msgSend(a4, "copyWithZone:", -[AVAssetWriterFailedTerminalHelper zone](v6, "zone"));
  }
  return v12;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVAssetWriterFailedTerminalHelper;
  [(AVAssetWriterHelper *)&v3 dealloc];
}

- (int64_t)status
{
  return 3;
}

- (id)error
{
  return self->_terminalError;
}

- (void)finishWritingWithCompletionHandler:(id)a3
{
}

- (BOOL)_isDefunct
{
  return 1;
}

@end