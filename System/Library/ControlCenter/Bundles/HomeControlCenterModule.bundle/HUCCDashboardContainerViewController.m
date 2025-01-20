@interface HUCCDashboardContainerViewController
- (BOOL)_canShowWhileLocked;
- (CGRect)expandedContentFrame;
- (CGSize)preferredExpandedSize;
- (HUCCDashboardContainerViewController)initWithDelegate:(id)a3;
- (HUCCDashboardContainerViewControllerDelegate)delegate;
- (HUCCRemoteDashboardViewController)remoteDashboardViewController;
- (NSDictionary)transitionSubviewFrames;
- (_UIAsyncInvocation)cancelServiceInvocation;
- (id)serviceViewControllerProxy;
- (void)_addNewRemoteViewController:(id)a3;
- (void)_configureAndAddRemoteViewController:(id)a3 forHome:(id)a4;
- (void)_requestRemoteViewControllerForHome:(id)a3;
- (void)_stopAndRemoveRemoteViewController;
- (void)loadView;
- (void)quickControlsPresentationDidUpdate:(BOOL)a3;
- (void)remoteDashboard:(id)a3 viewServiceDidTerminateWithError:(id)a4;
- (void)requestDismissal;
- (void)requestLockAuthenticationForRemoteDashboard:(id)a3;
- (void)setCancelServiceInvocation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRemoteDashboardViewController:(id)a3;
- (void)setTransitionSubviewFrames:(id)a3;
- (void)willBeginTransition:(BOOL)a3 forCompactModule:(BOOL)a4;
- (void)willFinishTransition:(BOOL)a3 forCompactModule:(BOOL)a4;
@end

@implementation HUCCDashboardContainerViewController

- (HUCCDashboardContainerViewController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUCCDashboardContainerViewController;
  v5 = [(HUCCDashboardContainerViewController *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x263F1CB60]);
  objc_msgSend_expandedContentFrame(self, v4, v5);
  objc_super v8 = objc_msgSend_initWithFrame_(v3, v6, v7);
  objc_msgSend_setView_(self, v9, (uint64_t)v8);

  v12 = objc_msgSend_sharedDispatcher(MEMORY[0x263F47B60], v10, v11);
  objc_msgSend_home(v12, v13, v14);
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend__requestRemoteViewControllerForHome_(self, v15, (uint64_t)v16);
}

- (void)willBeginTransition:(BOOL)a3 forCompactModule:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (a3)
  {
    uint64_t v7 = objc_msgSend_view(self, a2, a3);
    v10 = objc_msgSend_remoteDashboardViewController(self, v8, v9);
    v13 = objc_msgSend_view(v10, v11, v12);
    objc_msgSend_addSubview_(v7, v14, (uint64_t)v13);
  }
  objc_msgSend_serviceViewControllerProxy(self, a2, a3);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_willBeginTransition_forCompactModule_(v16, v15, v5, v4);
}

- (void)willFinishTransition:(BOOL)a3 forCompactModule:(BOOL)a4
{
  if (!a3)
  {
    objc_msgSend_remoteDashboardViewController(self, a2, a3, a4);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = objc_msgSend_view(v10, v5, v6);
    objc_msgSend_removeFromSuperview(v7, v8, v9);
  }
}

- (id)serviceViewControllerProxy
{
  id v3 = objc_msgSend_remoteDashboardViewController(self, a2, v2);
  uint64_t v6 = objc_msgSend_serviceViewControllerProxy(v3, v4, v5);

  return v6;
}

- (CGRect)expandedContentFrame
{
  uint64_t v4 = objc_msgSend_currentDevice(MEMORY[0x263F1C5C0], a2, v2);
  uint64_t v7 = objc_msgSend_userInterfaceIdiom(v4, v5, v6);

  objc_msgSend_preferredExpandedSize(self, v8, v9);
  double v13 = v12;
  if (v7 == 1)
  {
    CCUIExpandedModuleEdgeInsets();
    double v13 = v13 + v14 * 2.0;
    objc_msgSend_preferredExpandedSize(self, v15, v16);
    double v18 = v17;
    CCUIExpandedModuleEdgeInsets();
    double v20 = v18 + v19 * -4.0;
  }
  else
  {
    objc_msgSend_preferredExpandedSize(self, v10, v11);
    double v20 = v21;
  }
  double v22 = 0.0;
  double v23 = 0.0;
  double v24 = v13;
  result.size.height = v20;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGSize)preferredExpandedSize
{
  id v3 = objc_msgSend_currentDevice(MEMORY[0x263F1C5C0], a2, v2);
  uint64_t v6 = objc_msgSend_userInterfaceIdiom(v3, v4, v5);

  if (v6 == 1)
  {
    CCUIDefaultExpandedContentModuleWidth();
    CGFloat Width = v7;
    CCUIMaximumExpandedContentModuleHeight();
  }
  else
  {
    CCUIScreenBounds();
    CGFloat Width = CGRectGetWidth(v13);
    CCUIScreenBounds();
    double Height = CGRectGetHeight(v14);
  }
  double v10 = Height;
  double v11 = Width;
  result.height = v10;
  result.width = v11;
  return result;
}

- (void)_requestRemoteViewControllerForHome:(id)a3
{
  id v4 = a3;
  objc_msgSend__beginDelayingPresentation_cancellationHandler_(self, v5, (uint64_t)&unk_26F4C8080, 5.0);
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_240668AA0;
  v10[3] = &unk_2650CC2D0;
  objc_copyWeak(&v12, &location);
  id v6 = v4;
  id v11 = v6;
  objc_super v8 = objc_msgSend_requestViewControllerWithConnectionHandler_(HUCCRemoteDashboardViewController, v7, (uint64_t)v10);
  objc_msgSend_setCancelServiceInvocation_(self, v9, (uint64_t)v8);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_configureAndAddRemoteViewController:(id)a3 forHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  id v8 = v6;
  if (objc_opt_isKindOfClass()) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    objc_msgSend__addNewRemoteViewController_(self, v11, (uint64_t)v10);
    CGRect v14 = objc_msgSend_serviceViewControllerProxy(self, v12, v13);
    double v17 = objc_msgSend_uniqueIdentifier(v7, v15, v16);
    double v20 = objc_msgSend_UUIDString(v17, v18, v19);
    objc_msgSend_configureHomeControlServiceWithHomeUUID_(v14, v21, (uint64_t)v20);

    objc_initWeak(&location, self);
    double v24 = objc_msgSend_serviceViewControllerProxy(self, v22, v23);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = sub_240668CF4;
    v26[3] = &unk_2650CC2F8;
    objc_copyWeak(&v27, &location);
    objc_msgSend_getTransitionSubviewFramesWithCompletion_(v24, v25, (uint64_t)v26);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  else
  {
    NSLog(&cfstr_UnexpectedRemo.isa, v8);
  }
}

- (void)_stopAndRemoveRemoteViewController
{
  id v4 = objc_msgSend_remoteDashboardViewController(self, a2, v2);

  if (v4)
  {
    id v7 = objc_msgSend_remoteDashboardViewController(self, v5, v6);
    objc_msgSend_beginAppearanceTransition_animated_(v7, v8, 0, 0);

    id v11 = objc_msgSend_remoteDashboardViewController(self, v9, v10);
    objc_msgSend_willMoveToParentViewController_(v11, v12, 0);

    v15 = objc_msgSend_remoteDashboardViewController(self, v13, v14);
    double v18 = objc_msgSend_view(v15, v16, v17);
    objc_msgSend_removeFromSuperview(v18, v19, v20);

    uint64_t v23 = objc_msgSend_remoteDashboardViewController(self, v21, v22);
    id v26 = (id)objc_msgSend_disconnect(v23, v24, v25);

    v29 = objc_msgSend_remoteDashboardViewController(self, v27, v28);
    objc_msgSend_removeFromParentViewController(v29, v30, v31);

    v34 = objc_msgSend_remoteDashboardViewController(self, v32, v33);
    objc_msgSend_endAppearanceTransition(v34, v35, v36);

    objc_msgSend_setRemoteDashboardViewController_(self, v37, 0);
  }
}

- (void)_addNewRemoteViewController:(id)a3
{
  id v4 = a3;
  objc_msgSend__stopAndRemoveRemoteViewController(self, v5, v6);
  objc_msgSend_setRemoteDashboardViewController_(self, v7, (uint64_t)v4);

  uint64_t v10 = objc_msgSend_remoteDashboardViewController(self, v8, v9);
  objc_msgSend_setDelegate_(v10, v11, (uint64_t)self);

  uint64_t v14 = objc_msgSend_remoteDashboardViewController(self, v12, v13);
  objc_msgSend_beginAppearanceTransition_animated_(v14, v15, 1, 0);

  double v18 = objc_msgSend_remoteDashboardViewController(self, v16, v17);
  objc_msgSend_addChildViewController_(self, v19, (uint64_t)v18);

  uint64_t v22 = objc_msgSend_view(self, v20, v21);
  objc_msgSend_bounds(v22, v23, v24);
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  v35 = objc_msgSend_remoteDashboardViewController(self, v33, v34);
  v38 = objc_msgSend_view(v35, v36, v37);
  objc_msgSend_setFrame_(v38, v39, v40, v26, v28, v30, v32);

  v43 = objc_msgSend_remoteDashboardViewController(self, v41, v42);
  v46 = objc_msgSend_view(v43, v44, v45);
  objc_msgSend_setAutoresizingMask_(v46, v47, 18);

  v50 = objc_msgSend_remoteDashboardViewController(self, v48, v49);
  objc_msgSend_didMoveToParentViewController_(v50, v51, (uint64_t)self);

  objc_msgSend_remoteDashboardViewController(self, v52, v53);
  id v56 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endAppearanceTransition(v56, v54, v55);
}

- (void)remoteDashboard:(id)a3 viewServiceDidTerminateWithError:(id)a4
{
  id v5 = a4;
  uint64_t v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_240676200((uint64_t)v5, v6);
  }

  objc_msgSend_setRemoteDashboardViewController_(self, v7, 0);
}

- (void)requestDismissal
{
  objc_msgSend_delegate(self, a2, v2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestDismissal(v5, v3, v4);
}

- (void)requestLockAuthenticationForRemoteDashboard:(id)a3
{
  uint64_t v4 = objc_msgSend_delegate(self, a2, (uint64_t)a3);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_24066912C;
  v6[3] = &unk_2650CC320;
  v6[4] = self;
  objc_msgSend_requestAuthenticationIfLockedWithCompletionHandler_(v4, v5, (uint64_t)v6);
}

- (void)quickControlsPresentationDidUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  objc_msgSend_delegate(self, a2, a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_quickControlsPresentationDidUpdate_(v5, v4, v3);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSDictionary)transitionSubviewFrames
{
  return self->_transitionSubviewFrames;
}

- (void)setTransitionSubviewFrames:(id)a3
{
}

- (HUCCRemoteDashboardViewController)remoteDashboardViewController
{
  return self->_remoteDashboardViewController;
}

- (void)setRemoteDashboardViewController:(id)a3
{
}

- (_UIAsyncInvocation)cancelServiceInvocation
{
  return self->_cancelServiceInvocation;
}

- (void)setCancelServiceInvocation:(id)a3
{
}

- (HUCCDashboardContainerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUCCDashboardContainerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cancelServiceInvocation, 0);
  objc_storeStrong((id *)&self->_remoteDashboardViewController, 0);

  objc_storeStrong((id *)&self->_transitionSubviewFrames, 0);
}

@end