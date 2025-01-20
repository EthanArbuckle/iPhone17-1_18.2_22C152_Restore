@interface CAFUIHeaderFooterView
- (_TtC5CAFUI21CAFUIHeaderFooterView)initWithCoder:(id)a3;
- (_TtC5CAFUI21CAFUIHeaderFooterView)initWithReuseIdentifier:(id)a3;
@end

@implementation CAFUIHeaderFooterView

- (_TtC5CAFUI21CAFUIHeaderFooterView)initWithReuseIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v5 = (void *)MEMORY[0x24C59F610](v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CAFUIHeaderFooterView();
  v6 = [(CAFUIHeaderFooterView *)&v8 initWithReuseIdentifier:v5];

  return v6;
}

- (_TtC5CAFUI21CAFUIHeaderFooterView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CAFUIHeaderFooterView();
  return [(CAFUIHeaderFooterView *)&v5 initWithCoder:a3];
}

@end