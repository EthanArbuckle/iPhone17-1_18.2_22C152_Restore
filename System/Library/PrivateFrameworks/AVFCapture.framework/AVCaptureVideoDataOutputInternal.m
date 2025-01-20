@interface AVCaptureVideoDataOutputInternal
- (AVCaptureVideoDataOutputInternal)init;
- (void)dealloc;
@end

@implementation AVCaptureVideoDataOutputInternal

- (AVCaptureVideoDataOutputInternal)init
{
  v6.receiver = self;
  v6.super_class = (Class)AVCaptureVideoDataOutputInternal;
  v2 = [(AVCaptureVideoDataOutputInternal *)&v6 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&v2->deprecatedMinFrameDuration.value = *MEMORY[0x1E4F1F9F8];
    v2->deprecatedMinFrameDuration.epoch = *(void *)(v4 + 16);
    v2->alwaysDiscardsLateVideoFrames = 1;
    v2->delegateCallbackHelper = [[AVCaptureDataOutputDelegateCallbackHelper alloc] initWithQueueName:@"com.apple.avfoundation.videodataoutput.queue" canSetClientDelegateCallbackQueueWhenRunningInsideMediaserverd:0];
    FigFlatDictionaryGetMakerNoteKeySpace();
    v3->automaticallyConfiguresOutputBufferDimensions = 1;
    if (AVGestaltGetBoolAnswer(@"AVGQCaptureMultipleVideoDataOutputsSupported")) {
      v3->videoSettingsDimensionsOverrideEnabled = 1;
    }
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureVideoDataOutputInternal;
  [(AVCaptureVideoDataOutputInternal *)&v3 dealloc];
}

@end