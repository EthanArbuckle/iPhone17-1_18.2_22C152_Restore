@interface Transcriber
+ (Transcriber)sharedInstance;
- (AXLTLiveTranscription)transcriber;
- (BOOL)startTranscribing;
- (BOOL)stopTranscribing;
- (NSString)transcription;
- (Transcriber)init;
- (int64_t)requestType;
- (int64_t)tapType;
- (void)dealloc;
- (void)setRequestType:(int64_t)a3;
- (void)setTapType:(int64_t)a3;
- (void)setTranscriber:(id)a3;
- (void)setTranscription:(id)a3;
- (void)transcription:(id)a3;
@end

@implementation Transcriber

+ (Transcriber)sharedInstance
{
  if (qword_100008A28 != -1) {
    dispatch_once(&qword_100008A28, &stru_100004178);
  }
  v2 = (void *)qword_100008A20;
  return (Transcriber *)v2;
}

- (Transcriber)init
{
  v6.receiver = self;
  v6.super_class = (Class)Transcriber;
  v2 = [(Transcriber *)&v6 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)AXLTLiveTranscription);
    v4 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v3;

    [*((id *)v2 + 2) setNoPunctuation:0];
    [*((id *)v2 + 2) setTaskHint:2];
    *(_OWORD *)(v2 + 24) = xmmword_100003F30;
  }
  return (Transcriber *)v2;
}

- (void)dealloc
{
  [(Transcriber *)self cleanUp];
  v3.receiver = self;
  v3.super_class = (Class)Transcriber;
  [(Transcriber *)&v3 dealloc];
}

- (BOOL)startTranscribing
{
  v2 = self;
  objc_super v3 = [(Transcriber *)self transcriber];
  id v6 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100002F48;
  v7[3] = &unk_1000041A0;
  v7[4] = v2;
  LOBYTE(v2) = objc_msgSend(v3, "startTranscribing:targetPID:callbackBlock:error:", -[Transcriber requestType](v2, "requestType"), -[Transcriber tapType](v2, "tapType"), v7, &v6);
  id v4 = v6;

  return (char)v2;
}

- (BOOL)stopTranscribing
{
  objc_super v3 = [(Transcriber *)self transcriber];

  if (!v3) {
    return 1;
  }
  id v4 = [(Transcriber *)self transcriber];
  unsigned __int8 v5 = objc_msgSend(v4, "stopTranscribing:error:", -[Transcriber requestType](self, "requestType"), 0);

  return v5;
}

- (void)transcription:(id)a3
{
}

- (NSString)transcription
{
  return self->_transcription;
}

- (void)setTranscription:(id)a3
{
}

- (AXLTLiveTranscription)transcriber
{
  return self->_transcriber;
}

- (void)setTranscriber:(id)a3
{
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(int64_t)a3
{
  self->_requestType = a3;
}

- (int64_t)tapType
{
  return self->_tapType;
}

- (void)setTapType:(int64_t)a3
{
  self->_tapType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcriber, 0);
  objc_storeStrong((id *)&self->_transcription, 0);
}

@end