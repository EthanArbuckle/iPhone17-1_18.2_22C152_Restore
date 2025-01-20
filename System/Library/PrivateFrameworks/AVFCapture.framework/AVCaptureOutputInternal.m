@interface AVCaptureOutputInternal
- (AVCaptureOutputInternal)init;
- (void)dealloc;
@end

@implementation AVCaptureOutputInternal

- (AVCaptureOutputInternal)init
{
  v6.receiver = self;
  v6.super_class = (Class)AVCaptureOutputInternal;
  v2 = [(AVCaptureOutputInternal *)&v6 init];
  if (v2)
  {
    *((void *)v2 + 1) = dispatch_queue_create("capture.output.FigCaptureSessionSyncQueue", 0);
    *((void *)v2 + 5) = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    *((_DWORD *)v2 + 12) = 0;
    uint64_t v3 = MEMORY[0x1E4F1DAB8];
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)(v2 + 56) = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)(v2 + 72) = v4;
    *(_OWORD *)(v2 + 88) = *(_OWORD *)(v3 + 32);
  }
  return (AVCaptureOutputInternal *)v2;
}

- (void)dealloc
{
  figCaptureSession = self->figCaptureSession;
  if (figCaptureSession) {
    CFRelease(figCaptureSession);
  }

  v4.receiver = self;
  v4.super_class = (Class)AVCaptureOutputInternal;
  [(AVCaptureOutputInternal *)&v4 dealloc];
}

@end