@interface AVTStickerRecentsStickerCollectionViewCell
+ (id)identifier;
- (AVTStickerRecentsStickerCollectionViewCell)initWithFrame:(CGRect)a3;
- (BOOL)showPrereleaseSticker;
- (CGRect)contentBounds;
- (NSString)title;
- (NSUUID)displaySessionUUID;
- (UIImageView)imageView;
- (UILabel)prereleaseLabel;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setDisplaySessionUUID:(id)a3;
- (void)setShowPrereleaseSticker:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setupPrereleaseLabelIfNeeded;
- (void)updateWithDefaultImage;
- (void)updateWithImage:(id)a3;
@end

@implementation AVTStickerRecentsStickerCollectionViewCell

+ (id)identifier
{
  return @"AVTStickerRecentsStickerCollectionViewCell";
}

- (AVTStickerRecentsStickerCollectionViewCell)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AVTStickerRecentsStickerCollectionViewCell;
  v3 = -[AVTStickerRecentsStickerCollectionViewCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1C6D0]);
    [(AVTStickerRecentsStickerCollectionViewCell *)v3 contentBounds];
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:");
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v5;

    [(AVTStickerRecentsStickerCollectionViewCell *)v3 updateWithDefaultImage];
    [(UIImageView *)v3->_imageView setAccessibilityIgnoresInvertColors:1];
    v7 = [(AVTStickerRecentsStickerCollectionViewCell *)v3 contentView];
    [v7 addSubview:v3->_imageView];
  }
  return v3;
}

- (void)updateWithDefaultImage
{
  id v4 = [(AVTStickerRecentsStickerCollectionViewCell *)self traitCollection];
  v3 = AVTFlatSilhouetteImageForTraitCollection(v4);
  [(UIImageView *)self->_imageView setImage:v3];
}

- (CGRect)contentBounds
{
  v2 = [(AVTStickerRecentsStickerCollectionViewCell *)self contentView];
  [v2 bounds];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;

  uint64_t v11 = v4;
  uint64_t v12 = v6;
  uint64_t v13 = v8;
  uint64_t v14 = v10;
  return CGRectInset(*(CGRect *)&v11, 4.0, 4.0);
}

- (void)setShowPrereleaseSticker:(BOOL)a3
{
  if (self->_showPrereleaseSticker != a3)
  {
    BOOL v3 = a3;
    self->_showPrereleaseSticker = a3;
    if (a3) {
      [(AVTStickerRecentsStickerCollectionViewCell *)self setupPrereleaseLabelIfNeeded];
    }
    id v5 = [(AVTStickerRecentsStickerCollectionViewCell *)self prereleaseLabel];
    [v5 setHidden:!v3];
  }
}

- (void)setupPrereleaseLabelIfNeeded
{
  BOOL v3 = [(AVTStickerRecentsStickerCollectionViewCell *)self prereleaseLabel];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1C768]);
    [(AVTStickerRecentsStickerCollectionViewCell *)self bounds];
    double v6 = v5 + -15.0;
    [(AVTStickerRecentsStickerCollectionViewCell *)self bounds];
    uint64_t v7 = (UILabel *)objc_msgSend(v4, "initWithFrame:", 0.0, v6);
    [(UILabel *)v7 setAutoresizingMask:10];
    uint64_t v8 = AVTAvatarUIBundle();
    uint64_t v9 = [v8 localizedStringForKey:@"STICKER_PRERELEASE" value:&stru_26BF058D0 table:@"Localized"];
    [(UILabel *)v7 setText:v9];

    [(UILabel *)v7 setUserInteractionEnabled:0];
    [(UILabel *)v7 setTextAlignment:1];
    [(UILabel *)v7 setAdjustsFontSizeToFitWidth:1];
    uint64_t v10 = [MEMORY[0x263F1C550] systemRedColor];
    [(UILabel *)v7 setTextColor:v10];

    uint64_t v11 = [(AVTStickerRecentsStickerCollectionViewCell *)self contentView];
    [v11 addSubview:v7];

    prereleaseLabel = self->_prereleaseLabel;
    self->_prereleaseLabel = v7;
  }
}

- (void)layoutSubviews
{
  v51.receiver = self;
  v51.super_class = (Class)AVTStickerRecentsStickerCollectionViewCell;
  [(AVTStickerRecentsStickerCollectionViewCell *)&v51 layoutSubviews];
  [(AVTStickerRecentsStickerCollectionViewCell *)self contentBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(AVTStickerRecentsStickerCollectionViewCell *)self imageView];
  uint64_t v12 = [v11 image];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(AVTStickerRecentsStickerCollectionViewCell *)self imageView];
    v15 = [v14 image];
    [v15 size];
    double v17 = v16;
    double v19 = v18;
    double v20 = *MEMORY[0x263F001B0];
    double v21 = *(double *)(MEMORY[0x263F001B0] + 8);

    if (v17 != v20 || v19 != v21)
    {
      v23 = [(AVTStickerRecentsStickerCollectionViewCell *)self imageView];
      v24 = [v23 image];
      [v24 size];
      double v50 = v25;
      v26 = [(AVTStickerRecentsStickerCollectionViewCell *)self imageView];
      v27 = [v26 image];
      [v27 size];
      double v49 = v28;

      v29 = [(AVTStickerRecentsStickerCollectionViewCell *)self imageView];
      v30 = [v29 image];
      [v30 size];
      double v32 = v31;
      double v34 = v33;
      v35 = [(AVTStickerRecentsStickerCollectionViewCell *)self imageView];
      v36 = [v35 image];
      [v36 size];
      double v38 = v37;
      double v40 = v39;

      if (v50 <= v49)
      {
        double v42 = v8;
        double v41 = v8 * v34 / v38;
      }
      else
      {
        double v41 = v10;
        double v42 = v10 * v32 / v40;
      }
      goto LABEL_10;
    }
  }
  else
  {
  }
  double v41 = v10;
  double v42 = v8;
LABEL_10:
  v43 = [(AVTStickerRecentsStickerCollectionViewCell *)self imageView];
  objc_msgSend(v43, "setFrame:", v4 + (v8 - v42) * 0.5, v6 + (v10 - v41) * 0.5, v42, v41);

  if ([(AVTStickerRecentsStickerCollectionViewCell *)self showPrereleaseSticker])
  {
    [(AVTStickerRecentsStickerCollectionViewCell *)self bounds];
    double v45 = v44 + -15.0;
    [(AVTStickerRecentsStickerCollectionViewCell *)self bounds];
    double v47 = v46;
    v48 = [(AVTStickerRecentsStickerCollectionViewCell *)self prereleaseLabel];
    objc_msgSend(v48, "setFrame:", 0.0, v45, v47, 15.0);
  }
}

- (void)setTitle:(id)a3
{
  if (self->_title != a3)
  {
    double v4 = (NSString *)[a3 copy];
    title = self->_title;
    self->_title = v4;
    MEMORY[0x270F9A758](v4, title);
  }
}

- (void)updateWithImage:(id)a3
{
  double v4 = [MEMORY[0x263F29690] trimmedImageByTrimmingTransparentPixelsFromImage:a3];
  [(UIImageView *)self->_imageView setImage:v4];

  [(AVTStickerRecentsStickerCollectionViewCell *)self setNeedsLayout];
}

- (void)prepareForReuse
{
  displaySessionUUID = self->_displaySessionUUID;
  self->_displaySessionUUID = 0;

  title = self->_title;
  self->_title = 0;

  [(AVTStickerRecentsStickerCollectionViewCell *)self setShowPrereleaseSticker:0];
  [(AVTStickerRecentsStickerCollectionViewCell *)self updateWithDefaultImage];
  [(AVTStickerRecentsStickerCollectionViewCell *)self setNeedsLayout];
  v5.receiver = self;
  v5.super_class = (Class)AVTStickerRecentsStickerCollectionViewCell;
  [(AVTStickerRecentsStickerCollectionViewCell *)&v5 prepareForReuse];
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (NSString)title
{
  return self->_title;
}

- (NSUUID)displaySessionUUID
{
  return self->_displaySessionUUID;
}

- (void)setDisplaySessionUUID:(id)a3
{
}

- (BOOL)showPrereleaseSticker
{
  return self->_showPrereleaseSticker;
}

- (UILabel)prereleaseLabel
{
  return self->_prereleaseLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prereleaseLabel, 0);
  objc_storeStrong((id *)&self->_displaySessionUUID, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end