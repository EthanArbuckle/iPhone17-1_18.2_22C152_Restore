@interface CKAggregateAcknowledgmentBalloonView
- (BOOL)hidesFirstTapbackTail;
- (BOOL)invertTailDirection;
- (CKAggregateAcknowledgmentBalloonView)initWithCoder:(id)a3;
- (CKAggregateAcknowledgmentBalloonView)initWithFrame:(CGRect)a3;
- (CKGradientReferenceView)gradientReferenceView;
- (char)gradientColor;
- (char)solidColor;
- (void)configureForAggregateAcknowledgmentChatItem:(id)a3;
- (void)configureGestureRecognizers;
- (void)configurePileForChatItem:(id)a3;
- (void)layoutSubviews;
- (void)longPressGestureRecognized:(id)a3;
- (void)playInsertionAnimationOnTopPlatter;
- (void)prepareForDisplay;
- (void)prepareForReuse;
- (void)setGradientColor:(char)a3;
- (void)setGradientReferenceView:(id)a3;
- (void)setHidesFirstTapbackTail:(BOOL)a3;
- (void)setInvertTailDirection:(BOOL)a3;
- (void)setSolidColor:(char)a3;
- (void)tapGestureRecognized:(id)a3;
@end

@implementation CKAggregateAcknowledgmentBalloonView

- (void)configureForAggregateAcknowledgmentChatItem:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKAggregateAcknowledgmentBalloonView;
  id v4 = a3;
  [(CKAcknowledgmentBalloonView *)&v5 configureForAggregateAcknowledgmentChatItem:v4];
  -[CKAggregateAcknowledgmentBalloonView configurePileForChatItem:](self, "configurePileForChatItem:", v4, v5.receiver, v5.super_class);
}

- (BOOL)hidesFirstTapbackTail
{
  v2 = (BOOL *)self + OBJC_IVAR___CKAggregateAcknowledgmentBalloonView_hidesFirstTapbackTail;
  swift_beginAccess();
  return *v2;
}

- (void)setHidesFirstTapbackTail:(BOOL)a3
{
  objc_super v5 = (BOOL *)self + OBJC_IVAR___CKAggregateAcknowledgmentBalloonView_hidesFirstTapbackTail;
  swift_beginAccess();
  *objc_super v5 = a3;
  v6 = self;
  sub_18F559AC8();
}

- (CKGradientReferenceView)gradientReferenceView
{
  v2 = (char *)self + OBJC_IVAR___CKAggregateAcknowledgmentBalloonView_gradientReferenceView;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x192FBC390](v2);

  return (CKGradientReferenceView *)v3;
}

- (void)setGradientReferenceView:(id)a3
{
  id v5 = a3;
  id v4 = self;
  sub_18F55CFF4();
}

- (BOOL)invertTailDirection
{
  v2 = (BOOL *)self + OBJC_IVAR___CKAggregateAcknowledgmentBalloonView_invertTailDirection;
  swift_beginAccess();
  return *v2;
}

- (void)setInvertTailDirection:(BOOL)a3
{
  int v3 = a3;
  id v5 = (char *)self + OBJC_IVAR___CKAggregateAcknowledgmentBalloonView_invertTailDirection;
  swift_beginAccess();
  int v6 = *v5;
  *id v5 = v3;
  if (v6 != v3) {
    [(CKBalloonView *)self setNeedsPrepareForDisplay];
  }
}

- (char)gradientColor
{
  v2 = (char *)self + OBJC_IVAR___CKAggregateAcknowledgmentBalloonView_gradientColor;
  swift_beginAccess();
  return *v2;
}

- (void)setGradientColor:(char)a3
{
}

- (char)solidColor
{
  v2 = (char *)self + OBJC_IVAR___CKAggregateAcknowledgmentBalloonView_solidColor;
  swift_beginAccess();
  return *v2;
}

- (void)setSolidColor:(char)a3
{
}

- (CKAggregateAcknowledgmentBalloonView)initWithCoder:(id)a3
{
  id v3 = a3;
  _s7ChatKit34AggregateAcknowledgmentBalloonViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (CKAggregateAcknowledgmentBalloonView)initWithFrame:(CGRect)a3
{
  return (CKAggregateAcknowledgmentBalloonView *)AggregateAcknowledgmentBalloonView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)configurePileForChatItem:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_18F5591E4(v4);
}

- (void)prepareForDisplay
{
  v2 = self;
  sub_18F55A934();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AggregateAcknowledgmentBalloonView();
  id v2 = v3.receiver;
  [(CKBalloonView *)&v3 layoutSubviews];
  sub_18F55B388();
}

- (void)prepareForReuse
{
  id v2 = self;
  sub_18F55ACA0();
}

- (void)playInsertionAnimationOnTopPlatter
{
  id v2 = self;
  sub_18F5598FC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___CKAggregateAcknowledgmentBalloonView_gradientView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___CKAggregateAcknowledgmentBalloonView_bottomPeekPlatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___CKAggregateAcknowledgmentBalloonView_viewModel));
  objc_super v3 = (char *)self + OBJC_IVAR___CKAggregateAcknowledgmentBalloonView_gradientReferenceView;

  sub_18F4C25DC((uint64_t)v3);
}

- (void)configureGestureRecognizers
{
  id v2 = self;
  AggregateAcknowledgmentBalloonView.configureGestureRecognizers()();
}

- (void)tapGestureRecognized:(id)a3
{
  id v4 = (UITapGestureRecognizer *)a3;
  id v5 = self;
  AggregateAcknowledgmentBalloonView.tapGestureRecognized(_:)(v4);
}

- (void)longPressGestureRecognized:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_18F55C324(v4);
}

@end