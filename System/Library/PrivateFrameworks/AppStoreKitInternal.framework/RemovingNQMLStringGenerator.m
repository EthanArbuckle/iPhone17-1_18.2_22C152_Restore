@interface RemovingNQMLStringGenerator
- (_TtC19AppStoreKitInternalP33_C2F9B3B131F26D75F4D3CC74894BB65A27RemovingNQMLStringGenerator)init;
- (void)parser:(id)a3 didFindCharacters:(id)a4;
- (void)parser:(id)a3 parseErrorOccurred:(id)a4;
- (void)parserDidFindNewline:(id)a3;
@end

@implementation RemovingNQMLStringGenerator

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternalP33_C2F9B3B131F26D75F4D3CC74894BB65A27RemovingNQMLStringGenerator_parser));
  v3 = *(void **)&self->configuration[OBJC_IVAR____TtC19AppStoreKitInternalP33_C2F9B3B131F26D75F4D3CC74894BB65A27RemovingNQMLStringGenerator_configuration];
  v4 = *(void **)&self->configuration[OBJC_IVAR____TtC19AppStoreKitInternalP33_C2F9B3B131F26D75F4D3CC74894BB65A27RemovingNQMLStringGenerator_configuration
                                    + 8];
  v5 = *(void **)&self->configuration[OBJC_IVAR____TtC19AppStoreKitInternalP33_C2F9B3B131F26D75F4D3CC74894BB65A27RemovingNQMLStringGenerator_configuration
                                    + 32];
  objc_release(*(id *)&self->configuration[OBJC_IVAR____TtC19AppStoreKitInternalP33_C2F9B3B131F26D75F4D3CC74894BB65A27RemovingNQMLStringGenerator_configuration
                                         + 56]);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)parser:(id)a3 didFindCharacters:(id)a4
{
  sub_1E1D5BE58();
  id v6 = a3;
  v7 = self;
  sub_1E15B73C0();

  swift_bridgeObjectRelease();
}

- (void)parserDidFindNewline:(id)a3
{
  swift_beginAccess();
  id v5 = a3;
  id v6 = self;
  sub_1E1D5BFC8();
  swift_endAccess();
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  v7 = self;
  sub_1E1707F1C();
}

- (_TtC19AppStoreKitInternalP33_C2F9B3B131F26D75F4D3CC74894BB65A27RemovingNQMLStringGenerator)init
{
  result = (_TtC19AppStoreKitInternalP33_C2F9B3B131F26D75F4D3CC74894BB65A27RemovingNQMLStringGenerator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end