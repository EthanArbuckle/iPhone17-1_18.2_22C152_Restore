@interface ADSyncCoordinatorATV
+ (id)_defaultATVUser;
- (ADSyncCoordinatorATV)init;
- (id)_profileUserId;
@end

@implementation ADSyncCoordinatorATV

- (id)_profileUserId
{
  return +[ADSyncCoordinatorATV _defaultATVUser];
}

- (ADSyncCoordinatorATV)init
{
  v3 = +[ADAnalyticsIdentifiersUtils logger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Initializing ADSyncCoordinatorATV", buf, 2u);
  }

  v4 = +[ADSyncCoordinatorATV _defaultATVUser];
  v7.receiver = self;
  v7.super_class = (Class)ADSyncCoordinatorATV;
  v5 = [(ADSyncCoordinatorCommunalDevices *)&v7 initWithProfileUserId:v4];

  return v5;
}

+ (id)_defaultATVUser
{
  return 0;
}

@end