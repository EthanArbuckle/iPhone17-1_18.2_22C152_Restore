@interface StickerPhotosController
- (_TtC22StickersUltraExtension23StickerPhotosController)init;
- (void)dealloc;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)presentationControllerWillDismiss:(id)a3;
@end

@implementation StickerPhotosController

- (_TtC22StickersUltraExtension23StickerPhotosController)init
{
  return (_TtC22StickersUltraExtension23StickerPhotosController *)sub_100037D58();
}

- (void)dealloc
{
  v3 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC22StickersUltraExtension23StickerPhotosController_picker);
  swift_beginAccess();
  v4 = *v3;
  *v3 = 0;
  v5 = self;

  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for StickerPhotosController();
  [(StickerPhotosController *)&v6 dealloc];
}

- (void).cxx_destruct
{
  sub_10000A38C((uint64_t)self + OBJC_IVAR____TtC22StickersUltraExtension23StickerPhotosController_delegate);
  v3 = (char *)self + OBJC_IVAR____TtC22StickersUltraExtension23StickerPhotosController_analyticsCancelState;
  uint64_t v4 = sub_100079020();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension23StickerPhotosController_picker));

  swift_bridgeObjectRelease();
}

- (void)presentationControllerWillDismiss:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100039BC8();
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x78);
  id v5 = a3;
  v9 = self;
  if (v4())
  {
    uint64_t v7 = v6;
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(_TtC22StickersUltraExtension23StickerPhotosController *, uint64_t, uint64_t))(v7 + 8))(v9, ObjectType, v7);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

@end