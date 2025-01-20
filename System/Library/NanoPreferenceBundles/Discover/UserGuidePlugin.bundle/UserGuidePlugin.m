id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}
  v3 = age imageNamed:@"Discover_UserGuide" inBundle:v2];

  return v3;
}

- (id)descriptionForDiscoverPlugin
{
  id v2 = [objc_alloc((Class)NSMutableAttributedString) initWithString:&stru_4088];

  return v2;
}

- (id)detailViewControllerToLaunch
{
  id v2 = objc_alloc_init((Class)BCUserGuide);
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"USER_GUIDE_PLUGIN_TITLE" value:&stru_4088 table:@"UserGuidePlugin"];
  v5 = [v2 getUserGuideViewWithTitle:v4];

  return v5;
}

- (id)titleForDiscoverPlugin
{
  id v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"USER_GUIDE_PLUGIN_TITLE" value:&stru_4088 table:@"UserGuidePlugin"];

  return v3;
}

- (unint64_t)displaySectionForPlugin
{
  return 0;
}

- (unint64_t)displayIndexForPluginInSection
{
  return 3;
}

- (unint64_t)analyticsEventType
{
  return 6;
}

@end