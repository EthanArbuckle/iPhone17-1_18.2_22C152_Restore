@interface DCNotesTextureBackgroundView
+ (id)colorWithPaperTexturePatternImage;
+ (id)textureImage;
- (BOOL)scrollsTexture;
- (DCNotesTextureBackgroundView)initWithCoder:(id)a3;
- (DCNotesTextureBackgroundView)initWithFrame:(CGRect)a3;
- (DCNotesTextureBackgroundView)initWithFrame:(CGRect)a3 scrollingTextures:(BOOL)a4 hasAlpha:(BOOL)a5;
- (DCNotesTextureView)textureView;
- (NSLayoutConstraint)textureHeightConstraint;
- (NSLayoutConstraint)textureYConstraint;
- (double)heightByCoveringHeight:(double)a3 withImage:(id)a4;
- (void)commonInitWithScrollingTextures:(BOOL)a3 hasAlpha:(BOOL)a4;
- (void)setBounds:(CGRect)a3;
- (void)setContentOffset:(CGPoint)a3;
- (void)setFrame:(CGRect)a3;
- (void)setScrollsTexture:(BOOL)a3;
- (void)setTextureHeightConstraint:(id)a3;
- (void)setTextureYConstraint:(id)a3;
@end

@implementation DCNotesTextureBackgroundView

+ (id)textureImage
{
  return (id)[MEMORY[0x263F1C6B0] kitImageNamed:@"UITexturedPaperTile"];
}

+ (id)colorWithPaperTexturePatternImage
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__DCNotesTextureBackgroundView_colorWithPaperTexturePatternImage__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (colorWithPaperTexturePatternImage_predicate != -1) {
    dispatch_once(&colorWithPaperTexturePatternImage_predicate, block);
  }
  v2 = (void *)colorWithPaperTexturePatternImage_patternColor;

  return v2;
}

void __65__DCNotesTextureBackgroundView_colorWithPaperTexturePatternImage__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F1C550];
  id v4 = [*(id *)(a1 + 32) textureImage];
  uint64_t v2 = [v1 colorWithPatternImage:v4];
  v3 = (void *)colorWithPaperTexturePatternImage_patternColor;
  colorWithPaperTexturePatternImage_patternColor = v2;
}

- (double)heightByCoveringHeight:(double)a3 withImage:(id)a4
{
  id v5 = a4;
  [v5 size];
  double v7 = (double)(int)(ceil(a3 / v6) + 1.0);
  [v5 size];
  double v9 = v8;

  return v9 * v7;
}

- (DCNotesTextureBackgroundView)initWithFrame:(CGRect)a3 scrollingTextures:(BOOL)a4 hasAlpha:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)DCNotesTextureBackgroundView;
  double v7 = -[DCNotesTextureBackgroundView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v8 = v7;
  if (v7) {
    [(DCNotesTextureBackgroundView *)v7 commonInitWithScrollingTextures:v6 hasAlpha:v5];
  }
  return v8;
}

- (DCNotesTextureBackgroundView)initWithFrame:(CGRect)a3
{
  return -[DCNotesTextureBackgroundView initWithFrame:scrollingTextures:hasAlpha:](self, "initWithFrame:scrollingTextures:hasAlpha:", 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (DCNotesTextureBackgroundView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DCNotesTextureBackgroundView;
  v3 = [(DCNotesTextureBackgroundView *)&v6 initWithCoder:a3];
  id v4 = v3;
  if (v3) {
    [(DCNotesTextureBackgroundView *)v3 commonInitWithScrollingTextures:0 hasAlpha:1];
  }
  return v4;
}

- (void)commonInitWithScrollingTextures:(BOOL)a3 hasAlpha:(BOOL)a4
{
  BOOL v4 = a4;
  v21[2] = *MEMORY[0x263EF8340];
  double v7 = +[DCNotesTextureBackgroundView textureImage];
  self->_scrollsTexture = a3;
  double v8 = [DCNotesTextureView alloc];
  double v9 = -[DCNotesTextureView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  textureView = self->_textureView;
  self->_textureView = v9;

  [(DCNotesTextureView *)self->_textureView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(DCNotesTextureView *)self->_textureView setImage:v7];
  [(DCNotesTextureBackgroundView *)self insertSubview:self->_textureView atIndex:0];
  if (v4) {
    [(DCNotesTextureBackgroundView *)self setAlpha:0.96];
  }
  v11 = [(DCNotesTextureBackgroundView *)self layer];
  [v11 setAllowsGroupOpacity:0];

  v12 = _NSDictionaryOfVariableBindings(&cfstr_Textureview.isa, self->_textureView, 0);
  v13 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"|[_textureView]|" options:0 metrics:0 views:v12];
  [(DCNotesTextureBackgroundView *)self addConstraints:v13];

  if (self->_scrollsTexture)
  {
    v14 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|-0-[_textureView]" options:0 metrics:0 views:v12];
    v15 = [v14 lastObject];
    [(DCNotesTextureBackgroundView *)self setTextureYConstraint:v15];

    v16 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:[_textureView(0)]" options:0 metrics:0 views:v12];
    v17 = [v16 lastObject];
    [(DCNotesTextureBackgroundView *)self setTextureHeightConstraint:v17];

    v18 = [(DCNotesTextureBackgroundView *)self textureYConstraint];
    v21[0] = v18;
    v19 = [(DCNotesTextureBackgroundView *)self textureHeightConstraint];
    v21[1] = v19;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
    [(DCNotesTextureBackgroundView *)self addConstraints:v20];
  }
  else
  {
    v18 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[_textureView]|" options:0 metrics:0 views:v12];
    [(DCNotesTextureBackgroundView *)self addConstraints:v18];
  }

  [(DCNotesTextureBackgroundView *)self setClipsToBounds:1];
}

- (void)setContentOffset:(CGPoint)a3
{
  double y = a3.y;
  if ([(DCNotesTextureBackgroundView *)self scrollsTexture])
  {
    BOOL v5 = [(DCNotesTextureView *)self->_textureView image];
    [v5 size];
    double v7 = v6;

    if (v7 > 0.0)
    {
      double v9 = [(DCNotesTextureView *)self->_textureView image];
      [v9 size];
      *(float *)&double v10 = v10;
      float v8 = y;
      double v11 = fmodf(v8, *(float *)&v10);

      double v12 = -v11;
      if (y < 0.0)
      {
        v13 = [(DCNotesTextureView *)self->_textureView image];
        [v13 size];
        double v12 = v12 - v14;
      }
      id v15 = [(DCNotesTextureBackgroundView *)self textureYConstraint];
      [v15 setConstant:v12];
    }
  }
}

- (void)setBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)DCNotesTextureBackgroundView;
  -[DCNotesTextureBackgroundView setBounds:](&v13, sel_setBounds_);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  double v8 = CGRectGetHeight(v14);
  double v9 = [(DCNotesTextureView *)self->_textureView image];
  [(DCNotesTextureBackgroundView *)self heightByCoveringHeight:v9 withImage:v8];
  double v11 = v10;

  double v12 = [(DCNotesTextureBackgroundView *)self textureHeightConstraint];
  [v12 setConstant:v11];
}

- (void)setFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)DCNotesTextureBackgroundView;
  -[DCNotesTextureBackgroundView setFrame:](&v13, sel_setFrame_);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  double v8 = CGRectGetHeight(v14);
  double v9 = [(DCNotesTextureView *)self->_textureView image];
  [(DCNotesTextureBackgroundView *)self heightByCoveringHeight:v9 withImage:v8];
  double v11 = v10;

  double v12 = [(DCNotesTextureBackgroundView *)self textureHeightConstraint];
  [v12 setConstant:v11];
}

- (DCNotesTextureView)textureView
{
  return self->_textureView;
}

- (BOOL)scrollsTexture
{
  return self->_scrollsTexture;
}

- (void)setScrollsTexture:(BOOL)a3
{
  self->_scrollsTexture = a3;
}

- (NSLayoutConstraint)textureYConstraint
{
  return self->_textureYConstraint;
}

- (void)setTextureYConstraint:(id)a3
{
}

- (NSLayoutConstraint)textureHeightConstraint
{
  return self->_textureHeightConstraint;
}

- (void)setTextureHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textureHeightConstraint, 0);
  objc_storeStrong((id *)&self->_textureYConstraint, 0);

  objc_storeStrong((id *)&self->_textureView, 0);
}

- (void)setContentOffset:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_217885000, log, OS_LOG_TYPE_ERROR, "Setting content offset of background texture view to NaN", v1, 2u);
}

@end