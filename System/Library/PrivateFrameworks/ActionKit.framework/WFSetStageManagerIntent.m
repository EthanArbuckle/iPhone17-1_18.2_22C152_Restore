@interface WFSetStageManagerIntent
- (Class)settingsClientClass;
- (void)applyWithSettingsClient:(id)a3 completionHandler:(id)a4;
@end

@implementation WFSetStageManagerIntent

- (void)applyWithSettingsClient:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v9 = a3;
  v7 = [(WFSetStageManagerIntent *)self showRecentApps];
  objc_msgSend(v9, "setShowRecentApps:", objc_msgSend(v7, "BOOLValue"));

  v8 = [(WFSetStageManagerIntent *)self showDock];
  objc_msgSend(v9, "setShowDock:", objc_msgSend(v8, "BOOLValue"));

  WFPerformBooleanSettingIntent(self, v9, v6);
}

- (Class)settingsClientClass
{
  return (Class)objc_opt_class();
}

@end