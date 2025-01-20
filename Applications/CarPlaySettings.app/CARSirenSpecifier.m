@interface CARSirenSpecifier
- (CARSirenSpecifier)init;
@end

@implementation CARSirenSpecifier

- (CARSirenSpecifier)init
{
  v3 = sub_1000210C8(@"ACCESSIBILITY_SIREN");
  v6.receiver = self;
  v6.super_class = (Class)CARSirenSpecifier;
  v4 = [(CARSettingsSwitchCellSpecifier *)&v6 initWithTitle:v3 image:0];

  return v4;
}

@end