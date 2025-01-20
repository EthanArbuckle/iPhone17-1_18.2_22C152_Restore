@interface CNFRegShadowView
- (CGRect)cachedBounds;
- (CNFRegShadowView)initWithFrame:(CGRect)a3 shadowImage:(id)a4;
- (UIBezierPath)cachedPath;
- (UIImage)shadowImage;
- (void)drawRect:(CGRect)a3;
- (void)setCachedBounds:(CGRect)a3;
- (void)setCachedPath:(id)a3;
- (void)setShadowImage:(id)a3;
@end

@implementation CNFRegShadowView

- (CNFRegShadowView)initWithFrame:(CGRect)a3 shadowImage:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNFRegShadowView;
  v10 = -[CNFRegShadowView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    [(CNFRegShadowView *)v10 setShadowImage:v9];
    [(CNFRegShadowView *)v11 setOpaque:0];
  }

  return v11;
}

- (void)drawRect:(CGRect)a3
{
  [(CNFRegShadowView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(CNFRegShadowView *)self cachedBounds];
  v22.origin.double x = v12;
  v22.origin.double y = v13;
  v22.size.double width = v14;
  v22.size.double height = v15;
  v21.origin.double x = v5;
  v21.origin.double y = v7;
  v21.size.double width = v9;
  v21.size.double height = v11;
  if (!CGRectEqualToRect(v21, v22)) {
    [(CNFRegShadowView *)self setCachedPath:0];
  }
  v16 = [(CNFRegShadowView *)self cachedPath];

  if (!v16)
  {
    -[CNFRegShadowView setCachedBounds:](self, "setCachedBounds:", v5, v7, v9, v11);
    v17 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", 3, v5, v7, v9, v11, 10.0, 10.0);
    [(CNFRegShadowView *)self setCachedPath:v17];
  }
  v18 = [(CNFRegShadowView *)self cachedPath];
  [v18 addClip];

  id v19 = [(CNFRegShadowView *)self shadowImage];
  [(CNFRegShadowView *)self bounds];
  objc_msgSend(v19, "drawInRect:");
}

- (CGRect)cachedBounds
{
  double x = self->_cachedBounds.origin.x;
  double y = self->_cachedBounds.origin.y;
  double width = self->_cachedBounds.size.width;
  double height = self->_cachedBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCachedBounds:(CGRect)a3
{
  self->_cachedBounds = a3;
}

- (UIImage)shadowImage
{
  return self->_shadowImage;
}

- (void)setShadowImage:(id)a3
{
}

- (UIBezierPath)cachedPath
{
  return self->_cachedPath;
}

- (void)setCachedPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowImage, 0);
  objc_storeStrong((id *)&self->_cachedPath, 0);
}

@end