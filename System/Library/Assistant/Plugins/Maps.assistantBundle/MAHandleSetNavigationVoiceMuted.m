@interface MAHandleSetNavigationVoiceMuted
- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4;
@end

@implementation MAHandleSetNavigationVoiceMuted

- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4
{
  id v5 = a3;
  id v6 = objc_alloc((Class)SACommandFailed);
  id v7 = [v6 initWithErrorCode:SALocalSearchNavigationNotRunningErrorCode];
  if ([(MAHandleSetNavigationVoiceMuted *)self voiceMuted]) {
    uint64_t v8 = 3052;
  }
  else {
    uint64_t v8 = 8008;
  }
  v9 = +[MKMapService sharedService];
  [v9 captureUserAction:v8 onTarget:802 eventValue:0];

  v10 = +[MapsSiriIPCInterface sharedInterface];
  [v10 initializeBrokerConnectionIfNeeded];
  if ([v10 canReceiveMessages]
    && ![v10 isMapsBackgroundTaskSuspended])
  {
    v12 = objc_alloc_init(IPCMuteSpokenGuidanceMessage);
    [(IPCMuteSpokenGuidanceMessage *)v12 setMuteNavigation:[(MAHandleSetNavigationVoiceMuted *)self voiceMuted]];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_C6D4;
    v13[3] = &unk_30C68;
    id v14 = v5;
    [v10 setNavigationMuted:v12 completion:v13];
  }
  else
  {
    v11 = [v7 dictionary];
    (*((void (**)(id, void *))v5 + 2))(v5, v11);
  }
}

@end