@interface CategoryKeyView
- (_TtC10StickerKit15CategoryKeyView)init;
- (void)dealloc;
- (void)setEmojiKeyManager:(id)a3;
- (void)updateToIndexPath:(id)a3;
@end

@implementation CategoryKeyView

- (void)setEmojiKeyManager:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10StickerKit15CategoryKeyView__emojiKeyManager) = (Class)a3;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
}

- (_TtC10StickerKit15CategoryKeyView)init
{
  return (_TtC10StickerKit15CategoryKeyView *)sub_24539BF74();
}

- (void)dealloc
{
  v2 = self;
  sub_24539C440();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  swift_release();
}

- (void)updateToIndexPath:(id)a3
{
  uint64_t v4 = sub_2453FCDC8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2453FCD68();
  v8 = self;
  sub_24539C58C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end