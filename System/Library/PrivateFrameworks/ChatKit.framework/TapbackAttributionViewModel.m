@interface TapbackAttributionViewModel
- (_TtC7ChatKit27TapbackAttributionViewModel)init;
@end

@implementation TapbackAttributionViewModel

- (_TtC7ChatKit27TapbackAttributionViewModel)init
{
  result = (_TtC7ChatKit27TapbackAttributionViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  sub_18EF27FE8((uint64_t)self + OBJC_IVAR____TtC7ChatKit27TapbackAttributionViewModel__selectedItem, &qword_1E923AE80);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7ChatKit27TapbackAttributionViewModel_messagePartChatItem));
  v3 = (char *)self + OBJC_IVAR____TtC7ChatKit27TapbackAttributionViewModel___observationRegistrar;
  uint64_t v4 = sub_18F7B6470();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end