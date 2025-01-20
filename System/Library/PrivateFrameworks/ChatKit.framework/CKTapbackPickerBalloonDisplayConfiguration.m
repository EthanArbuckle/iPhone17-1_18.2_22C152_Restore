@interface CKTapbackPickerBalloonDisplayConfiguration
- (BOOL)isWidthConstrained;
- (BOOL)wantsBottomTail;
- (BOOL)wantsRightTail;
- (CGSize)pickerPillPreferredContentSize;
- (CKTapbackPickerBalloonDisplayConfiguration)init;
- (double)horizontalMarginBetweenBubbleAndEmojiTail;
- (double)sourceX;
- (void)setHorizontalMarginBetweenBubbleAndEmojiTail:(double)a3;
- (void)setIsWidthConstrained:(BOOL)a3;
- (void)setPickerPillPreferredContentSize:(CGSize)a3;
- (void)setSourceX:(double)a3;
- (void)setWantsBottomTail:(BOOL)a3;
- (void)setWantsRightTail:(BOOL)a3;
@end

@implementation CKTapbackPickerBalloonDisplayConfiguration

- (double)sourceX
{
  v2 = (double *)((char *)self + OBJC_IVAR___CKTapbackPickerBalloonDisplayConfiguration_sourceX);
  swift_beginAccess();
  return *v2;
}

- (void)setSourceX:(double)a3
{
  v4 = (double *)((char *)self + OBJC_IVAR___CKTapbackPickerBalloonDisplayConfiguration_sourceX);
  swift_beginAccess();
  double *v4 = a3;
}

- (BOOL)wantsRightTail
{
  v2 = (BOOL *)self + OBJC_IVAR___CKTapbackPickerBalloonDisplayConfiguration_wantsRightTail;
  swift_beginAccess();
  return *v2;
}

- (void)setWantsRightTail:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___CKTapbackPickerBalloonDisplayConfiguration_wantsRightTail;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)wantsBottomTail
{
  v2 = (BOOL *)self + OBJC_IVAR___CKTapbackPickerBalloonDisplayConfiguration_wantsBottomTail;
  swift_beginAccess();
  return *v2;
}

- (void)setWantsBottomTail:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___CKTapbackPickerBalloonDisplayConfiguration_wantsBottomTail;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)isWidthConstrained
{
  v2 = (BOOL *)self + OBJC_IVAR___CKTapbackPickerBalloonDisplayConfiguration_isWidthConstrained;
  swift_beginAccess();
  return *v2;
}

- (void)setIsWidthConstrained:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___CKTapbackPickerBalloonDisplayConfiguration_isWidthConstrained;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (double)horizontalMarginBetweenBubbleAndEmojiTail
{
  v2 = (double *)((char *)self
                + OBJC_IVAR___CKTapbackPickerBalloonDisplayConfiguration_horizontalMarginBetweenBubbleAndEmojiTail);
  swift_beginAccess();
  return *v2;
}

- (void)setHorizontalMarginBetweenBubbleAndEmojiTail:(double)a3
{
  v4 = (double *)((char *)self
                + OBJC_IVAR___CKTapbackPickerBalloonDisplayConfiguration_horizontalMarginBetweenBubbleAndEmojiTail);
  swift_beginAccess();
  double *v4 = a3;
}

- (CGSize)pickerPillPreferredContentSize
{
  v2 = (double *)((char *)self + OBJC_IVAR___CKTapbackPickerBalloonDisplayConfiguration_pickerPillPreferredContentSize);
  swift_beginAccess();
  double v3 = *v2;
  double v4 = v2[1];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setPickerPillPreferredContentSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v5 = (CGFloat *)((char *)self + OBJC_IVAR___CKTapbackPickerBalloonDisplayConfiguration_pickerPillPreferredContentSize);
  swift_beginAccess();
  CGFloat *v5 = width;
  v5[1] = height;
}

- (CKTapbackPickerBalloonDisplayConfiguration)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKTapbackPickerBalloonDisplayConfiguration_sourceX) = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___CKTapbackPickerBalloonDisplayConfiguration_wantsRightTail) = 0;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___CKTapbackPickerBalloonDisplayConfiguration_wantsBottomTail) = 1;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___CKTapbackPickerBalloonDisplayConfiguration_isWidthConstrained) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___CKTapbackPickerBalloonDisplayConfiguration_horizontalMarginBetweenBubbleAndEmojiTail) = 0;
  double v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR___CKTapbackPickerBalloonDisplayConfiguration_pickerPillPreferredContentSize);
  double v4 = (objc_class *)type metadata accessor for TapbackPickerBalloonDisplayConfiguration();
  *double v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(CKTapbackPickerBalloonDisplayConfiguration *)&v6 init];
}

@end