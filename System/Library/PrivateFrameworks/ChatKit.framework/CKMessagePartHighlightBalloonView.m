@interface CKMessagePartHighlightBalloonView
- (CKMessagePartHighlightBalloonView)initWithFrame:(CGRect)a3;
- (UIColor)balloonColor;
- (UIImage)glyphImage;
- (UIImageView)imageView;
- (UIView)colorView;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBalloonColor:(id)a3;
- (void)setGlyphImage:(id)a3;
- (void)setGlyphImageColor:(id)a3;
@end

@implementation CKMessagePartHighlightBalloonView

- (void)prepareForReuse
{
  v2.receiver = self;
  v2.super_class = (Class)CKMessagePartHighlightBalloonView;
  [(CKBalloonView *)&v2 prepareForReuse];
}

- (CKMessagePartHighlightBalloonView)initWithFrame:(CGRect)a3
{
  v22.receiver = self;
  v22.super_class = (Class)CKMessagePartHighlightBalloonView;
  v3 = -[CKBalloonView initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[CKUIBehavior sharedBehaviors];
    v5 = [v4 theme];
    v6 = [v5 transcriptBackgroundColor];
    [(CKMessagePartHighlightBalloonView *)v3 setBackgroundColor:v6];

    id v7 = objc_alloc(MEMORY[0x1E4F42FF0]);
    double v8 = *MEMORY[0x1E4F1DB28];
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v12 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], v9, v10, v11);
    colorView = v3->_colorView;
    v3->_colorView = (UIView *)v12;

    [(CKMessagePartHighlightBalloonView *)v3 addSubview:v3->_colorView];
    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", v8, v9, v10, v11);
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v14;

    v16 = [MEMORY[0x1E4F428B8] clearColor];
    [(UIImageView *)v3->_imageView setBackgroundColor:v16];

    [(CKMessagePartHighlightBalloonView *)v3 addSubview:v3->_imageView];
    v17 = +[CKUIBehavior sharedBehaviors];
    v18 = [v17 messageHighlightGoldColor];
    [(CKMessagePartHighlightBalloonView *)v3 setBalloonColor:v18];

    v19 = +[CKUIBehavior sharedBehaviors];
    v20 = [v19 messageHighlightImage];
    [(CKMessagePartHighlightBalloonView *)v3 setGlyphImage:v20];
  }
  return v3;
}

- (void)layoutSubviews
{
  v31.receiver = self;
  v31.super_class = (Class)CKMessagePartHighlightBalloonView;
  [(CKBalloonView *)&v31 layoutSubviews];
  [(CKMessagePartHighlightBalloonView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v11 = v9 * 0.5;
  uint64_t v12 = [(CKMessagePartHighlightBalloonView *)self layer];
  [v12 setCornerRadius:v11];

  v13 = +[CKUIBehavior sharedBehaviors];
  [v13 messageHighlightTranscriptBalloonBorderWidth];
  CGFloat v15 = v14;

  v32.origin.x = v4;
  v32.origin.y = v6;
  v32.size.width = v8;
  v32.size.height = v10;
  CGRect v33 = CGRectInset(v32, v15, v15);
  -[UIView setFrame:](self->_colorView, "setFrame:", v33.origin.x, v33.origin.y, v33.size.width, v33.size.height);
  [(UIView *)self->_colorView frame];
  double v17 = v16 * 0.5;
  v18 = [(UIView *)self->_colorView layer];
  [v18 setCornerRadius:v17];

  v19 = +[CKUIBehavior sharedBehaviors];
  [v19 messageHighlightGlyphSymbolPointSize];
  double v21 = v20;

  v34.origin.x = v4;
  v34.origin.y = v6;
  v34.size.width = v8;
  v34.size.height = v10;
  double MidX = CGRectGetMidX(v34);
  v35.origin.x = v4;
  v35.origin.y = v6;
  v35.size.width = v8;
  v35.size.height = v10;
  double MidY = CGRectGetMidY(v35);
  v36.origin.x = 0.0;
  v36.origin.y = 0.0;
  v36.size.width = v21;
  v36.size.height = v21;
  double v24 = MidX - CGRectGetWidth(v36) * 0.5;
  v37.origin.x = 0.0;
  v37.origin.y = 0.0;
  v37.size.width = v21;
  v37.size.height = v21;
  double v25 = MidY - CGRectGetHeight(v37) * 0.5;
  v26 = [(CKMessagePartHighlightBalloonView *)self traitCollection];
  [v26 displayScale];
  double v28 = round(v24 * v27) / v27;
  double v29 = round(v25 * v27) / v27;
  double v30 = round(v21 * v27) / v27;

  -[UIImageView setFrame:](self->_imageView, "setFrame:", v28, v29, v30, v30);
}

- (UIColor)balloonColor
{
  return [(UIView *)self->_colorView backgroundColor];
}

- (void)setBalloonColor:(id)a3
{
}

- (UIImage)glyphImage
{
  return [(UIImageView *)self->_imageView image];
}

- (void)setGlyphImage:(id)a3
{
}

- (void)setGlyphImageColor:(id)a3
{
  id v4 = a3;
  id v6 = [(CKMessagePartHighlightBalloonView *)self glyphImage];
  double v5 = [v6 ckImageWithTintColor:v4];

  [(CKMessagePartHighlightBalloonView *)self setGlyphImage:v5];
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UIView)colorView
{
  return self->_colorView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorView, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end