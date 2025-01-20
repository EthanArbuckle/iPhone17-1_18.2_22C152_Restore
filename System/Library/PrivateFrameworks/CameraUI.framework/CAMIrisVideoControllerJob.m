@interface CAMIrisVideoControllerJob
- (CAMIrisVideoControllerJob)initWithRequest:(id)a3 videoCaptureResult:(id)a4;
- (CAMStillImageCaptureRequest)request;
- (CAMVideoCaptureResult)videoCaptureResult;
@end

@implementation CAMIrisVideoControllerJob

- (CAMIrisVideoControllerJob)initWithRequest:(id)a3 videoCaptureResult:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CAMIrisVideoControllerJob;
  v9 = [(CAMIrisVideoControllerJob *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_videoCaptureResult, a4);
    v11 = v10;
  }

  return v10;
}

- (CAMStillImageCaptureRequest)request
{
  return self->_request;
}

- (CAMVideoCaptureResult)videoCaptureResult
{
  return self->_videoCaptureResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoCaptureResult, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end