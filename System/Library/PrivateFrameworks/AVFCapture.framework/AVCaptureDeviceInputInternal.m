@interface AVCaptureDeviceInputInternal
- (void)dealloc;
@end

@implementation AVCaptureDeviceInputInternal

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureDeviceInputInternal;
  [(AVCaptureDeviceInputInternal *)&v3 dealloc];
}

@end