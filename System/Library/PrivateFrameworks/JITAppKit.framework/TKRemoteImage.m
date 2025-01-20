@interface TKRemoteImage
- (TKRemoteImage)init;
- (id)imageTraitForMetrics;
@end

@implementation TKRemoteImage

- (TKRemoteImage)init
{
  SEL v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)TKRemoteImage;
  v6 = [(TKAdaptiveImage *)&v4 init];
  objc_storeStrong((id *)&v6, v6);
  if (v6) {
    [(TKAdaptiveImage *)v6 setService:@"original"];
  }
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (id)imageTraitForMetrics
{
  return (id)[(id)objc_opt_class() zeroTrait];
}

@end