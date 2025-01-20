@interface WKAutocorrectionRects
+ (id)autocorrectionRectsWithFirstCGRect:(CGRect)a3 lastCGRect:(CGRect)a4;
@end

@implementation WKAutocorrectionRects

+ (id)autocorrectionRectsWithFirstCGRect:(CGRect)a3 lastCGRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  double v10 = a3.origin.y;
  double v11 = a3.origin.x;
  v12 = objc_alloc_init(WKAutocorrectionRects);
  -[UIWKAutocorrectionRects setFirstRect:](v12, "setFirstRect:", v11, v10, v9, v8);
  -[UIWKAutocorrectionRects setLastRect:](v12, "setLastRect:", x, y, width, height);
  v13 = (void *)CFMakeCollectable(v12);

  return v13;
}

@end