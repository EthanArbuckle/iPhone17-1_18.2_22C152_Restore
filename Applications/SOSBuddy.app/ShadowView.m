@interface ShadowView
- (_TtC8SOSBuddy10ShadowView)initWithCoder:(id)a3;
- (_TtC8SOSBuddy10ShadowView)initWithFrame:(CGRect)a3;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
@end

@implementation ShadowView

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  id v9 = a3;
  v10 = self;
  id v11 = sub_1001FCBEC(v9, v6, v8);

  swift_bridgeObjectRelease();

  return v11;
}

- (_TtC8SOSBuddy10ShadowView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ShadowView();
  return -[ShadowView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC8SOSBuddy10ShadowView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ShadowView();
  return [(ShadowView *)&v5 initWithCoder:a3];
}

@end