@interface VCWRMHandler
- (BOOL)isRemoteDuplicating;
- (VCWRMHandler)init;
- (double)localLinkTypeSuggestionChangeTime;
- (int)localWRMLinkTypeSuggestion;
- (int)remoteWRMLinkTypeSuggestion;
- (unsigned)processRemoteWRMSuggestion:(int)a3 isRemoteDuplicating:(BOOL)a4;
- (void)setLocalLinkTypeSuggestionChangeTime:(double)a3;
@end

@implementation VCWRMHandler

- (VCWRMHandler)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCWRMHandler;
  result = [(VCWRMHandler *)&v3 init];
  if (result) {
    *(void *)&result->_localWRMLinkTypeSuggestion = -1;
  }
  return result;
}

- (unsigned)processRemoteWRMSuggestion:(int)a3 isRemoteDuplicating:(BOOL)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a3 == -1) {
    return 0;
  }
  if (self->_remoteWRMLinkTypeSuggestion == a3 && self->_isRemoteDuplicating == a4) {
    return 1;
  }
  self->_BOOL isRemoteDuplicating = a4;
  self->_remoteWRMLinkTypeSuggestion = a3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      v9 = "WiFi";
      BOOL isRemoteDuplicating = self->_isRemoteDuplicating;
      int v12 = 136316162;
      uint64_t v13 = v7;
      if (!a3) {
        v9 = "Cellular";
      }
      v15 = "-[VCWRMHandler processRemoteWRMSuggestion:isRemoteDuplicating:]";
      __int16 v16 = 1024;
      v11 = "without";
      int v17 = 115;
      __int16 v14 = 2080;
      __int16 v18 = 2080;
      if (isRemoteDuplicating) {
        v11 = "with";
      }
      v19 = v9;
      __int16 v20 = 2080;
      v21 = v11;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Receive and cache remote iRAT suggestion to %s %s duplication", (uint8_t *)&v12, 0x30u);
    }
  }
  return 3;
}

- (int)localWRMLinkTypeSuggestion
{
  return self->_localWRMLinkTypeSuggestion;
}

- (int)remoteWRMLinkTypeSuggestion
{
  return self->_remoteWRMLinkTypeSuggestion;
}

- (BOOL)isRemoteDuplicating
{
  return self->_isRemoteDuplicating;
}

- (double)localLinkTypeSuggestionChangeTime
{
  return self->_localLinkTypeSuggestionChangeTime;
}

- (void)setLocalLinkTypeSuggestionChangeTime:(double)a3
{
  self->_localLinkTypeSuggestionChangeTime = a3;
}

@end