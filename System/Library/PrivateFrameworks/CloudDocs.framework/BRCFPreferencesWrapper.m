@interface BRCFPreferencesWrapper
- (id)getBoolValueOfPreference:(id)a3 domain:(id)a4;
@end

@implementation BRCFPreferencesWrapper

- (id)getBoolValueOfPreference:(id)a3 domain:(id)a4
{
  Boolean keyExistsAndHasValidFormat = 0;
  uint64_t AppBooleanValue = CFPreferencesGetAppBooleanValue((CFStringRef)a3, (CFStringRef)a4, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    v5 = [NSNumber numberWithUnsignedChar:AppBooleanValue];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end