@interface CKTextEffectsDisplayLinkToken
- (_TtC7ChatKit29CKTextEffectsDisplayLinkToken)init;
- (void)dealloc;
- (void)invalidate;
@end

@implementation CKTextEffectsDisplayLinkToken

- (void)dealloc
{
  v2 = self;
  [(CKTextEffectsDisplayLinkToken *)v2 invalidate];
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for CKTextEffectsDisplayLinkToken();
  [(CKTextEffectsDisplayLinkToken *)&v3 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  swift_release();
}

- (_TtC7ChatKit29CKTextEffectsDisplayLinkToken)init
{
  result = (_TtC7ChatKit29CKTextEffectsDisplayLinkToken *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)invalidate
{
  uint64_t v3 = MEMORY[0x192FBC390]((char *)self + OBJC_IVAR____TtC7ChatKit29CKTextEffectsDisplayLinkToken_displayLink, a2);
  if (v3)
  {
    id v5 = (id)v3;
    v4 = self;
    sub_18F66B62C((uint64_t)v4, (uint64_t)v5);
  }
}

@end