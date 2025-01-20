@interface CLTemporaryPreciseAuthPromptPluginViewController
- (void)loadView;
@end

@implementation CLTemporaryPreciseAuthPromptPluginViewController

- (void)loadView
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "#CLTemporaryPreciseAuthPromptPluginViewController loadView<Start>", buf, 2u);
  }
  v6.receiver = self;
  v6.super_class = (Class)CLTemporaryPreciseAuthPromptPluginViewController;
  [(CLAuthWithPreciseSettingBaseViewController *)&v6 loadView];
  v3 = [(CLAuthBaseViewController *)self locationDictionary];
  v4 = [v3 objectForKey:@"UserLocationIsPrecise"];

  if (v4) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2;
  }
  [(CLAuthWithPreciseSettingBaseViewController *)self setPillButtonState:v5];
  [(CLAuthWithPreciseSettingBaseViewController *)self updateMapZoomAccordinglyForPreciseSetting];
}

@end