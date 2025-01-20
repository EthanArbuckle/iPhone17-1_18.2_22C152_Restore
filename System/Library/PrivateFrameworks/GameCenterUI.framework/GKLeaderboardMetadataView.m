@interface GKLeaderboardMetadataView
- (NSLayoutConstraint)containerRightMargin;
- (NSLayoutConstraint)headerHeight;
- (UILabel)footnote;
- (UILabel)rank;
- (UILabel)title;
- (UIStackView)body;
- (UIStackView)container;
- (UIStackView)header;
- (UIView)avatarContainer1;
- (UIView)avatarContainer2;
- (UIView)avatarContainer3;
- (UIVisualEffectView)vibrancyView;
- (void)awakeFromNib;
- (void)configureFootnote:(id)a3 altFootnote:(id)a4;
- (void)configureVibrancy:(BOOL)a3;
- (void)configureWithPlayers:(id)a3 title:(id)a4 footnote:(id)a5;
- (void)configureWithPlayers:(id)a3 title:(id)a4 footnote:(id)a5 altFootnote:(id)a6;
- (void)configureWithRank:(id)a3 title:(id)a4 footnote:(id)a5 altFootnote:(id)a6 vibrant:(BOOL)a7;
- (void)configureWithRank:(id)a3 title:(id)a4 footnote:(id)a5 vibrant:(BOOL)a6;
- (void)setAvatarContainer1:(id)a3;
- (void)setAvatarContainer2:(id)a3;
- (void)setAvatarContainer3:(id)a3;
- (void)setBody:(id)a3;
- (void)setContainer:(id)a3;
- (void)setContainerRightMargin:(id)a3;
- (void)setFootnote:(id)a3;
- (void)setHeader:(id)a3;
- (void)setHeaderHeight:(id)a3;
- (void)setRank:(id)a3;
- (void)setTitle:(id)a3;
- (void)setVibrancyView:(id)a3;
- (void)updateAvatarContainer:(id)a3 withPlayer:(id)a4;
@end

@implementation GKLeaderboardMetadataView

- (void)awakeFromNib
{
  v25.receiver = self;
  v25.super_class = (Class)GKLeaderboardMetadataView;
  [(GKLeaderboardMetadataView *)&v25 awakeFromNib];
  int ShouldUsePadUI = GKIsXRUIIdiomShouldUsePadUI();
  uint64_t v4 = *MEMORY[0x1E4FB2928];
  if (ShouldUsePadUI) {
    [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:v4 design:*MEMORY[0x1E4FB0938] weight:*MEMORY[0x1E4FB09E0]];
  }
  else {
  v5 = [MEMORY[0x1E4FB08E0] _gkPreferredFontForTextStyle:v4 design:*MEMORY[0x1E4FB0990]];
  }
  v6 = [(GKLeaderboardMetadataView *)self rank];
  [v6 setFont:v5];

  v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v8 = [(GKLeaderboardMetadataView *)self rank];
  [v8 setTintColor:v7];

  v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2998]];
  v10 = [(GKLeaderboardMetadataView *)self title];
  [v10 setFont:v9];

  v11 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28F0] weight:*MEMORY[0x1E4FB09D8]];
  v12 = [(GKLeaderboardMetadataView *)self footnote];
  [v12 setFont:v11];

  v13 = [MEMORY[0x1E4F63A10] sharedTheme];
  v14 = [v13 secondaryLabelCompositingFilter];
  v15 = [(GKLeaderboardMetadataView *)self footnote];
  v16 = [v15 layer];
  [v16 setCompositingFilter:v14];

  v17 = [(GKLeaderboardMetadataView *)self avatarContainer1];
  [v17 setHidden:1];

  v18 = [(GKLeaderboardMetadataView *)self avatarContainer2];
  [v18 setHidden:1];

  v19 = [(GKLeaderboardMetadataView *)self avatarContainer3];
  [v19 setHidden:1];

  v20 = [(GKLeaderboardMetadataView *)self rank];
  [v20 setHidden:1];

  v21 = [(GKLeaderboardMetadataView *)self vibrancyView];
  [v21 setHidden:1];

  v22 = [(GKLeaderboardMetadataView *)self rank];
  [v22 setText:&stru_1F07B2408];

  v23 = objc_opt_new();
  v24 = [(GKLeaderboardMetadataView *)self vibrancyView];
  [v24 setEffect:v23];
}

- (void)configureVibrancy:(BOOL)a3
{
  if (a3 && *MEMORY[0x1E4F63830])
  {
    uint64_t v4 = [MEMORY[0x1E4FB1EF8] _gkGameLayerContentVibrancyEffect];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  id v6 = (id)v4;
  v5 = [(GKLeaderboardMetadataView *)self vibrancyView];
  [v5 setEffect:v6];
}

- (void)configureWithRank:(id)a3 title:(id)a4 footnote:(id)a5 vibrant:(BOOL)a6
{
}

- (void)configureWithRank:(id)a3 title:(id)a4 footnote:(id)a5 altFootnote:(id)a6 vibrant:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [(GKLeaderboardMetadataView *)self avatarContainer1];
  [v16 setHidden:1];

  v17 = [(GKLeaderboardMetadataView *)self avatarContainer2];
  [v17 setHidden:1];

  v18 = [(GKLeaderboardMetadataView *)self avatarContainer3];
  [v18 setHidden:1];

  v19 = [(GKLeaderboardMetadataView *)self rank];
  [v19 setHidden:0];

  v20 = [(GKLeaderboardMetadataView *)self vibrancyView];
  [v20 setHidden:0];

  v21 = [(GKLeaderboardMetadataView *)self rank];
  [v21 setText:v15];

  v22 = [(GKLeaderboardMetadataView *)self title];
  [v22 setText:v14];

  [(GKLeaderboardMetadataView *)self configureFootnote:v13 altFootnote:v12];

  [(GKLeaderboardMetadataView *)self configureVibrancy:v7];
}

- (void)configureWithPlayers:(id)a3 title:(id)a4 footnote:(id)a5
{
}

- (void)configureWithPlayers:(id)a3 title:(id)a4 footnote:(id)a5 altFootnote:(id)a6
{
  id v26 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  uint64_t v13 = [v26 count];
  id v14 = [(GKLeaderboardMetadataView *)self rank];
  [v14 setHidden:1];

  id v15 = [(GKLeaderboardMetadataView *)self vibrancyView];
  [v15 setHidden:1];

  v16 = [(GKLeaderboardMetadataView *)self avatarContainer1];
  [v16 setHidden:v13 < 1];

  v17 = [(GKLeaderboardMetadataView *)self avatarContainer2];
  [v17 setHidden:v13 < 2];

  v18 = [(GKLeaderboardMetadataView *)self avatarContainer3];
  [v18 setHidden:v13 < 3];

  v19 = [(GKLeaderboardMetadataView *)self title];
  [v19 setText:v12];

  [(GKLeaderboardMetadataView *)self configureFootnote:v11 altFootnote:v10];
  if (v13 >= 1)
  {
    v20 = [(GKLeaderboardMetadataView *)self avatarContainer1];
    v21 = [v26 objectAtIndexedSubscript:0];
    [(GKLeaderboardMetadataView *)self updateAvatarContainer:v20 withPlayer:v21];

    if (v13 != 1)
    {
      v22 = [(GKLeaderboardMetadataView *)self avatarContainer2];
      v23 = [v26 objectAtIndexedSubscript:1];
      [(GKLeaderboardMetadataView *)self updateAvatarContainer:v22 withPlayer:v23];

      if ((unint64_t)v13 >= 3)
      {
        v24 = [(GKLeaderboardMetadataView *)self avatarContainer3];
        objc_super v25 = [v26 objectAtIndexedSubscript:2];
        [(GKLeaderboardMetadataView *)self updateAvatarContainer:v24 withPlayer:v25];
      }
    }
  }
  [(GKLeaderboardMetadataView *)self configureVibrancy:0];
}

- (void)configureFootnote:(id)a3 altFootnote:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(GKLeaderboardMetadataView *)self footnote];
  [v8 setText:v6];

  if ([v7 length])
  {
    v9 = [(GKLeaderboardMetadataView *)self footnote];
    [v9 setNeedsLayout];

    id v10 = [(GKLeaderboardMetadataView *)self footnote];
    [v10 layoutIfNeeded];

    id v11 = [(GKLeaderboardMetadataView *)self footnote];
    [v11 bounds];
    double v13 = v12;
    uint64_t v23 = *MEMORY[0x1E4FB06F8];
    id v14 = [(GKLeaderboardMetadataView *)self footnote];
    id v15 = [v14 font];
    v24[0] = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    objc_msgSend(v6, "boundingRectWithSize:options:attributes:context:", 1, v16, 0, v13, 1.79769313e308);
    double v18 = v17;

    v19 = [(GKLeaderboardMetadataView *)self footnote];
    [v19 bounds];
    double v21 = v20;

    if (v18 > v21)
    {
      v22 = [(GKLeaderboardMetadataView *)self footnote];
      [v22 setText:v7];
    }
  }
}

- (void)updateAvatarContainer:(id)a3 withPlayer:(id)a4
{
  id v17 = a3;
  id v5 = a4;
  id v6 = [v17 subviews];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    v8 = [v17 subviews];
    v9 = [v8 objectAtIndexedSubscript:0];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v9) {
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  v9 = objc_alloc_init(GKDashboardPlayerPhotoView);
  [v17 addSubview:v9];
  [(GKDashboardPlayerPhotoView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [MEMORY[0x1E4F28DC8] _gkInstallEdgeConstraintsForView:v9 containedWithinParentView:v17];
  id v10 = [(GKDashboardPlayerPhotoView *)v9 layer];
  objc_msgSend(v10, "setShadowOffset:", 0.0, 0.0);

  id v11 = [MEMORY[0x1E4FB1618] blackColor];
  uint64_t v12 = [v11 CGColor];
  double v13 = [(GKDashboardPlayerPhotoView *)v9 layer];
  [v13 setShadowColor:v12];

  id v14 = [(GKDashboardPlayerPhotoView *)v9 layer];
  [v14 setShadowRadius:2.0];

  id v15 = [(GKDashboardPlayerPhotoView *)v9 layer];
  LODWORD(v16) = 1050253722;
  [v15 setShadowOpacity:v16];

LABEL_7:
  [(GKDashboardPlayerPhotoView *)v9 setPlayer:v5];
}

- (UILabel)rank
{
  return self->_rank;
}

- (void)setRank:(id)a3
{
}

- (UILabel)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (UILabel)footnote
{
  return self->_footnote;
}

- (void)setFootnote:(id)a3
{
}

- (UIStackView)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (NSLayoutConstraint)containerRightMargin
{
  return self->_containerRightMargin;
}

- (void)setContainerRightMargin:(id)a3
{
}

- (UIStackView)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (NSLayoutConstraint)headerHeight
{
  return self->_headerHeight;
}

- (void)setHeaderHeight:(id)a3
{
}

- (UIView)avatarContainer1
{
  return self->_avatarContainer1;
}

- (void)setAvatarContainer1:(id)a3
{
}

- (UIView)avatarContainer2
{
  return self->_avatarContainer2;
}

- (void)setAvatarContainer2:(id)a3
{
}

- (UIView)avatarContainer3
{
  return self->_avatarContainer3;
}

- (void)setAvatarContainer3:(id)a3
{
}

- (UIStackView)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (UIVisualEffectView)vibrancyView
{
  return self->_vibrancyView;
}

- (void)setVibrancyView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrancyView, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_avatarContainer3, 0);
  objc_storeStrong((id *)&self->_avatarContainer2, 0);
  objc_storeStrong((id *)&self->_avatarContainer1, 0);
  objc_storeStrong((id *)&self->_headerHeight, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_containerRightMargin, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong((id *)&self->_footnote, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_rank, 0);
}

@end