@interface SystemFontsListController
+ (BOOL)showInstalledFonts;
- (SystemFontsListController)init;
@end

@implementation SystemFontsListController

- (SystemFontsListController)init
{
  v3.receiver = self;
  v3.super_class = (Class)SystemFontsListController;
  return [(SystemFontsListController *)&v3 init];
}

+ (BOOL)showInstalledFonts
{
  return 0;
}

@end