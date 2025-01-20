@interface iFBAConstants
+ (BOOL)supportsBiometricsLock;
+ (BOOL)usesNavigationTitleIndentation;
+ (id)currentiOSLegalDoc;
+ (id)tintColor;
+ (void)initialize;
@end

@implementation iFBAConstants

+ (void)initialize
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___iFBAConstants;
  [super initialize];
  v2 = +[NSMutableDictionary dictionary];
  [v2 setObject:&__kCFBooleanFalse forKey:@"UseTouchIDLogin"];
  [v2 setObject:&__kCFBooleanFalse forKey:@"TouchIDEnableRequestShown"];
  v3 = +[NSDate dateWithTimeIntervalSince1970:0.0];
  [v2 setObject:v3 forKey:@"TouchIDLastRequested"];

  [v2 setObject:&off_1000FA998 forKey:@"TouchIDTimeoutDuration"];
  [v2 setObject:&__kCFBooleanFalse forKey:@"IndentNavigationTitle"];
  [v2 setObject:&__kCFBooleanTrue forKey:@"SupportsBiometricsLock"];
  v4 = +[NSUserDefaults standardUserDefaults];
  [v4 registerDefaults:v2];
}

+ (BOOL)supportsBiometricsLock
{
  if (qword_100124140 != -1) {
    dispatch_once(&qword_100124140, &stru_1000F3D48);
  }
  return byte_100124148;
}

+ (id)tintColor
{
  return +[UIColor systemPurpleColor];
}

+ (id)currentiOSLegalDoc
{
  v2 = +[NSLocale currentLocale];
  v3 = [v2 objectForKey:NSLocaleLanguageCode];
  v4 = +[NSBundle mainBundle];
  objc_super v5 = [v4 URLForResource:@"License" withExtension:@"rtf" subdirectory:0 localization:v3];

  if (!v5)
  {
    v6 = +[NSBundle mainBundle];
    objc_super v5 = [v6 URLForResource:@"License" withExtension:@"rtf"];
  }

  return v5;
}

+ (BOOL)usesNavigationTitleIndentation
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"IndentNavigationTitle"];

  return v3;
}

@end