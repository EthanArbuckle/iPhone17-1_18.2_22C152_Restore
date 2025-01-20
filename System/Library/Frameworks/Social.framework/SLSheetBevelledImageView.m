@interface SLSheetBevelledImageView
- (BOOL)generatePreviewImageFromAttachments;
- (BOOL)needsURLPlaceholderImage;
- (CGSize)intrinsicContentSize;
- (SLSheetBevelledImageView)init;
- (void)ensurePlaceholderPreviewImage;
- (void)layoutSubviews;
- (void)setImage:(id)a3;
- (void)setNeedsURLPlaceholderImage:(BOOL)a3;
@end

@implementation SLSheetBevelledImageView

- (SLSheetBevelledImageView)init
{
  v21.receiver = self;
  v21.super_class = (Class)SLSheetBevelledImageView;
  v2 = -[SLSheetImagePreviewView initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v3 = v2;
  if (v2)
  {
    double v4 = *MEMORY[0x1E4F1DAD8];
    double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [(SLSheetBevelledImageView *)v2 intrinsicContentSize];
    -[SLSheetBevelledImageView setBounds:](v3, "setBounds:", v4, v5, v6, v7);
    v8 = [(SLSheetBevelledImageView *)v3 layer];
    [v8 setShouldRasterize:1];

    v9 = [(SLSheetBevelledImageView *)v3 layer];
    v10 = [MEMORY[0x1E4F42D90] mainScreen];
    [v10 scale];
    objc_msgSend(v9, "setRasterizationScale:");

    v11 = [MEMORY[0x1E4F428B8] clearColor];
    [(SLSheetBevelledImageView *)v3 setBackgroundColor:v11];

    id v12 = objc_alloc(MEMORY[0x1E4F42AA0]);
    [(SLSheetBevelledImageView *)v3 bounds];
    v13 = objc_msgSend(v12, "initWithFrame:");
    [(SLSheetImagePreviewView *)v3 setImageView:v13];

    v14 = [(SLSheetImagePreviewView *)v3 imageView];
    [v14 setContentMode:2];

    v15 = [(SLSheetImagePreviewView *)v3 imageView];
    [v15 setClipsToBounds:1];

    v16 = [MEMORY[0x1E4F428B8] clearColor];
    v17 = [(SLSheetImagePreviewView *)v3 imageView];
    [v17 setBackgroundColor:v16];

    v18 = [(SLSheetImagePreviewView *)v3 imageView];
    [v18 setAutoresizingMask:18];

    v19 = [(SLSheetImagePreviewView *)v3 imageView];
    [(SLSheetBevelledImageView *)v3 addSubview:v19];

    [(SLSheetBevelledImageView *)v3 setNeedsLayout];
  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  v16.receiver = self;
  v16.super_class = (Class)SLSheetBevelledImageView;
  [(SLSheetImagePreviewView *)&v16 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(SLSheetImagePreviewView *)self image];

  if (v7)
  {
    v8 = [(SLSheetImagePreviewView *)self image];
    [v8 size];
    double v10 = v9;
    v11 = [(SLSheetImagePreviewView *)self image];
    [v11 size];
    double v13 = v10 / v12;

    if (v13 < 0.8) {
      double v4 = v6 * v13;
    }
  }
  double v14 = v4;
  double v15 = v6;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)ensurePlaceholderPreviewImage
{
  if ([(SLSheetBevelledImageView *)self needsURLPlaceholderImage]
    && !self->_placeholderPreviewView)
  {
    _SLLog(v2, 7, @"SLSheetBevelledImageView ensurePlaceholderPreviewImage building placeholder");
    id v4 = objc_alloc(MEMORY[0x1E4F42FF0]);
    double v5 = [(SLSheetImagePreviewView *)self imageView];
    [v5 frame];
    double v6 = (UIView *)objc_msgSend(v4, "initWithFrame:");
    placeholderPreviewView = self->_placeholderPreviewView;
    self->_placeholderPreviewView = v6;

    v8 = [MEMORY[0x1E4F428B8] colorWithWhite:0.87 alpha:1.0];
    [(UIView *)self->_placeholderPreviewView setBackgroundColor:v8];

    [(UIView *)self->_placeholderPreviewView setAutoresizingMask:18];
    [(UIView *)self->_placeholderPreviewView bounds];
    CGFloat v10 = v9 * 0.222222222;
    [(UIView *)self->_placeholderPreviewView bounds];
    CGRect v20 = CGRectInset(v19, v10, v10);
    v11 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", v20.origin.x, v20.origin.y, v20.size.width, v20.size.height);
    placeholderGlyphView = self->_placeholderGlyphView;
    self->_placeholderGlyphView = v11;

    [(UIImageView *)self->_placeholderGlyphView setContentMode:2];
    [(UIImageView *)self->_placeholderGlyphView setClipsToBounds:1];
    double v13 = [MEMORY[0x1E4F428B8] whiteColor];
    [(UIImageView *)self->_placeholderGlyphView setTintColor:v13];

    double v14 = [MEMORY[0x1E4F42A80] socialFrameworkImageNamed:@"URLPlaceholderPreviewGlyph"];
    double v15 = [v14 imageWithRenderingMode:2];
    [(UIImageView *)self->_placeholderGlyphView setImage:v15];

    v17 = [(UIImageView *)self->_placeholderGlyphView image];
    _SLLog(v2, 7, @"SLSheetBevelledImageView ensurePlaceholderPreviewImage loaded placeholder glyph %@");

    -[UIView addSubview:](self->_placeholderPreviewView, "addSubview:", self->_placeholderGlyphView, v17);
    objc_super v16 = self->_placeholderPreviewView;
    [(SLSheetBevelledImageView *)self addSubview:v16];
  }
}

- (void)setImage:(id)a3
{
  id v5 = a3;
  if (self->_placeholderPreviewView)
  {
    _SLLog(v3, 7, @"SLSheetBevelledImageView setImage: removing placeholder");
    [(UIView *)self->_placeholderPreviewView removeFromSuperview];
    placeholderPreviewView = self->_placeholderPreviewView;
    self->_placeholderPreviewView = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)SLSheetBevelledImageView;
  [(SLSheetImagePreviewView *)&v7 setImage:v5];
  [(SLSheetBevelledImageView *)self invalidateIntrinsicContentSize];
}

- (BOOL)generatePreviewImageFromAttachments
{
  if ([(SLSheetBevelledImageView *)self needsURLPlaceholderImage]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)SLSheetBevelledImageView;
  return [(SLSheetImagePreviewView *)&v4 generatePreviewImageFromAttachments];
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)SLSheetBevelledImageView;
  [(SLSheetBevelledImageView *)&v6 layoutSubviews];
  placeholderPreviewView = self->_placeholderPreviewView;
  if (placeholderPreviewView)
  {
    [(UIView *)placeholderPreviewView bounds];
    CGFloat v5 = v4 * 0.222222222;
    [(UIView *)self->_placeholderPreviewView bounds];
    CGRect v8 = CGRectInset(v7, v5, v5);
    -[UIImageView setFrame:](self->_placeholderGlyphView, "setFrame:", v8.origin.x, v8.origin.y, v8.size.width, v8.size.height);
  }
}

- (BOOL)needsURLPlaceholderImage
{
  return self->_needsURLPlaceholderImage;
}

- (void)setNeedsURLPlaceholderImage:(BOOL)a3
{
  self->_needsURLPlaceholderImage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderGlyphView, 0);

  objc_storeStrong((id *)&self->_placeholderPreviewView, 0);
}

@end