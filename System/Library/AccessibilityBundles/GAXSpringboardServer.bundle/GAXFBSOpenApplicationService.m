@interface GAXFBSOpenApplicationService
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)canOpenApplication:(id)a3 reason:(int64_t *)a4;
- (void)_openApplication:(id)a3 withOptions:(id)a4 clientHandle:(id)a5 completion:(id)a6;
@end

@implementation GAXFBSOpenApplicationService

+ (id)safeCategoryTargetClassName
{
  return @"FBSOpenApplicationService";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FBSOpenApplicationService", @"canOpenApplication: reason:", "B", "@", "^q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FBSOpenApplicationService", @"_openApplication: withOptions: clientHandle: completion:", "v", "@", "@", "@", "@?", 0);
}

- (BOOL)canOpenApplication:(id)a3 reason:(int64_t *)a4
{
  id v6 = a3;
  v7 = +[GAXSpringboard sharedInstance];
  if (![v7 isActive]) {
    goto LABEL_6;
  }
  v8 = GAXAllowedRemoteUIProcesses();
  if ([v8 containsObject:v6]) {
    goto LABEL_5;
  }
  v9 = [v7 frontmostAppIdentifier];
  if ([v9 isEqualToString:v6])
  {

LABEL_5:
LABEL_6:
    v14.receiver = self;
    v14.super_class = (Class)GAXFBSOpenApplicationService;
    BOOL v10 = [(GAXFBSOpenApplicationService *)&v14 canOpenApplication:v6 reason:a4];
    goto LABEL_7;
  }
  unsigned __int8 v12 = [v7 isBundleIDAllowedApp:v6];

  if (v12) {
    goto LABEL_6;
  }
  v13 = GAXLogCommon();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v6;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Guided Access returning NO for canActivate of app: %{public}@", buf, 0xCu);
  }

  BOOL v10 = 0;
  if (a4) {
    *a4 = 1;
  }
LABEL_7:

  return v10;
}

- (void)_openApplication:(id)a3 withOptions:(id)a4 clientHandle:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_super v14 = +[GAXSpringboard sharedInstance];
  if (![v14 isActive]) {
    goto LABEL_6;
  }
  v15 = GAXAllowedRemoteUIProcesses();
  if ([v15 containsObject:v10]) {
    goto LABEL_5;
  }
  id v16 = [v14 frontmostAppIdentifier];
  if ([v16 isEqualToString:v10])
  {

LABEL_5:
LABEL_6:
    v23.receiver = self;
    v23.super_class = (Class)GAXFBSOpenApplicationService;
    [(GAXFBSOpenApplicationService *)&v23 _openApplication:v10 withOptions:v11 clientHandle:v12 completion:v13];
    goto LABEL_7;
  }
  unsigned __int8 v17 = [v14 isBundleIDAllowedApp:v10];

  if (v17) {
    goto LABEL_6;
  }
  v18 = GAXLogCommon();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v34 = v10;
    _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Guided Access blocking activation of app: %{public}@", buf, 0xCu);
  }

  if (v13)
  {
    uint64_t v19 = FBSOpenApplicationErrorDomain;
    NSErrorUserInfoKey v31 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v32 = @"Guided Access is active";
    v20 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    v21 = +[NSError errorWithDomain:v19 code:1 userInfo:v20];

    v24 = _NSConcreteStackBlock;
    uint64_t v25 = 3221225472;
    v26 = sub_134B8;
    v27 = &unk_29550;
    id v30 = v13;
    id v28 = v12;
    id v29 = v21;
    id v22 = v21;
    AXPerformSafeBlock();
  }
LABEL_7:
}

@end