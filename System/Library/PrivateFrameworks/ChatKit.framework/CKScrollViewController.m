@interface CKScrollViewController
+ (id)scrollGeometryUpdaterLogHandle;
- (BOOL)enableContentPinning;
- (BOOL)isHoldingScrollGeometryUpdates;
- (BOOL)isKeyboardFloating;
- (BOOL)isKeyboardOnscreenWithoutAccessoryView;
- (BOOL)isKeyboardUndocked;
- (BOOL)isKeyboardVisible;
- (BOOL)isUsingVisibleInputViewHeightWhenUpdatingScrollGeometry;
- (BOOL)keyboardInteractionCancelled;
- (BOOL)manuallyUpdateKeyboardScreenFrameWithFrameIfNeeded:(CGRect)a3 animationDuration:(double)a4 animationCurve:(int64_t)a5;
- (BOOL)scrollGeometryContentInsetIsUpdatingForReasons:(id)a3 followingHoldForReason:(id)a4 withAnimationProperties:(id)a5;
- (BOOL)shouldIgnoreKeyboardAnimationDuration;
- (BOOL)shouldUpdateScrollPositionForKeyboardScreenFrameChanges;
- (BOOL)topInsetIncludesPalette;
- (CGRect)inputAccessoryViewFrameForFloatingKeyboard;
- (CGRect)keyboardFrameInViewCoordinates;
- (CGRect)keyboardScreenFrame;
- (CGRect)screenFrameForNotification:(id)a3;
- (CGSize)contentSizeForPinning;
- (CKScrollViewAnimationProperties)activeKeyboardAppearanceAnimationProperties;
- (CKScrollViewController)init;
- (IMReasonTrackingUpdater)scrollGeometryUpdater;
- (UIEdgeInsets)_calculateContentInsets;
- (UIEdgeInsets)bannerInsets;
- (UIEdgeInsets)macToolbarInsets;
- (UIEdgeInsets)navigationBarInsets;
- (UIEdgeInsets)navigationBarInsetsWithoutPalette;
- (UIScrollView)scrollView;
- (double)_bottomRotatingFooterHeight;
- (double)_visibleKeyboardHeight;
- (double)accessoryViewHeight;
- (double)bottomInsetPadding;
- (double)bottomInsetWithoutAccessoryView;
- (double)contentPinningThreshold;
- (double)minimumBottomInset;
- (double)topInsetPadding;
- (double)visibleHeightAboveKeyboard;
- (id)scrollGeometryUpdaterLogHandle;
- (void)_changedStatusBarFrame:(id)a3;
- (void)_entryViewWillRotate:(id)a3;
- (void)_keyboardWillShowOrHide:(id)a3;
- (void)_updateKeyboardScreenFrameForShowOrHideWithNewScreenFrame:(CGRect)a3 previousFrame:(CGRect)a4 duration:(double)a5 animationCurve:(int64_t)a6 isShowEvent:(BOOL)a7;
- (void)_visibleKeyboardHeight;
- (void)beginHoldingScrollGeometryUpdatesForReason:(id)a3;
- (void)endHoldingScrollGeometryUpdatesForReason:(id)a3;
- (void)inputAccessoryViewFrameUpdatedForFloatingKeyboard;
- (void)keyboardDidChangeFrame:(id)a3;
- (void)keyboardDidHide:(id)a3;
- (void)keyboardDidShow:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)primeWithKeyboardFrame:(CGRect)a3;
- (void)reasonTrackingUpdater:(id)a3 didBeginHoldingUpdatesWithInitialReason:(id)a4;
- (void)reasonTrackingUpdater:(id)a3 didEndHoldingUpdatesWithFinalReason:(id)a4;
- (void)reasonTrackingUpdater:(id)a3 needsUpdateForReasons:(id)a4 followingHoldForReason:(id)a5;
- (void)scrollGeometryIsUpdatingForReasons:(id)a3 followingHoldForReason:(id)a4;
- (void)scrollWithDuration:(double)a3 animationCurve:(int64_t)a4 scrollBlock:(id)a5;
- (void)setActiveKeyboardAppearanceAnimationProperties:(id)a3;
- (void)setContentPinningThreshold:(double)a3;
- (void)setEnableContentPinning:(BOOL)a3;
- (void)setKeyboardInteractionCancelled:(BOOL)a3;
- (void)setKeyboardScreenFrame:(CGRect)a3;
- (void)setKeyboardVisible:(BOOL)a3;
- (void)setScrollGeometryUpdater:(id)a3;
- (void)updateScrollGeometryForReason:(id)a3 withDuration:(double)a4 animationCurve:(int64_t)a5;
- (void)updateScrollGeometryWithInheritedAnimationForReason:(id)a3;
- (void)updateScrollGeometryWithoutAnimationForReason:(id)a3;
- (void)viewSafeAreaInsetsDidChange;
@end

@implementation CKScrollViewController

- (CKScrollViewController)init
{
  v8.receiver = self;
  v8.super_class = (Class)CKScrollViewController;
  v2 = [(CKScrollViewController *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_keyboardWillShow_ name:*MEMORY[0x1E4F43B88] object:0];
    [v3 addObserver:v2 selector:sel_keyboardWillHide_ name:*MEMORY[0x1E4F43B80] object:0];
    [v3 addObserver:v2 selector:sel_keyboardDidShow_ name:*MEMORY[0x1E4F43AC8] object:0];
    [v3 addObserver:v2 selector:sel_keyboardDidHide_ name:*MEMORY[0x1E4F43AC0] object:0];
    [v3 addObserver:v2 selector:sel_keyboardDidChangeFrame_ name:*MEMORY[0x1E4F43AB8] object:0];
    [v3 addObserver:v2 selector:sel__changedStatusBarFrame_ name:*MEMORY[0x1E4F43650] object:0];
    [v3 addObserver:v2 selector:sel__entryViewWillRotate_ name:*MEMORY[0x1E4F439C8] object:0];
    v4 = [(CKScrollViewController *)v2 scrollGeometryUpdaterLogHandle];
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F6E900]) initWithLogHandle:v4 delegate:v2];
    scrollGeometryUpdater = v2->_scrollGeometryUpdater;
    v2->_scrollGeometryUpdater = (IMReasonTrackingUpdater *)v5;
  }
  return v2;
}

+ (id)scrollGeometryUpdaterLogHandle
{
  if (scrollGeometryUpdaterLogHandle_onceToken != -1) {
    dispatch_once(&scrollGeometryUpdaterLogHandle_onceToken, &__block_literal_global_232);
  }
  v2 = (void *)scrollGeometryUpdaterLogHandle_sLogHandle;

  return v2;
}

void __56__CKScrollViewController_scrollGeometryUpdaterLogHandle__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.Messages", "CKScrollViewGeometryUpdater");
  v1 = (void *)scrollGeometryUpdaterLogHandle_sLogHandle;
  scrollGeometryUpdaterLogHandle_sLogHandle = (uint64_t)v0;
}

- (id)scrollGeometryUpdaterLogHandle
{
  v2 = objc_opt_class();

  return (id)[v2 scrollGeometryUpdaterLogHandle];
}

- (CGRect)inputAccessoryViewFrameForFloatingKeyboard
{
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)isKeyboardFloating
{
  return [MEMORY[0x1E4F42B20] isFloating];
}

- (void)inputAccessoryViewFrameUpdatedForFloatingKeyboard
{
  double v3 = [(CKScrollViewController *)self view];
  double v4 = [v3 window];

  if (v4)
  {
    double v5 = [(CKScrollViewController *)self view];
    v6 = [v5 window];
    [v6 bounds];
    double MaxY = CGRectGetMaxY(v16);
    [(CKScrollViewController *)self inputAccessoryViewFrameForFloatingKeyboard];
    double v8 = MaxY - CGRectGetHeight(v17);

    v9 = [(CKScrollViewController *)self view];
    v10 = [v9 window];
    [v10 bounds];
    double MaxX = CGRectGetMaxX(v18);
    [(CKScrollViewController *)self inputAccessoryViewFrameForFloatingKeyboard];
    double v12 = MaxX - CGRectGetWidth(v19);

    [(CKScrollViewController *)self inputAccessoryViewFrameForFloatingKeyboard];
    double Width = CGRectGetWidth(v20);
    [(CKScrollViewController *)self accessoryViewHeight];
    -[CKScrollViewController setKeyboardScreenFrame:](self, "setKeyboardScreenFrame:", v12, v8, Width, v14);
    [(CKScrollViewController *)self updateScrollGeometryWithoutAnimationForReason:@"InputAccessoryFrameChanged"];
  }
}

- (void)setKeyboardScreenFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(CKScrollViewController *)self isKeyboardFloating])
  {
    double v8 = [(CKScrollViewController *)self view];
    v9 = [v8 window];
    [v9 bounds];
    double MaxY = CGRectGetMaxY(v15);
    [(CKScrollViewController *)self inputAccessoryViewFrameForFloatingKeyboard];
    double y = MaxY - CGRectGetHeight(v16);

    v11 = [(CKScrollViewController *)self view];
    double v12 = [v11 window];
    [v12 bounds];
    double MaxX = CGRectGetMaxX(v17);
    [(CKScrollViewController *)self inputAccessoryViewFrameForFloatingKeyboard];
    double x = MaxX - CGRectGetWidth(v18);

    p_keyboardScreenFrame = &self->_keyboardScreenFrame;
    [(CKScrollViewController *)self inputAccessoryViewFrameForFloatingKeyboard];
    CGFloat width = CGRectGetWidth(v19);
    [(CKScrollViewController *)self inputAccessoryViewFrameForFloatingKeyboard];
    CGFloat height = CGRectGetHeight(v20);
  }
  else
  {
    p_keyboardScreenFrame = &self->_keyboardScreenFrame;
  }
  p_keyboardScreenFrame->origin.double x = x;
  p_keyboardScreenFrame->origin.double y = y;
  p_keyboardScreenFrame->size.CGFloat width = width;
  p_keyboardScreenFrame->size.CGFloat height = height;
}

- (void)keyboardWillShow:(id)a3
{
  id v4 = a3;
  [(CKScrollViewController *)self setKeyboardVisible:1];
  [(CKScrollViewController *)self _keyboardWillShowOrHide:v4];
}

- (void)_keyboardWillShowOrHide:(id)a3
{
  id v4 = a3;
  [(CKScrollViewController *)self screenFrameForNotification:v4];
  double v39 = v5;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [v4 userInfo];
  v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F43AE8]];
  [v13 CGRectValue];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  v22 = [(CKScrollViewController *)self view];
  double v23 = CKKeyboardFrameInViewCoodinates(v22, v15, v17, v19, v21);
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;

  v30 = [v4 userInfo];
  v31 = [v30 objectForKey:*MEMORY[0x1E4F43AA0]];
  [v31 floatValue];
  double v33 = v32;

  v34 = [v4 userInfo];
  v35 = [v34 objectForKey:*MEMORY[0x1E4F43A98]];
  uint64_t v36 = [v35 integerValue];

  v37 = [v4 name];

  uint64_t v38 = [v37 isEqualToString:*MEMORY[0x1E4F43B88]];
  -[CKScrollViewController _updateKeyboardScreenFrameForShowOrHideWithNewScreenFrame:previousFrame:duration:animationCurve:isShowEvent:](self, "_updateKeyboardScreenFrameForShowOrHideWithNewScreenFrame:previousFrame:duration:animationCurve:isShowEvent:", v36, v38, v39, v7, v9, v11, v23, v25, v27, v29, *(void *)&v33);
}

- (void)_updateKeyboardScreenFrameForShowOrHideWithNewScreenFrame:(CGRect)a3 previousFrame:(CGRect)a4 duration:(double)a5 animationCurve:(int64_t)a6 isShowEvent:(BOOL)a7
{
  CGFloat width = a4.size.width;
  CGFloat rect2 = a4.size.height;
  double y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double height = a3.size.height;
  double v10 = a3.size.width;
  double v11 = a3.origin.y;
  double v12 = a3.origin.x;
  double v14 = [(CKScrollViewController *)self view];
  double v15 = CKKeyboardFrameInViewCoodinates(v14, v12, v11, v10, height);
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  [(CKScrollViewController *)self keyboardFrame];
  v61.origin.CGFloat x = v22;
  v61.origin.double y = v23;
  v61.size.CGFloat width = v24;
  v61.size.double height = v25;
  v59.origin.CGFloat x = v15;
  double v53 = v17;
  v59.origin.double y = v17;
  v59.size.CGFloat width = v19;
  v59.size.double height = v21;
  if (CGRectEqualToRect(v59, v61)) {
    goto LABEL_3;
  }
  v60.origin.CGFloat x = v15;
  v60.origin.double y = v17;
  v62.origin.double y = y;
  v60.size.CGFloat width = v19;
  v60.size.double height = v21;
  v62.origin.CGFloat x = x;
  v62.size.CGFloat width = width;
  v62.size.double height = rect2;
  if (CGRectEqualToRect(v60, v62)) {
LABEL_3:
  }
    [(CKScrollViewController *)self setKeyboardInteractionCancelled:1];
  -[CKScrollViewController setKeyboardScreenFrame:](self, "setKeyboardScreenFrame:", v12, v11, v10, height);
  BOOL v26 = [(CKScrollViewController *)self shouldIgnoreKeyboardAnimationDuration];
  double v27 = 0.0;
  if (![(CKScrollViewController *)self keyboardInteractionCancelled])
  {
    [(CKScrollViewController *)self _visibleKeyboardHeight];
    char v29 = v28 <= 0.0 || v26;
    if ((v29 & 1) == 0)
    {
      double v27 = a5;
      if (a5 > 0.0)
      {
        id v30 = objc_alloc_init(MEMORY[0x1E4F42E18]);
        [v30 settlingDuration];
        double v32 = v31;

        double v33 = +[CKScrollViewAnimationProperties animatedWithDuration:a6 animationCurve:v32];
        [(CKScrollViewController *)self setActiveKeyboardAppearanceAnimationProperties:v33];
        id location = 0;
        objc_initWeak(&location, self);
        dispatch_time_t v34 = dispatch_time(0, (uint64_t)(v32 * 1000000000.0));
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __134__CKScrollViewController__updateKeyboardScreenFrameForShowOrHideWithNewScreenFrame_previousFrame_duration_animationCurve_isShowEvent___block_invoke;
        block[3] = &unk_1E5622AB8;
        objc_copyWeak(&v57, &location);
        id v56 = v33;
        id v35 = v33;
        dispatch_after(v34, MEMORY[0x1E4F14428], block);

        objc_destroyWeak(&v57);
        objc_destroyWeak(&location);
      }
    }
  }
  [(CKScrollViewController *)self updateScrollGeometryForReason:@"KeyboardScreenFrameChanged" withDuration:a6 animationCurve:v27];
  uint64_t v36 = +[CKUIBehavior sharedBehaviors];
  int v37 = [v36 isEntryViewInputAccessory];

  if (v37)
  {
    [(CKScrollViewController *)self accessoryViewHeight];
    double v39 = v38;
    v40 = [(CKScrollViewController *)self firstResponder];
    v41 = [v40 inputAccessoryViewController];
    v42 = [v41 view];
    v43 = v42;
    if (v42)
    {
      id v44 = v42;
    }
    else
    {
      v45 = [(CKScrollViewController *)self firstResponder];
      id v44 = [v45 inputAccessoryView];
    }
    v46 = [(CKScrollViewController *)self scrollView];
    [v46 contentInset];
    BOOL v49 = v47 != v39 || v44 == 0;

    a7 = v53 <= y || v49;
  }
  if (![(CKScrollViewController *)self keyboardInteractionCancelled] && !a7) {
    [(CKScrollViewController *)self keyboardWillHideViaGesture];
  }
}

void __134__CKScrollViewController__updateKeyboardScreenFrameForShowOrHideWithNewScreenFrame_previousFrame_duration_animationCurve_isShowEvent___block_invoke(uint64_t a1)
{
  double v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained activeKeyboardAppearanceAnimationProperties];
  double v5 = *(void **)(a1 + 32);

  if (v4 == v5)
  {
    id v6 = objc_loadWeakRetained(v2);
    [v6 setActiveKeyboardAppearanceAnimationProperties:0];
  }
}

- (BOOL)shouldIgnoreKeyboardAnimationDuration
{
  return 0;
}

- (void)scrollWithDuration:(double)a3 animationCurve:(int64_t)a4 scrollBlock:(id)a5
{
  id v7 = a5;
  id v11 = v7;
  if (a3 <= 0.0)
  {
    [MEMORY[0x1E4F42FF0] performWithoutAnimation:v7];
    goto LABEL_9;
  }
  if (a4 == 103)
  {
    id v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F42E18]), "initWithMass:stiffness:damping:initialVelocity:", 1.0, 333.34153, 36.51529, 0.0, 0.0);
LABEL_7:
    double v9 = v8;
    double v10 = (void *)[objc_alloc(MEMORY[0x1E4F43008]) initWithDuration:v8 timingParameters:a3];
    [v10 addAnimations:v11];
    [v10 startAnimation];

    goto LABEL_9;
  }
  if ((a4 & 7) != 0)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F42E18]);
    goto LABEL_7;
  }
  [MEMORY[0x1E4F42FF0] animateWithDuration:a4 << 16 delay:v7 options:0 animations:a3 completion:0.0];
LABEL_9:
}

- (void)keyboardDidShow:(id)a3
{
  [(CKScrollViewController *)self setActiveKeyboardAppearanceAnimationProperties:0];
  [(CKScrollViewController *)self updateScrollGeometryWithoutAnimationForReason:@"KeyboardDidShow"];

  [(CKScrollViewController *)self setKeyboardInteractionCancelled:0];
}

- (void)keyboardDidHide:(id)a3
{
  [(CKScrollViewController *)self setKeyboardVisible:0];
  [(CKScrollViewController *)self updateScrollGeometryWithoutAnimationForReason:@"KeyboardDidHide"];

  [(CKScrollViewController *)self setKeyboardInteractionCancelled:0];
}

- (void)keyboardDidChangeFrame:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(CKScrollViewController *)self view];
  id v6 = [v5 window];
  id v7 = [MEMORY[0x1E4F42738] sharedApplication];
  id v8 = [v7 keyWindow];

  if (v6 == v8)
  {
    [(CKScrollViewController *)self screenFrameForNotification:v4];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    CGFloat v17 = [(CKScrollViewController *)self view];
    double v18 = CKKeyboardFrameInViewCoodinates(v17, v10, v12, v14, v16);
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;

    v41.origin.CGFloat x = v18;
    v41.origin.double y = v20;
    v41.size.CGFloat width = v22;
    v41.size.double height = v24;
    if (CGRectIsEmpty(v41))
    {
      CGFloat v25 = IMLogHandleForCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        LOWORD(v38) = 0;
        BOOL v26 = "Ignoring keyboard frame change because frame is empty";
LABEL_19:
        _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, v26, (uint8_t *)&v38, 2u);
        goto LABEL_20;
      }
      goto LABEL_20;
    }
    [(CKScrollViewController *)self keyboardFrame];
    v43.origin.CGFloat x = v27;
    v43.origin.double y = v28;
    v43.size.CGFloat width = v29;
    v43.size.double height = v30;
    v42.origin.CGFloat x = v18;
    v42.origin.double y = v20;
    v42.size.CGFloat width = v22;
    v42.size.double height = v24;
    BOOL v31 = CGRectEqualToRect(v42, v43);
    CGFloat v25 = IMLogHandleForCategory();
    BOOL v32 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);
    if (v31)
    {
      if (v32)
      {
        LOWORD(v38) = 0;
        BOOL v26 = "Ignoring keyboard frame change because value has not changed";
        goto LABEL_19;
      }
LABEL_20:

      goto LABEL_21;
    }
    if (v32)
    {
      LOWORD(v38) = 0;
      _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "Updating keyboard screen frame", (uint8_t *)&v38, 2u);
    }

    -[CKScrollViewController setKeyboardScreenFrame:](self, "setKeyboardScreenFrame:", v10, v12, v14, v16);
    BOOL v33 = [(CKScrollViewController *)self shouldUpdateScrollPositionForKeyboardScreenFrameChanges];
    CGFloat v25 = IMLogHandleForCategory();
    BOOL v34 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);
    if (!v33)
    {
      if (v34)
      {
        LOWORD(v38) = 0;
        BOOL v26 = "Not updating scroll position due to current view controller configuration.";
        goto LABEL_19;
      }
      goto LABEL_20;
    }
    if (v34)
    {
      int v38 = 138412290;
      double v39 = @"KeyboardDidChangeFrame";
      _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "Updating scroll geometry for reason: %@", (uint8_t *)&v38, 0xCu);
    }

    [(CKScrollViewController *)self updateScrollGeometryWithoutAnimationForReason:@"KeyboardDidChangeFrame"];
    id v35 = [(CKScrollViewController *)self scrollView];
    int v36 = objc_msgSend(v35, "__ck_isScrolledToBottom");

    if (v36)
    {
      int v37 = IMLogHandleForCategory();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        LOWORD(v38) = 0;
        _os_log_impl(&dword_18EF18000, v37, OS_LOG_TYPE_INFO, "Is scrolling to bottom", (uint8_t *)&v38, 2u);
      }

      CGFloat v25 = [(CKScrollViewController *)self scrollView];
      [v25 __ck_scrollToBottom:1];
      goto LABEL_20;
    }
  }
LABEL_21:
}

- (BOOL)shouldUpdateScrollPositionForKeyboardScreenFrameChanges
{
  return 1;
}

- (void)reasonTrackingUpdater:(id)a3 needsUpdateForReasons:(id)a4 followingHoldForReason:(id)a5
{
  if (self->_scrollGeometryUpdater == a3) {
    [(CKScrollViewController *)self scrollGeometryIsUpdatingForReasons:a4 followingHoldForReason:a5];
  }
}

- (void)reasonTrackingUpdater:(id)a3 didBeginHoldingUpdatesWithInitialReason:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (self->_scrollGeometryUpdater == a3)
  {
    id v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Scroll geometry is being held. Initial reason: %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)reasonTrackingUpdater:(id)a3 didEndHoldingUpdatesWithFinalReason:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (self->_scrollGeometryUpdater == a3)
  {
    id v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Scroll geometry hold ending. Final reason: %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)viewSafeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)CKScrollViewController;
  [(CKScrollViewController *)&v3 viewSafeAreaInsetsDidChange];
  [(CKScrollViewController *)self updateScrollGeometryWithoutAnimationForReason:@"SafeAreaInsetsChanged"];
}

- (void)updateScrollGeometryWithoutAnimationForReason:(id)a3
{
  id v4 = a3;
  id v6 = +[CKScrollViewAnimationProperties unanimated];
  double v5 = [[CKScrollViewScrollGeometryUpdateReason alloc] initWithReasonType:v4 animationProperties:v6];

  [(IMReasonTrackingUpdater *)self->_scrollGeometryUpdater updateImmediatelyWithReason:v5];
}

- (void)updateScrollGeometryWithInheritedAnimationForReason:(id)a3
{
  id v4 = a3;
  id v6 = +[CKScrollViewAnimationProperties inheritedAnimation];
  double v5 = [[CKScrollViewScrollGeometryUpdateReason alloc] initWithReasonType:v4 animationProperties:v6];

  [(IMReasonTrackingUpdater *)self->_scrollGeometryUpdater updateImmediatelyWithReason:v5];
}

- (void)updateScrollGeometryForReason:(id)a3 withDuration:(double)a4 animationCurve:(int64_t)a5
{
  id v8 = a3;
  id v10 = +[CKScrollViewAnimationProperties animatedWithDuration:a5 animationCurve:a4];
  id v9 = [[CKScrollViewScrollGeometryUpdateReason alloc] initWithReasonType:v8 animationProperties:v10];

  [(IMReasonTrackingUpdater *)self->_scrollGeometryUpdater updateImmediatelyWithReason:v9];
}

- (void)scrollGeometryIsUpdatingForReasons:(id)a3 followingHoldForReason:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = [(CKScrollViewController *)self scrollView];
  int v8 = objc_msgSend(v11, "__ck_isScrolledToBottom");
  id v9 = +[CKScrollViewAnimationProperties unanimated];
  BOOL v10 = [(CKScrollViewController *)self scrollGeometryContentInsetIsUpdatingForReasons:v7 followingHoldForReason:v6 withAnimationProperties:v9];

  if (v8 && v10) {
    objc_msgSend(v11, "__ck_scrollToBottom:", 0);
  }
}

- (CGRect)keyboardFrameInViewCoordinates
{
  [(CKScrollViewController *)self keyboardScreenFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(CKScrollViewController *)self view];
  double v12 = CKKeyboardFrameInViewCoodinates(v11, v4, v6, v8, v10);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.double height = v22;
  result.size.CGFloat width = v21;
  result.origin.double y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (UIEdgeInsets)navigationBarInsets
{
  [(CKScrollViewController *)self navigationBarInsetsWithoutPalette];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(CKScrollViewController *)self navigationController];
  double v12 = [v11 existingPaletteForEdge:2];

  if (v12 && [v12 isAttached])
  {
    [v12 frame];
    double v4 = v4 + v13;
  }

  double v14 = v4;
  double v15 = v6;
  double v16 = v8;
  double v17 = v10;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (UIEdgeInsets)navigationBarInsetsWithoutPalette
{
  double v3 = *MEMORY[0x1E4F437F8];
  double v4 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  double v7 = [(CKScrollViewController *)self navigationController];
  double v8 = [v7 navigationBar];

  double v9 = +[CKUIBehavior sharedBehaviors];
  int v10 = [v9 shouldInsetForStatusBar];

  if (v10)
  {
    id v11 = [MEMORY[0x1E4F42738] sharedApplication];
    double v12 = [v11 statusBar];

    double v13 = [MEMORY[0x1E4F42738] sharedApplication];
    char v14 = [v13 isStatusBarHidden];

    if ((v14 & 1) == 0)
    {
      [v12 currentHeight];
      double v3 = v15;
    }
  }
  else
  {
    double v16 = +[CKUIBehavior sharedBehaviors];
    int v17 = [v16 useMacToolbar];

    if (v17)
    {
      [(CKScrollViewController *)self macToolbarInsets];
      double v3 = v18;
      double v4 = v19;
      double v6 = v20;
      double v5 = v21;
    }
    else if (([v8 isTranslucent] & 1) != 0 {
           || (+[CKUIBehavior sharedBehaviors],
    }
               double v22 = objc_claimAutoreleasedReturnValue(),
               int v23 = [v22 shouldInsetForStatusBarWithSafeArea],
               v22,
               v23))
    {
      CGFloat v24 = [(CKScrollViewController *)self view];
      [v24 safeAreaInsets];
      double v3 = v25;

      double v5 = 0.0;
      double v6 = 0.0;
      double v4 = 0.0;
    }
  }

  double v26 = v3;
  double v27 = v4;
  double v28 = v6;
  double v29 = v5;
  result.right = v29;
  result.bottom = v28;
  result.left = v27;
  result.top = v26;
  return result;
}

- (UIEdgeInsets)bannerInsets
{
  double v2 = *MEMORY[0x1E4F437F8];
  double v3 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)macToolbarInsets
{
  double v2 = *MEMORY[0x1E4F437F8];
  double v3 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)visibleHeightAboveKeyboard
{
  [(CKScrollViewController *)self keyboardFrame];
  double v4 = v3;
  double v6 = v5;
  double v7 = *MEMORY[0x1E4F1DAD8];
  double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v9 = [(CKScrollViewController *)self view];
  [v9 bounds];
  double v11 = v10;
  if (v4 != v7 || v6 != v8)
  {
    [(CKScrollViewController *)self keyboardFrame];
    double v11 = v11 - v13;
  }

  return v11;
}

- (BOOL)isKeyboardUndocked
{
  double v2 = [MEMORY[0x1E4F42C68] sharedInstance];
  char v3 = [v2 isUndocked];

  return v3;
}

- (BOOL)isKeyboardOnscreenWithoutAccessoryView
{
  [(CKScrollViewController *)self bottomInsetWithoutAccessoryView];
  return v2 > 0.0;
}

- (double)accessoryViewHeight
{
  char v3 = [(CKScrollViewController *)self inputAccessoryViewController];
  uint64_t v4 = [v3 view];
  if (v4)
  {
    double v5 = (void *)v4;
  }
  else
  {
    double v5 = [(CKScrollViewController *)self inputAccessoryView];

    if (!v5) {
      return 0.0;
    }
  }
  [v5 frame];
  double v7 = v6;

  return v7;
}

- (double)bottomInsetWithoutAccessoryView
{
  char v3 = [(CKScrollViewController *)self scrollView];
  [v3 contentInset];
  double v5 = v4;
  [(CKScrollViewController *)self accessoryViewHeight];
  double v7 = v5 - v6;

  double result = 0.0;
  if (v7 >= 0.0) {
    return v7;
  }
  return result;
}

- (void)beginHoldingScrollGeometryUpdatesForReason:(id)a3
{
}

- (void)endHoldingScrollGeometryUpdatesForReason:(id)a3
{
}

- (BOOL)isHoldingScrollGeometryUpdates
{
  return [(IMReasonTrackingUpdater *)self->_scrollGeometryUpdater isHoldingUpdates];
}

- (void)primeWithKeyboardFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  -[CKScrollViewController setKeyboardScreenFrame:](self, "setKeyboardScreenFrame:");
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  double v8 = CGRectGetHeight(v11);
  [(CKScrollViewController *)self accessoryViewHeight];
  if (v8 > v9) {
    [(CKScrollViewController *)self setKeyboardVisible:1];
  }

  [(CKScrollViewController *)self updateScrollGeometryWithoutAnimationForReason:@"PrimeKeyboardFrame"];
}

- (BOOL)manuallyUpdateKeyboardScreenFrameWithFrameIfNeeded:(CGRect)a3 animationDuration:(double)a4 animationCurve:(int64_t)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    CGRect v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      [(CKScrollViewController *)self keyboardScreenFrame];
      NSStringFromCGRect(v38);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      v39.origin.double x = x;
      v39.origin.double y = y;
      v39.size.double width = width;
      v39.size.double height = height;
      double v13 = NSStringFromCGRect(v39);
      *(_DWORD *)buf = 136315650;
      BOOL v32 = "-[CKScrollViewController manuallyUpdateKeyboardScreenFrameWithFrameIfNeeded:animationDuration:animationCurve:]";
      __int16 v33 = 2112;
      id v34 = v12;
      __int16 v35 = 2112;
      int v36 = v13;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "%s current %@ updated %@", buf, 0x20u);
    }
  }
  [(CKScrollViewController *)self keyboardScreenFrame];
  v41.origin.double x = v14;
  v41.origin.double y = v15;
  v41.size.double width = v16;
  v41.size.double height = v17;
  v40.origin.double x = x;
  v40.origin.double y = y;
  v40.size.double width = width;
  v40.size.double height = height;
  BOOL v18 = CGRectEqualToRect(v40, v41);
  if (!v18)
  {
    if (IMOSLoggingEnabled())
    {
      double v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        BOOL v32 = "-[CKScrollViewController manuallyUpdateKeyboardScreenFrameWithFrameIfNeeded:animationDuration:animationCurve:]";
        _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "%s applying fix-up for keyboard insets!", buf, 0xCu);
      }
    }
    [(CKScrollViewController *)self keyboardScreenFrame];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    [(CKScrollViewController *)self keyboardScreenFrame];
    -[CKScrollViewController _updateKeyboardScreenFrameForShowOrHideWithNewScreenFrame:previousFrame:duration:animationCurve:isShowEvent:](self, "_updateKeyboardScreenFrameForShowOrHideWithNewScreenFrame:previousFrame:duration:animationCurve:isShowEvent:", a5, y > v28, x, y, width, height, v21, v23, v25, v27, *(void *)&a4);
  }
  return !v18;
}

- (CGRect)screenFrameForNotification:(id)a3
{
  char v3 = [a3 userInfo];
  double v4 = [v3 objectForKey:*MEMORY[0x1E4F43AF0]];
  [v4 CGRectValue];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (void)setKeyboardVisible:(BOOL)a3
{
  if (self->_keyboardVisible != a3)
  {
    self->_keyboardVisible = a3;
    [(CKScrollViewController *)self keyboardVisibilityWillChange];
  }
}

- (UIEdgeInsets)_calculateContentInsets
{
  if ([(CKScrollViewController *)self topInsetIncludesPalette]) {
    [(CKScrollViewController *)self navigationBarInsets];
  }
  else {
    [(CKScrollViewController *)self navigationBarInsetsWithoutPalette];
  }
  double v4 = v3;
  uint64_t v5 = MEMORY[0x1E4F437F8];
  [(CKScrollViewController *)self topInsetPadding];
  double v7 = v6;
  double v8 = 0.0;
  if ([(CKScrollViewController *)self isUsingVisibleInputViewHeightWhenUpdatingScrollGeometry])
  {
    [(CKScrollViewController *)self visibleInputViewHeight];
    double v8 = v9;
  }
  double v10 = *(double *)(v5 + 8);
  double v11 = *(double *)(v5 + 24);
  [(CKScrollViewController *)self _bottomRotatingFooterHeight];
  double v13 = v12;
  [(CKScrollViewController *)self bottomInsetPadding];
  if (v8 >= v13) {
    double v15 = v8;
  }
  else {
    double v15 = v13;
  }
  double v16 = v14 + v15;
  [(CKScrollViewController *)self minimumBottomInset];
  if (v16 < v17) {
    double v16 = v17;
  }
  if (self->_enableContentPinning)
  {
    [(CKScrollViewController *)self contentSizeForPinning];
    double v19 = v18;
    double v20 = [(CKScrollViewController *)self scrollView];
    [v20 frame];
    double Height = CGRectGetHeight(v27);

    double v22 = 0.0;
    if (v19 < Height - v16)
    {
      double v23 = Height - v16 - v19;
      if (v16 <= self->_contentPinningThreshold) {
        double v23 = v23 * 0.5;
      }
      double v22 = fmax(v23, 0.0);
    }
  }
  else
  {
    double v22 = v4 + v7;
  }
  double v24 = v10;
  double v25 = v16;
  double v26 = v11;
  result.right = v26;
  result.bottom = v25;
  result.left = v24;
  result.top = v22;
  return result;
}

- (BOOL)scrollGeometryContentInsetIsUpdatingForReasons:(id)a3 followingHoldForReason:(id)a4 withAnimationProperties:(id)a5
{
  id v6 = a5;
  double v7 = [(CKScrollViewController *)self scrollView];
  double v8 = v7;
  if (!v7) {
    goto LABEL_13;
  }
  [v7 contentInset];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  [(CKScrollViewController *)self _calculateContentInsets];
  BOOL v21 = v18 == v12 && v17 == v10;
  BOOL v22 = v21 && v20 == v16;
  if (v22 && v19 == v14)
  {
LABEL_13:
    BOOL v28 = 0;
  }
  else
  {
    double v24 = v17;
    double v25 = v18;
    double v26 = v19;
    double v27 = v20;
    -[CKScrollViewController contentInsetWillChange:withAnimationProperties:](self, "contentInsetWillChange:withAnimationProperties:", v6);
    objc_msgSend(v8, "setContentInset:", v24, v25, v26, v27);
    [(CKScrollViewController *)self contentInsetDidChangeWithAnimationProperties:v6];
    BOOL v28 = 1;
  }

  return v28;
}

- (void)_changedStatusBarFrame:(id)a3
{
}

- (void)_entryViewWillRotate:(id)a3
{
  [(CKScrollViewController *)self screenFrameForNotification:a3];

  -[CKScrollViewController setKeyboardScreenFrame:](self, "setKeyboardScreenFrame:");
}

- (double)_bottomRotatingFooterHeight
{
  double v2 = [(CKScrollViewController *)self rotatingFooterView];
  double v3 = [v2 window];

  if (v3)
  {
    [v2 frame];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (BOOL)isUsingVisibleInputViewHeightWhenUpdatingScrollGeometry
{
  return 1;
}

- (double)_visibleKeyboardHeight
{
  double v3 = 0.0;
  if (![(CKScrollViewController *)self isKeyboardFloating])
  {
    [(CKScrollViewController *)self keyboardFrame];
    double x = v46.origin.x;
    double y = v46.origin.y;
    double width = v46.size.width;
    double height = v46.size.height;
    if (!CGRectIsEmpty(v46))
    {
      double v8 = [(CKScrollViewController *)self view];
      objc_msgSend(v8, "convertRect:fromView:", 0, x, y, width, height);
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      CGFloat v16 = v15;

      double v17 = [(CKScrollViewController *)self view];
      [v17 bounds];
      v52.origin.double x = v10;
      v52.origin.double y = v12;
      v52.size.double width = v14;
      v52.size.double height = v16;
      CGRect v48 = CGRectIntersection(v47, v52);
      CGFloat v18 = v48.origin.x;
      CGFloat v19 = v48.origin.y;
      CGFloat v20 = v48.size.width;
      CGFloat v21 = v48.size.height;

      v49.origin.double x = v18;
      v49.origin.double y = v19;
      v49.size.double width = v20;
      v49.size.double height = v21;
      if (!CGRectIsEmpty(v49))
      {
        __int16 v33 = [(CKScrollViewController *)self view];
        [v33 bounds];
        double MaxY = CGRectGetMaxY(v50);
        v51.origin.double x = v18;
        v51.origin.double y = v19;
        v51.size.double width = v20;
        v51.size.double height = v21;
        double v3 = MaxY - CGRectGetMinY(v51);
LABEL_21:

        return v3;
      }
      if (x != *MEMORY[0x1E4F1DAD8] || y != *(double *)(MEMORY[0x1E4F1DAD8] + 8))
      {
        int v23 = CKIsRunningInMessagesViewService();
        double v24 = [(CKScrollViewController *)self view];
        double v25 = v24;
        if (v23)
        {
          double v26 = [v24 window];

          double v27 = [v26 windowScene];
          BOOL v28 = [v27 screen];
          double v29 = [v28 coordinateSpace];
          CGFloat v30 = [v27 coordinateSpace];
          objc_msgSend(v29, "convertRect:toCoordinateSpace:", v30, x, y, width, height);
          double v32 = v31;

          double v25 = v26;
        }
        else
        {
          CKKeyboardFrameInViewCoodinates(v24, x, y, width, height);
          double v32 = v40;
        }
        double v3 = 0.0;

        if (v32 == 0.0)
        {
          __int16 v33 = IMLogHandleForCategory();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            -[CKScrollViewController _visibleKeyboardHeight](v33);
          }
        }
        else
        {
          __int16 v33 = [(CKScrollViewController *)self view];
          [v33 frame];
          double v3 = v44 - v32;
        }
        goto LABEL_21;
      }
      __int16 v35 = [(CKScrollViewController *)self firstResponder];
      int v36 = [v35 inputAccessoryViewController];
      uint64_t v37 = [v36 view];
      CGRect v38 = v37;
      if (v37)
      {
        id v39 = v37;
      }
      else
      {
        id v39 = [(CKScrollViewController *)self inputAccessoryView];
      }
      CGRect v41 = v39;

      if (v41)
      {
        CGRect v42 = [(CKScrollViewController *)self inputAccessoryView];
        [v42 frame];
        double v3 = v43;
      }
      else
      {
        double v3 = 0.0;
      }
    }
  }
  return v3;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (BOOL)topInsetIncludesPalette
{
  return self->_topInsetIncludesPalette;
}

- (double)topInsetPadding
{
  return self->_topInsetPadding;
}

- (double)bottomInsetPadding
{
  return self->_bottomInsetPadding;
}

- (double)minimumBottomInset
{
  return self->_minimumBottomInset;
}

- (BOOL)isKeyboardVisible
{
  return self->_keyboardVisible;
}

- (BOOL)enableContentPinning
{
  return self->_enableContentPinning;
}

- (void)setEnableContentPinning:(BOOL)a3
{
  self->_enableContentPinning = a3;
}

- (double)contentPinningThreshold
{
  return self->_contentPinningThreshold;
}

- (void)setContentPinningThreshold:(double)a3
{
  self->_contentPinningThreshold = a3;
}

- (CGSize)contentSizeForPinning
{
  double width = self->_contentSizeForPinning.width;
  double height = self->_contentSizeForPinning.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CKScrollViewAnimationProperties)activeKeyboardAppearanceAnimationProperties
{
  return self->_activeKeyboardAppearanceAnimationProperties;
}

- (void)setActiveKeyboardAppearanceAnimationProperties:(id)a3
{
}

- (CGRect)keyboardScreenFrame
{
  double x = self->_keyboardScreenFrame.origin.x;
  double y = self->_keyboardScreenFrame.origin.y;
  double width = self->_keyboardScreenFrame.size.width;
  double height = self->_keyboardScreenFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)keyboardInteractionCancelled
{
  return self->_keyboardInteractionCancelled;
}

- (void)setKeyboardInteractionCancelled:(BOOL)a3
{
  self->_keyboardInteractionCancelled = a3;
}

- (IMReasonTrackingUpdater)scrollGeometryUpdater
{
  return self->_scrollGeometryUpdater;
}

- (void)setScrollGeometryUpdater:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollGeometryUpdater, 0);
  objc_storeStrong((id *)&self->_activeKeyboardAppearanceAnimationProperties, 0);

  objc_storeStrong((id *)&self->_scrollView, 0);
}

- (void)_visibleKeyboardHeight
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "Invalid keyboard frame, keyboard covers entire view. Ignoring.", v1, 2u);
}

@end