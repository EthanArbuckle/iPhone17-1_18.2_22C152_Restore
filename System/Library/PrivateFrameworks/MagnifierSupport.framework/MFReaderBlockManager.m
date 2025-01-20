@interface MFReaderBlockManager
- (_TtC16MagnifierSupport20MFReaderBlockManager)init;
@end

@implementation MFReaderBlockManager

- (_TtC16MagnifierSupport20MFReaderBlockManager)init
{
  result = (_TtC16MagnifierSupport20MFReaderBlockManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC16MagnifierSupport20MFReaderBlockManager__blockIndex;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2688114A8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC16MagnifierSupport20MFReaderBlockManager__speechState;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268811458);
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
}

@end