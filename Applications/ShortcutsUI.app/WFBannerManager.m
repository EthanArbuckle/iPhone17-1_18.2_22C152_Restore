@interface WFBannerManager
- (BOOL)displayActive;
- (BOOL)isDialogPresentationPaused;
- (BOOL)presentableIsIslandPresentable:(id)a3;
- (BOOL)presentedBannerIsStatusForRunningContext:(id)a3;
- (BOOL)presentsApertureStatus;
- (BOOL)queuedDialogIsActionUIRequest:(id)a3;
- (BOOL)runningContextIsInPersistentMode:(id)a3;
- (BOOL)shouldObserveDisplayLayout;
- (BOOL)shouldUpdateStateBasedOnLayout:(id)a3;
- (CGSize)preferredContainerSize;
- (CGSize)preferredPresentationSize;
- (FBSDisplayLayoutMonitor)layoutMonitor;
- (FBSDisplayMonitor)displayMonitor;
- (NSHashTable)connectedHosts;
- (NSMutableDictionary)runningPersistentWorkflows;
- (NSMutableDictionary)singleStepHomeScreenRevokeTimers;
- (NSMutableOrderedSet)pendingRequests;
- (NSString)dialogPresentationPausingReason;
- (NSString)dialogPresentationResumingReason;
- (OS_dispatch_queue)queue;
- (UISCurrentUserInterfaceStyleValue)userInterfaceStyleValue;
- (UIViewController)presentedRemoteAlertViewController;
- (WFActionUserInterfaceListener)actionUserInterfaceListener;
- (WFBannerManager)init;
- (WFBannerPresentable)presentedBanner;
- (WFBannerRequest)inflightRequest;
- (WFDispatchSourceTimer)cleanUpTimer;
- (WFDispatchSourceTimer)pauseTimer;
- (WFWorkflowRunningContext)presentedPersistentRunningContext;
- (WFWorkflowRunningContext)runningContextWaitingForFollowUpRequest;
- (id)bannerPresentationCompletion;
- (id)bannerSource;
- (id)configuredDisplayLayoutMonitor;
- (id)defaultPostOptions;
- (id)dialogRequestCompletionHandler;
- (id)dismissalReasonWithReason:(id)a3;
- (id)presentationAnchorForActionUserInterface:(id)a3;
- (id)presentedPlatter;
- (id)queue_pauseDialogPresentationForDuration:(id)a3 withReason:(id)a4;
- (id)queue_resumeDialogPresentationWithReason:(id)a3 onRequestFromHost:(BOOL)a4;
- (id)requestContainerForRunningContext:(id)a3;
- (id)viewControllerForPresentingActionUserInterface:(id)a3;
- (int64_t)currentUserInterfaceStyle;
- (os_unfair_lock_s)inflightRequestLock;
- (os_unfair_lock_s)presentedBannerLock;
- (os_unfair_lock_s)presentedRemoteAlertViewControllerLock;
- (void)actionUserInterface:(id)a3 showViewControllerInPlatter:(id)a4;
- (void)addConnectedHost:(id)a3;
- (void)applicationWillLaunchInForegroundForRunningContext:(id)a3 isLastAction:(id)a4;
- (void)bannerViewController:(id)a3 didPresentBanner:(id)a4;
- (void)bannerViewController:(id)a3 willDismissWithReason:(id)a4;
- (void)bannerViewControllerActionUserInterfaceNeedsDismissal:(id)a3;
- (void)bannerViewControllerHomeGestureDidPassThreshold:(id)a3;
- (void)beginPersistentModeWithRunningContext:(id)a3 attribution:(id)a4 completionHandler:(id)a5;
- (void)cancelAllPendingRequestsForSystemDismiss;
- (void)completePersistentModeWithSuccess:(id)a3 runningContext:(id)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)dialogViewController:(id)a3 didFinishWithResponse:(id)a4 waitForFollowUpRequest:(BOOL)a5;
- (void)dismissPlatterForActionUserInterface:(id)a3 completionHandler:(id)a4;
- (void)dismissPresentedContentForRunningContext:(id)a3 completionHandler:(id)a4;
- (void)getBannerForQueuedDialogRequest:(id)a3 dialogIsBreakthroughSmartPrompt:(BOOL)a4 completionHandler:(id)a5;
- (void)getBannerForQueuedStatusPresentation:(id)a3 completionHandler:(id)a4;
- (void)handleSingleStepHomeScreenDialogRequest:(id)a3 runningContext:(id)a4 completionHandler:(id)a5;
- (void)pauseDialogPresentationForDuration:(id)a3 withCompletionHandler:(id)a4;
- (void)queue_dismissPresentableWithReason:(id)a3 interruptible:(BOOL)a4 forced:(BOOL)a5;
- (void)queue_dismissRemoteAlertViewControllerWithReason:(id)a3;
- (void)queue_enqueuePersistentModeStatusPresentationForRunningContext:(id)a3;
- (void)queue_presentBanner:(id)a3 completion:(id)a4;
- (void)queue_removePendingStatusPresentationsForRunningContext:(id)a3;
- (void)queue_resetWithReason:(id)a3;
- (void)queue_revokeIslandPresentableForContext:(id)a3 reason:(id)a4;
- (void)queue_revokePresentableForContext:(id)a3 reason:(id)a4 forced:(BOOL)a5;
- (void)queue_stopTrackingPersistentModeContext:(id)a3 withReason:(id)a4;
- (void)queue_updatePresentedStatusForRunningContext:(id)a3;
- (void)queue_updateStateWithReason:(id)a3;
- (void)removeConnectedHost:(id)a3;
- (void)resumeDialogPresentationWithCompletionHandler:(id)a3;
- (void)revokeAllPresentablesWithReason:(id)a3;
- (void)setActionUserInterfaceListener:(id)a3;
- (void)setBannerPresentationCompletion:(id)a3;
- (void)setCleanUpTimer:(id)a3;
- (void)setCurrentUserInterfaceStyle:(int64_t)a3;
- (void)setDialogPresentationPaused:(BOOL)a3;
- (void)setDialogPresentationPausingReason:(id)a3;
- (void)setDialogPresentationResumingReason:(id)a3;
- (void)setDialogRequestCompletionHandler:(id)a3;
- (void)setInflightRequest:(id)a3;
- (void)setPauseTimer:(id)a3;
- (void)setPendingRequests:(id)a3;
- (void)setPresentedBanner:(id)a3;
- (void)setPresentedPersistentRunningContext:(id)a3;
- (void)setPresentedRemoteAlertViewController:(id)a3;
- (void)setRunningContextWaitingForFollowUpRequest:(id)a3;
- (void)setRunningPersistentWorkflows:(id)a3;
- (void)setShouldObserveDisplayLayout:(BOOL)a3;
- (void)setSingleStepHomeScreenRevokeTimers:(id)a3;
- (void)showDialogRequest:(id)a3 runningContext:(id)a4 completionHandler:(id)a5;
- (void)statusViewControllerDidCollapseFromCustomLayout:(id)a3;
- (void)statusViewControllerDidTransitionFromVisibleToCustomLayout:(id)a3;
- (void)updateAttribution:(id)a3 runningContext:(id)a4;
@end

@implementation WFBannerManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cleanUpTimer, 0);
  objc_storeStrong((id *)&self->_singleStepHomeScreenRevokeTimers, 0);
  objc_storeStrong((id *)&self->_userInterfaceStyleValue, 0);
  objc_storeStrong((id *)&self->_dialogPresentationResumingReason, 0);
  objc_storeStrong((id *)&self->_dialogPresentationPausingReason, 0);
  objc_storeStrong((id *)&self->_pauseTimer, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
  objc_storeStrong((id *)&self->_displayMonitor, 0);
  objc_storeStrong((id *)&self->_presentedPersistentRunningContext, 0);
  objc_storeStrong(&self->_bannerPresentationCompletion, 0);
  objc_storeStrong((id *)&self->_runningContextWaitingForFollowUpRequest, 0);
  objc_storeStrong(&self->_dialogRequestCompletionHandler, 0);
  objc_storeStrong((id *)&self->_actionUserInterfaceListener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connectedHosts, 0);
  objc_storeStrong((id *)&self->_runningPersistentWorkflows, 0);
  objc_storeStrong((id *)&self->_presentedRemoteAlertViewController, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_inflightRequest, 0);

  objc_storeStrong((id *)&self->_presentedBanner, 0);
}

- (void)setCleanUpTimer:(id)a3
{
}

- (WFDispatchSourceTimer)cleanUpTimer
{
  return self->_cleanUpTimer;
}

- (void)setSingleStepHomeScreenRevokeTimers:(id)a3
{
}

- (NSMutableDictionary)singleStepHomeScreenRevokeTimers
{
  return self->_singleStepHomeScreenRevokeTimers;
}

- (void)setCurrentUserInterfaceStyle:(int64_t)a3
{
  self->_currentUserInterfaceStyle = a3;
}

- (int64_t)currentUserInterfaceStyle
{
  return self->_currentUserInterfaceStyle;
}

- (UISCurrentUserInterfaceStyleValue)userInterfaceStyleValue
{
  return self->_userInterfaceStyleValue;
}

- (void)setDialogPresentationResumingReason:(id)a3
{
}

- (NSString)dialogPresentationResumingReason
{
  return self->_dialogPresentationResumingReason;
}

- (void)setDialogPresentationPausingReason:(id)a3
{
}

- (NSString)dialogPresentationPausingReason
{
  return self->_dialogPresentationPausingReason;
}

- (void)setPauseTimer:(id)a3
{
}

- (WFDispatchSourceTimer)pauseTimer
{
  return self->_pauseTimer;
}

- (void)setDialogPresentationPaused:(BOOL)a3
{
  self->_dialogPresentationPaused = a3;
}

- (BOOL)isDialogPresentationPaused
{
  return self->_dialogPresentationPaused;
}

- (void)setShouldObserveDisplayLayout:(BOOL)a3
{
  self->_shouldObserveDisplayLayout = a3;
}

- (BOOL)shouldObserveDisplayLayout
{
  return self->_shouldObserveDisplayLayout;
}

- (FBSDisplayLayoutMonitor)layoutMonitor
{
  return self->_layoutMonitor;
}

- (FBSDisplayMonitor)displayMonitor
{
  return self->_displayMonitor;
}

- (void)setPresentedPersistentRunningContext:(id)a3
{
}

- (WFWorkflowRunningContext)presentedPersistentRunningContext
{
  return self->_presentedPersistentRunningContext;
}

- (void)setBannerPresentationCompletion:(id)a3
{
}

- (id)bannerPresentationCompletion
{
  return self->_bannerPresentationCompletion;
}

- (void)setRunningContextWaitingForFollowUpRequest:(id)a3
{
}

- (WFWorkflowRunningContext)runningContextWaitingForFollowUpRequest
{
  return self->_runningContextWaitingForFollowUpRequest;
}

- (void)setDialogRequestCompletionHandler:(id)a3
{
}

- (id)dialogRequestCompletionHandler
{
  return self->_dialogRequestCompletionHandler;
}

- (void)setActionUserInterfaceListener:(id)a3
{
}

- (WFActionUserInterfaceListener)actionUserInterfaceListener
{
  return self->_actionUserInterfaceListener;
}

- (os_unfair_lock_s)inflightRequestLock
{
  return self->_inflightRequestLock;
}

- (os_unfair_lock_s)presentedBannerLock
{
  return self->_presentedBannerLock;
}

- (os_unfair_lock_s)presentedRemoteAlertViewControllerLock
{
  return self->_presentedRemoteAlertViewControllerLock;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSHashTable)connectedHosts
{
  return self->_connectedHosts;
}

- (CGSize)preferredContainerSize
{
  v2 = [(WFBannerManager *)self bannerSource];
  v3 = [v2 layoutDescriptionWithError:0];

  [v3 containerSize];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)preferredPresentationSize
{
  v2 = [(WFBannerManager *)self bannerSource];
  v3 = [v2 layoutDescriptionWithError:0];

  [v3 presentationSize];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (BOOL)presentedBannerIsStatusForRunningContext:(id)a3
{
  id v4 = a3;
  double v5 = [(WFBannerManager *)self presentedPlatter];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v6 = v5;
    }
    else {
      double v6 = 0;
    }
  }
  else
  {
    double v6 = 0;
  }
  id v7 = v6;

  double v8 = [v7 associatedRunningContext];

  LOBYTE(v7) = [v8 isEqual:v4];
  return (char)v7;
}

- (BOOL)runningContextIsInPersistentMode:(id)a3
{
  id v4 = a3;
  double v5 = [(WFBannerManager *)self runningPersistentWorkflows];
  double v6 = [v5 allKeys];
  unsigned __int8 v7 = [v6 containsObject:v4];

  return v7;
}

- (id)dismissalReasonWithReason:(id)a3
{
  return +[NSString stringWithFormat:@"%@%@", @"WFBannerManager: ", a3];
}

- (id)presentedPlatter
{
  v3 = [(WFBannerManager *)self presentedBanner];
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = [v3 embeddedPlatter];
  }
  else
  {

    id v4 = [(WFBannerManager *)self presentedBanner];
  }

  return v4;
}

- (BOOL)queuedDialogIsActionUIRequest:(id)a3
{
  v3 = [a3 request];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)presentableIsIslandPresentable:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)presentsApertureStatus
{
  v2 = +[WFBannerPrototypeSettings sharedSettings];
  unsigned __int8 v3 = [v2 simulateStatusBannerDevice];

  if (v3) {
    return 0;
  }
  double v5 = +[WFDevice currentDevice];
  unsigned __int8 v6 = [v5 hasSystemAperture];

  return v6;
}

- (BOOL)displayActive
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v2 = [(WFBannerManager *)self displayMonitor];
  unsigned __int8 v3 = [v2 connectedIdentities];

  id v4 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v4)
  {
    id v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v3);
        }
        double v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v9 type] == (id)8)
        {
          v10 = sub_1000140D4();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v21 = "-[WFBannerManager displayActive]";
            __int16 v22 = 2112;
            v23 = v9;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Active continuity display found: %@", buf, 0x16u);
          }

          char v6 = 1;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v5);
  }
  else
  {
    char v6 = 0;
  }

  v11 = [(WFBannerManager *)self layoutMonitor];
  v12 = [v11 currentLayout];
  BOOL v13 = (uint64_t)[v12 backlightState] > 1;

  return (v13 | v6) & 1;
}

- (BOOL)shouldUpdateStateBasedOnLayout:(id)a3
{
  id v3 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [v3 elements];
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v5)
  {
    id v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v17;
    uint64_t v9 = FBSDisplayLayoutElementLockScreenIdentifier;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        v11 = [*(id *)(*((void *)&v16 + 1) + 8 * i) identifier];
        unsigned __int8 v12 = [v11 isEqualToString:v9];

        v7 |= v12;
      }
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v6);
  }
  else
  {
    char v7 = 0;
  }

  uint64_t v13 = (uint64_t)[v3 backlightState];
  v14 = sub_1000140D4();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v21 = "-[WFBannerManager shouldUpdateStateBasedOnLayout:]";
    __int16 v22 = 1024;
    int v23 = v7 & 1;
    __int16 v24 = 1024;
    BOOL v25 = v13 < 2;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s layoutContainsLock: %i, displayInactive: %i", buf, 0x18u);
  }

  return (v13 > 1) & ~v7;
}

- (id)configuredDisplayLayoutMonitor
{
  id v3 = +[FBSDisplayLayoutMonitorConfiguration configurationForDefaultMainDisplayMonitor];
  [v3 setNeedsUserInteractivePriority:1];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100014404;
  v6[3] = &unk_100039180;
  v6[4] = self;
  [v3 setTransitionHandler:v6];
  id v4 = +[FBSDisplayLayoutMonitor monitorWithConfiguration:v3];

  return v4;
}

- (void)statusViewControllerDidCollapseFromCustomLayout:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = sub_1000140D4();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        long long v16 = "-[WFBannerManager statusViewControllerDidCollapseFromCustomLayout:]";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Single step home screen island collapsed from custom", buf, 0xCu);
      }

      [v4 associatedRunningContext];
      uint64_t v9 = _NSConcreteStackBlock;
      uint64_t v10 = 3221225472;
      v11 = sub_1000148C8;
      unsigned __int8 v12 = &unk_100039158;
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = self;
      id v6 = v13;
      char v7 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:&v9 block:1.0];
      uint64_t v8 = [(WFBannerManager *)self singleStepHomeScreenRevokeTimers];
      [v8 setObject:v7 forKey:v6];
    }
  }
}

- (void)statusViewControllerDidTransitionFromVisibleToCustomLayout:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = sub_1000140D4();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315138;
        unsigned __int8 v12 = "-[WFBannerManager statusViewControllerDidTransitionFromVisibleToCustomLayout:]";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Single step home screen island expanded to custom", (uint8_t *)&v11, 0xCu);
      }

      id v6 = [(WFBannerManager *)self singleStepHomeScreenRevokeTimers];
      char v7 = [v4 associatedRunningContext];
      uint64_t v8 = [v6 objectForKey:v7];

      if (v8)
      {
        [v8 invalidate];
        uint64_t v9 = [(WFBannerManager *)self singleStepHomeScreenRevokeTimers];
        uint64_t v10 = [v4 associatedRunningContext];
        [v9 removeObjectForKey:v10];
      }
    }
  }
}

- (void)bannerViewControllerActionUserInterfaceNeedsDismissal:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014BAC;
  block[3] = &unk_100038C80;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)bannerViewControllerHomeGestureDidPassThreshold:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100014CAC;
  v5[3] = &unk_100038BC0;
  id v6 = a3;
  char v7 = self;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)bannerViewController:(id)a3 willDismissWithReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(WFBannerManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014EC4;
  block[3] = &unk_100038C30;
  id v12 = v7;
  id v13 = v6;
  v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)bannerViewController:(id)a3 didPresentBanner:(id)a4
{
  id v5 = [(WFBannerManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015138;
  block[3] = &unk_100038C80;
  void block[4] = self;
  dispatch_async(v5, block);
}

- (void)dismissPlatterForActionUserInterface:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001530C;
  v13[3] = &unk_100038CA8;
  v13[4] = self;
  id v7 = a4;
  id v14 = v7;
  uint64_t v8 = objc_retainBlock(v13);
  id v9 = [v6 viewControllerForPresenting];

  if (v9)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000153B0;
    v10[3] = &unk_100038CA8;
    id v11 = v6;
    id v12 = v8;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
  }
  else
  {
    ((void (*)(void *))v8[2])(v8);
  }
}

- (void)actionUserInterface:(id)a3 showViewControllerInPlatter:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v14 = objc_alloc_init((Class)WFCompactPlatterViewController);
  uint64_t v8 = [v14 platterView];
  id v9 = [v7 attribution];
  [v8 setAttribution:v9];

  id v10 = [v14 platterView];
  [v10 applyMaterialViewStyling];

  [v14 setContentViewController:v6];
  id v11 = [(WFBannerManager *)self viewControllerForPresentingActionUserInterface:v7];

  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }
  id v13 = v12;

  [v13 presentViewController:v14 animated:1 completion:0];
}

- (id)presentationAnchorForActionUserInterface:(id)a3
{
  id v3 = [(WFBannerManager *)self viewControllerForPresentingActionUserInterface:a3];
  id v4 = [v3 view];
  id v5 = [v4 window];

  return v5;
}

- (id)viewControllerForPresentingActionUserInterface:(id)a3
{
  id v4 = +[WFBannerPrototypeSettings sharedSettings];
  unsigned int v5 = [v4 useRemoteAlertsForActionInterfaceDialogRequests];

  if (v5)
  {
    id v6 = [(WFBannerManager *)self presentedRemoteAlertViewController];
  }
  else
  {
    id v7 = [(WFBannerManager *)self presentedBanner];
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 0;
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
    id v6 = v8;
  }

  return v6;
}

- (void)dialogViewController:(id)a3 didFinishWithResponse:(id)a4 waitForFollowUpRequest:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(WFBannerManager *)self queue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100015830;
  v13[3] = &unk_100039110;
  id v14 = v8;
  id v15 = v9;
  BOOL v17 = a5;
  long long v16 = self;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

- (void)cancelAllPendingRequestsForSystemDismiss
{
  id v3 = [(WFBannerManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016178;
  block[3] = &unk_100038C80;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)revokeAllPresentablesWithReason:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(WFBannerManager *)self bannerSource];
  id v6 = [(WFBannerManager *)self dismissalReasonWithReason:v4];

  id v7 = [v5 revokeAllPresentablesWithReason:v6 userInfo:&__NSDictionary0__struct error:0];

  [(WFBannerManager *)self setPresentedBanner:0];
}

- (void)queue_resetWithReason:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_1000140D4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    id v10 = "-[WFBannerManager queue_resetWithReason:]";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Clearing ALL state because %@", (uint8_t *)&v9, 0x16u);
  }

  id v6 = [(WFBannerManager *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(WFBannerManager *)self pendingRequests];
  [v7 removeAllObjects];

  [(WFBannerManager *)self setInflightRequest:0];
  [(WFBannerManager *)self setPresentedBanner:0];
  [(WFBannerManager *)self setActionUserInterfaceListener:0];
  [(WFBannerManager *)self setRunningContextWaitingForFollowUpRequest:0];
  [(WFBannerManager *)self setBannerPresentationCompletion:0];
  [(WFBannerManager *)self setDialogRequestCompletionHandler:0];
  [(WFBannerManager *)self setPresentedPersistentRunningContext:0];
  id v8 = [(WFBannerManager *)self runningPersistentWorkflows];
  [v8 removeAllObjects];

  [(WFBannerManager *)self setShouldObserveDisplayLayout:0];
}

- (void)handleSingleStepHomeScreenDialogRequest:(id)a3 runningContext:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000165F8;
  v12[3] = &unk_100038CD0;
  v12[4] = self;
  id v13 = a4;
  id v14 = v8;
  id v15 = a5;
  id v9 = v15;
  id v10 = v8;
  id v11 = v13;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
}

- (id)queue_resumeDialogPresentationWithReason:(id)a3 onRequestFromHost:(BOOL)a4
{
  id v6 = (__CFString *)a3;
  id v7 = [(WFBannerManager *)self queue];
  dispatch_assert_queue_V2(v7);

  if ([(WFBannerManager *)self isDialogPresentationPaused])
  {
    id v8 = [(WFBannerManager *)self pauseTimer];

    if (!v8)
    {
      v34 = +[NSAssertionHandler currentHandler];
      [v34 handleFailureInMethod:a2, self, @"WFBannerManager.m", 1346, @"Dialog presentation is paused, but there is no pause timer" object file lineNumber description];
    }
    id v9 = [(WFBannerManager *)self dialogPresentationResumingReason];

    if (v9)
    {
      v35 = +[NSAssertionHandler currentHandler];
      [v35 handleFailureInMethod:a2, self, @"WFBannerManager.m", 1347, @"Dialog presentation is paused, but there is a resuming reason" object file lineNumber description];
    }
    id v10 = sub_1000140D4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [(WFBannerManager *)self dialogPresentationPausingReason];
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[WFBannerManager queue_resumeDialogPresentationWithReason:onRequestFromHost:]";
      __int16 v43 = 2112;
      v44 = v11;
      __int16 v45 = 2112;
      v46 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Resuming dialog presentation (paused for '%@') for '%@'", buf, 0x20u);
    }
    v36 = v6;
    id v12 = [(__CFString *)v6 copy];
    [(WFBannerManager *)self setDialogPresentationResumingReason:v12];

    [(WFBannerManager *)self setDialogPresentationPausingReason:0];
    [(WFBannerManager *)self setDialogPresentationPaused:0];
    id v13 = [(WFBannerManager *)self pauseTimer];
    [v13 cancel];

    [(WFBannerManager *)self setPauseTimer:0];
    id v14 = (__CFString *)objc_opt_new();
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v15 = [(WFBannerManager *)self pendingRequests];
    id v16 = [v15 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v38;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v38 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          v21 = [(WFBannerManager *)self runningPersistentWorkflows];
          __int16 v22 = [v20 context];
          int v23 = [v21 objectForKey:v22];

          if ([v23 completed]) {
            [(__CFString *)v14 addObject:v20];
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v17);
    }

    __int16 v24 = [(WFBannerManager *)self pendingRequests];
    [v24 removeObjectsInArray:v14];

    id v6 = v36;
    BOOL v25 = +[NSString stringWithFormat:@"we just resumed dialog presentation for '%@'", v36];
    [(WFBannerManager *)self queue_updateStateWithReason:v25];
    id v26 = 0;
  }
  else
  {
    uint64_t v27 = [(WFBannerManager *)self dialogPresentationResumingReason];
    v28 = (void *)v27;
    v29 = @"never paused";
    if (v27) {
      v29 = (__CFString *)v27;
    }
    id v14 = v29;

    v30 = sub_1000140D4();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[WFBannerManager queue_resumeDialogPresentationWithReason:onRequestFromHost:]";
      __int16 v43 = 2112;
      v44 = v6;
      __int16 v45 = 2112;
      v46 = v14;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s Wanted to resume dialog presentation for '%@', but it was already resumed for '%@'", buf, 0x20u);
    }

    uint64_t v31 = +[NSString stringWithFormat:@"Dialog presentation was resumed for '%@'", v14];
    BOOL v25 = (void *)v31;
    if (v31)
    {
      NSErrorUserInfoKey v47 = NSLocalizedDescriptionKey;
      *(void *)buf = v31;
      v32 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v47 count:1];
    }
    else
    {
      v32 = 0;
    }
    id v26 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.shortcuts.bannermanager" code:2 userInfo:v32];
  }

  return v26;
}

- (id)queue_pauseDialogPresentationForDuration:(id)a3 withReason:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(WFBannerManager *)self queue];
  dispatch_assert_queue_V2(v9);

  [v7 doubleValue];
  id v11 = v10;
  if (![(WFBannerManager *)self isDialogPresentationPaused])
  {
    id v17 = [(WFBannerManager *)self pauseTimer];

    if (v17)
    {
      uint64_t v31 = +[NSAssertionHandler currentHandler];
      [v31 handleFailureInMethod:a2, self, @"WFBannerManager.m", 1306, @"Dialog presentation isn't paused, but the pause timer is non-nil" object file lineNumber description];
    }
    uint64_t v18 = [(WFBannerManager *)self dialogPresentationPausingReason];

    if (v18)
    {
      v32 = +[NSAssertionHandler currentHandler];
      [v32 handleFailureInMethod:a2, self, @"WFBannerManager.m", 1307, @"Dialog presentation isn't paused, but there is a pausing reason" object file lineNumber description];
    }
    long long v19 = sub_1000140D4();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "-[WFBannerManager queue_pauseDialogPresentationForDuration:withReason:]";
      __int16 v36 = 2048;
      long long v37 = v11;
      __int16 v38 = 2112;
      id v39 = v8;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s Pausing dialog presentation for %.2f seconds for '%@'", buf, 0x20u);
    }

    [(WFBannerManager *)self setDialogPresentationResumingReason:0];
    id v20 = [v8 copy];
    [(WFBannerManager *)self setDialogPresentationPausingReason:v20];

    [(WFBannerManager *)self setDialogPresentationPaused:1];
    v21 = [(WFBannerManager *)self presentedBanner];
    if (v21)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        __int16 v22 = v21;
      }
      else {
        __int16 v22 = 0;
      }
    }
    else
    {
      __int16 v22 = 0;
    }
    id v12 = v22;

    id v15 = [v12 associatedRunningContext];
    __int16 v24 = [v12 queuedStatusPlatter];

    if (v24)
    {
      [v12 setQueuedStatusPlatter:0];
    }
    else
    {
      BOOL v25 = [(WFBannerManager *)self presentedPlatter];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
LABEL_24:
        objc_initWeak((id *)buf, self);
        id v27 = objc_alloc((Class)WFDispatchSourceTimer);
        v28 = [(WFBannerManager *)self queue];
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_1000178D8;
        v33[3] = &unk_100038FB0;
        objc_copyWeak(v34, (id *)buf);
        v34[1] = v11;
        id v29 = [v27 initWithInterval:v28 queue:v33 handler:*(double *)&v11];

        [v29 setPreventSuspension:1];
        [v29 start];
        [(WFBannerManager *)self setPauseTimer:v29];

        objc_destroyWeak(v34);
        objc_destroyWeak((id *)buf);
        id v23 = 0;
        goto LABEL_25;
      }
      [(WFBannerManager *)self queue_dismissPresentableWithReason:@"dialog presentation was paused" interruptible:0 forced:0];
    }
    [(WFBannerManager *)self queue_enqueuePersistentModeStatusPresentationForRunningContext:v15];
    goto LABEL_24;
  }
  id v12 = [(WFBannerManager *)self dialogPresentationPausingReason];
  id v13 = sub_1000140D4();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[WFBannerManager queue_pauseDialogPresentationForDuration:withReason:]";
    __int16 v36 = 2048;
    long long v37 = v11;
    __int16 v38 = 2112;
    id v39 = v8;
    __int16 v40 = 2112;
    id v41 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Wanted to pause dialog presentation for %.2f seconds for '%@', but it was already paused for '%@'", buf, 0x2Au);
  }

  uint64_t v14 = +[NSString stringWithFormat:@"Dialog presentation is already paused for '%@'", v12];
  id v15 = (void *)v14;
  if (v14)
  {
    NSErrorUserInfoKey v42 = NSLocalizedDescriptionKey;
    *(void *)buf = v14;
    id v16 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v42 count:1];
  }
  else
  {
    id v16 = 0;
  }
  id v23 = [objc_alloc((Class)NSError) initWithDomain:@"com.apple.shortcuts.bannermanager" code:1 userInfo:v16];

LABEL_25:

  return v23;
}

- (void)getBannerForQueuedDialogRequest:(id)a3 dialogIsBreakthroughSmartPrompt:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = sub_1000140D4();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    long long v19 = "-[WFBannerManager getBannerForQueuedDialogRequest:dialogIsBreakthroughSmartPrompt:completionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Getting dialog banner...", buf, 0xCu);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100017ABC;
  v13[3] = &unk_100038F88;
  id v14 = v8;
  id v15 = self;
  id v16 = v9;
  BOOL v17 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
}

- (id)requestContainerForRunningContext:(id)a3
{
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  id v15 = sub_100018414;
  id v16 = &unk_100038F10;
  id v4 = a3;
  id v17 = v4;
  uint64_t v18 = self;
  unsigned int v5 = objc_retainBlock(&v13);
  id v6 = [(WFBannerManager *)self presentedBanner];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;

  [v8 setDismissalHandler:v5];
  id v9 = [(WFBannerManager *)self presentedPlatter];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ([v8 dismissalPhase] || (isKindOfClass & 1) != 0)
  {
    id v11 = (WFBannerViewController *)v8;
  }
  else
  {
    id v11 = [[WFBannerViewController alloc] initWithDelegate:self associatedRunningContext:v4];
    [(WFBannerViewController *)v11 setDismissalHandler:v5];
  }

  return v11;
}

- (void)getBannerForQueuedStatusPresentation:(id)a3 completionHandler:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000188A8;
  block[3] = &unk_100038CF8;
  void block[4] = self;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)queue_updatePresentedStatusForRunningContext:(id)a3
{
  id v4 = a3;
  id v5 = [(WFBannerManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1000140D4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v36 = "-[WFBannerManager queue_updatePresentedStatusForRunningContext:]";
    __int16 v37 = 2112;
    id v38 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Updating presented status platters with progress if applicable. Running context: (%@)", buf, 0x16u);
  }

  id v7 = [(WFBannerManager *)self runningPersistentWorkflows];
  id v8 = [v7 objectForKey:v4];

  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([(WFBannerManager *)self presentsApertureStatus])
      {
        id v9 = [v8 associatedPill];
        if (v9)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100019654;
            block[3] = &unk_100038EA0;
            uint64_t v31 = v9;
            id v32 = v8;
            v33 = self;
            id v34 = v4;
            id v8 = v8;
            id v10 = v9;
            dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

            goto LABEL_34;
          }
        }
      }
      else
      {
        id v9 = [(WFBannerManager *)self presentedPlatter];
        if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          uint64_t v14 = [(WFBannerManager *)self presentedBanner];
          if (v14)
          {
            objc_opt_class();
            id v15 = (objc_opt_isKindOfClass() & 1) != 0 ? v14 : 0;
          }
          else
          {
            id v15 = 0;
          }
          id v16 = v15;

          id v9 = [v16 queuedStatusPlatter];

          if (!v9) {
            goto LABEL_29;
          }
        }
        id v17 = [v9 associatedRunningContext];
        unsigned __int8 v18 = [v17 isEqual:v4];

        if (v18)
        {
          if ([v8 completed])
          {
            dispatch_time_t v19 = dispatch_time(0, 50000000);
            v28[0] = _NSConcreteStackBlock;
            v28[1] = 3221225472;
            v28[2] = sub_1000198EC;
            v28[3] = &unk_100038C80;
            id v9 = v9;
            id v29 = v9;
            dispatch_after(v19, (dispatch_queue_t)&_dispatch_main_q, v28);
            dispatch_time_t v20 = dispatch_time(0, 1000000000);
            v21 = [(WFBannerManager *)self queue];
            v26[0] = _NSConcreteStackBlock;
            v26[1] = 3221225472;
            v26[2] = sub_1000199B8;
            v26[3] = &unk_100038BC0;
            v26[4] = self;
            id v27 = v4;
            dispatch_after(v20, v21, v26);

            __int16 v22 = v29;
          }
          else
          {
            v23[0] = _NSConcreteStackBlock;
            v23[1] = 3221225472;
            v23[2] = sub_100019A8C;
            v23[3] = &unk_100038BC0;
            id v9 = v9;
            __int16 v24 = v9;
            id v25 = v8;
            dispatch_async((dispatch_queue_t)&_dispatch_main_q, v23);

            __int16 v22 = v24;
          }
        }
        else
        {
LABEL_29:
          __int16 v22 = sub_1000140D4();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            __int16 v36 = "-[WFBannerManager queue_updatePresentedStatusForRunningContext:]";
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s No status view controller found", buf, 0xCu);
          }
        }
      }
      goto LABEL_34;
    }
  }

  id v8 = [(WFBannerManager *)self presentedPlatter];
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v11 = [v8 associatedRunningContext];
    unsigned int v12 = [v11 isEqual:v4];

    if (v12)
    {
      id v13 = sub_1000140D4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v36 = "-[WFBannerManager queue_updatePresentedStatusForRunningContext:]";
        __int16 v37 = 2112;
        id v38 = v4;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s While updating platters for progress, shortcut with context (%@) was found to no longer be tracked. Revoking...", buf, 0x16u);
      }

      [(WFBannerManager *)self queue_dismissPresentableWithReason:@"shortcut was found to be no longer running as determined by updating progress process after presenting status" interruptible:0 forced:0];
      goto LABEL_34;
    }
  }
  else
  {

    id v8 = 0;
  }
  if ([(WFBannerManager *)self presentsApertureStatus]) {
    [(WFBannerManager *)self queue_revokeIslandPresentableForContext:v4 reason:@"shortcut was found to be no longer running as determined by updating progress process after presenting status"];
  }
LABEL_34:
}

- (void)queue_removePendingStatusPresentationsForRunningContext:(id)a3
{
  id v4 = a3;
  id v5 = [(WFBannerManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = objc_alloc_init((Class)NSMutableArray);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v17 = self;
  id v7 = [(WFBannerManager *)self pendingRequests];
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(id *)(*((void *)&v18 + 1) + 8 * i);
        if (v12)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v13 = v12;
          }
          else {
            id v13 = 0;
          }
        }
        else
        {
          id v13 = 0;
        }
        id v14 = v13;

        id v15 = [v14 context];

        LODWORD(v14) = [v15 isEqual:v4];
        if (v14) {
          [v6 addObject:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  id v16 = [(WFBannerManager *)v17 pendingRequests];
  [v16 removeObjectsInArray:v6];
}

- (void)queue_stopTrackingPersistentModeContext:(id)a3 withReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000140D4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315650;
    id v17 = "-[WFBannerManager queue_stopTrackingPersistentModeContext:withReason:]";
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2114;
    id v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Removing state for %@ because %{public}@", (uint8_t *)&v16, 0x20u);
  }

  id v9 = [(WFBannerManager *)self queue];
  dispatch_assert_queue_V2(v9);

  uint64_t v10 = [(WFBannerManager *)self runningPersistentWorkflows];
  id v11 = [v10 objectForKey:v6];

  id v12 = [v11 progressSubscriber];
  [v6 removeProgressSubscriber:v12];

  id v13 = [(WFBannerManager *)self runningPersistentWorkflows];
  [v13 removeObjectForKey:v6];

  if (![(WFBannerManager *)self presentsApertureStatus])
  {
    id v14 = [(WFBannerManager *)self presentedPersistentRunningContext];
    unsigned int v15 = [v14 isEqual:v6];

    if (v15) {
      [(WFBannerManager *)self setPresentedPersistentRunningContext:0];
    }
  }
}

- (void)queue_enqueuePersistentModeStatusPresentationForRunningContext:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000140D4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v21 = "-[WFBannerManager queue_enqueuePersistentModeStatusPresentationForRunningContext:]";
    __int16 v22 = 2112;
    id v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Submitting persistent mode request for %@", buf, 0x16u);
  }

  id v6 = [(WFBannerManager *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = [(WFBannerManager *)self runningPersistentWorkflows];
  id v8 = [v7 objectForKey:v4];

  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v9 = [[WFQueuedStatusPresentation alloc] initWithRunningContext:v4];
    if ([(WFBannerManager *)self presentsApertureStatus])
    {
      uint64_t v10 = [(WFBannerManager *)self pendingRequests];
      [v10 addObject:v9];
    }
    else
    {
      objc_initWeak((id *)buf, self);
      id v11 = objc_alloc((Class)WFDispatchSourceTimer);
      id v12 = [(WFBannerManager *)self queue];
      id v14 = _NSConcreteStackBlock;
      uint64_t v15 = 3221225472;
      int v16 = sub_10001A228;
      id v17 = &unk_100038E78;
      objc_copyWeak(&v19, (id *)buf);
      __int16 v18 = v9;
      id v13 = [v11 initWithInterval:v12 queue:&v14 handler:0.2];

      [v13 setPreventSuspension:1 v14, v15, v16, v17];
      [v13 start];

      objc_destroyWeak(&v19);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {

    id v8 = sub_1000140D4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v21 = "-[WFBannerManager queue_enqueuePersistentModeStatusPresentationForRunningContext:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Unable to enqueue persistent mode status presentation because the backing workflow is not running", buf, 0xCu);
    }
  }
}

- (id)defaultPostOptions
{
  v4[0] = kSBUIPresentableShouldBypassScreenSharingUserInfoKey;
  v4[1] = kSBUIPresentableWantsDismissalPreventionContextUserInfoKey;
  v5[0] = &__kCFBooleanTrue;
  v5[1] = &__kCFBooleanTrue;
  v4[2] = kSBUIPresentableCustomTransitionStyleUserInfoKey;
  v5[2] = &off_10003B0F0;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];

  return v2;
}

- (id)bannerSource
{
  return +[BNBannerSource bannerSourceForDestination:0 forRequesterIdentifier:VCBundleIdentifierShortcutsUI];
}

- (void)queue_presentBanner:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  id v8 = sub_1000140D4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 requestIdentifier];
    *(_DWORD *)buf = 136315650;
    v57 = "-[WFBannerManager queue_presentBanner:completion:]";
    __int16 v58 = 2112;
    id v59 = v6;
    __int16 v60 = 2112;
    v61 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Preparing banner for presentation (%@) for running context (%@)", buf, 0x20u);
  }
  uint64_t v10 = [(WFBannerManager *)self queue];
  dispatch_assert_queue_V2(v10);

  id v11 = [(WFBannerManager *)self presentedBanner];

  if (v11 == v6)
  {
    id v21 = sub_1000140D4();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v22 = [v6 requestIdentifier];
      *(_DWORD *)buf = 136315650;
      v57 = "-[WFBannerManager queue_presentBanner:completion:]";
      __int16 v58 = 2112;
      id v59 = v6;
      __int16 v60 = 2112;
      v61 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s Presentable is already on screen (%@), (%@)", buf, 0x20u);
    }
    id v23 = [v6 associatedRunningContext];
    [(WFBannerManager *)self queue_updatePresentedStatusForRunningContext:v23];

    v7[2](v7, 1);
  }
  else
  {
    unsigned int v12 = [(WFBannerManager *)self presentableIsIslandPresentable:v6];
    id v13 = [(WFBannerManager *)self inflightRequest];
    if (!v13 || [(WFBannerManager *)self displayActive])
    {

      goto LABEL_7;
    }

    if (v12)
    {
LABEL_7:
      if (![(WFBannerManager *)self presentsApertureStatus])
      {
        id v14 = [v6 associatedRunningContext];
        unsigned int v15 = [(WFBannerManager *)self runningContextIsInPersistentMode:v14];

        if (v15)
        {
          int v16 = [v6 associatedRunningContext];
          [(WFBannerManager *)self setPresentedPersistentRunningContext:v16];
        }
      }
      if ([(WFBannerManager *)self presentsApertureStatus] && v12)
      {
        id v17 = [v6 associatedRunningContext];
        __int16 v18 = [(WFBannerManager *)self runningPersistentWorkflows];
        id v19 = [v18 objectForKey:v17];

        if (v19)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            __int16 v20 = v19;
          }
          else {
            __int16 v20 = 0;
          }
        }
        else
        {
          __int16 v20 = 0;
        }
        id v31 = v20;

        [v31 setAssociatedPill:v6];
        v7[2](v7, 1);
      }
      else
      {
        [(WFBannerManager *)self setBannerPresentationCompletion:v7];
      }
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001AA70;
      block[3] = &unk_100038E50;
      void block[4] = self;
      id v49 = v6;
      char v50 = v12;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      goto LABEL_28;
    }
    __int16 v24 = [v6 associatedRunningContext];
    unsigned int v25 = [v24 isShortcutsApp];
    id v26 = sub_1000140D4();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    if (v25)
    {
      if (v27)
      {
        v28 = [(WFBannerManager *)self inflightRequest];
        *(_DWORD *)buf = 136315394;
        v57 = "-[WFBannerManager queue_presentBanner:completion:]";
        __int16 v58 = 2112;
        id v59 = v28;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s Display is off, putting inflight request (%@) back on top of the queue and observing display layout", buf, 0x16u);
      }
      id v29 = [(WFBannerManager *)self pendingRequests];
      v30 = [(WFBannerManager *)self inflightRequest];
      [v29 insertObject:v30 atIndex:0];

      [(WFBannerManager *)self setInflightRequest:0];
      [(WFBannerManager *)self setShouldObserveDisplayLayout:1];
      v7[2](v7, 3);
    }
    else
    {
      if (v27)
      {
        *(_DWORD *)buf = 136315138;
        v57 = "-[WFBannerManager queue_presentBanner:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s Display is off, requesting for workflow pause", buf, 0xCu);
      }

      id v32 = [(WFBannerManager *)self inflightRequest];
      if (v32)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v33 = v32;
        }
        else {
          v33 = 0;
        }
      }
      else
      {
        v33 = 0;
      }
      id v34 = v33;

      v35 = [v34 request];
      if (!v35)
      {
        __int16 v36 = sub_1000140D4();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          v57 = "-[WFBannerManager queue_presentBanner:completion:]";
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_FAULT, "%s Attempting to pause a workflow when presenting a non-queued dialog request", buf, 0xCu);
        }
      }
      __int16 v37 = [v34 completionHandler];

      if (v37)
      {
        id v38 = [v34 completionHandler];
        id v39 = [objc_alloc((Class)WFDialogResponse) initWithResponseCode:3];
        ((void (**)(void, id, void))v38)[2](v38, v39, 0);

        [v34 setCompletionHandler:0];
      }
      -[WFBannerManager setInflightRequest:](self, "setInflightRequest:", 0, v34);
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      __int16 v40 = [(WFBannerManager *)self connectedHosts];
      id v41 = [v40 countByEnumeratingWithState:&v51 objects:v55 count:16];
      if (v41)
      {
        id v42 = v41;
        uint64_t v43 = *(void *)v52;
        do
        {
          for (i = 0; i != v42; i = (char *)i + 1)
          {
            if (*(void *)v52 != v43) {
              objc_enumerationMutation(v40);
            }
            __int16 v45 = [*(id *)(*((void *)&v51 + 1) + 8 * i) remoteTarget];
            v46 = v45;
            if (v45) {
              [v45 presenterRequestedWorkflowPauseForContext:v24 dialogRequest:v35 completionHandler:&stru_100038E28];
            }
          }
          id v42 = [v40 countByEnumeratingWithState:&v51 objects:v55 count:16];
        }
        while (v42);
      }

      v7[2](v7, 4);
    }
  }
LABEL_28:
}

- (void)queue_revokeIslandPresentableForContext:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000140D4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v19 = "-[WFBannerManager queue_revokeIslandPresentableForContext:reason:]";
    __int16 v20 = 2112;
    id v21 = v6;
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Revoking pill presentable for context: %@, reason: %@", buf, 0x20u);
  }

  id v9 = [(WFBannerManager *)self queue];
  dispatch_assert_queue_V2(v9);

  dispatch_time_t v10 = dispatch_time(0, 80000000);
  id v11 = [(WFBannerManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001AF74;
  block[3] = &unk_100038C30;
  id v15 = v6;
  int v16 = self;
  id v17 = v7;
  id v12 = v7;
  id v13 = v6;
  dispatch_after(v10, v11, block);
}

- (void)queue_revokePresentableForContext:(id)a3 reason:(id)a4 forced:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  dispatch_time_t v10 = sub_1000140D4();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    unsigned int v25 = "-[WFBannerManager queue_revokePresentableForContext:reason:forced:]";
    __int16 v26 = 2112;
    id v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Revoking banner presentable with reason: %@", buf, 0x16u);
  }

  id v11 = [(WFBannerManager *)self presentedBanner];

  if (v11)
  {
    id v12 = +[WFBannerViewController requestIdentifierForContext:v8];
    id v13 = [(WFBannerManager *)self bannerSource];
    id v14 = [(WFBannerManager *)self dismissalReasonWithReason:v9];
    id v23 = 0;
    id v15 = [v13 revokePresentableWithRequestIdentifier:v12 reason:v14 animated:0 userInfo:&__NSDictionary0__struct error:&v23];
    int v16 = v23;

    if (v15)
    {
      [(WFBannerManager *)self setPresentedBanner:0];
      id v17 = [(WFBannerManager *)self inflightRequest];
      __int16 v18 = [v17 context];
      if ([v18 isEqual:v8])
      {
        id v19 = [(WFBannerManager *)self bannerPresentationCompletion];

        if (v19)
        {
          __int16 v20 = [(WFBannerManager *)self bannerPresentationCompletion];
          v20[2](v20, 2);

          [(WFBannerManager *)self setBannerPresentationCompletion:0];
        }
      }
      else
      {
      }
      __int16 v22 = +[NSString stringWithFormat:@"we just revoked a banner, revoke reason: %@", v9];
      [(WFBannerManager *)self queue_updateStateWithReason:v22];
    }
    else
    {
      id v21 = sub_1000140D4();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        unsigned int v25 = "-[WFBannerManager queue_revokePresentableForContext:reason:forced:]";
        __int16 v26 = 2112;
        id v27 = v8;
        __int16 v28 = 2112;
        id v29 = v16;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s Failed to revoke banner for running context: %@, error: %@", buf, 0x20u);
      }

      if (v5) {
        [(WFBannerManager *)self revokeAllPresentablesWithReason:@"Banner revoke failed and caller requested forced dismissal"];
      }
    }
  }
  else
  {
    int v16 = sub_1000140D4();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      unsigned int v25 = "-[WFBannerManager queue_revokePresentableForContext:reason:forced:]";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s No presentable to revoke", buf, 0xCu);
    }
  }
}

- (void)queue_dismissRemoteAlertViewControllerWithReason:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(WFBannerManager *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_1000140D4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    dispatch_time_t v10 = "-[WFBannerManager queue_dismissRemoteAlertViewControllerWithReason:]";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Revoking banner presentable with reason: %@", buf, 0x16u);
  }

  id v7 = +[WFAngelSceneManager sharedManager];
  [v7 requestSceneDeactivation];

  [(WFBannerManager *)self setPresentedRemoteAlertViewController:0];
  id v8 = +[NSString stringWithFormat:@"we just dismissed action UI, updating state: %@", v4];
  [(WFBannerManager *)self queue_updateStateWithReason:v8];
}

- (void)queue_dismissPresentableWithReason:(id)a3 interruptible:(BOOL)a4 forced:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [(WFBannerManager *)self queue];
  dispatch_assert_queue_V2(v9);

  dispatch_time_t v10 = [(WFBannerManager *)self presentedBanner];
  __int16 v11 = v10;
  if (v10)
  {
    id v12 = v10;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }
    id v14 = v13;

    if ([v14 dismissalPhase] != (id)1 || v6)
    {
      id v19 = [v14 dismissalPhase];
      id v15 = sub_1000140D4();
      BOOL v20 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (v19)
      {
        if (v20)
        {
          *(_DWORD *)buf = 136315138;
          v35 = "-[WFBannerManager queue_dismissPresentableWithReason:interruptible:forced:]";
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s Dismissal requested while already dismissing presentable, nothing to do.", buf, 0xCu);
        }
        goto LABEL_27;
      }
      if (!v20)
      {
LABEL_17:

        id v15 = [v14 associatedRunningContext];
        id v21 = [v14 embeddedPlatter];
        BOOL v22 = v21 == 0;

        if (v22)
        {
          __int16 v24 = +[NSString stringWithFormat:@"hinting request did not find embedded platter, revoking immediately. Hint reason: %@", v8];
          [(WFBannerManager *)self queue_revokePresentableForContext:v15 reason:v24 forced:v5];
        }
        else if ([v14 dismissalPhase] && v6)
        {
          id v23 = sub_1000140D4();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v35 = "-[WFBannerManager queue_dismissPresentableWithReason:interruptible:forced:]";
            __int16 v36 = 2112;
            __int16 v37 = v14;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s Presenting container is already hinting, no need to initiate hint again: %@", buf, 0x16u);
          }
        }
        else
        {
          objc_initWeak((id *)buf, v12);
          objc_initWeak(&location, self);
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v27[2] = sub_10001B9EC;
          v27[3] = &unk_100038DE8;
          objc_copyWeak(&v30, &location);
          objc_copyWeak(&v31, (id *)buf);
          id v15 = v15;
          __int16 v28 = v15;
          id v25 = v8;
          id v29 = v25;
          BOOL v32 = v5;
          [v14 dismissEmbeddedPlatterWithCompletion:v27 interruptible:v6];
          [(WFBannerManager *)self queue_updatePresentedStatusForRunningContext:v15];
          if (v6)
          {
            __int16 v26 = +[NSString stringWithFormat:@"we just hinted a banner, hint reason: %@", v25];
            [(WFBannerManager *)self queue_updateStateWithReason:v26];
          }
          objc_destroyWeak(&v31);
          objc_destroyWeak(&v30);
          objc_destroyWeak(&location);
          objc_destroyWeak((id *)buf);
        }
LABEL_27:

        goto LABEL_28;
      }
      *(_DWORD *)buf = 136315650;
      v35 = "-[WFBannerManager queue_dismissPresentableWithReason:interruptible:forced:]";
      __int16 v36 = 2112;
      __int16 v37 = v14;
      __int16 v38 = 2112;
      id v39 = v8;
      int v16 = "%s Hinting dismissal of presented banner: %@, reason: %@";
      id v17 = v15;
      uint32_t v18 = 32;
    }
    else
    {
      id v15 = sub_1000140D4();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      *(_DWORD *)buf = 136315138;
      v35 = "-[WFBannerManager queue_dismissPresentableWithReason:interruptible:forced:]";
      int v16 = "%s Non-interruptible dismissal request received while hinting, immediately pushing to poof phase.";
      id v17 = v15;
      uint32_t v18 = 12;
    }
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
    goto LABEL_17;
  }
  id v14 = sub_1000140D4();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v35 = "-[WFBannerManager queue_dismissPresentableWithReason:interruptible:forced:]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s No presentable to dismiss", buf, 0xCu);
  }
LABEL_28:
}

- (void)queue_updateStateWithReason:(id)a3
{
  id v5 = a3;
  BOOL v6 = [(WFBannerManager *)self queue];
  dispatch_assert_queue_V2(v6);

  id v7 = sub_1000140D4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(WFBannerManager *)self pendingRequests];
    id v9 = [(WFBannerManager *)self presentedBanner];
    *(_DWORD *)buf = 136315906;
    v94 = "-[WFBannerManager queue_updateStateWithReason:]";
    __int16 v95 = 2112;
    id v96 = v5;
    __int16 v97 = 2112;
    v98 = v8;
    __int16 v99 = 2112;
    v100 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Updating state because %@. Current requests: %@, Presented banner: %@", buf, 0x2Au);
  }
  dispatch_time_t v10 = [(WFBannerManager *)self presentedBanner];
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      __int16 v11 = v10;
    }
    else {
      __int16 v11 = 0;
    }
  }
  else
  {
    __int16 v11 = 0;
  }
  id v12 = v11;

  id v13 = [(WFBannerManager *)self pendingRequests];
  id v14 = [v13 firstObject];

  if (v14)
  {
    if ([(WFBannerManager *)self isDialogPresentationPaused])
    {
      id v15 = sub_1000140D4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = [(WFBannerManager *)self dialogPresentationPausingReason];
        *(_DWORD *)buf = 136315394;
        v94 = "-[WFBannerManager queue_updateStateWithReason:]";
        __int16 v95 = 2112;
        id v96 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s We've paused dialog request presentation for '%@', as soon as that clears, we'll get back to presenting", buf, 0x16u);
      }
      goto LABEL_108;
    }
    SEL v81 = a2;
    id v17 = v14;
    objc_opt_class();
    int isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      uint32_t v18 = v17;
    }
    else {
      uint32_t v18 = 0;
    }
    id v15 = v18;

    id v19 = v17;
    objc_opt_class();
    LODWORD(v17) = objc_opt_isKindOfClass();
    if (v17) {
      BOOL v20 = v19;
    }
    else {
      BOOL v20 = 0;
    }
    id v21 = v20;

    v92[0] = _NSConcreteStackBlock;
    v92[1] = 3221225472;
    v92[2] = sub_10001C974;
    v92[3] = &unk_100038D70;
    v92[4] = self;
    BOOL v22 = objc_retainBlock(v92);
    if ((v17 & 1) != 0 && [(WFBannerManager *)self presentsApertureStatus])
    {
      id v23 = [(WFBannerManager *)self pendingRequests];
      [v23 removeObjectAtIndex:0];

      ((void (*)(void *, id))v22[2])(v22, v19);
LABEL_107:

      goto LABEL_108;
    }
    __int16 v24 = [(WFBannerManager *)self inflightRequest];

    if (v24)
    {
      id v25 = sub_1000140D4();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v94 = "-[WFBannerManager queue_updateStateWithReason:]";
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s Mid dialog presentation, nothing to do here", buf, 0xCu);
      }

      goto LABEL_107;
    }
    v80 = (void (**)(void, id))v22;
    __int16 v26 = [v12 embeddedPlatter];

    if (isKindOfClass)
    {
      id v27 = [v19 request];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        __int16 v28 = [(WFBannerManager *)self presentedBanner];
        unsigned int v78 = 0;
        if (v28 && !v26)
        {
          id v74 = v28;
          v83 = [v19 context];
          v73 = [(WFBannerManager *)self presentedBanner];
          __int16 v26 = [v73 associatedRunningContext];
          unsigned int v78 = [v83 isEqual:v26];

          __int16 v28 = v74;
        }
      }
      else
      {
        unsigned int v78 = 0;
      }
    }
    else
    {
      unsigned int v78 = 0;
    }
    id v29 = [(WFBannerManager *)self presentedPlatter];
    if (v29)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v30 = v29;
      }
      else {
        id v30 = 0;
      }
    }
    else
    {
      id v30 = 0;
    }
    id v84 = v30;

    id v31 = [(WFBannerManager *)self presentedBanner];
    id v79 = v21;
    if (!v31)
    {
      __int16 v26 = [(WFBannerManager *)self presentedRemoteAlertViewController];
      if (!v26) {
        goto LABEL_52;
      }
    }
    if (![v12 dismissalPhase] && !v84)
    {
      BOOL v32 = [(WFBannerManager *)self runningContextWaitingForFollowUpRequest];
      if (v32) {
        char v33 = 1;
      }
      else {
        char v33 = v78;
      }

      if (v31)
      {

        if ((v33 & 1) == 0) {
          goto LABEL_68;
        }
      }
      else
      {

        if ((v33 & 1) == 0)
        {
LABEL_68:
          id v42 = sub_1000140D4();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v43 = [(WFBannerManager *)self presentedBanner];
            v44 = [(WFBannerManager *)self presentedRemoteAlertViewController];
            *(_DWORD *)buf = 136315650;
            v94 = "-[WFBannerManager queue_updateStateWithReason:]";
            __int16 v95 = 2112;
            id v96 = v43;
            __int16 v97 = 2112;
            v98 = v44;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%s There's already a view on screen (presentedBanner: %@, presentedRemoteAlertViewController: %@) and status isn't visible, nothing to do here", buf, 0x20u);
          }
LABEL_80:
          id v21 = v79;
          BOOL v22 = v80;
LABEL_106:

          goto LABEL_107;
        }
      }
      goto LABEL_62;
    }
    if (!v31) {
LABEL_52:
    }

    if (v84)
    {
      if ((([(WFBannerManager *)self presentsApertureStatus] | v17) & 1) == 0)
      {
        if ((isKindOfClass & 1) == 0
          || ([v19 context],
              v35 = objc_claimAutoreleasedReturnValue(),
              [v84 associatedRunningContext],
              __int16 v36 = objc_claimAutoreleasedReturnValue(),
              unsigned __int8 v75 = [v35 isEqual:v36],
              v36,
              v35,
              (v75 & 1) == 0))
        {
          __int16 v37 = sub_1000140D4();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v94 = "-[WFBannerManager queue_updateStateWithReason:]";
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%s There's requests in the queue, but the status is visible for a different shortcut so it must wait", buf, 0xCu);
          }

          BOOL v22 = v80;
          goto LABEL_106;
        }
      }
      int v34 = 1;
LABEL_63:
      if (((v12 != 0) & isKindOfClass) != 1) {
        goto LABEL_81;
      }
      __int16 v38 = [v15 context];
      [v12 associatedRunningContext];
      char v76 = (char)v17;
      id v17 = v12;
      v40 = int v39 = v34;
      unsigned int v41 = [v38 isEqual:v40];

      int v34 = v39;
      id v12 = v17;
      LOBYTE(v17) = v76;

      if (!v41) {
        goto LABEL_81;
      }
      if (v34)
      {
        if ([(WFBannerManager *)self presentsApertureStatus]) {
          goto LABEL_76;
        }
      }
      else
      {
        uint64_t v45 = [v12 queuedStatusPlatter];
        if (!v45) {
          goto LABEL_76;
        }
        v46 = (void *)v45;
        unsigned __int8 v47 = [(WFBannerManager *)self presentsApertureStatus];

        if (v47) {
          goto LABEL_76;
        }
      }
      v48 = sub_1000140D4();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v94 = "-[WFBannerManager queue_updateStateWithReason:]";
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%s Status is visible, dialog is coming in. Queueing status to come back after dialog.", buf, 0xCu);
      }

      id v49 = [v12 associatedRunningContext];
      [(WFBannerManager *)self queue_enqueuePersistentModeStatusPresentationForRunningContext:v49];

LABEL_76:
      if ([(WFBannerManager *)self queuedDialogIsActionUIRequest:v15])
      {
        char v50 = sub_1000140D4();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v94 = "-[WFBannerManager queue_updateStateWithReason:]";
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%s Action UI is next in the queue, immediately revoking the current presentable.", buf, 0xCu);
        }

        [(WFBannerManager *)self queue_dismissPresentableWithReason:@"platter hinting was interruped by action UI request" interruptible:0 forced:0];
        goto LABEL_80;
      }
LABEL_81:
      long long v51 = [(WFBannerManager *)self pendingRequests];
      [v51 removeObjectAtIndex:0];

      if ((v34 & isKindOfClass) == 1)
      {
        long long v52 = [v15 context];
        long long v53 = [v84 associatedRunningContext];
        unsigned int v54 = [v52 isEqual:v53];

        if (v54)
        {
          v55 = sub_1000140D4();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v94 = "-[WFBannerManager queue_updateStateWithReason:]";
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%s Status is visible, and incoming dialog is from the same run. Removing the status and asking it to come back after", buf, 0xCu);
          }

          [(WFBannerManager *)self queue_dismissPresentableWithReason:@"dialog request came in and should dismiss status for now" interruptible:0 forced:0];
          v56 = [v84 associatedRunningContext];
          [(WFBannerManager *)self queue_enqueuePersistentModeStatusPresentationForRunningContext:v56];
        }
      }
      id v21 = v79;
      if (isKindOfClass)
      {
        v57 = sub_1000140D4();
        BOOL v22 = v80;
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v94 = "-[WFBannerManager queue_updateStateWithReason:]";
          __int16 v95 = 2112;
          id v96 = v19;
          _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "%s Presenting queued dialog: %@", buf, 0x16u);
        }

        [(WFBannerManager *)self setInflightRequest:v19];
        if ([(WFBannerManager *)self queuedDialogIsActionUIRequest:v19])
        {
          __int16 v58 = [v19 request];
          if (v58)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              id v59 = v58;
            }
            else {
              id v59 = 0;
            }
          }
          else
          {
            id v59 = 0;
          }
          id v62 = v59;

          id v86 = objc_alloc((Class)WFActionUserInterfaceListener);
          uint64_t v82 = WFUserInterfaceTypeUIKit;
          id v77 = [v62 actionClassName];
          v63 = [v62 classNamesByType];

          v64 = [v19 request];
          v65 = [v64 attribution];
          id v66 = [v86 initWithUserInterfaceType:v82 actionClassName:v77 classNamesByType:v63 attribution:v65];

          v67 = [v66 actionInterface];
          [v67 setDelegate:self];

          v68 = [v19 context];
          v69 = [v66 actionInterface];
          [v69 setRunningContext:v68];

          [(WFBannerManager *)self setActionUserInterfaceListener:v66];
          id v21 = v79;
          BOOL v22 = v80;
        }
        if ([(WFBannerManager *)self queuedDialogIsActionUIRequest:v19]
          && (+[WFBannerPrototypeSettings sharedSettings],
              v70 = objc_claimAutoreleasedReturnValue(),
              unsigned int v71 = [v70 useRemoteAlertsForActionInterfaceDialogRequests],
              v70,
              v71))
        {
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10001CAC4;
          block[3] = &unk_100038BC0;
          id v90 = v19;
          v91 = self;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
          v72 = v90;
        }
        else
        {
          v87[0] = _NSConcreteStackBlock;
          v87[1] = 3221225472;
          v87[2] = sub_10001CC48;
          v87[3] = &unk_100038D48;
          v87[4] = self;
          id v88 = v19;
          [(WFBannerManager *)self getBannerForQueuedDialogRequest:v88 dialogIsBreakthroughSmartPrompt:v78 completionHandler:v87];
          v72 = v88;
        }
      }
      else
      {
        BOOL v22 = v80;
        if (v17)
        {
          v80[2](v80, v19);
        }
        else
        {
          __int16 v60 = sub_1000140D4();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v94 = "-[WFBannerManager queue_updateStateWithReason:]";
            __int16 v95 = 2112;
            id v96 = v19;
            _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_ERROR, "%s Unsupported request of type: %@", buf, 0x16u);
          }

          v61 = +[NSAssertionHandler currentHandler];
          [v61 handleFailureInMethod:v81 object:self file:@"WFBannerManager.m" lineNumber:780 description:@"Unsupported type in queued requests"];
        }
      }
      goto LABEL_106;
    }
LABEL_62:
    int v34 = 0;
    goto LABEL_63;
  }
  id v15 = sub_1000140D4();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v94 = "-[WFBannerManager queue_updateStateWithReason:]";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s No request in queue, nothing to do here", buf, 0xCu);
  }
LABEL_108:
}

- (void)setRunningPersistentWorkflows:(id)a3
{
}

- (NSMutableDictionary)runningPersistentWorkflows
{
  id v3 = [(WFBannerManager *)self queue];
  dispatch_assert_queue_V2(v3);

  runningPersistentWorkflows = self->_runningPersistentWorkflows;

  return runningPersistentWorkflows;
}

- (void)setPendingRequests:(id)a3
{
}

- (NSMutableOrderedSet)pendingRequests
{
  id v3 = [(WFBannerManager *)self queue];
  dispatch_assert_queue_V2(v3);

  pendingRequests = self->_pendingRequests;

  return pendingRequests;
}

- (void)setInflightRequest:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_inflightRequestLock);
  objc_storeStrong((id *)&self->_inflightRequest, a3);
  os_unfair_lock_unlock(&self->_inflightRequestLock);
  if (!v5)
  {
    BOOL v6 = [(WFBannerManager *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001D968;
    block[3] = &unk_100038C80;
    void block[4] = self;
    dispatch_async(v6, block);
  }
}

- (WFBannerRequest)inflightRequest
{
  p_inflightRequestLock = &self->_inflightRequestLock;
  os_unfair_lock_lock(&self->_inflightRequestLock);
  id v4 = self->_inflightRequest;
  os_unfair_lock_unlock(p_inflightRequestLock);

  return v4;
}

- (void)setPresentedRemoteAlertViewController:(id)a3
{
  id v4 = (UIViewController *)a3;
  os_unfair_lock_lock(&self->_presentedRemoteAlertViewControllerLock);
  presentedRemoteAlertViewController = self->_presentedRemoteAlertViewController;
  self->_presentedRemoteAlertViewController = v4;

  os_unfair_lock_unlock(&self->_presentedRemoteAlertViewControllerLock);
}

- (UIViewController)presentedRemoteAlertViewController
{
  p_presentedRemoteAlertViewControllerLock = &self->_presentedRemoteAlertViewControllerLock;
  os_unfair_lock_lock(&self->_presentedRemoteAlertViewControllerLock);
  id v4 = self->_presentedRemoteAlertViewController;
  os_unfair_lock_unlock(p_presentedRemoteAlertViewControllerLock);

  return v4;
}

- (void)setPresentedBanner:(id)a3
{
  id v4 = (WFBannerPresentable *)a3;
  os_unfair_lock_lock(&self->_presentedBannerLock);
  presentedBanner = self->_presentedBanner;
  self->_presentedBanner = v4;

  os_unfair_lock_unlock(&self->_presentedBannerLock);
}

- (WFBannerPresentable)presentedBanner
{
  p_presentedBannerLock = &self->_presentedBannerLock;
  os_unfair_lock_lock(&self->_presentedBannerLock);
  id v4 = self->_presentedBanner;
  os_unfair_lock_unlock(p_presentedBannerLock);

  return v4;
}

- (void)applicationWillLaunchInForegroundForRunningContext:(id)a3 isLastAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(WFBannerManager *)self presentsApertureStatus]
    && [v7 BOOLValue])
  {
    id v8 = sub_1000140D4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v13 = "-[WFBannerManager applicationWillLaunchInForegroundForRunningContext:isLastAction:]";
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Application will launch during last running action for associated running context: %@", buf, 0x16u);
    }

    id v9 = [(WFBannerManager *)self queue];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001DC98;
    v10[3] = &unk_100038BC0;
    void v10[4] = self;
    id v11 = v6;
    dispatch_async(v9, v10);
  }
}

- (void)updateAttribution:(id)a3 runningContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(WFBannerManager *)self presentsApertureStatus])
  {
    dispatch_time_t v8 = dispatch_time(0, 100000000);
    id v9 = [(WFBannerManager *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001DEE8;
    block[3] = &unk_100038C30;
    void block[4] = self;
    id v11 = v7;
    id v12 = v6;
    dispatch_after(v8, v9, block);
  }
}

- (void)resumeDialogPresentationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(WFBannerManager *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001E124;
  v7[3] = &unk_100038CA8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)pauseDialogPresentationForDuration:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WFBannerManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E268;
  block[3] = &unk_100038CF8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)dismissPresentedContentForRunningContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WFBannerManager *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E3AC;
  block[3] = &unk_100038CF8;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)showDialogRequest:(id)a3 runningContext:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(WFBannerManager *)self queue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001E99C;
  v15[3] = &unk_100038CD0;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(v11, v15);
}

- (void)completePersistentModeWithSuccess:(id)a3 runningContext:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(WFBannerManager *)self queue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001F514;
  v15[3] = &unk_100038CD0;
  id v16 = v9;
  id v17 = v8;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(v11, v15);
}

- (void)beginPersistentModeWithRunningContext:(id)a3 attribution:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(WFBannerManager *)self queue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001F97C;
  v15[3] = &unk_100038CD0;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)removeConnectedHost:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000140D4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[WFBannerManager removeConnectedHost:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Removing connected host: %@", buf, 0x16u);
  }

  id v6 = [(WFBannerManager *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001FF3C;
  v8[3] = &unk_100038BC0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

- (void)addConnectedHost:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000140D4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[WFBannerManager addConnectedHost:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Adding connected host: %@", buf, 0x16u);
  }

  id v6 = [(WFBannerManager *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000203B0;
  v8[3] = &unk_100038BC0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, v8);
}

- (void)dealloc
{
  id v3 = [(WFBannerManager *)self layoutMonitor];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)WFBannerManager;
  [(WFBannerManager *)&v4 dealloc];
}

- (WFBannerManager)init
{
  v26.receiver = self;
  v26.super_class = (Class)WFBannerManager;
  v2 = [(WFBannerManager *)&v26 init];
  id v3 = v2;
  if (v2)
  {
    *(void *)&v2->_presentedBannerLock._os_unfair_lock_opaque = 0;
    v2->_presentedRemoteAlertViewControllerLock._os_unfair_lock_opaque = 0;
    objc_super v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.shortcuts.WFBannerManager", v5);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v6;

    uint64_t v8 = objc_opt_new();
    pendingRequests = v3->_pendingRequests;
    v3->_pendingRequests = (NSMutableOrderedSet *)v8;

    uint64_t v10 = objc_opt_new();
    runningPersistentWorkflows = v3->_runningPersistentWorkflows;
    v3->_runningPersistentWorkflows = (NSMutableDictionary *)v10;

    __int16 v12 = (FBSDisplayMonitor *)objc_alloc_init((Class)FBSDisplayMonitor);
    displayMonitor = v3->_displayMonitor;
    v3->_displayMonitor = v12;

    v3->_shouldObserveDisplayLayout = 0;
    id v14 = (NSHashTable *)[objc_alloc((Class)NSHashTable) initWithOptions:5 capacity:2];
    connectedHosts = v3->_connectedHosts;
    v3->_connectedHosts = v14;

    uint64_t v16 = objc_opt_new();
    singleStepHomeScreenRevokeTimers = v3->_singleStepHomeScreenRevokeTimers;
    v3->_singleStepHomeScreenRevokeTimers = (NSMutableDictionary *)v16;

    objc_initWeak(&location, v3);
    id v18 = objc_alloc((Class)UISCurrentUserInterfaceStyleValue);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100020784;
    v23[3] = &unk_100038B98;
    objc_copyWeak(&v24, &location);
    id v19 = (UISCurrentUserInterfaceStyleValue *)[v18 initWithChangesDeliveredOnQueue:0 toBlock:v23];
    userInterfaceStyleValue = v3->_userInterfaceStyleValue;
    v3->_userInterfaceStyleValue = v19;

    id v21 = v3;
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v3;
}

@end