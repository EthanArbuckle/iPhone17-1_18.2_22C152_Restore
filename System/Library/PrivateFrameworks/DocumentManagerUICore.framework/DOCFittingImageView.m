@interface DOCFittingImageView
- (CGSize)fittingSize;
- (CGSize)intrinsicContentSize;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3;
- (DOCFittingImageView)initWithCoder:(id)a3;
- (DOCFittingImageView)initWithFrame:(CGRect)a3;
- (DOCFittingImageView)initWithImage:(id)a3;
- (DOCFittingImageViewDelegate)delegate;
- (DOCThumbnail)thumbnail;
- (NSLayoutConstraint)aspectRatioConstraint;
- (void)initCommon;
- (void)layoutSubviews;
- (void)setAspectRatioConstraint:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFittingSize:(CGSize)a3;
- (void)setImage:(id)a3;
- (void)setThumbnail:(id)a3;
- (void)thumbnailLoaded:(id)a3;
@end

@implementation DOCFittingImageView

- (void)initCommon
{
  uint64_t v3 = *MEMORY[0x263F15A20];
  v4 = [(DOCFittingImageView *)self layer];
  [v4 setCornerCurve:v3];

  [(DOCFittingImageView *)self setClipsToBounds:1];
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)DOCFittingImageView;
  [(DOCFittingImageView *)&v7 layoutSubviews];
  id v3 = [MEMORY[0x263F1C550] separatorColor];
  uint64_t v4 = [v3 CGColor];
  v5 = [(DOCFittingImageView *)self layer];
  [v5 setBorderColor:v4];

  v6 = [(DOCFittingImageView *)self delegate];
  [v6 fittingImageViewDidLayout:self];
}

- (DOCFittingImageViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DOCFittingImageViewDelegate *)WeakRetained;
}

- (CGSize)intrinsicContentSize
{
  [(DOCFittingImageView *)self fittingSize];
  v10.receiver = self;
  v10.super_class = (Class)DOCFittingImageView;
  [(DOCFittingImageView *)&v10 intrinsicContentSize];
  id v3 = [(DOCFittingImageView *)self traitCollection];
  [v3 displayScale];
  DOCAdaptSizeToRect();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)fittingSize
{
  double width = self->_fittingSize.width;
  double height = self->_fittingSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

void __39__DOCFittingImageView_thumbnailLoaded___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) thumbnail];
  v2 = [*(id *)(a1 + 40) thumbnail];
  id v3 = v2;
  if (v2 == *(void **)(a1 + 32))
  {
    id v4 = [*(id *)(a1 + 40) image];

    double v5 = v6;
    if (v4 == v6) {
      goto LABEL_6;
    }
    [*(id *)(a1 + 40) setImage:v6];
  }
  else
  {
  }
  double v5 = v6;
LABEL_6:
}

- (void)setThumbnail:(id)a3
{
  double v5 = (DOCThumbnail *)a3;
  thumbnail = self->_thumbnail;
  double v9 = v5;
  if (thumbnail != v5)
  {
    [(DOCThumbnail *)thumbnail removeListener:self];
    objc_storeStrong((id *)&self->_thumbnail, a3);
    [(DOCThumbnail *)self->_thumbnail addListener:self];
  }
  double v7 = [(DOCThumbnail *)v9 thumbnail];
  double v8 = [(DOCFittingImageView *)self image];

  if (v8 != v7) {
    [(DOCFittingImageView *)self setImage:v7];
  }
}

- (DOCThumbnail)thumbnail
{
  return self->_thumbnail;
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)DOCFittingImageView;
  [(DOCFittingImageView *)&v26 setImage:v4];
  char v5 = [(DOCFittingImageView *)self translatesAutoresizingMaskIntoConstraints];
  if (v4 && (v5 & 1) == 0)
  {
    [v4 size];
    if (v6 <= 0.0 || ([v4 size], v7 <= 0.0))
    {
      v24 = (NSObject **)MEMORY[0x263F3AC28];
      v25 = *MEMORY[0x263F3AC28];
      if (!*MEMORY[0x263F3AC28])
      {
        DOCInitLogging();
        v25 = *v24;
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[DOCFittingImageView setImage:]((uint64_t)v4, v25);
      }
    }
    else
    {
      double v8 = [(DOCFittingImageView *)self aspectRatioConstraint];
      [v8 multiplier];
      double v10 = v9;

      v11 = [(DOCFittingImageView *)self aspectRatioConstraint];

      [v4 size];
      double v13 = v12;
      [v4 size];
      if (vabdd_f64(v10, v13 / v14) > 0.01 || v11 == 0)
      {
        v16 = [(DOCFittingImageView *)self aspectRatioConstraint];
        [v16 setActive:0];

        v17 = [(DOCFittingImageView *)self widthAnchor];
        v18 = [(DOCFittingImageView *)self heightAnchor];
        [v4 size];
        double v20 = v19;
        [v4 size];
        v22 = [v17 constraintEqualToAnchor:v18 multiplier:v20 / v21];
        [(DOCFittingImageView *)self setAspectRatioConstraint:v22];

        v23 = [(DOCFittingImageView *)self aspectRatioConstraint];
        [v23 setActive:1];
      }
    }
  }
}

- (NSLayoutConstraint)aspectRatioConstraint
{
  return self->_aspectRatioConstraint;
}

- (void)setAspectRatioConstraint:(id)a3
{
}

- (void)setFittingSize:(CGSize)a3
{
  if (self->_fittingSize.width != a3.width || self->_fittingSize.height != a3.height)
  {
    self->_fittingSize = a3;
    [(DOCFittingImageView *)self invalidateIntrinsicContentSize];
  }
}

- (void)thumbnailLoaded:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  DOCRunInMainThread();
}

- (void)setDelegate:(id)a3
{
}

- (DOCFittingImageView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DOCFittingImageView;
  id v3 = -[DOCFittingImageView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3) {
    [(DOCFittingImageView *)v3 initCommon];
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aspectRatioConstraint, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (DOCFittingImageView)initWithImage:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DOCFittingImageView;
  id v3 = [(DOCFittingImageView *)&v6 initWithImage:a3];
  id v4 = v3;
  if (v3) {
    [(DOCFittingImageView *)v3 initCommon];
  }
  return v4;
}

- (DOCFittingImageView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DOCFittingImageView;
  id v3 = [(DOCFittingImageView *)&v6 initWithCoder:a3];
  id v4 = v3;
  if (v3) {
    [(DOCFittingImageView *)v3 initCommon];
  }
  return v4;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  v11.receiver = self;
  v11.super_class = (Class)DOCFittingImageView;
  [(DOCFittingImageView *)&v11 intrinsicContentSize];
  id v4 = [(DOCFittingImageView *)self traitCollection];
  [v4 displayScale];
  DOCAdaptSizeToRect();
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)setImage:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_222E2D000, a2, OS_LOG_TYPE_ERROR, "Attempting to assign image with zero width or height: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end