@interface HGAudioFeedbackConfiguration
- (BOOL)enableAudioFeedback;
- (BOOL)enableWaitingTone;
- (BOOL)invertedConfirmationAudioFeedbackMode;
- (HGAudioFeedbackConfiguration)init;
- (HGAudioFeedbackConfigurationInternal)internal;
- (unsigned)audioSessionID;
- (void)enableAudioFeedbackForHeadGesture:(unint64_t)a3 toEnable:(BOOL)a4;
- (void)enableAudioFeedbackForHeadGesturePart:(unint64_t)a3 toEnable:(BOOL)a4;
- (void)setAudioSessionID:(unsigned int)a3;
- (void)setEnableAudioFeedback:(BOOL)a3;
- (void)setEnableWaitingTone:(BOOL)a3;
- (void)setInternal:(id)a3;
- (void)setInvertedConfirmationAudioFeedbackMode:(BOOL)a3;
@end

@implementation HGAudioFeedbackConfiguration

- (HGAudioFeedbackConfiguration)init
{
  v8.receiver = self;
  v8.super_class = (Class)HGAudioFeedbackConfiguration;
  v2 = [(HGAudioFeedbackConfiguration *)&v8 init];
  if (v2)
  {
    v3 = [[HGAudioFeedbackConfigurationInternal alloc] initWithEnableAudioFeedback:0 enableWaitingTone:0 audioSessionID:0];
    [(HGAudioFeedbackConfiguration *)v2 setInternal:v3];

    v4 = [(HGAudioFeedbackConfiguration *)v2 internal];
    -[HGAudioFeedbackConfiguration setAudioSessionID:](v2, "setAudioSessionID:", [v4 audioSessionID]);

    v5 = [(HGAudioFeedbackConfiguration *)v2 internal];
    -[HGAudioFeedbackConfiguration setEnableAudioFeedback:](v2, "setEnableAudioFeedback:", [v5 enableAudioFeedback]);

    v6 = [(HGAudioFeedbackConfiguration *)v2 internal];
    -[HGAudioFeedbackConfiguration setEnableWaitingTone:](v2, "setEnableWaitingTone:", [v6 enableWaitingTone]);
  }
  return v2;
}

- (BOOL)enableWaitingTone
{
  v2 = [(HGAudioFeedbackConfiguration *)self internal];
  char v3 = [v2 enableWaitingTone];

  return v3;
}

- (void)setEnableWaitingTone:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HGAudioFeedbackConfiguration *)self internal];
  [v4 setEnableWaitingTone:v3];
}

- (BOOL)enableAudioFeedback
{
  v2 = [(HGAudioFeedbackConfiguration *)self internal];
  char v3 = [v2 enableAudioFeedback];

  return v3;
}

- (void)setEnableAudioFeedback:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HGAudioFeedbackConfiguration *)self internal];
  [v4 setEnableAudioFeedback:v3];
}

- (unsigned)audioSessionID
{
  v2 = [(HGAudioFeedbackConfiguration *)self internal];
  unsigned int v3 = [v2 audioSessionID];

  return v3;
}

- (void)setAudioSessionID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(HGAudioFeedbackConfiguration *)self internal];
  [v4 setAudioSessionID:v3];
}

- (void)enableAudioFeedbackForHeadGesture:(unint64_t)a3 toEnable:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(HGAudioFeedbackConfiguration *)self internal];
  [v6 enableAudioFeedbackForGestureWithGesture:a3 enable:v4];
}

- (void)enableAudioFeedbackForHeadGesturePart:(unint64_t)a3 toEnable:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(HGAudioFeedbackConfiguration *)self internal];
  [v6 enableAudioFeedbackForPartGestureWithPart:a3 enable:v4];
}

- (BOOL)invertedConfirmationAudioFeedbackMode
{
  v2 = [(HGAudioFeedbackConfiguration *)self internal];
  char v3 = [v2 invertedConfirmationAudioFeedbackMode];

  return v3;
}

- (void)setInvertedConfirmationAudioFeedbackMode:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HGAudioFeedbackConfiguration *)self internal];
  [v4 setInvertedConfirmationAudioFeedbackMode:v3];
}

- (HGAudioFeedbackConfigurationInternal)internal
{
  return self->_internal;
}

- (void)setInternal:(id)a3
{
}

- (void).cxx_destruct
{
}

@end