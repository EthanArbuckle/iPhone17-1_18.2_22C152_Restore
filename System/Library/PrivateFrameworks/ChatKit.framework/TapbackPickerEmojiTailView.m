@interface TapbackPickerEmojiTailView
- (BOOL)pointInside:(CGFloat)a3 withEvent:(uint64_t)a4;
@end

@implementation TapbackPickerEmojiTailView

- (void).cxx_destruct
{
}

- (BOOL)pointInside:(CGFloat)a3 withEvent:(uint64_t)a4
{
  id v8 = a5;
  id v9 = a1;
  objc_msgSend(v9, sel_bounds);
  CGRect v14 = CGRectInset(v13, -4.0, -4.0);
  v12.x = a2;
  v12.y = a3;
  BOOL v10 = CGRectContainsPoint(v14, v12);

  return v10;
}

@end