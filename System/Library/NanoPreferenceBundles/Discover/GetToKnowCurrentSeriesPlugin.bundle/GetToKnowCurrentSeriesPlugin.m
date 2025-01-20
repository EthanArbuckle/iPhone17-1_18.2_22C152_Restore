uint64_t BCViewContollerForModallyPresentingTheUrl()
{
  return _BCViewContollerForModallyPresentingTheUrl();
}

uint64_t BPSGetActiveSetupCompletedDevice()
{
  return _BPSGetActiveSetupCompletedDevice();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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
vars8)) & 0x4000000000000000) != 0)
    __break(0xC471u);
  return v3;
}

- (id)titleForDiscoverPlugin
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"GET_TO_KNOW_CURRENT_SERIES_PLUGIN_TITLE" value:&stru_40E0 table:@"GetToKnowCurrentSeriesPlugin"];

  return v3;
}

- (id)descriptionForDiscoverPlugin
{
  id v2 = objc_alloc((Class)NSMutableAttributedString);
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"GET_TO_KNOW_CURRENT_SERIES_PLUGIN_DESCRIPTION" value:&stru_40E0 table:@"GetToKnowCurrentSeriesPlugin"];
  id v5 = [v2 initWithString:v4];

  return v5;
}

- (unint64_t)displaySectionForPlugin
{
  return 0;
}

- (unint64_t)displayIndexForPluginInSection
{
  return 2;
}

- (id)detailViewControllerToLaunch
{
  id v2 = +[NSURL URLWithString:@"https://www.apple.com/watch/"];
  v3 = BCViewContollerForModallyPresentingTheUrl();

  return v3;
}

- (unint64_t)analyticsEventType
{
  return 5;
}

- (BOOL)isAvailableInCurrentConfiguration
{
  id v2 = BPSGetActiveSetupCompletedDevice();
  BOOL v3 = v2 == 0;

  return v3;
}

@end