@interface SLSheetURLPreviewView
- (BOOL)generatePreviewImageFromAttachments;
- (SLSheetURLPreviewView)init;
- (SLSheetURLPreviewView)initWithFrame:(CGRect)a3;
- (void)_generateAutomaticPreviewForURL:(id)a3;
- (void)ensurePlaceholderPreviewImage;
- (void)layoutSubviews;
- (void)setImage:(id)a3;
@end

@implementation SLSheetURLPreviewView

- (SLSheetURLPreviewView)init
{
  return -[SLSheetURLPreviewView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (SLSheetURLPreviewView)initWithFrame:(CGRect)a3
{
  double v3 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v20.receiver = self;
  v20.super_class = (Class)SLSheetURLPreviewView;
  v5 = -[SLSheetImagePreviewView initWithFrame:](&v20, sel_initWithFrame_, v3, v4, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    [(SLSheetImagePreviewView *)v5 intrinsicContentSize];
    double v8 = v7;
    double v10 = v9;
    -[SLSheetURLPreviewView setBounds:](v6, "setBounds:", v3, v4, v7, v9);
    v11 = [(SLSheetURLPreviewView *)v6 layer];
    objc_msgSend(v11, "setBounds:", v3, v4, v8, v10);

    v12 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.310000002];
    [(SLSheetURLPreviewView *)v6 setBackgroundColor:v12];

    v13 = [(SLSheetURLPreviewView *)v6 layer];
    [v13 setMasksToBounds:1];

    id v14 = objc_alloc(MEMORY[0x1E4F42AA0]);
    _SLSheetURLPreviewImageFrameWithBounds();
    v15 = objc_msgSend(v14, "initWithFrame:");
    [(SLSheetImagePreviewView *)v6 setImageView:v15];

    v16 = [(SLSheetImagePreviewView *)v6 imageView];
    [v16 setContentMode:2];

    v17 = [(SLSheetImagePreviewView *)v6 imageView];
    [v17 setClipsToBounds:1];

    v18 = [(SLSheetImagePreviewView *)v6 imageView];
    [(SLSheetURLPreviewView *)v6 addSubview:v18];

    [(SLSheetURLPreviewView *)v6 setNeedsLayout];
  }
  return v6;
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)SLSheetURLPreviewView;
  [(SLSheetURLPreviewView *)&v17 layoutSubviews];
  [(SLSheetImagePreviewView *)self intrinsicContentSize];
  -[SLSheetURLPreviewView setBounds:](self, "setBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v3, v4);
  [(SLSheetURLPreviewView *)self bounds];
  _SLSheetURLPreviewImageFrameWithBounds();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [(SLSheetImagePreviewView *)self imageView];
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  id v14 = [(SLSheetImagePreviewView *)self imageView];
  [v14 frame];
  -[UIView setFrame:](self->_placeholderPreviewView, "setFrame:");

  [(UIView *)self->_placeholderPreviewView bounds];
  CGFloat v16 = v15 * 0.222222222;
  [(UIView *)self->_placeholderPreviewView bounds];
  CGRect v19 = CGRectInset(v18, v16, v16);
  -[UIImageView setFrame:](self->_placeholderGlyphView, "setFrame:", v19.origin.x, v19.origin.y, v19.size.width, v19.size.height);
}

- (void)ensurePlaceholderPreviewImage
{
  if (!self->_placeholderPreviewView)
  {
    _SLLog(v2, 7, @"SLSheetURLPreviewView ensurePlaceholderPreviewImage building placeholder");
    id v4 = objc_alloc(MEMORY[0x1E4F42FF0]);
    double v5 = [(SLSheetImagePreviewView *)self imageView];
    [v5 frame];
    double v6 = (UIView *)objc_msgSend(v4, "initWithFrame:");
    placeholderPreviewView = self->_placeholderPreviewView;
    self->_placeholderPreviewView = v6;

    double v8 = [MEMORY[0x1E4F428B8] colorWithWhite:0.87 alpha:1.0];
    [(UIView *)self->_placeholderPreviewView setBackgroundColor:v8];

    [(UIView *)self->_placeholderPreviewView bounds];
    CGFloat v10 = v9 * 0.222222222;
    [(UIView *)self->_placeholderPreviewView bounds];
    CGRect v20 = CGRectInset(v19, v10, v10);
    double v11 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", v20.origin.x, v20.origin.y, v20.size.width, v20.size.height);
    placeholderGlyphView = self->_placeholderGlyphView;
    self->_placeholderGlyphView = v11;

    [(UIImageView *)self->_placeholderGlyphView setContentMode:2];
    [(UIImageView *)self->_placeholderGlyphView setClipsToBounds:1];
    v13 = [MEMORY[0x1E4F428B8] whiteColor];
    [(UIImageView *)self->_placeholderGlyphView setTintColor:v13];

    id v14 = [MEMORY[0x1E4F42A80] socialFrameworkImageNamed:@"URLPlaceholderPreviewGlyph"];
    double v15 = [v14 imageWithRenderingMode:2];
    [(UIImageView *)self->_placeholderGlyphView setImage:v15];

    objc_super v17 = [(UIImageView *)self->_placeholderGlyphView image];
    _SLLog(v2, 7, @"SLSheetURLPreviewView ensurePlaceholderPreviewImage loaded placeholder glyph %@");

    -[UIView addSubview:](self->_placeholderPreviewView, "addSubview:", self->_placeholderGlyphView, v17);
    CGFloat v16 = self->_placeholderPreviewView;
    [(SLSheetURLPreviewView *)self addSubview:v16];
  }
}

- (void)setImage:(id)a3
{
  id v5 = a3;
  if (self->_placeholderPreviewView)
  {
    _SLLog(v3, 7, @"SLSheetURLPreviewView setImage: removing placeholder");
    [(UIView *)self->_placeholderPreviewView removeFromSuperview];
    placeholderPreviewView = self->_placeholderPreviewView;
    self->_placeholderPreviewView = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)SLSheetURLPreviewView;
  [(SLSheetImagePreviewView *)&v7 setImage:v5];
}

- (BOOL)generatePreviewImageFromAttachments
{
  uint64_t v3 = [(SLSheetImagePreviewView *)self principalAttachments];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v4 = [(SLSheetImagePreviewView *)self principalAttachments];
    id v5 = [(id)v4 objectAtIndexedSubscript:0];

    double v6 = [v5 payload];
    objc_opt_class();
    LOBYTE(v4) = objc_opt_isKindOfClass();

    if (v4)
    {
      objc_super v7 = [v5 payload];
      [(SLSheetURLPreviewView *)self _generateAutomaticPreviewForURL:v7];
    }
  }
  return v4 & 1;
}

- (void)_generateAutomaticPreviewForURL:(id)a3
{
  id v5 = a3;
  _SLLog(v3, 7, @"SLSheetURLPreviewView _generateAutomaticPreviewForURL: %@");
  double v6 = -[SLURLPreviewGenerator initWithFrame:]([SLURLPreviewGenerator alloc], "initWithFrame:", 0.0, 0.0, 420.0, 420.0, v5);
  webPreviewGenerator = self->_webPreviewGenerator;
  self->_webPreviewGenerator = v6;

  objc_initWeak(&location, self);
  double v8 = self->_webPreviewGenerator;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__SLSheetURLPreviewView__generateAutomaticPreviewForURL___block_invoke;
  v9[3] = &unk_1E6467D68;
  objc_copyWeak(&v10, &location);
  [(SLURLPreviewGenerator *)v8 loadURL:v5 completion:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __57__SLSheetURLPreviewView__generateAutomaticPreviewForURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__SLSheetURLPreviewView__generateAutomaticPreviewForURL___block_invoke_2;
  v5[3] = &unk_1E6467AE8;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __57__SLSheetURLPreviewView__generateAutomaticPreviewForURL___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = *(void *)(a1 + 32);
  _SLLog(v1, 7, @"SLSheetURLPreviewView _generateAutomaticPreviewForURL: generated web preview %@ into preview view %@");
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      objc_msgSend(WeakRetained, "setImage:", v5, WeakRetained);
      id v3 = WeakRetained;
    }
    id v4 = (void *)v3[55];
    v3[55] = 0;

    id v3 = WeakRetained;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderGlyphView, 0);
  objc_storeStrong((id *)&self->_placeholderPreviewView, 0);
  objc_storeStrong((id *)&self->_webPreviewGenerator, 0);

  objc_storeStrong((id *)&self->_shadowImage, 0);
}

@end