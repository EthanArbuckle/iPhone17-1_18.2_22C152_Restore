@interface SODaemonUtils
+ (BOOL)isAppManagedWithBundleIdentifier:(id)a3;
+ (BOOL)isInternalBuild;
+ (id)localizedAppNameWithBundleIdentifier:(id)a3 pid:(int)a4;
@end

@implementation SODaemonUtils

+ (BOOL)isAppManagedWithBundleIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2050000000;
  v4 = (void *)qword_100016120;
  uint64_t v14 = qword_100016120;
  if (!qword_100016120)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_1000040E4;
    v16 = &unk_100010378;
    v17 = &v11;
    sub_1000040E4((uint64_t)buf);
    v4 = (void *)v12[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v11, 8);
  v6 = objc_msgSend(v5, "sharedConnection", v11);
  unsigned int v7 = [v6 isAppManaged:v3];

  v8 = sub_100003D98();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v9 = @"NO";
    if (v7) {
      CFStringRef v9 = @"YES";
    }
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v3;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ is managed: %{public}@", buf, 0x16u);
  }

  return v7;
}

+ (id)localizedAppNameWithBundleIdentifier:(id)a3 pid:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  v6 = +[LSApplicationProxy applicationProxyForIdentifier:v5 placeholder:0];
  unsigned int v7 = [v6 localizedName];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    v10 = [v6 localizedShortName];
    uint64_t v11 = v10;
    if (v10)
    {
      id v9 = v10;
    }
    else
    {
      uint64_t v12 = [v6 bundleIdentifier];
      uint64_t v13 = (void *)v12;
      if (v12) {
        uint64_t v14 = (void *)v12;
      }
      else {
        uint64_t v14 = v5;
      }
      id v9 = v14;
    }
  }

  if (![v9 length])
  {
    v15 = sub_100003D98();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_100009F60(v4, (uint64_t)v5, v15);
    }

    uint64_t v16 = [sub_100003FD8() processNameForPID:v4];

    id v9 = (id)v16;
  }
  v17 = sub_100003D98();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = +[NSNumber numberWithInt:v4];
    int v20 = 138543874;
    v21 = v18;
    __int16 v22 = 2114;
    id v23 = v5;
    __int16 v24 = 2114;
    id v25 = v9;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ localized app name: %{public}@", (uint8_t *)&v20, 0x20u);
  }
  return v9;
}

+ (BOOL)isInternalBuild
{
  id v2 = sub_100003FD8();
  return [v2 isInternalBuild];
}

@end