@interface DBCursiveTextView
- (CAShapeLayer)textLayer;
- (DBCursiveTextPath)textPath;
- (DBCursiveTextView)initWithTextURL:(id)a3 pointSize:(double)a4;
- (double)duration;
- (double)pointSize;
- (void)layoutSubviews;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAccessibilityLanguage:(id)a3;
- (void)setFillColor:(id)a3;
- (void)setTime:(float)a3;
@end

@implementation DBCursiveTextView

- (DBCursiveTextView)initWithTextURL:(id)a3 pointSize:(double)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DBCursiveTextView;
  v7 = -[DBCursiveTextView initWithFrame:](&v15, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v7)
  {
    v8 = [[DBCursiveTextPath alloc] initWithURL:v6];
    textPath = v7->_textPath;
    v7->_textPath = v8;

    v7->_pointSize = a4;
    v10 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x263F15880]);
    textLayer = v7->_textLayer;
    v7->_textLayer = v10;

    [(CAShapeLayer *)v7->_textLayer setShadowRadius:1.0];
    LODWORD(v12) = 1036831949;
    [(CAShapeLayer *)v7->_textLayer setShadowOpacity:v12];
    -[CAShapeLayer setShadowOffset:](v7->_textLayer, "setShadowOffset:", 0.0, 1.0);
    v13 = [(DBCursiveTextView *)v7 layer];
    [v13 addSublayer:v7->_textLayer];
  }
  return v7;
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)DBCursiveTextView;
  [(DBCursiveTextView *)&v19 layoutSubviews];
  v3 = [(DBCursiveTextView *)self textLayer];
  [(DBCursiveTextView *)self bounds];
  objc_msgSend(v3, "setFrame:");

  v4 = [(DBCursiveTextView *)self textPath];

  if (v4)
  {
    v5 = [(DBCursiveTextView *)self textLayer];
    [v5 bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    v14 = [(DBCursiveTextView *)self textPath];
    [(DBCursiveTextView *)self pointSize];
    if (v14)
    {
      objc_msgSend(v14, "transformForRect:pointSize:flipped:", 1, v7, v9, v11, v13, v15);
    }
    else
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v16 = 0u;
    }
    *(_OWORD *)&self->_textTransform.a = v16;
    *(_OWORD *)&self->_textTransform.c = v17;
    *(_OWORD *)&self->_textTransform.tx = v18;
  }
}

- (double)duration
{
  v2 = [(DBCursiveTextView *)self textPath];
  [v2 duration];
  double v4 = v3;

  return v4;
}

- (void)setTime:(float)a3
{
  v5 = [(DBCursiveTextView *)self textPath];
  uint64_t v6 = [v5 pathForTime:a3];

  uint64_t v7 = MEMORY[0x230F8C420](v6, &self->_textTransform);
  if (v7)
  {
    double v8 = (const CGPath *)v7;
    double v9 = [(DBCursiveTextView *)self textLayer];
    [v9 setPath:v8];

    double v10 = [(DBCursiveTextView *)self textLayer];
    [v10 setShadowPath:v8];

    CGPathRelease(v8);
  }
}

- (void)setFillColor:(id)a3
{
  id v4 = a3;
  id v7 = [(DBCursiveTextView *)self textLayer];
  id v5 = v4;
  uint64_t v6 = [v5 CGColor];

  [v7 setFillColor:v6];
}

- (void)setAccessibilityLabel:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DBCursiveTextView;
  id v4 = a3;
  [(DBCursiveTextView *)&v6 setAccessibilityLabel:v4];
  id v5 = [(DBCursiveTextView *)self textLayer];
  [v5 setAccessibilityLabel:v4];
}

- (void)setAccessibilityLanguage:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DBCursiveTextView;
  id v4 = a3;
  [(DBCursiveTextView *)&v6 setAccessibilityLanguage:v4];
  id v5 = [(DBCursiveTextView *)self textLayer];
  [v5 setAccessibilityLanguage:v4];
}

- (DBCursiveTextPath)textPath
{
  return self->_textPath;
}

- (double)pointSize
{
  return self->_pointSize;
}

- (CAShapeLayer)textLayer
{
  return self->_textLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLayer, 0);
  objc_storeStrong((id *)&self->_textPath, 0);
}

@end