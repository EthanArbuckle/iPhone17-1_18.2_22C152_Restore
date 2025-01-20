@interface CPSClipLaunchOptions
+ (BOOL)supportsSecureCoding;
+ (id)optionsForAppClipRecord:(id)a3;
- (BOOL)showsAppAttributionBanner;
- (BOOL)skipsLaunching;
- (CPSClipLaunchOptions)initWithCoder:(id)a3;
- (NSNumber)locationConfirmationGranted;
- (NSNumber)userNotificationGranted;
- (NSString)predefinedBundleID;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setLocationConfirmationGranted:(id)a3;
- (void)setPredefinedBundleID:(id)a3;
- (void)setShowsAppAttributionBanner:(BOOL)a3;
- (void)setSkipsLaunching:(BOOL)a3;
- (void)setUserNotificationGranted:(id)a3;
@end

@implementation CPSClipLaunchOptions

+ (id)optionsForAppClipRecord:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  v6 = [v4 userNotificationGranted];
  [v5 setUserNotificationGranted:v6];

  v7 = [v4 locationConfirmationGranted];

  [v5 setLocationConfirmationGranted:v7];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setUserNotificationGranted:self->_userNotificationGranted];
  [v4 setLocationConfirmationGranted:self->_locationConfirmationGranted];
  id v5 = (void *)[(NSString *)self->_predefinedBundleID copy];
  [v4 setPredefinedBundleID:v5];

  [v4 setSkipsLaunching:self->_skipsLaunching];
  [v4 setShowsAppAttributionBanner:self->_showsAppAttributionBanner];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSClipLaunchOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CPSClipLaunchOptions;
  id v5 = [(CPSClipLaunchOptions *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UserNotificationPermissionEnabled"];
    userNotificationGranted = v5->_userNotificationGranted;
    v5->_userNotificationGranted = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LocationConfirmationPermissionEnabled"];
    locationConfirmationGranted = v5->_locationConfirmationGranted;
    v5->_locationConfirmationGranted = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PredefinedBundleID"];
    predefinedBundleID = v5->_predefinedBundleID;
    v5->_predefinedBundleID = (NSString *)v10;

    v5->_skipsLaunching = [v4 decodeBoolForKey:@"InstallWithoutLaunching"];
    v5->_showsAppAttributionBanner = [v4 decodeBoolForKey:@"ShowsAppAttributionBanner"];
    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  userNotificationGranted = self->_userNotificationGranted;
  id v5 = a3;
  [v5 encodeObject:userNotificationGranted forKey:@"UserNotificationPermissionEnabled"];
  [v5 encodeObject:self->_locationConfirmationGranted forKey:@"LocationConfirmationPermissionEnabled"];
  [v5 encodeObject:self->_predefinedBundleID forKey:@"PredefinedBundleID"];
  [v5 encodeBool:self->_skipsLaunching forKey:@"InstallWithoutLaunching"];
  [v5 encodeBool:self->_showsAppAttributionBanner forKey:@"ShowsAppAttributionBanner"];
}

- (NSNumber)userNotificationGranted
{
  return self->_userNotificationGranted;
}

- (void)setUserNotificationGranted:(id)a3
{
}

- (NSNumber)locationConfirmationGranted
{
  return self->_locationConfirmationGranted;
}

- (void)setLocationConfirmationGranted:(id)a3
{
}

- (NSString)predefinedBundleID
{
  return self->_predefinedBundleID;
}

- (void)setPredefinedBundleID:(id)a3
{
}

- (BOOL)skipsLaunching
{
  return self->_skipsLaunching;
}

- (void)setSkipsLaunching:(BOOL)a3
{
  self->_skipsLaunching = a3;
}

- (BOOL)showsAppAttributionBanner
{
  return self->_showsAppAttributionBanner;
}

- (void)setShowsAppAttributionBanner:(BOOL)a3
{
  self->_showsAppAttributionBanner = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predefinedBundleID, 0);
  objc_storeStrong((id *)&self->_locationConfirmationGranted, 0);

  objc_storeStrong((id *)&self->_userNotificationGranted, 0);
}

@end