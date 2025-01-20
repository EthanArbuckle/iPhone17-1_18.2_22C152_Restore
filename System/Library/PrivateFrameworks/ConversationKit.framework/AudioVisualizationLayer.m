@interface AudioVisualizationLayer
- (CGRect)bounds;
- (_TtC15ConversationKit23AudioVisualizationLayer)init;
- (_TtC15ConversationKit23AudioVisualizationLayer)initWithCoder:(id)a3;
- (_TtC15ConversationKit23AudioVisualizationLayer)initWithLayer:(id)a3;
- (void)addAnimation:(id)a3 forKey:(id)a4;
- (void)dealloc;
- (void)setBounds:(CGRect)a3;
@end

@implementation AudioVisualizationLayer

- (_TtC15ConversationKit23AudioVisualizationLayer)init
{
  return (_TtC15ConversationKit23AudioVisualizationLayer *)AudioVisualizationLayer.init()();
}

- (_TtC15ConversationKit23AudioVisualizationLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  return (_TtC15ConversationKit23AudioVisualizationLayer *)AudioVisualizationLayer.init(layer:)((uint64_t)&v4);
}

- (_TtC15ConversationKit23AudioVisualizationLayer)initWithCoder:(id)a3
{
  id v3 = a3;
  AudioVisualizationLayer.init(coder:)();
}

- (void)dealloc
{
  v2 = self;
  AudioVisualizationLayer.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC15ConversationKit23AudioVisualizationLayer_color);
}

- (CGRect)bounds
{
  v2 = self;
  AudioVisualizationLayer.bounds.getter();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = self;
  AudioVisualizationLayer.bounds.setter(x, y, width, height);
}

- (void)addAnimation:(id)a3 forKey:(id)a4
{
  if (a4)
  {
    double v6 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint32_t v8 = v7;
  }
  else
  {
    double v6 = 0;
    uint32_t v8 = 0;
  }
  double v9 = (objc_class *)a3;
  double v10 = self;
  v13.super.isa = v9;
  v13._attr = v6;
  v13._flags = v8;
  AudioVisualizationLayer.add(_:forKey:)(v13, v11);

  swift_bridgeObjectRelease();
}

@end