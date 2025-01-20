@interface MRUMediaSuggestionCollectionViewCell
- (BSUIEmojiLabelView)subtitleLabel;
- (MRUArtworkView)artworkView;
- (MRUMediaSuggestionCollectionViewCell)initWithFrame:(CGRect)a3;
- (MRUShadowView)iconShadowView;
- (MRUVisualStylingProvider)stylingProvider;
- (NSString)subtitle;
- (NSString)suggestionIdentifier;
- (NSString)title;
- (UIActivityIndicatorView)activityView;
- (UIImage)artworkImage;
- (UIImage)iconImage;
- (UIImageView)iconView;
- (UILabel)titleLabel;
- (int64_t)layout;
- (void)layoutSubviews;
- (void)setActivityView:(id)a3;
- (void)setArtworkImage:(id)a3;
- (void)setArtworkView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIconImage:(id)a3;
- (void)setIconShadowView:(id)a3;
- (void)setIconView:(id)a3;
- (void)setLayout:(int64_t)a3;
- (void)setSelected:(BOOL)a3;
- (void)setStylingProvider:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setSuggestionIdentifier:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)updateContentSizeCategory;
- (void)updateIconView;
- (void)updateVisiblity;
- (void)updateVisualStyling;
@end

@implementation MRUMediaSuggestionCollectionViewCell

- (MRUMediaSuggestionCollectionViewCell)initWithFrame:(CGRect)a3
{
  v29.receiver = self;
  v29.super_class = (Class)MRUMediaSuggestionCollectionViewCell;
  v3 = -[MRUMediaSuggestionCollectionViewCell initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MRUArtworkView alloc];
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v9 = -[MRUArtworkView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    artworkView = v3->_artworkView;
    v3->_artworkView = (MRUArtworkView *)v9;

    v11 = [(MRUArtworkView *)v3->_artworkView pointerInteraction];
    [v11 setEnabled:1];

    [(MRUArtworkView *)v3->_artworkView setStyle:4];
    [(MRUArtworkView *)v3->_artworkView setUserInteractionEnabled:0];
    v12 = [(MRUMediaSuggestionCollectionViewCell *)v3 contentView];
    [v12 addSubview:v3->_artworkView];

    v13 = objc_alloc_init(MRUShadowView);
    iconShadowView = v3->_iconShadowView;
    v3->_iconShadowView = v13;

    v15 = [MEMORY[0x1E4FB1618] blackColor];
    [(MRUShadowView *)v3->_iconShadowView setColor:v15];

    HIDWORD(v16) = 1070176665;
    *(float *)&double v16 = 0.2;
    [(MRUShadowView *)v3->_iconShadowView setOpacity:v16];
    [(MRUMediaSuggestionCollectionViewCell *)v3 addSubview:v3->_iconShadowView];
    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v5, v6, v7, v8);
    iconView = v3->_iconView;
    v3->_iconView = (UIImageView *)v17;

    [(UIImageView *)v3->_iconView setUserInteractionEnabled:0];
    [(UIImageView *)v3->_iconView setContentMode:1];
    [(UIImageView *)v3->_iconView setClipsToBounds:1];
    [(MRUMediaSuggestionCollectionViewCell *)v3 addSubview:v3->_iconView];
    uint64_t v19 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    activityView = v3->_activityView;
    v3->_activityView = (UIActivityIndicatorView *)v19;

    [(MRUMediaSuggestionCollectionViewCell *)v3 addSubview:v3->_activityView];
    v21 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v21;

    [(UILabel *)v3->_titleLabel setNumberOfLines:1];
    [(UILabel *)v3->_titleLabel setTextAlignment:1];
    v23 = [(MRUMediaSuggestionCollectionViewCell *)v3 contentView];
    [v23 addSubview:v3->_titleLabel];

    v24 = (BSUIEmojiLabelView *)objc_alloc_init(MEMORY[0x1E4F4F8B0]);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = v24;

    [(BSUIEmojiLabelView *)v3->_subtitleLabel setNumberOfLines:1];
    [(BSUIEmojiLabelView *)v3->_subtitleLabel setTextAlignment:1];
    v26 = [(MRUMediaSuggestionCollectionViewCell *)v3 contentView];
    [v26 addSubview:v3->_subtitleLabel];

    v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v27 addObserver:v3 selector:sel_updateContentSizeCategory name:*MEMORY[0x1E4FB27A8] object:0];

    [(MRUMediaSuggestionCollectionViewCell *)v3 updateContentSizeCategory];
    [(MRUMediaSuggestionCollectionViewCell *)v3 updateIconView];
    [(MRUMediaSuggestionCollectionViewCell *)v3 updateVisiblity];
  }
  return v3;
}

- (void)layoutSubviews
{
  v50.receiver = self;
  v50.super_class = (Class)MRUMediaSuggestionCollectionViewCell;
  [(MRUMediaSuggestionCollectionViewCell *)&v50 layoutSubviews];
  [(MRUMediaSuggestionCollectionViewCell *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[MRUArtworkView sizeThatFits:](self->_artworkView, "sizeThatFits:", v7, v9);
  double v12 = v11;
  double v14 = v13;
  v51.origin.x = v4;
  v51.origin.y = v6;
  v51.size.width = v8;
  v51.size.height = v10;
  double MinX = CGRectGetMinX(v51);
  v52.origin.x = v4;
  v52.origin.y = v6;
  v52.size.width = v8;
  v52.size.height = v10;
  double MinY = CGRectGetMinY(v52);
  -[MRUArtworkView setFrame:](self->_artworkView, "setFrame:", MinX, MinY, v12, v14);
  -[UIActivityIndicatorView setFrame:](self->_activityView, "setFrame:", MinX, MinY, v12, v14);
  MRUMediaSuggestionsIconSize(self->_layout);
  v53.origin.x = MinX;
  v53.origin.y = MinY;
  v53.size.width = v12;
  v53.size.height = v14;
  CGRectGetMaxX(v53);
  v54.origin.x = MinX;
  v54.origin.y = MinY;
  v54.size.width = v12;
  v54.size.height = v14;
  CGRectGetMaxY(v54);
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  -[MRUShadowView setFrame:](self->_iconShadowView, "setFrame:");
  -[UIImageView setFrame:](self->_iconView, "setFrame:", v18, v20, v22, v24);
  v55.origin.x = MinX;
  v55.origin.y = MinY;
  v55.size.width = v12;
  v55.size.height = v14;
  CGRectGetHeight(v55);
  UIRectInset();
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  CGFloat v32 = v31;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v29, v31);
  MRUSizeCeilToViewScale(self);
  double v34 = v33;
  v56.origin.x = v26;
  v56.origin.y = v28;
  v56.size.width = v30;
  v56.size.height = v32;
  double v35 = CGRectGetMinX(v56);
  v57.origin.x = v26;
  v57.origin.y = v28;
  v57.size.width = v30;
  v57.size.height = v32;
  double v36 = CGRectGetMinY(v57);
  v58.origin.x = v26;
  v58.origin.y = v28;
  v58.size.width = v30;
  v58.size.height = v32;
  double Width = CGRectGetWidth(v58);
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v35, v36, Width, v34);
  v59.origin.x = v35;
  v59.origin.y = v36;
  v59.size.width = Width;
  v59.size.height = v34;
  CGRectGetHeight(v59);
  UIRectInset();
  CGFloat v39 = v38;
  CGFloat v41 = v40;
  CGFloat v43 = v42;
  CGFloat v45 = v44;
  -[BSUIEmojiLabelView sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v42, v44);
  MRUSizeCeilToViewScale(self);
  double v47 = v46;
  v60.origin.x = v39;
  v60.origin.y = v41;
  v60.size.width = v43;
  v60.size.height = v45;
  double v48 = CGRectGetMinX(v60);
  v61.origin.x = v39;
  v61.origin.y = v41;
  v61.size.width = v43;
  v61.size.height = v45;
  double v49 = CGRectGetMinY(v61);
  v62.origin.x = v39;
  v62.origin.y = v41;
  v62.size.width = v43;
  v62.size.height = v45;
  -[BSUIEmojiLabelView setFrame:](self->_subtitleLabel, "setFrame:", v48, v49, CGRectGetWidth(v62), v47);
}

- (void)setArtworkImage:(id)a3
{
  objc_storeStrong((id *)&self->_artworkImage, a3);
  id v5 = a3;
  [(MRUArtworkView *)self->_artworkView setArtworkImage:v5];

  [(MRUMediaSuggestionCollectionViewCell *)self setNeedsLayout];
}

- (void)setIconImage:(id)a3
{
  objc_storeStrong((id *)&self->_iconImage, a3);
  id v5 = a3;
  [(UIImageView *)self->_iconView setImage:v5];

  [(MRUMediaSuggestionCollectionViewCell *)self setNeedsLayout];

  [(MRUMediaSuggestionCollectionViewCell *)self updateVisiblity];
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
  id v5 = a3;
  [(UILabel *)self->_titleLabel setText:v5];

  [(MRUMediaSuggestionCollectionViewCell *)self setNeedsLayout];
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
  id v5 = a3;
  [(BSUIEmojiLabelView *)self->_subtitleLabel setText:v5];

  [(MRUMediaSuggestionCollectionViewCell *)self setNeedsLayout];
}

- (void)setStylingProvider:(id)a3
{
  CGFloat v4 = (MRUVisualStylingProvider *)a3;
  [(MRUVisualStylingProvider *)self->_stylingProvider removeObserver:self];
  stylingProvider = self->_stylingProvider;
  self->_stylingProvider = v4;
  CGFloat v6 = v4;

  [(MRUVisualStylingProvider *)self->_stylingProvider addObserver:self];
  [(MRUMediaSuggestionCollectionViewCell *)self updateVisualStyling];
  id v7 = [(MRUMediaSuggestionCollectionViewCell *)self artworkView];
  [v7 setStylingProvider:v6];
}

- (void)setLayout:(int64_t)a3
{
  if (self->_layout != a3)
  {
    self->_layout = a3;
    if (a3 == 1) {
      uint64_t v4 = 5;
    }
    else {
      uint64_t v4 = 4;
    }
    [(MRUArtworkView *)self->_artworkView setStyle:v4];
    [(MRUMediaSuggestionCollectionViewCell *)self updateIconView];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MRUMediaSuggestionCollectionViewCell;
  [(MRUMediaSuggestionCollectionViewCell *)&v4 setHighlighted:a3];
  [(MRUMediaSuggestionCollectionViewCell *)self updateVisiblity];
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MRUMediaSuggestionCollectionViewCell;
  [(MRUMediaSuggestionCollectionViewCell *)&v4 setSelected:a3];
  [(MRUMediaSuggestionCollectionViewCell *)self updateVisiblity];
}

- (void)updateVisualStyling
{
  [(MRUVisualStylingProvider *)self->_stylingProvider applyStyle:0 toView:self->_titleLabel];
  [(MRUVisualStylingProvider *)self->_stylingProvider applyStyle:1 toView:self->_subtitleLabel];
  id v3 = [(MRUVisualStylingProvider *)self->_stylingProvider colorForStyle:0];
  [(UIActivityIndicatorView *)self->_activityView setColor:v3];
}

- (void)updateContentSizeCategory
{
  id v3 = objc_msgSend(MEMORY[0x1E4FB08E0], "mru_suggestionsTitleFont");
  [(UILabel *)self->_titleLabel setFont:v3];

  objc_msgSend(MEMORY[0x1E4FB08E0], "mru_suggestionsSubtitleFont");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(BSUIEmojiLabelView *)self->_subtitleLabel setFont:v4];
}

- (void)updateIconView
{
  double v3 = MRUMediaSuggestionsIconCornerRadius(self->_layout);
  -[UIImageView _setContinuousCornerRadius:](self->_iconView, "_setContinuousCornerRadius:");
  [(MRUShadowView *)self->_iconShadowView _setContinuousCornerRadius:v3];
  [(MRUShadowView *)self->_iconShadowView setOffset:MRUMediaSuggestionsIconShadowOffset()];
  double v4 = MRUMediaSuggestionsIconShadowRadius(self->_layout);
  iconShadowView = self->_iconShadowView;

  [(MRUShadowView *)iconShadowView setRadius:v4];
}

- (void)updateVisiblity
{
  if (self->_iconImage) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  [(MRUShadowView *)self->_iconShadowView setAlpha:v3];
  if (self->_iconImage) {
    double v4 = 1.0;
  }
  else {
    double v4 = 0.0;
  }
  [(UIImageView *)self->_iconView setAlpha:v4];
  if ([(MRUMediaSuggestionCollectionViewCell *)self isHighlighted]) {
    goto LABEL_10;
  }
  int v5 = [(MRUMediaSuggestionCollectionViewCell *)self isSelected];
  activityView = self->_activityView;
  if (v5)
  {
    [(UIActivityIndicatorView *)activityView startAnimating];
LABEL_10:
    uint64_t v7 = 1;
    goto LABEL_12;
  }
  [(UIActivityIndicatorView *)activityView stopAnimating];
  uint64_t v7 = 0;
LABEL_12:
  artworkView = self->_artworkView;

  [(MRUArtworkView *)artworkView setHighlighted:v7];
}

- (NSString)suggestionIdentifier
{
  return self->_suggestionIdentifier;
}

- (void)setSuggestionIdentifier:(id)a3
{
}

- (UIImage)artworkImage
{
  return self->_artworkImage;
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (int64_t)layout
{
  return self->_layout;
}

- (MRUArtworkView)artworkView
{
  return self->_artworkView;
}

- (void)setArtworkView:(id)a3
{
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (MRUShadowView)iconShadowView
{
  return self->_iconShadowView;
}

- (void)setIconShadowView:(id)a3
{
}

- (UIActivityIndicatorView)activityView
{
  return self->_activityView;
}

- (void)setActivityView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (BSUIEmojiLabelView)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_activityView, 0);
  objc_storeStrong((id *)&self->_iconShadowView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_artworkView, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_artworkImage, 0);

  objc_storeStrong((id *)&self->_suggestionIdentifier, 0);
}

@end