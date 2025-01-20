@interface CKBusinessMacToolbarViewController
- (BOOL)showingInStandAloneWindow;
- (CGRect)_detailsPopoverFrame;
- (CKBusinessMacToolbarView)toolbarView;
- (CKBusinessMacToolbarViewController)initWithConversation:(id)a3 showingInStandAloneWindow:(BOOL)a4;
- (CKConversation)conversation;
- (IMHandle)handle;
- (UIView)detailsPopoverPresentationSourceView;
- (void)_handleAddressBookPartialChange:(id)a3;
- (void)_updateBannerImageData;
- (void)_updateBrandColors;
- (void)_updateFallbackTitle;
- (void)dealloc;
- (void)loadView;
- (void)setDetailsPopoverPresentationSourceView:(id)a3;
- (void)setHandle:(id)a3;
- (void)setToolbarView:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation CKBusinessMacToolbarViewController

- (CKBusinessMacToolbarViewController)initWithConversation:(id)a3 showingInStandAloneWindow:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKBusinessMacToolbarViewController;
  v8 = [(CKBusinessMacToolbarViewController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_handle, a3);
    v9->_showingInStandAloneWindow = a4;
  }

  return v9;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CKBusinessMacToolbarViewController;
  [(CKBusinessMacToolbarViewController *)&v4 dealloc];
}

- (void)loadView
{
  v3 = [CKBusinessMacToolbarView alloc];
  objc_super v4 = -[CKBusinessMacToolbarView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(CKBusinessMacToolbarViewController *)self setToolbarView:v4];

  BOOL v5 = [(CKBusinessMacToolbarViewController *)self showingInStandAloneWindow];
  v6 = [(CKBusinessMacToolbarViewController *)self toolbarView];
  [v6 setShowingInStandAloneWindow:v5];

  id v7 = +[CKUIBehavior sharedBehaviors];
  int v8 = [v7 useMacToolbar];
  v9 = +[CKUIBehavior sharedBehaviors];
  v10 = v9;
  if (v8) {
    [v9 macAppKitToolbarHeight];
  }
  else {
    [v9 marzNavigationBarHeight];
  }
  double v12 = v11;
  v13 = [(CKBusinessMacToolbarViewController *)self toolbarView];
  [v13 setPreferredHeight:v12];

  v14 = [(CKBusinessMacToolbarViewController *)self toolbarView];
  [(CKBusinessMacToolbarViewController *)self setView:v14];

  id v15 = objc_alloc(MEMORY[0x1E4F42FF0]);
  [(CKBusinessMacToolbarViewController *)self _detailsPopoverFrame];
  v16 = objc_msgSend(v15, "initWithFrame:");
  [(CKBusinessMacToolbarViewController *)self setDetailsPopoverPresentationSourceView:v16];

  v17 = [(CKBusinessMacToolbarViewController *)self detailsPopoverPresentationSourceView];
  [v17 setBackgroundColor:0];

  v18 = [(CKBusinessMacToolbarViewController *)self detailsPopoverPresentationSourceView];
  [v18 setOpaque:0];

  v19 = [(CKBusinessMacToolbarViewController *)self detailsPopoverPresentationSourceView];
  [v19 setUserInteractionEnabled:0];

  v20 = [(CKBusinessMacToolbarViewController *)self view];
  v21 = [(CKBusinessMacToolbarViewController *)self detailsPopoverPresentationSourceView];
  [v20 addSubview:v21];

  [(CKBusinessMacToolbarViewController *)self _updateBannerImageData];
  [(CKBusinessMacToolbarViewController *)self _updateFallbackTitle];

  [(CKBusinessMacToolbarViewController *)self _updateBrandColors];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)CKBusinessMacToolbarViewController;
  [(CKBusinessMacToolbarViewController *)&v4 viewDidLoad];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__handleAddressBookPartialChange_ name:*MEMORY[0x1E4F6CA60] object:0];
}

- (void)viewWillLayoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)CKBusinessMacToolbarViewController;
  [(CKBusinessMacToolbarViewController *)&v19 viewWillLayoutSubviews];
  [(CKBusinessMacToolbarViewController *)self _detailsPopoverFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(CKBusinessMacToolbarViewController *)self detailsPopoverPresentationSourceView];
  [v11 frame];
  v21.origin.x = v12;
  v21.origin.y = v13;
  v21.size.width = v14;
  v21.size.height = v15;
  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  BOOL v16 = CGRectEqualToRect(v20, v21);

  if (!v16)
  {
    v17 = [(CKBusinessMacToolbarViewController *)self detailsPopoverPresentationSourceView];
    objc_msgSend(v17, "setFrame:", v4, v6, v8, v10);
  }
  v18 = [(CKBusinessMacToolbarViewController *)self toolbarView];
  objc_msgSend(v18, "setDetailsPopoverFrame:", v4, v6, v8, v10);
}

- (CGRect)_detailsPopoverFrame
{
  double v3 = +[CKUIBehavior sharedBehaviors];
  [v3 macNSToolbarItemSize];
  double v5 = v4;
  double v7 = v6;

  double v8 = [(CKBusinessMacToolbarViewController *)self view];
  [v8 frame];
  double v10 = v9;

  double v11 = +[CKUIBehavior sharedBehaviors];
  [v11 macAppKitToolbarHeight];
  double v13 = v12;

  CGFloat v14 = [(CKBusinessMacToolbarViewController *)self view];
  LODWORD(v11) = [v14 _shouldReverseLayoutDirection];

  CGFloat v15 = +[CKUIBehavior sharedBehaviors];
  [v15 macNSToolbarItemInterItemSpacing];
  double v17 = v16;

  double v18 = v10 - v17 - v5;
  if (v11) {
    double v18 = v17;
  }
  double v19 = v13 * 0.5 - v7 * 0.5;
  double v20 = v5;
  double v21 = v7;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (void)_updateBannerImageData
{
  double v3 = [(CKBusinessMacToolbarViewController *)self handle];
  double v4 = [v3 brandWideLogoImageData];
  uint64_t v5 = [v4 length];
  double v6 = [(CKBusinessMacToolbarViewController *)self handle];
  double v7 = v6;
  if (v5) {
    [v6 brandWideLogoImageData];
  }
  else {
  id v9 = [v6 brandSquareLogoImageData];
  }

  double v8 = [(CKBusinessMacToolbarViewController *)self toolbarView];
  [v8 setBannerImageData:v9];
}

- (void)_updateFallbackTitle
{
  double v3 = [(CKBusinessMacToolbarViewController *)self handle];
  double v4 = [v3 name];
  if ([v4 length])
  {
    uint64_t v5 = [(CKBusinessMacToolbarViewController *)self handle];
    [v5 name];
  }
  else
  {
    uint64_t v5 = IMSharedUtilitiesFrameworkBundle();
    [v5 localizedStringForKey:@"BUSINESS_NOTIFICATION_TITLE" value:&stru_1EDE4CA38 table:@"IMSharedUtilities"];
  }
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  double v6 = [(CKBusinessMacToolbarViewController *)self toolbarView];
  [v6 setFallbackTitle:v7];
}

- (void)_updateBrandColors
{
  double v3 = +[CKUIBehavior sharedBehaviors];
  double v4 = [v3 theme];
  uint64_t v5 = [(CKBusinessMacToolbarViewController *)self handle];
  double v6 = [v4 primaryBrandColorForBusinessHandle:v5];
  id v7 = [(CKBusinessMacToolbarViewController *)self toolbarView];
  [v7 setBackgroundColor:v6];

  id v12 = [(CKBusinessMacToolbarViewController *)self toolbarView];
  double v8 = +[CKUIBehavior sharedBehaviors];
  id v9 = [v8 theme];
  double v10 = [(CKBusinessMacToolbarViewController *)self handle];
  double v11 = [v9 secondaryBrandColorForBusinessHandle:v10];
  [v12 setFallbackTitleColor:v11];
}

- (void)_handleAddressBookPartialChange:(id)a3
{
  double v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6CA80]];

  if ([v5 isEqualToString:*MEMORY[0x1E4F6CA78]])
  {
    [(CKBusinessMacToolbarViewController *)self _updateBannerImageData];
  }
  else if ([v5 isEqualToString:*MEMORY[0x1E4F6CA90]])
  {
    [(CKBusinessMacToolbarViewController *)self _updateFallbackTitle];
  }
  else if ([v5 isEqualToString:*MEMORY[0x1E4F6CA68]])
  {
    [(CKBusinessMacToolbarViewController *)self _updateBrandColors];
  }
}

- (UIView)detailsPopoverPresentationSourceView
{
  return self->_detailsPopoverPresentationSourceView;
}

- (void)setDetailsPopoverPresentationSourceView:(id)a3
{
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (IMHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (BOOL)showingInStandAloneWindow
{
  return self->_showingInStandAloneWindow;
}

- (CKBusinessMacToolbarView)toolbarView
{
  return self->_toolbarView;
}

- (void)setToolbarView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolbarView, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_conversation, 0);

  objc_storeStrong((id *)&self->_detailsPopoverPresentationSourceView, 0);
}

@end