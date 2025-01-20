@interface CAScrollLayer
+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3;
+ (id)defaultValueForKey:(id)a3;
- (CAScrollLayerScrollMode)scrollMode;
- (CGRect)_visibleRectOfLayer:(id)a3;
- (void)_scrollPoint:(CGPoint)a3 fromLayer:(id)a4;
- (void)_scrollRect:(CGRect)a3 fromLayer:(id)a4;
- (void)scrollToPoint:(CGPoint)p;
- (void)scrollToRect:(CGRect)r;
- (void)setScrollMode:(CAScrollLayerScrollMode)scrollMode;
@end

@implementation CAScrollLayer

+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ((Class)objc_opt_class() == a3) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CAScrollLayer;
  return objc_msgSendSuper2(&v6, sel_CA_automaticallyNotifiesObservers_, a3);
}

- (void)setScrollMode:(CAScrollLayerScrollMode)scrollMode
{
  v3[1] = *(double *)MEMORY[0x1E4F143B8];
  *(void *)&v3[0] = scrollMode;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x1EB, (const CGAffineTransform *)3, v3);
}

- (CAScrollLayerScrollMode)scrollMode
{
  v3[1] = *(id *)MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x1EBu, (const CGAffineTransform *)3, v3);
  return (CAScrollLayerScrollMode)v3[0];
}

- (CGRect)_visibleRectOfLayer:(id)a3
{
  [(CALayer *)self bounds];
  -[CALayer convertRect:toLayer:](self, "convertRect:toLayer:", a3);
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  [a3 bounds];
  uint64_t v17 = v6;
  uint64_t v18 = v8;
  uint64_t v19 = v10;
  uint64_t v20 = v12;

  return CGRectIntersection(*(CGRect *)&v13, *(CGRect *)&v17);
}

- (void)_scrollRect:(CGRect)a3 fromLayer:(id)a4
{
  -[CALayer convertRect:fromLayer:](self, "convertRect:fromLayer:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  -[CAScrollLayer scrollToRect:](self, "scrollToRect:");
}

- (void)_scrollPoint:(CGPoint)a3 fromLayer:(id)a4
{
  -[CALayer convertPoint:fromLayer:](self, "convertPoint:fromLayer:", a4, a3.x, a3.y);

  -[CAScrollLayer scrollToPoint:](self, "scrollToPoint:");
}

- (void)scrollToRect:(CGRect)r
{
  double height = r.size.height;
  double width = r.size.width;
  double y = r.origin.y;
  double x = r.origin.x;
  [(CALayer *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  int v16 = CAInternAtom((const __CFString *)[(CAScrollLayer *)self scrollMode], 0);
  v20.origin.double x = v9;
  v20.origin.double y = v11;
  v20.size.double width = v13;
  v20.size.double height = v15;
  v21.origin.double x = x;
  v21.origin.double y = y;
  v21.size.double width = width;
  v21.size.double height = height;
  if (CGRectContainsRect(v20, v21)) {
    return;
  }
  if (v16 == 263 || v16 == 70)
  {
    if (v9 + v13 >= x + width) {
      double v17 = v9;
    }
    else {
      double v17 = x + width - v13;
    }
    if (v17 <= x) {
      double v9 = v17;
    }
    else {
      double v9 = x;
    }
  }
  if (v16 == 591) {
    goto LABEL_13;
  }
  if (v16 != 263)
  {
    if (v16 != 70) {
      return;
    }
LABEL_13:
    if (v11 + v15 >= y + height) {
      double v18 = v11;
    }
    else {
      double v18 = y + height - v15;
    }
    if (v18 <= y) {
      double v11 = v18;
    }
    else {
      double v11 = y;
    }
  }

  -[CALayer setBounds:](self, "setBounds:", v9, v11, v13, v15);
}

- (void)scrollToPoint:(CGPoint)p
{
  CGFloat y = p.y;
  CGFloat x = p.x;
  [(CALayer *)self bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  int v14 = CAInternAtom((const __CFString *)[(CAScrollLayer *)self scrollMode], 0);
  if (v14 == 263 || v14 == 70) {
    double v7 = x;
  }
  if (v14 == 591 || v14 == 70) {
    double v9 = y;
  }

  -[CALayer setBounds:](self, "setBounds:", v7, v9, v11, v13);
}

+ (id)defaultValueForKey:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v5 = CAInternAtom((const __CFString *)a3, 0);
  if (v5 == 491) {
    return @"both";
  }
  if (v5 == 378) {
    return (id)*MEMORY[0x1E4F1CFD0];
  }
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CAScrollLayer;
  return objc_msgSendSuper2(&v7, sel_defaultValueForKey_, a3);
}

@end