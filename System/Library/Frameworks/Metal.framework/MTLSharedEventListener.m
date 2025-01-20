@interface MTLSharedEventListener
+ (MTLSharedEventListener)allocWithZone:(_NSZone *)a3;
- (MTLSharedEventListener)init;
- (MTLSharedEventListener)initWithDispatchQueue:(dispatch_queue_t)dispatchQueue;
@end

@implementation MTLSharedEventListener

+ (MTLSharedEventListener)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (MTLSharedEventListener *)+[MTLSharedEventListener allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLSharedEventListener;
    return (MTLSharedEventListener *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (MTLSharedEventListener)init
{
  v3.receiver = self;
  v3.super_class = (Class)MTLSharedEventListener;
  return [(MTLSharedEventListener *)&v3 init];
}

- (MTLSharedEventListener)initWithDispatchQueue:(dispatch_queue_t)dispatchQueue
{
  return 0;
}

@end