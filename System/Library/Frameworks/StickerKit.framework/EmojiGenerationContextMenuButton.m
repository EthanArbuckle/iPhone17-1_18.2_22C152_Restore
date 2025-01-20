@interface EmojiGenerationContextMenuButton
- (_TtC10StickerKit32EmojiGenerationContextMenuButton)initWithCoder:(id)a3;
- (_TtC10StickerKit32EmojiGenerationContextMenuButton)initWithFrame:(CGRect)a3;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
@end

@implementation EmojiGenerationContextMenuButton

- (_TtC10StickerKit32EmojiGenerationContextMenuButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(void *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC10StickerKit32EmojiGenerationContextMenuButton_delegate) = 0;
  swift_unknownObjectWeakInit();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for EmojiGenerationContextMenuButton();
  return -[EmojiGenerationContextMenuButton initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
}

- (_TtC10StickerKit32EmojiGenerationContextMenuButton)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC10StickerKit32EmojiGenerationContextMenuButton_delegate) = 0;
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC10StickerKit32EmojiGenerationContextMenuButton *)sub_2454009B8();
  __break(1u);
  return result;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  objc_super v9 = self;
  sub_24520F2CC();

  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
}

@end