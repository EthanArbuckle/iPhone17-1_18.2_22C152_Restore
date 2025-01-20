@interface FMPFSKPeripheralDotNode
- (NSString)description;
- (_TtC11FMFindingUI23FMPFSKPeripheralDotNode)init;
- (_TtC11FMFindingUI23FMPFSKPeripheralDotNode)initWithCoder:(id)a3;
@end

@implementation FMPFSKPeripheralDotNode

- (_TtC11FMFindingUI23FMPFSKPeripheralDotNode)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_24D2C38B0();
}

- (NSString)description
{
  v2 = self;
  sub_24D2C1D24();

  id v3 = (void *)sub_24D39CAC0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC11FMFindingUI23FMPFSKPeripheralDotNode)init
{
  result = (_TtC11FMFindingUI23FMPFSKPeripheralDotNode *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super._keyedActions
                     + OBJC_IVAR____TtC11FMFindingUI23FMPFSKPeripheralDotNode_style));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMPFSKPeripheralDotNode_gimbalNode));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMPFSKPeripheralDotNode_diskNode));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMPFSKPeripheralDotNode_dotNode));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMPFSKPeripheralDotNode_dotCGPathNode));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMPFSKPeripheralDotNode_btRangingNode));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMPFSKPeripheralDotNode_interativeRadiusBeaconNode));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMPFSKPeripheralDotNode_perimeterRotateOnceAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMPFSKPeripheralDotNode_diskRadiusSpring));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMPFSKPeripheralDotNode_dotScaleSpring));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMPFSKPeripheralDotNode_angleSpring));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMPFSKPeripheralDotNode_opacitySpring));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMPFSKPeripheralDotNode_brightnessSpring));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMPFSKPeripheralDotNode_xOffsetSpring));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMPFSKPeripheralDotNode_yOffsetSpring));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMPFSKPeripheralDotNode_headingSpring));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI23FMPFSKPeripheralDotNode_radiusFactorSpring));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11FMFindingUI23FMPFSKPeripheralDotNode_renderingColor);
}

@end