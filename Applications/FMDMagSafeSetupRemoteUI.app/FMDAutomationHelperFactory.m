@interface FMDAutomationHelperFactory
+ (id)sharedFactory;
- (BOOL)hasAttemptedLoad;
- (Class)automationHelperClassWithName:(id)a3;
- (NSBundle)automationHelperBundle;
- (void)setAutomationHelperBundle:(id)a3;
- (void)setHasAttemptedLoad:(BOOL)a3;
@end

@implementation FMDAutomationHelperFactory

+ (id)sharedFactory
{
  if (qword_100042CD0 != -1) {
    dispatch_once(&qword_100042CD0, &stru_100034688);
  }
  v2 = (void *)qword_100042CC8;

  return v2;
}

- (Class)automationHelperClassWithName:(id)a3
{
  id v4 = a3;
  v5 = sub_100010114();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Loading automation class %@", (uint8_t *)&v15, 0xCu);
  }

  if (![(FMDAutomationHelperFactory *)self hasAttemptedLoad])
  {
    v6 = +[NSBundle bundleWithPath:@"/AppleInternal/Library/Bundles/FindMyDevice"];
    v7 = [v6 pathForResource:@"FMDAutomationClasses" ofType:@"bundle"];
    v8 = +[NSBundle bundleWithPath:v7];
    [(FMDAutomationHelperFactory *)self setAutomationHelperBundle:v8];

    [(FMDAutomationHelperFactory *)self setHasAttemptedLoad:1];
  }
  if ([(FMDAutomationHelperFactory *)self hasAttemptedLoad]
    && ([(FMDAutomationHelperFactory *)self automationHelperBundle],
        v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        !v9))
  {
    id v13 = 0;
  }
  else
  {
    v10 = [(FMDAutomationHelperFactory *)self automationHelperBundle];
    id v11 = [v10 classNamed:v4];

    if (!v11)
    {
      v12 = sub_100010114();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10001E744((uint64_t)v4, v12);
      }
    }
    id v13 = v11;
  }

  return (Class)v13;
}

- (BOOL)hasAttemptedLoad
{
  return self->_hasAttemptedLoad;
}

- (void)setHasAttemptedLoad:(BOOL)a3
{
  self->_hasAttemptedLoad = a3;
}

- (NSBundle)automationHelperBundle
{
  return self->_automationHelperBundle;
}

- (void)setAutomationHelperBundle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end