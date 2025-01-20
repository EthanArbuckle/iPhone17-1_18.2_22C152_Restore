@interface AVPlaybackRateCollection
+ (AVPlaybackRateCollection)collectionWithDefaultRates;
+ (AVPlaybackRateCollection)collectionWithRates:(id)a3;
@end

@implementation AVPlaybackRateCollection

+ (AVPlaybackRateCollection)collectionWithRates:(id)a3
{
  return +[AVPlaybackSpeedCollection collectionWithSpeeds:a3];
}

+ (AVPlaybackRateCollection)collectionWithDefaultRates
{
  v2 = +[AVPlaybackSpeed systemDefaultSpeeds];
  v3 = +[AVPlaybackSpeedCollection collectionWithSpeeds:v2];

  return (AVPlaybackRateCollection *)v3;
}

@end