@interface AudioVisualizationRingLayer
- (CGRect)bounds;
- (_TtC15ConversationKit27AudioVisualizationRingLayer)init;
- (_TtC15ConversationKit27AudioVisualizationRingLayer)initWithCoder:(id)a3;
- (_TtC15ConversationKit27AudioVisualizationRingLayer)initWithLayer:(id)a3;
- (float)opacity;
- (void)setBounds:(CGRect)a3;
- (void)setOpacity:(float)a3;
@end

@implementation AudioVisualizationRingLayer

- (_TtC15ConversationKit27AudioVisualizationRingLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  return (_TtC15ConversationKit27AudioVisualizationRingLayer *)AudioVisualizationRingLayer.init(layer:)((uint64_t)&v4);
}

- (_TtC15ConversationKit27AudioVisualizationRingLayer)initWithCoder:(id)a3
{
}

- (float)opacity
{
  v2 = self;
  float v3 = AudioVisualizationRingLayer.opacity.getter();

  return v3;
}

- (void)setOpacity:(float)a3
{
  uint64_t v4 = self;
  AudioVisualizationRingLayer.opacity.setter(a3);
}

- (CGRect)bounds
{
  v2 = self;
  AudioVisualizationRingLayer.bounds.getter();
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
  AudioVisualizationRingLayer.bounds.setter(x, y, width, height);
}

- (_TtC15ConversationKit27AudioVisualizationRingLayer)init
{
}

@end