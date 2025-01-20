@interface LabeledSlider
- (CGRect)trackRectForBounds:(CGRect)a3;
- (CGSize)intrinsicContentSize;
- (_TtC5Setup13LabeledSlider)initWithCoder:(id)a3;
- (_TtC5Setup13LabeledSlider)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
- (void)setValue:(float)a3 animated:(BOOL)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
@end

@implementation LabeledSlider

- (CGSize)intrinsicContentSize
{
  v2 = self;
  sub_100028C9C();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC5Setup13LabeledSlider)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Setup13LabeledSlider_labelPositionConstraints) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Setup13LabeledSlider_labelOffset) = (Class)0x4024000000000000;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Setup13LabeledSlider_thumbSize) = (Class)0x403B000000000000;
  id v4 = a3;

  CGSize result = (_TtC5Setup13LabeledSlider *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)drawRect:(CGRect)a3
{
  double v3 = self;
  sub_10002A738();
}

- (void)updateConstraints
{
  v2 = self;
  sub_100029934();
}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = self;
  sub_100029B74(x, y, width, height);
  double v9 = v8;
  double v11 = v10;

  double v12 = 38.5;
  double v13 = 4.0;
  double v14 = v9;
  double v15 = v11;
  result.size.double height = v13;
  result.size.double width = v15;
  result.origin.double y = v12;
  result.origin.double x = v14;
  return result;
}

- (void)setValue:(float)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = self;
  id v7 = sub_100029EA0(a3);
  [(LabeledSlider *)v6 maximumValue];
  float v9 = (float)(v8
             / (float)((*(void **)((char *)&v6->super.super.super.super.super.isa
                                   + OBJC_IVAR____TtC5Setup13LabeledSlider_ticks))[2]
                     - 1))
     * (float)(uint64_t)v7;
  v11.receiver = v6;
  v11.super_class = (Class)type metadata accessor for LabeledSlider();
  *(float *)&double v10 = v9;
  [(LabeledSlider *)&v11 setValue:v4 animated:v10];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_10002AB24();
}

- (_TtC5Setup13LabeledSlider)initWithFrame:(CGRect)a3
{
  CGRect result = (_TtC5Setup13LabeledSlider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end