@interface FMPFSKBTRangeDiskNode
- (_TtC11FMFindingUI21FMPFSKBTRangeDiskNode)init;
- (_TtC11FMFindingUI21FMPFSKBTRangeDiskNode)initWithCoder:(id)a3;
@end

@implementation FMPFSKBTRangeDiskNode

- (_TtC11FMFindingUI21FMPFSKBTRangeDiskNode)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC11FMFindingUI21FMPFSKBTRangeDiskNode_sizeSpring;
  id v5 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v4) = (Class)sub_24D32B080(0, 0, 0x3F50624DD2F1A9FCLL, 0);
  uint64_t v6 = OBJC_IVAR____TtC11FMFindingUI21FMPFSKBTRangeDiskNode_opacitySpring;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v6) = (Class)sub_24D32B3C8(0, 0, 0x3F847AE147AE147BLL, 0, 0, 1);

  result = (_TtC11FMFindingUI21FMPFSKBTRangeDiskNode *)sub_24D39D2B0();
  __break(1u);
  return result;
}

- (_TtC11FMFindingUI21FMPFSKBTRangeDiskNode)init
{
  result = (_TtC11FMFindingUI21FMPFSKBTRangeDiskNode *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI21FMPFSKBTRangeDiskNode_sizeSpring));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC11FMFindingUI21FMPFSKBTRangeDiskNode_opacitySpring);
}

@end