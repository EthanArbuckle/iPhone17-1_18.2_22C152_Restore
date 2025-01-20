@interface _SYQuiescenceObserver
+ (BOOL)isQuiescenceEnabled;
+ (id)sharedInstance;
- (BOOL)waitForDeallocationCompleteWithTimeout:(double)a3;
- (BOOL)waitForQuiescenceWithTimeout:(double)a3;
- (_SYQuiescenceObserver)init;
- (void)decrementAllocationCount:(id)a3;
- (void)incrementAllocationCount:(id)a3;
- (void)notifyOnDeallocationComplete:(id)a3;
- (void)notifyOnQuiescence:(id)a3;
- (void)registerQueue:(id)a3;
@end

@implementation _SYQuiescenceObserver

+ (BOOL)isQuiescenceEnabled
{
  return 0;
}

+ (id)sharedInstance
{
  return 0;
}

- (_SYQuiescenceObserver)init
{
  return 0;
}

- (void)registerQueue:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    v5 = self->_quiescenceQueues;
    objc_sync_enter(v5);
    [(NSPointerArray *)self->_quiescenceQueues addPointer:v6];
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (BOOL)waitForQuiescenceWithTimeout:(double)a3
{
  if (a3 >= 0.0) {
    dispatch_time_t v5 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  }
  else {
    dispatch_time_t v5 = -1;
  }
  id v6 = _EnqueueOnNewGroup(self->_quiescenceQueues);
  BOOL v7 = _dispatch_group_wait_off_main_thread(v6, v5, a3) == 0;

  return v7;
}

- (void)notifyOnQuiescence:(id)a3
{
  quiescenceQueues = self->_quiescenceQueues;
  id v4 = a3;
  group = _EnqueueOnNewGroup(quiescenceQueues);
  dispatch_time_t v5 = dispatch_get_global_queue(21, 0);
  dispatch_group_notify(group, v5, v4);
}

- (void)incrementAllocationCount:(id)a3
{
  id v7 = a3;
  dispatch_time_t v5 = objc_opt_new();
  [v5 setObject:v7];
  [v5 setReturnAddress:v3];
  id v6 = self->_allocations;
  objc_sync_enter(v6);
  [(NSMutableSet *)self->_allocations addObject:v5];
  objc_sync_exit(v6);

  dispatch_group_enter((dispatch_group_t)self->_allocationGroup);
}

- (void)decrementAllocationCount:(id)a3
{
  id v5 = a3;
  id v4 = self->_allocations;
  objc_sync_enter(v4);
  _CleanupAllocations(self->_allocations);
  objc_sync_exit(v4);

  dispatch_group_leave((dispatch_group_t)self->_allocationGroup);
}

- (BOOL)waitForDeallocationCompleteWithTimeout:(double)a3
{
  if (a3 >= 0.0) {
    dispatch_time_t v5 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  }
  else {
    dispatch_time_t v5 = -1;
  }
  intptr_t v6 = _dispatch_group_wait_off_main_thread(self->_allocationGroup, v5, a3);
  id v7 = self->_allocations;
  objc_sync_enter(v7);
  _CleanupAllocations(self->_allocations);
  objc_sync_exit(v7);

  if (v6) {
    NSLog(&cfstr_ArghBreakHereP.isa);
  }
  return v6 == 0;
}

- (void)notifyOnDeallocationComplete:(id)a3
{
  id v4 = (void *)[a3 copy];
  allocationGroup = self->_allocationGroup;
  intptr_t v6 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54___SYQuiescenceObserver_notifyOnDeallocationComplete___block_invoke;
  block[3] = &unk_264423590;
  id v9 = v4;
  id v7 = v4;
  dispatch_group_notify(allocationGroup, v6, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allocations, 0);
  objc_storeStrong((id *)&self->_allocationGroup, 0);
  objc_storeStrong((id *)&self->_quiescenceQueues, 0);
}

@end