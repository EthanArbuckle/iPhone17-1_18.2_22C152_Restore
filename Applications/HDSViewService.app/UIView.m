@interface UIView
- (void)addSubviewToBounds:(id)a3 with:(UIEdgeInsets)a4;
@end

@implementation UIView

- (void)addSubviewToBounds:(id)a3 with:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  id v9 = a3;
  v10 = self;
  id v11 = sub_10008357C(v9, v10, top, left, bottom, right);
  v13 = v12;
  v15 = v14;
  id v17 = v16;
}

@end