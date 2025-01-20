@interface CARSettingsCellSpecifierWrapperPanel
+ (id)panelWrappingCellSpecifier:(id)a3;
- (CARSettingsCellSpecifier)wrappedSpecifier;
- (id)cellSpecifier;
- (void)setWrappedSpecifier:(id)a3;
@end

@implementation CARSettingsCellSpecifierWrapperPanel

+ (id)panelWrappingCellSpecifier:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setWrappedSpecifier:v3];

  return v4;
}

- (id)cellSpecifier
{
  return [(CARSettingsCellSpecifierWrapperPanel *)self wrappedSpecifier];
}

- (CARSettingsCellSpecifier)wrappedSpecifier
{
  return self->_wrappedSpecifier;
}

- (void)setWrappedSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end