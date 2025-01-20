@interface ATXCategoricalFeatureLargeGeohash
- (id)categoricalFeatureValueForContext:(id)a3 candidate:(id)a4;
@end

@implementation ATXCategoricalFeatureLargeGeohash

- (id)categoricalFeatureValueForContext:(id)a3 candidate:(id)a4
{
  v4 = [a3 locationMotionContext];
  uint64_t v5 = [v4 largeGeohash];

  v6 = [NSNumber numberWithLongLong:v5];
  v7 = [v6 stringValue];

  return v7;
}

@end