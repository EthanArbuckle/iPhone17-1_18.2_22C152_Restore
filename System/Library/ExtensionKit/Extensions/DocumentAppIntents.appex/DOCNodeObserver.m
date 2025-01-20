@interface DOCNodeObserver
- (DOCNode)node;
- (_TtC18DocumentAppIntents15DOCNodeObserver)init;
- (_TtC18DocumentAppIntents15DOCNodeObserver)initWithObservedNode:(id)a3 source:(id)a4 enableDeepObserving:(BOOL)a5;
- (id)addDidFinishGatheringSubscriber:(id)a3;
- (id)addSubscriber:(id)a3;
- (void)dealloc;
- (void)removeSubscriber:(id)a3;
- (void)setNode:(id)a3;
@end

@implementation DOCNodeObserver

- (DOCNode)node
{
  v2 = (void *)swift_unknownObjectRetain();

  return (DOCNode *)v2;
}

- (void)setNode:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18DocumentAppIntents15DOCNodeObserver_node) = (Class)a3;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
}

- (_TtC18DocumentAppIntents15DOCNodeObserver)initWithObservedNode:(id)a3 source:(id)a4 enableDeepObserving:(BOOL)a5
{
  swift_unknownObjectRetain();
  id v8 = a4;
  return (_TtC18DocumentAppIntents15DOCNodeObserver *)sub_10039D7F4(a3, a4, a5);
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  sub_10040C1B4();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  [(DOCNodeObserver *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC18DocumentAppIntents15DOCNodeObserver)init
{
  result = (_TtC18DocumentAppIntents15DOCNodeObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)addSubscriber:(id)a3
{
  return sub_10039DE18(self, (int)a2, a3, (uint64_t)&unk_100602B18, (uint64_t)sub_1000C7760, (uint64_t (*)(uint64_t, uint64_t))sub_10039DC7C);
}

- (id)addDidFinishGatheringSubscriber:(id)a3
{
  return sub_10039DE18(self, (int)a2, a3, (uint64_t)&unk_100602AF0, (uint64_t)sub_10039FD48, (uint64_t (*)(uint64_t, uint64_t))sub_10039D534);
}

- (void)removeSubscriber:(id)a3
{
  swift_beginAccess();
  objc_super v5 = (_TtC18DocumentAppIntents15DOCNodeObserver *)a3;
  v6 = self;
  unint64_t v7 = swift_bridgeObjectRetain();
  unint64_t v8 = sub_10039F808(v7, (uint64_t)v5);
  char v10 = v9;
  swift_bridgeObjectRelease();
  if ((v10 & 1) == 0)
  {
    swift_beginAccess();
    uint64_t v11 = sub_100135B34(v8);
    swift_endAccess();

    objc_super v5 = v6;
    v6 = (_TtC18DocumentAppIntents15DOCNodeObserver *)v11;
  }
}

@end