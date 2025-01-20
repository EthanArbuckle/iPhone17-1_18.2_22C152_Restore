@interface _PKCheckerGridView
- (UIColor)colorA;
- (UIColor)colorB;
- (UIImageView)imageView;
- (_PKCheckerGridView)initWithFrame:(CGRect)a3;
- (_PKCheckerGridView)initWithTileSize:(double)a3 colorA:(id)a4 colorB:(id)a5;
- (double)tileSize;
- (id)_createGridTileImage;
- (void)_updateUI;
- (void)layoutSubviews;
- (void)setColorA:(id)a3;
- (void)setColorB:(id)a3;
- (void)setImageView:(id)a3;
- (void)setTileSize:(double)a3;
@end

@implementation _PKCheckerGridView

- (_PKCheckerGridView)initWithFrame:(CGRect)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4FB1618], "blackColor", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = [MEMORY[0x1E4FB1618] whiteColor];
  v6 = [(_PKCheckerGridView *)self initWithTileSize:v4 colorA:v5 colorB:5.0];

  return v6;
}

- (_PKCheckerGridView)initWithTileSize:(double)a3 colorA:(id)a4 colorB:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_PKCheckerGridView;
  v11 = -[_PKCheckerGridView initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v12 = v11;
  if (v11)
  {
    v11->_tileSize = a3;
    objc_storeStrong((id *)&v11->_colorA, a4);
    objc_storeStrong((id *)&v12->_colorB, a5);
    v13 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    imageView = v12->_imageView;
    v12->_imageView = v13;

    [(UIImageView *)v12->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v15 = [(_PKCheckerGridView *)v12 imageView];
    [(_PKCheckerGridView *)v12 addSubview:v15];

    [(_PKCheckerGridView *)v12 _updateUI];
  }

  return v12;
}

- (void)setTileSize:(double)a3
{
  self->_tileSize = a3;
  [(_PKCheckerGridView *)self _updateUI];

  [(_PKCheckerGridView *)self setNeedsLayout];
}

- (void)setColorA:(id)a3
{
  objc_storeStrong((id *)&self->_colorA, a3);
  [(_PKCheckerGridView *)self _updateUI];

  [(_PKCheckerGridView *)self setNeedsLayout];
}

- (void)setColorB:(id)a3
{
  objc_storeStrong((id *)&self->_colorB, a3);
  [(_PKCheckerGridView *)self _updateUI];

  [(_PKCheckerGridView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)_PKCheckerGridView;
  [(_PKCheckerGridView *)&v12 layoutSubviews];
  [(_PKCheckerGridView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(_PKCheckerGridView *)self imageView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (void)_updateUI
{
  id v4 = [(_PKCheckerGridView *)self _createGridTileImage];
  double v3 = [(_PKCheckerGridView *)self imageView];
  [v3 setImage:v4];
}

- (id)_createGridTileImage
{
  [(_PKCheckerGridView *)self tileSize];
  UIRoundToViewScale();
  double v4 = v3;
  double v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", v4 + v4, v4 + v4);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42___PKCheckerGridView__createGridTileImage__block_invoke;
  v9[3] = &unk_1E64C6AF0;
  v9[4] = self;
  *(double *)&v9[5] = v4;
  double v6 = [v5 imageWithActions:v9];
  double v7 = objc_msgSend(v6, "resizableImageWithCapInsets:resizingMode:", 0, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));

  return v7;
}

- (double)tileSize
{
  return self->_tileSize;
}

- (UIColor)colorA
{
  return self->_colorA;
}

- (UIColor)colorB
{
  return self->_colorB;
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
  objc_storeStrong((id *)&self->_colorB, 0);

  objc_storeStrong((id *)&self->_colorA, 0);
}

@end