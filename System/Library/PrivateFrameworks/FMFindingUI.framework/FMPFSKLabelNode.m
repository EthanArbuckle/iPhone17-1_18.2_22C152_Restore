@interface FMPFSKLabelNode
- (NSString)description;
- (_TtC11FMFindingUI15FMPFSKLabelNode)init;
- (_TtC11FMFindingUI15FMPFSKLabelNode)initWithCoder:(id)a3;
@end

@implementation FMPFSKLabelNode

- (_TtC11FMFindingUI15FMPFSKLabelNode)initWithCoder:(id)a3
{
  result = (_TtC11FMFindingUI15FMPFSKLabelNode *)sub_24D39D2B0();
  __break(1u);
  return result;
}

- (NSString)description
{
  v2 = self;
  sub_24D36AA94();

  v3 = (void *)sub_24D39CAC0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC11FMFindingUI15FMPFSKLabelNode)init
{
  result = (_TtC11FMFindingUI15FMPFSKLabelNode *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.__layeringSceneIdentity
                     + OBJC_IVAR____TtC11FMFindingUI15FMPFSKLabelNode_style));
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC11FMFindingUI15FMPFSKLabelNode_labelNode);
}

@end