@interface CKUIScrollView1xAdaptable
- (void)setFrame:(CGRect)a3;
@end

@implementation CKUIScrollView1xAdaptable

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = [(CKUIScrollView1xAdaptable *)self traitCollection];
  [v8 displayScale];
  double v10 = round(x * v9) / v9;
  double v11 = round(y * v9) / v9;
  double v12 = round(width * v9) / v9;
  double v13 = round(height * v9) / v9;

  v14.receiver = self;
  v14.super_class = (Class)CKUIScrollView1xAdaptable;
  -[CKUIScrollView1xAdaptable setFrame:](&v14, sel_setFrame_, v10, v11, v12, v13);
}

@end