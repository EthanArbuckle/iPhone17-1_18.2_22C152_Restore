@interface MAHandleEndNavigation
- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4;
@end

@implementation MAHandleEndNavigation

- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4
{
  v4 = (void (**)(id, void *))a3;
  id v5 = objc_alloc((Class)SACommandFailed);
  id v6 = [v5 initWithErrorCode:SALocalSearchNavigationNotRunningErrorCode];
  v7 = +[MKMapService sharedService];
  [v7 captureUserAction:3002 onTarget:802 placeActionDetails:0 mapItem:0 resultIndex:0xFFFFFFFFLL];

  BackgroundStateLog(OS_LOG_TYPE_INFO, @"MAPS SIRI: Received end navigation command", v8, v9, v10, v11, v12, v13, v17);
  v14 = +[MapsSiriIPCInterface sharedInterface];
  [v14 initializeBrokerConnectionIfNeeded];
  if (![v14 canReceiveMessages]
    || [v14 isMapsBackgroundTaskSuspended])
  {
    v15 = [v6 dictionary];
    v4[2](v4, v15);
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_113D8;
  v18[3] = &unk_30B30;
  v19 = v4;
  v16 = v4;
  [v14 endNavigationWithCompletion:v18];
}

@end