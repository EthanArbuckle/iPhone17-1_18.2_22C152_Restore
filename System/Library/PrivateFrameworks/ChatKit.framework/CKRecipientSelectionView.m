@interface CKRecipientSelectionView
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation CKRecipientSelectionView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CKRecipientSelectionView;
  -[CKRecipientSelectionView hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (CKRecipientSelectionView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {

    v5 = 0;
  }

  return v5;
}

@end