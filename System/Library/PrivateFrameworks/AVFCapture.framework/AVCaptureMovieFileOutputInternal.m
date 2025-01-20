@interface AVCaptureMovieFileOutputInternal
- (AVCaptureMovieFileOutputInternal)init;
- (void)dealloc;
@end

@implementation AVCaptureMovieFileOutputInternal

- (AVCaptureMovieFileOutputInternal)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVCaptureMovieFileOutputInternal;
  v2 = [(AVCaptureMovieFileOutputInternal *)&v5 init];
  if (v2)
  {
    *((void *)v2 + 2) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    *((void *)v2 + 3) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    CMTimeMake(&v4, 10, 1);
    *(CMTime *)(v2 + 32) = v4;
    v2[88] = 0;
    *((void *)v2 + 8) = objc_alloc_init(MEMORY[0x1E4F1C978]);
    v2[129] = 0;
  }
  return (AVCaptureMovieFileOutputInternal *)v2;
}

- (void)dealloc
{
  ct_green_tea_logger_destroy();
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureMovieFileOutputInternal;
  [(AVCaptureMovieFileOutputInternal *)&v3 dealloc];
}

@end