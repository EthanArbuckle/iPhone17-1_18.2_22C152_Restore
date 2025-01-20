@interface CKVideoCancelActionMenuItem
- (unint64_t)touchDownCount;
- (void)setTouchDownCount:(unint64_t)a3;
- (void)updateForState:(int64_t)a3 touchInside:(BOOL)a4;
@end

@implementation CKVideoCancelActionMenuItem

- (void)updateForState:(int64_t)a3 touchInside:(BOOL)a4
{
  BOOL v4 = a4;
  v5 = self;
  switch(a3)
  {
    case 1:
      [(CKVideoCancelActionMenuItem *)self setTouchDownCount:[(CKVideoCancelActionMenuItem *)self touchDownCount] + 1];
      goto LABEL_3;
    case 2:
LABEL_3:
      self = v5;
      BOOL v6 = v4;
      uint64_t v7 = 1;
      goto LABEL_11;
    case 3:
      [(CKActionMenuItem *)self setHighlighted:0 animated:1];
      if (v4 && [(CKVideoCancelActionMenuItem *)v5 touchDownCount] >= 2)
      {
        [(CKActionMenuItem *)v5 sendAction];
      }
      return;
    case 4:
      BOOL v6 = 0;
      uint64_t v7 = 0;
LABEL_11:
      [(CKActionMenuItem *)self setHighlighted:v6 animated:v7];
      break;
    default:
      return;
  }
}

- (unint64_t)touchDownCount
{
  return self->_touchDownCount;
}

- (void)setTouchDownCount:(unint64_t)a3
{
  self->_touchDownCount = a3;
}

@end