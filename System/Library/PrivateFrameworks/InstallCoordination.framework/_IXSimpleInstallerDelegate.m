@interface _IXSimpleInstallerDelegate
- (IXInitiatingOrUpdatingCoordinator)coordinator;
- (NSString)bundleID;
- (NSURL)moveResultToURL;
- (id)completion;
- (id)progressBlock;
- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5;
- (void)coordinator:(id)a3 didUpdateProgress:(double)a4 forPhase:(unint64_t)a5 overallProgress:(double)a6;
- (void)coordinatorDidCompleteSuccessfully:(id)a3 forApplicationRecord:(id)a4;
- (void)setBundleID:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setMoveResultToURL:(id)a3;
- (void)setProgressBlock:(id)a3;
@end

@implementation _IXSimpleInstallerDelegate

- (void)coordinatorDidCompleteSuccessfully:(id)a3 forApplicationRecord:(id)a4
{
  id v5 = a3;
  v6 = sAppInstallCoordinatorQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86___IXSimpleInstallerDelegate_coordinatorDidCompleteSuccessfully_forApplicationRecord___block_invoke;
  v8[3] = &unk_1E5D17848;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5
{
  id v6 = a4;
  id v7 = sAppInstallCoordinatorQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68___IXSimpleInstallerDelegate_coordinator_canceledWithReason_client___block_invoke;
  v9[3] = &unk_1E5D17848;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);
}

- (void)coordinator:(id)a3 didUpdateProgress:(double)a4 forPhase:(unint64_t)a5 overallProgress:(double)a6
{
  v14[2] = *MEMORY[0x1E4F143B8];
  if (a5 == 1)
  {
    id v8 = [(_IXSimpleInstallerDelegate *)self progressBlock];

    if (v8)
    {
      id v9 = [(_IXSimpleInstallerDelegate *)self progressBlock];
      v13[0] = @"Status";
      id v10 = IXStatusForInstallationProgress(a4);
      v13[1] = @"PercentComplete";
      v14[0] = v10;
      v11 = [NSNumber numberWithUnsignedInt:a4];
      v14[1] = v11;
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
      ((void (**)(void, void *))v9)[2](v9, v12);
    }
  }
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (void)setProgressBlock:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (IXInitiatingOrUpdatingCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setCoordinator:(id)a3
{
}

- (NSURL)moveResultToURL
{
  return self->_moveResultToURL;
}

- (void)setMoveResultToURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moveResultToURL, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong(&self->_progressBlock, 0);

  objc_storeStrong(&self->_completion, 0);
}

@end