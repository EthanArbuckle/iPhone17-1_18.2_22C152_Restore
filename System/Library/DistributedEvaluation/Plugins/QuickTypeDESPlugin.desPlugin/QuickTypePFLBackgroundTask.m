@interface QuickTypePFLBackgroundTask
+ (BOOL)supportsSecureCoding;
+ (Class)taskRunnerClass;
- (NSURL)url;
- (QuickTypePFLBackgroundTask)initWithCoder:(id)a3;
- (QuickTypePFLBackgroundTask)initWithURL:(id)a3;
- (id)activityForScheduling;
- (void)encodeWithCoder:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation QuickTypePFLBackgroundTask

- (QuickTypePFLBackgroundTask)initWithURL:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)QuickTypePFLBackgroundTask;
  v5 = [(QuickTypePFLBackgroundTask *)&v8 init];
  v6 = v5;
  if (v5) {
    [(QuickTypePFLBackgroundTask *)v5 setUrl:v4];
  }

  return v6;
}

+ (Class)taskRunnerClass
{
  return (Class)objc_opt_class();
}

- (id)activityForScheduling
{
  id v13 = 0;
  v3 = +[NSKeyedArchiver archivedDataWithRootObject:self requiringSecureCoding:1 error:&v13];
  id v4 = v13;
  if (v3)
  {
    uint64_t v5 = _DASSchedulingPriorityBackground;
    uint64_t v6 = _DASExtensionLaunchReasonMLCompute;
    uint64_t v7 = _DASActivityDurationModerate;
    objc_super v8 = +[NSDate date];
    v9 = +[NSDate distantFuture];
    v10 = +[_DASActivity extensionLaunchActivityWithName:@"com.apple.NLPLearner.QuickTypePFLExtension" priority:v5 forExtensionIdentifier:@"com.apple.NLPLearner.QuickTypePFLExtension" withReason:v6 duration:v7 startingAfter:v8 startingBefore:v9];

    CFStringRef v14 = @"QuickTypePFLBackgroundTask";
    v15 = v3;
    v11 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    [v10 setUserInfo:v11];

    [v10 setRequiresDeviceInactivity:1];
    [v10 setCpuIntensive:1];
    [v10 setRequiresPlugin:1];
    [v10 setMemoryIntensive:1];
    [v10 setRequiresNetwork:1];
    [v10 setRequiresInexpensiveNetworking:1];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10600(self, (uint64_t)v4);
    }
    v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)QuickTypePFLBackgroundTask;
  id v4 = a3;
  [(QuickTypePFLBackgroundTask *)&v6 encodeWithCoder:v4];
  uint64_t v5 = [(QuickTypePFLBackgroundTask *)self url];
  [v4 encodeObject:v5 forKey:@"url"];
}

- (QuickTypePFLBackgroundTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)QuickTypePFLBackgroundTask;
  uint64_t v5 = [(QuickTypePFLBackgroundTask *)&v8 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    [(QuickTypePFLBackgroundTask *)v5 setUrl:v6];
  }
  return v5;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (void).cxx_destruct
{
}

@end