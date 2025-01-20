@interface NSBundle
+ (id)fcui_focusSettingsLocalizationBundle;
@end

@implementation NSBundle

+ (id)fcui_focusSettingsLocalizationBundle
{
  if (qword_23D58 != -1) {
    dispatch_once(&qword_23D58, &stru_1CD40);
  }
  v2 = (void *)qword_23D50;

  return v2;
}

@end