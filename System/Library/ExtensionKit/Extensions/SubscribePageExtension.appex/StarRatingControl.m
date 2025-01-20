@interface StarRatingControl
- (BOOL)isAccessibilityElement;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)accessibilityCustomActions;
- (NSString)accessibilityHint;
- (NSString)accessibilityLabel;
- (NSString)accessibilityValue;
- (_TtC22SubscribePageExtension17StarRatingControl)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension17StarRatingControl)initWithFrame:(CGRect)a3;
- (uint64_t)beginTrackingWithTouch:(void *)a3 withEvent:(void *)a4;
- (void)accessibilitySetStarRatingFive;
- (void)accessibilitySetStarRatingFour;
- (void)accessibilitySetStarRatingOne;
- (void)accessibilitySetStarRatingThree;
- (void)accessibilitySetStarRatingTwo;
- (void)accessibilitySetStarRatingZero;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)drawRect:(CGRect)a3;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)setAccessibilityCustomActions:(id)a3;
- (void)setAccessibilityHint:(id)a3;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAccessibilityValue:(id)a3;
- (void)setIsAccessibilityElement:(BOOL)a3;
- (void)tintColorDidChange;
@end

@implementation StarRatingControl

- (_TtC22SubscribePageExtension17StarRatingControl)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension17StarRatingControl_rating) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension17StarRatingControl_lastSentRating) = 0;
  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC22SubscribePageExtension17StarRatingControl_touchOutsideMargin);
  _OWORD *v4 = xmmword_1007B9090;
  v4[1] = xmmword_1007B9090;
  id v5 = a3;

  result = (_TtC22SubscribePageExtension17StarRatingControl *)sub_100768A40();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = self;
  id v4 = [(StarRatingControl *)v3 traitCollection];
  double v5 = sub_100135EE0();
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v7 = self;
  sub_100134474(x, y, width, height);
}

- (uint64_t)beginTrackingWithTouch:(void *)a3 withEvent:(void *)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = a1;
  [v6 locationInView:v8];
  sub_100134FBC(v9);
  uint64_t v10 = *(void *)&v8[OBJC_IVAR____TtC22SubscribePageExtension17StarRatingControl_rating];
  *(void *)&v8[OBJC_IVAR____TtC22SubscribePageExtension17StarRatingControl_rating] = v11;
  if (v10 != v11) {
    [v8 setNeedsDisplay];
  }

  return 1;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  double v9 = self;
  sub_100136180(a3);
}

- (void)cancelTrackingWithEvent:(id)a3
{
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension17StarRatingControl_lastSentRating);
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension17StarRatingControl_rating);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension17StarRatingControl_rating) = v3;
  if (v4 != v3) {
    [(StarRatingControl *)self setNeedsDisplay];
  }
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StarRatingControl();
  id v2 = v3.receiver;
  [(StarRatingControl *)&v3 tintColorDidChange];
  objc_msgSend(v2, "setNeedsDisplay", v3.receiver, v3.super_class);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  double v7 = *(double *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC22SubscribePageExtension17StarRatingControl_touchOutsideMargin);
  double v8 = *(double *)&self->rating[OBJC_IVAR____TtC22SubscribePageExtension17StarRatingControl_touchOutsideMargin];
  double v9 = *(double *)&self->lastSentRating[OBJC_IVAR____TtC22SubscribePageExtension17StarRatingControl_touchOutsideMargin];
  double v10 = *(double *)&self->touchOutsideMargin[OBJC_IVAR____TtC22SubscribePageExtension17StarRatingControl_touchOutsideMargin];
  id v11 = a4;
  v12 = self;
  [(StarRatingControl *)v12 bounds];
  v20.origin.CGFloat x = v13 - v8;
  v20.origin.CGFloat y = v14 - v7;
  v20.size.CGFloat width = v8 + v10 + v15;
  v20.size.CGFloat height = v7 + v9 + v16;
  v19.CGFloat x = x;
  v19.CGFloat y = y;
  BOOL v17 = CGRectContainsPoint(v20, v19);

  return v17;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)setIsAccessibilityElement:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for StarRatingControl();
  [(StarRatingControl *)&v4 setIsAccessibilityElement:v3];
}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_10013523C(self, (uint64_t)a2, 0xD00000000000001FLL, (void *)0x800000010077F320);
}

- (void)setAccessibilityLabel:(id)a3
{
}

- (NSString)accessibilityHint
{
  return (NSString *)sub_10013523C(self, (uint64_t)a2, 0xD00000000000001ELL, (void *)0x800000010077F300);
}

- (void)setAccessibilityHint:(id)a3
{
}

- (NSString)accessibilityValue
{
  Swift::Int v2 = *(Swift::Int *)((char *)self + OBJC_IVAR____TtC22SubscribePageExtension17StarRatingControl_rating);
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    BOOL v3 = self;
    v6._object = (void *)0x800000010077F2E0;
    v6._countAndFlagsBits = 0xD00000000000001ALL;
    v7._countAndFlagsBits = 0;
    v7._object = (void *)0xE000000000000000;
    sub_10075FE30(v6, v2, v7);

    NSString v4 = sub_1007675C0();
    swift_bridgeObjectRelease();
    return (NSString *)v4;
  }
  return self;
}

- (void)setAccessibilityValue:(id)a3
{
}

- (NSArray)accessibilityCustomActions
{
  Swift::Int v2 = self;
  unint64_t v3 = sub_100135484();

  if (v3)
  {
    sub_10001A860(0, (unint64_t *)&unk_10093AA30);
    v4.super.isa = sub_1007677F0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (void)setAccessibilityCustomActions:(id)a3
{
  isa = a3;
  if (a3)
  {
    sub_10001A860(0, (unint64_t *)&unk_10093AA30);
    sub_100767800();
    double v5 = self;
    isa = sub_1007677F0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    Swift::String v6 = self;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for StarRatingControl();
  [(StarRatingControl *)&v7 setAccessibilityCustomActions:isa];
}

- (void)accessibilitySetStarRatingZero
{
  Swift::Int v2 = self;
  sub_1001357BC(0);
}

- (void)accessibilitySetStarRatingOne
{
  Swift::Int v2 = self;
  sub_1001357BC(1);
}

- (void)accessibilitySetStarRatingTwo
{
  Swift::Int v2 = self;
  sub_1001357BC(2);
}

- (void)accessibilitySetStarRatingThree
{
  Swift::Int v2 = self;
  sub_1001357BC(3);
}

- (void)accessibilitySetStarRatingFour
{
  Swift::Int v2 = self;
  sub_1001357BC(4);
}

- (void)accessibilitySetStarRatingFive
{
  Swift::Int v2 = self;
  sub_1001357BC(5);
}

- (_TtC22SubscribePageExtension17StarRatingControl)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC22SubscribePageExtension17StarRatingControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end