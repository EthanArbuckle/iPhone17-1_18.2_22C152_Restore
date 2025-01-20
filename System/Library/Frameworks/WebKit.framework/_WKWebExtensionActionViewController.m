@interface _WKWebExtensionActionViewController
- (_WKWebExtensionActionViewController)initWithWebExtensionAction:(void *)a3;
- (id).cxx_construct;
- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (void)_dismissPopup;
- (void)_updateDetentForSheetPresentationController:(id)a3;
- (void)_updatePopoverContentSize;
- (void)_viewControllerDismissalTransitionDidEnd:(id)a3;
- (void)presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4;
@end

@implementation _WKWebExtensionActionViewController

- (_WKWebExtensionActionViewController)initWithWebExtensionAction:(void *)a3
{
  v21.receiver = self;
  v21.super_class = (Class)_WKWebExtensionActionViewController;
  v4 = [(_WKWebExtensionActionViewController *)&v21 init];
  if (v4 && (uint64_t v5 = *((void *)a3 + 3)) != 0 && (v6 = *(void *)(v5 + 8)) != 0)
  {
    CFRetain(*(CFTypeRef *)(v6 - 8));
    WTF::WeakPtrFactory<WebPushD::PushServiceConnection,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)a3 + 4, (uint64_t)a3);
    v8 = (atomic_uint *)*((void *)a3 + 2);
    if (v8) {
      atomic_fetch_add(v8, 1u);
    }
    m_ptr = (unsigned int *)v4->_webExtensionAction.m_impl.m_ptr;
    v4->_webExtensionAction.m_impl.m_ptr = (DefaultWeakPtrImpl *)v8;
    if (m_ptr && atomic_fetch_add((atomic_uint *volatile)m_ptr, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, v7);
    }
    v10 = WebKit::WebExtensionAction::popupWebView((WebKit::WebExtensionAction *)a3);
    objc_opt_class();
    id v11 = v10;
    if (objc_opt_isKindOfClass()) {
      v12 = (_WKWebExtensionActionWebView *)v11;
    }
    else {
      v12 = 0;
    }

    popupWebView = v4->_popupWebView;
    v4->_popupWebView = v12;

    [(_WKWebExtensionActionViewController *)v4 setView:v4->_popupWebView];
    [(_WKWebExtensionActionViewController *)v4 setModalPresentationStyle:7];
    v15 = [(_WKWebExtensionActionViewController *)v4 popoverPresentationController];
    [v15 setDelegate:v4];

    v16 = [(_WKWebExtensionActionViewController *)v4 navigationItem];
    WebKit::WebExtension::populateDisplayStringsIfNeeded(*(WebKit::WebExtension **)(v6 + 48));
    v17 = WTF::RetainPtr<__IOHIDDevice *>::get();
    [v16 setTitle:v17];

    v18 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:v4 action:sel__dismissPopup];
    [v16 setRightBarButtonItem:v18];

    v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 addObserver:v4 selector:sel__viewControllerDismissalTransitionDidEnd_ name:*MEMORY[0x1E4F43C30] object:0];

    v13 = v4;
    CFRelease(*(CFTypeRef *)(v6 - 8));
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  if (objc_msgSend(a4, "horizontalSizeClass", a3) == 1) {
    return 2;
  }
  else {
    return 7;
  }
}

- (void)presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4
{
  id v6 = a4;
  objc_opt_class();
  uint64_t v5 = WTF::dynamic_objc_cast<UISheetPresentationController>(v6);
  if (v5) {
    [(_WKWebExtensionActionViewController *)self _updateDetentForSheetPresentationController:v5];
  }
}

- (id)presentationController:(id)a3 viewControllerForAdaptivePresentationStyle:(int64_t)a4
{
  uint64_t v5 = [a3 presentedViewController];
  id v6 = (void *)v5;
  if (a4 == 2)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v5];
    v8 = [v7 navigationBar];
    v9 = [v8 standardAppearance];
    [v8 setScrollEdgeAppearance:v9];
  }
  else
  {
    v7 = (void *)v5;
  }

  return v7;
}

- (void)_viewControllerDismissalTransitionDidEnd:(id)a3
{
  id v4 = a3;
  m_ptr = self->_webExtensionAction.m_impl.m_ptr;
  if (m_ptr)
  {
    if (*((void *)m_ptr + 1))
    {
      id v15 = v4;
      id v6 = [v4 userInfo];
      v7 = WebKit::objectForKey<NSNumber>(v6, *MEMORY[0x1E4F43C28]);
      char v8 = [v7 BOOLValue];

      id v4 = v15;
      if (v8)
      {
        v9 = [v15 object];
        objc_opt_class();
        id v10 = v9;
        if (objc_opt_isKindOfClass()) {
          id v11 = (_WKWebExtensionActionViewController *)v10;
        }
        else {
          id v11 = 0;
        }

        if (v11 == self
          || ([(_WKWebExtensionActionViewController *)self navigationController],
              v12 = (_WKWebExtensionActionViewController *)objc_claimAutoreleasedReturnValue(),
              v12,
              v11 == v12))
        {
          v13 = self->_webExtensionAction.m_impl.m_ptr;
          if (v13) {
            v14 = (WebKit::WebExtensionAction *)*((void *)v13 + 1);
          }
          else {
            v14 = 0;
          }
          WebKit::WebExtensionAction::closePopup(v14);
        }

        id v4 = v15;
      }
    }
  }
}

- (void)_updatePopoverContentSize
{
  id v19 = [(_WKWebExtensionActionViewController *)self _existingPresentationControllerImmediate:0 effective:1];
  if (v19)
  {
    BOOL presentedAsSheet = self->_presentedAsSheet;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    self->_BOOL presentedAsSheet = isKindOfClass & 1;
    if (presentedAsSheet != (isKindOfClass & 1))
    {
      [(_WKWebExtensionActionWebView *)self->_popupWebView setNeedsLayout];
      BOOL presentedAsSheet = self->_presentedAsSheet;
    }
    popupWebView = self->_popupWebView;
    if (presentedAsSheet)
    {
      [(WKWebView *)popupWebView _clearOverrideLayoutParameters];
      id v6 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v7 = [v6 userInterfaceIdiom];

      if (!v7)
      {
        char v8 = [MEMORY[0x1E4F42D90] mainScreen];
        [v8 _referenceBounds];
        double Width = CGRectGetWidth(v21);

        [(_WKWebExtensionActionViewController *)self preferredContentSize];
        if (v10 < Width) {
          double v10 = Width;
        }
        [(_WKWebExtensionActionViewController *)self setPreferredContentSize:v10];
      }
      objc_opt_class();
      id v11 = WTF::dynamic_objc_cast<UISheetPresentationController>(v19);
      [(_WKWebExtensionActionViewController *)self _updateDetentForSheetPresentationController:v11];
    }
    else
    {
      v12 = [(WKWebView *)popupWebView scrollView];
      [v12 contentSize];
      double v14 = v13;
      double v16 = v15;

      if (v16 > 600.0) {
        double v16 = 600.0;
      }
      BOOL v17 = [(_WKWebExtensionActionWebView *)self->_popupWebView contentSizeHasStabilized];
      if (v14 > 800.0) {
        double v14 = 800.0;
      }
      if (v16 <= 50.0) {
        double v18 = v16;
      }
      else {
        double v18 = 50.0;
      }
      if (!v17) {
        double v18 = 50.0;
      }
      -[WKWebView _overrideLayoutParametersWithMinimumLayoutSize:minimumUnobscuredSizeOverride:maximumUnobscuredSizeOverride:](self->_popupWebView, "_overrideLayoutParametersWithMinimumLayoutSize:minimumUnobscuredSizeOverride:maximumUnobscuredSizeOverride:", v14, v18, v14, v18, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
      -[_WKWebExtensionActionViewController setPreferredContentSize:](self, "setPreferredContentSize:", v14, v16);
    }
  }
}

- (void)_updateDetentForSheetPresentationController:(id)a3
{
  v7[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F42DE8] mediumDetent];
  v7[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F42DE8] largeDetent];
  v7[1] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  [v3 setDetents:v6];

  [v3 setPrefersEdgeAttachedInCompactHeight:1];
  [v3 setWidthFollowsPreferredContentSizeWhenEdgeAttached:1];
}

- (void)_dismissPopup
{
  id v2 = [(_WKWebExtensionActionViewController *)self presentingViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_popupWebView, 0);
  m_ptr = (unsigned int *)self->_webExtensionAction.m_impl.m_ptr;
  self->_webExtensionAction.m_impl.m_ptr = 0;
  if (m_ptr && atomic_fetch_add((atomic_uint *volatile)m_ptr, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, m_ptr);
    WTF::fastFree((WTF *)m_ptr, v3);
  }
}

- (id).cxx_construct
{
  *((void *)self + 122) = 0;
  return self;
}

@end