@interface DOCNodeObserver
- (DOCNode)node;
- (_TtC17RecentsAppPopover15DOCNodeObserver)init;
- (_TtC17RecentsAppPopover15DOCNodeObserver)initWithObservedNode:(id)a3 source:(id)a4 enableDeepObserving:(BOOL)a5;
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
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17RecentsAppPopover15DOCNodeObserver_node) = (Class)a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (_TtC17RecentsAppPopover15DOCNodeObserver)initWithObservedNode:(id)a3 source:(id)a4 enableDeepObserving:(BOOL)a5
{
  swift_unknownObjectRetain();
  id v8 = a4;
  return (_TtC17RecentsAppPopover15DOCNodeObserver *)sub_1001D4EDC(a3, a4, a5);
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  sub_10003FCB0();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  [(DOCNodeObserver *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC17RecentsAppPopover15DOCNodeObserver)init
{
  result = (_TtC17RecentsAppPopover15DOCNodeObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)addSubscriber:(id)a3
{
  return sub_1001D5644(self, (int)a2, a3, (uint64_t)&unk_1005B2698, (uint64_t)sub_1000D79A4, (uint64_t (*)(uint64_t, uint64_t))sub_1001D5364);
}

- (id)addDidFinishGatheringSubscriber:(id)a3
{
  return sub_1001D5644(self, (int)a2, a3, (uint64_t)&unk_1005B2670, (uint64_t)sub_1001D7978, (uint64_t (*)(uint64_t, uint64_t))sub_1001D54CC);
}

- (void)removeSubscriber:(id)a3
{
  swift_beginAccess();
  objc_super v5 = (_TtC17RecentsAppPopover15DOCNodeObserver *)a3;
  v6 = self;
  unint64_t v7 = swift_bridgeObjectRetain();
  unint64_t v8 = sub_1001D782C(v7, (uint64_t)v5);
  char v10 = v9;
  swift_bridgeObjectRelease();
  if ((v10 & 1) == 0)
  {
    swift_beginAccess();
    uint64_t v11 = sub_10011C4C4(v8);
    swift_endAccess();

    objc_super v5 = v6;
    v6 = (_TtC17RecentsAppPopover15DOCNodeObserver *)v11;
  }
}

@end