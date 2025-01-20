@interface CKTapbackPileTemplate
+ (double)topOfPileBubbleRadius;
+ (double)topTapbackCenterXOffsetFromSourcePoint;
- (CKTapbackPileTemplate)init;
@end

@implementation CKTapbackPileTemplate

+ (double)topOfPileBubbleRadius
{
  return 17.0;
}

+ (double)topTapbackCenterXOffsetFromSourcePoint
{
  if (qword_1E9237788 != -1) {
    swift_once();
  }
  double result = (*(double *)&qword_1E9264C28 + 22.0) * 0.587785252 + 8.96444549;
  if (result <= 18.0) {
    return 18.0;
  }
  return result;
}

- (CKTapbackPileTemplate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TapbackPileTemplate();
  return [(CKTapbackPileTemplate *)&v3 init];
}

@end