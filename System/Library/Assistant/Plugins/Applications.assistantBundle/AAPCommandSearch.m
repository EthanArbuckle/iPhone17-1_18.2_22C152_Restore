@interface AAPCommandSearch
- (void)performWithCompletion:(id)a3;
@end

@implementation AAPCommandSearch

- (void)performWithCompletion:(id)a3
{
  if (a3)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_6C00;
    v12[3] = &unk_207A0;
    v12[4] = a3;
    id v5 = objc_alloc_init((Class)NSMutableArray);
    id v6 = [(AAPCommandSearch *)self applicationName];
    id v7 = [objc_alloc((Class)NSString) initWithFormat:@"displayName == \"%@\"cdw || alternateNames == \"%@\"cdw"], v6, v6);
    v8 = AFSiriLogContextPlugin;
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_DEBUG)) {
      sub_13C78((uint64_t)v7, v8);
    }
    id v9 = [objc_alloc((Class)CSSearchQuery) initWithQueryString:v7 attributes:&off_22008];
    NSFileProtectionType v14 = NSFileProtectionCompleteUntilFirstUserAuthentication;
    objc_msgSend(v9, "setProtectionClasses:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
    CFStringRef v13 = kUTTypeApplication;
    objc_msgSend(v9, "setBundleIDs:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_6C78;
    v11[3] = &unk_207C8;
    v11[4] = v5;
    [v9 setFoundItemsHandler:v11];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_6E04;
    v10[3] = &unk_207F0;
    v10[4] = v9;
    v10[5] = v5;
    v10[6] = a3;
    v10[7] = v12;
    [v9 setCompletionHandler:v10];
    [v9 start];
  }
}

@end