@interface iFBKConstants
+ (CGSize)bugFormPreferredContentSize;
+ (id)currentiOSLegalDoc;
+ (void)initialize;
@end

@implementation iFBKConstants

+ (void)initialize
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___iFBKConstants;
  objc_msgSendSuper2(&v3, sel_initialize);
  v2 = +[FBKSharedConstants sharedUserDefaults];
  [v2 registerDefaults:MEMORY[0x263EFFA78]];
}

+ (id)currentiOSLegalDoc
{
  v2 = [MEMORY[0x263EFF960] currentLocale];
  objc_super v3 = [v2 objectForKey:*MEMORY[0x263EFF508]];
  v4 = [MEMORY[0x263F086E0] mainBundle];
  v5 = [v4 URLForResource:@"License" withExtension:@"rtf" subdirectory:0 localization:v3];

  if (!v5)
  {
    v6 = [MEMORY[0x263F086E0] mainBundle];
    v5 = [v6 URLForResource:@"License" withExtension:@"rtf"];
  }

  return v5;
}

+ (CGSize)bugFormPreferredContentSize
{
  double v2 = 600.0;
  double v3 = 800.0;
  result.height = v3;
  result.width = v2;
  return result;
}

@end