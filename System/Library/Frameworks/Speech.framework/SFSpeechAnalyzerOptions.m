@interface SFSpeechAnalyzerOptions
- (BOOL)highPriority;
- (SFSpeechAnalyzerOptions)initWithHighPriority:(BOOL)a3 loggingInfo:(id)a4 powerContext:(id)a5;
- (SFSpeechAnalyzerOptionsLoggingInfo)loggingInfo;
- (SFSpeechAnalyzerOptionsPowerContext)powerContext;
@end

@implementation SFSpeechAnalyzerOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerContext, 0);

  objc_storeStrong((id *)&self->_loggingInfo, 0);
}

- (SFSpeechAnalyzerOptionsPowerContext)powerContext
{
  return self->_powerContext;
}

- (SFSpeechAnalyzerOptionsLoggingInfo)loggingInfo
{
  return self->_loggingInfo;
}

- (BOOL)highPriority
{
  return self->_highPriority;
}

- (SFSpeechAnalyzerOptions)initWithHighPriority:(BOOL)a3 loggingInfo:(id)a4 powerContext:(id)a5
{
  v15.receiver = self;
  v15.super_class = (Class)SFSpeechAnalyzerOptions;
  id v7 = a5;
  id v8 = a4;
  v9 = [(SFSpeechAnalyzerOptions *)&v15 init];
  v9->_highPriority = a3;
  uint64_t v10 = objc_msgSend(v8, "copy", v15.receiver, v15.super_class);

  loggingInfo = v9->_loggingInfo;
  v9->_loggingInfo = (SFSpeechAnalyzerOptionsLoggingInfo *)v10;

  uint64_t v12 = [v7 copy];
  powerContext = v9->_powerContext;
  v9->_powerContext = (SFSpeechAnalyzerOptionsPowerContext *)v12;

  return v9;
}

@end