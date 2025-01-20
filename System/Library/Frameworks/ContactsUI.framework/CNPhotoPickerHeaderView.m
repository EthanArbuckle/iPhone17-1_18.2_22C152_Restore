@interface CNPhotoPickerHeaderView
- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)resignFirstResponder;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (CAShapeLayer)clearAvatarImageButtonClippingLayer;
- (CGSize)sizeOfPrimaryAvatar;
- (CNPhotoPickerHeaderView)initWithContact:(id)a3;
- (CNPhotoPickerHeaderView)initWithVisualIdentity:(id)a3;
- (CNPhotoPickerHeaderView)initWithVisualIdentity:(id)a3 avatarViewController:(id)a4;
- (CNPhotoPickerHeaderViewDelegate)delegate;
- (CNPhotoPickerHeaderViewTextField)identityNameTextField;
- (CNPhotoPickerProviderItem)placeholderProviderItem;
- (CNVisualIdentity)visualIdentity;
- (CNVisualIdentityAvatarViewController)avatarViewController;
- (NSArray)subviewsConstraints;
- (UIButton)clearAvatarImageButton;
- (UIButton)clearIdentityNameButton;
- (UIGestureRecognizer)tapGestureRecognizer;
- (UIView)clearAvatarImageButtonBackground;
- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4;
- (void)didMoveToWindow;
- (void)didTapClearAvatarImageButton;
- (void)didTapClearIdentityNameButton;
- (void)didTapHeaderView;
- (void)dropInteraction:(id)a3 performDrop:(id)a4;
- (void)layoutSubviews;
- (void)setAvatarViewController:(id)a3;
- (void)setClearAvatarImageButton:(id)a3;
- (void)setClearAvatarImageButtonBackground:(id)a3;
- (void)setClearAvatarImageButtonClippingLayer:(id)a3;
- (void)setClearAvatarImageButtonHidden:(BOOL)a3;
- (void)setClearIdentityNameButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIdentityNameTextField:(id)a3;
- (void)setPlaceholderProviderItem:(id)a3;
- (void)setSubviewsConstraints:(id)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)setVisualIdentity:(id)a3;
- (void)setupClearAvatarImageButton;
- (void)setupDragAndDrop;
- (void)setupHeaderViewWithPhotoView:(id)a3;
- (void)setupIdentityNameClearButtonIfNecessary;
- (void)setupIdentityNameTextFieldAndClearButton;
- (void)textFieldDidEndEditing:(id)a3;
- (void)updateConstraints;
- (void)updateIdentityNameTextFieldMaxWidth;
- (void)updateIdentityNameTextFieldPlaceholderWithText:(id)a3;
- (void)updateIdentityNameTextFieldWithIdentity:(id)a3;
- (void)updateImageViewWithIdentity:(id)a3;
- (void)updatePhotoViewWithUpdatedIdentity:(id)a3;
@end

@implementation CNPhotoPickerHeaderView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_clearIdentityNameButton, 0);
  objc_storeStrong((id *)&self->_identityNameTextField, 0);
  objc_storeStrong((id *)&self->_clearAvatarImageButtonClippingLayer, 0);
  objc_storeStrong((id *)&self->_clearAvatarImageButtonBackground, 0);
  objc_storeStrong((id *)&self->_clearAvatarImageButton, 0);
  objc_storeStrong((id *)&self->_avatarViewController, 0);
  objc_storeStrong((id *)&self->_subviewsConstraints, 0);
  objc_storeStrong((id *)&self->_visualIdentity, 0);
  objc_storeStrong((id *)&self->_placeholderProviderItem, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (UIGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setClearIdentityNameButton:(id)a3
{
}

- (UIButton)clearIdentityNameButton
{
  return self->_clearIdentityNameButton;
}

- (void)setIdentityNameTextField:(id)a3
{
}

- (CNPhotoPickerHeaderViewTextField)identityNameTextField
{
  return self->_identityNameTextField;
}

- (void)setClearAvatarImageButtonClippingLayer:(id)a3
{
}

- (CAShapeLayer)clearAvatarImageButtonClippingLayer
{
  return self->_clearAvatarImageButtonClippingLayer;
}

- (void)setClearAvatarImageButtonBackground:(id)a3
{
}

- (UIView)clearAvatarImageButtonBackground
{
  return self->_clearAvatarImageButtonBackground;
}

- (void)setClearAvatarImageButton:(id)a3
{
}

- (UIButton)clearAvatarImageButton
{
  return self->_clearAvatarImageButton;
}

- (void)setAvatarViewController:(id)a3
{
}

- (CNVisualIdentityAvatarViewController)avatarViewController
{
  return self->_avatarViewController;
}

- (void)setSubviewsConstraints:(id)a3
{
}

- (NSArray)subviewsConstraints
{
  return self->_subviewsConstraints;
}

- (void)setVisualIdentity:(id)a3
{
}

- (CNVisualIdentity)visualIdentity
{
  return self->_visualIdentity;
}

- (void)setPlaceholderProviderItem:(id)a3
{
}

- (CNPhotoPickerProviderItem)placeholderProviderItem
{
  return self->_placeholderProviderItem;
}

- (void)setDelegate:(id)a3
{
}

- (CNPhotoPickerHeaderViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNPhotoPickerHeaderViewDelegate *)WeakRetained;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v5 = a3;
  id v6 = [(CNPhotoPickerHeaderView *)self tapGestureRecognizer];

  return v6 == v5;
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v5 = a4;
  id v6 = [v5 items];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    v8 = [v5 items];
    v9 = [v8 objectAtIndexedSubscript:0];

    uint64_t v10 = *MEMORY[0x1E4F225F8];
    v11 = [v9 itemProvider];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __55__CNPhotoPickerHeaderView_dropInteraction_performDrop___block_invoke;
    v13[3] = &unk_1E549AC68;
    v13[4] = self;
    id v12 = (id)[v11 loadDataRepresentationForTypeIdentifier:v10 completionHandler:v13];
  }
}

void __55__CNPhotoPickerHeaderView_dropInteraction_performDrop___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    uint64_t v7 = [a3 localizedDescription];
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNPhotoPickerHeaderView.m", 465, 3, @"Unable to copy data for photo picker header photo drop operation: %@", v8, v9, v10, v11, (uint64_t)v7);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__CNPhotoPickerHeaderView_dropInteraction_performDrop___block_invoke_2;
    block[3] = &unk_1E549BF80;
    block[4] = *(void *)(a1 + 32);
    id v13 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __55__CNPhotoPickerHeaderView_dropInteraction_performDrop___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  [v2 photoPickerHeaderViewDidReceiveDroppedImageData:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) avatarViewController];
  [v3 endDropAppearance];
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v5 = a4;
  id v6 = [v5 items];
  if ([v6 count] == 1)
  {
    uint64_t v7 = [(CNPhotoPickerHeaderView *)self avatarViewController];
    uint64_t v8 = [v7 view];
    [v8 bounds];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    v17 = [(CNPhotoPickerHeaderView *)self avatarViewController];
    v18 = [v17 view];
    [v5 locationInView:v18];
    v27.x = v19;
    v27.y = v20;
    v28.origin.x = v10;
    v28.origin.y = v12;
    v28.size.width = v14;
    v28.size.height = v16;
    BOOL v21 = CGRectContainsPoint(v28, v27);

    if (v21)
    {
      v22 = [(CNPhotoPickerHeaderView *)self avatarViewController];
      [v22 beginDropAppearance];
      uint64_t v23 = 2;
      goto LABEL_6;
    }
  }
  else
  {
  }
  v22 = [(CNPhotoPickerHeaderView *)self avatarViewController];
  [v22 endDropAppearance];
  uint64_t v23 = 0;
LABEL_6:

  v24 = (void *)[objc_alloc(MEMORY[0x1E4FB1740]) initWithDropOperation:v23];

  return v24;
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  v12[5] = *MEMORY[0x1E4F143B8];
  v4 = (void (__cdecl *)())getkUTTypePNG_56854;
  id v5 = a4;
  id v6 = v4();
  v12[0] = v6;
  uint64_t v7 = getkUTTypeJPEG_56855();
  uint64_t v8 = *MEMORY[0x1E4F22618];
  v12[1] = v7;
  v12[2] = v8;
  uint64_t v9 = *MEMORY[0x1E4F225F8];
  v12[3] = *MEMORY[0x1E4F22550];
  v12[4] = v9;
  CGFloat v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:5];
  LOBYTE(v4) = [v5 hasItemsConformingToTypeIdentifiers:v10];

  return (char)v4;
}

- (void)updateIdentityNameTextFieldPlaceholderWithText:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CNPhotoPickerHeaderView *)self visualIdentity];
  int v6 = [v5 canUpdateGroupName];

  if (v6)
  {
    int v7 = (*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))();
    uint64_t v8 = [(CNPhotoPickerHeaderView *)self identityNameTextField];
    uint64_t v9 = v8;
    if (v7)
    {
      [v8 setRightView:0];

      uint64_t v18 = *MEMORY[0x1E4FB06F8];
      CGFloat v10 = +[CNUIFontRepository visualIdentityPickerHeaderPlaceholderFont];
      v19[0] = v10;
      double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];

      id v12 = objc_alloc(MEMORY[0x1E4F28B18]);
      double v13 = CNContactsUIBundle();
      CGFloat v14 = [v13 localizedStringForKey:@"PHOTO_HEADER_TEXTFIELD_GROUP_PLACEHOLDER" value:&stru_1ED8AC728 table:@"Localized"];
      double v15 = (void *)[v12 initWithString:v14 attributes:v11];
      CGFloat v16 = [(CNPhotoPickerHeaderView *)self identityNameTextField];
      [v16 setAttributedPlaceholder:v15];
    }
    else
    {
      [v8 setPlaceholder:0];

      double v11 = [(CNPhotoPickerHeaderView *)self identityNameTextField];
      v17 = [(CNPhotoPickerHeaderView *)self clearIdentityNameButton];
      [v11 setRightView:v17];
    }
  }
}

- (void)didTapClearIdentityNameButton
{
  id v3 = [(CNPhotoPickerHeaderView *)self identityNameTextField];
  [v3 setText:0];

  [(CNPhotoPickerHeaderView *)self updateIdentityNameTextFieldPlaceholderWithText:0];
  id v4 = [(CNPhotoPickerHeaderView *)self delegate];
  id v5 = [(CNPhotoPickerHeaderView *)self identityNameTextField];
  [v4 photoPickerHeaderView:self didUpdateIdentityNameTextField:v5 withText:0];

  id v6 = [(CNPhotoPickerHeaderView *)self identityNameTextField];
  [v6 becomeFirstResponder];
}

- (void)didTapHeaderView
{
  id v2 = [(CNPhotoPickerHeaderView *)self identityNameTextField];
  [v2 resignFirstResponder];
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4 = a3;
  id v6 = [(CNPhotoPickerHeaderView *)self delegate];
  id v5 = [v4 text];
  [v6 photoPickerHeaderView:self didUpdateIdentityNameTextField:v4 withText:v5];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 1;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  double v11 = [v9 text];
  id v12 = objc_msgSend(v11, "stringByReplacingCharactersInRange:withString:", location, length, v10);

  uint64_t v13 = [v10 length];
  unint64_t v14 = [v12 length];
  if (v14 < 0x401)
  {
    if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A298] + 16))()) {
      [(CNPhotoPickerHeaderView *)self didTapClearIdentityNameButton];
    }
    else {
      [(CNPhotoPickerHeaderView *)self updateIdentityNameTextFieldPlaceholderWithText:v12];
    }
    v17 = [(CNPhotoPickerHeaderView *)self delegate];
    [v17 photoPickerHeaderView:self didUpdateIdentityNameTextField:v9 withText:v12];
    goto LABEL_9;
  }
  if (v13)
  {
    double v15 = [v9 text];
    uint64_t v16 = [v15 length];

    if (length == v16)
    {
      v17 = [v12 substringToIndex:1024];
      [v9 setText:v17];
      uint64_t v18 = [(CNPhotoPickerHeaderView *)self delegate];
      [v18 photoPickerHeaderView:self didUpdateIdentityNameTextField:v9 withText:v17];

LABEL_9:
    }
  }

  return v14 < 0x401;
}

- (void)didTapClearAvatarImageButton
{
  id v3 = [(CNPhotoPickerHeaderView *)self delegate];
  [v3 photoPickerHeaderViewDidTapClearAvatarImageButton:self];
}

- (void)setupClearAvatarImageButton
{
  id v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark.circle.fill"];
  id v4 = [(CNPhotoPickerHeaderView *)self avatarViewController];
  [v4 setBadgeImage:v3];

  id v5 = [(CNPhotoPickerHeaderView *)self avatarViewController];
  [v5 setBadgeTarget:self action:sel_didTapClearAvatarImageButton];

  id v6 = [CNBadgingAvatarBadgeStyleSettings alloc];
  id v10 = [MEMORY[0x1E4FB1618] systemMidGrayColor];
  int v7 = [MEMORY[0x1E4FB1618] whiteColor];
  uint64_t v8 = [(CNBadgingAvatarBadgeStyleSettings *)v6 initWithPosition:0 color:v10 backgroundColor:v7 cropStyle:0];
  id v9 = [(CNPhotoPickerHeaderView *)self avatarViewController];
  [v9 setBadgeStyleSettings:v8];
}

- (void)setClearAvatarImageButtonHidden:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(CNPhotoPickerHeaderView *)self avatarViewController];
    [v4 setBadgeImage:0];
  }
  else
  {
    [(CNPhotoPickerHeaderView *)self setupClearAvatarImageButton];
  }
}

- (void)updateIdentityNameTextFieldWithIdentity:(id)a3
{
  id v4 = [a3 name];
  id v5 = [(CNPhotoPickerHeaderView *)self identityNameTextField];
  [v5 setText:v4];

  id v7 = [(CNPhotoPickerHeaderView *)self identityNameTextField];
  id v6 = [v7 text];
  [(CNPhotoPickerHeaderView *)self updateIdentityNameTextFieldPlaceholderWithText:v6];
}

- (void)updateImageViewWithIdentity:(id)a3
{
  id v7 = a3;
  id v4 = [v7 avatarImage];

  if (!v4)
  {
    id v5 = [(CNPhotoPickerHeaderView *)self placeholderProviderItem];
    [v5 updateVisualIdentity:v7];
  }
  [(CNPhotoPickerHeaderView *)self setClearAvatarImageButtonHidden:v4 == 0];
  id v6 = [(CNPhotoPickerHeaderView *)self avatarViewController];
  [v6 visualIdentityDidUpdate:v7];
}

- (CGSize)sizeOfPrimaryAvatar
{
  uint64_t v3 = [(CNPhotoPickerHeaderView *)self avatarViewController];
  id v4 = [(CNPhotoPickerHeaderView *)self avatarViewController];
  id v5 = [v4 view];
  [v3 avatarFrameForFocusedAvatarInView:v5];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)updatePhotoViewWithUpdatedIdentity:(id)a3
{
  id v4 = (void *)[a3 mutableCopy];
  [(CNPhotoPickerHeaderView *)self setVisualIdentity:v4];

  id v5 = [(CNPhotoPickerHeaderView *)self visualIdentity];
  [(CNPhotoPickerHeaderView *)self updateImageViewWithIdentity:v5];

  id v6 = [(CNPhotoPickerHeaderView *)self visualIdentity];
  [(CNPhotoPickerHeaderView *)self updateIdentityNameTextFieldWithIdentity:v6];
}

- (void)didMoveToWindow
{
  v5.receiver = self;
  v5.super_class = (Class)CNPhotoPickerHeaderView;
  [(CNPhotoPickerHeaderView *)&v5 didMoveToWindow];
  uint64_t v3 = (void *)MEMORY[0x1E4F28DC8];
  id v4 = [(CNPhotoPickerHeaderView *)self subviewsConstraints];
  [v3 deactivateConstraints:v4];

  [(CNPhotoPickerHeaderView *)self setSubviewsConstraints:0];
  [(CNPhotoPickerHeaderView *)self setNeedsUpdateConstraints];
}

- (void)updateConstraints
{
  v46[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CNPhotoPickerHeaderView *)self subviewsConstraints];

  if (!v3)
  {
    v43 = objc_opt_new();
    id v4 = [(CNPhotoPickerHeaderView *)self avatarViewController];
    objc_super v5 = [v4 view];

    v40 = [v5 topAnchor];
    v38 = [(CNPhotoPickerHeaderView *)self topAnchor];
    v36 = [v40 constraintEqualToAnchor:v38];
    v46[0] = v36;
    id v6 = [v5 centerXAnchor];
    double v7 = [(CNPhotoPickerHeaderView *)self centerXAnchor];
    double v8 = [v6 constraintEqualToAnchor:v7];
    v46[1] = v8;
    double v9 = [v5 widthAnchor];
    double v10 = v5;
    v42 = v5;
    double v11 = [v5 heightAnchor];
    id v12 = [v9 constraintEqualToAnchor:v11];
    v46[2] = v12;
    uint64_t v13 = [v10 heightAnchor];
    unint64_t v14 = [v13 constraintEqualToConstant:115.0];
    v46[3] = v14;
    double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:4];
    [v43 addObjectsFromArray:v15];

    v41 = [(CNPhotoPickerHeaderView *)self identityNameTextField];
    v37 = [v41 leadingAnchor];
    v39 = [(CNPhotoPickerHeaderView *)self layoutMarginsGuide];
    v35 = [v39 leadingAnchor];
    v34 = [v37 constraintGreaterThanOrEqualToAnchor:v35];
    v45[0] = v34;
    v33 = [(CNPhotoPickerHeaderView *)self identityNameTextField];
    v31 = [v33 trailingAnchor];
    v32 = [(CNPhotoPickerHeaderView *)self layoutMarginsGuide];
    v30 = [v32 trailingAnchor];
    v29 = [v31 constraintLessThanOrEqualToAnchor:v30];
    v45[1] = v29;
    CGRect v28 = [(CNPhotoPickerHeaderView *)self identityNameTextField];
    CGPoint v27 = [v28 centerXAnchor];
    v26 = [(CNPhotoPickerHeaderView *)self centerXAnchor];
    v25 = [v27 constraintEqualToAnchor:v26];
    v45[2] = v25;
    uint64_t v16 = [(CNPhotoPickerHeaderView *)self identityNameTextField];
    v17 = [v16 topAnchor];
    uint64_t v18 = [v42 bottomAnchor];
    CGFloat v19 = [v17 constraintEqualToAnchor:v18 constant:12.0];
    v45[3] = v19;
    CGFloat v20 = [(CNPhotoPickerHeaderView *)self identityNameTextField];
    BOOL v21 = [v20 bottomAnchor];
    v22 = [(CNPhotoPickerHeaderView *)self bottomAnchor];
    uint64_t v23 = [v21 constraintEqualToAnchor:v22 constant:-6.0];
    v45[4] = v23;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:5];
    [v43 addObjectsFromArray:v24];

    [MEMORY[0x1E4F28DC8] activateConstraints:v43];
    [(CNPhotoPickerHeaderView *)self setSubviewsConstraints:v43];
  }
  v44.receiver = self;
  v44.super_class = (Class)CNPhotoPickerHeaderView;
  [(CNPhotoPickerHeaderView *)&v44 updateConstraints];
}

- (void)setupIdentityNameClearButtonIfNecessary
{
  uint64_t v3 = [(CNPhotoPickerHeaderView *)self visualIdentity];
  char v4 = [v3 canUpdateGroupName];

  if (v4)
  {
    objc_super v5 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
    [(CNPhotoPickerHeaderView *)self setClearIdentityNameButton:v5];

    id v6 = (void *)MEMORY[0x1E4FB1818];
    uint64_t v7 = *MEMORY[0x1E4FB2A58];
    double v8 = [MEMORY[0x1E4FB1618] systemMidGrayColor];
    objc_msgSend(v6, "cnui_symbolImageNamed:scale:weight:withColor:useFixedSize:compatibleWithTextStyle:", @"xmark.circle.fill", v7, 4, v8, 1, *MEMORY[0x1E4FB2990]);
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    double v9 = [(CNPhotoPickerHeaderView *)self clearIdentityNameButton];
    [v9 setImage:v15 forState:0];

    double v10 = [(CNPhotoPickerHeaderView *)self clearIdentityNameButton];
    objc_msgSend(v10, "setContentEdgeInsets:", 0.0, 5.0, 0.0, 0.0);

    double v11 = [(CNPhotoPickerHeaderView *)self clearIdentityNameButton];
    [v11 addTarget:self action:sel_didTapClearIdentityNameButton forControlEvents:64];

    id v12 = [(CNPhotoPickerHeaderView *)self identityNameTextField];
    uint64_t v13 = [(CNPhotoPickerHeaderView *)self clearIdentityNameButton];
    [v12 setRightView:v13];

    unint64_t v14 = [(CNPhotoPickerHeaderView *)self identityNameTextField];
    [v14 setRightViewMode:3];
  }
  else
  {
    id v15 = [(CNPhotoPickerHeaderView *)self identityNameTextField];
    [v15 setEnabled:0];
  }
}

- (void)updateIdentityNameTextFieldMaxWidth
{
  [(CNPhotoPickerHeaderView *)self layoutMargins];
  double v4 = v3;
  [(CNPhotoPickerHeaderView *)self layoutMargins];
  double v6 = v4 + v5;
  uint64_t v7 = [(CNPhotoPickerHeaderView *)self clearIdentityNameButton];
  [v7 bounds];
  double v9 = v8;

  [(CNPhotoPickerHeaderView *)self bounds];
  double v11 = v10 - v6 - v9;
  id v12 = [(CNPhotoPickerHeaderView *)self identityNameTextField];
  [v12 setMaxWidth:v11];
}

- (void)setupIdentityNameTextFieldAndClearButton
{
  double v3 = [CNPhotoPickerHeaderViewTextField alloc];
  double v4 = -[CNPhotoPickerHeaderViewTextField initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(CNPhotoPickerHeaderView *)self setIdentityNameTextField:v4];

  double v5 = [(CNPhotoPickerHeaderView *)self identityNameTextField];
  [v5 setDelegate:self];

  double v6 = [(CNPhotoPickerHeaderView *)self identityNameTextField];
  [v6 setTextAlignment:1];

  uint64_t v7 = +[CNUIFontRepository visualIdentityPickerHeaderTitleFont];
  double v8 = [(CNPhotoPickerHeaderView *)self identityNameTextField];
  [v8 setFont:v7];

  double v9 = [(CNPhotoPickerHeaderView *)self identityNameTextField];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  [(CNPhotoPickerHeaderView *)self setupIdentityNameClearButtonIfNecessary];
  id v10 = [(CNPhotoPickerHeaderView *)self identityNameTextField];
  [(CNPhotoPickerHeaderView *)self addSubview:v10];
}

- (void)setupHeaderViewWithPhotoView:(id)a3
{
  id v4 = a3;
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CNPhotoPickerHeaderView *)self addSubview:v4];

  double v5 = [(CNPhotoPickerHeaderView *)self layer];
  [v5 setMasksToBounds:0];

  double v6 = [MEMORY[0x1E4FB1618] clearColor];
  [(CNPhotoPickerHeaderView *)self setBackgroundColor:v6];

  id v7 = (id)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_didTapHeaderView];
  [v7 setDelegate:self];
  [(CNPhotoPickerHeaderView *)self addGestureRecognizer:v7];
  [(CNPhotoPickerHeaderView *)self setTapGestureRecognizer:v7];
  [(CNPhotoPickerHeaderView *)self setupIdentityNameTextFieldAndClearButton];
}

- (BOOL)resignFirstResponder
{
  double v3 = [(CNPhotoPickerHeaderView *)self identityNameTextField];
  [v3 resignFirstResponder];

  v5.receiver = self;
  v5.super_class = (Class)CNPhotoPickerHeaderView;
  return [(CNPhotoPickerHeaderView *)&v5 resignFirstResponder];
}

- (void)setupDragAndDrop
{
  id v3 = (id)[objc_alloc(MEMORY[0x1E4FB1738]) initWithDelegate:self];
  [(CNPhotoPickerHeaderView *)self addInteraction:v3];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CNPhotoPickerHeaderView;
  [(CNPhotoPickerHeaderView *)&v3 layoutSubviews];
  [(CNPhotoPickerHeaderView *)self updateIdentityNameTextFieldMaxWidth];
}

- (CNPhotoPickerHeaderView)initWithVisualIdentity:(id)a3 avatarViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNPhotoPickerHeaderView;
  double v9 = -[CNPhotoPickerHeaderView initWithFrame:](&v15, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_avatarViewController, a4);
    objc_storeStrong((id *)&v10->_visualIdentity, a3);
    double v11 = [(CNPhotoPickerHeaderView *)v10 avatarViewController];
    id v12 = [v11 view];
    [(CNPhotoPickerHeaderView *)v10 setupHeaderViewWithPhotoView:v12];

    [(CNPhotoPickerHeaderView *)v10 updatePhotoViewWithUpdatedIdentity:v7];
    [(CNPhotoPickerHeaderView *)v10 setupDragAndDrop];
    uint64_t v13 = v10;
  }

  return v10;
}

- (CNPhotoPickerHeaderView)initWithVisualIdentity:(id)a3
{
  id v4 = a3;
  objc_super v5 = [[CNVisualIdentityAvatarViewController alloc] initWithVisualIdentity:v4];
  double v6 = [(CNPhotoPickerHeaderView *)self initWithVisualIdentity:v4 avatarViewController:v5];

  return v6;
}

- (CNPhotoPickerHeaderView)initWithContact:(id)a3
{
  id v4 = a3;
  objc_super v5 = [[CNVisualIdentity alloc] initWithContact:v4];

  double v6 = [(CNPhotoPickerHeaderView *)self initWithVisualIdentity:v5];
  return v6;
}

@end