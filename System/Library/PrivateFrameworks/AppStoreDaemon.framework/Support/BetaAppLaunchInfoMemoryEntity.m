@interface BetaAppLaunchInfoMemoryEntity
+ (Class)databaseEntityClass;
+ (id)defaultProperties;
@end

@implementation BetaAppLaunchInfoMemoryEntity

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class();
}

+ (id)defaultProperties
{
  v4[0] = @"bundle_id";
  v4[1] = @"bundle_version";
  v4[2] = @"email";
  v4[3] = @"expiration_date";
  v4[4] = @"has_shared_screenshot_feedback";
  v4[5] = @"feedback_enabled";
  v4[6] = @"icon_url_template";
  v4[7] = @"last_seen_date";
  v4[8] = @"launch_screen_enabled";
  v4[9] = @"localized_display_names";
  v4[10] = @"platform";
  v4[11] = @"primary_locale";
  v4[12] = @"bundle_short_version";
  v4[13] = @"what_to_test";
  v2 = +[NSArray arrayWithObjects:v4 count:14];
  return v2;
}

@end