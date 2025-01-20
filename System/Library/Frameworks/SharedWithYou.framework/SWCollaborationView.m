@interface SWCollaborationView
- (BOOL)_shouldOverrideSymbolConfigForIWork;
- (BOOL)_shouldOverrideSymbolConfigForVisionFreeform;
- (NSString)headerSubtitle;
- (NSString)headerTitle;
- (NSString)manageButtonTitle;
- (NSUInteger)activeParticipantCount;
- (SWCollaborationView)initWithButtonView:(id)a3;
- (SWCollaborationView)initWithItemProvider:(NSItemProvider *)itemProvider;
- (UIImage)headerImage;
- (UIView)typeErasedButtonView;
- (_SWCollaborationButtonViewImpl)buttonView;
- (id)cloudSharingControllerDelegate;
- (id)cloudSharingDelegate;
- (id)delegate;
- (void)dismissPopover:(void *)completion;
- (void)dismissPopoverAnimated:(BOOL)a3 completion:(id)a4;
- (void)setActiveParticipantCount:(NSUInteger)activeParticipantCount;
- (void)setButtonView:(id)a3;
- (void)setCloudSharingControllerDelegate:(id)cloudSharingControllerDelegate;
- (void)setCloudSharingDelegate:(id)cloudSharingDelegate;
- (void)setContentView:(UIView *)detailViewListContentView;
- (void)setDelegate:(id)delegate;
- (void)setHeaderImage:(UIImage *)headerImage;
- (void)setHeaderSubtitle:(NSString *)headerSubtitle;
- (void)setHeaderTitle:(NSString *)headerTitle;
- (void)setManageButtonTitle:(NSString *)manageButtonTitle;
- (void)setShowManageButton:(BOOL)showManageButton;
- (void)setTypeErasedButtonView:(id)a3;
- (void)updatePlaceholderGlyphScale:(int64_t)a3 weight:(int64_t)a4 pointSize:(double)a5;
@end

@implementation SWCollaborationView

- (SWCollaborationView)initWithButtonView:(id)a3
{
  v24[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SWCollaborationView;
  v6 = -[SWCollaborationView initWithFrame:](&v23, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v6)
  {
    [v5 setOuterButton:v6];
    objc_storeStrong((id *)&v6->_typeErasedButtonView, a3);
    [(SWCollaborationView *)v6 addSubview:v6->_typeErasedButtonView];
    [(UIView *)v6->_typeErasedButtonView setTranslatesAutoresizingMaskIntoConstraints:0];
    v17 = (void *)MEMORY[0x1E4F28DC8];
    v21 = [(UIView *)v6->_typeErasedButtonView leadingAnchor];
    v20 = [(SWCollaborationView *)v6 leadingAnchor];
    v19 = [v21 constraintEqualToAnchor:v20];
    v24[0] = v19;
    v18 = [(UIView *)v6->_typeErasedButtonView trailingAnchor];
    v7 = [(SWCollaborationView *)v6 trailingAnchor];
    v8 = [v18 constraintEqualToAnchor:v7];
    v24[1] = v8;
    v9 = [(UIView *)v6->_typeErasedButtonView topAnchor];
    v10 = [(SWCollaborationView *)v6 topAnchor];
    [v9 constraintEqualToAnchor:v10];
    v11 = id v22 = v5;
    v24[2] = v11;
    v12 = [(UIView *)v6->_typeErasedButtonView bottomAnchor];
    v13 = [(SWCollaborationView *)v6 bottomAnchor];
    v14 = [v12 constraintEqualToAnchor:v13];
    v24[3] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:4];
    [v17 activateConstraints:v15];

    id v5 = v22;
  }

  return v6;
}

- (BOOL)_shouldOverrideSymbolConfigForVisionFreeform
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 bundleIdentifier];

  return 0;
}

- (BOOL)_shouldOverrideSymbolConfigForIWork
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 bundleIdentifier];

  v4 = [MEMORY[0x1E4F1CA48] array];
  if ([v3 length]) {
    char v5 = [v4 containsObject:v3];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (SWCollaborationView)initWithItemProvider:(NSItemProvider *)itemProvider
{
  v4 = itemProvider;
  char v5 = [[_SWCollaborationButtonViewImpl alloc] initWithItemProvider:v4];

  v6 = [(SWCollaborationView *)self initWithButtonView:v5];
  return v6;
}

- (void)setDelegate:(id)delegate
{
  id v4 = delegate;
  sub_18FB41DA0(self, "buttonView");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setDelegate:v4];
}

- (void)dismissPopover:(void *)completion
{
  id v4 = completion;
  sub_18FB41DA0(self, "buttonView");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 dismissPopoverAnimated:1 completion:v4];
}

- (void)setContentView:(UIView *)detailViewListContentView
{
  id v4 = detailViewListContentView;
  sub_18FB41DA0(self, "buttonView");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setDetailViewListContent:v4];
}

- (void)dismissPopoverAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  sub_18FB41DA0(self, "buttonView");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 dismissPopoverAnimated:v4 completion:v6];
}

- (void)setActiveParticipantCount:(NSUInteger)activeParticipantCount
{
  sub_18FB41DA0(self, "buttonView");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setActiveParticipantCount:activeParticipantCount];
}

- (void)setManageButtonTitle:(NSString *)manageButtonTitle
{
  v8 = manageButtonTitle;
  if (!v8 || (id v4 = v8, ![(NSString *)v8 length]))
  {
    id v5 = SWFrameworkBundle();
    id v4 = [v5 localizedStringForKey:@"Manage Share" value:&stru_1EDF19D18 table:@"SharedWithYou"];
  }
  id v6 = sub_18FB41DA0(self, "buttonView");
  [v6 setManageButtonTitle:v4];

  id v7 = self->_manageButtonTitle;
  self->_manageButtonTitle = v4;
}

- (void)setShowManageButton:(BOOL)showManageButton
{
  BOOL v3 = showManageButton;
  sub_18FB41DA0(self, "buttonView");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setShowManageButton:v3];
}

- (void)setHeaderTitle:(NSString *)headerTitle
{
  id v4 = headerTitle;
  sub_18FB41DA0(self, "buttonView");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setHeaderTitle:v4];
}

- (void)setHeaderSubtitle:(NSString *)headerSubtitle
{
  id v4 = headerSubtitle;
  sub_18FB41DA0(self, "buttonView");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setHeaderSubtitle:v4];
}

- (void)setHeaderImage:(UIImage *)headerImage
{
  id v4 = headerImage;
  sub_18FB41DA0(self, "buttonView");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setHeaderImage:v4];
}

- (void)updatePlaceholderGlyphScale:(int64_t)a3 weight:(int64_t)a4 pointSize:(double)a5
{
  sub_18FB41DA0(self, "buttonView");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 updatePlaceHolderSymbolScale:a3 weight:a4 pointSize:a5];
}

- (UIView)typeErasedButtonView
{
  return self->_typeErasedButtonView;
}

- (void)setTypeErasedButtonView:(id)a3
{
}

- (id)cloudSharingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudSharingDelegate);

  return WeakRetained;
}

- (void)setCloudSharingDelegate:(id)cloudSharingDelegate
{
}

- (NSUInteger)activeParticipantCount
{
  return self->_activeParticipantCount;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (NSString)headerSubtitle
{
  return self->_headerSubtitle;
}

- (UIImage)headerImage
{
  return self->_headerImage;
}

- (id)cloudSharingControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cloudSharingControllerDelegate);

  return WeakRetained;
}

- (void)setCloudSharingControllerDelegate:(id)cloudSharingControllerDelegate
{
}

- (NSString)manageButtonTitle
{
  return self->_manageButtonTitle;
}

- (_SWCollaborationButtonViewImpl)buttonView
{
  return self->_buttonView;
}

- (void)setButtonView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonView, 0);
  objc_storeStrong((id *)&self->_manageButtonTitle, 0);
  objc_destroyWeak((id *)&self->_cloudSharingControllerDelegate);
  objc_storeStrong((id *)&self->_headerImage, 0);
  objc_storeStrong((id *)&self->_headerSubtitle, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_cloudSharingDelegate);

  objc_storeStrong((id *)&self->_typeErasedButtonView, 0);
}

@end