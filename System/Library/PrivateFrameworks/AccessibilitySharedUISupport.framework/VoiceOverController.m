@interface VoiceOverController
- (void)_voiceOverEnabledChangedMacWithNotification:(id)a3;
- (void)_votTrainingInfoDidUpdateWithNotification:(id)a3;
- (void)_votTrainingSpeakingRateDidUpdateWithNotification:(id)a3;
- (void)keyboardWillHideWithNotification:(id)a3;
- (void)keyboardWillShowWithNotification:(id)a3;
@end

@implementation VoiceOverController

- (void)keyboardWillShowWithNotification:(id)a3
{
  uint64_t v4 = *(void *)self->_recognizedCommandIdentifier;
  swift_beginAccess();
  *(unsigned char *)(v4 + 40) = 25;
  id v5 = a3;
  swift_retain();
  swift_retain();
  sub_228D8B7FC();

  swift_release();
  swift_release();
}

- (void)keyboardWillHideWithNotification:(id)a3
{
  uint64_t v4 = *(void *)self->_recognizedCommandIdentifier;
  swift_beginAccess();
  *(unsigned char *)(v4 + 40) = 24;
  id v5 = a3;
  swift_retain();
  swift_retain();
  sub_228D8B7FC();

  swift_release();
  swift_release();
}

- (void)_voiceOverEnabledChangedMacWithNotification:(id)a3
{
}

- (void)_votTrainingInfoDidUpdateWithNotification:(id)a3
{
}

- (void)_votTrainingSpeakingRateDidUpdateWithNotification:(id)a3
{
}

@end