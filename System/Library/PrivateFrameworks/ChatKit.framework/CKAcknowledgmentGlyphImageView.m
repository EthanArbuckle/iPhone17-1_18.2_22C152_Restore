@interface CKAcknowledgmentGlyphImageView
- (CKAcknowledgmentGlyphImageView)initWithImage:(id)a3;
- (UIImage)image;
- (void)setImage:(id)a3;
- (void)sizeToFit;
@end

@implementation CKAcknowledgmentGlyphImageView

- (CKAcknowledgmentGlyphImageView)initWithImage:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKAcknowledgmentGlyphImageView;
  v5 = -[CKAcknowledgmentGlyphImageView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v6 = v5;
  if (v5) {
    [(CKAcknowledgmentGlyphImageView *)v5 setImage:v4];
  }

  return v6;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
  id v5 = a3;
  uint64_t v6 = [v5 CGImage];

  id v7 = [(CKAcknowledgmentGlyphImageView *)self layer];
  [v7 setContents:v6];
}

- (void)sizeToFit
{
  v3 = [(CKAcknowledgmentGlyphImageView *)self image];

  if (v3)
  {
    [(CKAcknowledgmentGlyphImageView *)self bounds];
    double v5 = v4;
    double v7 = v6;
    objc_super v8 = [(CKAcknowledgmentGlyphImageView *)self image];
    [v8 size];
    double v10 = v9;
    double v12 = v11;

    -[CKAcknowledgmentGlyphImageView setBounds:](self, "setBounds:", v5, v7, v10, v12);
  }
}

- (UIImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
}

@end