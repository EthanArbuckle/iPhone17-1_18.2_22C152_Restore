@interface AVCaptureDeviceControlRequest
+ (id)deviceControlRequestWithCompletionBlock:(id)a3;
- (id)_initWithCompletionBlock:(id)a3;
- (id)completionBlock;
- (int)errorCode;
- (int)requestID;
- (void)dealloc;
- (void)setErrorCode:(int)a3;
@end

@implementation AVCaptureDeviceControlRequest

- (void)setErrorCode:(int)a3
{
  self->_errorCode = a3;
}

+ (id)deviceControlRequestWithCompletionBlock:(id)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithCompletionBlock:a3];

  return v3;
}

- (id)_initWithCompletionBlock:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVCaptureDeviceControlRequest;
  v4 = [(AVCaptureDeviceControlRequest *)&v6 init];
  if (v4)
  {
    v4->_completionBlock = (id)[a3 copy];
    v4->_requestID = atomic_fetch_add_explicit(sDeviceControlRequestID, 1u, memory_order_relaxed) + 1;
  }
  return v4;
}

- (int)requestID
{
  return self->_requestID;
}

- (int)errorCode
{
  return self->_errorCode;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureDeviceControlRequest;
  [(AVCaptureDeviceControlRequest *)&v3 dealloc];
}

@end