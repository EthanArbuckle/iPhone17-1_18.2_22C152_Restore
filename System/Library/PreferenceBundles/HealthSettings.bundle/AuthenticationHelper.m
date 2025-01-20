@interface AuthenticationHelper
+ (void)_authenticateWithGuard:(id)a3 completion:(id)a4;
+ (void)authenticateWithCompletion:(id)a3;
@end

@implementation AuthenticationHelper

+ (void)_authenticateWithGuard:(id)a3 completion:(id)a4
{
  id v5 = a4;
  uint64_t v6 = kHKHealthAppBundleIdentifier;
  id v7 = a3;
  v8 = +[APApplication applicationWithBundleIdentifier:v6];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_8FDC;
  v10[3] = &unk_10678;
  id v11 = v5;
  id v9 = v5;
  [v7 authenticateForSubject:v8 completion:v10];
}

+ (void)authenticateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = +[APGuard sharedGuard];
  [a1 _authenticateWithGuard:v5 completion:v4];
}

@end