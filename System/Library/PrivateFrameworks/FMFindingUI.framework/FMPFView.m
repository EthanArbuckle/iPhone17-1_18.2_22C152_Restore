@interface FMPFView
- (NSString)description;
- (_TtC11FMFindingUI8FMPFView)initWithCoder:(id)a3;
- (_TtC11FMFindingUI8FMPFView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)renderer:(id)a3 didAddNode:(id)a4 forAnchor:(id)a5;
- (void)renderer:(id)a3 didRemoveNode:(id)a4 forAnchor:(id)a5;
- (void)renderer:(id)a3 didRenderScene:(id)a4 atTime:(double)a5;
- (void)renderer:(id)a3 didUpdateNode:(id)a4 forAnchor:(id)a5;
- (void)renderer:(id)a3 updateAtTime:(double)a4;
- (void)renderer:(id)a3 willRenderScene:(id)a4 atTime:(double)a5;
- (void)session:(id)a3 didFailWithError:(id)a4;
- (void)session:(id)a3 didUpdateFrame:(id)a4;
- (void)thermalStateDidChangeWithNotification:(id)a3;
@end

@implementation FMPFView

- (void)renderer:(id)a3 updateAtTime:(double)a4
{
  v6 = (char *)self + OBJC_IVAR____TtC11FMFindingUI8FMPFView_fmpfdelegate;
  if (MEMORY[0x253326120]((char *)self + OBJC_IVAR____TtC11FMFindingUI8FMPFView_fmpfdelegate, a2))
  {
    uint64_t v7 = *((void *)v6 + 1);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(id, uint64_t, uint64_t, double))(v7 + 56))(a3, ObjectType, v7, a4);
    swift_unknownObjectRelease();
  }
}

- (void)renderer:(id)a3 willRenderScene:(id)a4 atTime:(double)a5
{
  v8 = (char *)self + OBJC_IVAR____TtC11FMFindingUI8FMPFView_fmpfdelegate;
  if (MEMORY[0x253326120]((char *)self + OBJC_IVAR____TtC11FMFindingUI8FMPFView_fmpfdelegate, a2))
  {
    uint64_t v9 = *((void *)v8 + 1);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(id, id, uint64_t, uint64_t, double))(v9 + 48))(a3, a4, ObjectType, v9, a5);
    swift_unknownObjectRelease();
  }
}

- (void)renderer:(id)a3 didRenderScene:(id)a4 atTime:(double)a5
{
  v8 = (char *)self + OBJC_IVAR____TtC11FMFindingUI8FMPFView_fmpfdelegate;
  if (MEMORY[0x253326120]((char *)self + OBJC_IVAR____TtC11FMFindingUI8FMPFView_fmpfdelegate, a2))
  {
    uint64_t v9 = *((void *)v8 + 1);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(id, id, uint64_t, uint64_t, double))(v9 + 64))(a3, a4, ObjectType, v9, a5);
    swift_unknownObjectRelease();
  }
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_24D30E7DC((uint64_t)v6, v7);
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v7 = (char *)self + OBJC_IVAR____TtC11FMFindingUI8FMPFView_fmpfdelegate;
  if (MEMORY[0x253326120]((char *)self + OBJC_IVAR____TtC11FMFindingUI8FMPFView_fmpfdelegate, a2))
  {
    uint64_t v8 = *((void *)v7 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v10 = *(void (**)(id, id, uint64_t, uint64_t))(v8 + 16);
    id v11 = a3;
    id v12 = a4;
    v13 = self;
    v10(v11, v12, ObjectType, v8);

    swift_unknownObjectRelease();
  }
}

- (void)renderer:(id)a3 didAddNode:(id)a4 forAnchor:(id)a5
{
  uint64_t v8 = (char *)self + OBJC_IVAR____TtC11FMFindingUI8FMPFView_fmpfdelegate;
  if (MEMORY[0x253326120]((char *)self + OBJC_IVAR____TtC11FMFindingUI8FMPFView_fmpfdelegate, a2))
  {
    uint64_t v9 = *((void *)v8 + 1);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(id, id, id, uint64_t, uint64_t))(v9 + 24))(a3, a4, a5, ObjectType, v9);
    swift_unknownObjectRelease();
  }
}

- (void)renderer:(id)a3 didUpdateNode:(id)a4 forAnchor:(id)a5
{
  uint64_t v8 = (char *)self + OBJC_IVAR____TtC11FMFindingUI8FMPFView_fmpfdelegate;
  if (MEMORY[0x253326120]((char *)self + OBJC_IVAR____TtC11FMFindingUI8FMPFView_fmpfdelegate, a2))
  {
    uint64_t v9 = *((void *)v8 + 1);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(id, id, id, uint64_t, uint64_t))(v9 + 32))(a3, a4, a5, ObjectType, v9);
    swift_unknownObjectRelease();
  }
}

- (void)renderer:(id)a3 didRemoveNode:(id)a4 forAnchor:(id)a5
{
  uint64_t v8 = (char *)self + OBJC_IVAR____TtC11FMFindingUI8FMPFView_fmpfdelegate;
  if (MEMORY[0x253326120]((char *)self + OBJC_IVAR____TtC11FMFindingUI8FMPFView_fmpfdelegate, a2))
  {
    uint64_t v9 = *((void *)v8 + 1);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(id, id, id, uint64_t, uint64_t))(v9 + 40))(a3, a4, a5, ObjectType, v9);
    swift_unknownObjectRelease();
  }
}

- (_TtC11FMFindingUI8FMPFView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_24D36263C();
}

- (NSString)description
{
  v2 = self;
  sub_24D2FB1F8();

  id v3 = (void *)sub_24D39CAC0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)dealloc
{
  v2 = self;
  sub_24D36020C();
}

- (void).cxx_destruct
{
  sub_24D2C05AC((uint64_t)self + OBJC_IVAR____TtC11FMFindingUI8FMPFView_config, (uint64_t)v5, &qword_269862930);
  sub_24D362B38((uint64_t)v5, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_24D362BAC);

  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11FMFindingUI8FMPFView_backdropRGBAColorSprings);
  v4 = *(void **)((char *)&self->super.super._responderFlags
                + OBJC_IVAR____TtC11FMFindingUI8FMPFView_backdropRGBAColorSprings);
  objc_release(*(id *)((char *)&self->super.super.__layeringSceneIdentity
                     + OBJC_IVAR____TtC11FMFindingUI8FMPFView_backdropRGBAColorSprings));

  swift_release();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  sub_24D2C6E6C((uint64_t)self + OBJC_IVAR____TtC11FMFindingUI8FMPFView_fmpfdelegate);
}

- (void)thermalStateDidChangeWithNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24D361890(v4);
}

- (_TtC11FMFindingUI8FMPFView)initWithFrame:(CGRect)a3
{
  result = (_TtC11FMFindingUI8FMPFView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end