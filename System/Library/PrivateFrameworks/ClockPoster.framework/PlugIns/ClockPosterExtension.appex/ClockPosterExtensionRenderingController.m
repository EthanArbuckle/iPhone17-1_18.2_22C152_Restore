@interface ClockPosterExtensionRenderingController
- (_TtC20ClockPosterExtension39ClockPosterExtensionRenderingController)init;
- (void)renderer:(id)a3 didInitializeWithEnvironment:(id)a4;
- (void)renderer:(id)a3 didReceiveTapAtPoint:(CGPoint)a4;
- (void)renderer:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5;
- (void)rendererDidInvalidate:(id)a3;
@end

@implementation ClockPosterExtensionRenderingController

- (void)renderer:(id)a3 didInitializeWithEnvironment:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  sub_100007414(v6, (uint64_t)a4);

  swift_unknownObjectRelease();
}

- (void)renderer:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5
{
  if (*(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC20ClockPosterExtension30ClockPosterExtensionController_clockFaceController))
  {
    id v8 = a3;
    swift_unknownObjectRetain();
    id v9 = a5;
    v10 = self;
    swift_retain();
    sub_100007D48();
    sub_10000C928();
    swift_release();
    swift_getObjectType();
    sub_10000B604((char *)a4, (char *)v10);

    swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

- (void)rendererDidInvalidate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000C188(&OBJC_IVAR____TtC20ClockPosterExtension39ClockPosterExtensionRenderingController_renderer);
}

- (void)renderer:(id)a3 didReceiveTapAtPoint:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  uint64_t v8 = sub_10000576C(&qword_100016828);
  __chkstk_darwin(v8 - 8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10000CD08();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  uint64_t v12 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_10000CCE8();
  id v13 = a3;
  v14 = self;
  swift_retain();
  uint64_t v15 = sub_10000CCD8();
  v16 = (CGFloat *)swift_allocObject();
  *((void *)v16 + 2) = v15;
  *((void *)v16 + 3) = &protocol witness table for MainActor;
  *((void *)v16 + 4) = v12;
  v16[5] = x;
  v16[6] = y;
  swift_release();
  sub_100007A10((uint64_t)v10, (uint64_t)&unk_100016838, (uint64_t)v16);

  swift_release();
}

- (_TtC20ClockPosterExtension39ClockPosterExtensionRenderingController)init
{
  return (_TtC20ClockPosterExtension39ClockPosterExtensionRenderingController *)sub_100009C40((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC20ClockPosterExtension39ClockPosterExtensionRenderingController_renderer, type metadata accessor for ClockPosterExtensionRenderingController);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC20ClockPosterExtension39ClockPosterExtensionRenderingController_renderer));
}

@end