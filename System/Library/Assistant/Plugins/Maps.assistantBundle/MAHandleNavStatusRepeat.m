@interface MAHandleNavStatusRepeat
- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4;
@end

@implementation MAHandleNavStatusRepeat

- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4
{
  id v4 = a3;
  id v5 = objc_alloc((Class)SACommandFailed);
  id v6 = [v5 initWithErrorCode:SALocalSearchNavigationNotRunningErrorCode];
  v7 = +[MKMapService sharedService];
  [v7 captureUserAction:8007 onTarget:802 eventValue:0];

  v8 = +[MapsSiriIPCInterface sharedInterface];
  [v8 initializeBrokerConnectionIfNeeded];
  if ([v8 canReceiveMessages]
    && ![v8 isMapsBackgroundTaskSuspended])
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_B54C;
    v10[3] = &unk_30B30;
    id v11 = v4;
    [v8 repeatLastGuidanceInstructionWithCompletion:v10];
  }
  else
  {
    v9 = [v6 dictionary];
    (*((void (**)(id, void *))v4 + 2))(v4, v9);
  }
}

@end