@interface AVCaptureVideoThumbnailOutputInternal
- (AVCaptureVideoThumbnailOutputInternal)init;
- (void)dealloc;
@end

@implementation AVCaptureVideoThumbnailOutputInternal

- (AVCaptureVideoThumbnailOutputInternal)init
{
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureVideoThumbnailOutputInternal;
  return [(AVCaptureVideoThumbnailOutputInternal *)&v3 init];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureVideoThumbnailOutputInternal;
  [(AVCaptureVideoThumbnailOutputInternal *)&v3 dealloc];
}

@end