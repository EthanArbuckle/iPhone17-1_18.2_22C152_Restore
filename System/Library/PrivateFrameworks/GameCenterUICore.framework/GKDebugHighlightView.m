@interface GKDebugHighlightView
- (BOOL)isOval;
- (GKDebugHighlightView)init;
- (NSString)caption;
- (UIColor)color;
- (void)drawRect:(CGRect)a3;
- (void)setCaption:(id)a3;
- (void)setColor:(id)a3;
- (void)setIsOval:(BOOL)a3;
@end

@implementation GKDebugHighlightView

- (GKDebugHighlightView)init
{
  v5.receiver = self;
  v5.super_class = (Class)GKDebugHighlightView;
  v2 = [(GKDebugHighlightView *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F1C550] clearColor];
    [(GKDebugHighlightView *)v2 setBackgroundColor:v3];

    [(GKDebugHighlightView *)v2 setAutoresizingMask:0];
    [(GKDebugHighlightView *)v2 setOpaque:0];
  }
  return v2;
}

- (void)drawRect:(CGRect)a3
{
  [(GKDebugHighlightView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v17 = [(GKDebugHighlightView *)self color];
  v12 = [v17 colorWithAlphaComponent:0.75];
  v13 = [v17 colorWithAlphaComponent:0.25];
  [v12 setStroke];
  [v13 setFill];
  CurrentContext = UIGraphicsGetCurrentContext();
  if ([(GKDebugHighlightView *)self isOval])
  {
    v19.origin.x = v5;
    v19.origin.y = v7;
    v19.size.width = v9;
    v19.size.height = v11;
    CGContextStrokeEllipseInRect(CurrentContext, v19);
    v20.origin.x = v5;
    v20.origin.y = v7;
    v20.size.width = v9;
    v20.size.height = v11;
    CGContextFillEllipseInRect(CurrentContext, v20);
  }
  else
  {
    v21.origin.x = v5;
    v21.origin.y = v7;
    v21.size.width = v9;
    v21.size.height = v11;
    CGContextStrokeRect(CurrentContext, v21);
    v22.origin.x = v5;
    v22.origin.y = v7;
    v22.size.width = v9;
    v22.size.height = v11;
    CGContextFillRect(CurrentContext, v22);
  }
  [v17 set];
  v15 = [(GKDebugHighlightView *)self caption];
  v16 = [MEMORY[0x263F1C658] systemFontOfSize:9.0];
  objc_msgSend(v15, "_legacy_drawInRect:withFont:", v16, v5, v7, v9, v11);
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (NSString)caption
{
  return self->_caption;
}

- (void)setCaption:(id)a3
{
}

- (BOOL)isOval
{
  return self->_isOval;
}

- (void)setIsOval:(BOOL)a3
{
  self->_isOval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_caption, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end