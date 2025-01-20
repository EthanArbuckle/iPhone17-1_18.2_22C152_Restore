@interface SFWebExtensionPageMenuController
+ (id)_imageViewForWarningTriangleImage:(id)a3;
+ (id)badgeViewForText:(id)a3;
- (BOOL)_showPerSitePermissionsForTab:(id)a3 permissionGrantedHandler:(id)a4;
- (BOOL)shouldShowWarningTriangleImageForTab:(id)a3;
- (BOOL)showingExtensionPopup;
- (BOOL)wantsGrayscaleIconForTab:(id)a3;
- (BOOL)wantsTemplateIconForTab:(id)a3;
- (SFWebExtensionPageMenuController)initWithExtension:(id)a3;
- (WBSWebExtensionWindow)windowDisplayingPopupWebView;
- (id)activityForTab:(id)a3;
- (id)alertItemForTab:(id)a3;
- (id)iconForTab:(id)a3;
- (id)iconForTab:(id)a3 size:(CGSize)a4;
- (id)webView:(id)a3 createWebViewWithConfiguration:(id)a4 forNavigationAction:(id)a5 windowFeatures:(id)a6;
- (void)_createTabWithURL:(id)a3;
- (void)didSetBadgeText:(id)a3 forTab:(id)a4;
- (void)didSetEnabledState:(BOOL)a3 forTab:(id)a4;
- (void)didSetIcon:(id)a3 forTab:(id)a4;
- (void)dismissPopupImmediatelyIfNecessary;
- (void)performActionForTab:(id)a3 parentViewController:(id)a4 popoverSourceInfo:(id)a5;
- (void)popupDidNavigateRequestingNewWindowToURL:(id)a3;
- (void)showPopupOrPerSitePermissionsForTab:(id)a3 parentViewController:(id)a4 popoverSourceInfo:(id)a5;
- (void)webKitExtensionAction:(id)a3 didChangeForTab:(id)a4;
- (void)webViewDidClose:(id)a3;
@end

@implementation SFWebExtensionPageMenuController

- (SFWebExtensionPageMenuController)initWithExtension:(id)a3
{
  id v4 = a3;
  v5 = [v4 extensionsController];
  v8.receiver = self;
  v8.super_class = (Class)SFWebExtensionPageMenuController;
  v6 = [(WBSWebExtensionToolbarItem *)&v8 initWithWebExtension:v4 extensionsController:v5];

  return v6;
}

- (id)iconForTab:(id)a3
{
  id v4 = a3;
  v5 = [(WBSWebExtensionToolbarItem *)self webExtension];
  v6 = [v5 extensionsController];
  double v7 = (double)(unint64_t)[v6 toolbarItemIdealPointSize];

  objc_super v8 = -[SFWebExtensionPageMenuController iconForTab:size:](self, "iconForTab:size:", v4, v7, v7);

  return v8;
}

- (BOOL)wantsGrayscaleIconForTab:(id)a3
{
  id v4 = a3;
  if ([(WBSWebExtensionToolbarItem *)self isEnabledForTab:v4])
  {
    v5 = [(WBSWebExtensionToolbarItem *)self webExtension];
    v6 = [v4 urlForExtensions];
    int v7 = [v5 hasPermissionToAccessURL:v6 inTab:v4] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (BOOL)wantsTemplateIconForTab:(id)a3
{
  id v4 = a3;
  if ([(SFWebExtensionPageMenuController *)self wantsGrayscaleIconForTab:v4])
  {
    v5 = [(SFWebExtensionPageMenuController *)self iconForTab:v4];
    objc_msgSend(v5, "safari_computeAverageLuminance");
    double v7 = v6;
    char v8 = objc_msgSend(v5, "safari_transparencyAnalysisResultIsNotOpaque");
    if (v7 < 0.1) {
      BOOL v9 = v8;
    }
    else {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)iconForTab:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v6 = self;
  v24.receiver = self;
  v24.super_class = (Class)SFWebExtensionPageMenuController;
  id v7 = a3;
  char v8 = [(WBSWebExtensionToolbarItem *)&v24 iconForTab:v7];
  objc_msgSend(v8, "safari_computeAverageLuminance");
  uint64_t v10 = v9;
  char v11 = objc_msgSend(v8, "safari_isGrayscale");
  char v12 = objc_msgSend(v8, "safari_transparencyAnalysisResultIsNotOpaque");
  LOBYTE(v6) = [(SFWebExtensionPageMenuController *)v6 wantsGrayscaleIconForTab:v7];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __52__SFWebExtensionPageMenuController_iconForTab_size___block_invoke;
  v23[3] = &__block_descriptor_56_e38___UIImage_24__0__UIImage_8__UIColor_16l;
  v23[4] = v10;
  *(double *)&v23[5] = width;
  *(double *)&v23[6] = height;
  v13 = (void *)MEMORY[0x1AD0C36A0](v23);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __52__SFWebExtensionPageMenuController_iconForTab_size___block_invoke_2;
  v17[3] = &unk_1E5C77C30;
  char v20 = (char)v6;
  uint64_t v19 = v10;
  char v21 = v12;
  id v18 = v13;
  char v22 = v11;
  id v14 = v13;
  v15 = objc_msgSend(v8, "safari_dynamicImageWithSize:generator:", v17, width, height);

  return v15;
}

uint64_t __52__SFWebExtensionPageMenuController_iconForTab_size___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, __n128 a4)
{
  a4.n128_u64[0] = *(void *)(a1 + 40);
  return MEMORY[0x1F412FB40](a2, a3, *(double *)(a1 + 32) >= 0.1, a4, *(double *)(a1 + 48));
}

id __52__SFWebExtensionPageMenuController_iconForTab_size___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  char v8 = v7;
  if (!*(unsigned char *)(a1 + 48))
  {
    id v14 = v7;
    if (!*(unsigned char *)(a1 + 50)) {
      goto LABEL_10;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4FB1618], "sf_safariAccentColor");
    goto LABEL_8;
  }
  if (*(double *)(a1 + 40) < 0.1 && *(unsigned char *)(a1 + 49))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = [MEMORY[0x1E4FB1618] labelColor];
LABEL_8:
    char v12 = (void *)v10;
    id v14 = (*(void (**)(uint64_t, void *, uint64_t))(v9 + 16))(v9, v8, v10);
    v13 = v8;
    goto LABEL_9;
  }
  uint64_t v11 = *(void *)(a1 + 32);
  char v12 = objc_msgSend(v7, "safari_makeGrayscale");
  v13 = [MEMORY[0x1E4FB1618] labelColor];
  id v14 = (*(void (**)(uint64_t, void *, void *))(v11 + 16))(v11, v12, v13);

LABEL_9:
LABEL_10:

  return v14;
}

- (void)showPopupOrPerSitePermissionsForTab:(id)a3 parentViewController:(id)a4 popoverSourceInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![(SFWebExtensionPageMenuController *)self showingExtensionPopup]
    && ![(SFWebExtensionPageMenuController *)self _showPerSitePermissionsForTab:v8 permissionGrantedHandler:0])
  {
    uint64_t v11 = [(WBSWebExtensionToolbarItem *)self webExtension];
    char v12 = [v11 webKitContext];
    v13 = [v12 actionForTab:v8];

    if ([v13 presentsPopup])
    {
      [(SFWebExtensionPageMenuController *)self dismissPopupImmediatelyIfNecessary];
      objc_storeWeak((id *)&self->_parentViewController, v9);
      if (objc_opt_respondsToSelector())
      {
        id v14 = [v13 popupViewController];
        objc_storeWeak((id *)&self->_popupViewController, v14);
        v15 = [v14 popoverPresentationController];
        if (v10)
        {
          uint64_t v19 = [v9 view];
          v16 = [v19 window];
          v17 = [v16 windowScene];
          id v18 = _SFContextInfoWithComment();
          id v21 = v15;
          id v20 = v21;
          _SFPopoverSourceInfoUnwrap();
        }
        [v9 presentViewController:v14 animated:1 completion:0];
      }
    }
  }
}

uint64_t __111__SFWebExtensionPageMenuController_showPopupOrPerSitePermissionsForTab_parentViewController_popoverSourceInfo___block_invoke(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  [*(id *)(a1 + 32) setSourceView:a2];
  uint64_t v11 = *(void **)(a1 + 32);

  return objc_msgSend(v11, "setSourceRect:", a3, a4, a5, a6);
}

uint64_t __111__SFWebExtensionPageMenuController_showPopupOrPerSitePermissionsForTab_parentViewController_popoverSourceInfo___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setSourceItem:a2];
}

- (BOOL)_showPerSitePermissionsForTab:(id)a3 permissionGrantedHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WBSWebExtensionToolbarItem *)self webExtension];
  id v9 = [v8 extensionsController];
  int v10 = [v8 hasPendingWebsiteRequests];
  int v11 = [(WBSWebExtensionToolbarItem *)self shouldRequestAccessForTab:v6] | v10;
  if (v11 == 1)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __91__SFWebExtensionPageMenuController__showPerSitePermissionsForTab_permissionGrantedHandler___block_invoke;
    v14[3] = &unk_1E5C726C8;
    id v15 = v7;
    [v8 requestPermissionsFromToolbarItemInTab:v6 completionHandler:v14];
    char v12 = [v8 extension];
    [v9 didShowPerSiteAccessPermissionForExtension:v12];
  }
  return v11;
}

uint64_t __91__SFWebExtensionPageMenuController__showPerSitePermissionsForTab_permissionGrantedHandler___block_invoke(uint64_t result, int a2)
{
  if (a2)
  {
    result = *(void *)(result + 32);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

- (void)performActionForTab:(id)a3 parentViewController:(id)a4 popoverSourceInfo:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_storeStrong((id *)&self->_tab, a3);
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __95__SFWebExtensionPageMenuController_performActionForTab_parentViewController_popoverSourceInfo___block_invoke;
  objc_super v24 = &unk_1E5C726F0;
  v25 = self;
  id v12 = v9;
  id v26 = v12;
  id v27 = v10;
  id v28 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = (void *)MEMORY[0x1AD0C36A0](&v21);
  if (!-[SFWebExtensionPageMenuController _showPerSitePermissionsForTab:permissionGrantedHandler:](self, "_showPerSitePermissionsForTab:permissionGrantedHandler:", v12, v15, v21, v22, v23, v24, v25))
  {
    v16 = [(WBSWebExtensionToolbarItem *)self webExtension];
    v17 = [v16 extensionsController];
    id v18 = [v17 analyticsEventCoalescer];
    uint64_t v19 = [v16 composedIdentifier];
    [v18 didInvokeToolbarButtonForExtensionWithIdentifier:v19];

    id v20 = [v16 webKitContext];
    [v20 performActionForTab:v12];
  }
}

void __95__SFWebExtensionPageMenuController_performActionForTab_parentViewController_popoverSourceInfo___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 500000000);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __95__SFWebExtensionPageMenuController_performActionForTab_parentViewController_popoverSourceInfo___block_invoke_2;
  v4[3] = &unk_1E5C726F0;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  dispatch_after(v2, MEMORY[0x1E4F14428], v4);
}

uint64_t __95__SFWebExtensionPageMenuController_performActionForTab_parentViewController_popoverSourceInfo___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) performActionForTab:*(void *)(a1 + 40) parentViewController:*(void *)(a1 + 48) popoverSourceInfo:*(void *)(a1 + 56)];
}

- (void)dismissPopupImmediatelyIfNecessary
{
  p_popupViewController = &self->_popupViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_popupViewController);
  [WeakRetained dismissViewControllerAnimated:1 completion:0];

  objc_storeWeak((id *)p_popupViewController, 0);
}

- (id)activityForTab:(id)a3
{
  objc_storeStrong((id *)&self->_tab, a3);
  id v5 = a3;
  id v6 = [_SFWebExtensionActivity alloc];
  id v7 = [(WBSWebExtensionToolbarItem *)self webExtension];
  id v8 = [(_SFWebExtensionActivity *)v6 initWithPageMenuController:self webExtension:v7 tab:v5];
  activityItem = self->_activityItem;
  self->_activityItem = v8;

  id v10 = self->_activityItem;
  return v10;
}

- (id)alertItemForTab:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_tab, a3);
  id v6 = [(WBSWebExtensionToolbarItem *)self webExtension];
  id v7 = [v6 displayShortName];
  uint64_t v8 = *MEMORY[0x1E4FB28C8];
  id v9 = [(SFWebExtensionPageMenuController *)self iconForTab:v5];
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __52__SFWebExtensionPageMenuController_alertItemForTab___block_invoke;
  objc_super v24 = &unk_1E5C760F8;
  v25 = self;
  id v10 = v5;
  id v26 = v10;
  id v11 = +[_SFWebExtensionSettingsAlertItem buttonWithTitle:v7 textStyle:v8 icon:v9 extension:v6 handler:&v21];
  alertItem = self->_alertItem;
  self->_alertItem = v11;

  -[_SFSettingsAlertItem setEnabled:](self->_alertItem, "setEnabled:", -[WBSWebExtensionToolbarItem isEnabledForTab:](self, "isEnabledForTab:", self->_tab, v21, v22, v23, v24, v25));
  id v13 = [(WBSWebExtensionToolbarItem *)self badgeTextForTab:self->_tab];
  id v14 = [(id)objc_opt_class() badgeViewForText:v13];
  [(_SFSettingsAlertItem *)self->_alertItem setBadgeView:v14];

  [(_SFSettingsAlertItem *)self->_alertItem setBadgeText:v13];
  if ([(SFWebExtensionPageMenuController *)self shouldShowWarningTriangleImageForTab:v10])
  {
    id v15 = objc_opt_class();
    v16 = [MEMORY[0x1E4FB1818] systemImageNamed:@"exclamationmark.triangle.fill"];
    v17 = [v15 _imageViewForWarningTriangleImage:v16];
    [(_SFSettingsAlertItem *)self->_alertItem setStatusImageView:v17];

    [(_SFSettingsAlertItem *)self->_alertItem setShowsStatusAlert:1];
  }
  id v18 = +[_SFPageFormatMenuBadgeView defaultComponentsArrangement];
  [(_SFSettingsAlertItem *)self->_alertItem setComponentsArrangement:v18];

  uint64_t v19 = self->_alertItem;
  return v19;
}

void __52__SFWebExtensionPageMenuController_alertItemForTab___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 presentingViewController];
  id v5 = _SFPopoverSourceInfoForViewController();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__SFWebExtensionPageMenuController_alertItemForTab___block_invoke_2;
  v11[3] = &unk_1E5C726F0;
  id v6 = *(void **)(a1 + 40);
  v11[4] = *(void *)(a1 + 32);
  id v12 = v6;
  id v13 = v4;
  id v14 = v5;
  id v7 = v5;
  id v8 = v4;
  [v3 dismissViewControllerAnimated:1 completion:v11];

  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 96);
  *(void *)(v9 + 96) = 0;
}

uint64_t __52__SFWebExtensionPageMenuController_alertItemForTab___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) performActionForTab:*(void *)(a1 + 40) parentViewController:*(void *)(a1 + 48) popoverSourceInfo:*(void *)(a1 + 56)];
}

+ (id)badgeViewForText:(id)a3
{
  id v3 = a3;
  if ([v3 length]) {
    id v4 = [[_SFPageFormatMenuBadgeView alloc] initWithText:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

+ (id)_imageViewForWarningTriangleImage:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4FB1838];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithImage:v4];

  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v6 = [MEMORY[0x1E4FB1618] systemOrangeColor];
  [v5 setTintColor:v6];

  return v5;
}

- (BOOL)shouldShowWarningTriangleImageForTab:(id)a3
{
  BOOL v4 = [(WBSWebExtensionToolbarItem *)self shouldRequestAccessForTab:a3];
  id v5 = [(WBSWebExtensionToolbarItem *)self webExtension];
  id v6 = [v5 extensionsController];
  id v7 = [v5 extension];
  char v8 = [v6 hasShownPerSiteAccessPermissionForExtension:v7];

  char v9 = v4 & (v8 ^ 1) | [v5 hasPendingWebsiteRequests];
  return v9;
}

- (void)_createTabWithURL:(id)a3
{
  id v3 = a3;
  BOOL v4 = [NSString stringWithFormat:&stru_1EFB97EB8];
  id v5 = NSString;
  id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/SafariServices/iOS/MobileSafari/SafariServices/_SFWebExtensionPageMenuController.m"];
  id v7 = [v6 lastPathComponent];
  if ([v4 length])
  {
    char v9 = [NSString stringWithFormat:@", %@", v4];
    uint64_t v8 = [v5 stringWithFormat:@"ASSERTION FAILURE: \"%s\" in %s, %@:%d%@", "!(1)", "-[SFWebExtensionPageMenuController _createTabWithURL:]", v7, 943, v9];
  }
  else
  {
    uint64_t v8 = [v5 stringWithFormat:@"ASSERTION FAILURE: \"%s\" in %s, %@:%d%@", "!(1)", "-[SFWebExtensionPageMenuController _createTabWithURL:]", v7, 943, &stru_1EFB97EB8];
  }

  id v10 = [MEMORY[0x1E4F29060] callStackSymbols];
  NSLog(&stru_1EFB9DC58.isa, v8, v10);

  abort();
}

- (BOOL)showingExtensionPopup
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_popupViewController);
  id v3 = [WeakRetained presentingViewController];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)webKitExtensionAction:(id)a3 didChangeForTab:(id)a4
{
  id v16 = a3;
  id v6 = (WBSWebExtensionTab *)a4;
  id v7 = [(WBSWebExtensionToolbarItem *)self webExtension];
  uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:@"activityContentsDidUpdate" object:v7];

  [v7 _validateToolbarItemInAllWindows];
  if (self->_alertItem)
  {
    tab = self->_tab;
    if (!v6 || (BOOL v10 = tab == v6, tab = v6, v10))
    {
      id v11 = [(SFWebExtensionPageMenuController *)self iconForTab:tab];
      [(_SFSettingsAlertItem *)self->_alertItem setIcon:v11];

      id v12 = objc_opt_class();
      id v13 = [v16 badgeText];
      id v14 = [v12 badgeViewForText:v13];
      [(_SFSettingsAlertItem *)self->_alertItem setBadgeView:v14];

      id v15 = [v16 badgeText];
      [(_SFSettingsAlertItem *)self->_alertItem setBadgeText:v15];

      -[_SFSettingsAlertItem setEnabled:](self->_alertItem, "setEnabled:", [v16 isEnabled]);
    }
  }
}

- (void)didSetBadgeText:(id)a3 forTab:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [NSString stringWithFormat:&stru_1EFB97EB8];
  uint64_t v8 = NSString;
  char v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/SafariServices/iOS/MobileSafari/SafariServices/_SFWebExtensionPageMenuController.m"];
  BOOL v10 = [v9 lastPathComponent];
  if ([v7 length])
  {
    id v12 = [NSString stringWithFormat:@", %@", v7];
    uint64_t v11 = [v8 stringWithFormat:@"ASSERTION FAILURE: \"%s\" in %s, %@:%d%@", "!(1)", "-[SFWebExtensionPageMenuController didSetBadgeText:forTab:]", v10, 1016, v12];
  }
  else
  {
    uint64_t v11 = [v8 stringWithFormat:@"ASSERTION FAILURE: \"%s\" in %s, %@:%d%@", "!(1)", "-[SFWebExtensionPageMenuController didSetBadgeText:forTab:]", v10, 1016, &stru_1EFB97EB8];
  }

  id v13 = [MEMORY[0x1E4F29060] callStackSymbols];
  NSLog(&stru_1EFB9DC58.isa, v11, v13);

  abort();
}

- (void)didSetEnabledState:(BOOL)a3 forTab:(id)a4
{
  id v4 = a4;
  id v5 = [NSString stringWithFormat:&stru_1EFB97EB8];
  id v6 = NSString;
  id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/SafariServices/iOS/MobileSafari/SafariServices/_SFWebExtensionPageMenuController.m"];
  uint64_t v8 = [v7 lastPathComponent];
  if ([v5 length])
  {
    BOOL v10 = [NSString stringWithFormat:@", %@", v5];
    uint64_t v9 = [v6 stringWithFormat:@"ASSERTION FAILURE: \"%s\" in %s, %@:%d%@", "!(1)", "-[SFWebExtensionPageMenuController didSetEnabledState:forTab:]", v8, 1045, v10];
  }
  else
  {
    uint64_t v9 = [v6 stringWithFormat:@"ASSERTION FAILURE: \"%s\" in %s, %@:%d%@", "!(1)", "-[SFWebExtensionPageMenuController didSetEnabledState:forTab:]", v8, 1045, &stru_1EFB97EB8];
  }

  uint64_t v11 = [MEMORY[0x1E4F29060] callStackSymbols];
  NSLog(&stru_1EFB9DC58.isa, v9, v11);

  abort();
}

- (void)didSetIcon:(id)a3 forTab:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [NSString stringWithFormat:&stru_1EFB97EB8];
  uint64_t v8 = NSString;
  uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/SafariServices/iOS/MobileSafari/SafariServices/_SFWebExtensionPageMenuController.m"];
  BOOL v10 = [v9 lastPathComponent];
  if ([v7 length])
  {
    id v12 = [NSString stringWithFormat:@", %@", v7];
    uint64_t v11 = [v8 stringWithFormat:@"ASSERTION FAILURE: \"%s\" in %s, %@:%d%@", "!(1)", "-[SFWebExtensionPageMenuController didSetIcon:forTab:]", v10, 1070, v12];
  }
  else
  {
    uint64_t v11 = [v8 stringWithFormat:@"ASSERTION FAILURE: \"%s\" in %s, %@:%d%@", "!(1)", "-[SFWebExtensionPageMenuController didSetIcon:forTab:]", v10, 1070, &stru_1EFB97EB8];
  }

  id v13 = [MEMORY[0x1E4F29060] callStackSymbols];
  NSLog(&stru_1EFB9DC58.isa, v11, v13);

  abort();
}

- (void)popupDidNavigateRequestingNewWindowToURL:(id)a3
{
  id v3 = a3;
  id v4 = [NSString stringWithFormat:&stru_1EFB97EB8];
  id v5 = NSString;
  id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/SafariServices/iOS/MobileSafari/SafariServices/_SFWebExtensionPageMenuController.m"];
  id v7 = [v6 lastPathComponent];
  if ([v4 length])
  {
    uint64_t v9 = [NSString stringWithFormat:@", %@", v4];
    uint64_t v8 = [v5 stringWithFormat:@"ASSERTION FAILURE: \"%s\" in %s, %@:%d%@", "!(1)", "-[SFWebExtensionPageMenuController popupDidNavigateRequestingNewWindowToURL:]", v7, 1090, v9];
  }
  else
  {
    uint64_t v8 = [v5 stringWithFormat:@"ASSERTION FAILURE: \"%s\" in %s, %@:%d%@", "!(1)", "-[SFWebExtensionPageMenuController popupDidNavigateRequestingNewWindowToURL:]", v7, 1090, &stru_1EFB97EB8];
  }

  BOOL v10 = [MEMORY[0x1E4F29060] callStackSymbols];
  NSLog(&stru_1EFB9DC58.isa, v8, v10);

  abort();
}

- (void)webViewDidClose:(id)a3
{
  id v3 = a3;
  id v4 = [NSString stringWithFormat:&stru_1EFB97EB8];
  id v5 = NSString;
  id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/SafariServices/iOS/MobileSafari/SafariServices/_SFWebExtensionPageMenuController.m"];
  id v7 = [v6 lastPathComponent];
  if ([v4 length])
  {
    uint64_t v9 = [NSString stringWithFormat:@", %@", v4];
    uint64_t v8 = [v5 stringWithFormat:@"ASSERTION FAILURE: \"%s\" in %s, %@:%d%@", "!(1)", "-[SFWebExtensionPageMenuController webViewDidClose:]", v7, 1102, v9];
  }
  else
  {
    uint64_t v8 = [v5 stringWithFormat:@"ASSERTION FAILURE: \"%s\" in %s, %@:%d%@", "!(1)", "-[SFWebExtensionPageMenuController webViewDidClose:]", v7, 1102, &stru_1EFB97EB8];
  }

  BOOL v10 = [MEMORY[0x1E4F29060] callStackSymbols];
  NSLog(&stru_1EFB9DC58.isa, v8, v10);

  abort();
}

- (id)webView:(id)a3 createWebViewWithConfiguration:(id)a4 forNavigationAction:(id)a5 windowFeatures:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [NSString stringWithFormat:&stru_1EFB97EB8];
  id v14 = NSString;
  id v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/SafariServices/iOS/MobileSafari/SafariServices/_SFWebExtensionPageMenuController.m"];
  id v16 = [v15 lastPathComponent];
  if ([v13 length])
  {
    id v18 = [NSString stringWithFormat:@", %@", v13];
    uint64_t v17 = [v14 stringWithFormat:@"ASSERTION FAILURE: \"%s\" in %s, %@:%d%@", "!(1)", "-[SFWebExtensionPageMenuController webView:createWebViewWithConfiguration:forNavigationAction:windowFeatures:]", v16, 1112, v18];
  }
  else
  {
    uint64_t v17 = [v14 stringWithFormat:@"ASSERTION FAILURE: \"%s\" in %s, %@:%d%@", "!(1)", "-[SFWebExtensionPageMenuController webView:createWebViewWithConfiguration:forNavigationAction:windowFeatures:]", v16, 1112, &stru_1EFB97EB8];
  }

  uint64_t v19 = [MEMORY[0x1E4F29060] callStackSymbols];
  NSLog(&stru_1EFB9DC58.isa, v17, v19);

  abort();
}

- (WBSWebExtensionWindow)windowDisplayingPopupWebView
{
  return self->_windowDisplayingPopupWebView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowDisplayingPopupWebView, 0);
  objc_storeStrong((id *)&self->_activityItem, 0);
  objc_storeStrong((id *)&self->_alertItem, 0);
  objc_storeStrong((id *)&self->_tab, 0);
  objc_destroyWeak((id *)&self->_popupViewController);

  objc_destroyWeak((id *)&self->_parentViewController);
}

@end