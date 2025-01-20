@interface OSActivityEventMessage
- (NSMutableArray)arguments;
- (NSString)format;
- (void)fillEventData:(const char *)a3 length:(unint64_t)a4 privateBuffer:(const char *)a5 length:(unint64_t)a6;
@end

@implementation OSActivityEventMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferData, 0);
  objc_storeStrong((id *)&self->_bufferPrivateData, 0);
}

- (NSString)format
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8 = 0;
  unint64_t v3 = [(OSActivityEvent *)self traceID] >> 32;
  v9[0] = 0;
  v9[1] = 0;
  v4 = [(OSActivityEvent *)self senderImageUUID];
  [v4 getUUIDBytes:v9];

  int v5 = uuidpath_resolve(0, v9, v3, 0, &v8, 0, 0, 0);
  v6 = 0;
  if (v5)
  {
    v6 = [NSString stringWithUTF8String:v8];
  }
  return (NSString *)v6;
}

- (NSMutableArray)arguments
{
  return 0;
}

- (void)fillEventData:(const char *)a3 length:(unint64_t)a4 privateBuffer:(const char *)a5 length:(unint64_t)a6
{
  v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a3 length:a4];
  bufferData = self->_bufferData;
  self->_bufferData = v9;

  self->_bufferPrivateData = [MEMORY[0x1E4F1C9B8] dataWithBytes:a5 length:a6];
  MEMORY[0x1F41817F8]();
}

@end