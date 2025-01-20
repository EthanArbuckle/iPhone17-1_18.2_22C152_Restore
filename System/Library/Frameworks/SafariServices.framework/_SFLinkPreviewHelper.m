@interface _SFLinkPreviewHelper
+ (id)contextMenuConfigurationForWebView:(id)a3 elementInfo:(id)a4 handler:(id)a5;
+ (id)contextMenuContentPreviewForWebView:(id)a3 elementInfo:(id)a4 handler:(id)a5;
+ (id)linkPreviewHelperForWebView:(id)a3;
+ (id)previewViewControllerWebView:(id)a3 windowBounds:(CGRect)a4 url:(id)a5 handler:(id)a6;
+ (void)commitPreviewViewController:(id)a3;
+ (void)initialize;
+ (void)invalidateLinkPreviewHelperForWebView:(id)a3;
- (BOOL)_previewViewControllerIsLinkPreview;
- (NSURL)url;
- (UIViewController)previewContentViewController;
- (WKWebView)webView;
- (_SFLinkPreviewHeader)activeLinkPreviewHeader;
- (_SFLinkPreviewHelper)initWithWebView:(id)a3 windowBounds:(CGRect)a4 elementInfo:(id)a5 orURL:(id)a6 handler:(id)a7;
- (_WKActivatedElementInfo)elementInfo;
- (double)headerViewHeightForAdaptivePreviewViewController:(id)a3;
- (id)adaptivePreviewViewController:(id)a3 requestLinkPreviewViewControllerWithURL:(id)a4;
- (id)addToReadingListActionForURL:(id)a3;
- (id)downloadActionForURL:(id)a3;
- (id)makeContextMenuConfiguration;
- (id)makePreviewViewController;
- (id)menuElementsForSuggestedActions:(id)a3;
- (id)menuWithSuggestedActions:(id)a3;
- (id)openActionForAlternateURL:(id)a3;
- (id)openActionForRedirectToExternalNavigationResult:(id)a3;
- (id)openActionForSettingUpOneTimeCodeGeneratorWithExternalNavigationResult:(id)a3;
- (id)openInNewTabActionForURL:(id)a3 withTabOrder:(int64_t)a4 preActionHandler:(id)a5;
- (id)openInNewWindowActionForURL:(id)a3;
- (id)openInTabGroupActionForURL:(id)a3 shouldPerformActionHandler:(id)a4;
- (id)previewViewController;
- (id)previewViewControllerForURL:(id)a3;
- (void)adaptivePreviewViewControllerWillDisableLinkPreview:(id)a3;
- (void)commitPreviewViewController;
- (void)dealloc;
- (void)invalidate;
- (void)invalidateElementInfo;
- (void)openURL:(id)a3 forAction:(int64_t)a4 withTabOrder:(int64_t)a5;
- (void)setActiveLinkPreviewHeader:(id)a3;
@end

@implementation _SFLinkPreviewHelper

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    uint64_t v2 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    v3 = (void *)ownerToPreviewMap;
    ownerToPreviewMap = v2;
  }
}

+ (id)contextMenuConfigurationForWebView:(id)a3 elementInfo:(id)a4 handler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v8 _activatedElementInfo];
  uint64_t v11 = previewContentForElementInfo(v10);

  if (v11 == 2)
  {
    if (shouldProvideActionsForQRCodes())
    {
LABEL_3:
      v12 = [_SFLinkPreviewHelper alloc];
      v13 = [v7 window];
      [v13 bounds];
      v14 = -[_SFLinkPreviewHelper initWithWebView:windowBounds:elementInfo:orURL:handler:](v12, "initWithWebView:windowBounds:elementInfo:orURL:handler:", v7, v8, 0, v9);

      [(id)ownerToPreviewMap setObject:v14 forKey:v7];
      v15 = [(_SFLinkPreviewHelper *)v14 makeContextMenuConfiguration];

      goto LABEL_6;
    }
  }
  else
  {
    v16 = [v8 linkURL];
    char v17 = objc_msgSend(v16, "safari_isHTTPFamilyURL");

    if (v17) {
      goto LABEL_3;
    }
  }
  v15 = 0;
LABEL_6:

  return v15;
}

+ (id)contextMenuContentPreviewForWebView:(id)a3 elementInfo:(id)a4 handler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ((shouldProvideActionsForQRCodes() & 1) != 0
    || ([v8 _activatedElementInfo],
        v10 = (_WKActivatedElementInfo *)objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = previewContentForElementInfo(v10),
        v10,
        v11 != 2))
  {
    v15 = 0;
  }
  else
  {
    v12 = [_SFLinkPreviewHelper alloc];
    v13 = [v7 window];
    [v13 bounds];
    v14 = -[_SFLinkPreviewHelper initWithWebView:windowBounds:elementInfo:orURL:handler:](v12, "initWithWebView:windowBounds:elementInfo:orURL:handler:", v7, v8, 0, v9);

    [(id)ownerToPreviewMap setObject:v14 forKey:v7];
    v15 = [(_SFLinkPreviewHelper *)v14 previewViewController];
  }

  return v15;
}

+ (id)linkPreviewHelperForWebView:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = [(id)ownerToPreviewMap objectForKey:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (void)invalidateLinkPreviewHelperForWebView:(id)a3
{
  id v5 = a3;
  id v3 = [v5 superview];

  if (!v3)
  {
    v4 = [(id)ownerToPreviewMap objectForKey:v5];
    [v4 invalidate];

    [(id)ownerToPreviewMap removeObjectForKey:v5];
  }
}

+ (id)previewViewControllerWebView:(id)a3 windowBounds:(CGRect)a4 url:(id)a5 handler:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  v15 = -[_SFLinkPreviewHelper initWithWebView:windowBounds:elementInfo:orURL:handler:]([_SFLinkPreviewHelper alloc], "initWithWebView:windowBounds:elementInfo:orURL:handler:", v12, 0, v13, v14, x, y, width, height);
  [(id)ownerToPreviewMap setObject:v15 forKey:v12];
  v16 = [(_SFLinkPreviewHelper *)v15 previewViewController];

  return v16;
}

+ (void)commitPreviewViewController:(id)a3
{
  id v3 = [(id)ownerToPreviewMap objectForKey:a3];
  [v3 commitPreviewViewController];
  [v3 invalidate];
}

- (_SFLinkPreviewHelper)initWithWebView:(id)a3 windowBounds:(CGRect)a4 elementInfo:(id)a5 orURL:(id)a6 handler:(id)a7
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  v25.receiver = self;
  v25.super_class = (Class)_SFLinkPreviewHelper;
  v20 = [(_SFLinkPreviewHelper *)&v25 init];
  if (v20)
  {
    uint64_t v21 = [v17 _activatedElementInfo];
    elementInfo = v20->_elementInfo;
    v20->_elementInfo = (_WKActivatedElementInfo *)v21;

    objc_storeStrong((id *)&v20->_fallbackURL, a6);
    objc_storeWeak((id *)&v20->_handler, v19);
    objc_storeStrong((id *)&v20->_webView, a3);
    v20->_windowBounds.origin.CGFloat x = x;
    v20->_windowBounds.origin.CGFloat y = y;
    v20->_windowBounds.size.CGFloat width = width;
    v20->_windowBounds.size.CGFloat height = height;
    v23 = v20;
  }

  return v20;
}

- (NSURL)url
{
  fallbackURL = [(_WKActivatedElementInfo *)self->_elementInfo URL];
  v4 = fallbackURL;
  if (!fallbackURL) {
    fallbackURL = self->_fallbackURL;
  }
  id v5 = fallbackURL;

  return v5;
}

- (void)commitPreviewViewController
{
  id v3 = a2;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F98950]) initWithURL:v3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = ___ZZ51___SFLinkPreviewHelper_commitPreviewViewController_ENK3__0clEP5NSURL_block_invoke;
  v8[3] = &unk_1E5C74968;
  uint64_t v5 = *a1;
  id v9 = v4;
  uint64_t v10 = v5;
  id v6 = v3;
  id v11 = v6;
  id v7 = v4;
  [v7 decideOpenStrategyWithCompletionHandler:v8];
}

- (void)openURL:(id)a3 forAction:(int64_t)a4 withTabOrder:(int64_t)a5
{
  id v11 = a3;
  id v8 = [MEMORY[0x1E4F78598] builderWithModifierFlags:0];
  [v8 setPreferredTabOrder:a5];
  if (a4 == 3)
  {
    [v8 setPrefersOpenInNewTab:1];
  }
  else if (a4 == 4)
  {
    [v8 setPrefersOpenInNewWindow:1];
  }
  id v9 = [v8 navigationIntentWithURL:v11];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_handler);
  [WeakRetained linkPreviewHelper:self didProduceNavigationIntent:v9 forAction:a4];
}

- (void)invalidate
{
  p_cachedPreviewViewController = &self->_cachedPreviewViewController;
  if (self->_cachedPreviewViewController
    && (objc_msgSend((id)ownerToPreviewMap, "objectForKey:"),
        v4 = (_SFLinkPreviewHelper *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4 == self)
    || (p_cachedPreviewViewController = &self->_webView,
        [(id)ownerToPreviewMap objectForKey:self->_webView],
        uint64_t v5 = (_SFLinkPreviewHelper *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5 == self))
  {
    [(id)ownerToPreviewMap removeObjectForKey:*p_cachedPreviewViewController];
  }

  [(_SFLinkPreviewHelper *)self invalidateElementInfo];
}

- (void)invalidateElementInfo
{
  if (self->_elementInfo)
  {
    id v3 = +[_SFQRCodeDetectionController sharedController];
    [v3 clearCachedElement:self->_elementInfo];
  }
}

- (void)dealloc
{
  [(_SFLinkPreviewHelper *)self invalidateElementInfo];
  v3.receiver = self;
  v3.super_class = (Class)_SFLinkPreviewHelper;
  [(_SFLinkPreviewHelper *)&v3 dealloc];
}

- (id)makeContextMenuConfiguration
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52___SFLinkPreviewHelper_makeContextMenuConfiguration__block_invoke;
  v5[3] = &unk_1E5C74798;
  v5[4] = self;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52___SFLinkPreviewHelper_makeContextMenuConfiguration__block_invoke_2;
  v4[3] = &unk_1E5C747C0;
  v4[4] = self;
  uint64_t v2 = [MEMORY[0x1E4FB1678] configurationWithIdentifier:0 previewProvider:v5 actionProvider:v4];

  return v2;
}

- (UIViewController)previewContentViewController
{
  uint64_t v2 = [(_SFLinkPreviewHelper *)self previewViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v2 contentViewController];

    uint64_t v2 = (void *)v3;
  }

  return (UIViewController *)v2;
}

- (id)previewViewController
{
  cachedPreviewViewController = self->_cachedPreviewViewController;
  if (!cachedPreviewViewController)
  {
    v4 = [(_SFLinkPreviewHelper *)self makePreviewViewController];
    uint64_t v5 = self->_cachedPreviewViewController;
    self->_cachedPreviewViewController = v4;

    cachedPreviewViewController = self->_cachedPreviewViewController;
  }

  return cachedPreviewViewController;
}

- (id)makePreviewViewController
{
  uint64_t v4 = previewContentForElementInfo(self->_elementInfo);
  if (v4 == 2)
  {
    uint64_t v2 = [[_SFQRImagePreviewViewController alloc] initWithElementInfo:self->_elementInfo];
  }
  else
  {
    if (v4 == 1)
    {
      uint64_t v5 = [(_WKActivatedElementInfo *)self->_elementInfo imageURL];
      uint64_t v6 = [(_SFLinkPreviewHelper *)self previewViewControllerForURL:v5];
    }
    else
    {
      if (v4) {
        goto LABEL_8;
      }
      uint64_t v5 = [(_SFLinkPreviewHelper *)self url];
      uint64_t v6 = [(_SFLinkPreviewHelper *)self previewViewControllerForURL:v5];
    }
    uint64_t v2 = (_SFQRImagePreviewViewController *)v6;
  }
LABEL_8:

  return v2;
}

- (id)menuWithSuggestedActions:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_handler);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([WeakRetained isAutomationEnabledForLinkPreviewHelper:self] & 1) != 0)
  {
    uint64_t v6 = 0;
  }
  else
  {
    id v7 = [(_SFLinkPreviewHelper *)self menuElementsForSuggestedActions:v4];
    if ((unint64_t)(previewContentForElementInfo(self->_elementInfo) - 1) > 1)
    {
      id v8 = &stru_1EFB97EB8;
    }
    else
    {
      id v8 = [(_WKActivatedElementInfo *)self->_elementInfo title];
    }
    uint64_t v6 = [MEMORY[0x1E4FB1970] menuWithTitle:v8 children:v7];
  }

  return v6;
}

- (id)adaptivePreviewViewController:(id)a3 requestLinkPreviewViewControllerWithURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_handler);
  id v9 = [WeakRetained linkPreviewHelper:self previewViewControllerForURL:v7];

  uint64_t v10 = [(_SFLinkPreviewHelper *)self activeLinkPreviewHeader];
  [v10 setDelegate:v6];

  return v9;
}

- (double)headerViewHeightForAdaptivePreviewViewController:(id)a3
{
  uint64_t v3 = [(_SFLinkPreviewHelper *)self activeLinkPreviewHeader];
  [v3 bounds];
  double Height = CGRectGetHeight(v7);
  if (Height == 0.0)
  {
    [v3 defaultHeight];
    double Height = v5;
  }

  return Height;
}

- (void)adaptivePreviewViewControllerWillDisableLinkPreview:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_handler);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained linkPreviewHelperWillDisableLinkPreview];
  }
}

- (BOOL)_previewViewControllerIsLinkPreview
{
  uint64_t v2 = [(_SFLinkPreviewHelper *)self previewViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v3 = [v2 showingLinkPreview];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (id)previewViewControllerForURL:(id)a3
{
  id v4 = a3;
  if (([v4 isTelephonyURL] & 1) != 0
    || (objc_msgSend(v4, "sf_isFacetimeURL") & 1) != 0
    || (objc_msgSend(v4, "safari_isMailtoURL") & 1) != 0)
  {
    double v5 = 0;
  }
  else
  {
    CGRect v7 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_1A690B000, v7, OS_LOG_TYPE_DEFAULT, "Showing link preview for link on webpage", v10, 2u);
    }
    double v5 = [[_SFAdaptivePreviewViewController alloc] initWithURL:v4];
    [(_SFAdaptivePreviewViewController *)v5 setDelegate:self];
    if ([(_WKActivatedElementInfo *)self->_elementInfo type] == 1)
    {
      id v8 = [(_WKActivatedElementInfo *)self->_elementInfo image];
      [v8 size];
      -[_SFAdaptivePreviewViewController setPreferredDocumentContentSize:](v5, "setPreferredDocumentContentSize:");
    }
    else
    {
      CGFloat Width = CGRectGetWidth(self->_windowBounds);
      -[_SFAdaptivePreviewViewController setPreferredDocumentContentSize:](v5, "setPreferredDocumentContentSize:", Width, Width * 1.33333333);
    }
  }

  return v5;
}

- (id)menuElementsForSuggestedActions:(id)a3
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v64 = [(_SFLinkPreviewHelper *)self url];
  double v5 = [MEMORY[0x1E4F1CA48] array];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_handler);
  v62 = +[_SFQRCodeDetectionController sharedController];
  if (self->_elementInfo)
  {
    id v6 = objc_msgSend(v62, "menuElementsForElementInfo:");
    [v5 addObjectsFromArray:v6];

    CGRect v7 = [v62 actionForElement:self->_elementInfo];
    [v7 setDelegate:WeakRetained];
    [v62 cacheElement:self->_elementInfo];
    uint64_t v8 = [v7 urlThatCanBeOpened];
  }
  else
  {
    uint64_t v8 = 0;
  }
  v59 = (void *)v8;
  v65 = [WeakRetained linkPreviewHelper:self resultOfLoadingURL:v64];
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id obj = v4;
  uint64_t v9 = [obj countByEnumeratingWithState:&v89 objects:v93 count:16];
  if (v9)
  {
    v70 = self;
    v66 = 0;
    v67 = 0;
    v57 = 0;
    v58 = 0;
    v68 = 0;
    v60 = 0;
    v61 = 0;
    v63 = 0;
    uint64_t v10 = *(void *)v90;
    uint64_t v56 = *MEMORY[0x1E4F99068];
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v90 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v89 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = v12;
          id v14 = (void *)MEMORY[0x1E4F46770];
          v15 = [v13 identifier];
          uint64_t v16 = [v14 elementActionTypeForUIActionIdentifier:v15];

          switch(v16)
          {
            case 1:
              uint64_t v22 = [v65 type];
              if (v22 != 3
                || ([v65 externalApplication],
                    v23 = objc_claimAutoreleasedReturnValue(),
                    BOOL v24 = v23 == 0,
                    v23,
                    v24))
              {
                uint64_t v28 = [objc_alloc(MEMORY[0x1E4F98950]) initWithURL:v64];
                appLink = v70->_appLink;
                v70->_appLink = (WBSAppLink *)v28;

                uint64_t v30 = [(WBSAppLink *)v70->_appLink synchronouslyDecideOpenStrategy];
                if ((unint64_t)(v30 - 1) >= 3)
                {
                  if ((unint64_t)(v30 + 1) < 2)
                  {
                    if (v59)
                    {
                      -[_SFLinkPreviewHelper openActionForAlternateURL:](v70, "openActionForAlternateURL:");
                      id v43 = (id)objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      id v43 = v13;
                    }
                    id v48 = v43;

                    if ((unint64_t)(v22 - 1) <= 1)
                    {
                      uint64_t v49 = [(_SFLinkPreviewHelper *)v70 openInNewTabActionForURL:v64 withTabOrder:0 preActionHandler:0];

                      v58 = (void *)v49;
                    }
                    uint64_t v50 = [(_SFLinkPreviewHelper *)v70 openInTabGroupActionForURL:v64 shouldPerformActionHandler:0];

                    v61 = (void *)v50;
                    uint64_t v51 = [(_SFLinkPreviewHelper *)v70 openInNewWindowActionForURL:v64];

                    v60 = (void *)v51;
                    if ((unint64_t)(v22 - 1) < 2)
                    {
                      uint64_t v52 = [(_SFLinkPreviewHelper *)v70 downloadActionForURL:v64];

                      v57 = (void *)v52;
                    }
                    [v5 addObject:v48];
                    objc_msgSend(v5, "safari_addObjectUnlessNil:", v58);
                    objc_msgSend(v5, "safari_addObjectUnlessNil:", v61);
                    objc_msgSend(v5, "safari_addObjectUnlessNil:", v60);
                    objc_msgSend(v5, "safari_addObjectUnlessNil:", v57);
                    v63 = v48;
                  }
                }
                else
                {
                  uint64_t v83 = 0;
                  v84 = &v83;
                  uint64_t v85 = 0x3032000000;
                  v86 = __Block_byref_object_copy__3;
                  v87 = __Block_byref_object_dispose__3;
                  id v88 = 0;
                  uint64_t v77 = 0;
                  v78 = &v77;
                  uint64_t v79 = 0x3032000000;
                  v80 = __Block_byref_object_copy__3;
                  v81 = __Block_byref_object_dispose__3;
                  id v82 = 0;
                  v31 = v70->_appLink;
                  v76[0] = MEMORY[0x1E4F143A8];
                  v76[1] = 3221225472;
                  v76[2] = __56___SFLinkPreviewHelper_menuElementsForSuggestedActions___block_invoke;
                  v76[3] = &unk_1E5C747E8;
                  v76[4] = &v83;
                  v76[5] = &v77;
                  [(WBSAppLink *)v31 getAppLinkAttributesWithCompletionHandler:v76];
                  v32 = (void *)MEMORY[0x1E4FB13F0];
                  v33 = _WBSLocalizedString();
                  v34 = [MEMORY[0x1E4FB1818] systemImageNamed:@"safari"];
                  v73[0] = MEMORY[0x1E4F143A8];
                  v73[1] = 3221225472;
                  v73[2] = __56___SFLinkPreviewHelper_menuElementsForSuggestedActions___block_invoke_2;
                  v73[3] = &unk_1E5C74838;
                  v73[4] = v70;
                  id v74 = v59;
                  id v35 = v64;
                  id v75 = v35;
                  v36 = [v32 actionWithTitle:v33 image:v34 identifier:0 handler:v73];
                  [v5 addObject:v36];

                  if ((unint64_t)(v22 - 1) <= 1)
                  {
                    v72[0] = MEMORY[0x1E4F143A8];
                    v72[1] = 3221225472;
                    v72[2] = __56___SFLinkPreviewHelper_menuElementsForSuggestedActions___block_invoke_78;
                    v72[3] = &unk_1E5C74860;
                    v72[4] = v70;
                    v37 = (void *)MEMORY[0x1AD0C36A0](v72);
                    v38 = [(_SFLinkPreviewHelper *)v70 openInNewTabActionForURL:v35 withTabOrder:0 preActionHandler:v37];
                    objc_msgSend(v5, "safari_addObjectUnlessNil:", v38);

                    v39 = [(_SFLinkPreviewHelper *)v70 openInTabGroupActionForURL:v35 shouldPerformActionHandler:v37];
                    objc_msgSend(v5, "safari_addObjectUnlessNil:", v39);

                    v40 = [(_SFLinkPreviewHelper *)v70 openInNewWindowActionForURL:v35];
                    objc_msgSend(v5, "safari_addObjectUnlessNil:", v40);
                  }
                  if (v84[5])
                  {
                    if ([(id)v78[5] isEqualToString:v56])
                    {
                      v41 = _WBSLocalizedString();
                      v42 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"arrow.up.forward.appclip"];
                    }
                    else
                    {
                      v44 = NSString;
                      v45 = _WBSLocalizedString();
                      uint64_t v46 = objc_msgSend(v44, "stringWithFormat:", v45, v84[5]);

                      v42 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.up.forward.app"];
                      v41 = (void *)v46;
                    }
                    v71[0] = MEMORY[0x1E4F143A8];
                    v71[1] = 3221225472;
                    v71[2] = __56___SFLinkPreviewHelper_menuElementsForSuggestedActions___block_invoke_2_93;
                    v71[3] = &unk_1E5C74888;
                    v71[4] = v70;
                    v47 = [MEMORY[0x1E4FB13F0] actionWithTitle:v41 image:v42 identifier:0 handler:v71];
                    [v5 addObject:v47];
                  }
                  _Block_object_dispose(&v77, 8);

                  _Block_object_dispose(&v83, 8);
                }
              }
              else
              {
                if (objc_msgSend(v64, "safari_isOTPAuthURL")) {
                  [(_SFLinkPreviewHelper *)v70 openActionForSettingUpOneTimeCodeGeneratorWithExternalNavigationResult:v65];
                }
                else {
                objc_super v25 = [(_SFLinkPreviewHelper *)v70 openActionForRedirectToExternalNavigationResult:v65];
                }
                [v5 addObject:v25];
              }
              break;
            case 2:
              uint64_t v26 = [v62 adjustedCopyActionForAction:v13 elementInfo:v70->_elementInfo];

              objc_msgSend(v5, "safari_addObjectUnlessNil:", v26);
              v67 = (void *)v26;
              break;
            case 4:
              id v17 = [v65 URL];
              uint64_t v18 = [(_SFLinkPreviewHelper *)v70 addToReadingListActionForURL:v17];
              id v19 = (void *)v18;
              if (v18) {
                v20 = (void *)v18;
              }
              else {
                v20 = v13;
              }
              id v21 = v20;

              [v5 addObject:v21];
              v66 = v21;
              break;
            default:
              id v27 = v13;

              [v5 addObject:v27];
              v68 = v27;
              break;
          }
        }
        else
        {
          [v5 addObject:v12];
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v89 objects:v93 count:16];
    }
    while (v9);
  }
  else
  {
    v66 = 0;
    v67 = 0;
    v57 = 0;
    v58 = 0;
    v68 = 0;
    v60 = 0;
    v61 = 0;
    v63 = 0;
  }

  v53 = (void *)[v5 copy];

  return v53;
}

- (id)openActionForAlternateURL:(id)a3
{
  id v4 = a3;
  double v5 = (void *)MEMORY[0x1E4FB13F0];
  id v6 = _WBSLocalizedString();
  CGRect v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"safari"];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50___SFLinkPreviewHelper_openActionForAlternateURL___block_invoke;
  v11[3] = &unk_1E5C748B0;
  v11[4] = self;
  id v8 = v4;
  id v12 = v8;
  uint64_t v9 = [v5 actionWithTitle:v6 image:v7 identifier:0 handler:v11];

  return v9;
}

- (id)openActionForRedirectToExternalNavigationResult:(id)a3
{
  id v4 = a3;
  double v5 = [v4 externalApplication];
  id v6 = [v5 bundleIdentifier];
  if ([v6 isEqualToString:@"com.apple.InCallService"])
  {
    CGRect v7 = [v4 URL];
    int v8 = objc_msgSend(v7, "sf_isFacetimeURL");

    if (v8)
    {
      uint64_t v9 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:@"com.apple.facetime"];
      uint64_t v10 = v9;
      if (v9)
      {
        id v11 = v9;

        double v5 = v11;
      }
    }
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4F99068]])
  {
    id v12 = _WBSLocalizedString();
    id v13 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"arrow.up.forward.appclip"];
  }
  else
  {
    id v14 = NSString;
    v15 = _WBSLocalizedString();
    uint64_t v16 = [v5 localizedName];
    uint64_t v17 = objc_msgSend(v14, "stringWithFormat:", v15, v16);

    id v13 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.up.forward.app"];
    id v12 = (void *)v17;
  }
  uint64_t v18 = (void *)MEMORY[0x1E4FB13F0];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __72___SFLinkPreviewHelper_openActionForRedirectToExternalNavigationResult___block_invoke;
  v22[3] = &unk_1E5C748B0;
  v22[4] = self;
  id v19 = v4;
  id v23 = v19;
  v20 = [v18 actionWithTitle:v12 image:v13 identifier:0 handler:v22];

  return v20;
}

- (id)openActionForSettingUpOneTimeCodeGeneratorWithExternalNavigationResult:(id)a3
{
  id v4 = a3;
  double v5 = [v4 externalApplication];
  id v6 = [v5 bundleIdentifier];
  int v7 = [v6 isEqualToString:@"com.apple.Preferences"];

  int v8 = NSString;
  uint64_t v9 = _WBSLocalizedString();
  if (v7)
  {
    uint64_t v10 = [v8 stringWithFormat:v9];
  }
  else
  {
    id v11 = [v4 externalApplication];
    id v12 = [v11 localizedName];
    uint64_t v10 = objc_msgSend(v8, "stringWithFormat:", v9, v12);
  }
  objc_initWeak(&location, self);
  id v13 = (void *)MEMORY[0x1E4FB13F0];
  id v14 = [MEMORY[0x1E4FB1818] systemImageNamed:@"plus"];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __95___SFLinkPreviewHelper_openActionForSettingUpOneTimeCodeGeneratorWithExternalNavigationResult___block_invoke;
  v18[3] = &unk_1E5C748D8;
  objc_copyWeak(&v20, &location);
  id v15 = v4;
  id v19 = v15;
  uint64_t v16 = [v13 actionWithTitle:v10 image:v14 identifier:0 handler:v18];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v16;
}

- (id)openInNewTabActionForURL:(id)a3 withTabOrder:(int64_t)a4 preActionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_handler);
  char v11 = [WeakRetained linkPreviewHelper:self supportsAction:3 forURL:v8];

  if (v11)
  {
    [MEMORY[0x1E4F78590] effectiveTabOrderWithPreferredTabOrder:a4];
    id v12 = _WBSLocalizedString();
    id v13 = [MEMORY[0x1E4FB1818] systemImageNamed:@"plus.square.on.square"];
    id v14 = (void *)MEMORY[0x1E4FB13F0];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __79___SFLinkPreviewHelper_openInNewTabActionForURL_withTabOrder_preActionHandler___block_invoke;
    v17[3] = &unk_1E5C74900;
    id v19 = v9;
    int64_t v20 = a4;
    v17[4] = self;
    id v18 = v8;
    id v15 = [v14 actionWithTitle:v12 image:v13 identifier:0 handler:v17];
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)openInTabGroupActionForURL:(id)a3 shouldPerformActionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_handler);
  if (([WeakRetained linkPreviewHelper:self supportsAction:3 forURL:v6] & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __78___SFLinkPreviewHelper_openInTabGroupActionForURL_shouldPerformActionHandler___block_invoke;
    v11[3] = &unk_1E5C74928;
    id v14 = v7;
    v11[4] = self;
    id v12 = WeakRetained;
    id v13 = v6;
    id v9 = [v12 openInTabGroupMenuWithNewTabGroupName:0 URL:v13 descendantCount:0 handler:v11];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)openInNewWindowActionForURL:(id)a3
{
  id v4 = a3;
  double v5 = [MEMORY[0x1E4FB1438] sharedApplication];
  char v6 = [v5 supportsMultipleScenes];

  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_handler);
    if ((objc_opt_respondsToSelector() & 1) != 0
      && [WeakRetained isPrivateBrowsingEnabledForPreviewHelper:self])
    {
      id v8 = _WBSLocalizedString();
      id v9 = @"plus.square.fill";
    }
    else
    {
      id v8 = _WBSLocalizedString();
      id v9 = @"plus.square";
    }
    char v11 = [MEMORY[0x1E4FB1818] systemImageNamed:v9];
    id v12 = (void *)MEMORY[0x1E4FB13F0];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __52___SFLinkPreviewHelper_openInNewWindowActionForURL___block_invoke;
    v15[3] = &unk_1E5C74838;
    id v13 = WeakRetained;
    id v16 = v13;
    uint64_t v17 = self;
    id v18 = v4;
    uint64_t v10 = [v12 actionWithTitle:v8 image:v11 identifier:0 handler:v15];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)addToReadingListActionForURL:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_handler);
  if (([WeakRetained linkPreviewHelper:self supportsAction:0 forURL:v4] & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    char v6 = _WBSLocalizedString();
    id v7 = (void *)MEMORY[0x1E4FB13F0];
    id v8 = [MEMORY[0x1E4FB1818] systemImageNamed:@"eyeglasses"];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __53___SFLinkPreviewHelper_addToReadingListActionForURL___block_invoke;
    v11[3] = &unk_1E5C74838;
    id v12 = WeakRetained;
    id v13 = self;
    id v14 = v4;
    id v9 = [v7 actionWithTitle:v6 image:v8 identifier:0 handler:v11];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)downloadActionForURL:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_handler);
  if (([WeakRetained linkPreviewHelper:self supportsAction:1 forURL:v4] & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    char v6 = (void *)MEMORY[0x1E4FB13F0];
    id v7 = _WBSLocalizedString();
    id v8 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.down.circle"];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __45___SFLinkPreviewHelper_downloadActionForURL___block_invoke;
    v11[3] = &unk_1E5C74838;
    id v12 = WeakRetained;
    id v13 = self;
    id v14 = v4;
    id v9 = [v6 actionWithTitle:v7 image:v8 identifier:0 handler:v11];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (_WKActivatedElementInfo)elementInfo
{
  return self->_elementInfo;
}

- (WKWebView)webView
{
  return self->_webView;
}

- (_SFLinkPreviewHeader)activeLinkPreviewHeader
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeLinkPreviewHeader);

  return (_SFLinkPreviewHeader *)WeakRetained;
}

- (void)setActiveLinkPreviewHeader:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_activeLinkPreviewHeader);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_elementInfo, 0);
  objc_destroyWeak((id *)&self->_handler);
  objc_storeStrong((id *)&self->_fallbackURL, 0);
  objc_storeStrong((id *)&self->_cachedPreviewViewController, 0);

  objc_storeStrong((id *)&self->_appLink, 0);
}

@end