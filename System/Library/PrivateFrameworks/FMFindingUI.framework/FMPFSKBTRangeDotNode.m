@interface FMPFSKBTRangeDotNode
- (_TtC11FMFindingUI20FMPFSKBTRangeDotNode)init;
- (_TtC11FMFindingUI20FMPFSKBTRangeDotNode)initWithCoder:(id)a3;
- (_TtC11FMFindingUI20FMPFSKBTRangeDotNode)initWithTexture:(id)a3 color:(id)a4 size:(CGSize)a5;
@end

@implementation FMPFSKBTRangeDotNode

- (_TtC11FMFindingUI20FMPFSKBTRangeDotNode)init
{
  return (_TtC11FMFindingUI20FMPFSKBTRangeDotNode *)sub_24D3747CC();
}

- (_TtC11FMFindingUI20FMPFSKBTRangeDotNode)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC11FMFindingUI20FMPFSKBTRangeDotNode_sizeSpring;
  id v5 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v4) = (Class)sub_24D32B080(0, 0, 0x3F50624DD2F1A9FCLL, 0);

  result = (_TtC11FMFindingUI20FMPFSKBTRangeDotNode *)sub_24D39D2B0();
  __break(1u);
  return result;
}

- (_TtC11FMFindingUI20FMPFSKBTRangeDotNode)initWithTexture:(id)a3 color:(id)a4 size:(CGSize)a5
{
  id v6 = a3;
  id v7 = a4;
  result = (_TtC11FMFindingUI20FMPFSKBTRangeDotNode *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI20FMPFSKBTRangeDotNode_sizeSpring));
}

@end