@interface MAHandleAnswerRerouteSuggestion
- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4;
@end

@implementation MAHandleAnswerRerouteSuggestion

- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4
{
  id v5 = a3;
  id v6 = objc_alloc((Class)SACommandFailed);
  id v7 = [v6 initWithErrorCode:SALocalSearchNavigationNotRunningErrorCode];
  v8 = +[MKMapService sharedService];
  [v8 captureUserAction:8004 onTarget:802 eventValue:0];

  v9 = +[MapsSiriIPCInterface sharedInterface];
  [v9 initializeBrokerConnectionIfNeeded];
  if ([v9 canReceiveMessages]
    && ![v9 isMapsBackgroundTaskSuspended])
  {
    v11 = [(MAHandleAnswerRerouteSuggestion *)self response];
    id v12 = [v11 isEqualToString:SALocalSearchAnswerRerouteSuggestionResponseAcceptValue];

    v10 = objc_alloc_init(IPCHandleTrafficAlertMessage);
    [(IPCHandleTrafficAlertMessage *)v10 setShouldReroute:v12];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_17630;
    v13[3] = &unk_30B30;
    id v14 = v5;
    [v9 handleTrafficeReroute:v10 completion:v13];
  }
  else
  {
    v10 = [v7 dictionary];
    (*((void (**)(id, IPCHandleTrafficAlertMessage *))v5 + 2))(v5, v10);
  }
}

@end