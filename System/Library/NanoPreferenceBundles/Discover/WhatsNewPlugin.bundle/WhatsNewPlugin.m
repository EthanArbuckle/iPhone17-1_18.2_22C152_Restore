uint64_t BCDiscoverPluginDescriptionWithSymbol()
{
  return _BCDiscoverPluginDescriptionWithSymbol();
}

uint64_t BPSDeviceHasCapabilityForString()
{
  return _BPSDeviceHasCapabilityForString();
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
 uint64_t vars8;

  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"WHATS_NEW_PLUGIN_DESCRIPTION" value:&stru_40E0 table:@"WhatsNewPlugin"];
  v4 = BCDiscoverPluginDescriptionWithSymbol();

  return v4;
}

- (id)titleForDiscoverPlugin
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"WHATS_NEW_PLUGIN_TITLE" value:&stru_40E0 table:@"WhatsNewPlugin"];

  return v3;
}

- (unint64_t)displaySectionForPlugin
{
  return 0;
}

- (unint64_t)displayIndexForPluginInSection
{
  return 0;
}

- (void)onUserTappedPlugin
{
  +[NSURL URLWithString:@"x-apple-tips://open?collection=WhatsNewInWatchOS&referrer=com.apple.Bridge"];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  BPSOpenSensitiveURLAsync();
}

- (unint64_t)analyticsEventType
{
  return 3;
}

- (BOOL)isAvailableInCurrentConfiguration
{
  id v2 = BPSGetActiveSetupCompletedDevice();
  if (v2) {
    char HasCapabilityForString = BPSDeviceHasCapabilityForString();
  }
  else {
    char HasCapabilityForString = 0;
  }

  return HasCapabilityForString;
}

@end