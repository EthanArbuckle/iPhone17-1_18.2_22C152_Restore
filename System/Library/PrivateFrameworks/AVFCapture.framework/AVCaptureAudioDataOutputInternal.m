@interface AVCaptureAudioDataOutputInternal
- (AVCaptureAudioDataOutputInternal)init;
- (void)dealloc;
@end

@implementation AVCaptureAudioDataOutputInternal

- (AVCaptureAudioDataOutputInternal)init
{
  v4.receiver = self;
  v4.super_class = (Class)AVCaptureAudioDataOutputInternal;
  v2 = [(AVCaptureAudioDataOutputInternal *)&v4 init];
  if (v2) {
    v2->delegateCallbackHelper = [[AVCaptureDataOutputDelegateCallbackHelper alloc] initWithQueueName:@"com.apple.avfoundation.audiodataoutput.queue" canSetClientDelegateCallbackQueueWhenRunningInsideMediaserverd:0];
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureAudioDataOutputInternal;
  [(AVCaptureAudioDataOutputInternal *)&v3 dealloc];
}

@end