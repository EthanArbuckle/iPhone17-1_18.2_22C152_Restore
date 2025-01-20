@interface StickerPhotosCoordinator
- (_TtC10StickerKit24StickerPhotosCoordinator)init;
- (void)dealloc;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)presentationControllerWillDismiss:(id)a3;
@end

@implementation StickerPhotosCoordinator

- (_TtC10StickerKit24StickerPhotosCoordinator)init
{
  return (_TtC10StickerKit24StickerPhotosCoordinator *)sub_2452BF2CC();
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10StickerKit24StickerPhotosCoordinator_picker);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10StickerKit24StickerPhotosCoordinator_picker) = 0;
  v3 = self;

  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for StickerPhotosCoordinator();
  [(StickerPhotosCoordinator *)&v4 dealloc];
}

- (void).cxx_destruct
{
  sub_245203A28((uint64_t)self + OBJC_IVAR____TtC10StickerKit24StickerPhotosCoordinator_delegate);
  v3 = (char *)self + OBJC_IVAR____TtC10StickerKit24StickerPhotosCoordinator_analyticsCancelState;
  uint64_t v4 = sub_2453FCDE8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
}

- (void)presentationControllerWillDismiss:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2452C394C();
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2452C3A18();
}

@end