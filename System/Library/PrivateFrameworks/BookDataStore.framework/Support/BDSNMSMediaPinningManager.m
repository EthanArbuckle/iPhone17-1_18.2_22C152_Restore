@interface BDSNMSMediaPinningManager
+ (id)sharedManager;
@end

@implementation BDSNMSMediaPinningManager

+ (id)sharedManager
{
  id v2 = sub_100072178();
  return [v2 sharedManager];
}

@end