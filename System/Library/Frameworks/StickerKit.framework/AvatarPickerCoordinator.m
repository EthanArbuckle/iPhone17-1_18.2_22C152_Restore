@interface AvatarPickerCoordinator
- (_TtC10StickerKit23AvatarPickerCoordinator)init;
- (void)avatarPicker:(id)a3 didSelectAvatarRecord:(id)a4;
- (void)dismissAvatarUIControllerWithIdentifier:(id)a3 animated:(BOOL)a4;
- (void)presentAvatarUIController:(id)a3 animated:(BOOL)a4;
@end

@implementation AvatarPickerCoordinator

- (void)avatarPicker:(id)a3 didSelectAvatarRecord:(id)a4
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v6 = self;
  sub_24531F9C8(a4);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)presentAvatarUIController:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_24531E7B8((uint64_t)v6, a4);
}

- (void)dismissAvatarUIControllerWithIdentifier:(id)a3 animated:(BOOL)a4
{
  if (a3)
  {
    uint64_t v6 = sub_2453FFB38();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  v9 = self;
  sub_24531E994(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (_TtC10StickerKit23AvatarPickerCoordinator)init
{
  result = (_TtC10StickerKit23AvatarPickerCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end