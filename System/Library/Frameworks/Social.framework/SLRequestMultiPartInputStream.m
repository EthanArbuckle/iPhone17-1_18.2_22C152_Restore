@interface SLRequestMultiPartInputStream
- (BOOL)getBuffer:(char *)a3 length:(unint64_t *)a4;
- (BOOL)hasBytesAvailable;
- (SLRequestMultiPartInputStream)initWithMultiPart:(id)a3;
- (int64_t)currentStateRead:(char *)a3 maxLength:(unint64_t)a4;
- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4;
- (unint64_t)length;
- (unint64_t)readStateSourceData:(id)a3 toBuffer:(char *)a4 offset:(unint64_t)a5 maxLength:(unint64_t)a6;
- (void)close;
- (void)open;
- (void)transitionState;
@end

@implementation SLRequestMultiPartInputStream

- (SLRequestMultiPartInputStream)initWithMultiPart:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SLRequestMultiPartInputStream;
  v6 = [(SLRequestMultiPartInputStream *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_multiPart, a3);
    v7->_streamStatus = 0;
    [(SLRequestMultiPartInputStream *)v7 transitionState];
  }

  return v7;
}

- (void)transitionState
{
  self->_bytesReadInState = 0;
  v11 = [(SLRequestMultiPart *)self->_multiPart uniqueIdentifier];
  uint64_t currentState = self->_currentState;
  _SLLog(v2, 6, @"MultipartStream %@ transitioning from state %d");

  switch(self->_currentState)
  {
    case 0:
      v4 = [(SLRequestMultiPart *)self->_multiPart payloadPreamble];
      srcData = self->_srcData;
      self->_srcData = v4;

      v11 = (void *)[[NSString alloc] initWithData:self->_srcData encoding:4];
      _SLLog(v2, 6, @"Preamble for stream %@");

      int v6 = 1;
      goto LABEL_7;
    case 1:
      v7 = [(SLRequestMultiPart *)self->_multiPart payload];
      v8 = self->_srcData;
      self->_srcData = v7;

      int v6 = 2;
      goto LABEL_7;
    case 2:
      objc_super v9 = [(SLRequestMultiPart *)self->_multiPart payloadEpilogue];
      v10 = self->_srcData;
      self->_srcData = v9;

      int v6 = 3;
      goto LABEL_7;
    case 3:
      int v6 = 4;
LABEL_7:
      self->_uint64_t currentState = v6;
      break;
    default:
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"MultipartInputStream in unexpected state", v11, currentState);
      break;
  }
  v12 = [(SLRequestMultiPart *)self->_multiPart uniqueIdentifier];
  _SLLog(v2, 6, @"MultipartStream %@ transitioned to state %d");
}

- (unint64_t)readStateSourceData:(id)a3 toBuffer:(char *)a4 offset:(unint64_t)a5 maxLength:(unint64_t)a6
{
  id v10 = a3;
  unint64_t v11 = self->_bytesReadInState + a6;
  if (v11 <= [v10 length])
  {
    unint64_t bytesReadInState = self->_bytesReadInState;
  }
  else
  {
    uint64_t v12 = [v10 length];
    unint64_t bytesReadInState = self->_bytesReadInState;
    a6 = v12 - bytesReadInState;
  }
  objc_msgSend(v10, "getBytes:range:", a4, bytesReadInState, a6);
  v14 = [(SLRequestMultiPart *)self->_multiPart uniqueIdentifier];
  v17.location = self->_bytesReadInState;
  v17.length = a6;
  v16 = NSStringFromRange(v17);
  _SLLog(v6, 6, @"MultipartStream %@ read %u bytes in range %@ in state %d");

  return a6;
}

- (int64_t)currentStateRead:(char *)a3 maxLength:(unint64_t)a4
{
  int64_t v5 = [(SLRequestMultiPartInputStream *)self readStateSourceData:self->_srcData toBuffer:a3 offset:self->_bytesReadInState maxLength:a4];
  unint64_t v6 = self->_bytesReadInState + v5;
  self->_unint64_t bytesReadInState = v6;
  if (v6 == [(NSData *)self->_srcData length]) {
    [(SLRequestMultiPartInputStream *)self transitionState];
  }
  return v5;
}

- (unint64_t)length
{
  return [(SLRequestMultiPart *)self->_multiPart length];
}

- (void)open
{
  self->_streamStatus = 2;
}

- (void)close
{
  self->_streamStatus = 6;
}

- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4
{
  if (self->_currentState == 4) {
    return 0;
  }
  else {
    return [(SLRequestMultiPartInputStream *)self currentStateRead:a3 maxLength:a4];
  }
}

- (BOOL)getBuffer:(char *)a3 length:(unint64_t *)a4
{
  return 0;
}

- (BOOL)hasBytesAvailable
{
  return self->_currentState != 4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_srcData, 0);

  objc_storeStrong((id *)&self->_multiPart, 0);
}

@end