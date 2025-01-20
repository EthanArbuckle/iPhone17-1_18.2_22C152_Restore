@interface FMPFSKBTRangingNode
- (_TtC11FMFindingUI19FMPFSKBTRangingNode)init;
- (_TtC11FMFindingUI19FMPFSKBTRangingNode)initWithCoder:(id)a3;
@end

@implementation FMPFSKBTRangingNode

- (_TtC11FMFindingUI19FMPFSKBTRangingNode)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC11FMFindingUI19FMPFSKBTRangingNode_rangeDotNode;
  id v6 = objc_allocWithZone((Class)type metadata accessor for FMPFSKBTRangeDotNode());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC11FMFindingUI19FMPFSKBTRangingNode *)sub_24D39D2B0();
  __break(1u);
  return result;
}

- (_TtC11FMFindingUI19FMPFSKBTRangingNode)init
{
  result = (_TtC11FMFindingUI19FMPFSKBTRangingNode *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI19FMPFSKBTRangingNode_rangeDiskNode));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI19FMPFSKBTRangingNode_rangeDotNode));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11FMFindingUI19FMPFSKBTRangingNode_levelRingsNode);
}

@end