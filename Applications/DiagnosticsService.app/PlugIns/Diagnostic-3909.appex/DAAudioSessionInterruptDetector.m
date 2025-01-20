@interface DAAudioSessionInterruptDetector
- (void)audioSystemInterrupt:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation DAAudioSessionInterruptDetector

- (void)start
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"audioSystemInterrupt:" name:AVAudioSessionInterruptionNotification object:0];
}

- (void)audioSystemInterrupt:(id)a3
{
  id v3 = [a3 userInfo];
  v4 = [v3 objectForKeyedSubscript:AVAudioSessionInterruptionTypeKey];
  unsigned int v5 = [v4 isEqualToNumber:&off_100010840];

  if (v5)
  {
    id v6 = +[NSNotificationCenter defaultCenter];
    [v6 postNotificationName:@"AudioSessionInterruptNotification" object:0];
  }
}

- (void)stop
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:AVAudioSessionRouteChangeNotification object:0];
}

@end