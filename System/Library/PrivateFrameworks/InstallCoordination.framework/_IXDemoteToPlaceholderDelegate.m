@interface _IXDemoteToPlaceholderDelegate
- (IXDemotingAppInstallCoordinator)coordinator;
- (NSString)bundleID;
- (id)completion;
- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5;
- (void)coordinatorDidCompleteSuccessfully:(id)a3 forApplicationRecord:(id)a4;
- (void)setBundleID:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setCoordinator:(id)a3;
@end

@implementation _IXDemoteToPlaceholderDelegate

- (void)coordinatorDidCompleteSuccessfully:(id)a3 forApplicationRecord:(id)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90___IXDemoteToPlaceholderDelegate_coordinatorDidCompleteSuccessfully_forApplicationRecord___block_invoke;
  block[3] = &unk_1E5D179B0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)sAppInstallCoordinatorQueue_0, block);
}

- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5
{
  id v6 = a4;
  v7 = sAppInstallCoordinatorQueue_0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72___IXDemoteToPlaceholderDelegate_coordinator_canceledWithReason_client___block_invoke;
  v9[3] = &unk_1E5D17848;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (IXDemotingAppInstallCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end