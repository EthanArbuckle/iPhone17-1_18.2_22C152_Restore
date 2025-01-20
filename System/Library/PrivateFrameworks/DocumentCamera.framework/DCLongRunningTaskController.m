@interface DCLongRunningTaskController
- (BOOL)isCancelled;
- (BOOL)progressViewControllerDidFinishPresenting;
- (BOOL)shouldDismissProgressViewController;
- (BOOL)shouldShowCancelButton;
- (BOOL)shouldShowCircularProgress;
- (DCLongRunningTaskController)init;
- (DCLongRunningTaskController)initWithWindow:(id)a3 intervalBeforeOpeningProgressDialog:(double)a4;
- (DCProgressViewController)progressViewController;
- (NSDate)lastAccessibilityAnnouncementDate;
- (NSDate)openProgressDate;
- (NSProgress)progress;
- (UIViewController)viewControllerToPresentFrom;
- (UIWindow)window;
- (double)intervalBeforeOpeningProgressDialog;
- (id)completionBlock;
- (id)keepAlive;
- (id)progressToStringTransformer;
- (id)updateProgressUIBlock;
- (void)closeProgressDialog;
- (void)completeTaskIfNecessary;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)openProgressDialog;
- (void)setCompletionBlock:(id)a3;
- (void)setIntervalBeforeOpeningProgressDialog:(double)a3;
- (void)setIsCancelled:(BOOL)a3;
- (void)setKeepAlive:(id)a3;
- (void)setLastAccessibilityAnnouncementDate:(id)a3;
- (void)setOpenProgressDate:(id)a3;
- (void)setProgress:(id)a3;
- (void)setProgressToStringTransformer:(id)a3;
- (void)setProgressViewController:(id)a3;
- (void)setProgressViewControllerDidFinishPresenting:(BOOL)a3;
- (void)setShouldDismissProgressViewController:(BOOL)a3;
- (void)setShouldShowCancelButton:(BOOL)a3;
- (void)setShouldShowCircularProgress:(BOOL)a3;
- (void)setUpdateProgressUIBlock:(id)a3;
- (void)setViewControllerToPresentFrom:(id)a3;
- (void)setWindow:(id)a3;
- (void)startTask:(id)a3 completionBlock:(id)a4;
- (void)updateProgress;
- (void)willDismissProgressViewController:(id)a3;
@end

@implementation DCLongRunningTaskController

- (DCLongRunningTaskController)init
{
  return 0;
}

- (DCLongRunningTaskController)initWithWindow:(id)a3 intervalBeforeOpeningProgressDialog:(double)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DCLongRunningTaskController;
  v7 = [(DCLongRunningTaskController *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(DCLongRunningTaskController *)v7 setIntervalBeforeOpeningProgressDialog:a4];
    [(DCLongRunningTaskController *)v8 setWindow:v6];
  }

  return v8;
}

- (void)startTask:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(DCLongRunningTaskController *)self setKeepAlive:self];
  [(DCLongRunningTaskController *)self setCompletionBlock:v7];

  v8 = (void *)[objc_alloc(MEMORY[0x263F08AB8]) initWithParent:0 userInfo:0];
  [(DCLongRunningTaskController *)self setProgress:v8];

  v9 = [(DCLongRunningTaskController *)self progress];
  [v9 addObserver:self forKeyPath:@"fractionCompleted" options:0 context:DCLongRunningTaskControllerKVOContext];

  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  v11 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__DCLongRunningTaskController_startTask_completionBlock___block_invoke;
  block[3] = &unk_2642A96C0;
  id v12 = v6;
  id v21 = v12;
  block[4] = self;
  v13 = v10;
  v20 = v13;
  dispatch_async(v11, block);

  [(DCLongRunningTaskController *)self intervalBeforeOpeningProgressDialog];
  dispatch_time_t v15 = dispatch_time(0, (uint64_t)(v14 * 1000000000.0));
  if (dispatch_semaphore_wait(v13, v15))
  {
    v16 = [(DCLongRunningTaskController *)self progress];
    uint64_t v17 = [v16 totalUnitCount];

    if (v17 != 1)
    {
      v18 = [MEMORY[0x263EFF910] date];
      [(DCLongRunningTaskController *)self setOpenProgressDate:v18];

      [(DCLongRunningTaskController *)self openProgressDialog];
    }
  }
}

void __57__DCLongRunningTaskController_startTask_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  v3 = [*(id *)(a1 + 32) progress];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__DCLongRunningTaskController_startTask_completionBlock___block_invoke_2;
  block[3] = &unk_2642A9250;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __57__DCLongRunningTaskController_startTask_completionBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeTaskIfNecessary];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)DCLongRunningTaskControllerKVOContext == a6)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __78__DCLongRunningTaskController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_2642A9250;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)DCLongRunningTaskController;
    -[DCLongRunningTaskController observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

uint64_t __78__DCLongRunningTaskController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateProgress];
}

- (void)completeTaskIfNecessary
{
  v3 = [(DCLongRunningTaskController *)self completionBlock];

  if (v3)
  {
    v4 = [(DCLongRunningTaskController *)self completionBlock];
    ((void (**)(void, BOOL))v4)[2](v4, [(DCLongRunningTaskController *)self isCancelled]);

    [(DCLongRunningTaskController *)self setCompletionBlock:0];
  }
  v5 = [(DCLongRunningTaskController *)self progress];

  if (v5)
  {
    objc_super v6 = [(DCLongRunningTaskController *)self openProgressDate];

    if (v6)
    {
      id v7 = [MEMORY[0x263EFF910] date];
      v8 = [(DCLongRunningTaskController *)self openProgressDate];
      [v7 timeIntervalSinceDate:v8];
      double v10 = v9;

      if (v10 < 0.5) {
        [MEMORY[0x263F08B88] sleepForTimeInterval:0.5 - v10];
      }
      [(DCLongRunningTaskController *)self closeProgressDialog];
      [(DCLongRunningTaskController *)self setOpenProgressDate:0];
    }
    v11 = [(DCLongRunningTaskController *)self progress];
    [v11 removeObserver:self forKeyPath:@"fractionCompleted"];

    [(DCLongRunningTaskController *)self setProgress:0];
  }

  [(DCLongRunningTaskController *)self setKeepAlive:0];
}

- (void)updateProgress
{
  v3 = [(DCLongRunningTaskController *)self progress];
  uint64_t v4 = [v3 totalUnitCount];

  if (v4 >= 1)
  {
    v5 = [(DCLongRunningTaskController *)self updateProgressUIBlock];

    if (v5)
    {
      objc_super v6 = [(DCLongRunningTaskController *)self progressToStringTransformer];

      if (v6)
      {
        id v7 = [(DCLongRunningTaskController *)self progress];
        uint64_t v8 = [v7 completedUnitCount];

        if (v8 + 1 < v4) {
          uint64_t v9 = v8 + 1;
        }
        else {
          uint64_t v9 = v4;
        }
        double v10 = [(DCLongRunningTaskController *)self progressToStringTransformer];
        v10[2](v10, v9, v4);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v12 = os_log_create("com.apple.documentcamera", "");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_217885000, v12, OS_LOG_TYPE_DEFAULT, "Progress string transformer not set", buf, 2u);
        }

        v11 = &stru_26C7D5180;
      }
      v13 = [(DCLongRunningTaskController *)self updateProgressUIBlock];
      double v14 = [(DCLongRunningTaskController *)self progress];
      [v14 fractionCompleted];
      ((void (**)(void, __CFString *))v13)[2](v13, v11);

      dispatch_time_t v15 = [MEMORY[0x263EFF910] date];
      uint64_t v16 = [(DCLongRunningTaskController *)self lastAccessibilityAnnouncementDate];
      if (v16)
      {
        uint64_t v17 = (void *)v16;
        v18 = [(DCLongRunningTaskController *)self lastAccessibilityAnnouncementDate];
        [v15 timeIntervalSinceDate:v18];
        double v20 = v19;

        if (v20 > 3.0)
        {
          id v21 = [(DCLongRunningTaskController *)self progress];
          [v21 fractionCompleted];
          unint64_t v23 = (unint64_t)(v22 * 100.0);

          v24 = +[DCLocalization localizedStringForKey:@"%lu%% complete" value:@"%lu%% complete" table:@"Localizable"];
          v25 = objc_msgSend(NSString, "localizedStringWithFormat:", v24, v23);
          DCAccessibilityPostHighPriorityAnnouncementNotification(0, v25);
          [(DCLongRunningTaskController *)self setLastAccessibilityAnnouncementDate:v15];
        }
      }
    }
  }
}

- (void)openProgressDialog
{
  v3 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:0 message:0 preferredStyle:1];
  uint64_t v4 = [[DCProgressViewController alloc] initWithDelegate:self];
  [(DCLongRunningTaskController *)self setProgressViewController:v4];
  if ([(DCLongRunningTaskController *)self shouldShowCircularProgress])
  {
    v5 = [(DCLongRunningTaskController *)self progressViewController];
    id v6 = (id)[v5 view];

    id v7 = [(DCLongRunningTaskController *)self progress];
    uint64_t v8 = [(DCLongRunningTaskController *)self progressViewController];
    [v8 setObservedProgress:v7];
  }
  if ([(DCLongRunningTaskController *)self shouldShowCancelButton])
  {
    objc_initWeak(&location, self);
    uint64_t v9 = (void *)MEMORY[0x263F1C3F0];
    double v10 = +[DCLocalization localizedStringForKey:@"Cancel" value:@"Cancel" table:@"Localizable"];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __49__DCLongRunningTaskController_openProgressDialog__block_invoke;
    v25[3] = &unk_2642A9CC0;
    objc_copyWeak(&v26, &location);
    v11 = [v9 actionWithTitle:v10 style:1 handler:v25];
    [v3 addAction:v11];

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __49__DCLongRunningTaskController_openProgressDialog__block_invoke_2;
  v23[3] = &unk_2642A9CE8;
  v24 = v4;
  id v12 = v4;
  [(DCLongRunningTaskController *)self setUpdateProgressUIBlock:v23];
  v13 = [(DCLongRunningTaskController *)self progressViewController];
  [v3 setContentViewController:v13];

  double v14 = [(DCLongRunningTaskController *)self progressViewController];
  id v15 = (id)[v14 view];

  [(DCLongRunningTaskController *)self updateProgress];
  [(DCLongRunningTaskController *)self setProgressViewControllerDidFinishPresenting:0];
  [(DCLongRunningTaskController *)self setShouldDismissProgressViewController:0];
  uint64_t v16 = [(DCLongRunningTaskController *)self viewControllerToPresentFrom];
  uint64_t v17 = v16;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    double v19 = [(DCLongRunningTaskController *)self window];
    id v18 = [v19 rootViewController];
  }
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __49__DCLongRunningTaskController_openProgressDialog__block_invoke_3;
  v21[3] = &unk_2642A9360;
  v21[4] = self;
  id v22 = v18;
  id v20 = v18;
  [v20 presentViewController:v3 animated:1 completion:v21];
}

void __49__DCLongRunningTaskController_openProgressDialog__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setIsCancelled:1];

  id v3 = objc_loadWeakRetained(v1);
  [v3 closeProgressDialog];
}

void __49__DCLongRunningTaskController_openProgressDialog__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 label];
  [v4 setText:v3];
}

uint64_t __49__DCLongRunningTaskController_openProgressDialog__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setProgressViewControllerDidFinishPresenting:1];
  uint64_t result = [*(id *)(a1 + 32) shouldDismissProgressViewController];
  if (result)
  {
    [*(id *)(a1 + 32) setShouldDismissProgressViewController:0];
    id v3 = *(void **)(a1 + 40);
    return [v3 dismissViewControllerAnimated:1 completion:0];
  }
  return result;
}

- (void)closeProgressDialog
{
  id v3 = [(DCLongRunningTaskController *)self progressViewController];

  if (v3)
  {
    id v4 = [(DCLongRunningTaskController *)self progressViewController];
    [v4 setProgressDelegate:0];

    v5 = [(DCLongRunningTaskController *)self progressViewController];
    id v6 = [v5 presentingViewController];

    [(DCLongRunningTaskController *)self setProgressViewController:0];
    if ([(DCLongRunningTaskController *)self progressViewControllerDidFinishPresenting])
    {
      [v6 dismissViewControllerAnimated:1 completion:0];
    }
    else
    {
      [(DCLongRunningTaskController *)self setShouldDismissProgressViewController:1];
    }
  }
}

- (void)willDismissProgressViewController:(id)a3
{
  id v3 = [(DCLongRunningTaskController *)self progress];
  [v3 cancel];
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void)setIsCancelled:(BOOL)a3
{
  self->_isCancelled = a3;
}

- (BOOL)shouldShowCancelButton
{
  return self->_shouldShowCancelButton;
}

- (void)setShouldShowCancelButton:(BOOL)a3
{
  self->_shouldShowCancelButton = a3;
}

- (id)progressToStringTransformer
{
  return self->_progressToStringTransformer;
}

- (void)setProgressToStringTransformer:(id)a3
{
}

- (UIViewController)viewControllerToPresentFrom
{
  return self->_viewControllerToPresentFrom;
}

- (void)setViewControllerToPresentFrom:(id)a3
{
}

- (BOOL)shouldShowCircularProgress
{
  return self->_shouldShowCircularProgress;
}

- (void)setShouldShowCircularProgress:(BOOL)a3
{
  self->_shouldShowCircularProgress = a3;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (double)intervalBeforeOpeningProgressDialog
{
  return self->_intervalBeforeOpeningProgressDialog;
}

- (void)setIntervalBeforeOpeningProgressDialog:(double)a3
{
  self->_intervalBeforeOpeningProgressDialog = a3;
}

- (id)keepAlive
{
  return self->_keepAlive;
}

- (void)setKeepAlive:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (id)updateProgressUIBlock
{
  return self->_updateProgressUIBlock;
}

- (void)setUpdateProgressUIBlock:(id)a3
{
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (NSDate)lastAccessibilityAnnouncementDate
{
  return self->_lastAccessibilityAnnouncementDate;
}

- (void)setLastAccessibilityAnnouncementDate:(id)a3
{
}

- (NSDate)openProgressDate
{
  return self->_openProgressDate;
}

- (void)setOpenProgressDate:(id)a3
{
}

- (DCProgressViewController)progressViewController
{
  return self->_progressViewController;
}

- (void)setProgressViewController:(id)a3
{
}

- (BOOL)progressViewControllerDidFinishPresenting
{
  return self->_progressViewControllerDidFinishPresenting;
}

- (void)setProgressViewControllerDidFinishPresenting:(BOOL)a3
{
  self->_progressViewControllerDidFinishPresenting = a3;
}

- (BOOL)shouldDismissProgressViewController
{
  return self->_shouldDismissProgressViewController;
}

- (void)setShouldDismissProgressViewController:(BOOL)a3
{
  self->_shouldDismissProgressViewController = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressViewController, 0);
  objc_storeStrong((id *)&self->_openProgressDate, 0);
  objc_storeStrong((id *)&self->_lastAccessibilityAnnouncementDate, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong(&self->_updateProgressUIBlock, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_keepAlive, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_viewControllerToPresentFrom, 0);

  objc_storeStrong(&self->_progressToStringTransformer, 0);
}

@end