@interface CRCarPlayAppPolicy
- (BOOL)badgesAppIcon;
- (BOOL)canDisplayOnCarScreen;
- (BOOL)handlesCarIntents;
- (BOOL)isCarPlayCapable;
- (BOOL)isCarPlaySupported;
- (BOOL)launchNotificationsUsingSiri;
- (BOOL)launchUsingMusicUIService;
- (BOOL)launchUsingSiri;
- (BOOL)launchUsingTemplateUI;
- (BOOL)showsNotifications;
- (CRCarPlayAppPolicy)init;
- (NSDictionary)siriActivationOptions;
- (NSString)bundlePath;
- (unint64_t)applicationCategory;
- (unint64_t)bannerLaunchTypeForNotificationContentType:(id)a3;
- (void)setApplicationCategory:(unint64_t)a3;
- (void)setBadgesAppIcon:(BOOL)a3;
- (void)setCanDisplayOnCarScreen:(BOOL)a3;
- (void)setCarPlayCapable:(BOOL)a3;
- (void)setCarPlaySupported:(BOOL)a3;
- (void)setHandlesCarIntents:(BOOL)a3;
- (void)setLaunchNotificationsUsingSiri:(BOOL)a3;
- (void)setLaunchUsingMusicUIService:(BOOL)a3;
- (void)setLaunchUsingSiri:(BOOL)a3;
- (void)setLaunchUsingTemplateUI:(BOOL)a3;
- (void)setShowsNotifications:(BOOL)a3;
- (void)setSiriActivationOptions:(id)a3;
@end

@implementation CRCarPlayAppPolicy

- (CRCarPlayAppPolicy)init
{
  v5.receiver = self;
  v5.super_class = (Class)CRCarPlayAppPolicy;
  v2 = [(CRCarPlayAppPolicy *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(CRCarPlayAppPolicy *)v2 setCarPlayCapable:0];
    [(CRCarPlayAppPolicy *)v3 setCarPlaySupported:0];
    [(CRCarPlayAppPolicy *)v3 setCanDisplayOnCarScreen:0];
    [(CRCarPlayAppPolicy *)v3 setLaunchUsingSiri:0];
    [(CRCarPlayAppPolicy *)v3 setLaunchNotificationsUsingSiri:0];
    [(CRCarPlayAppPolicy *)v3 setSiriActivationOptions:0];
    [(CRCarPlayAppPolicy *)v3 setLaunchUsingMusicUIService:0];
    [(CRCarPlayAppPolicy *)v3 setBadgesAppIcon:0];
    [(CRCarPlayAppPolicy *)v3 setShowsNotifications:0];
    [(CRCarPlayAppPolicy *)v3 setHandlesCarIntents:0];
    [(CRCarPlayAppPolicy *)v3 setLaunchUsingTemplateUI:0];
    [(CRCarPlayAppPolicy *)v3 setApplicationCategory:0];
  }
  return v3;
}

- (unint64_t)bannerLaunchTypeForNotificationContentType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4F44730]]) {
    unint64_t v4 = 1;
  }
  else {
    unint64_t v4 = [v3 isEqualToString:*MEMORY[0x1E4F44738]];
  }

  return v4;
}

- (BOOL)isCarPlaySupported
{
  return self->_carPlaySupported;
}

- (void)setCarPlaySupported:(BOOL)a3
{
  self->_carPlaySupported = a3;
}

- (BOOL)canDisplayOnCarScreen
{
  return self->_canDisplayOnCarScreen;
}

- (void)setCanDisplayOnCarScreen:(BOOL)a3
{
  self->_canDisplayOnCarScreen = a3;
}

- (BOOL)launchUsingSiri
{
  return self->_launchUsingSiri;
}

- (void)setLaunchUsingSiri:(BOOL)a3
{
  self->_launchUsingSiri = a3;
}

- (BOOL)launchNotificationsUsingSiri
{
  return self->_launchNotificationsUsingSiri;
}

- (void)setLaunchNotificationsUsingSiri:(BOOL)a3
{
  self->_launchNotificationsUsingSiri = a3;
}

- (NSDictionary)siriActivationOptions
{
  return self->_siriActivationOptions;
}

- (void)setSiriActivationOptions:(id)a3
{
}

- (BOOL)launchUsingMusicUIService
{
  return self->_launchUsingMusicUIService;
}

- (void)setLaunchUsingMusicUIService:(BOOL)a3
{
  self->_launchUsingMusicUIService = a3;
}

- (BOOL)badgesAppIcon
{
  return self->_badgesAppIcon;
}

- (void)setBadgesAppIcon:(BOOL)a3
{
  self->_badgesAppIcon = a3;
}

- (BOOL)showsNotifications
{
  return self->_showsNotifications;
}

- (void)setShowsNotifications:(BOOL)a3
{
  self->_showsNotifications = a3;
}

- (BOOL)handlesCarIntents
{
  return self->_handlesCarIntents;
}

- (void)setHandlesCarIntents:(BOOL)a3
{
  self->_handlesCarIntents = a3;
}

- (BOOL)launchUsingTemplateUI
{
  return self->_launchUsingTemplateUI;
}

- (void)setLaunchUsingTemplateUI:(BOOL)a3
{
  self->_launchUsingTemplateUI = a3;
}

- (NSString)bundlePath
{
  return self->_bundlePath;
}

- (unint64_t)applicationCategory
{
  return self->_applicationCategory;
}

- (void)setApplicationCategory:(unint64_t)a3
{
  self->_applicationCategory = a3;
}

- (BOOL)isCarPlayCapable
{
  return self->_carPlayCapable;
}

- (void)setCarPlayCapable:(BOOL)a3
{
  self->_carPlayCapable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundlePath, 0);
  objc_storeStrong((id *)&self->_siriActivationOptions, 0);
}

@end