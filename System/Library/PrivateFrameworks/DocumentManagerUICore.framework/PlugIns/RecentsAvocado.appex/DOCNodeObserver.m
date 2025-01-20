@interface DOCNodeObserver
- (DOCNode)node;
- (_TtC14RecentsAvocado15DOCNodeObserver)init;
- (_TtC14RecentsAvocado15DOCNodeObserver)initWithObservedNode:(id)a3 source:(id)a4 enableDeepObserving:(BOOL)a5;
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
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14RecentsAvocado15DOCNodeObserver_node) = (Class)a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (_TtC14RecentsAvocado15DOCNodeObserver)initWithObservedNode:(id)a3 source:(id)a4 enableDeepObserving:(BOOL)a5
{
  swift_unknownObjectRetain();
  id v8 = a4;
  return (_TtC14RecentsAvocado15DOCNodeObserver *)sub_100382ACC(a3, a4, a5);
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  sub_1003E95E8();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  [(DOCNodeObserver *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC14RecentsAvocado15DOCNodeObserver)init
{
  result = (_TtC14RecentsAvocado15DOCNodeObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)addSubscriber:(id)a3
{
  return sub_100383234(self, (int)a2, a3, (uint64_t)&unk_1005D0F90, (uint64_t)sub_1000C3618, (uint64_t (*)(uint64_t, uint64_t))sub_100382F54);
}

- (id)addDidFinishGatheringSubscriber:(id)a3
{
  return sub_100383234(self, (int)a2, a3, (uint64_t)&unk_1005D0F68, (uint64_t)sub_100385164, (uint64_t (*)(uint64_t, uint64_t))sub_1003830BC);
}

- (void)removeSubscriber:(id)a3
{
  swift_beginAccess();
  objc_super v5 = (_TtC14RecentsAvocado15DOCNodeObserver *)a3;
  v6 = self;
  unint64_t v7 = swift_bridgeObjectRetain();
  unint64_t v8 = sub_100384C24(v7, (uint64_t)v5);
  char v10 = v9;
  swift_bridgeObjectRelease();
  if ((v10 & 1) == 0)
  {
    swift_beginAccess();
    uint64_t v11 = sub_10012580C(v8);
    swift_endAccess();

    objc_super v5 = v6;
    v6 = (_TtC14RecentsAvocado15DOCNodeObserver *)v11;
  }
}

@end