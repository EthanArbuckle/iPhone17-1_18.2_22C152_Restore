@interface CSLAppClipsNotificationsController
- (id)specifiers;
- (void)viewDidLoad;
@end

@implementation CSLAppClipsNotificationsController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)CSLAppClipsNotificationsController;
  [(CSLAppClipsNotificationsController *)&v5 viewDidLoad];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"APP_CLIPS_TITLE" value:&stru_C650 table:@"Notifications-DimSum"];
  [(CSLAppClipsNotificationsController *)self setTitle:v4];
}

- (id)specifiers
{
  v3 = [(CSLAppClipsNotificationsController *)self specifier];
  v4 = [v3 propertyForKey:@"AppClipSpecifiers"];

  if (v4)
  {
    objc_storeStrong((id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers], v4);
    id v5 = v4;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_8428();
  }

  return v4;
}

@end