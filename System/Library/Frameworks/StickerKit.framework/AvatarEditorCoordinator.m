@interface AvatarEditorCoordinator
- (_TtC10StickerKit23AvatarEditorCoordinator)init;
- (void)avatarPicker:(id)a3 didSelectAvatarRecord:(id)a4;
- (void)dismissAvatarUIControllerWithIdentifier:(id)a3 animated:(BOOL)a4;
- (void)presentAvatarUIController:(id)a3 animated:(BOOL)a4;
@end

@implementation AvatarEditorCoordinator

- (void)avatarPicker:(id)a3 didSelectAvatarRecord:(id)a4
{
  if (a4 && MEMORY[0x2456A0530]((char *)self + OBJC_IVAR____TtC10StickerKit23AvatarEditorCoordinator_delegate, a2))
  {
    swift_unknownObjectRetain_n();
    swift_unknownObjectRetain();
    v6 = self;
    id v7 = objc_msgSend(a4, sel_identifier);
    uint64_t v8 = sub_2453FFB38();
    unint64_t v10 = v9;

    sub_245248148(v8, v10);
    swift_unknownObjectRelease();

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease_n();
    swift_unknownObjectRelease();
  }
}

- (void)presentAvatarUIController:(id)a3 animated:(BOOL)a4
{
  if (MEMORY[0x2456A0530]((char *)self + OBJC_IVAR____TtC10StickerKit23AvatarEditorCoordinator_delegate, a2, a3, a4))
  {
    id v6 = a3;
    id v7 = self;
    sub_2452482F0(v6);

    swift_unknownObjectRelease();
  }
}

- (void)dismissAvatarUIControllerWithIdentifier:(id)a3 animated:(BOOL)a4
{
  if (a3)
  {
    v5 = (void *)sub_2453FFB38();
    uint64_t v7 = v6;
  }
  else
  {
    v5 = 0;
    uint64_t v7 = 0;
  }
  if (MEMORY[0x2456A0530]((char *)self + OBJC_IVAR____TtC10StickerKit23AvatarEditorCoordinator_delegate))
  {
    uint64_t v8 = self;
    sub_245248660(v5, v7);

    swift_unknownObjectRelease();
  }

  swift_bridgeObjectRelease();
}

- (_TtC10StickerKit23AvatarEditorCoordinator)init
{
  *(void *)&self->delegate[OBJC_IVAR____TtC10StickerKit23AvatarEditorCoordinator_delegate] = 0;
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AvatarEditorCoordinator();
  return [(AvatarEditorCoordinator *)&v4 init];
}

- (void).cxx_destruct
{
}

@end