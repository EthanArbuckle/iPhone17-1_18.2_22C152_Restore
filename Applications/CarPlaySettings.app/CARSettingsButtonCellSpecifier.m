@interface CARSettingsButtonCellSpecifier
- (CARSettingsButtonCellSpecifier)initWithTitle:(id)a3 image:(id)a4;
- (CARSettingsButtonCellSpecifier)initWithTitle:(id)a3 image:(id)a4 actionBlock:(id)a5;
@end

@implementation CARSettingsButtonCellSpecifier

- (CARSettingsButtonCellSpecifier)initWithTitle:(id)a3 image:(id)a4 actionBlock:(id)a5
{
  id v8 = a5;
  v9 = [(CARSettingsButtonCellSpecifier *)self initWithTitle:a3 image:a4];
  [(CARSettingsCellSpecifier *)v9 setActionBlock:v8];

  return v9;
}

- (CARSettingsButtonCellSpecifier)initWithTitle:(id)a3 image:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CARSettingsButtonCellSpecifier;
  v4 = [(CARSettingsCellSpecifier *)&v7 initWithTitle:a3 image:a4 accessoryType:0];
  v5 = +[UIColor _carSystemFocusColor];
  [(CARSettingsCellSpecifier *)v4 setTitleColor:v5];

  return v4;
}

@end