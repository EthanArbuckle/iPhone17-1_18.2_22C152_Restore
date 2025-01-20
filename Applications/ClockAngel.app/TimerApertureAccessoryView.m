@interface TimerApertureAccessoryView
- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4;
- (_TtC10ClockAngel26TimerApertureAccessoryView)initWithCoder:(id)a3;
- (_TtC10ClockAngel26TimerApertureAccessoryView)initWithFrame:(CGRect)a3;
@end

@implementation TimerApertureAccessoryView

- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  v6 = self;
  id v7 = [(TimerApertureAccessoryView *)v6 subviews];
  sub_100014314(0, (unint64_t *)&unk_1000C6DF0);
  unint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v8 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v17 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v17) {
      goto LABEL_3;
    }
LABEL_8:

    swift_bridgeObjectRelease();
    double v14 = 0.0;
    double v16 = 0.0;
    goto LABEL_9;
  }
  if (!*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_8;
  }
LABEL_3:
  if ((v8 & 0xC000000000000001) != 0)
  {
    id v11 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
  }
  else
  {
    if (!*(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_12;
    }
    id v11 = *(id *)(v8 + 32);
  }
  v12 = v11;
  swift_bridgeObjectRelease();
  [v12 sizeThatFits:width, height];
  double v14 = v13;
  double v16 = v15;

LABEL_9:
  double v9 = v14;
  double v10 = v16;
LABEL_12:
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (_TtC10ClockAngel26TimerApertureAccessoryView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TimerApertureAccessoryView();
  return -[TimerApertureAccessoryView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC10ClockAngel26TimerApertureAccessoryView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TimerApertureAccessoryView();
  return [(TimerApertureAccessoryView *)&v5 initWithCoder:a3];
}

@end