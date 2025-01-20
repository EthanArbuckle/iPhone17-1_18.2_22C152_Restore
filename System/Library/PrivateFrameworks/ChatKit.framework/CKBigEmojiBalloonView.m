@interface CKBigEmojiBalloonView
- (BOOL)hasBackground;
- (BOOL)wantsTapbackPickerBackingBubble;
- (Class)invisibleInkEffectViewClass;
- (UIEdgeInsets)alignmentRectInsets;
- (id)accessibilityIdentifier;
- (void)addFilter:(id)a3;
- (void)attachInvisibleInkEffectView;
- (void)clearFilters;
- (void)detachInvisibleInkEffectView;
- (void)invisibleInkEffectViewWasUncovered;
@end

@implementation CKBigEmojiBalloonView

- (UIEdgeInsets)alignmentRectInsets
{
  v2 = +[CKUIBehavior sharedBehaviors];
  [v2 bigEmojiAlignmentRectInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)addFilter:(id)a3
{
  id v6 = a3;
  double v7 = [v6 balloonFilters];

  if (v7)
  {
    double v8 = [(CKTextBalloonView *)self textView];
    double v9 = [v8 layer];
    double v10 = [v9 filters];
    if (v10)
    {
      v23 = [(CKTextBalloonView *)self textView];
      v22 = [v23 layer];
      double v3 = [v22 filters];
      double v4 = [v6 balloonFilters];
      [v3 arrayByAddingObjectsFromArray:v4];
    }
    else
    {
      [v6 balloonFilters];
    double v11 = };
    double v12 = [(CKTextBalloonView *)self textView];
    double v13 = [v12 layer];
    [v13 setFilters:v11];

    if (v10)
    {

      double v11 = v23;
    }
  }
  [v6 contentAlpha];
  if (v14 != 0.0)
  {
    [v6 contentAlpha];
    double v16 = v15;
    v17 = [(CKTextBalloonView *)self textView];
    [v17 setAlpha:v16];
  }
  v18 = [v6 textCompositingFilter];

  if (v18)
  {
    v19 = [v6 textCompositingFilter];
    v20 = [(CKTextBalloonView *)self textView];
    v21 = [v20 layer];
    [v21 setCompositingFilter:v19];
  }
  v24.receiver = self;
  v24.super_class = (Class)CKBigEmojiBalloonView;
  [(CKTextBalloonView *)&v24 addFilter:v6];
}

- (void)clearFilters
{
  double v3 = [(CKTextBalloonView *)self textView];
  double v4 = [v3 layer];
  [v4 setFilters:0];

  double v5 = [(CKTextBalloonView *)self textView];
  id v6 = [v5 layer];
  [v6 setCompositingFilter:0];

  double v7 = [(CKTextBalloonView *)self textView];
  [v7 setAlpha:1.0];

  v8.receiver = self;
  v8.super_class = (Class)CKBigEmojiBalloonView;
  [(CKTextBalloonView *)&v8 clearFilters];
}

- (BOOL)hasBackground
{
  return 0;
}

- (id)accessibilityIdentifier
{
  return @"BigEmojiIdentifier";
}

- (BOOL)wantsTapbackPickerBackingBubble
{
  return 0;
}

- (Class)invisibleInkEffectViewClass
{
  return (Class)objc_opt_class();
}

- (void)invisibleInkEffectViewWasUncovered
{
  id v2 = [(CKBalloonView *)self invisibleInkEffectController];
  [v2 suspendForTimeInterval:5.0];
}

- (void)attachInvisibleInkEffectView
{
  double v3 = [(CKBalloonView *)self invisibleInkEffectController];
  id v5 = [v3 effectView];

  [v5 attachToBalloonView:self];
  double v4 = [(CKTextBalloonView *)self textView];
  [(CKBigEmojiBalloonView *)self insertSubview:v5 aboveSubview:v4];
}

- (void)detachInvisibleInkEffectView
{
  id v2 = [(CKBalloonView *)self invisibleInkEffectController];
  id v3 = [v2 effectView];

  [v3 detachFromBalloonView];
  [v3 removeFromSuperview];
}

@end