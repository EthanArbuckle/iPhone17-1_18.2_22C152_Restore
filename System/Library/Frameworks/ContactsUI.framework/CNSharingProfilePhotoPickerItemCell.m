@interface CNSharingProfilePhotoPickerItemCell
+ (id)reuseIdentifier;
- (BOOL)isSmallScreen;
- (CAShapeLayer)selectionStrokeLayer;
- (CGSize)originalSize;
- (CNSharingProfilePhotoPickerItem)pickerItem;
- (CNSharingProfilePhotoPickerItemCell)initWithFrame:(CGRect)a3;
- (UIImageView)imageView;
- (id)selectionBezierPath;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setHighlighted:(BOOL)a3;
- (void)setImageView:(id)a3;
- (void)setIsSmallScreen:(BOOL)a3;
- (void)setOriginalSize:(CGSize)a3;
- (void)setPickerItem:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectionStrokeLayer:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateWithImage:(id)a3;
@end

@implementation CNSharingProfilePhotoPickerItemCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_selectionStrokeLayer, 0);

  objc_storeStrong((id *)&self->_pickerItem, 0);
}

- (void)setOriginalSize:(CGSize)a3
{
  self->_originalSize = a3;
}

- (CGSize)originalSize
{
  double width = self->_originalSize.width;
  double height = self->_originalSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImageView:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setSelectionStrokeLayer:(id)a3
{
}

- (CAShapeLayer)selectionStrokeLayer
{
  return self->_selectionStrokeLayer;
}

- (CNSharingProfilePhotoPickerItem)pickerItem
{
  return self->_pickerItem;
}

- (void)setIsSmallScreen:(BOOL)a3
{
  self->_isSmallScreen = a3;
}

- (BOOL)isSmallScreen
{
  return self->_isSmallScreen;
}

- (void)prepareForReuse
{
  [(UIImageView *)self->_imageView setImage:0];
  [(CAShapeLayer *)self->_selectionStrokeLayer setHidden:1];
  v3.receiver = self;
  v3.super_class = (Class)CNSharingProfilePhotoPickerItemCell;
  [(CNSharingProfilePhotoPickerItemCell *)&v3 prepareForReuse];
}

- (void)setSelected:(BOOL)a3
{
}

- (void)setHighlighted:(BOOL)a3
{
}

- (void)updateWithImage:(id)a3
{
}

- (id)selectionBezierPath
{
  v2 = (void *)MEMORY[0x1E4FB14C0];
  [(CNSharingProfilePhotoPickerItemCell *)self bounds];
  CGRect v6 = CGRectInset(v5, 3.0, 3.0);

  return (id)objc_msgSend(v2, "bezierPathWithOvalInRect:", v6.origin.x, v6.origin.y, v6.size.width, v6.size.height);
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CNSharingProfilePhotoPickerItemCell;
  id v4 = a3;
  [(CNSharingProfilePhotoPickerItemCell *)&v9 traitCollectionDidChange:v4];
  uint64_t v5 = objc_msgSend(v4, "userInterfaceStyle", v9.receiver, v9.super_class);

  CGRect v6 = [(CNSharingProfilePhotoPickerItemCell *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceStyle];

  if (v5 != v7)
  {
    id v8 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    -[CAShapeLayer setStrokeColor:](self->_selectionStrokeLayer, "setStrokeColor:", [v8 CGColor]);
  }
}

- (void)setPickerItem:(id)a3
{
  uint64_t v5 = (CNSharingProfilePhotoPickerItem *)a3;
  p_pickerItem = &self->_pickerItem;
  if (self->_pickerItem != v5)
  {
    v19 = v5;
    objc_storeStrong((id *)&self->_pickerItem, a3);
    uint64_t v7 = [(CNSharingProfilePhotoPickerItem *)*p_pickerItem avatarItem];

    imageView = self->_imageView;
    if (v7)
    {
      [(UIImageView *)imageView setContentMode:1];
      objc_super v9 = *p_pickerItem;
      [(CNSharingProfilePhotoPickerItemCell *)self bounds];
      v12 = -[CNSharingProfilePhotoPickerItem compositeImageWithSize:](v9, "compositeImageWithSize:", v10, v11);
      [(CNSharingProfilePhotoPickerItemCell *)self updateWithImage:v12];
    }
    else
    {
      [(UIImageView *)imageView setContentMode:4];
      v12 = [MEMORY[0x1E4FB1618] systemBlueColor];
      if (self->_isSmallScreen) {
        uint64_t v13 = 1;
      }
      else {
        uint64_t v13 = 2;
      }
      v14 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB2928] scale:v13];
      v15 = (void *)MEMORY[0x1E4FB1818];
      v16 = [(CNSharingProfilePhotoPickerItem *)*p_pickerItem symbolImageName];
      v17 = [v15 systemImageNamed:v16 withConfiguration:v14];

      v18 = [v17 imageWithTintColor:v12 renderingMode:1];

      [(UIImageView *)self->_imageView setImage:v18];
    }

    uint64_t v5 = v19;
  }
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)CNSharingProfilePhotoPickerItemCell;
  [(CNSharingProfilePhotoPickerItemCell *)&v13 layoutSubviews];
  [(CNSharingProfilePhotoPickerItemCell *)self bounds];
  CGRect v15 = CGRectInset(v14, 8.0, 8.0);
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);
  [(UIImageView *)self->_imageView bounds];
  double v4 = v3 * 0.5;
  uint64_t v5 = [(CNSharingProfilePhotoPickerItemCell *)self _screen];
  [v5 scale];
  if (v6 == 0.0)
  {
    if (RoundToScale_onceToken != -1) {
      dispatch_once(&RoundToScale_onceToken, &__block_literal_global_33);
    }
    double v6 = *(double *)&RoundToScale___s;
  }
  BOOL v7 = v6 == 1.0;
  double v8 = round(v6 * v4) / v6;
  double v9 = round(v4);
  if (v7) {
    double v10 = v9;
  }
  else {
    double v10 = v8;
  }

  double v11 = [(UIImageView *)self->_imageView layer];
  [v11 setCornerRadius:v10];

  [(CNSharingProfilePhotoPickerItemCell *)self bounds];
  -[CAShapeLayer setFrame:](self->_selectionStrokeLayer, "setFrame:");
  id v12 = [(CNSharingProfilePhotoPickerItemCell *)self selectionBezierPath];
  -[CAShapeLayer setPath:](self->_selectionStrokeLayer, "setPath:", [v12 CGPath]);
}

- (CNSharingProfilePhotoPickerItemCell)initWithFrame:(CGRect)a3
{
  v22.receiver = self;
  v22.super_class = (Class)CNSharingProfilePhotoPickerItemCell;
  double v3 = -[CNSharingProfilePhotoPickerItemCell initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    uint64_t v5 = [(CNSharingProfilePhotoPickerItemCell *)v3 contentView];
    [v5 setClipsToBounds:0];

    [(CNSharingProfilePhotoPickerItemCell *)v4 bounds];
    v4->_originalSize.double width = v6;
    v4->_originalSize.double height = v7;
    id v8 = objc_alloc(MEMORY[0x1E4FB1838]);
    uint64_t v9 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    imageView = v4->_imageView;
    v4->_imageView = (UIImageView *)v9;

    double v11 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
    [(UIImageView *)v4->_imageView setBackgroundColor:v11];

    [(UIImageView *)v4->_imageView setClipsToBounds:1];
    id v12 = [(CNSharingProfilePhotoPickerItemCell *)v4 contentView];
    [v12 addSubview:v4->_imageView];

    uint64_t v13 = [MEMORY[0x1E4F39C88] layer];
    selectionStrokeLayer = v4->_selectionStrokeLayer;
    v4->_selectionStrokeLayer = (CAShapeLayer *)v13;

    [(CNSharingProfilePhotoPickerItemCell *)v4 bounds];
    -[CAShapeLayer setFrame:](v4->_selectionStrokeLayer, "setFrame:");
    id v15 = [(CNSharingProfilePhotoPickerItemCell *)v4 selectionBezierPath];
    -[CAShapeLayer setPath:](v4->_selectionStrokeLayer, "setPath:", [v15 CGPath]);

    id v16 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    -[CAShapeLayer setStrokeColor:](v4->_selectionStrokeLayer, "setStrokeColor:", [v16 CGColor]);

    id v17 = [MEMORY[0x1E4FB1618] clearColor];
    -[CAShapeLayer setFillColor:](v4->_selectionStrokeLayer, "setFillColor:", [v17 CGColor]);

    [(CAShapeLayer *)v4->_selectionStrokeLayer setLineWidth:3.0];
    [(CAShapeLayer *)v4->_selectionStrokeLayer setHidden:1];
    v18 = [(CNSharingProfilePhotoPickerItemCell *)v4 contentView];
    v19 = [v18 layer];
    [v19 addSublayer:v4->_selectionStrokeLayer];

    v20 = v4;
  }

  return v4;
}

+ (id)reuseIdentifier
{
  return @"CNSharingProfilePhotoPickerItemCell";
}

@end