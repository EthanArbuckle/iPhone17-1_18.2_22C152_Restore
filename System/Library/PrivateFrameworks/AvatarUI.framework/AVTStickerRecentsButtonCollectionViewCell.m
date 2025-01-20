@interface AVTStickerRecentsButtonCollectionViewCell
+ (id)identifier;
- (AVTStickerRecentsButtonCollectionViewCell)initWithFrame:(CGRect)a3;
- (CAShapeLayer)circularBackgroundLayer;
- (CGRect)circleLayerRect;
- (CGRect)contentBounds;
- (void)layoutSubviews;
- (void)setCircularBackgroundLayer:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateWithDefaultImage;
@end

@implementation AVTStickerRecentsButtonCollectionViewCell

+ (id)identifier
{
  return @"AVTStickerRecentsButtonCollectionViewCell";
}

- (AVTStickerRecentsButtonCollectionViewCell)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)AVTStickerRecentsButtonCollectionViewCell;
  v3 = -[AVTStickerRecentsStickerCollectionViewCell initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.9];
    v5 = [(AVTStickerRecentsStickerCollectionViewCell *)v3 imageView];
    [v5 setTintColor:v4];

    v6 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x263F15880]);
    circularBackgroundLayer = v3->_circularBackgroundLayer;
    v3->_circularBackgroundLayer = v6;

    id v8 = [MEMORY[0x263F1C550] tertiarySystemFillColor];
    -[CAShapeLayer setFillColor:](v3->_circularBackgroundLayer, "setFillColor:", [v8 CGColor]);

    v9 = [(AVTStickerRecentsButtonCollectionViewCell *)v3 contentView];
    [v9 bounds];
    -[CAShapeLayer setFrame:](v3->_circularBackgroundLayer, "setFrame:");

    v10 = [(AVTStickerRecentsButtonCollectionViewCell *)v3 contentView];
    v11 = [v10 layer];
    [v11 addSublayer:v3->_circularBackgroundLayer];

    v12 = [(AVTStickerRecentsButtonCollectionViewCell *)v3 contentView];
    v13 = [(AVTStickerRecentsStickerCollectionViewCell *)v3 imageView];
    [v12 bringSubviewToFront:v13];
  }
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AVTStickerRecentsButtonCollectionViewCell;
  id v4 = a3;
  [(AVTStickerRecentsButtonCollectionViewCell *)&v9 traitCollectionDidChange:v4];
  v5 = [(AVTStickerRecentsButtonCollectionViewCell *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    id v8 = [MEMORY[0x263F1C550] tertiarySystemFillColor];
    -[CAShapeLayer setFillColor:](self->_circularBackgroundLayer, "setFillColor:", [v8 CGColor]);
  }
}

- (CGRect)contentBounds
{
  [(AVTStickerRecentsButtonCollectionViewCell *)self circleLayerRect];
  return CGRectInset(*(CGRect *)&v2, v4 * 0.175, v5 * 0.175);
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)AVTStickerRecentsButtonCollectionViewCell;
  [(AVTStickerRecentsStickerCollectionViewCell *)&v6 layoutSubviews];
  v3 = [(AVTStickerRecentsButtonCollectionViewCell *)self contentView];
  [v3 bounds];
  -[CAShapeLayer setFrame:](self->_circularBackgroundLayer, "setFrame:");

  double v4 = (void *)MEMORY[0x263F1C478];
  [(AVTStickerRecentsButtonCollectionViewCell *)self circleLayerRect];
  objc_msgSend(v4, "bezierPathWithOvalInRect:");
  id v5 = objc_claimAutoreleasedReturnValue();
  -[CAShapeLayer setPath:](self->_circularBackgroundLayer, "setPath:", [v5 CGPath]);
}

- (CGRect)circleLayerRect
{
  v3 = [(AVTStickerRecentsButtonCollectionViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  double v8 = fmin(v5, 40.0);
  double v9 = fmin(v7, 40.0);
  v10 = [(AVTStickerRecentsButtonCollectionViewCell *)self contentView];
  [v10 bounds];
  double v12 = floor((v11 - v8) * 0.5);

  v13 = [(AVTStickerRecentsButtonCollectionViewCell *)self contentView];
  [v13 bounds];
  double v15 = floor((v14 - v9) * 0.5);

  double v16 = v12;
  double v17 = v15;
  double v18 = v8;
  double v19 = v9;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)updateWithDefaultImage
{
  v3 = [(AVTStickerRecentsStickerCollectionViewCell *)self imageView];
  double v4 = [v3 image];

  if (!v4)
  {
    AVTMoreButtonImage();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    double v5 = [(AVTStickerRecentsStickerCollectionViewCell *)self imageView];
    [v5 setImage:v6];
  }
}

- (CAShapeLayer)circularBackgroundLayer
{
  return self->_circularBackgroundLayer;
}

- (void)setCircularBackgroundLayer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end