@interface PHASESessionVolumeImpl
- (BOOL)registerVolumeChangedNotificationBlock:(id)a3;
- (id)volumeForCommand:(id)a3;
- (id)volumeForCommandFromCallback:(id)a3;
@end

@implementation PHASESessionVolumeImpl

- (id)volumeForCommandFromCallback:(id)a3
{
  return 0;
}

- (id)volumeForCommand:(id)a3
{
  return 0;
}

- (BOOL)registerVolumeChangedNotificationBlock:(id)a3
{
  return 0;
}

@end