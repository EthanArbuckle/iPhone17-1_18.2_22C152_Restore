@interface AVCaptureMetadataOutputInternal
- (AVCaptureMetadataOutputInternal)init;
- (void)dealloc;
@end

@implementation AVCaptureMetadataOutputInternal

- (AVCaptureMetadataOutputInternal)init
{
  v4.receiver = self;
  v4.super_class = (Class)AVCaptureMetadataOutputInternal;
  v2 = [(AVCaptureMetadataOutputInternal *)&v4 init];
  if (v2)
  {
    v2->delegateCallbackHelper = [[AVCaptureDataOutputDelegateCallbackHelper alloc] initWithQueueName:@"com.apple.avfoundation.metadataoutput.queue" canSetClientDelegateCallbackQueueWhenRunningInsideMediaserverd:0];
    v2->faceTrackingMaxFaces = 0;
    v2->faceTrackingUsesFaceRecognition = MGGetBoolAnswer();
    v2->previousTwoCMTimesByDetectorType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->faceTrackingFailureFieldOfViewModifier = -1.0;
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureMetadataOutputInternal;
  [(AVCaptureMetadataOutputInternal *)&v3 dealloc];
}

@end