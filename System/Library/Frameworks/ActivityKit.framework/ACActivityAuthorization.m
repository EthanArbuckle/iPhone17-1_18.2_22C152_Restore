@interface ACActivityAuthorization
- (ACActivityAuthorization)init;
- (BOOL)areActivitiesEnabledForBundleId:(id)a3;
- (BOOL)areFrequentPushesEnabledForBundleId:(id)a3;
- (_TtC11ActivityKit21ActivityAuthorization)activityAuthorization;
- (void)setActivitiesEnabled:(BOOL)a3 forBundleId:(id)a4;
- (void)setActivitiesEnabled:(BOOL)a3 forBundleId:(id)a4 source:(int64_t)a5;
- (void)setActivityAuthorization:(id)a3;
- (void)setFrequentPushesEnabled:(BOOL)a3 forBundleId:(id)a4;
@end

@implementation ACActivityAuthorization

- (ACActivityAuthorization)init
{
  v6.receiver = self;
  v6.super_class = (Class)ACActivityAuthorization;
  v2 = [(ACActivityAuthorization *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(_TtC11ActivityKit21ActivityAuthorization);
    activityAuthorization = v2->_activityAuthorization;
    v2->_activityAuthorization = v3;
  }
  return v2;
}

- (void)setActivitiesEnabled:(BOOL)a3 forBundleId:(id)a4
{
}

- (void)setActivitiesEnabled:(BOOL)a3 forBundleId:(id)a4 source:(int64_t)a5
{
}

- (BOOL)areActivitiesEnabledForBundleId:(id)a3
{
  return [(ActivityAuthorization *)self->_activityAuthorization areActivitiesEnabledForBundleId:a3];
}

- (BOOL)areFrequentPushesEnabledForBundleId:(id)a3
{
  return [(ActivityAuthorization *)self->_activityAuthorization areFrequentPushesEnabledFor:a3];
}

- (void)setFrequentPushesEnabled:(BOOL)a3 forBundleId:(id)a4
{
}

- (_TtC11ActivityKit21ActivityAuthorization)activityAuthorization
{
  return self->_activityAuthorization;
}

- (void)setActivityAuthorization:(id)a3
{
}

- (void).cxx_destruct
{
}

@end