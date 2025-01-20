@interface CKAggregateAcknowledgmentGradientBalloonView
- (CKAggregateAcknowledgmentGradientBalloonView)initWithFrame:(CGRect)a3;
@end

@implementation CKAggregateAcknowledgmentGradientBalloonView

- (CKAggregateAcknowledgmentGradientBalloonView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for AggregateAcknowledgmentGradientBalloonView();
  return -[CKAggregateAcknowledgmentBalloonView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

@end