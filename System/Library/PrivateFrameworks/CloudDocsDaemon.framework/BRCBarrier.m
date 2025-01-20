@interface BRCBarrier
- (BOOL)waitForBarrier;
- (BOOL)waitForBarrierWithTimeout:(unint64_t)a3;
- (BRCBarrier)init;
- (void)dealloc;
- (void)signalAndRetakeBarrier;
- (void)signalBarrier;
@end

@implementation BRCBarrier

- (BRCBarrier)init
{
  v6.receiver = self;
  v6.super_class = (Class)BRCBarrier;
  id v2 = [(BRCBarrier *)&v6 init];
  if (v2)
  {
    dispatch_group_t v3 = dispatch_group_create();
    v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    dispatch_group_enter(*((dispatch_group_t *)v2 + 1));
  }
  return (BRCBarrier *)v2;
}

- (void)dealloc
{
  [(BRCBarrier *)self signalBarrier];
  v3.receiver = self;
  v3.super_class = (Class)BRCBarrier;
  [(BRCBarrier *)&v3 dealloc];
}

- (void)signalBarrier
{
  id v2 = self;
  objc_sync_enter(v2);
  group = v2->_barrierGroup;
  barrierGroup = v2->_barrierGroup;
  v2->_barrierGroup = 0;

  objc_sync_exit(v2);
  v4 = group;
  if (group)
  {
    dispatch_group_leave(group);
    v4 = group;
  }
}

- (void)signalAndRetakeBarrier
{
  id v2 = self;
  objc_sync_enter(v2);
  group = v2->_barrierGroup;
  objc_sync_exit(v2);

  if (group)
  {
    dispatch_group_leave(group);
    dispatch_group_enter(group);
  }
}

- (BOOL)waitForBarrier
{
  return [(BRCBarrier *)self waitForBarrierWithTimeout:-1];
}

- (BOOL)waitForBarrierWithTimeout:(unint64_t)a3
{
  v4 = self;
  objc_sync_enter(v4);
  v5 = v4->_barrierGroup;
  objc_sync_exit(v4);

  if (v5) {
    BOOL v6 = dispatch_group_wait(v5, a3) == 0;
  }
  else {
    BOOL v6 = 1;
  }

  return v6;
}

- (void).cxx_destruct
{
}

@end