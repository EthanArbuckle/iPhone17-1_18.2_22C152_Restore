@interface AXLiveAudioGraph
+ (void)start;
+ (void)stop;
+ (void)updateValue:(double)value;
@end

@implementation AXLiveAudioGraph

+ (void)start
{
  id v2 = [getAXMDataSonificationManagerClass() sharedManager];
  [v2 beginLiveModeSession];
}

+ (void)updateValue:(double)value
{
  id v4 = [getAXMDataSonificationManagerClass() sharedManager];
  [v4 setLiveModeValue:value];
}

+ (void)stop
{
  id v2 = [getAXMDataSonificationManagerClass() sharedManager];
  [v2 endLiveModeSession];
}

@end