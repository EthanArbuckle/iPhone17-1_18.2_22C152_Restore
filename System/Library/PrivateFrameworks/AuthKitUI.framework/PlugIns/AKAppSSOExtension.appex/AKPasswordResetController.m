@interface AKPasswordResetController
- (void)presentPasswordResetForRequest:(id)a3 completion:(id)a4;
@end

@implementation AKPasswordResetController

- (void)presentPasswordResetForRequest:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init((Class)AKAppleIDAuthenticationContext);
  [v7 setNeedsCredentialRecovery:1];
  [v7 setIsNativeTakeover:1];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100002398;
  v11[3] = &unk_100010348;
  id v13 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
  id v14 = v6;
  id v12 = v5;
  id v8 = v13;
  id v9 = v5;
  id v10 = v6;
  [v8 performPasswordResetWithContext:v7 completion:v11];
}

@end