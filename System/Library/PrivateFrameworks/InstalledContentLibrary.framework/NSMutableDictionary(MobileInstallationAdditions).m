@interface NSMutableDictionary(MobileInstallationAdditions)
+ (id)MI_dictionaryWithContentsOfURL:()MobileInstallationAdditions options:error:;
@end

@implementation NSMutableDictionary(MobileInstallationAdditions)

+ (id)MI_dictionaryWithContentsOfURL:()MobileInstallationAdditions options:error:
{
  v6.receiver = a1;
  v6.super_class = (Class)&off_1F171B7A8;
  v4 = objc_msgSendSuper2(&v6, sel_MI_dictionaryWithContentsOfURL_options_error_, a3, a4 | 1);
  return v4;
}

@end