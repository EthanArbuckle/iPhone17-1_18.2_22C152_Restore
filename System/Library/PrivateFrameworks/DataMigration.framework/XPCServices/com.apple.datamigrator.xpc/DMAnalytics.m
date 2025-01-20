@interface DMAnalytics
+ (id)sharedInstance;
- (void)sendLazyEventWithName:(id)a3 payloadBuilder:(id)a4;
@end

@implementation DMAnalytics

+ (id)sharedInstance
{
  if (qword_100030BE0 != -1) {
    dispatch_once(&qword_100030BE0, &stru_100024A38);
  }
  v2 = (void *)qword_100030BD8;

  return v2;
}

- (void)sendLazyEventWithName:(id)a3 payloadBuilder:(id)a4
{
}

@end