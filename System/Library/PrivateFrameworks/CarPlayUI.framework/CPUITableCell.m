@interface CPUITableCell
+ (double)minimumHeight;
+ (double)rowHeight;
- (BOOL)container;
- (BOOL)currentlyPlaying;
- (BOOL)isShowExplicit;
- (BOOL)playingIndicatorLeadingSide;
- (BOOL)shouldShowPlaybackProgress;
- (BOOL)showActivityIndicator;
- (CGSize)artworkSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CPUITableCellAccessory)accessory;
- (CPUITableCellAccessory)cloudAccessory;
- (MPUNowPlayingIndicatorView)nowPlayingIndicator;
- (UIActivityIndicatorView)activityIndicatorView;
- (UIImage)artwork;
- (UIImage)chevronImage;
- (UIImage)cloudImage;
- (UIImage)playbackProgressFullImage;
- (UIImageView)artworkImageView;
- (UIImageView)explicitItemView;
- (UIView)playbackProgressView;
- (double)_accessoryWidth;
- (double)playbackProgress;
- (int64_t)playbackState;
- (void)_setCloudAccessory:(id)a3;
- (void)_updatePlayingArtworkIfNeeded;
- (void)_updateTintColors;
- (void)applyConfiguration:(id)a3;
- (void)configureCell;
- (void)layoutSubviews;
- (void)setAccessory:(id)a3;
- (void)setActivityIndicatorView:(id)a3;
- (void)setArtwork:(id)a3;
- (void)setArtworkImageView:(id)a3;
- (void)setArtworkSize:(CGSize)a3;
- (void)setChevronImage:(id)a3;
- (void)setCloudAccessory:(id)a3;
- (void)setCloudImage:(id)a3;
- (void)setContainer:(BOOL)a3;
- (void)setExplicitItemView:(id)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setPlaybackProgress:(double)a3;
- (void)setPlaybackProgressFullImage:(id)a3;
- (void)setPlaybackProgressView:(id)a3;
- (void)setPlaybackState:(int64_t)a3;
- (void)setPlayingIndicatorLeadingSide:(BOOL)a3;
- (void)setShouldShowPlaybackProgress:(BOOL)a3;
- (void)setShowActivityIndicator:(BOOL)a3;
- (void)setShowExplicit:(BOOL)a3;
- (void)setShowsExplicit:(BOOL)a3;
- (void)updateArtwork;
- (void)updatePlaybackProgress;
@end

@implementation CPUITableCell

+ (double)minimumHeight
{
  return 44.0;
}

+ (double)rowHeight
{
  return 56.0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  [(CPUITableCell *)self playbackProgress];
  if (v5 > 0.0)
  {
    [(CPUITableCell *)self playbackProgress];
    if (v6 < 1.0) {
      goto LABEL_4;
    }
  }
  v7 = [(CPUITableCell *)self detailTextLabel];
  v8 = [v7 text];
  uint64_t v9 = [v8 length];

  if (v9) {
LABEL_4:
  }
    [(id)objc_opt_class() rowHeight];
  else {
    [(id)objc_opt_class() minimumHeight];
  }
  double v11 = v10;
  double v12 = width;
  result.height = v11;
  result.CGFloat width = v12;
  return result;
}

- (void)_updateTintColors
{
  v19.receiver = self;
  v19.super_class = (Class)CPUITableCell;
  [(_CPUIBaseTableCell *)&v19 _updateTintColors];
  if ([(_CPUIBaseTableCell *)self itemEnabled]) {
    [MEMORY[0x263F825C8] _carSystemSecondaryColor];
  }
  else {
  v3 = +[_CPUIBaseTableCell disabledColor];
  }
  if ([(_CPUIBaseTableCell *)self itemEnabled]) {
    [MEMORY[0x263F825C8] _carSystemFocusSecondaryColor];
  }
  else {
  v4 = +[_CPUIBaseTableCell disabledHighlightedColor];
  }
  double v5 = [(CPUITableCell *)self accessoryView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = [(CPUITableCell *)self accessoryView];
    if ([(CPUITableCell *)self isHighlighted]) {
      v8 = v4;
    }
    else {
      v8 = v3;
    }
    [v7 setTintColor:v8];
  }
  else
  {
    uint64_t v9 = 1048;
    if (self->_accessory)
    {
      id v10 = objc_alloc(MEMORY[0x263F82828]);
    }
    else
    {
      if (!*(&self->super._itemEnabled + 4)) {
        goto LABEL_18;
      }
      id v10 = objc_alloc(MEMORY[0x263F82828]);
      uint64_t v9 = 1056;
    }
    v7 = [*(id *)((char *)&self->super.super.super.super.super.isa + v9) imageWithTintColor:v3];
    double v11 = [*(id *)((char *)&self->super.super.super.super.super.isa + v9) imageWithTintColor:v4];
    double v12 = (void *)[v10 initWithImage:v7 highlightedImage:v11];
    [(CPUITableCell *)self setAccessoryView:v12];
  }
LABEL_18:
  v13 = [(CPUITableCell *)self playbackProgressView];
  objc_opt_class();
  char v14 = objc_opt_isKindOfClass();

  if (v14)
  {
    if ([(_CPUIBaseTableCell *)self itemEnabled]) {
      [MEMORY[0x263F825C8] _carSystemSecondaryColor];
    }
    else {
    v15 = +[_CPUIBaseTableCell disabledColor];
    }
    if ([(_CPUIBaseTableCell *)self itemEnabled]) {
      [MEMORY[0x263F825C8] _carSystemFocusSecondaryColor];
    }
    else {
    v16 = +[_CPUIBaseTableCell disabledHighlightedColor];
    }
    v17 = [(CPUITableCell *)self playbackProgressView];
    if ([(CPUITableCell *)self isHighlighted]) {
      v18 = v16;
    }
    else {
      v18 = v15;
    }
    [v17 setTintColor:v18];
  }
}

- (void)configureCell
{
  v17.receiver = self;
  v17.super_class = (Class)CPUITableCell;
  [(_CPUIBaseTableCell *)&v17 configureCell];
  *(int64x2_t *)&self->_activityIndicatorView = vdupq_n_s64(0x4044000000000000uLL);
  v3 = [MEMORY[0x263F81708] systemFontOfSize:15.0];
  v4 = [(CPUITableCell *)self textLabel];
  [v4 setFont:v3];

  double v5 = [MEMORY[0x263F825C8] labelColor];
  double v6 = [(CPUITableCell *)self textLabel];
  [v6 setTextColor:v5];

  v7 = [MEMORY[0x263F825C8] _carSystemFocusLabelColor];
  v8 = [(CPUITableCell *)self textLabel];
  [v8 setHighlightedTextColor:v7];

  uint64_t v9 = [MEMORY[0x263F81708] systemFontOfSize:12.0];
  id v10 = [(CPUITableCell *)self detailTextLabel];
  [v10 setFont:v9];

  double v11 = [MEMORY[0x263F825C8] _carSystemSecondaryColor];
  double v12 = [(CPUITableCell *)self detailTextLabel];
  [v12 setTextColor:v11];

  v13 = [MEMORY[0x263F825C8] _carSystemFocusSecondaryColor];
  char v14 = [(CPUITableCell *)self detailTextLabel];
  [v14 setHighlightedTextColor:v13];

  [(CPUITableCell *)self setAccessibilityIdentifier:@"CPListItem"];
  v15 = [(CPUITableCell *)self textLabel];
  [v15 setAccessibilityIdentifier:@"CPListItemTitle"];

  v16 = [(CPUITableCell *)self detailTextLabel];
  [v16 setAccessibilityIdentifier:@"CPListItemSubtitle"];
}

- (void)applyConfiguration:(id)a3
{
  v55[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [v4 accessory];
  -[_CPUIBaseTableCell setItemEnabled:](self, "setItemEnabled:", [v4 enabled]);
  double v6 = [v5 image];

  if (v6)
  {
    [(CPUITableCell *)self setContainer:0];
    [(CPUITableCell *)self _setCloudAccessory:0];
    id v7 = objc_alloc(MEMORY[0x263F82828]);
    v8 = [v5 image];
    uint64_t v9 = CPUIImageByScalingImageToSize(v8, *(double *)&self->_activityIndicatorView, self->_artworkSize.width);
    id v10 = (void *)[v7 initWithImage:v9];
    [(CPUITableCell *)self setAccessoryView:v10];

    goto LABEL_15;
  }
  uint64_t v11 = +[CPUITableCellAccessory accessoryWithCloudIcon];
  if (v5 == (void *)v11)
  {

    goto LABEL_10;
  }
  double v12 = (void *)v11;
  v13 = +[CPUITableCellAccessory accessoryWithiCloudIcon];

  if (v5 == v13)
  {
LABEL_10:
    [(CPUITableCell *)self setContainer:0];
    [(CPUITableCell *)self _setCloudAccessory:v5];
    goto LABEL_15;
  }
  char v14 = +[CPUITableCellAccessory accessoryWithDisclosureIndicator];

  if (v5 == v14)
  {
    [(CPUITableCell *)self _setCloudAccessory:0];
    v18 = self;
    uint64_t v19 = 1;
    goto LABEL_12;
  }
  uint64_t v15 = +[CPUITableCellAccessory accessoryWithActivityIndicator];
  if (v5 == (void *)v15)
  {
  }
  else
  {
    v16 = (void *)v15;
    char v17 = [v4 showActivityIndicator];

    if ((v17 & 1) == 0)
    {
      [(CPUITableCell *)self _setCloudAccessory:0];
      v18 = self;
      uint64_t v19 = 0;
LABEL_12:
      [(CPUITableCell *)v18 setContainer:v19];
      goto LABEL_15;
    }
  }
  [(CPUITableCell *)self _setCloudAccessory:0];
  [(CPUITableCell *)self setContainer:0];
  v20 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:21];
  v21 = [MEMORY[0x263F825C8] labelColor];
  [v20 setColor:v21];

  [(CPUITableCell *)self setAccessoryView:v20];
  [v20 startAnimating];

LABEL_15:
  [v4 playbackProgress];
  if (v22 <= 0.0)
  {
    [(CPUITableCell *)self setShouldShowPlaybackProgress:0];
  }
  else
  {
    [(CPUITableCell *)self setShouldShowPlaybackProgress:1];
    [v4 playbackProgress];
    -[CPUITableCell setPlaybackProgress:](self, "setPlaybackProgress:");
  }
  -[CPUITableCell setPlaybackState:](self, "setPlaybackState:", [v4 playbackState]);
  if ([v4 currentlyPlaying])
  {
    v23 = [(CPUITableCell *)self nowPlayingIndicator];

    if (!v23)
    {
      id v24 = objc_alloc(MEMORY[0x263F53610]);
      uint64_t v25 = objc_msgSend(v24, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      v26 = *(void **)&self->_showExplicit;
      *(void *)&self->_showExplicit = v25;

      [*(id *)&self->_showExplicit setNumberOfLevels:4];
      if (([(CPUITableCell *)self isHighlighted] & 1) != 0
        || ([(CPUITableCell *)self isFocused] & 1) != 0)
      {
        uint64_t v27 = [MEMORY[0x263F825C8] _carSystemFocusLabelColor];
      }
      else
      {
        uint64_t v27 = [MEMORY[0x263F825C8] _carSystemFocusColor];
      }
      v28 = (void *)v27;
      [*(id *)&self->_showExplicit setLevelGuttersColor:v27];

      v29 = [(CPUITableCell *)self traitCollection];
      [v29 displayScale];
      double v31 = v30;

      double v32 = 1.0 / v31 + 1.0;
      if (v31 < 1.0) {
        double v32 = 2.0;
      }
      [*(id *)&self->_showExplicit setInterLevelSpacing:v32];
      v33 = [(CPUITableCell *)self traitCollection];
      [v33 displayScale];
      double v35 = v34;

      double v36 = 1.0 / v35;
      if (v35 < 1.0) {
        double v36 = 1.0;
      }
      [*(id *)&self->_showExplicit setLevelCornerRadius:v36];
      [*(id *)&self->_showExplicit setMinimumFrameInterval:0.0666666667];
    }
  }
  -[CPUITableCell setPlayingIndicatorLeadingSide:](self, "setPlayingIndicatorLeadingSide:", [v4 playingIndicatorLeadingSide]);
  -[CPUITableCell setShowsExplicit:](self, "setShowsExplicit:", [v4 showExplicit]);
  v37 = [v4 text];
  v38 = [(CPUITableCell *)self textLabel];
  [v38 setText:v37];

  v39 = [v4 detailText];
  v40 = [(CPUITableCell *)self detailTextLabel];
  [v40 setText:v39];

  v41 = [v4 image];
  [(CPUITableCell *)self setArtwork:v41];

  v42 = [(CPUITableCell *)self textLabel];
  uint64_t v43 = [v42 text];
  if (v43)
  {
    v44 = (void *)v43;
    v45 = [(CPUITableCell *)self detailTextLabel];
    v46 = [v45 text];

    if (v46)
    {
      v47 = [(CPUITableCell *)self textLabel];
      v48 = [v47 text];
      v55[0] = v48;
      v49 = [(CPUITableCell *)self detailTextLabel];
      v50 = [v49 text];
      v55[1] = v50;
      v51 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:2];
      [(CPUITableCell *)self setAccessibilityUserInputLabels:v51];

      goto LABEL_35;
    }
  }
  else
  {
  }
  v52 = [(CPUITableCell *)self textLabel];
  v53 = [v52 text];

  if (!v53)
  {
    [(CPUITableCell *)self setAccessibilityUserInputLabels:MEMORY[0x263EFFA68]];
    goto LABEL_37;
  }
  v47 = [(CPUITableCell *)self textLabel];
  v48 = [v47 text];
  v54 = v48;
  v49 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v54 count:1];
  [(CPUITableCell *)self setAccessibilityUserInputLabels:v49];
LABEL_35:

LABEL_37:
  [(CPUITableCell *)self _updateTintColors];
  [(CPUITableCell *)self updatePlaybackProgress];
  [(CPUITableCell *)self updateArtwork];
  [(CPUITableCell *)self setNeedsLayout];
}

- (BOOL)currentlyPlaying
{
  return (unint64_t)&self->_artwork[-1].super.isa + 7 < 2;
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CPUITableCell;
  [(CPUITableCell *)&v12 setHighlighted:a3 animated:a4];
  double v6 = [(CPUITableCell *)self playbackProgressView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v8 = [(CPUITableCell *)self playbackProgressView];
    [v8 setHighlighted:v4];
  }
  uint64_t v9 = [(CPUITableCell *)self nowPlayingIndicator];

  if (v9)
  {
    if (v4) {
      [MEMORY[0x263F825C8] _carSystemFocusLabelColor];
    }
    else {
    id v10 = [MEMORY[0x263F825C8] _carSystemFocusColor];
    }
    uint64_t v11 = [(CPUITableCell *)self nowPlayingIndicator];
    [v11 setLevelGuttersColor:v10];
  }
  [(CPUITableCell *)self _updateTintColors];
  [(CPUITableCell *)self updateArtwork];
}

- (void)setContainer:(BOOL)a3
{
  int v4 = *((unsigned __int8 *)&self->super._itemEnabled + 4);
  if (v4 != a3)
  {
    *(&self->super._itemEnabled + 4) = a3;
    int v4 = a3;
  }
  if (v4)
  {
    id v8 = [(CPUITableCell *)self traitCollection];
    double v5 = CPUIChevronRightGlyph();
    double v6 = [v5 imageWithRenderingMode:2];
    cloudImage = self->_cloudImage;
    self->_cloudImage = v6;
  }
  else
  {
    [(CPUITableCell *)self setAccessoryType:0];
    [(CPUITableCell *)self setAccessoryView:0];
  }
}

- (void)setShowsExplicit:(BOOL)a3
{
  BOOL v3 = a3;
  *(&self->super._itemEnabled + 1) = a3;
  double v5 = [(CPUITableCell *)self explicitItemView];
  double v6 = v5;
  if (v3)
  {

    if (!v6)
    {
      id v7 = [(CPUITableCell *)self traitCollection];
      id v8 = CPUILocalizedExplicitImageForTraitCollection(v7);

      id v9 = objc_alloc(MEMORY[0x263F82828]);
      id v10 = [MEMORY[0x263F825C8] _carSystemSecondaryColor];
      uint64_t v11 = [v8 _flatImageWithColor:v10];
      objc_super v12 = [MEMORY[0x263F825C8] _carSystemFocusSecondaryColor];
      v13 = [v8 _flatImageWithColor:v12];
      char v14 = (void *)[v9 initWithImage:v11 highlightedImage:v13];
      [(CPUITableCell *)self setExplicitItemView:v14];
    }
    id v16 = [(CPUITableCell *)self contentView];
    uint64_t v15 = [(CPUITableCell *)self explicitItemView];
    [v16 addSubview:v15];
  }
  else
  {
    [v5 removeFromSuperview];

    [(CPUITableCell *)self setExplicitItemView:0];
  }
}

- (void)_setCloudAccessory:(id)a3
{
  id v13 = a3;
  objc_storeStrong((id *)&self->_nowPlayingIndicator, a3);
  if (v13)
  {
    id v5 = +[CPUITableCellAccessory accessoryWithiCloudIcon];
    double v6 = @"cloud";
    if (v5 == v13) {
      double v6 = @"icloud";
    }
    id v7 = v6;

    id v8 = [(CPUITableCell *)self traitCollection];
    id v9 = _CPUIGlyphFactoryWithTraitCollection(v7, 4, v8, 22.0);

    id v10 = [v9 imageWithRenderingMode:2];
    accessory = self->_accessory;
    self->_accessory = v10;
  }
  else
  {
    objc_super v12 = self->_accessory;
    self->_accessory = 0;

    [(CPUITableCell *)self setAccessoryView:0];
  }
}

- (void)setShowActivityIndicator:(BOOL)a3
{
  if (*(&self->super._itemEnabled + 2) != a3)
  {
    *(&self->super._itemEnabled + 2) = a3;
    if (a3)
    {
      int v4 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:21];
      [(CPUITableCell *)self setActivityIndicatorView:v4];

      id v5 = [(CPUITableCell *)self activityIndicatorView];
      objc_msgSend(v5, "setFrame:", 0.0, 0.0, 22.0, 22.0);

      double v6 = [(CPUITableCell *)self activityIndicatorView];
      [v6 startAnimating];

      id v11 = [(CPUITableCell *)self activityIndicatorView];
      [(CPUITableCell *)self setAccessoryView:v11];
    }
    else
    {
      id v7 = [(CPUITableCell *)self activityIndicatorView];

      if (v7)
      {
        id v8 = [(CPUITableCell *)self activityIndicatorView];
        [v8 stopAnimating];

        id v9 = [(CPUITableCell *)self activityIndicatorView];
        [v9 removeFromSuperview];

        [(CPUITableCell *)self setActivityIndicatorView:0];
      }
      id v10 = [(CPUITableCell *)self cloudAccessory];
      [(CPUITableCell *)self _setCloudAccessory:v10];

      [(CPUITableCell *)self setActivityIndicatorView:0];
      [(CPUITableCell *)self setNeedsLayout];
    }
  }
}

- (double)_accessoryWidth
{
  BOOL v3 = [(CPUITableCell *)self accessoryView];

  if (v3)
  {
    int v4 = [(CPUITableCell *)self accessoryView];
    [v4 frame];
    double v5 = CGRectGetWidth(v7) + 8.0;
  }
  else if ([(CPUITableCell *)self accessoryType] == 3)
  {
    return 40.0;
  }
  else
  {
    return 0.0;
  }
  return v5;
}

- (void)updatePlaybackProgress
{
  [(CPUITableCell *)self playbackProgress];
  double v4 = v3;
  if ([(CPUITableCell *)self shouldShowPlaybackProgress])
  {
    [(CPUITableCell *)self playbackProgress];
    double v6 = v5;
    CGRect v7 = [(CPUITableCell *)self playbackProgressView];
    id v8 = v7;
    if (v6 > 0.0 && v4 < 0.999999881)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        id v10 = [(CPUITableCell *)self playbackProgressView];
        [v10 removeFromSuperview];

        [(CPUITableCell *)self setPlaybackProgressView:0];
        id v11 = objc_alloc_init(CPUIPlaybackProgressView);
        [(CPUITableCell *)self setPlaybackProgressView:v11];

        objc_super v12 = [(CPUITableCell *)self playbackProgressView];
        [(CPUITableCell *)self addSubview:v12];
      }
      [(CPUITableCell *)self playbackProgress];
      double v14 = v13;
      id v34 = [(CPUITableCell *)self playbackProgressView];
      [v34 setPlaybackProgress:v14];
LABEL_7:

      return;
    }
    if (v4 >= 0.999999881)
    {
      objc_opt_class();
      char v15 = objc_opt_isKindOfClass();

      if (v15) {
        return;
      }
      id v16 = [(CPUITableCell *)self playbackProgressView];
      [v16 removeFromSuperview];

      [(CPUITableCell *)self setPlaybackProgressView:0];
      if ([(_CPUIBaseTableCell *)self itemEnabled]) {
        [MEMORY[0x263F825C8] _carSystemFocusColor];
      }
      else {
      id v34 = +[_CPUIBaseTableCell disabledColor];
      }
      if ([(_CPUIBaseTableCell *)self itemEnabled]) {
        [MEMORY[0x263F825C8] _carSystemFocusLabelColor];
      }
      else {
      char v17 = +[_CPUIBaseTableCell disabledHighlightedColor];
      }
      v18 = [(CPUITableCell *)self detailTextLabel];
      uint64_t v19 = [v18 font];
      [v19 pointSize];
      double v21 = v20;
      double v22 = [(CPUITableCell *)self traitCollection];
      v23 = CPUIPlaybackProgressCompleteGlyphWithSize(v22, v21);
      uint64_t v24 = [v23 imageWithRenderingMode:2];
      double playbackProgress = self->_playbackProgress;
      *(void *)&self->_double playbackProgress = v24;

      id v26 = objc_alloc(MEMORY[0x263F82828]);
      uint64_t v27 = [*(id *)&self->_playbackProgress imageWithTintColor:v34];
      v28 = [*(id *)&self->_playbackProgress imageWithTintColor:v17];
      v29 = (void *)[v26 initWithImage:v27 highlightedImage:v28];
      [(CPUITableCell *)self setPlaybackProgressView:v29];

      double v30 = [(CPUITableCell *)self playbackProgressView];
      if ([(CPUITableCell *)self isFocused]) {
        id v31 = v17;
      }
      else {
        id v31 = v34;
      }
      [v30 setTintColor:v31];

      double v32 = [(CPUITableCell *)self playbackProgressView];
      [v32 sizeToFit];

      v33 = [(CPUITableCell *)self playbackProgressView];
      [(CPUITableCell *)self addSubview:v33];

      goto LABEL_7;
    }
  }
  else
  {
    CGRect v7 = [(CPUITableCell *)self playbackProgressView];
    id v8 = v7;
  }
  [v7 removeFromSuperview];

  [(CPUITableCell *)self setPlaybackProgressView:0];
}

- (void)updateArtwork
{
  double v3 = [(CPUITableCell *)self artworkImageView];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F82828]);
    double v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(CPUITableCell *)self setArtworkImageView:v5];

    double v6 = [(CPUITableCell *)self artworkImageView];
    [(CPUITableCell *)self addSubview:v6];
  }
  if ([(CPUITableCell *)self currentlyPlaying]
    && ([(CPUITableCell *)self isFocused] & 1) != 0
    || ([(CPUITableCell *)self isSelected] & 1) != 0
    || [(CPUITableCell *)self isHighlighted])
  {
    uint64_t v7 = [MEMORY[0x263F825C8] _carSystemFocusLabelColor];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263F825C8] _carSystemFocusColor];
  }
  id v11 = (id)v7;
  id v8 = [(CPUITableCell *)self artworkImageView];
  [v8 setTintColor:v11];

  id v9 = [(CPUITableCell *)self artwork];
  id v10 = [(CPUITableCell *)self artworkImageView];
  [v10 setImage:v9];

  [(CPUITableCell *)self _updatePlayingArtworkIfNeeded];
}

- (void)layoutSubviews
{
  v231.receiver = self;
  v231.super_class = (Class)CPUITableCell;
  [(CPUITableCell *)&v231 layoutSubviews];
  uint64_t v3 = [(CPUITableCell *)self effectiveUserInterfaceLayoutDirection];
  [(CPUITableCell *)self playbackProgress];
  double rect2 = v4;
  [(CPUITableCell *)self artworkSize];
  double v6 = v5;
  double v8 = v7;
  id v9 = [(CPUITableCell *)self artwork];
  [v9 size];
  double v11 = v10;
  double v13 = v12;

  double v14 = [(CPUITableCell *)self artwork];

  if (v14)
  {
    if (v11 < v13) {
      double v11 = v13;
    }
    [(CPUITableCell *)self bounds];
    double v15 = CGRectGetHeight(v232) + -12.0;
    if (v11 < v15) {
      double v15 = v11;
    }
    if (v15 < v6) {
      double v6 = v15;
    }
    if (v15 < v8) {
      double v8 = v15;
    }
  }
  [(CPUITableCell *)self bounds];
  double v16 = (CGRectGetHeight(v233) - v8) * 0.5;
  char v17 = [(CPUITableCell *)self artwork];
  if (v17)
  {

LABEL_12:
    double v18 = v6 + 6.0 + 8.0;
    double v19 = 0.0;
    double v20 = 0.0;
    double v21 = 0.0;
    goto LABEL_16;
  }
  if ([(CPUITableCell *)self playingIndicatorLeadingSide]
    && [(CPUITableCell *)self currentlyPlaying])
  {
    goto LABEL_12;
  }
  double v19 = *MEMORY[0x263F834E8];
  double v18 = *(double *)(MEMORY[0x263F834E8] + 8);
  double v20 = *(double *)(MEMORY[0x263F834E8] + 16);
  double v21 = *(double *)(MEMORY[0x263F834E8] + 24);
LABEL_16:
  double v22 = round(v16);
  -[CPUITableCell setSeparatorInset:](self, "setSeparatorInset:", v19, v18, v20, v21);
  v23 = [(CPUITableCell *)self artworkImageView];

  uint64_t v24 = (CGFloat *)MEMORY[0x263F001A8];
  if (!v23)
  {
    uint64_t v25 = objc_msgSend(objc_alloc(MEMORY[0x263F82828]), "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(CPUITableCell *)self setArtworkImageView:v25];

    id v26 = [(CPUITableCell *)self artworkImageView];
    [(CPUITableCell *)self addSubview:v26];
  }
  [(CPUITableCell *)self bounds];
  double v31 = CPUIRectByApplyingUserInterfaceLayoutDirectionInRect(6.0, v22, v6, v8, v27, v28, v29, v30);
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  v38 = [(CPUITableCell *)self artworkImageView];
  objc_msgSend(v38, "setFrame:", v31, v33, v35, v37);

  v39 = [(CPUITableCell *)self artworkImageView];
  [v39 setContentMode:2];

  v40 = [(CPUITableCell *)self artworkImageView];
  [v40 setClipsToBounds:1];

  v41 = [(CPUITableCell *)self artworkImageView];
  [v41 _setContinuousCornerRadius:4.0];

  v42 = [(CPUITableCell *)self playbackProgressView];

  if (v42)
  {
    uint64_t v43 = [(CPUITableCell *)self textLabel];
    [v43 frame];
    CGFloat v45 = v44;
    CGFloat v47 = v46;
    CGFloat v49 = v48;
    CGFloat v51 = v50;

    v52 = [(CPUITableCell *)self detailTextLabel];
    [v52 frame];
    CGFloat v54 = v53;
    CGFloat v56 = v55;
    CGFloat v58 = v57;
    CGFloat v60 = v59;

    v61 = [(CPUITableCell *)self playbackProgressView];
    [v61 frame];
    CGFloat v219 = v62;
    CGFloat rect = v63;
    double v225 = v65;
    double v227 = v64;

    CGFloat v215 = v47;
    double v217 = v51;
    double v212 = v49;
    double v214 = v45;
    if (v3 == 1)
    {
      v234.origin.x = v45;
      v234.origin.y = v47;
      v234.size.CGFloat width = v49;
      v234.size.height = v51;
      double MaxX = CGRectGetMaxX(v234);
      v235.origin.x = v54;
      double v67 = v56;
      v235.origin.y = v56;
      CGFloat v68 = v58;
      v235.size.CGFloat width = v58;
      v235.size.height = v60;
      double Width = CGRectGetWidth(v235);
      v70 = [(CPUITableCell *)self artworkImageView];
      [v70 frame];
      double MinX = CGRectGetMinX(v236);
      if (rect2 < 0.999999881)
      {
        v239.origin.x = v219;
        v239.origin.y = rect;
        v239.size.height = v225;
        v239.size.CGFloat width = v227;
        double v72 = CGRectGetWidth(v239);
      }
      else
      {
        objc_msgSend(*(id *)&self->_playbackProgress, "size", 0.999999881, rect2);
      }
      double v73 = MaxX - Width;
      double v74 = MinX - v72 + -8.0;
    }
    else
    {
      double v67 = v56;
      CGFloat v68 = v58;
      v237.origin.x = v45;
      v237.origin.y = v47;
      v237.size.CGFloat width = v49;
      v237.size.height = v51;
      double v73 = CGRectGetMinX(v237);
      v238.origin.x = v45;
      v238.origin.y = v47;
      v238.size.CGFloat width = v49;
      v238.size.height = v51;
      double v74 = CGRectGetMinX(v238);
    }
    double v222 = v60;
    if (rect2 < 0.999999881)
    {
      double v220 = v73;
      v242.origin.x = v73;
      v242.origin.y = v67;
      double v75 = v68;
      v242.size.CGFloat width = v68;
      v242.size.height = v60;
      double v86 = CGRectGetMaxY(v242) + 5.0;
      double v77 = v215;
    }
    else
    {
      v240.origin.x = v73;
      v240.origin.y = v67;
      double v75 = v68;
      v240.size.CGFloat width = v68;
      v240.size.height = v60;
      double v76 = CGRectGetMinY(v240) + 1.0;
      double v77 = v215;
      double v78 = v74;
      double v79 = v76;
      double v81 = v225;
      double v80 = v227;
      if (v3 == 1)
      {
        double v82 = CGRectGetMinX(*(CGRect *)&v78);
        v241.origin.x = v73;
        v241.origin.y = v67;
        v241.size.CGFloat width = v75;
        v241.size.height = v60;
        double v83 = v82 - CGRectGetWidth(v241) + -6.0;
        [(CPUITableCell *)self _accessoryWidth];
        double v85 = v83 - v84;
      }
      else
      {
        double v85 = CGRectGetMaxX(*(CGRect *)&v78) + 6.0;
      }
      double v220 = v85;
      double v86 = v76;
      double v67 = v67 + 1.0;
      uint64_t v87 = [(CPUITableCell *)self accessoryView];
      if (v87)
      {
        v88 = (void *)v87;
        v89 = [(CPUITableCell *)self accessoryView];
        [v89 frame];
        v274.origin.x = v90;
        v274.origin.y = v91;
        v274.size.CGFloat width = v92;
        v274.size.height = v93;
        v243.origin.x = v220;
        v243.size.height = v222;
        v243.origin.y = v67;
        v243.size.CGFloat width = v75;
        BOOL v94 = CGRectIntersectsRect(v243, v274);

        if (v94)
        {
          v244.origin.x = v74;
          v244.origin.y = v76;
          v244.size.height = v225;
          v244.size.CGFloat width = v227;
          double v75 = v75 - (CGRectGetWidth(v244) + 6.0);
        }
      }
    }
    v95 = [(CPUITableCell *)self detailTextLabel];
    v96 = [v95 text];
    uint64_t v97 = [v96 length];

    if (v97)
    {
      double v98 = rect2;
      if (rect2 >= 0.999999881)
      {
        double v99 = v67;
LABEL_39:
        v100 = [(CPUITableCell *)self textLabel];
        objc_msgSend(v100, "setFrame:", v214, v77, v212, v217);

        v101 = [(CPUITableCell *)self detailTextLabel];
        objc_msgSend(v101, "setFrame:", v220, v99, v75, v222);

        v102 = [(CPUITableCell *)self playbackProgressView];
        objc_msgSend(v102, "setFrame:", v74, v86, v227, v225);

        goto LABEL_40;
      }
      double v98 = -3.0;
      double v77 = v77 + -3.0;
      double v99 = v67 + -3.0;
    }
    else
    {
      double v99 = v67;
      double v98 = -8.0;
      double v77 = v77 + -8.0;
    }
    double v86 = v86 + v98;
    goto LABEL_39;
  }
LABEL_40:
  if ([(CPUITableCell *)self currentlyPlaying]
    && ![(CPUITableCell *)self playingIndicatorLeadingSide])
  {
    v104 = [(CPUITableCell *)self accessoryView];
    v105 = [(CPUITableCell *)self nowPlayingIndicator];
    BOOL v103 = v104 != v105;
  }
  else
  {
    BOOL v103 = 0;
  }
  if ([(CPUITableCell *)self currentlyPlaying])
  {
    if ([(CPUITableCell *)self playingIndicatorLeadingSide])
    {
      v106 = [(CPUITableCell *)self artworkImageView];
      [v106 center];
      objc_msgSend(*(id *)&self->_showExplicit, "setCenter:");
    }
    else
    {
      v107 = [(CPUITableCell *)self accessoryView];
      v108 = *(void **)&self->_showExplicit;

      if (v107 != v108)
      {
        v109 = [(CPUITableCell *)self nowPlayingIndicator];
        [v109 frame];
        CGFloat v111 = v110;
        CGFloat v113 = v112;
        CGFloat v115 = v114;
        CGFloat v117 = v116;

        uint64_t v118 = [(CPUITableCell *)self effectiveUserInterfaceLayoutDirection];
        if (v118 == 1)
        {
          double v119 = 8.0;
        }
        else
        {
          v108 = [(CPUITableCell *)self accessoryView];
          [v108 frame];
          double v120 = CGRectGetMinX(v245);
          v246.origin.x = v111;
          v246.origin.y = v113;
          v246.size.CGFloat width = v115;
          v246.size.height = v117;
          double v119 = v120 - CGRectGetWidth(v246) + -8.0;
        }
        v121 = [(CPUITableCell *)self contentView];
        [v121 bounds];
        double Height = CGRectGetHeight(v247);
        v248.origin.x = v111;
        v248.origin.y = v113;
        v248.size.CGFloat width = v115;
        v248.size.height = v117;
        double v123 = (Height - CGRectGetHeight(v248)) * 0.5;
        v249.origin.x = v111;
        v249.origin.y = v113;
        v249.size.CGFloat width = v115;
        v249.size.height = v117;
        double v124 = CGRectGetWidth(v249);
        v250.origin.x = v111;
        v250.origin.y = v113;
        v250.size.CGFloat width = v115;
        v250.size.height = v117;
        double v125 = CGRectGetHeight(v250);

        if (v118 != 1) {
        objc_msgSend(*(id *)&self->_showExplicit, "setFrame:", v119, v123, v124, v125);
        }
      }
    }
  }
  if ([(CPUITableCell *)self isShowExplicit]
    || [(CPUITableCell *)self currentlyPlaying]
    && ![(CPUITableCell *)self playingIndicatorLeadingSide])
  {
    v126 = [(CPUITableCell *)self explicitItemView];
    [v126 frame];
    CGFloat v128 = v127;
    CGFloat v130 = v129;
    double v228 = v132;
    double rect2a = v131;

    v133 = [(CPUITableCell *)self textLabel];
    [v133 frame];
    double v135 = v134;
    double v137 = v136;
    double v139 = v138;
    CGFloat v141 = v140;

    v142 = [(CPUITableCell *)self detailTextLabel];
    [v142 frame];
    double v218 = v144;
    double v221 = v143;
    double v223 = v145;
    double v216 = v146;

    double v147 = v135;
    double v148 = v137;
    double v149 = v139;
    CGFloat v150 = v141;
    if (v3 == 1)
    {
      CGFloat v151 = CGRectGetMinX(*(CGRect *)&v147) + -8.0;
      v251.origin.x = v128;
      v251.origin.y = v130;
      v251.size.height = v228;
      v251.size.CGFloat width = rect2a;
      double v152 = v151 - CGRectGetWidth(v251);
    }
    else
    {
      double v152 = CGRectGetMaxX(*(CGRect *)&v147) + 8.0;
    }
    double v226 = v152;
    double v153 = v141;
    v252.origin.x = v135;
    v252.origin.y = v137;
    v252.size.CGFloat width = v139;
    v252.size.height = v141;
    double MidY = CGRectGetMidY(v252);
    v155 = [(CPUITableCell *)self explicitItemView];
    [v155 frame];
    double v156 = round(MidY + CGRectGetHeight(v253) * -0.5);

    if (v3 == 1)
    {
      double v157 = v226;
      LOBYTE(v158) = v226 < 0.0;
      v159 = [(CPUITableCell *)self accessoryView];

      if (v159)
      {
        if (v226 < 0.0)
        {
          if (!v103) {
            goto LABEL_95;
          }
          goto LABEL_72;
        }
        v165 = [(CPUITableCell *)self accessoryView];
        [v165 frame];
        v275.origin.x = v226;
        v275.origin.y = v156;
        v275.size.height = v228;
        v275.size.CGFloat width = rect2a;
        LOBYTE(v158) = CGRectIntersectsRect(v256, v275);
      }
      double v164 = v223;
      if (!v103) {
        goto LABEL_90;
      }
      if ((v158 & 1) == 0)
      {
        v169 = [(CPUITableCell *)self nowPlayingIndicator];
        [v169 frame];
        v278.origin.x = v226;
        v278.origin.y = v156;
        v278.size.height = v228;
        v278.size.CGFloat width = rect2a;
        if (CGRectIntersectsRect(v259, v278))
        {
          int v158 = 1;
        }
        else
        {
          v171 = [(CPUITableCell *)self nowPlayingIndicator];
          [v171 frame];
          v280.origin.x = v135;
          v280.origin.y = v137;
          v280.size.CGFloat width = v139;
          v280.size.height = v153;
          int v158 = CGRectIntersectsRect(v261, v280);
        }
        goto LABEL_86;
      }
LABEL_72:
      int v158 = 1;
LABEL_86:
      double v213 = v156;
      v172 = [(CPUITableCell *)self nowPlayingIndicator];
      [v172 frame];
      CGFloat v174 = v173;
      CGFloat v176 = v175;
      CGFloat v178 = v177;
      CGFloat v180 = v179;
      v181 = [(CPUITableCell *)self detailTextLabel];
      [v181 frame];
      v281.origin.x = v182;
      v281.origin.y = v183;
      v281.size.CGFloat width = v184;
      v281.size.height = v185;
      v262.origin.x = v174;
      v262.origin.y = v176;
      v262.size.CGFloat width = v178;
      v262.size.height = v180;
      BOOL v186 = CGRectIntersectsRect(v262, v281);

      if (!v186)
      {
        double v156 = v213;
        double v164 = v223;
        double v157 = v226;
        if (!v158)
        {
LABEL_111:
          v210 = [(CPUITableCell *)self explicitItemView];
          objc_msgSend(v210, "setFrame:", v157, v156, rect2a, v228);

          return;
        }
        goto LABEL_93;
      }
      v187 = [(CPUITableCell *)self nowPlayingIndicator];
      [v187 frame];
      double v188 = CGRectGetWidth(v263) + 8.0;

      double v189 = v223 - v188;
      double v190 = -0.0;
      if (v3 == 1) {
        double v190 = v188;
      }
      double v191 = v221 + v190;
      v192 = [(CPUITableCell *)self detailTextLabel];
      double v221 = v191;
      double v193 = v191;
      double v164 = v189;
      objc_msgSend(v192, "setFrame:", v193, v218, v189, v216);

      double v156 = v213;
      double v157 = v226;
LABEL_90:
      if ((v158 & 1) == 0) {
        goto LABEL_111;
      }
LABEL_93:
      if (v3 != 1)
      {
        CGFloat v224 = v137;
        [(CPUITableCell *)self frame];
        double v198 = CGRectGetMaxX(v267);
        v199 = [(CPUITableCell *)self accessoryView];

        if (v199)
        {
          v200 = [(CPUITableCell *)self accessoryView];
          [v200 frame];
          double v198 = CGRectGetMinX(v268);
        }
        double v201 = v24[2];
        if (v103)
        {
          v202 = [(CPUITableCell *)self nowPlayingIndicator];
          [v202 frame];
          double v198 = CGRectGetMinX(v269);
        }
        if (v201 > 0.0)
        {
          v203 = [(CPUITableCell *)self accessoryView];

          if (!v203)
          {
            v270.origin.x = *v24;
            v270.origin.y = v24[1];
            v270.size.height = v24[3];
            v270.size.CGFloat width = v201;
            double v198 = CGRectGetMinX(v270);
          }
        }
        BOOL v204 = [(CPUITableCell *)self isShowExplicit];
        double v205 = 8.0;
        if (v204)
        {
          v271.origin.x = v226;
          v271.size.height = v228;
          v271.origin.y = v156;
          v271.size.CGFloat width = rect2a;
          double v205 = CGRectGetWidth(v271) + 16.0;
        }
        double v197 = v198 - v135 - v205;
        v206 = [(CPUITableCell *)self textLabel];
        [v206 sizeToFit];

        v207 = [(CPUITableCell *)self textLabel];
        [v207 frame];
        double v196 = CGRectGetWidth(v272);

        if (v197 < v196) {
          double v196 = v197;
        }
        v273.origin.x = v135;
        double v137 = v224;
        v273.origin.y = v224;
        v273.size.CGFloat width = v196;
        v273.size.height = v153;
        double v157 = CGRectGetMaxX(v273) + 8.0;
        goto LABEL_110;
      }
      double v223 = v164;
LABEL_95:
      v264.origin.x = v157;
      v264.origin.y = v156;
      v264.size.height = v228;
      v264.size.CGFloat width = rect2a;
      double v194 = round(CGRectGetWidth(v264) + 8.0);
      if (v103)
      {
        v195 = [(CPUITableCell *)self nowPlayingIndicator];
        [v195 frame];
        double v194 = v194 + CGRectGetWidth(v265) + 8.0;
      }
      double v196 = v139 - v194;
      double v135 = v135 + v194;
      v266.origin.x = v135;
      v266.origin.y = v137;
      v266.size.CGFloat width = v139 - v194;
      v266.size.height = v153;
      double v157 = CGRectGetMinX(v266) - v194;
      double v197 = v223;
LABEL_110:
      v208 = [(CPUITableCell *)self textLabel];
      objc_msgSend(v208, "setFrame:", v135, v137, v196, v153);

      v209 = [(CPUITableCell *)self detailTextLabel];
      objc_msgSend(v209, "setFrame:", v221, v218, v197, v216);

      goto LABEL_111;
    }
    v254.origin.x = v226;
    v254.size.height = v228;
    v254.origin.y = v156;
    v254.size.CGFloat width = rect2a;
    double v160 = CGRectGetMaxX(v254);
    [(CPUITableCell *)self frame];
    double v161 = CGRectGetMaxX(v255) + -8.0;
    BOOL v162 = v160 >= v161;
    v163 = [(CPUITableCell *)self accessoryView];

    if (v163)
    {
      if (v160 >= v161)
      {
        [(CPUITableCell *)self currentlyPlaying];
        int v158 = 1;
        double v164 = v223;
        double v157 = v226;
        goto LABEL_82;
      }
      v166 = [(CPUITableCell *)self accessoryView];
      [v166 frame];
      double v157 = v226;
      v276.size.height = v228;
      v276.origin.x = v226;
      v276.origin.y = v156;
      v276.size.CGFloat width = rect2a;
      BOOL v162 = CGRectIntersectsRect(v257, v276);
    }
    else
    {
      double v157 = v226;
    }
    double v164 = v223;
    BOOL v167 = [(CPUITableCell *)self currentlyPlaying];
    int v158 = v167 || v162;
    if (v167 && !v162)
    {
      v168 = [(CPUITableCell *)self nowPlayingIndicator];
      [v168 frame];
      v277.origin.x = v157;
      v277.origin.y = v156;
      v277.size.height = v228;
      v277.size.CGFloat width = rect2a;
      if (CGRectIntersectsRect(v258, v277))
      {
        int v158 = 1;
      }
      else
      {
        v170 = [(CPUITableCell *)self nowPlayingIndicator];
        [v170 frame];
        v279.origin.x = v135;
        v279.origin.y = v137;
        v279.size.CGFloat width = v139;
        v279.size.height = v153;
        int v158 = CGRectIntersectsRect(v260, v279);
      }
    }
LABEL_82:
    if (!v103) {
      goto LABEL_90;
    }
    goto LABEL_86;
  }
}

- (void)_updatePlayingArtworkIfNeeded
{
  if (![(CPUITableCell *)self currentlyPlaying])
  {
    double v7 = [(CPUITableCell *)self artworkImageView];
    [v7 setAlpha:1.0];

    double v8 = [(CPUITableCell *)self nowPlayingIndicator];
    [v8 setPlaybackState:0];

    id v13 = [(CPUITableCell *)self nowPlayingIndicator];
    [v13 removeFromSuperview];
    goto LABEL_13;
  }
  if ([(CPUITableCell *)self playingIndicatorLeadingSide])
  {
    uint64_t v3 = [(CPUITableCell *)self artworkImageView];
    [v3 setAlpha:0.200000003];
  }
  [*(id *)&self->_showExplicit sizeToFit];
  if ([(CPUITableCell *)self playingIndicatorLeadingSide])
  {
    double v4 = [(CPUITableCell *)self contentView];
    uint64_t v5 = *(void *)&self->_showExplicit;
    double v6 = [(CPUITableCell *)self artworkImageView];
    [v4 insertSubview:v5 above:v6];

LABEL_10:
    goto LABEL_12;
  }
  id v9 = [(CPUITableCell *)self accessoryView];

  if (!v9)
  {
    [(CPUITableCell *)self setAccessoryView:*(void *)&self->_showExplicit];
    goto LABEL_12;
  }
  double v10 = [(CPUITableCell *)self accessoryView];
  double v11 = *(void **)&self->_showExplicit;

  if (v10 != v11)
  {
    double v4 = [(CPUITableCell *)self contentView];
    [v4 addSubview:*(void *)&self->_showExplicit];
    goto LABEL_10;
  }
LABEL_12:
  int64_t v12 = [(CPUITableCell *)self playbackState];
  id v13 = [(CPUITableCell *)self nowPlayingIndicator];
  [v13 setPlaybackState:v12];
LABEL_13:
}

- (MPUNowPlayingIndicatorView)nowPlayingIndicator
{
  return *(MPUNowPlayingIndicatorView **)&self->_showExplicit;
}

- (CGSize)artworkSize
{
  activityIndicatorView = self->_activityIndicatorView;
  double width = self->_artworkSize.width;
  result.height = width;
  result.double width = *(double *)&activityIndicatorView;
  return result;
}

- (void)setArtworkSize:(CGSize)a3
{
  *(CGSize *)&self->_activityIndicatorView = a3;
}

- (BOOL)isShowExplicit
{
  return *(&self->super._itemEnabled + 1);
}

- (void)setShowExplicit:(BOOL)a3
{
  *(&self->super._itemEnabled + 1) = a3;
}

- (CPUITableCellAccessory)cloudAccessory
{
  return (CPUITableCellAccessory *)self->_nowPlayingIndicator;
}

- (void)setCloudAccessory:(id)a3
{
}

- (CPUITableCellAccessory)accessory
{
  return self->_cloudAccessory;
}

- (void)setAccessory:(id)a3
{
}

- (UIImage)cloudImage
{
  return (UIImage *)self->_accessory;
}

- (void)setCloudImage:(id)a3
{
}

- (UIImage)chevronImage
{
  return self->_cloudImage;
}

- (void)setChevronImage:(id)a3
{
}

- (BOOL)showActivityIndicator
{
  return *(&self->super._itemEnabled + 2);
}

- (double)playbackProgress
{
  return *(double *)&self->_chevronImage;
}

- (void)setPlaybackProgress:(double)a3
{
  *(double *)&self->_chevronImage = a3;
}

- (UIImage)playbackProgressFullImage
{
  return *(UIImage **)&self->_playbackProgress;
}

- (void)setPlaybackProgressFullImage:(id)a3
{
}

- (BOOL)shouldShowPlaybackProgress
{
  return *(&self->super._itemEnabled + 3);
}

- (void)setShouldShowPlaybackProgress:(BOOL)a3
{
  *(&self->super._itemEnabled + 3) = a3;
}

- (BOOL)container
{
  return *(&self->super._itemEnabled + 4);
}

- (UIImage)artwork
{
  return self->_playbackProgressFullImage;
}

- (void)setArtwork:(id)a3
{
}

- (int64_t)playbackState
{
  return (int64_t)self->_artwork;
}

- (void)setPlaybackState:(int64_t)a3
{
  self->_artwork = (UIImage *)a3;
}

- (BOOL)playingIndicatorLeadingSide
{
  return *(&self->super._itemEnabled + 5);
}

- (void)setPlayingIndicatorLeadingSide:(BOOL)a3
{
  *(&self->super._itemEnabled + 5) = a3;
}

- (UIView)playbackProgressView
{
  return (UIView *)self->_playbackState;
}

- (void)setPlaybackProgressView:(id)a3
{
}

- (UIImageView)artworkImageView
{
  return (UIImageView *)self->_playbackProgressView;
}

- (void)setArtworkImageView:(id)a3
{
}

- (UIImageView)explicitItemView
{
  return self->_artworkImageView;
}

- (void)setExplicitItemView:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return (UIActivityIndicatorView *)self->_explicitItemView;
}

- (void)setActivityIndicatorView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explicitItemView, 0);
  objc_storeStrong((id *)&self->_artworkImageView, 0);
  objc_storeStrong((id *)&self->_playbackProgressView, 0);
  objc_storeStrong((id *)&self->_playbackState, 0);
  objc_storeStrong((id *)&self->_playbackProgressFullImage, 0);
  objc_storeStrong((id *)&self->_playbackProgress, 0);
  objc_storeStrong((id *)&self->_cloudImage, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_cloudAccessory, 0);
  objc_storeStrong((id *)&self->_nowPlayingIndicator, 0);
  objc_storeStrong((id *)&self->_showExplicit, 0);
}

@end