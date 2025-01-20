@interface OverlayLayer
- (_TtC16AutomationModeUI12OverlayLayer)init;
- (_TtC16AutomationModeUI12OverlayLayer)initWithCoder:(id)a3;
- (_TtC16AutomationModeUI12OverlayLayer)initWithLayer:(id)a3;
- (void)dealloc;
- (void)layoutSublayers;
@end

@implementation OverlayLayer

- (_TtC16AutomationModeUI12OverlayLayer)init
{
  return (_TtC16AutomationModeUI12OverlayLayer *)sub_10000C008();
}

- (_TtC16AutomationModeUI12OverlayLayer)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10000F198();
}

- (_TtC16AutomationModeUI12OverlayLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  return (_TtC16AutomationModeUI12OverlayLayer *)sub_10000C388(v4);
}

- (void)dealloc
{
  id v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_textGroupMoveTimer);
  v4 = self;
  if (v3) {
    [v3 invalidate];
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for OverlayLayer();
  [(OverlayLayer *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_textGroupMoveTimer));
  id v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16AutomationModeUI12OverlayLayer_strokeColor);
}

- (void)layoutSublayers
{
  v2 = self;
  sub_10000D614();
}

@end