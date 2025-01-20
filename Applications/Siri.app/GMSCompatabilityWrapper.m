@interface GMSCompatabilityWrapper
+ (BOOL)siriGMAssetsAvailable;
- (GMSCompatabilityWrapper)init;
@end

@implementation GMSCompatabilityWrapper

+ (BOOL)siriGMAssetsAvailable
{
  return _s4Siri36GenerativeModelsCompatabilityWrapperC21siriGMAssetsAvailableSbyFZ_0() & 1;
}

- (GMSCompatabilityWrapper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GenerativeModelsCompatabilityWrapper();
  return [(GMSCompatabilityWrapper *)&v3 init];
}

@end