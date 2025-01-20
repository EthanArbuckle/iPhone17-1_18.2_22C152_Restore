@interface EmojiScrollView
- (_TtC10StickerKit15EmojiScrollView)initWithCoder:(id)a3;
- (_TtC10StickerKit15EmojiScrollView)initWithFrame:(CGRect)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
@end

@implementation EmojiScrollView

- (_TtC10StickerKit15EmojiScrollView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(void *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC10StickerKit15EmojiScrollView_emojiDelegate) = 0;
  swift_unknownObjectWeakInit();
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for EmojiScrollView();
  v8 = -[EmojiScrollView initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
  [(EmojiScrollView *)v8 setDelegate:v8];
  return v8;
}

- (_TtC10StickerKit15EmojiScrollView)initWithCoder:(id)a3
{
  return (_TtC10StickerKit15EmojiScrollView *)sub_2452FCA18(a3);
}

- (void).cxx_destruct
{
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2452FCCB8();
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  if (MEMORY[0x2456A0530]((char *)self + OBJC_IVAR____TtC10StickerKit15EmojiScrollView_emojiDelegate, a2, (__n128)a4, *(__n128 *)&a4.y))
  {
    id v8 = a3;
    v9 = self;
    sub_2452035F8(v9, &a5->x);

    swift_unknownObjectRelease();
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  if (MEMORY[0x2456A0530]((char *)self + OBJC_IVAR____TtC10StickerKit15EmojiScrollView_emojiDelegate, a2))
  {
    id v5 = a3;
    v6 = self;
    sub_2451F8E5C();

    swift_unknownObjectRelease();
  }
}

@end