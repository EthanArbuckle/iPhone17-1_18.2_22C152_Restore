@interface FRNewsAppRemovalService
+ (void)initialize;
- (FRNewsAppRemovalService)init;
- (void)removeAppWithReply:(id)a3;
@end

@implementation FRNewsAppRemovalService

+ (void)initialize
{
  qword_10000CF98 = (uint64_t)os_log_create("com.apple.news.appRemoval", "general");
  _objc_release_x1();
}

- (FRNewsAppRemovalService)init
{
  v3.receiver = self;
  v3.super_class = (Class)FRNewsAppRemovalService;
  return [(FRNewsAppRemovalService *)&v3 init];
}

- (void)removeAppWithReply:(id)a3
{
  objc_super v3 = (void (**)(id, void))a3;
  id v4 = [objc_alloc((Class)NSSNewsTerminationItem) initWithProcessType:1 bundleID:@"UNUSED"];
  id v5 = [objc_alloc((Class)NSSNewsTerminationItem) initWithProcessType:0 bundleID:@"com.apple.stocks"];
  v7[0] = v4;
  v7[1] = v5;
  v6 = +[NSArray arrayWithObjects:v7 count:2];
  NSSTerminateNewsProcessesWithItems();

  v3[2](v3, 0);
}

@end