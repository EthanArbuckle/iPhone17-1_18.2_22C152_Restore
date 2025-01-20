uint64_t BCDiscoverPluginDescriptionWithSymbol()
{
  return _BCDiscoverPluginDescriptionWithSymbol();
}

uint64_t BPSGetActiveSetupCompletedDevice()
{
  return _BPSGetActiveSetupCompletedDevice();
}

uint64_t BPSOpenSensitiveURLAsync()
{
  return _BPSOpenSensitiveURLAsync();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}
)
    __break(0xC471u);
  return v3;
}

- (id)titleForDiscoverPlugin
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"WELCOME_TO_APPLE_WATCH_PLUGIN_TITLE" value:&stru_40D0 table:@"WelcomeToAppleWatchPlugin"];

  return v3;
}

- (id)descriptionForDiscoverPlugin
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"WELCOME_TO_APPLE_WATCH_PLUGIN_DESCRIPTION" value:&stru_40D0 table:@"WelcomeToAppleWatchPlugin"];
  v4 = BCDiscoverPluginDescriptionWithSymbol();

  return v4;
}

- (unint64_t)displaySectionForPlugin
{
  return 0;
}

- (unint64_t)displayIndexForPluginInSection
{
  return 1;
}

- (void)onUserTappedPlugin
{
  +[NSURL URLWithString:@"x-apple-tips://open?collection=WelcomeToWatch&referrer=com.apple.Bridge"];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  BPSOpenSensitiveURLAsync();
}

- (unint64_t)analyticsEventType
{
  return 4;
}

- (BOOL)isAvailableInCurrentConfiguration
{
  id v2 = BPSGetActiveSetupCompletedDevice();
  BOOL v3 = v2 != 0;

  return v3;
}

@end