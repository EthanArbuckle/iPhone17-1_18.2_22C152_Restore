@interface _SFWebExtensionActivity
- (BOOL)_isDisabled;
- (BOOL)_isEnabled;
- (BOOL)_managesOwnPresentation;
- (BOOL)_wantsOriginalImageColor;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (UIActivityViewController)parentViewController;
- (_SFWebExtensionActivity)initWithPageMenuController:(id)a3 webExtension:(id)a4 tab:(id)a5;
- (id)_actionImage;
- (id)_activityBadgeColor;
- (id)_activityBadgeText;
- (id)_activityBadgeTextColor;
- (id)_activityImage;
- (id)_activityStatusImage;
- (id)_activityStatusTintColor;
- (id)activityTitle;
- (id)activityType;
- (void)_reloadActivity;
- (void)_reloadActivitySoon;
- (void)performActivity;
- (void)setParentViewController:(id)a3;
@end

@implementation _SFWebExtensionActivity

- (_SFWebExtensionActivity)initWithPageMenuController:(id)a3 webExtension:(id)a4 tab:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_SFWebExtensionActivity;
  v11 = [(UIActivity *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_pageMenuController, v8);
    objc_storeStrong((id *)&v12->_webExtension, a4);
    objc_storeStrong((id *)&v12->_tab, a5);
    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v12 selector:sel__reloadActivitySoon name:@"activityContentsDidUpdate" object:v12->_webExtension];

    v14 = v12;
  }

  return v12;
}

- (id)activityTitle
{
  return (id)[(WBSWebExtensionData *)self->_webExtension displayShortName];
}

- (BOOL)_wantsOriginalImageColor
{
  v2 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pageMenuController);
  LOBYTE(v2) = [WeakRetained wantsTemplateIconForTab:v2->_tab] ^ 1;

  return (char)v2;
}

- (id)_actionImage
{
  if ([(_SFWebExtensionActivity *)self _wantsOriginalImageColor])
  {
    v3 = 0;
  }
  else
  {
    v3 = [(_SFWebExtensionActivity *)self _activityImage];
  }

  return v3;
}

- (id)_activityImage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pageMenuController);
  v4 = [WeakRetained iconForTab:self->_tab];

  return v4;
}

- (id)activityType
{
  v2 = NSString;
  v3 = [(WBSWebExtensionData *)self->_webExtension composedIdentifier];
  v4 = [v2 stringWithFormat:@"%@-%@", @"com.apple.mobilesafari.webextension", v3];

  return v4;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return [(WBSWebExtensionData *)self->_webExtension shouldShowToolbarItemForTab:self->_tab];
}

- (BOOL)_isEnabled
{
  return ![(_SFWebExtensionActivity *)self _isDisabled];
}

- (BOOL)_isDisabled
{
  v2 = self;
  v3 = [(WBSWebExtensionData *)self->_webExtension toolbarItem];
  LOBYTE(v2) = [v3 isEnabledForTab:v2->_tab] ^ 1;

  return (char)v2;
}

- (void)performActivity
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
  v3 = [WeakRetained presentingViewController];
  v4 = _SFPopoverSourceInfoForViewController();
  [(UIActivity *)self activityDidFinish:1];
  id v5 = objc_loadWeakRetained((id *)&self->_pageMenuController);
  [v5 performActionForTab:self->_tab parentViewController:v3 popoverSourceInfo:v4];
}

- (BOOL)_managesOwnPresentation
{
  return 1;
}

- (id)_activityBadgeTextColor
{
  return (id)[MEMORY[0x1E4FB1618] labelColor];
}

- (id)_activityBadgeColor
{
  return (id)objc_msgSend(MEMORY[0x1E4FB1618], "sf_colorNamed:", @"shareSheetBadgeBackgroundColor");
}

- (id)_activityBadgeText
{
  v3 = [(WBSWebExtensionData *)self->_webExtension toolbarItem];
  v4 = [v3 badgeTextForTab:self->_tab];

  return v4;
}

- (id)_activityStatusImage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pageMenuController);
  if ([WeakRetained shouldShowWarningTriangleImageForTab:self->_tab])
  {
    v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"exclamationmark.triangle.fill"];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_activityStatusTintColor
{
  return (id)[MEMORY[0x1E4FB1618] systemOrangeColor];
}

- (void)_reloadActivitySoon
{
}

- (void)_reloadActivity
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:a2 object:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
  if (([WeakRetained isBeingDismissed] & 1) == 0) {
    [WeakRetained _reloadActivity:self];
  }
}

- (UIActivityViewController)parentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);

  return (UIActivityViewController *)WeakRetained;
}

- (void)setParentViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_destroyWeak((id *)&self->_pageMenuController);
  objc_storeStrong((id *)&self->_tab, 0);

  objc_storeStrong((id *)&self->_webExtension, 0);
}

@end