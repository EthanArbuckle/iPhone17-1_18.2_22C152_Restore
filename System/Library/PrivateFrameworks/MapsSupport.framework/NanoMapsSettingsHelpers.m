@interface NanoMapsSettingsHelpers
+ (NSUserDefaults)companionUserDefaults;
+ (NSUserDefaults)nanoMapsUserDefaults;
@end

@implementation NanoMapsSettingsHelpers

+ (NSUserDefaults)nanoMapsUserDefaults
{
  if (qword_10009B798 != -1) {
    dispatch_once(&qword_10009B798, &stru_100081CB0);
  }
  v2 = (void *)qword_10009B790;

  return (NSUserDefaults *)v2;
}

+ (NSUserDefaults)companionUserDefaults
{
  if (qword_10009B7A8 != -1) {
    dispatch_once(&qword_10009B7A8, &stru_100081CD0);
  }
  v2 = (void *)qword_10009B7A0;

  return (NSUserDefaults *)v2;
}

@end