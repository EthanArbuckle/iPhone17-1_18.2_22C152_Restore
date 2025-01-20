@interface CKTableViewCellActionButton
- (CGSize)sizeThatFits:(CGSize)a3;
@end

@implementation CKTableViewCellActionButton

- (CGSize)sizeThatFits:(CGSize)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKTableViewCellActionButton;
  -[CKTableViewCellActionButton sizeThatFits:](&v6, sel_sizeThatFits_, a3.width, a3.height);
  double v5 = fmax(v4, 82.0);
  result.height = v3;
  result.width = v5;
  return result;
}

@end