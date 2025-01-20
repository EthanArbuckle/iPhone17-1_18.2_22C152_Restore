@interface CARSettingsSwitchCellSpecifier
- (CARSettingsSwitchCellSpecifier)initWithTitle:(id)a3 image:(id)a4;
- (CARSettingsSwitchCellSpecifier)initWithTitle:(id)a3 image:(id)a4 actionBlock:(id)a5;
@end

@implementation CARSettingsSwitchCellSpecifier

- (CARSettingsSwitchCellSpecifier)initWithTitle:(id)a3 image:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CARSettingsSwitchCellSpecifier;
  return [(CARSettingsCellSpecifier *)&v5 initWithTitle:a3 image:a4 accessoryType:104];
}

- (CARSettingsSwitchCellSpecifier)initWithTitle:(id)a3 image:(id)a4 actionBlock:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)CARSettingsSwitchCellSpecifier;
  return [(CARSettingsCellSpecifier *)&v6 initWithTitle:a3 image:a4 accessoryType:104 actionBlock:a5];
}

@end