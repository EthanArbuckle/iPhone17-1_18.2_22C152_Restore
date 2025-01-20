@interface AVCaptureInputInternal
- (AVCaptureInputInternal)init;
- (void)dealloc;
@end

@implementation AVCaptureInputInternal

- (AVCaptureInputInternal)init
{
  v4.receiver = self;
  v4.super_class = (Class)AVCaptureInputInternal;
  v2 = [(AVCaptureInputInternal *)&v4 init];
  if (v2) {
    v2->figCaptureSessionSyncQueue = (OS_dispatch_queue *)dispatch_queue_create("capture.input.FigCaptureSessionSyncQueue", 0);
  }
  return v2;
}

- (void)dealloc
{
  figCaptureSession = self->figCaptureSession;
  if (figCaptureSession) {
    CFRelease(figCaptureSession);
  }

  v4.receiver = self;
  v4.super_class = (Class)AVCaptureInputInternal;
  [(AVCaptureInputInternal *)&v4 dealloc];
}

@end