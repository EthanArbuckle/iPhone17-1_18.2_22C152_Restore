@interface VoiceVerificationEndpointer
- (BOOL)configureWithASBD:(AudioStreamBasicDescription *)a3 andFrameRate:(unsigned int)a4;
- (BOOL)configureWithSampleRate:(double)a3 andFrameRate:(unsigned int)a4;
- (VoiceVerificationEndpointer)init;
- (double)endWaitTime;
- (double)interspeechWaitTime;
- (double)startWaitTime;
- (int)endpointMode;
- (int)getStatus:(AudioQueueBuffer *)a3;
- (void)dealloc;
@end

@implementation VoiceVerificationEndpointer

- (double)endWaitTime
{
  return 0.0;
}

- (double)interspeechWaitTime
{
  return 0.0;
}

- (double)startWaitTime
{
  return 0.0;
}

- (int)endpointMode
{
  return 1;
}

- (int)getStatus:(AudioQueueBuffer *)a3
{
  return 0;
}

- (BOOL)configureWithASBD:(AudioStreamBasicDescription *)a3 andFrameRate:(unsigned int)a4
{
  return 0;
}

- (BOOL)configureWithSampleRate:(double)a3 andFrameRate:(unsigned int)a4
{
  return 0;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)VoiceVerificationEndpointer;
  [(VoiceVerificationEndpointer *)&v2 dealloc];
}

- (VoiceVerificationEndpointer)init
{
  v3.receiver = self;
  v3.super_class = (Class)VoiceVerificationEndpointer;
  return [(VoiceVerificationEndpointer *)&v3 init];
}

@end