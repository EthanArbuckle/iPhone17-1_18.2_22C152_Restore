@interface _MKRightImageButton
- (BOOL)isHighlighted;
- (CGSize)intrinsicContentSize;
- (NSString)title;
- (UIImage)image;
- (UIImageView)imageView;
- (_MKRightImageButton)initWithFrame:(CGRect)a3;
- (_MKUILabel)titleLabel;
- (id)viewForLastBaselineLayout;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setTarget:(id)a3 action:(SEL)a4;
- (void)setTitle:(id)a3;
- (void)updateConstraints;
@end

@implementation _MKRightImageButton

- (_MKRightImageButton)initWithFrame:(CGRect)a3
{
  v29[1] = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)_MKRightImageButton;
  v3 = -[_MKRightImageButton initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(_MKUILabel);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    [(_MKUILabel *)v3->_titleLabel setAdjustsFontSizeToFitWidth:1];
    [(_MKUILabel *)v3->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_MKRightImageButton *)v3 addSubview:v3->_titleLabel];
    id v6 = objc_alloc(MEMORY[0x1E4F42AA0]);
    uint64_t v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v7;

    [(UIImageView *)v3->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v3->_imageView setHidden:1];
    [(UIImageView *)v3->_imageView setContentMode:1];
    v9 = [(UIImageView *)v3->_imageView leadingAnchor];
    v10 = [(_MKUILabel *)v3->_titleLabel trailingAnchor];
    v11 = [v9 constraintEqualToAnchor:v10 constant:4.0];

    LODWORD(v12) = 1148829696;
    [v11 setPriority:v12];
    v13 = [(_MKUILabel *)v3->_titleLabel trailingAnchor];
    v14 = [(_MKRightImageButton *)v3 trailingAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v29[0] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
    titleOnlyConstraints = v3->_titleOnlyConstraints;
    v3->_titleOnlyConstraints = (NSArray *)v16;

    v28[0] = v11;
    v18 = [(UIImageView *)v3->_imageView centerYAnchor];
    v19 = [(_MKUILabel *)v3->_titleLabel centerYAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    v28[1] = v20;
    v21 = [(UIImageView *)v3->_imageView trailingAnchor];
    v22 = [(_MKRightImageButton *)v3 trailingAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    v28[2] = v23;
    uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
    titleAndImageConstraints = v3->_titleAndImageConstraints;
    v3->_titleAndImageConstraints = (NSArray *)v24;

    [(_MKUILabel *)v3->_titleLabel set_mapkit_themeColorProvider:&__block_literal_global_55];
    [(UIView *)v3 _mapkit_setNeedsUpdateConstraints];
  }
  return v3;
}

- (void)setTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  gestureRecognizer = self->_gestureRecognizer;
  if (v6 && a4)
  {
    id v12 = v6;
    if (!gestureRecognizer)
    {
      v9 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x1E4F42EC8]);
      v10 = self->_gestureRecognizer;
      self->_gestureRecognizer = v9;

      [(_MKRightImageButton *)self addGestureRecognizer:self->_gestureRecognizer];
      uint64_t v7 = v12;
      gestureRecognizer = self->_gestureRecognizer;
    }
    [(UITapGestureRecognizer *)gestureRecognizer addTarget:v7 action:a4];
  }
  else
  {
    if (!gestureRecognizer) {
      goto LABEL_9;
    }
    id v12 = v6;
    -[_MKRightImageButton removeGestureRecognizer:](self, "removeGestureRecognizer:");
    v11 = self->_gestureRecognizer;
    self->_gestureRecognizer = 0;
  }
  uint64_t v7 = v12;
LABEL_9:
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    titleLabel = self->_titleLabel;
    if (a3) {
      v4 = &__block_literal_global_5;
    }
    else {
      v4 = &__block_literal_global_7_2;
    }
    [(_MKUILabel *)titleLabel set_mapkit_themeColorProvider:v4];
  }
}

- (void)updateConstraints
{
  v15[2] = *MEMORY[0x1E4F143B8];
  if (!self->_titleConstraintsAdded)
  {
    self->_titleConstraintsAdded = 1;
    v3 = (void *)MEMORY[0x1E4F28DC8];
    v4 = [(_MKUILabel *)self->_titleLabel leadingAnchor];
    v5 = [(_MKRightImageButton *)self leadingAnchor];
    id v6 = [v4 constraintEqualToAnchor:v5];
    v15[0] = v6;
    uint64_t v7 = [(_MKUILabel *)self->_titleLabel centerYAnchor];
    v8 = [(_MKRightImageButton *)self centerYAnchor];
    v9 = [v7 constraintEqualToAnchor:v8];
    v15[1] = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    [v3 activateConstraints:v10];
  }
  int v11 = [(UIImageView *)self->_imageView isHidden];
  if (v11) {
    uint64_t v12 = 3;
  }
  else {
    uint64_t v12 = 2;
  }
  if (v11) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = 3;
  }
  [MEMORY[0x1E4F28DC8] deactivateConstraints:*(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____MKRightImageButton__titleLabel[v12])];
  [MEMORY[0x1E4F28DC8] activateConstraints:*(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____MKRightImageButton__titleLabel[v13])];
  v14.receiver = self;
  v14.super_class = (Class)_MKRightImageButton;
  [(_MKRightImageButton *)&v14 updateConstraints];
}

- (NSString)title
{
  return (NSString *)[(_MKUILabel *)self->_titleLabel text];
}

- (void)setTitle:(id)a3
{
  [(_MKUILabel *)self->_titleLabel setText:a3];

  [(UIView *)self _mapkit_setNeedsUpdateConstraints];
}

- (UIImage)image
{
  return [(UIImageView *)self->_imageView image];
}

- (void)setImage:(id)a3
{
  -[UIImageView setImage:](self->_imageView, "setImage:");
  [(UIImageView *)self->_imageView setHidden:a3 == 0];
  [(_MKUILabel *)self->_titleLabel setText:0];
  if ([(UIImageView *)self->_imageView isHidden]) {
    [(UIImageView *)self->_imageView removeFromSuperview];
  }
  else {
    [(_MKRightImageButton *)self addSubview:self->_imageView];
  }

  [(UIView *)self _mapkit_setNeedsUpdateConstraints];
}

- (id)viewForLastBaselineLayout
{
  return self->_titleLabel;
}

- (CGSize)intrinsicContentSize
{
  titleLabel = self->_titleLabel;
  imageView = self->_imageView;
  if (titleLabel)
  {
    if (imageView)
    {
      [(_MKUILabel *)titleLabel intrinsicContentSize];
      double v6 = v5;
      double v8 = v7;
      [(UIImageView *)self->_imageView intrinsicContentSize];
      if (v6 > v9) {
        double v9 = v6;
      }
      if (v8 > v10) {
        double v10 = v8;
      }
      goto LABEL_12;
    }
    imageView = (UIImageView *)titleLabel;
  }

  [(UIImageView *)imageView intrinsicContentSize];
LABEL_12:
  result.height = v10;
  result.width = v9;
  return result;
}

- (_MKUILabel)titleLabel
{
  return self->_titleLabel;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_titleAndImageConstraints, 0);
  objc_storeStrong((id *)&self->_titleOnlyConstraints, 0);

  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
}

@end