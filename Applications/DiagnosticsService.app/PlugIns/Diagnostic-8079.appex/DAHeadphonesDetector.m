@interface DAHeadphonesDetector
- (void)audioRouteChanged;
- (void)start;
- (void)stop;
@end

@implementation DAHeadphonesDetector

- (void)start
{
  [(DAHeadphonesDetector *)self audioRouteChanged];
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"audioRouteChanged" name:AVAudioSessionRouteChangeNotification object:0];
}

- (void)audioRouteChanged
{
  v2 = +[AVAudioSession sharedInstance];
  id v3 = [v2 currentRoute];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = [v3 outputs];
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 portType];
        if ([v10 isEqualToString:AVAudioSessionPortBuiltInReceiver])
        {
        }
        else
        {
          v11 = [v9 portType];
          unsigned int v12 = [v11 isEqualToString:AVAudioSessionPortBuiltInSpeaker];

          if (!v12)
          {

            v4 = +[NSNotificationCenter defaultCenter];
            [v4 postNotificationName:@"HeadphonesConnectedNotification" object:0];
            goto LABEL_13;
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (void)stop
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:AVAudioSessionRouteChangeNotification object:0];
}

@end