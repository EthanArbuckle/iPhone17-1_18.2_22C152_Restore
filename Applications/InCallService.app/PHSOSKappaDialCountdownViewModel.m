@interface PHSOSKappaDialCountdownViewModel
- (BOOL)playsHaptics;
- (BOOL)playsSound;
- (NSString)subtitleString;
- (NSString)titleString;
- (double)countdownTickDuration;
- (id)countdownString:(unint64_t)a3;
- (unint64_t)countdown;
- (unint64_t)countdownWithAudio;
@end

@implementation PHSOSKappaDialCountdownViewModel

- (NSString)titleString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"EMERGENCY_SOS" value:&stru_1002D6110 table:@"InCallService"];

  return (NSString *)v3;
}

- (NSString)subtitleString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"SOS_COUNTDOWN_SUBTITLE" value:&stru_1002D6110 table:@"InCallService"];

  return (NSString *)v3;
}

- (unint64_t)countdown
{
  return 10;
}

- (unint64_t)countdownWithAudio
{
  if (+[SOSUtilities BOOLOverrideForDefaultsKey:@"debug.countdown.mute" defaultValue:0])return 0; {
  else
  }
    return 10;
}

- (id)countdownString:(unint64_t)a3
{
  v3 = +[NSNumber numberWithUnsignedInteger:a3];
  v4 = +[NSNumberFormatter localizedStringFromNumber:v3 numberStyle:0];

  return v4;
}

- (double)countdownTickDuration
{
  return 1.04999995;
}

- (BOOL)playsSound
{
  return +[SOSUtilities shouldSilenceSOSFlow] ^ 1;
}

- (BOOL)playsHaptics
{
  return 1;
}

@end