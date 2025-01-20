@interface DOCNodeObserverSubscriber
- (_TtC18DocumentAppIntents25DOCNodeObserverSubscriber)init;
@end

@implementation DOCNodeObserverSubscriber

- (_TtC18DocumentAppIntents25DOCNodeObserverSubscriber)init
{
  result = (_TtC18DocumentAppIntents25DOCNodeObserverSubscriber *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC18DocumentAppIntents25DOCNodeObserverSubscriber_uuid;
  uint64_t v4 = sub_1004F16E0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  uint64_t v5 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC18DocumentAppIntents25DOCNodeObserverSubscriber_didFinishGatheringBlock);

  sub_100037540(v5);
}

@end