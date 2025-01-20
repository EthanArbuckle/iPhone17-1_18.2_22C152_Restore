@interface ABCMaintenanceActivity
- (NSString)activityIdentifier;
- (OS_dispatch_queue)activityQueue;
- (id)activityBlock;
- (void)setActivityBlock:(id)a3;
- (void)setActivityIdentifier:(id)a3;
- (void)setActivityQueue:(id)a3;
@end

@implementation ABCMaintenanceActivity

- (id)activityBlock
{
  return self->_activityBlock;
}

- (void)setActivityBlock:(id)a3
{
}

- (OS_dispatch_queue)activityQueue
{
  return self->_activityQueue;
}

- (void)setActivityQueue:(id)a3
{
}

- (NSString)activityIdentifier
{
  return self->_activityIdentifier;
}

- (void)setActivityIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIdentifier, 0);
  objc_storeStrong((id *)&self->_activityQueue, 0);

  objc_storeStrong(&self->_activityBlock, 0);
}

@end