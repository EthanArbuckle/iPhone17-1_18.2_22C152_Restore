@interface CKTapbackPickerBalloonLayoutTemplate
+ (double)emojiTailBubbleMargin;
+ (double)pickerPillBottomTailBaseline;
+ (double)pickerPillBubbleMargin;
+ (double)requiredDisplayHeight;
+ (double)topOffsetForUnobscuredTranscriptPresentation;
+ (double)widthConstrainedBaselineWithDisplayConfiguration:(id)a3;
- (CKTapbackPickerBalloonLayoutTemplate)init;
@end

@implementation CKTapbackPickerBalloonLayoutTemplate

+ (double)pickerPillBubbleMargin
{
  return 5.0;
}

+ (double)emojiTailBubbleMargin
{
  return 6.0;
}

+ (double)topOffsetForUnobscuredTranscriptPresentation
{
  return 110.6;
}

+ (double)pickerPillBottomTailBaseline
{
  if (qword_1E9237C00 != -1) {
    swift_once();
  }
  return (*(double *)&qword_1E9265178 + 52.8) * 0.64278761 + 15.4 + 37.4;
}

+ (double)widthConstrainedBaselineWithDisplayConfiguration:(id)a3
{
  v4 = (double *)((char *)a3 + OBJC_IVAR___CKTapbackPickerBalloonDisplayConfiguration_pickerPillPreferredContentSize);
  swift_beginAccess();
  double v5 = v4[1];
  uint64_t v6 = qword_1E9237BE8;
  id v7 = a3;
  if (v6 != -1) {
    swift_once();
  }
  double v8 = *(double *)&qword_1E9265160;

  return v5 + 44.0 + v8;
}

+ (double)requiredDisplayHeight
{
  if (qword_1E9237C00 != -1) {
    swift_once();
  }
  double v2 = (*(double *)&qword_1E9265178 + 52.8) * 0.64278761 + 15.4 + 37.4;
  _s7ChatKit34TapbackPickerBalloonLayoutTemplateC17selectionTailSizeSo6CGSizeVvgZ_0();
  return v3 + v2;
}

- (CKTapbackPickerBalloonLayoutTemplate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TapbackPickerBalloonLayoutTemplate();
  return [(CKTapbackPickerBalloonLayoutTemplate *)&v3 init];
}

@end