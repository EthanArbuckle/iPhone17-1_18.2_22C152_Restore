@interface DOCDeprecatedUIMenuController
+ (DOCDeprecatedUIMenuControllerMethods)shared;
+ (NSString)willHideMenuNotification;
+ (NSString)willShowMenuNotification;
@end

@implementation DOCDeprecatedUIMenuController

+ (DOCDeprecatedUIMenuControllerMethods)shared
{
  return (DOCDeprecatedUIMenuControllerMethods *)[MEMORY[0x263F1C7B0] sharedMenuController];
}

+ (NSString)willShowMenuNotification
{
  return (NSString *)(id)*MEMORY[0x263F1D4C0];
}

+ (NSString)willHideMenuNotification
{
  return (NSString *)(id)*MEMORY[0x263F1D4B8];
}

@end