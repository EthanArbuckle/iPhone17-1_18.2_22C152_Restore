@interface CAMCaptureRequestInfo
- (CAMCaptureRequestInfo)initWithRequest:(id)a3;
- (CAMStillImageCaptureRequest)request;
- (NSMutableArray)_receivedCallbacks;
- (unint64_t)_userInitiationTime;
- (void)didReceiveCallback:(int64_t)a3 atAbsoluteTime:(unint64_t)a4;
@end

@implementation CAMCaptureRequestInfo

- (CAMCaptureRequestInfo)initWithRequest:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CAMCaptureRequestInfo;
  v6 = [(CAMCaptureRequestInfo *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    receivedCallbacks = v7->__receivedCallbacks;
    v7->__receivedCallbacks = v8;

    uint64_t v10 = [v5 userInitiationTime];
    v7->__userInitiationTime = v10;
    if (!v10) {
      v7->__userInitiationTime = mach_absolute_time();
    }
    v11 = v7;
  }

  return v7;
}

- (void)didReceiveCallback:(int64_t)a3 atAbsoluteTime:(unint64_t)a4
{
  unint64_t v6 = a4 - [(CAMCaptureRequestInfo *)self _userInitiationTime];
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  v7 = [[CAMCaptureCallbackReceipt alloc] initWithCallback:a3 duration:(double)(v6 * info.numer / info.denom) / 1000000000.0];
  v8 = [(CAMCaptureRequestInfo *)self _receivedCallbacks];
  [v8 addObject:v7];
}

- (CAMStillImageCaptureRequest)request
{
  return self->_request;
}

- (NSMutableArray)_receivedCallbacks
{
  return self->__receivedCallbacks;
}

- (unint64_t)_userInitiationTime
{
  return self->__userInitiationTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__receivedCallbacks, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end