@interface RKEntityInteractionAccessibilityWrapper
- (NSString)accessibilityDescription;
- (_TtC17RealityFoundation39RKEntityInteractionAccessibilityWrapper)init;
@end

@implementation RKEntityInteractionAccessibilityWrapper

- (NSString)accessibilityDescription
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC17RealityFoundation39RKEntityInteractionAccessibilityWrapper_interaction);
  v3 = (uint64_t *)(v2 + 48);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 + 56);
  if (v4)
  {
    uint64_t v5 = *v3;
    swift_bridgeObjectRetain();
    v6 = (void *)MEMORY[0x22A688A50](v5, v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }

  return (NSString *)v6;
}

- (_TtC17RealityFoundation39RKEntityInteractionAccessibilityWrapper)init
{
  result = (_TtC17RealityFoundation39RKEntityInteractionAccessibilityWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end