@interface CAMCaptureResponse
- (CAMCaptureCoordinationInfo)coordinationInfo;
- (CAMCaptureResponse)init;
- (CAMCaptureResponse)initWithType:(int64_t)a3 captureSession:(unsigned __int16)a4 coordinationInfo:(id)a5;
- (int64_t)type;
- (unsigned)sessionIdentifier;
@end

@implementation CAMCaptureResponse

- (unsigned)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (CAMCaptureResponse)init
{
  return 0;
}

- (CAMCaptureResponse)initWithType:(int64_t)a3 captureSession:(unsigned __int16)a4 coordinationInfo:(id)a5
{
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CAMCaptureResponse;
  v10 = [(CAMCaptureResponse *)&v14 init];
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    v10->_sessionIdentifier = a4;
    objc_storeStrong((id *)&v10->_coordinationInfo, a5);
    v12 = v11;
  }

  return v11;
}

- (int64_t)type
{
  return self->_type;
}

- (CAMCaptureCoordinationInfo)coordinationInfo
{
  return self->_coordinationInfo;
}

- (void).cxx_destruct
{
}

@end