@interface CardPresenter
- (_TtC13PCViewService13CardPresenter)init;
- (void)dealloc;
@end

@implementation CardPresenter

- (void)dealloc
{
  v2 = self;
  id v3 = sub_10006EDDC();
  NSString v4 = String._bridgeToObjectiveC()();
  [v3 ulog:40 message:v4];

  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for CardPresenter(0);
  [(CardPresenter *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  sub_1000211F0((uint64_t)self + OBJC_IVAR____TtC13PCViewService13CardPresenter_initialActivityDisplayContext, type metadata accessor for ActivityDisplayContext);

  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10000F808(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13PCViewService13CardPresenter_cardPresentingAnimationBlock));
  swift_release();

  swift_bridgeObjectRelease();
}

- (_TtC13PCViewService13CardPresenter)init
{
  result = (_TtC13PCViewService13CardPresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end