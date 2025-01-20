@interface MockObserver
- (_TtC13HomeDataModel12MockObserver)init;
@end

@implementation MockObserver

- (_TtC13HomeDataModel12MockObserver)init
{
  result = (_TtC13HomeDataModel12MockObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_251A27C7C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13HomeDataModel12MockObserver_block));
  v3 = (char *)self + OBJC_IVAR____TtC13HomeDataModel12MockObserver_id;
  uint64_t v4 = sub_251F34DA0();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end