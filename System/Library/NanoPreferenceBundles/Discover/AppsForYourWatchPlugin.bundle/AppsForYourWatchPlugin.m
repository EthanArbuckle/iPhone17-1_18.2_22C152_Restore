uint64_t BCDiscoverPluginDescriptionWithSymbol()
{
  return _BCDiscoverPluginDescriptionWithSymbol();
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

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}
);
  v3 = +[UIImage imageNamed:@"Discover_App Store" inBundle:v2];

  return v3;
}

- (id)descriptionForDiscoverPlugin
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"APPS_FOR_YOUR_WATCH_PLUGIN_DESCRIPTION" value:&stru_4108 table:@"AppsForYourWatchPlugin"];
  v4 = BCDiscoverPluginDescriptionWithSymbol();

  return v4;
}

- (id)titleForDiscoverPlugin
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"APPS_FOR_YOUR_WATCH_PLUGIN_TITLE" value:&stru_4108 table:@"AppsForYourWatchPlugin"];

  return v3;
}

- (unint64_t)displaySectionForPlugin
{
  return 1;
}

- (unint64_t)displayIndexForPluginInSection
{
  return 2;
}

- (void)onUserTappedPlugin
{
  +[NSURL URLWithString:@"itms-apps://?action=watchCategory"];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = +[UIApplication sharedApplication];
  [v2 openURL:v3 withCompletionHandler:&stru_4088];
}

- (unint64_t)analyticsEventType
{
  return 9;
}

@end