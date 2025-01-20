@interface CKInteractiveBalloonImageView
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation CKInteractiveBalloonImageView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CKInteractiveBalloonImageView;
  -[CKInteractiveBalloonImageView hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (CKInteractiveBalloonImageView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {

    v5 = 0;
  }

  return v5;
}

@end