@interface AVCaptureDeviceInternal
- (AVCaptureDeviceInternal)init;
- (void)dealloc;
@end

@implementation AVCaptureDeviceInternal

- (AVCaptureDeviceInternal)init
{
  v4.receiver = self;
  v4.super_class = (Class)AVCaptureDeviceInternal;
  v2 = [(AVCaptureDeviceInternal *)&v4 init];
  if (v2) {
    v2->activeReactions = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureDeviceInternal;
  [(AVCaptureDeviceInternal *)&v3 dealloc];
}

@end