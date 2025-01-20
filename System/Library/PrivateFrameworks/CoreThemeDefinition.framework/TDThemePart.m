@interface TDThemePart
- (id)debugDescription;
@end

@implementation TDThemePart

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"%02u-%@", -[TDThemeConstant identifier](self, "identifier"), -[TDThemeConstant displayName](self, "displayName")];
}

@end