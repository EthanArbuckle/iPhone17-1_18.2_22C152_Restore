@interface CardStackView
- (_TtC11Diagnostics13CardStackView)initWithCoder:(id)a3;
- (_TtC11Diagnostics13CardStackView)initWithFrame:(CGRect)a3;
- (void)addArrangedSubview:(id)a3;
- (void)insertArrangedSubview:(id)a3 atIndex:(int64_t)a4;
- (void)layoutSubviews;
- (void)removeArrangedSubview:(id)a3;
@end

@implementation CardStackView

- (void)layoutSubviews
{
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = self;
  v4 = self;
  v7[4] = sub_10009D328;
  v7[5] = v3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  v7[2] = sub_1000358AC;
  v7[3] = &unk_1001516D0;
  v5 = _Block_copy(v7);
  v6 = self;
  swift_retain();
  swift_release();
  [v4 animateWithDuration:1 delay:v5 options:0 animations:0.25 completion:0.0];
  _Block_release(v5);

  swift_release();
}

- (void)addArrangedSubview:(id)a3
{
  id v4 = a3;
  v8 = self;
  id v5 = [(CardStackView *)v8 arrangedSubviews];
  sub_10009D14C();
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  sub_10009B4E4(v4, v7, 0);
}

- (void)insertArrangedSubview:(id)a3 atIndex:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_10009B4E4(v6, a4, 0);
}

- (void)removeArrangedSubview:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10009B6D0(v4, 0);
}

- (_TtC11Diagnostics13CardStackView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v7 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC11Diagnostics13CardStackView_layoutUpdateHandler);
  *uint64_t v7 = 0;
  v7[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11Diagnostics13CardStackView_heightConstraints) = (Class)_swiftEmptyArrayStorage;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for CardStackView();
  return -[BaseStackView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC11Diagnostics13CardStackView)initWithCoder:(id)a3
{
  id v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC11Diagnostics13CardStackView_layoutUpdateHandler);
  void *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11Diagnostics13CardStackView_heightConstraints) = (Class)_swiftEmptyArrayStorage;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CardStackView();
  return [(BaseStackView *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_10003B0B8(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC11Diagnostics13CardStackView_layoutUpdateHandler));

  swift_bridgeObjectRelease();
}

@end