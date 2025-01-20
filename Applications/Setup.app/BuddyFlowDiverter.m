@interface BuddyFlowDiverter
- (BOOL)shouldSkipControllerClass:(Class)a3 reason:(id *)a4 humanReadableReason:(id *)a5;
- (BYEnvironment)environment;
- (BuddyDeviceManagementSupport)deviceManagementSupport;
- (BuddyFlowDiverter)initWithEnvironment:(id)a3;
- (BuddyFlowItemDispositionProvider)flowItemDispositionProvider;
- (void)didSkipControllerClass:(Class)a3 forReason:(id)a4;
- (void)prepareWithCompletion:(id)a3;
- (void)setDeviceManagementSupport:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setFlowItemDispositionProvider:(id)a3;
@end

@implementation BuddyFlowDiverter

- (BuddyFlowDiverter)initWithEnvironment:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v12;
  id v12 = 0;
  v10.receiver = v3;
  v10.super_class = (Class)BuddyFlowDiverter;
  id v12 = [(BuddyFlowDiverter *)&v10 init];
  objc_storeStrong(&v12, v12);
  if (v12)
  {
    objc_storeStrong((id *)v12 + 2, location[0]);
    id v4 = +[BuddyDeviceManagementSupport sharedSupport];
    v5 = (void *)*((void *)v12 + 1);
    *((void *)v12 + 1) = v4;

    id v6 = [location[0] flowItemDispositionProvider];
    v7 = (void *)*((void *)v12 + 3);
    *((void *)v12 + 3) = v6;
  }
  v8 = (BuddyFlowDiverter *)v12;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v12, 0);
  return v8;
}

- (void)prepareWithCompletion:(id)a3
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = (id)_BYLoggingFacility();
  os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = v14;
    os_log_type_t v4 = v13;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Fetching skip keys...", buf, 2u);
  }
  objc_storeStrong(&v14, 0);
  v5 = [(BuddyFlowDiverter *)v16 deviceManagementSupport];
  id v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  v9 = sub_100122524;
  objc_super v10 = &unk_1002B2070;
  id v11 = location[0];
  [(BuddyDeviceManagementSupport *)v5 loadSkipKeys:&v6];

  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)shouldSkipControllerClass:(Class)a3 reason:(id *)a4 humanReadableReason:(id *)a5
{
  v31 = self;
  SEL v30 = a2;
  Class aClass = a3;
  v28 = a4;
  v27 = a5;
  id v5 = +[BuddyCloudConfigManager sharedManager];
  unsigned __int8 v6 = [v5 cloudConfigWantsToSkipControllerClass:aClass];

  if (v6)
  {
    if (v27) {
      id *v27 = @"cloud configuration";
    }
    if (v28) {
      id *v28 = &off_1002C1730;
    }
    return 1;
  }
  int v7 = [(BuddyFlowDiverter *)v31 deviceManagementSupport];
  unsigned __int8 v8 = [(BuddyDeviceManagementSupport *)v7 deviceManagementWantsToSkipControllerClass:aClass];

  if (v8)
  {
    if (v27) {
      id *v27 = @"device management";
    }
    if (v28) {
      id *v28 = &off_1002C1748;
    }
    return 1;
  }
  if (([(objc_class *)aClass conformsToProtocol:&OBJC_PROTOCOL___BFFFlowItem] & 1) == 0) {
    return 0;
  }
  char v26 = +[UIApplication isRunningInStoreDemoMode] & 1;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([(objc_class *)aClass hiddenFromStoreDemoMode] & 1) != 0
    && (v26 & 1) != 0)
  {
    if (v27) {
      id *v27 = @"store demo mode";
    }
    if (v28) {
      id *v28 = &off_1002C1760;
    }
    return 1;
  }
  id v9 = +[BuddyCloudConfigManager sharedManager];
  unsigned __int8 v10 = [v9 isMultiUser];

  char v25 = v10 & 1;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([(objc_class *)aClass hiddenFromMultiUser] & 1) != 0
    && (v25 & 1) != 0)
  {
    if (v27) {
      id *v27 = @"multi user";
    }
    if (v28) {
      id *v28 = &off_1002C1778;
    }
    return 1;
  }
  unint64_t v24 = (unint64_t)[(objc_class *)aClass applicableDispositions];
  id v11 = [(BuddyFlowDiverter *)v31 flowItemDispositionProvider];
  unint64_t v12 = [(BuddyFlowItemDispositionProvider *)v11 dispositions];

  if (!v12) {
    return 0;
  }
  os_log_type_t v13 = [(BuddyFlowDiverter *)v31 flowItemDispositionProvider];
  BOOL v14 = ([(BuddyFlowItemDispositionProvider *)v13 dispositions] & 2) == 2;

  BOOL v23 = v14;
  v15 = [(BuddyFlowDiverter *)v31 flowItemDispositionProvider];
  BOOL v16 = (v24 & [(BuddyFlowItemDispositionProvider *)v15 dispositions]) != 0;

  BOOL v22 = v16;
  if (v16) {
    return 0;
  }
  if (v23)
  {
    v17 = NSStringFromClass(aClass);
    v21 = +[NSString stringWithFormat:@"Unexpected flow item (%@) with disposition prior disposition determination", v17];

    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_10004B238((uint64_t)buf, (uint64_t)v21);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    objc_exception_throw(+[NSException exceptionWithName:v21 reason:0 userInfo:0]);
  }
  if (v27)
  {
    id v18 = (id)BYStringForFlowItemDispositions();
    id *v27 = +[NSString stringWithFormat:@"inapplicable disposition (%@)", v18];
  }
  if (v28) {
    id *v28 = &off_1002C1760;
  }
  return 1;
}

- (void)didSkipControllerClass:(Class)a3 forReason:(id)a4
{
  unsigned __int8 v10 = self;
  SEL v9 = a2;
  Class v8 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  os_log_type_t v4 = (char *)[location unsignedIntegerValue];
  if (v4 && (unint64_t)(v4 - 1) <= 2)
  {
    if (objc_opt_respondsToSelector())
    {
      Class v5 = v8;
      unsigned __int8 v6 = [(BuddyFlowDiverter *)v10 environment];
      [(objc_class *)v5 skippedByCloudConfigWithEnvironment:v6];
    }
    else if (objc_opt_respondsToSelector())
    {
      [(objc_class *)v8 skippedByCloudConfig];
    }
  }
  objc_storeStrong(&location, 0);
}

- (BuddyDeviceManagementSupport)deviceManagementSupport
{
  return self->_deviceManagementSupport;
}

- (void)setDeviceManagementSupport:(id)a3
{
}

- (BYEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
}

- (BuddyFlowItemDispositionProvider)flowItemDispositionProvider
{
  return self->_flowItemDispositionProvider;
}

- (void)setFlowItemDispositionProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end