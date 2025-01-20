@interface SFSpeechAnalyzerOptionsLoggingInfo
- (NSString)dictationUIInteractionID;
- (NSUUID)asrID;
- (NSUUID)requestID;
- (SFSpeechAnalyzerOptionsLoggingInfo)initWithAsrID:(id)a3 requestID:(id)a4 dictationUIInteractionID:(id)a5;
@end

@implementation SFSpeechAnalyzerOptionsLoggingInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictationUIInteractionID, 0);
  objc_storeStrong((id *)&self->_requestID, 0);

  objc_storeStrong((id *)&self->_asrID, 0);
}

- (NSString)dictationUIInteractionID
{
  return self->_dictationUIInteractionID;
}

- (NSUUID)requestID
{
  return self->_requestID;
}

- (NSUUID)asrID
{
  return self->_asrID;
}

- (SFSpeechAnalyzerOptionsLoggingInfo)initWithAsrID:(id)a3 requestID:(id)a4 dictationUIInteractionID:(id)a5
{
  v18.receiver = self;
  v18.super_class = (Class)SFSpeechAnalyzerOptionsLoggingInfo;
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [(SFSpeechAnalyzerOptionsLoggingInfo *)&v18 init];
  uint64_t v11 = objc_msgSend(v9, "copy", v18.receiver, v18.super_class);

  asrID = v10->_asrID;
  v10->_asrID = (NSUUID *)v11;

  uint64_t v13 = [v8 copy];
  requestID = v10->_requestID;
  v10->_requestID = (NSUUID *)v13;

  uint64_t v15 = [v7 copy];
  dictationUIInteractionID = v10->_dictationUIInteractionID;
  v10->_dictationUIInteractionID = (NSString *)v15;

  return v10;
}

@end