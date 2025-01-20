@interface ASCMaterialBackgroundView
- (ASCMaterialBackgroundView)initWithCoder:(id)a3;
- (ASCMaterialBackgroundView)initWithFrame:(CGRect)a3;
- (UIImageView)imageView;
- (UIVisualEffectView)visualEffectView;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)setImage:(id)a3;
- (void)setImageView:(id)a3;
@end

@implementation ASCMaterialBackgroundView

- (ASCMaterialBackgroundView)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)ASCMaterialBackgroundView;
  v3 = -[ASCMaterialBackgroundView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[ASCMaterialBackgroundView setLayoutMargins:](v3, "setLayoutMargins:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    v5 = [MEMORY[0x1E4FB1618] clearColor];
    [(ASCMaterialBackgroundView *)v4 setBackgroundColor:v5];

    v6 = [MEMORY[0x1E4FB14C8] effectWithStyle:9];
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v6];
    visualEffectView = v4->_visualEffectView;
    v4->_visualEffectView = (UIVisualEffectView *)v7;

    id v9 = objc_alloc(MEMORY[0x1E4FB1838]);
    uint64_t v10 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    imageView = v4->_imageView;
    v4->_imageView = (UIImageView *)v10;

    [(UIImageView *)v4->_imageView setClipsToBounds:1];
    [(UIImageView *)v4->_imageView setContentMode:2];
    [(ASCMaterialBackgroundView *)v4 addSubview:v4->_imageView];
    [(ASCMaterialBackgroundView *)v4 addSubview:v4->_visualEffectView];
  }
  return v4;
}

- (ASCMaterialBackgroundView)initWithCoder:(id)a3
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCMaterialBackgroundView *)self imageView];
  [v5 setImage:v4];
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)ASCMaterialBackgroundView;
  [(ASCMaterialBackgroundView *)&v13 layoutSubviews];
  [(ASCMaterialBackgroundView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(ASCMaterialBackgroundView *)self visualEffectView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  v12 = [(ASCMaterialBackgroundView *)self imageView];
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_visualEffectView, 0);
}

@end