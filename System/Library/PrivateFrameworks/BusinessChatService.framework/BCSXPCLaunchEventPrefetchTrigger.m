@interface BCSXPCLaunchEventPrefetchTrigger
- (BCSXPCLaunchEventPrefetchTrigger)initWithActivityName:(id)a3;
- (NSString)activityName;
- (NSString)description;
- (void)scheduleFetchBlock:(id)a3;
- (void)setActivityName:(id)a3;
- (void)triggerFetchForReason:(unint64_t)a3 completion:(id)a4;
@end

@implementation BCSXPCLaunchEventPrefetchTrigger

- (BCSXPCLaunchEventPrefetchTrigger)initWithActivityName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BCSXPCLaunchEventPrefetchTrigger;
  v5 = [(BCSXPCLaunchEventPrefetchTrigger *)&v9 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    activityName = v5->_activityName;
    v5->_activityName = v6;
  }
  return v5;
}

- (void)scheduleFetchBlock:(id)a3
{
  id v4 = a3;
  v5 = +[BGSystemTaskScheduler sharedScheduler];
  v6 = [(BCSXPCLaunchEventPrefetchTrigger *)self activityName];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100014B70;
  v8[3] = &unk_10001D1A8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v5 registerForTaskWithIdentifier:v6 usingQueue:0 launchHandler:v8];
}

- (void)triggerFetchForReason:(unint64_t)a3 completion:(id)a4
{
}

- (NSString)description
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = [(BCSXPCLaunchEventPrefetchTrigger *)self activityName];
  [v3 appendString:v4 withName:@"activityName"];

  v5 = [v3 build];

  return (NSString *)v5;
}

- (NSString)activityName
{
  return self->_activityName;
}

- (void)setActivityName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end