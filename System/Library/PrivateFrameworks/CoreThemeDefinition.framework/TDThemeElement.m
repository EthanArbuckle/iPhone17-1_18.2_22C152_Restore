@interface TDThemeElement
- (id)debugDescription;
@end

@implementation TDThemeElement

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"%02u-%@", -[TDThemeConstant identifier](self, "identifier"), -[TDThemeConstant displayName](self, "displayName")];
}

@end