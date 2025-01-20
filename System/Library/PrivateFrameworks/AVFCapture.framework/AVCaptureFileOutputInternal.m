@interface AVCaptureFileOutputInternal
- (AVCaptureFileOutputInternal)init;
@end

@implementation AVCaptureFileOutputInternal

- (AVCaptureFileOutputInternal)init
{
  v4.receiver = self;
  v4.super_class = (Class)AVCaptureFileOutputInternal;
  result = [(AVCaptureFileOutputInternal *)&v4 init];
  if (result)
  {
    uint64_t v3 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&result->maxRecordedDuration.value = *MEMORY[0x1E4F1F9F8];
    result->maxRecordedDuration.epoch = *(void *)(v3 + 16);
  }
  return result;
}

@end