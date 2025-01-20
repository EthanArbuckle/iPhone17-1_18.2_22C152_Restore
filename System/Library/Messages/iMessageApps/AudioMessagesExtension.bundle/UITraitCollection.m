@interface UITraitCollection
- (BOOL)isUserInterfaceStyleDark;
@end

@implementation UITraitCollection

- (BOOL)isUserInterfaceStyleDark
{
  return (char *)[(UITraitCollection *)self userInterfaceStyle] == (char *)&def_3AC7C + 2;
}

@end