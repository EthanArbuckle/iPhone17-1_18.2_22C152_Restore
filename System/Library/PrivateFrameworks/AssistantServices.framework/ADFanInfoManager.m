@interface ADFanInfoManager
+ (id)sharedManager;
- (ADFanInfoManager)init;
- (void)dealloc;
- (void)getCurrentFanInfo:(id)a3;
@end

@implementation ADFanInfoManager

- (void)getCurrentFanInfo:(id)a3
{
  if (a3) {
    (*((void (**)(id, void))a3 + 2))(a3, 0);
  }
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)ADFanInfoManager;
  [(ADFanInfoManager *)&v2 dealloc];
}

- (ADFanInfoManager)init
{
  return 0;
}

+ (id)sharedManager
{
  return 0;
}

@end