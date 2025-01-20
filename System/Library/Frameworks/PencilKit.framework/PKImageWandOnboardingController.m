@interface PKImageWandOnboardingController
+ (BOOL)canShowOnboardingView;
+ (void)resetOnboarding;
- (BOOL)imageWandOnboardingControllerCanBecomeFirstResponder:(id)a3;
- (id)initWithPresentationViewController:(void *)a3 toolPicker:;
- (uint64_t)showOnboardingViewAfterDelay:(uint64_t)result;
- (void)_dismissOnboardingView;
- (void)_stopObservingToolPickerWillShowNotification;
- (void)imageWandOnboardingControllerIsBeingDismissed:(id)a3;
- (void)imageWandOnboardingControllerViewDidAppear:(id)a3 animated:(BOOL)a4;
- (void)keyboardSceneDelegate:(id)a3 inputViewSetVisibilityDidChange:(BOOL)a4 includedReset:(BOOL)a5;
- (void)pencilInteraction:(id)a3 didReceiveSqueeze:(id)a4;
- (void)showOnboardingView;
@end

@implementation PKImageWandOnboardingController

- (id)initWithPresentationViewController:(void *)a3 toolPicker:
{
  id v5 = a2;
  id v6 = a3;
  if (!a1) {
    goto LABEL_8;
  }
  v18.receiver = a1;
  v18.super_class = (Class)PKImageWandOnboardingController;
  v7 = (id *)objc_msgSendSuper2(&v18, sel_init);
  a1 = v7;
  if (!v7) {
    goto LABEL_8;
  }
  if (!v5)
  {
    v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3B8];
    goto LABEL_11;
  }
  if (!v6)
  {
    v14 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v15 = *MEMORY[0x1E4F1C3B8];
LABEL_11:
    id v17 = [v14 exceptionWithName:v15 reason:v16 userInfo:0];
    objc_exception_throw(v17);
  }
  objc_storeWeak(v7 + 1, v5);
  objc_storeWeak(a1 + 2, v6);
  v8 = objc_alloc_init(PKImageWandOnboarding);
  id v9 = a1[3];
  a1[3] = v8;

  v10 = (void *)__instances;
  if (!__instances)
  {
    uint64_t v11 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    v12 = (void *)__instances;
    __instances = v11;

    v10 = (void *)__instances;
  }
  [v10 addObject:a1];
LABEL_8:

  return a1;
}

+ (BOOL)canShowOnboardingView
{
  v2 = +[PKInternalSettings sharedInstance]();
  char v3 = -[PKInternalSettings imageWandOnboardingDisabled]((uint64_t)v2);

  if (v3) {
    return 0;
  }
  id v5 = +[PKInternalSettings sharedInstance]();
  char v6 = -[PKInternalSettings forceShowImageWandOnboarding]((uint64_t)v5);

  if (v6) {
    return 1;
  }
  else {
    return +[PKImageWandOnboarding hasSeenOnboardingUI]() ^ 1;
  }
}

+ (void)resetOnboarding
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = os_log_create("com.apple.pencilkit", "PKImageWandOnboardingController");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEFAULT, "reset onboarding", buf, 2u);
  }

  +[PKImageWandOnboarding setHasSeenOnboardingUI:]((uint64_t)PKImageWandOnboarding, 0);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = (id)__instances;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[PKImageWandOnboardingController _dismissOnboardingView](*(void *)(*((void *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_dismissOnboardingView
{
  if (a1 && *(unsigned char *)(a1 + 32))
  {
    -[PKImageWandOnboardingController _stopObservingToolPickerWillShowNotification](a1);
    *(unsigned char *)(a1 + 32) = 0;
    v2 = os_log_create("com.apple.pencilkit", "PKImageWandOnboardingController");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEFAULT, "hide onboarding", v4, 2u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    [WeakRetained dismissModalViewControllerWithTransition:7];
  }
}

- (uint64_t)showOnboardingViewAfterDelay:(uint64_t)result
{
  if (result)
  {
    id v3 = (void *)result;
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:v3 selector:sel_showOnboardingView object:v3];
    return [v3 performSelector:sel_showOnboardingView withObject:0 afterDelay:a2];
  }
  return result;
}

- (void)showOnboardingView
{
  if ([(id)objc_opt_class() canShowOnboardingView])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_toolPicker);
    [WeakRetained setKeyboardSceneDelegateVisibilityObserver:self];

    +[PKImageWandOnboarding setHasSeenOnboardingUI:]((uint64_t)PKImageWandOnboarding, 1);
    uint64_t v4 = objc_alloc_init(PKImageWandOnboardingViewController);
    os_log_t p_super = &v4->super.super.super.super.super;
    if (v4) {
      objc_storeWeak((id *)&v4->_delegate, self);
    }
    [MEMORY[0x1E4F83AF8] preferredContentSize];
    double v7 = v6;
    double v9 = v8;
    long long v10 = [p_super view];
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

    long long v11 = [p_super view];
    v12 = [v11 widthAnchor];
    v13 = [v12 constraintEqualToConstant:v7];
    [v13 setActive:1];

    uint64_t v14 = [p_super view];
    uint64_t v15 = [v14 heightAnchor];
    v16 = [v15 constraintEqualToConstant:v9];
    [v16 setActive:1];

    id v17 = os_log_create("com.apple.pencilkit", "PKImageWandOnboardingController");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_1C44F8000, v17, OS_LOG_TYPE_DEFAULT, "show onboarding", v19, 2u);
    }

    id v18 = objc_loadWeakRetained((id *)&self->_presentationViewController);
    [v18 presentModalViewController:p_super withTransition:3];
  }
  else
  {
    os_log_t p_super = os_log_create("com.apple.pencilkit", "PKImageWandOnboardingController");
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C44F8000, p_super, OS_LOG_TYPE_DEFAULT, "can't show image wand onboarding view", buf, 2u);
    }
  }
}

- (void)_stopObservingToolPickerWillShowNotification
{
  if (a1)
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    [v3 removeObserver:a1 name:@"PKToolPickerWillShowNotification" object:WeakRetained];
  }
}

- (void)imageWandOnboardingControllerIsBeingDismissed:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_toolPicker);
  [WeakRetained setKeyboardSceneDelegateVisibilityObserver:0];

  id v5 = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 imageWandOnboardingControllerDidHideView:self];
  }
}

- (BOOL)imageWandOnboardingControllerCanBecomeFirstResponder:(id)a3
{
  return 1;
}

- (void)imageWandOnboardingControllerViewDidAppear:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  char v6 = os_log_create("com.apple.pencilkit", "PKImageWandOnboardingController");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C44F8000, v6, OS_LOG_TYPE_DEFAULT, "onboarding view did appear", buf, 2u);
  }

  self->_onboardingViewDidAppear = 1;
  id v7 = objc_alloc_init(MEMORY[0x1E4FB1A80]);
  [v7 setDelegate:self];
  uint64_t v8 = [v5 view];
  [(id)v8 addInteraction:v7];

  [v5 becomeFirstResponder];
  LOBYTE(v8) = [v5 isFirstResponder];

  if (v8)
  {
    -[PKImageWandOnboardingController _stopObservingToolPickerWillShowNotification]((uint64_t)self);
    double v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_toolPicker);
    [v9 addObserver:self selector:sel__toolPickerWillShow_ name:@"PKToolPickerWillShowNotification" object:WeakRetained];
  }
  else
  {
    double v9 = os_log_create("com.apple.pencilkit", "PKImageWandOnboardingController");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v11 = 0;
      _os_log_error_impl(&dword_1C44F8000, v9, OS_LOG_TYPE_ERROR, "failed to become FR", v11, 2u);
    }
  }
}

- (void)keyboardSceneDelegate:(id)a3 inputViewSetVisibilityDidChange:(BOOL)a4 includedReset:(BOOL)a5
{
  id v5 = os_log_create("com.apple.pencilkit", "PKImageWandOnboardingController");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v6 = 0;
    _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEFAULT, "ignored keyboard scene event while onboarding UI is visible", v6, 2u);
  }
}

- (void)pencilInteraction:(id)a3 didReceiveSqueeze:(id)a4
{
  uint64_t v4 = os_log_create("com.apple.pencilkit", "PKImageWandOnboardingController");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "ignored squeeze event while onboarding UI is visible", v5, 2u);
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_imageWandOnboarding, 0);
  objc_destroyWeak((id *)&self->_toolPicker);

  objc_destroyWeak((id *)&self->_presentationViewController);
}

@end