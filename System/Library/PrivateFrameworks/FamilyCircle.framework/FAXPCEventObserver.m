@interface FAXPCEventObserver
- (FAXPCEventObserver)init;
- (FAXPCEventObserver)initWithStream:(id)a3 delegate:(id)a4;
- (void)start;
@end

@implementation FAXPCEventObserver

- (FAXPCEventObserver)initWithStream:(id)a3 delegate:(id)a4
{
  uint64_t v7 = OBJC_IVAR___FAXPCEventObserver_handlers;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v8 = self;
  *(Class *)((char *)&self->super.isa + v7) = (Class)sub_100021304((uint64_t)&_swiftEmptyArrayStorage);
  *(Class *)((char *)&v8->super.isa + OBJC_IVAR___FAXPCEventObserver_delegate) = (Class)a4;
  *(Class *)((char *)&v8->super.isa + OBJC_IVAR___FAXPCEventObserver_stream) = (Class)a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for XPCEventObserver();
  v9 = [(FAXPCEventObserver *)&v11 init];
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v9;
}

- (void)start
{
  v2 = self;
  sub_10002E640();
}

- (FAXPCEventObserver)init
{
  result = (FAXPCEventObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

@end