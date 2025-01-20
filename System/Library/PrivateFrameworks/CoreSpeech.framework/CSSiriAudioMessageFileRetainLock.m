@interface CSSiriAudioMessageFileRetainLock
- (CSSiriAudioMessageFileRetainLock)initWithRequestId:(id)a3;
- (NSString)UUIDString;
- (NSString)requestId;
@end

@implementation CSSiriAudioMessageFileRetainLock

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_UUIDString, 0);
}

- (NSString)requestId
{
  return self->_requestId;
}

- (NSString)UUIDString
{
  return self->_UUIDString;
}

- (CSSiriAudioMessageFileRetainLock)initWithRequestId:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CSSiriAudioMessageFileRetainLock;
  v6 = [(CSSiriAudioMessageFileRetainLock *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_requestId, a3);
    v8 = +[NSUUID UUID];
    uint64_t v9 = [v8 UUIDString];
    UUIDString = v7->_UUIDString;
    v7->_UUIDString = (NSString *)v9;
  }
  return v7;
}

@end