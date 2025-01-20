@interface ASCMediaCollectionViewCell
+ (CGSize)sizeForArtwork:(id)a3 thatFits:(CGSize)a4 usingTraitCollection:(id)a5;
+ (double)minimumLineSpacing;
- (ASCArtwork)artwork;
- (ASCBorderedScreenshotView)screenshotView;
- (ASCMediaCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)applyArtwork:(id)a3 image:(id)a4 screenshotDisplayConfiguration:(id)a5;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setArtwork:(id)a3;
@end

@implementation ASCMediaCollectionViewCell

- (ASCMediaCollectionViewCell)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)ASCMediaCollectionViewCell;
  v3 = -[ASCMediaCollectionViewCell initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [ASCBorderedScreenshotView alloc];
    v5 = +[ASCScreenshotDisplayConfiguration defaultConfiguration];
    uint64_t v6 = -[ASCBorderedScreenshotView initWithFrame:screenshotDisplayConfiguration:](v4, "initWithFrame:screenshotDisplayConfiguration:", v5, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    screenshotView = v3->_screenshotView;
    v3->_screenshotView = (ASCBorderedScreenshotView *)v6;

    [(ASCBorderedScreenshotView *)v3->_screenshotView setIsAccessibilityElement:1];
    [(ASCBorderedScreenshotView *)v3->_screenshotView setAccessibilityTraits:*MEMORY[0x1E4FB2558]];
    v9 = ASCLocalizedString(@"AX_ARTWORK", v8);
    [(ASCBorderedScreenshotView *)v3->_screenshotView setAccessibilityLabel:v9];

    v10 = [(ASCMediaCollectionViewCell *)v3 contentView];
    [v10 addSubview:v3->_screenshotView];
  }
  return v3;
}

- (void)applyArtwork:(id)a3 image:(id)a4 screenshotDisplayConfiguration:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  [(ASCMediaCollectionViewCell *)self setArtwork:a3];
  v10 = [(ASCMediaCollectionViewCell *)self screenshotView];
  v11 = [v10 artworkView];
  [v11 setImage:v9];

  id v13 = [(ASCMediaCollectionViewCell *)self screenshotView];
  objc_super v12 = [v13 artworkView];
  [v12 setScreenshotDisplayConfiguration:v8];
}

- (void)prepareForReuse
{
  v8.receiver = self;
  v8.super_class = (Class)ASCMediaCollectionViewCell;
  [(ASCMediaCollectionViewCell *)&v8 prepareForReuse];
  [(ASCMediaCollectionViewCell *)self setArtwork:0];
  v3 = [(ASCMediaCollectionViewCell *)self screenshotView];
  v4 = [v3 artworkView];
  [v4 setImage:0];

  v5 = +[ASCScreenshotDisplayConfiguration defaultConfiguration];
  uint64_t v6 = [(ASCMediaCollectionViewCell *)self screenshotView];
  v7 = [v6 artworkView];
  [v7 setScreenshotDisplayConfiguration:v5];
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)ASCMediaCollectionViewCell;
  [(ASCMediaCollectionViewCell *)&v20 layoutSubviews];
  v3 = [(ASCMediaCollectionViewCell *)self artwork];
  v4 = [(ASCMediaCollectionViewCell *)self contentView];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  id v9 = [(ASCMediaCollectionViewCell *)self traitCollection];
  +[ASCMediaCollectionViewCell sizeForArtwork:thatFits:usingTraitCollection:](ASCMediaCollectionViewCell, "sizeForArtwork:thatFits:usingTraitCollection:", v3, v9, v6, v8);
  double v11 = v10;
  double v13 = v12;

  v14 = [(ASCMediaCollectionViewCell *)self contentView];
  [v14 bounds];
  double v16 = v15;
  double v18 = v17;

  v19 = [(ASCMediaCollectionViewCell *)self screenshotView];
  objc_msgSend(v19, "setFrame:", (v16 - v11) * 0.5, (v18 - v13) * 0.5, v11, v13);
}

+ (double)minimumLineSpacing
{
  return 15.0;
}

+ (CGSize)sizeForArtwork:(id)a3 thatFits:(CGSize)a4 usingTraitCollection:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v8 = a3;
  id v9 = a5;
  if (([v8 isPortrait] & 1) != 0 || objc_msgSend(v9, "userInterfaceIdiom"))
  {
    [v8 width];
    double v11 = v10;
    [v8 height];
  }
  else
  {
    [v8 height];
    double v11 = v13;
    [v8 width];
  }
  if (v11 / v12 <= width / height) {
    double v14 = height / v12;
  }
  else {
    double v14 = width / v11;
  }
  double v15 = v12 * v14;
  double v16 = v11 * v14;

  double v17 = v16;
  double v18 = v15;
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (ASCBorderedScreenshotView)screenshotView
{
  return self->_screenshotView;
}

- (ASCArtwork)artwork
{
  return self->_artwork;
}

- (void)setArtwork:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artwork, 0);

  objc_storeStrong((id *)&self->_screenshotView, 0);
}

@end