@interface ZWLaserIsEnabled
@end

@implementation ZWLaserIsEnabled

void __ZWLaserIsEnabled_block_invoke(id a1)
{
  id v1 = +[AXSettings sharedInstance];
  ZWLaserIsEnabled__LaserEnabled = [v1 laserEnabled];
}

@end