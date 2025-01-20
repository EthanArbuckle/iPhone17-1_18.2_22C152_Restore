@interface DOCNodeObserver
- (DOCNode)node;
- (_TtC33com_apple_DocumentManager_Service15DOCNodeObserver)init;
- (_TtC33com_apple_DocumentManager_Service15DOCNodeObserver)initWithObservedNode:(id)a3 source:(id)a4 enableDeepObserving:(BOOL)a5;
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
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC33com_apple_DocumentManager_Service15DOCNodeObserver_node) = (Class)a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (_TtC33com_apple_DocumentManager_Service15DOCNodeObserver)initWithObservedNode:(id)a3 source:(id)a4 enableDeepObserving:(BOOL)a5
{
  swift_getObjectType();
  swift_unknownObjectRetain();
  id v9 = a4;
  return (_TtC33com_apple_DocumentManager_Service15DOCNodeObserver *)sub_10048CCD0(a3, a4, a5, (char *)self);
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  sub_100372A58();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  [(DOCNodeObserver *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service15DOCNodeObserver_collection));
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

- (_TtC33com_apple_DocumentManager_Service15DOCNodeObserver)init
{
  result = (_TtC33com_apple_DocumentManager_Service15DOCNodeObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)addSubscriber:(id)a3
{
  return sub_10048B32C(self, (int)a2, a3, (uint64_t)&unk_1005DD550, (uint64_t)sub_10018B840, (uint64_t (*)(uint64_t, uint64_t))sub_10048AD08);
}

- (id)addDidFinishGatheringSubscriber:(id)a3
{
  return sub_10048B32C(self, (int)a2, a3, (uint64_t)&unk_1005DD528, (uint64_t)sub_10048D538, (uint64_t (*)(uint64_t, uint64_t))sub_10048B1B4);
}

- (void)removeSubscriber:(id)a3
{
  swift_beginAccess();
  objc_super v5 = (_TtC33com_apple_DocumentManager_Service15DOCNodeObserver *)a3;
  v6 = self;
  unint64_t v7 = swift_bridgeObjectRetain();
  unint64_t v8 = sub_10048CFF8(v7, (uint64_t)v5);
  char v10 = v9;
  swift_bridgeObjectRelease();
  if ((v10 & 1) == 0)
  {
    swift_beginAccess();
    uint64_t v11 = sub_10026BCE8(v8);
    swift_endAccess();

    objc_super v5 = v6;
    v6 = (_TtC33com_apple_DocumentManager_Service15DOCNodeObserver *)v11;
  }
}

@end