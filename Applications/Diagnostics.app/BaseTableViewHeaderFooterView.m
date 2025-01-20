@interface BaseTableViewHeaderFooterView
- (_TtC11Diagnostics29BaseTableViewHeaderFooterView)initWithCoder:(id)a3;
- (_TtC11Diagnostics29BaseTableViewHeaderFooterView)initWithReuseIdentifier:(id)a3;
@end

@implementation BaseTableViewHeaderFooterView

- (_TtC11Diagnostics29BaseTableViewHeaderFooterView)initWithReuseIdentifier:(id)a3
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    NSString v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v4 = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for BaseTableViewHeaderFooterView();
  v5 = [(BaseTableViewHeaderFooterView *)&v7 initWithReuseIdentifier:v4];

  return v5;
}

- (_TtC11Diagnostics29BaseTableViewHeaderFooterView)initWithCoder:(id)a3
{
  result = (_TtC11Diagnostics29BaseTableViewHeaderFooterView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

@end