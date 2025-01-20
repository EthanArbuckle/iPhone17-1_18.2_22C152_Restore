@interface DOCNodeObserver
- (DOCNode)node;
- (_TtC11SaveToFiles15DOCNodeObserver)init;
- (_TtC11SaveToFiles15DOCNodeObserver)initWithObservedNode:(id)a3 source:(id)a4 enableDeepObserving:(BOOL)a5;
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
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11SaveToFiles15DOCNodeObserver_node) = (Class)a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (_TtC11SaveToFiles15DOCNodeObserver)initWithObservedNode:(id)a3 source:(id)a4 enableDeepObserving:(BOOL)a5
{
  swift_getObjectType();
  swift_unknownObjectRetain();
  id v9 = a4;
  return (_TtC11SaveToFiles15DOCNodeObserver *)sub_10011117C(a3, a4, a5, (char *)self);
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  sub_100253B68();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  [(DOCNodeObserver *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC11SaveToFiles15DOCNodeObserver)init
{
  result = (_TtC11SaveToFiles15DOCNodeObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)addSubscriber:(id)a3
{
  return sub_10010F7D8(self, (int)a2, a3, (uint64_t)&unk_1005C2D20, (uint64_t)sub_1001119EC, (uint64_t (*)(uint64_t, uint64_t))sub_10010F4F8);
}

- (id)addDidFinishGatheringSubscriber:(id)a3
{
  return sub_10010F7D8(self, (int)a2, a3, (uint64_t)&unk_1005C2CF8, (uint64_t)sub_1001119E4, (uint64_t (*)(uint64_t, uint64_t))sub_10010F660);
}

- (void)removeSubscriber:(id)a3
{
  swift_beginAccess();
  objc_super v5 = (_TtC11SaveToFiles15DOCNodeObserver *)a3;
  v6 = self;
  unint64_t v7 = swift_bridgeObjectRetain();
  unint64_t v8 = sub_1001114A4(v7, (uint64_t)v5);
  char v10 = v9;
  swift_bridgeObjectRelease();
  if ((v10 & 1) == 0)
  {
    swift_beginAccess();
    uint64_t v11 = sub_10010EEE4(v8);
    swift_endAccess();

    objc_super v5 = v6;
    v6 = (_TtC11SaveToFiles15DOCNodeObserver *)v11;
  }
}

@end