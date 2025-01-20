@interface SBSUIInCallWindowScene
- (unint64_t)ics_sceneType;
- (void)ics_requestTransitionToPresentationMode:(int64_t)a3;
- (void)ics_requestTransitionToPresentationMode:(int64_t)a3 shouldDismissCMASAlerts:(BOOL)a4 analyticsSource:(id)a5 completion:(id)a6;
- (void)requestTransitionToPresentationMode:(int64_t)a3 shouldDismissCMASAlerts:(BOOL)a4;
- (void)requestTransitionToPresentationMode:(int64_t)a3 shouldDismissCMASAlerts:(BOOL)a4 analyticsSource:(id)a5;
@end

@implementation SBSUIInCallWindowScene

- (void)ics_requestTransitionToPresentationMode:(int64_t)a3
{
}

- (void)requestTransitionToPresentationMode:(int64_t)a3 shouldDismissCMASAlerts:(BOOL)a4
{
}

- (void)requestTransitionToPresentationMode:(int64_t)a3 shouldDismissCMASAlerts:(BOOL)a4 analyticsSource:(id)a5
{
}

- (void)ics_requestTransitionToPresentationMode:(int64_t)a3 shouldDismissCMASAlerts:(BOOL)a4 analyticsSource:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = sub_1000D5130();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = SBSInCallPresentationModeDescription();
    int v19 = 138412802;
    v20 = v13;
    __int16 v21 = 1024;
    BOOL v22 = v7;
    __int16 v23 = 2112;
    id v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Requesting scene transition, presentationMode=%@ isUserInitiated=%d analyticsSource=%@", (uint8_t *)&v19, 0x1Cu);
  }
  v14 = +[NSNotificationCenter defaultCenter];
  v15 = +[NSNumber numberWithUnsignedInteger:[(SBSUIInCallWindowScene *)self ics_sceneType]];
  [v14 postNotificationName:@"ICSSceneManagerDidRequesFullScreenTransitionNotification" object:v15];

  [(SBSUIInCallWindowScene *)self requestTransitionToPresentationMode:a3 isUserInitiated:v7 analyticsSource:v10];
  if (v11)
  {
    v16 = +[UIApplication sharedApplication];
    v17 = [v16 delegate];
    v18 = [v17 sceneManager];
    [v18 waitForPresentationMode:a3 forSceneOfType:[self ics_sceneType] completion:v11];
  }
}

- (unint64_t)ics_sceneType
{
  if ([(SBSUIInCallWindowScene *)self isScreenSharingPresentation]) {
    return 1;
  }
  v4 = +[UIApplication sharedApplication];
  v5 = [v4 delegate];
  v6 = [v5 sceneManager];
  BOOL v7 = [(SBSUIInCallWindowScene *)self requestedPresentationConfigurationIdentifier];
  id v8 = [v6 sceneTypeForConfigurationIdentifier:v7];

  return (unint64_t)v8;
}

@end