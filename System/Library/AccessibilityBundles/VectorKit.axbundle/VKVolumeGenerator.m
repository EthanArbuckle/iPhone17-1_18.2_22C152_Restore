@interface VKVolumeGenerator
- (VKVolumeGenerator)init;
- (float)volumeForDepth:(int)a3 minDistanceThreshold:(int)a4 maxDistanceThreshold:(int)a5;
@end

@implementation VKVolumeGenerator

- (VKVolumeGenerator)init
{
  v3.receiver = self;
  v3.super_class = (Class)VKVolumeGenerator;
  return [(VKVolumeGenerator *)&v3 init];
}

- (float)volumeForDepth:(int)a3 minDistanceThreshold:(int)a4 maxDistanceThreshold:(int)a5
{
  float result = 0.0;
  if ((a3 & 0x80000000) == 0)
  {
    float result = 1.0;
    if (a3 >= a4)
    {
      float result = 0.0;
      if (a3 <= a5)
      {
        float result = (float)(a3 - a5) / (float)(a4 - a5);
        if (result < 0.1) {
          return 0.1;
        }
      }
    }
  }
  return result;
}

@end