@interface BuddyFlowItemDispositionProvider
- (BYRunState)runState;
- (BuddyFlowItemDispositionProvider)initWithSetupMethod:(id)a3 runState:(id)a4;
- (BuddySetupMethod)setupMethod;
- (unint64_t)dispositions;
- (unint64_t)preferredDispositions;
- (void)setPreferredDispositions:(unint64_t)a3;
- (void)setRunState:(id)a3;
- (void)setSetupMethod:(id)a3;
@end

@implementation BuddyFlowItemDispositionProvider

- (BuddyFlowItemDispositionProvider)initWithSetupMethod:(id)a3 runState:(id)a4
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id obj = 0;
  objc_storeStrong(&obj, a4);
  id v5 = v11;
  id v11 = 0;
  v8.receiver = v5;
  v8.super_class = (Class)BuddyFlowItemDispositionProvider;
  id v11 = [(BuddyFlowItemDispositionProvider *)&v8 init];
  objc_storeStrong(&v11, v11);
  if (v11)
  {
    objc_storeStrong((id *)v11 + 2, location[0]);
    objc_storeStrong((id *)v11 + 3, obj);
  }
  v6 = (BuddyFlowItemDispositionProvider *)v11;
  objc_storeStrong(&obj, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v11, 0);
  return v6;
}

- (void)setPreferredDispositions:(unint64_t)a3
{
  objc_super v8 = self;
  SEL v7 = a2;
  unint64_t v6 = a3;
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v4 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = (id)BYStringForFlowItemDispositions();
    sub_10004B238((uint64_t)buf, (uint64_t)v3);
    _os_log_impl((void *)&_mh_execute_header, oslog, v4, "Preferred dispositions changing to %@", buf, 0xCu);

    objc_storeStrong(&v3, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  v8->_preferredDispositions = v6;
}

- (unint64_t)dispositions
{
  v2 = [(BuddyFlowItemDispositionProvider *)self runState];
  unsigned __int8 v3 = [(BYRunState *)v2 hasCompletedInitialRun];

  if (v3) {
    return 0;
  }
  os_log_type_t v4 = [(BuddyFlowItemDispositionProvider *)self setupMethod];
  id v5 = [(BuddySetupMethod *)v4 intent];

  if (!v5) {
    return 2;
  }
  if (v5 == (id)1) {
    return 4;
  }
  if (v5 == (id)2)
  {
    if (([(BuddyFlowItemDispositionProvider *)self preferredDispositions] & 8) == 8)
    {
      return 8;
    }
    else
    {
      if (([(BuddyFlowItemDispositionProvider *)self preferredDispositions] & 0x10) != 0x10)
      {
        [(BuddyFlowItemDispositionProvider *)self preferredDispositions];
        id v6 = (id)BYStringForFlowItemDispositions();
        objc_super v8 = +[NSString stringWithFormat:@"Invalid dispositions (%@) for setup intent", v6];

        objc_exception_throw(+[NSException exceptionWithName:v8 reason:0 userInfo:0]);
      }
      return 16;
    }
  }
  return v10;
}

- (unint64_t)preferredDispositions
{
  return self->_preferredDispositions;
}

- (BuddySetupMethod)setupMethod
{
  return self->_setupMethod;
}

- (void)setSetupMethod:(id)a3
{
}

- (BYRunState)runState
{
  return self->_runState;
}

- (void)setRunState:(id)a3
{
}

- (void).cxx_destruct
{
}

@end