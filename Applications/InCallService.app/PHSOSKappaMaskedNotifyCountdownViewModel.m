@interface PHSOSKappaMaskedNotifyCountdownViewModel
- (BOOL)playsHaptics;
- (BOOL)playsSound;
- (NSString)subtitleString;
- (NSString)titleString;
- (double)countdownTickDuration;
- (id)countdownString:(unint64_t)a3;
- (unint64_t)countdown;
- (unint64_t)countdownWithAudio;
@end

@implementation PHSOSKappaMaskedNotifyCountdownViewModel

- (NSString)titleString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"SOS_NOTIFICATION" value:&stru_1002D6110 table:@"InCallService"];

  return (NSString *)v3;
}

- (NSString)subtitleString
{
  return (NSString *)&stru_1002D6110;
}

- (unint64_t)countdown
{
  return 10;
}

- (unint64_t)countdownWithAudio
{
  return 0;
}

- (id)countdownString:(unint64_t)a3
{
  v3 = +[NSNumber numberWithUnsignedInteger:a3];
  v4 = +[NSNumberFormatter localizedStringFromNumber:v3 numberStyle:0];

  return v4;
}

- (double)countdownTickDuration
{
  return 1.0;
}

- (BOOL)playsSound
{
  return 0;
}

- (BOOL)playsHaptics
{
  return 0;
}

@end