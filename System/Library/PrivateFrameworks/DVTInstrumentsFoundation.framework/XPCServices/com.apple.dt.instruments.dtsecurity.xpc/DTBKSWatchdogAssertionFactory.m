@interface DTBKSWatchdogAssertionFactory
- (id)assertionForPid:(int)a3;
@end

@implementation DTBKSWatchdogAssertionFactory

- (id)assertionForPid:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = sub_10000C418();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    int v22 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "acquiring assertion for pid %d", buf, 8u);
  }

  v5 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.DTServiceHub" name:@"DeveloperToolsDebugging"];
  v20 = v5;
  v6 = +[NSArray arrayWithObjects:&v20 count:1];

  id v7 = objc_alloc((Class)RBSAssertion);
  v8 = +[RBSTarget targetWithPid:v3];
  id v9 = [v7 initWithExplanation:@"Target is being analyzed by developer tools" target:v8 attributes:v6];

  id v19 = 0;
  unsigned __int8 v10 = [v9 acquireWithError:&v19];
  id v11 = v19;
  if (v10)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000C46C;
    v16[3] = &unk_100015118;
    int v18 = v3;
    v17 = v9;
    v12 = objc_retainBlock(v16);
    v13 = objc_retainBlock(v12);

    v14 = v17;
  }
  else
  {
    v14 = sub_10000C418();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10000E118((uint64_t)v11, v3, v14);
    }
    v13 = 0;
  }

  return v13;
}

@end