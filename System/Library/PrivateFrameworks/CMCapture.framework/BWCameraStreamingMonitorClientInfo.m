@interface BWCameraStreamingMonitorClientInfo
- (void)dealloc;
- (void)initWithProcessHandle:(void *)a1;
@end

@implementation BWCameraStreamingMonitorClientInfo

- (void)initWithProcessHandle:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v5.receiver = a1;
  v5.super_class = (Class)BWCameraStreamingMonitorClientInfo;
  v3 = objc_msgSendSuper2(&v5, sel_init);
  if (v3) {
    v3[2] = a2;
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWCameraStreamingMonitorClientInfo;
  [(BWCameraStreamingMonitorClientInfo *)&v3 dealloc];
}

@end