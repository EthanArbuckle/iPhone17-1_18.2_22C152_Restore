@interface AAUICommandQueueTransaction
+ (id)sharedDevice;
- (AAUICommandQueueTransaction)init;
- (id)commandQueue;
- (void)dealloc;
@end

@implementation AAUICommandQueueTransaction

- (AAUICommandQueueTransaction)init
{
  v5.receiver = self;
  v5.super_class = (Class)AAUICommandQueueTransaction;
  v2 = [(AAUICommandQueueTransaction *)&v5 init];
  if (v2)
  {
    v3 = +[AAUICommandQueueRegistry sharedRegistry];
    [v3 addCommandQueueTransaction:v2];
  }
  return v2;
}

+ (id)sharedDevice
{
  v2 = +[AAUICommandQueueRegistry sharedRegistry];
  v3 = [v2 sharedDevice];

  return v3;
}

- (id)commandQueue
{
  v2 = +[AAUICommandQueueRegistry sharedRegistry];
  v3 = [v2 commandQueue];

  return v3;
}

- (void)dealloc
{
  v3 = +[AAUICommandQueueRegistry sharedRegistry];
  [v3 removeCommandQueueTransaction:self];

  v4.receiver = self;
  v4.super_class = (Class)AAUICommandQueueTransaction;
  [(AAUICommandQueueTransaction *)&v4 dealloc];
}

@end