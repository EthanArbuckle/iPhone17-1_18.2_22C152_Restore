@interface PHSOSDialSlidingViewModel
- (BOOL)playsSound;
- (double)countdownTickDuration;
- (unint64_t)countdown;
- (unint64_t)countdownWithAudio;
@end

@implementation PHSOSDialSlidingViewModel

- (unint64_t)countdown
{
  return 8;
}

- (unint64_t)countdownWithAudio
{
  return [(PHSOSDialSlidingViewModel *)self countdown] - 3;
}

- (double)countdownTickDuration
{
  return 1.0;
}

- (BOOL)playsSound
{
  return +[SOSUtilities shouldPlayAudioDuringCountdown];
}

@end