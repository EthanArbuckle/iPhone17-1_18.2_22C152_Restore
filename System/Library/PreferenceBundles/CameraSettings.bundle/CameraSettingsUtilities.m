@interface CameraSettingsUtilities
+ (id)displayNameForBundleID:(id)a3;
@end

@implementation CameraSettingsUtilities

+ (id)displayNameForBundleID:(id)a3
{
  v3 = a3;
  id v10 = 0;
  id v4 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v3 allowPlaceholder:1 error:&v10];
  id v5 = v10;
  if (v4)
  {
    v6 = [v4 localizedName];
    v7 = v3;
  }
  else
  {
    v7 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_15148((uint64_t)v3, (uint64_t)v5, v7);
    }
    v6 = v3;
  }

  id v8 = v6;
  return v8;
}

@end