@interface FMPFSKScene
- (CGSize)size;
- (NSString)description;
- (_TtC11FMFindingUI11FMPFSKScene)init;
- (_TtC11FMFindingUI11FMPFSKScene)initWithCoder:(id)a3;
- (_TtC11FMFindingUI11FMPFSKScene)initWithSize:(CGSize)a3;
- (void)dealloc;
- (void)setSize:(CGSize)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)update:(double)a3;
@end

@implementation FMPFSKScene

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (_TtC11FMFindingUI11FMPFSKScene)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_24D34B60C();
}

- (void)dealloc
{
  v2 = self;
  sub_24D347DD0();
}

- (void).cxx_destruct
{
  long long v3 = *(_OWORD *)((char *)&self->super.super._skcEffectNode + OBJC_IVAR____TtC11FMFindingUI11FMPFSKScene_config);
  v8[8] = *(_OWORD *)((char *)&self->super.super.super._focusBehavior + OBJC_IVAR____TtC11FMFindingUI11FMPFSKScene_config);
  v8[9] = v3;
  v8[10] = *(_OWORD *)((char *)&self->super._pausedTime + OBJC_IVAR____TtC11FMFindingUI11FMPFSKScene_config);
  char v9 = *((unsigned char *)&self->super._visibleRect.origin.y + OBJC_IVAR____TtC11FMFindingUI11FMPFSKScene_config);
  long long v4 = *(_OWORD *)((char *)&self->super.super.super._attributeValues + OBJC_IVAR____TtC11FMFindingUI11FMPFSKScene_config);
  v8[4] = *(_OWORD *)((char *)&self->super.super.super._keyedSubSprites
                    + OBJC_IVAR____TtC11FMFindingUI11FMPFSKScene_config);
  v8[5] = v4;
  long long v5 = *(_OWORD *)((char *)&self->super.super.super._version + OBJC_IVAR____TtC11FMFindingUI11FMPFSKScene_config);
  v8[6] = *(_OWORD *)((char *)&self->super.super.super._userData + OBJC_IVAR____TtC11FMFindingUI11FMPFSKScene_config);
  v8[7] = v5;
  long long v6 = *(_OWORD *)((char *)&self->super.super.super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC11FMFindingUI11FMPFSKScene_config);
  v8[0] = *(_OWORD *)((char *)&self->super.super.super.super.super.isa
                    + OBJC_IVAR____TtC11FMFindingUI11FMPFSKScene_config);
  v8[1] = v6;
  long long v7 = *(_OWORD *)((char *)&self->super.super.super._actions + OBJC_IVAR____TtC11FMFindingUI11FMPFSKScene_config);
  v8[2] = *(_OWORD *)((char *)&self->super.super.super._parent + OBJC_IVAR____TtC11FMFindingUI11FMPFSKScene_config);
  v8[3] = v7;
  sub_24D34B0D8((uint64_t)v8, (void (*)(void, void, void, void, void, void, void, void))sub_24D34B11C);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI11FMPFSKScene_ringView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI11FMPFSKScene_axisesNode));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI11FMPFSKScene_patternNode));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI11FMPFSKScene_motionManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI11FMPFSKScene_dotCountObservation));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI11FMPFSKScene_debugModeObservation));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI11FMPFSKScene_opacitySpring));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI11FMPFSKScene_isolationQueue));
  sub_24D2C6E6C((uint64_t)self + OBJC_IVAR____TtC11FMFindingUI11FMPFSKScene_altDelegate);
}

- (NSString)description
{
  v2 = self;
  sub_24D2FB1F8();

  long long v3 = (void *)sub_24D39CAC0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)update:(double)a3
{
  long long v4 = self;
  sub_24D348A68(a3);
}

- (CGSize)size
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FMPFSKScene();
  [(SKScene *)&v4 size];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  long long v5 = self;
  sub_24D3492D0(width, height);
}

- (_TtC11FMFindingUI11FMPFSKScene)initWithSize:(CGSize)a3
{
  CGSize result = (_TtC11FMFindingUI11FMPFSKScene *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC11FMFindingUI11FMPFSKScene)init
{
  CGSize result = (_TtC11FMFindingUI11FMPFSKScene *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end