@interface CARDoNotDisturbSpecifier
- (CARDoNotDisturbSpecifier)init;
@end

@implementation CARDoNotDisturbSpecifier

- (CARDoNotDisturbSpecifier)init
{
  v3 = sub_1000210C8(@"DRIVING_ACTIVATE_CARPLAY");
  v6.receiver = self;
  v6.super_class = (Class)CARDoNotDisturbSpecifier;
  v4 = [(CARSettingsSwitchCellSpecifier *)&v6 initWithTitle:v3 image:0];

  return v4;
}

@end