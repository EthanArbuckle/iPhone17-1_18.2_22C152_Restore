@interface UIMenuController(DOCDeprecated)
- (void)hideMenuIfActive;
@end

@implementation UIMenuController(DOCDeprecated)

- (void)hideMenuIfActive
{
  v2 = [MEMORY[0x263F1C498] activeCalloutBar];

  if (v2)
  {
    [a1 hideMenu];
  }
}

@end