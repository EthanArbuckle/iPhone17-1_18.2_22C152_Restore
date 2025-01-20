@interface GKAvatarContainerView
- (GKAvatarContainerViewDelegate)delegate;
- (GKDashboardPlayerPhotoView)playerAvatarView;
- (GKGradientLabel)editLabel;
- (NSLayoutConstraint)imageContainerTopConstraint;
- (UIImageView)editImageBackground;
- (UILabel)emailLabel;
- (UILabel)nicknameLabel;
- (UITapGestureRecognizer)tapGesture;
- (UIView)editImage;
- (UIView)imageContainer;
- (void)awakeFromNib;
- (void)didMoveToSuperview;
- (void)didSelectPlayerAvatarView:(id)a3;
- (void)didSetPlayerAvatarImage:(id)a3;
- (void)layoutSubviews;
- (void)prepareForDefaultNicknameViewController;
- (void)refreshHeaderViewProfileImage;
- (void)refreshViewForLocalPlayer;
- (void)setDelegate:(id)a3;
- (void)setEditImage:(id)a3;
- (void)setEditImageBackground:(id)a3;
- (void)setEditLabel:(id)a3;
- (void)setEmailLabel:(id)a3;
- (void)setImageContainer:(id)a3;
- (void)setImageContainerTopConstraint:(id)a3;
- (void)setNicknameLabel:(id)a3;
- (void)setPlayerAvatarView:(id)a3;
- (void)setTapGesture:(id)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)setupEditImageBackground;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateAvatarEditingAvailability;
@end

@implementation GKAvatarContainerView

- (void)awakeFromNib
{
  v24[2] = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)GKAvatarContainerView;
  [(GKAvatarContainerView *)&v23 awakeFromNib];
  v3 = [(GKAvatarContainerView *)self playerAvatarView];
  [v3 setDelegate:self];

  v4 = [(GKAvatarContainerView *)self playerAvatarView];
  [v4 setAccessibilityIdentifier:@"UIA.GameCenter.GKAvatarContainerView.playerAvatarView"];

  objc_initWeak(&location, self);
  v5 = [(GKAvatarContainerView *)self playerAvatarView];
  v6 = [MEMORY[0x1E4F63760] local];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __37__GKAvatarContainerView_awakeFromNib__block_invoke;
  v20[3] = &unk_1E5F634E8;
  objc_copyWeak(&v21, &location);
  [v5 setPlayer:v6 completionHandler:v20];

  [(GKAvatarContainerView *)self updateAvatarEditingAvailability];
  v7 = [(GKAvatarContainerView *)self editLabel];
  v8 = [v7 layer];

  v9 = [MEMORY[0x1E4FB1618] blackColor];
  id v10 = [v9 colorWithAlphaComponent:0.4];
  v24[0] = [v10 CGColor];
  v11 = [MEMORY[0x1E4FB1618] blackColor];
  id v12 = [v11 colorWithAlphaComponent:0.7];
  v24[1] = [v12 CGColor];
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  [v8 setColors:v13];

  v14 = [(GKAvatarContainerView *)self imageContainer];
  [v14 setHidden:1];

  v15 = [(GKAvatarContainerView *)self editImage];
  [v15 setHidden:1];

  v16 = [(GKAvatarContainerView *)self editLabel];
  [v16 setAccessibilityIdentifier:@"UIA.GameCenter.GKAvatarContainerView.editLabel"];

  v17 = [(GKAvatarContainerView *)self editLabel];
  [v17 setIsAccessibilityElement:0];

  [(GKAvatarContainerView *)self setupEditImageBackground];
  v18 = [(GKAvatarContainerView *)self imageContainer];
  v19 = [MEMORY[0x1E4FB1810] automaticStyle];
  [v18 setHoverStyle:v19];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __37__GKAvatarContainerView_awakeFromNib__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateAvatarEditingAvailability];
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)GKAvatarContainerView;
  [(GKAvatarContainerView *)&v20 layoutSubviews];
  v3 = [(GKAvatarContainerView *)self imageContainer];
  [v3 frame];
  double v5 = v4 * 0.5;
  v6 = [(GKAvatarContainerView *)self imageContainer];
  v7 = [v6 layer];
  [v7 setCornerRadius:v5];

  v8 = [MEMORY[0x1E4FB1618] labelColor];
  id v9 = [v8 colorWithAlphaComponent:0.08];
  uint64_t v10 = [v9 CGColor];
  v11 = [(GKAvatarContainerView *)self imageContainer];
  id v12 = [v11 layer];
  [v12 setBorderColor:v10];

  v13 = [(GKAvatarContainerView *)self imageContainer];
  [v13 frame];
  double v15 = v14 / 280.0;
  v16 = [(GKAvatarContainerView *)self imageContainer];
  v17 = [v16 layer];
  [v17 setBorderWidth:v15];

  v18 = [(GKAvatarContainerView *)self imageContainer];
  v19 = [v18 layer];
  [v19 setMasksToBounds:1];
}

- (void)setupEditImageBackground
{
  v3 = [(GKAvatarContainerView *)self editImageBackground];
  double v4 = [v3 layer];
  objc_msgSend(v4, "setShadowOffset:", 0.0, 0.0);

  double v5 = [(GKAvatarContainerView *)self editImageBackground];
  v6 = [v5 layer];
  [v6 setShadowRadius:2.0];

  id v7 = [MEMORY[0x1E4FB1618] blackColor];
  uint64_t v8 = [v7 CGColor];
  id v9 = [(GKAvatarContainerView *)self editImageBackground];
  uint64_t v10 = [v9 layer];
  [v10 setShadowColor:v8];

  v11 = [(GKAvatarContainerView *)self editImageBackground];
  id v12 = [v11 layer];
  LODWORD(v13) = 1050253722;
  [v12 setShadowOpacity:v13];

  double v14 = [(GKAvatarContainerView *)self traitCollection];
  uint64_t v15 = [v14 userInterfaceStyle];

  if (v15 == 2) {
    [MEMORY[0x1E4FB1618] tertiarySystemBackgroundColor];
  }
  else {
  id v17 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  }
  v16 = [(GKAvatarContainerView *)self editImageBackground];
  [v16 setTintColor:v17];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GKAvatarContainerView;
  [(GKAvatarContainerView *)&v4 traitCollectionDidChange:a3];
  [(GKAvatarContainerView *)self setupEditImageBackground];
}

- (void)didMoveToSuperview
{
  id v6 = [(GKAvatarContainerView *)self widthAnchor];
  v3 = [(GKAvatarContainerView *)self superview];
  objc_super v4 = [v3 widthAnchor];
  double v5 = [v6 constraintEqualToAnchor:v4];
  [v5 setActive:1];
}

- (void)didSetPlayerAvatarImage:(id)a3
{
  id v3 = [(GKAvatarContainerView *)self imageContainer];
  [v3 setHidden:0];
}

- (void)didSelectPlayerAvatarView:(id)a3
{
  id v4 = [(GKAvatarContainerView *)self delegate];
  [v4 avatarView:self didSelectImageWithEditingEnabled:GKIsAvatarEditingSupported()];
}

- (void)refreshViewForLocalPlayer
{
  id v3 = [MEMORY[0x1E4F63760] local];
  id v4 = [v3 alias];
  double v5 = [(GKAvatarContainerView *)self nicknameLabel];
  [v5 setText:v4];

  id v6 = [MEMORY[0x1E4F63760] local];
  id v7 = [v6 accountName];
  uint64_t v8 = [(GKAvatarContainerView *)self emailLabel];
  [v8 setText:v7];

  [(GKAvatarContainerView *)self refreshHeaderViewProfileImage];
}

- (void)refreshHeaderViewProfileImage
{
  id v3 = [(GKAvatarContainerView *)self playerAvatarView];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__GKAvatarContainerView_refreshHeaderViewProfileImage__block_invoke;
  v4[3] = &unk_1E5F62EB0;
  v4[4] = self;
  [v3 refreshImageWithCompletionHandler:v4];
}

uint64_t __54__GKAvatarContainerView_refreshHeaderViewProfileImage__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateAvatarEditingAvailability];
}

- (void)updateAvatarEditingAvailability
{
  id v3 = [MEMORY[0x1E4F63760] local];
  int v4 = [v3 isAvatarEditingRestricted];

  if (v4)
  {
    double v5 = [(GKAvatarContainerView *)self playerAvatarView];
    id v6 = v5;
LABEL_9:
    [v5 setUserInteractionEnabled:0];

    uint64_t v30 = *MEMORY[0x1E4FB2558];
    v31 = [(GKAvatarContainerView *)self playerAvatarView];
    [v31 setAccessibilityTraits:v30];

    id v32 = [(GKAvatarContainerView *)self editLabel];
    [v32 setHidden:1];
    goto LABEL_10;
  }
  if (!GKIsAvatarEditingSupported())
  {
    objc_super v20 = [(GKAvatarContainerView *)self playerAvatarView];
    int v21 = [v20 hasImage];

    double v5 = [(GKAvatarContainerView *)self playerAvatarView];
    id v6 = v5;
    if (v21)
    {
      [v5 setUserInteractionEnabled:1];

      uint64_t v22 = *MEMORY[0x1E4FB2540] | *MEMORY[0x1E4FB2558];
      objc_super v23 = [(GKAvatarContainerView *)self playerAvatarView];
      [v23 setAccessibilityTraits:v22];

      v24 = GKGameCenterUIFrameworkBundle();
      v25 = GKGetLocalizedStringFromTableInBundle();
      v26 = [(GKAvatarContainerView *)self playerAvatarView];
      [v26 setAccessibilityHint:v25];

      v27 = [(GKAvatarContainerView *)self editLabel];
      [v27 setHidden:0];

      GKGameCenterUIFrameworkBundle();
      id v32 = (id)objc_claimAutoreleasedReturnValue();
      v28 = GKGetLocalizedStringFromTableInBundle();
      v29 = [(GKAvatarContainerView *)self editLabel];
      [v29 setText:v28];

      goto LABEL_10;
    }
    goto LABEL_9;
  }
  id v7 = GKGameCenterUIFrameworkBundle();
  uint64_t v8 = GKGetLocalizedStringFromTableInBundle();
  id v9 = [(GKAvatarContainerView *)self editLabel];
  [v9 setText:v8];

  uint64_t v10 = [(GKAvatarContainerView *)self editLabel];
  v11 = [v10 text];
  unint64_t v12 = [v11 length];

  if (v12 >= 6)
  {
    double v13 = [(GKAvatarContainerView *)self editLabel];
    [v13 setHidden:1];

    double v14 = [(GKAvatarContainerView *)self editImage];
    [v14 setHidden:0];
  }
  uint64_t v15 = *MEMORY[0x1E4FB2540] | *MEMORY[0x1E4FB2558];
  v16 = [(GKAvatarContainerView *)self playerAvatarView];
  [v16 setAccessibilityTraits:v15];

  id v17 = GKGameCenterUIFrameworkBundle();
  v18 = GKGetLocalizedStringFromTableInBundle();
  v19 = [(GKAvatarContainerView *)self playerAvatarView];
  [v19 setAccessibilityHint:v18];

  id v32 = [(GKAvatarContainerView *)self playerAvatarView];
  [v32 setUserInteractionEnabled:1];
LABEL_10:
}

- (void)prepareForDefaultNicknameViewController
{
  id v3 = [(GKAvatarContainerView *)self emailLabel];
  [v3 removeFromSuperview];

  int v4 = [(GKAvatarContainerView *)self nicknameLabel];
  [v4 removeFromSuperview];

  double v5 = [(GKAvatarContainerView *)self imageContainerTopConstraint];
  [v5 setConstant:0.0];

  id v6 = (void *)MEMORY[0x1E4FB08E0];
  id v7 = [(GKAvatarContainerView *)self editLabel];
  uint64_t v8 = [v7 font];
  id v9 = [v8 fontDescriptor];
  uint64_t v10 = [v9 fontDescriptorWithSymbolicTraits:2];
  v11 = [(GKAvatarContainerView *)self editLabel];
  unint64_t v12 = [v11 font];
  [v12 pointSize];
  double v14 = [v6 fontWithDescriptor:v10 size:v13 + 2.0];
  uint64_t v15 = [(GKAvatarContainerView *)self editLabel];
  [v15 setFont:v14];

  v16 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v17 = [v16 userInterfaceIdiom];

  if (v17 == 1)
  {
    if (*MEMORY[0x1E4F63830]) {
      BOOL v18 = *MEMORY[0x1E4F63A38] == 0;
    }
    else {
      BOOL v18 = 0;
    }
    uint64_t v19 = v18;
  }
  else
  {
    uint64_t v19 = 1;
  }
  objc_super v20 = [(GKAvatarContainerView *)self playerAvatarView];
  [v20 setAvatarSize:v19];

  [(GKAvatarContainerView *)self refreshHeaderViewProfileImage];
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKAvatarContainerView;
  -[GKAvatarContainerView setUserInteractionEnabled:](&v9, sel_setUserInteractionEnabled_);
  if (v3) {
    float v5 = 1.0;
  }
  else {
    float v5 = 0.0;
  }
  id v6 = [(GKAvatarContainerView *)self editLabel];
  id v7 = [v6 layer];
  *(float *)&double v8 = v5;
  [v7 setOpacity:v8];
}

- (GKAvatarContainerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GKAvatarContainerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (GKDashboardPlayerPhotoView)playerAvatarView
{
  return self->_playerAvatarView;
}

- (void)setPlayerAvatarView:(id)a3
{
}

- (UILabel)nicknameLabel
{
  return self->_nicknameLabel;
}

- (void)setNicknameLabel:(id)a3
{
}

- (UILabel)emailLabel
{
  return self->_emailLabel;
}

- (void)setEmailLabel:(id)a3
{
}

- (UIView)imageContainer
{
  return self->_imageContainer;
}

- (void)setImageContainer:(id)a3
{
}

- (GKGradientLabel)editLabel
{
  return self->_editLabel;
}

- (void)setEditLabel:(id)a3
{
}

- (UIView)editImage
{
  return self->_editImage;
}

- (void)setEditImage:(id)a3
{
}

- (UIImageView)editImageBackground
{
  return self->_editImageBackground;
}

- (void)setEditImageBackground:(id)a3
{
}

- (NSLayoutConstraint)imageContainerTopConstraint
{
  return self->_imageContainerTopConstraint;
}

- (void)setImageContainerTopConstraint:(id)a3
{
}

- (UITapGestureRecognizer)tapGesture
{
  return self->_tapGesture;
}

- (void)setTapGesture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_imageContainerTopConstraint, 0);
  objc_storeStrong((id *)&self->_editImageBackground, 0);
  objc_storeStrong((id *)&self->_editImage, 0);
  objc_storeStrong((id *)&self->_editLabel, 0);
  objc_storeStrong((id *)&self->_imageContainer, 0);
  objc_storeStrong((id *)&self->_emailLabel, 0);
  objc_storeStrong((id *)&self->_nicknameLabel, 0);
  objc_storeStrong((id *)&self->_playerAvatarView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end