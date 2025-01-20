@interface CSFullscreenNotificationViewController
- (BOOL)dismissNotificationInLongLookAnimated:(BOOL)a3;
- (BOOL)handleEvent:(id)a3;
- (BOOL)isNotificationContentExtensionVisible:(id)a3;
- (BOOL)isPresentingNotificationInLongLook;
- (BOOL)wouldHandleButtonEvent:(id)a3;
- (CSFullscreenNotificationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CSFullscreenNotificationViewController)initWithNotificationRequest:(id)a3;
- (CSNotificationDispatcher)dispatcher;
- (NCNotificationRequest)notificationRequest;
- (int64_t)presentationPriority;
- (int64_t)presentationType;
- (void)_dismissFromSignificantUserInteraction;
- (void)_handleAction:(id)a3 withName:(id)a4;
- (void)_handleDismissAction;
- (void)_handlePrimaryAction;
- (void)_handleSecondaryAction;
- (void)_handleSilenceAction;
- (void)_lockButtonPressed:(id)a3;
- (void)_silencingHardwareButtonPressed:(id)a3;
- (void)aggregateAppearance:(id)a3;
- (void)aggregateBehavior:(id)a3;
- (void)dealloc;
- (void)handlePrimaryActionForView:(id)a3;
- (void)handleSecondaryActionForView:(id)a3;
- (void)loadView;
- (void)noteDidDismissProgrammatically;
- (void)postNotificationRequest:(id)a3;
- (void)setDispatcher:(id)a3;
- (void)updateNotificationRequest:(id)a3;
- (void)withdrawNotificationRequest:(id)a3;
@end

@implementation CSFullscreenNotificationViewController

- (CSFullscreenNotificationViewController)initWithNotificationRequest:(id)a3
{
  return [(CSFullscreenNotificationViewController *)self initWithNibName:0 bundle:0];
}

- (CSFullscreenNotificationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CSFullscreenNotificationViewController;
  v4 = [(CSCoverSheetViewControllerBase *)&v7 initWithNibName:0 bundle:0];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v4 selector:sel__lockButtonPressed_ name:*MEMORY[0x1E4FA7A70] object:0];
    [v5 addObserver:v4 selector:sel__silencingHardwareButtonPressed_ name:*MEMORY[0x1E4FA7A98] object:0];
    [v5 addObserver:v4 selector:sel__silencingHardwareButtonPressed_ name:*MEMORY[0x1E4FA7AE0] object:0];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CSFullscreenNotificationViewController;
  [(CSCoverSheetViewControllerBase *)&v4 dealloc];
}

- (void)loadView
{
  OUTLINED_FUNCTION_3_1();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(&dword_1D839D000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)noteDidDismissProgrammatically
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = v3;
    uint64_t v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    uint64_t v7 = [(NCNotificationRequest *)self->_request notificationIdentifier];
    uint64_t v8 = objc_msgSend(v7, "un_logDigest");
    int v9 = 138543618;
    v10 = v6;
    __int16 v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_1D839D000, v4, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ received notice of programmatic dismissal for notification %{public}@", (uint8_t *)&v9, 0x16u);
  }
  [(CSFullscreenNotificationViewController *)self _handleDismissAction];
}

- (void)_handlePrimaryAction
{
}

- (void)_handleSecondaryAction
{
}

- (void)_handleDismissAction
{
}

- (void)_handleSilenceAction
{
}

- (void)_handleAction:(id)a3 withName:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)*MEMORY[0x1E4FB3750];
  BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      v10 = v8;
      __int16 v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      uint64_t v13 = [(NCNotificationRequest *)self->_request notificationIdentifier];
      v14 = objc_msgSend(v13, "un_logDigest");
      *(_DWORD *)buf = 138543874;
      v26 = v12;
      __int16 v27 = 2114;
      id v28 = v7;
      __int16 v29 = 2114;
      v30 = v14;
      _os_log_impl(&dword_1D839D000, v10, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ performing %{public}@ action for notification %{public}@", buf, 0x20u);
    }
    v15 = [(CSFullscreenNotificationViewController *)self dispatcher];
    request = self->_request;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __65__CSFullscreenNotificationViewController__handleAction_withName___block_invoke;
    v22[3] = &unk_1E6AD8EC8;
    id v23 = v6;
    v24 = self;
    [v15 destination:self performAction:v23 forNotificationRequest:request requestAuthentication:1 withParameters:0 completion:v22];
  }
  else
  {
    if (v9)
    {
      v17 = v8;
      v18 = (objc_class *)objc_opt_class();
      v19 = NSStringFromClass(v18);
      v20 = [(NCNotificationRequest *)self->_request notificationIdentifier];
      v21 = objc_msgSend(v20, "un_logDigest");
      *(_DWORD *)buf = 138543874;
      v26 = v19;
      __int16 v27 = 2114;
      id v28 = v7;
      __int16 v29 = 2114;
      v30 = v21;
      _os_log_impl(&dword_1D839D000, v17, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ skipping performing %{public}@ action for notification %{public}@ because it is nil", buf, 0x20u);
    }
    [(CSFullscreenNotificationViewController *)self _dismissFromSignificantUserInteraction];
  }
}

uint64_t __65__CSFullscreenNotificationViewController__handleAction_withName___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) shouldDismissNotification];
  if (result)
  {
    v3 = *(void **)(a1 + 40);
    return [v3 _dismissFromSignificantUserInteraction];
  }
  return result;
}

- (void)_silencingHardwareButtonPressed:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = v4;
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    uint64_t v8 = [(NCNotificationRequest *)self->_request notificationIdentifier];
    BOOL v9 = objc_msgSend(v8, "un_logDigest");
    int v10 = 138543618;
    __int16 v11 = v7;
    __int16 v12 = 2114;
    uint64_t v13 = v9;
    _os_log_impl(&dword_1D839D000, v5, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ received hardware button pressed event for notification %{public}@", (uint8_t *)&v10, 0x16u);
  }
  [(CSFullscreenNotificationViewController *)self _handleSilenceAction];
}

- (void)_lockButtonPressed:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = v4;
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    uint64_t v8 = [(NCNotificationRequest *)self->_request notificationIdentifier];
    BOOL v9 = objc_msgSend(v8, "un_logDigest");
    int v10 = 138543618;
    __int16 v11 = v7;
    __int16 v12 = 2114;
    uint64_t v13 = v9;
    _os_log_impl(&dword_1D839D000, v5, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ received lock button pressed event for notification %{public}@", (uint8_t *)&v10, 0x16u);
  }
  [(CSFullscreenNotificationViewController *)self _handlePrimaryAction];
}

- (int64_t)presentationType
{
  return 2;
}

- (int64_t)presentationPriority
{
  return 520;
}

- (void)aggregateAppearance:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CSFullscreenNotificationViewController;
  id v3 = a3;
  [(CSModalViewControllerBase *)&v12 aggregateAppearance:v3];
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = objc_msgSend(v4, "hidden:", 0, v12.receiver, v12.super_class);
  id v6 = [v5 vibrantAndCentered:1];
  id v7 = [v6 hidesTime:0];
  uint64_t v8 = [v7 priority:40];
  [v3 addComponent:v8];

  BOOL v9 = objc_opt_new();
  int v10 = [v9 priority:40];
  __int16 v11 = [v10 hidden:1];
  [v3 addComponent:v11];
}

- (void)aggregateBehavior:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSFullscreenNotificationViewController;
  id v3 = a3;
  [(CSModalViewControllerBase *)&v4 aggregateBehavior:v3];
  objc_msgSend(v3, "removeRestrictedCapabilities:", 2, v4.receiver, v4.super_class);
  [v3 addRestrictedCapabilities:16781312];
  [v3 setIdleTimerMode:1];
  [v3 setIdleTimerDuration:9];
  [v3 setIdleWarnMode:2];
}

- (BOOL)handleEvent:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CSFullscreenNotificationViewController;
  if (![(CSCoverSheetViewControllerBase *)&v15 handleEvent:v4]
    || ([v4 isConsumable] & 1) == 0)
  {
    uint64_t v5 = [v4 type];
    if (v5 != 27 && v5 != 9)
    {
      char v13 = 0;
      goto LABEL_10;
    }
    id v6 = (void *)*MEMORY[0x1E4FB3750];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      uint64_t v8 = (objc_class *)objc_opt_class();
      BOOL v9 = NSStringFromClass(v8);
      int v10 = NSStringFromCoverSheetEventType([v4 type]);
      __int16 v11 = [(NCNotificationRequest *)self->_request notificationIdentifier];
      objc_super v12 = objc_msgSend(v11, "un_logDigest");
      *(_DWORD *)buf = 138543874;
      v17 = v9;
      __int16 v18 = 2114;
      v19 = v10;
      __int16 v20 = 2114;
      v21 = v12;
      _os_log_impl(&dword_1D839D000, v7, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ received %{public}@ event for notification %{public}@", buf, 0x20u);
    }
    [(CSFullscreenNotificationViewController *)self _handleDismissAction];
  }
  char v13 = [v4 isConsumable];
LABEL_10:

  return v13;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  uint64_t v3 = [a3 type];
  return v3 == 27 || v3 == 9;
}

- (void)handlePrimaryActionForView:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = v4;
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    uint64_t v8 = [(NCNotificationRequest *)self->_request notificationIdentifier];
    BOOL v9 = objc_msgSend(v8, "un_logDigest");
    int v10 = 138543618;
    __int16 v11 = v7;
    __int16 v12 = 2114;
    char v13 = v9;
    _os_log_impl(&dword_1D839D000, v5, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ received primary button tap event for notification %{public}@", (uint8_t *)&v10, 0x16u);
  }
  [(CSFullscreenNotificationViewController *)self _handlePrimaryAction];
}

- (void)handleSecondaryActionForView:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = v4;
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    uint64_t v8 = [(NCNotificationRequest *)self->_request notificationIdentifier];
    BOOL v9 = objc_msgSend(v8, "un_logDigest");
    int v10 = 138543618;
    __int16 v11 = v7;
    __int16 v12 = 2114;
    char v13 = v9;
    _os_log_impl(&dword_1D839D000, v5, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ received secondary button tap event for notification %{public}@", (uint8_t *)&v10, 0x16u);
  }
  [(CSFullscreenNotificationViewController *)self _handleSecondaryAction];
}

- (void)postNotificationRequest:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_request = &self->_request;
  if (self->_request)
  {
    v26 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_request == nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[CSFullscreenNotificationViewController postNotificationRequest:]();
    }
    [v26 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8492E64);
  }
  id v7 = v5;
  NSClassFromString(&cfstr_Ncnotification_0.isa);
  if (!v7)
  {
    __int16 v27 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_bs_assert_object != nil"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[CSFullscreenNotificationViewController postNotificationRequest:]();
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8492EC8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v28 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"[_bs_assert_object isKindOfClass:NCNotificationRequestClass]"];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[CSFullscreenNotificationViewController postNotificationRequest:]();
    }
    [v28 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D8492F2CLL);
  }

  uint64_t v8 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v9 = v8;
    int v10 = (objc_class *)objc_opt_class();
    __int16 v11 = NSStringFromClass(v10);
    __int16 v12 = [v7 notificationIdentifier];
    char v13 = objc_msgSend(v12, "un_logDigest");
    *(_DWORD *)buf = 138543618;
    v30 = v11;
    __int16 v31 = 2114;
    v32 = v13;
    _os_log_impl(&dword_1D839D000, v9, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ presenting notification %{public}@", buf, 0x16u);
  }
  objc_storeStrong((id *)&self->_request, a3);
  uint64_t v14 = [v7 supplementaryActions];
  objc_super v15 = [v14 objectForKey:*MEMORY[0x1E4FB3740]];

  if ([v15 count])
  {
    v16 = [v15 objectAtIndex:0];
    primaryAction = self->_primaryAction;
    self->_primaryAction = v16;
  }
  if ((unint64_t)[v15 count] >= 2)
  {
    __int16 v18 = [v15 objectAtIndex:1];
    secondaryAction = self->_secondaryAction;
    self->_secondaryAction = v18;
  }
  if (!self->_primaryAction)
  {
    objc_storeStrong((id *)&self->_primaryAction, self->_secondaryAction);
    __int16 v20 = [(NCNotificationRequest *)*p_request clearAction];
    v21 = self->_secondaryAction;
    self->_secondaryAction = v20;
  }
  uint64_t v22 = [(NCNotificationRequest *)*p_request silenceAction];
  silenceAction = self->_silenceAction;
  self->_silenceAction = v22;

  v24 = [(NCNotificationRequest *)*p_request clearAction];
  dismissAction = self->_dismissAction;
  self->_dismissAction = v24;
}

- (void)updateNotificationRequest:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    id v6 = a3;
    id v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    BOOL v9 = [v6 notificationIdentifier];

    int v10 = objc_msgSend(v9, "un_logDigest");
    int v11 = 138543618;
    __int16 v12 = v8;
    __int16 v13 = 2114;
    uint64_t v14 = v10;
    _os_log_impl(&dword_1D839D000, v5, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ does not support updating notification %{public}@", (uint8_t *)&v11, 0x16u);
  }
}

- (void)withdrawNotificationRequest:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    id v6 = a3;
    id v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    BOOL v9 = [v6 notificationIdentifier];

    int v10 = objc_msgSend(v9, "un_logDigest");
    int v11 = 138543618;
    __int16 v12 = v8;
    __int16 v13 = 2114;
    uint64_t v14 = v10;
    _os_log_impl(&dword_1D839D000, v5, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ withdrawing notification %{public}@", (uint8_t *)&v11, 0x16u);
  }
}

- (BOOL)isNotificationContentExtensionVisible:(id)a3
{
  return 0;
}

- (BOOL)isPresentingNotificationInLongLook
{
  return 0;
}

- (BOOL)dismissNotificationInLongLookAnimated:(BOOL)a3
{
  return 0;
}

- (void)_dismissFromSignificantUserInteraction
{
  uint64_t v3 = +[CSAction actionWithType:4];
  [(CSCoverSheetViewControllerBase *)self sendAction:v3];

  [(CSCoverSheetViewControllerBase *)self dismiss];
}

- (NCNotificationRequest)notificationRequest
{
  return self->_request;
}

- (CSNotificationDispatcher)dispatcher
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dispatcher);

  return (CSNotificationDispatcher *)WeakRetained;
}

- (void)setDispatcher:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dispatcher);
  objc_storeStrong((id *)&self->_dismissAction, 0);
  objc_storeStrong((id *)&self->_silenceAction, 0);
  objc_storeStrong((id *)&self->_secondaryAction, 0);
  objc_storeStrong((id *)&self->_primaryAction, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

- (void)postNotificationRequest:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_6(&dword_1D839D000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

- (void)postNotificationRequest:.cold.3()
{
  OUTLINED_FUNCTION_3_1();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_4_0();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(&dword_1D839D000, MEMORY[0x1E4F14500], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);
}

@end