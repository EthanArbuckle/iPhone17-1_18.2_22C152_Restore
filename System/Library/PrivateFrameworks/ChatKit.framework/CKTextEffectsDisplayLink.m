@interface CKTextEffectsDisplayLink
- (_TtC7ChatKit24CKTextEffectsDisplayLink)init;
- (id)frameRateRequest:(CAFrameRateRange)a3 block:(id)a4;
- (void)_displayLinkDidFire;
@end

@implementation CKTextEffectsDisplayLink

- (void)_displayLinkDidFire
{
  v2 = self;
  sub_18F61566C();
}

- (_TtC7ChatKit24CKTextEffectsDisplayLink)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit24CKTextEffectsDisplayLink_tokens) = (Class)MEMORY[0x1E4FBC860];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit24CKTextEffectsDisplayLink_displayLink) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CKTextEffectsDisplayLink();
  return [(CKTextEffectsDisplayLink *)&v3 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_super v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7ChatKit24CKTextEffectsDisplayLink_displayLink);
}

- (id)frameRateRequest:(CAFrameRateRange)a3 block:(id)a4
{
  float preferred = a3.preferred;
  float maximum = a3.maximum;
  float minimum = a3.minimum;
  v8 = _Block_copy(a4);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  v10 = self;
  id v11 = sub_18F61540C((uint64_t)sub_18F4CCAC8, v9, minimum, maximum, preferred);

  swift_release();

  return v11;
}

@end