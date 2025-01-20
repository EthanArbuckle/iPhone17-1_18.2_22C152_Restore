@interface LAUIPearlGlyphViewAutoLayoutWrapper
- (LAUIPearlGlyphView)glyphView;
- (LAUIPearlGlyphViewAutoLayoutWrapper)initWithGlyphView:(id)a3;
- (void)layoutSubviews;
@end

@implementation LAUIPearlGlyphViewAutoLayoutWrapper

- (LAUIPearlGlyphViewAutoLayoutWrapper)initWithGlyphView:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LAUIPearlGlyphViewAutoLayoutWrapper;
  v6 = [(LAUIPearlGlyphViewAutoLayoutWrapper *)&v10 init];
  v7 = v6;
  if (v6)
  {
    p_glyphView = &v6->_glyphView;
    objc_storeStrong((id *)&v6->_glyphView, a3);
    if (*p_glyphView) {
      -[LAUIPearlGlyphViewAutoLayoutWrapper addSubview:](v7, "addSubview:");
    }
  }

  return v7;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)LAUIPearlGlyphViewAutoLayoutWrapper;
  [(LAUIPearlGlyphViewAutoLayoutWrapper *)&v3 layoutSubviews];
  if (self->_glyphView)
  {
    [(LAUIPearlGlyphViewAutoLayoutWrapper *)self frame];
    -[LAUIPearlGlyphView setFrame:](self->_glyphView, "setFrame:", 0.0, 0.0);
  }
}

- (LAUIPearlGlyphView)glyphView
{
  return self->_glyphView;
}

- (void).cxx_destruct
{
}

@end