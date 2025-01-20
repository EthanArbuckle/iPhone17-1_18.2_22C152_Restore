@interface CNFInternalNetworkListController
- (id)customNatType:(id)a3;
- (id)enableRelay:(id)a3;
- (id)forceIPv6:(id)a3;
- (id)forceP2P:(id)a3;
- (id)forceRelay:(id)a3;
- (id)specifiers;
- (void)setCustomNatType:(id)a3 specifier:(id)a4;
- (void)setEnableRelay:(id)a3 specifier:(id)a4;
- (void)setForceIPv6:(id)a3 specifier:(id)a4;
- (void)setForceP2P:(id)a3 specifier:(id)a4;
- (void)setForceRelay:(id)a3 specifier:(id)a4;
@end

@implementation CNFInternalNetworkListController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    uint64_t v5 = [(CNFInternalNetworkListController *)self loadSpecifiersFromPlistName:@"ConferenceInternalNetworkSettings" target:self];
    v6 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v5;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (void)setEnableRelay:(id)a3 specifier:(id)a4
{
  if ([a3 BOOLValue]) {
    v4 = 0;
  }
  else {
    v4 = +[NSNumber numberWithInt:1];
  }
  CFPreferencesSetAppValue(@"disableRelay", v4, @"com.apple.conference");

  CFPreferencesAppSynchronize(@"com.apple.conference");
}

- (id)enableRelay:(id)a3
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"disableRelay", @"com.apple.conference", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v4 = AppIntegerValue == 1;
  }
  else {
    BOOL v4 = 0;
  }
  uint64_t v5 = !v4;
  v6 = +[NSNumber numberWithBool:v5];

  return v6;
}

- (void)setForceRelay:(id)a3 specifier:(id)a4
{
  if ([a3 BOOLValue]) {
    BOOL v4 = +[NSNumber numberWithInt:1];
  }
  else {
    BOOL v4 = 0;
  }
  CFPreferencesSetAppValue(@"forceRelay", v4, @"com.apple.conference");

  CFPreferencesAppSynchronize(@"com.apple.conference");
}

- (id)forceRelay:(id)a3
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"forceRelay", @"com.apple.conference", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v4 = AppIntegerValue == 1;
  }
  else {
    BOOL v4 = 0;
  }
  uint64_t v5 = v4;
  v6 = +[NSNumber numberWithBool:v5];

  return v6;
}

- (void)setCustomNatType:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  NSLog(@"Setting custom nat type to %@", v6);
  if ([v6 integerValue] == (id)-1)
  {
    BOOL v4 = 0;
    uint64_t v5 = 0;
  }
  else
  {
    BOOL v4 = +[NSNumber numberWithBool:1];
    uint64_t v5 = v6;
  }
  CFPreferencesSetAppValue(@"UseCustomNatType", v4, @"com.apple.conference");
  CFPreferencesSetAppValue(@"CustomNatType", v5, @"com.apple.conference");
  CFPreferencesAppSynchronize(@"com.apple.conference");
}

- (id)customNatType:(id)a3
{
  Boolean keyExistsAndHasValidFormat = 0;
  unsigned int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"UseCustomNatType", @"com.apple.conference", &keyExistsAndHasValidFormat);
  NSLog(@"Has value : %d  usesCustomNat : %d", keyExistsAndHasValidFormat, AppBooleanValue);
  uint64_t v4 = -1;
  if (AppBooleanValue && keyExistsAndHasValidFormat)
  {
    Boolean v9 = 0;
    CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"CustomNatType", @"com.apple.conference", &v9);
    if (AppIntegerValue <= -1 || v9 == 0) {
      uint64_t v4 = -1;
    }
    else {
      uint64_t v4 = AppIntegerValue;
    }
  }
  v7 = +[NSNumber numberWithInteger:v4];

  return v7;
}

- (void)setForceP2P:(id)a3 specifier:(id)a4
{
  if ([a3 BOOLValue]) {
    uint64_t v4 = +[NSNumber numberWithInt:1];
  }
  else {
    uint64_t v4 = 0;
  }
  CFPreferencesSetAppValue(@"forceP2P", v4, @"com.apple.VideoConference");

  CFPreferencesAppSynchronize(@"com.apple.VideoConference");
}

- (id)forceP2P:(id)a3
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"forceP2P", @"com.apple.VideoConference", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v4 = AppIntegerValue == 1;
  }
  else {
    BOOL v4 = 0;
  }
  uint64_t v5 = v4;
  id v6 = +[NSNumber numberWithBool:v5];

  return v6;
}

- (void)setForceIPv6:(id)a3 specifier:(id)a4
{
  if ([a3 BOOLValue]) {
    BOOL v4 = +[NSNumber numberWithInt:1];
  }
  else {
    BOOL v4 = 0;
  }
  CFPreferencesSetAppValue(@"forceIPv6", v4, @"com.apple.VideoConference");

  CFPreferencesAppSynchronize(@"com.apple.VideoConference");
}

- (id)forceIPv6:(id)a3
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"forceIPv6", @"com.apple.VideoConference", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v4 = AppIntegerValue == 1;
  }
  else {
    BOOL v4 = 0;
  }
  uint64_t v5 = v4;
  id v6 = +[NSNumber numberWithBool:v5];

  return v6;
}

@end