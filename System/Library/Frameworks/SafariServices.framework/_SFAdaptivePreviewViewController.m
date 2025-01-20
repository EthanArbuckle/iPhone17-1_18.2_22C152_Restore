@interface _SFAdaptivePreviewViewController
- (BOOL)_allowsUserInteractionWhenPreviewedInContextMenu;
- (BOOL)showingLinkPreview;
- (CGSize)preferredDocumentContentSize;
- (NSArray)linkActions;
- (NSURL)URL;
- (UIViewController)contentViewController;
- (_SFAdaptivePreviewViewController)initWithURL:(id)a3;
- (_SFAdaptivePreviewViewControllerDelegate)delegate;
- (_WKActivatedElementInfo)activatedElementInfo;
- (void)_addViewFromViewController:(id)a3;
- (void)_removeViewController:(id)a3;
- (void)_setUpLinkPreviewViewControllerIfNeeded;
- (void)_setUpTextPreviewViewControllerIfNeeded;
- (void)_updatePreferredContentSize;
- (void)linkPreviewHeader:(id)a3 didEnableLinkPreview:(BOOL)a4;
- (void)linkPreviewHeaderBoundsDidChange:(id)a3;
- (void)setActivatedElementInfo:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLinkActions:(id)a3;
- (void)setLinkPreviewEnabled:(BOOL)a3;
- (void)setPreferredDocumentContentSize:(CGSize)a3;
- (void)setURL:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation _SFAdaptivePreviewViewController

- (_SFAdaptivePreviewViewController)initWithURL:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFAdaptivePreviewViewController;
  v5 = [(_SFAdaptivePreviewViewController *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    URL = v5->_URL;
    v5->_URL = (NSURL *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)_SFAdaptivePreviewViewController;
  [(_SFAdaptivePreviewViewController *)&v5 viewDidLoad];
  v3 = [(_SFAdaptivePreviewViewController *)self view];
  id v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v3 setBackgroundColor:v4];

  if (_SFShouldShowLinkPreviews()) {
    [(_SFAdaptivePreviewViewController *)self _setUpLinkPreviewViewControllerIfNeeded];
  }
  else {
    [(_SFAdaptivePreviewViewController *)self _setUpTextPreviewViewControllerIfNeeded];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_SFAdaptivePreviewViewController;
  [(_SFAdaptivePreviewViewController *)&v4 viewWillAppear:a3];
  [(_SFAdaptivePreviewViewController *)self _updatePreferredContentSize];
}

- (void)_setUpLinkPreviewViewControllerIfNeeded
{
  if (!self->_linkPreviewViewController)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_super v4 = [WeakRetained adaptivePreviewViewController:self requestLinkPreviewViewControllerWithURL:self->_URL];
    linkPreviewViewController = self->_linkPreviewViewController;
    self->_linkPreviewViewController = v4;

    -[_SFBrowserViewProviding setPreferredContentSize:](self->_linkPreviewViewController, "setPreferredContentSize:", self->_preferredDocumentContentSize.width, self->_preferredDocumentContentSize.height);
    [(_SFAdaptivePreviewViewController *)self addChildViewController:self->_linkPreviewViewController];
    [(_SFAdaptivePreviewViewController *)self _addViewFromViewController:self->_linkPreviewViewController];
    uint64_t v6 = self->_linkPreviewViewController;
    [(_SFBrowserViewProviding *)v6 didMoveToParentViewController:self];
  }
}

- (void)_addViewFromViewController:(id)a3
{
  v23[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [(_SFAdaptivePreviewViewController *)self view];
  uint64_t v6 = [v4 view];

  [v5 addSubview:v6];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  v7 = [v6 bottomAnchor];
  v8 = [v5 bottomAnchor];
  v9 = [v7 constraintEqualToAnchor:v8];

  LODWORD(v10) = 1144586240;
  v19 = v9;
  [v9 setPriority:v10];
  v20 = (void *)MEMORY[0x1E4F28DC8];
  v22 = [v6 leadingAnchor];
  v21 = [v5 leadingAnchor];
  v11 = [v22 constraintEqualToAnchor:v21];
  v23[0] = v11;
  v12 = [v6 trailingAnchor];
  v13 = [v5 trailingAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  v23[1] = v14;
  v15 = [v6 topAnchor];
  v16 = [v5 topAnchor];
  v17 = [v15 constraintEqualToAnchor:v16];
  v23[2] = v17;
  v23[3] = v9;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];
  [v20 activateConstraints:v18];
}

- (void)_setUpTextPreviewViewControllerIfNeeded
{
  if (!self->_textPreviewViewController)
  {
    v3 = [[_SFURLTextPreviewViewController alloc] initWithURL:self->_URL];
    textPreviewViewController = self->_textPreviewViewController;
    self->_textPreviewViewController = v3;

    [(_SFAdaptivePreviewViewController *)self addChildViewController:self->_textPreviewViewController];
    [(_SFAdaptivePreviewViewController *)self _addViewFromViewController:self->_textPreviewViewController];
    [(_SFURLTextPreviewViewController *)self->_textPreviewViewController didMoveToParentViewController:self];
    id v5 = [(_SFURLTextPreviewViewController *)self->_textPreviewViewController _previewHeader];
    [v5 setDelegate:self];
  }
}

- (void)_removeViewController:(id)a3
{
  id v4 = (_SFURLTextPreviewViewController *)a3;
  if (v4)
  {
    v7 = v4;
    id v5 = [(_SFURLTextPreviewViewController *)v4 view];
    [v5 removeFromSuperview];

    [(_SFAdaptivePreviewViewController *)self removeChildViewController:v7];
    [(_SFURLTextPreviewViewController *)v7 didMoveToParentViewController:0];
    id v4 = v7;
    p_textPreviewViewController = &self->_textPreviewViewController;
    if (self->_textPreviewViewController == v7
      || (p_textPreviewViewController = &self->_linkPreviewViewController,
          (_SFURLTextPreviewViewController *)self->_linkPreviewViewController == v7))
    {
      void *p_textPreviewViewController = 0;

      id v4 = v7;
    }
  }
}

- (void)setLinkPreviewEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    [(_SFAdaptivePreviewViewController *)self _setUpLinkPreviewViewControllerIfNeeded];
    id v5 = &OBJC_IVAR____SFAdaptivePreviewViewController__textPreviewViewController;
  }
  else
  {
    [(_SFAdaptivePreviewViewController *)self _setUpTextPreviewViewControllerIfNeeded];
    id v5 = &OBJC_IVAR____SFAdaptivePreviewViewController__linkPreviewViewController;
  }
  [(_SFAdaptivePreviewViewController *)self _removeViewController:*(Class *)((char *)&self->super.super.super.isa + *v5)];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58___SFAdaptivePreviewViewController_setLinkPreviewEnabled___block_invoke;
  v8[3] = &unk_1E5C724D8;
  v8[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v8 animations:0.25];
  uint64_t v6 = [NSNumber numberWithBool:v3];
  CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F1D3B8];
  CFPreferencesSetAppValue((CFStringRef)*MEMORY[0x1E4F789F0], v6, (CFStringRef)*MEMORY[0x1E4F1D3B8]);
  CFPreferencesAppSynchronize(v7);
}

- (UIViewController)contentViewController
{
  linkPreviewViewController = self->_linkPreviewViewController;
  if (!linkPreviewViewController) {
    linkPreviewViewController = self->_textPreviewViewController;
  }
  return (UIViewController *)linkPreviewViewController;
}

- (BOOL)showingLinkPreview
{
  return self->_linkPreviewViewController != 0;
}

- (BOOL)_allowsUserInteractionWhenPreviewedInContextMenu
{
  return 1;
}

- (void)setPreferredDocumentContentSize:(CGSize)a3
{
  if (a3.width != self->_preferredDocumentContentSize.width || a3.height != self->_preferredDocumentContentSize.height)
  {
    self->_preferredDocumentContentSize = a3;
    linkPreviewViewController = self->_linkPreviewViewController;
    if (linkPreviewViewController)
    {
      -[_SFBrowserViewProviding setPreferredContentSize:](linkPreviewViewController, "setPreferredContentSize:");
      [(_SFAdaptivePreviewViewController *)self _updatePreferredContentSize];
    }
  }
}

- (void)_updatePreferredContentSize
{
  textPreviewViewController = self->_textPreviewViewController;
  if (textPreviewViewController)
  {
    id v4 = [(_SFURLTextPreviewViewController *)textPreviewViewController view];
    id v5 = (void *)MEMORY[0x1E4FB1EB0];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __63___SFAdaptivePreviewViewController__updatePreferredContentSize__block_invoke;
    v18 = &unk_1E5C72238;
    v19 = self;
    id v20 = v4;
    id v6 = v4;
    [v5 performWithoutAnimation:&v15];
    CFStringRef v7 = [(_SFAdaptivePreviewViewController *)self view];
    [v7 bounds];
    double Width = CGRectGetWidth(v22);

    LODWORD(v9) = 1148846080;
    LODWORD(v10) = 1112014848;
    objc_msgSend(v6, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", Width, 0.0, v9, v10);
    [(_SFAdaptivePreviewViewController *)self setPreferredContentSize:0.0];
  }
  else if (self->_linkPreviewViewController && self->_preferredDocumentContentSize.width != 0.0)
  {
    double height = self->_preferredDocumentContentSize.height;
    if (height == 0.0)
    {
      double v14 = 0.0;
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained headerViewHeightForAdaptivePreviewViewController:self];
      double height = height + v13;

      double v14 = self->_preferredDocumentContentSize.width;
    }
    -[_SFAdaptivePreviewViewController setPreferredContentSize:](self, "setPreferredContentSize:", v14, height);
  }
}

- (void)linkPreviewHeader:(id)a3 didEnableLinkPreview:(BOOL)a4
{
  BOOL v4 = a4;
  if (!a4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained adaptivePreviewViewControllerWillDisableLinkPreview:self];
    }
  }

  [(_SFAdaptivePreviewViewController *)self setLinkPreviewEnabled:v4];
}

- (void)linkPreviewHeaderBoundsDidChange:(id)a3
{
  if (self->_linkPreviewViewController) {
    [(_SFAdaptivePreviewViewController *)self _updatePreferredContentSize];
  }
}

- (_SFAdaptivePreviewViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_SFAdaptivePreviewViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)linkActions
{
  return self->_linkActions;
}

- (void)setLinkActions:(id)a3
{
}

- (_WKActivatedElementInfo)activatedElementInfo
{
  return self->_activatedElementInfo;
}

- (void)setActivatedElementInfo:(id)a3
{
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (CGSize)preferredDocumentContentSize
{
  double width = self->_preferredDocumentContentSize.width;
  double height = self->_preferredDocumentContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_activatedElementInfo, 0);
  objc_storeStrong((id *)&self->_linkActions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_linkPreviewViewController, 0);

  objc_storeStrong((id *)&self->_textPreviewViewController, 0);
}

@end