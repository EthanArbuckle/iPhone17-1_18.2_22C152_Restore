@interface AVAssetWriterClientInitiatedTerminalHelper
- (AVAssetWriterClientInitiatedTerminalHelper)initWithConfigurationState:(id)a3;
- (AVAssetWriterClientInitiatedTerminalHelper)initWithConfigurationState:(id)a3 terminalStatus:(int64_t)a4;
- (BOOL)_isDefunct;
- (int64_t)status;
@end

@implementation AVAssetWriterClientInitiatedTerminalHelper

- (AVAssetWriterClientInitiatedTerminalHelper)initWithConfigurationState:(id)a3
{
  v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], objc_msgSend(NSString, "stringWithFormat:", @"Not available.  Use %@ instead.", NSStringFromSelector(sel_initWithConfigurationState_terminalStatus_)), 0 reason userInfo];
  objc_exception_throw(v3);
}

- (AVAssetWriterClientInitiatedTerminalHelper)initWithConfigurationState:(id)a3 terminalStatus:(int64_t)a4
{
  v15.receiver = self;
  v15.super_class = (Class)AVAssetWriterClientInitiatedTerminalHelper;
  result = [(AVAssetWriterTerminalHelper *)&v15 initWithConfigurationState:a3];
  if (a4 != 2 && a4 != 4)
  {
    v7 = (objc_class *)result;
    v8 = result;
    v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector(v7, a2, @"invalid parameter not satisfying: %s", v9, v10, v11, v12, v13, (uint64_t)"(terminalStatus == AVAssetWriterStatusCompleted) || (terminalStatus == AVAssetWriterStatusCancelled)"), 0 reason userInfo];
    objc_exception_throw(v14);
  }
  if (result) {
    result->_terminalStatus = a4;
  }
  return result;
}

- (int64_t)status
{
  return self->_terminalStatus;
}

- (BOOL)_isDefunct
{
  return 1;
}

@end