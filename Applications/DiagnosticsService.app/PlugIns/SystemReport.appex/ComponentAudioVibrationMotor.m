@interface ComponentAudioVibrationMotor
- (BOOL)isPresent;
@end

@implementation ComponentAudioVibrationMotor

- (BOOL)isPresent
{
  return findDeviceWithName("vibrator");
}

@end