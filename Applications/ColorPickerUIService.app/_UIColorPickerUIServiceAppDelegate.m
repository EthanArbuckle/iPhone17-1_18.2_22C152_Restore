@interface _UIColorPickerUIServiceAppDelegate
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
@end

@implementation _UIColorPickerUIServiceAppDelegate

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v7 = a4;
  v8 = [v7 role];
  uint64_t v9 = _UISceneSessionRoleSceneHosting;
  unsigned int v10 = [v8 isEqualToString:_UISceneSessionRoleSceneHosting];

  if (v10)
  {
    id v11 = [objc_alloc((Class)UISceneConfiguration) initWithName:0 sessionRole:v9];
    [v11 setDelegateClass:objc_opt_class()];
  }
  else
  {
    v12 = +[NSAssertionHandler currentHandler];
    v13 = [v7 role];
    [v12 handleFailureInMethod:a2, self, @"_UIColorPickerUIServiceAppDelegate.m", 23, @"%@ is not a supported scene type. This app was probably launched manually (ie: from the home screen) which is not a supported operation.", v13 object file lineNumber description];

    id v11 = 0;
  }

  return v11;
}

@end