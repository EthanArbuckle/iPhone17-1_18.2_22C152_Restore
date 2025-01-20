@interface AVCaptureStillImageOutputInternal
- (AVCaptureStillImageOutputInternal)init;
- (void)dealloc;
@end

@implementation AVCaptureStillImageOutputInternal

- (AVCaptureStillImageOutputInternal)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVCaptureStillImageOutputInternal;
  v2 = [(AVCaptureStillImageOutputInternal *)&v5 init];
  if (v2)
  {
    v2->stillImageRequests = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    id v3 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    v2->outputSettings = (NSDictionary *)objc_msgSend(v3, "initWithObjectsAndKeys:", *MEMORY[0x1E4F47D38], *MEMORY[0x1E4F47D00], 0);
    v2->imageDataFormatType = 1785750887;
    v2->noiseReductionEnabled = 1;
    v2->shutterSoundID = 1108;
    v2->SISEnabled = 1;
    v2->prepareRequests = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v2->greenTeaLogger = (ct_green_tea_logger_s *)ct_green_tea_logger_create();
  }
  return v2;
}

- (void)dealloc
{
  ct_green_tea_logger_destroy();
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureStillImageOutputInternal;
  [(AVCaptureStillImageOutputInternal *)&v3 dealloc];
}

@end