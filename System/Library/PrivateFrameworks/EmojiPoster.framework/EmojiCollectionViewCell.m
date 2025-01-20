@interface EmojiCollectionViewCell
- (_TtC11EmojiPoster23EmojiCollectionViewCell)initWithCoder:(id)a3;
- (_TtC11EmojiPoster23EmojiCollectionViewCell)initWithFrame:(CGRect)a3;
@end

@implementation EmojiCollectionViewCell

- (_TtC11EmojiPoster23EmojiCollectionViewCell)initWithCoder:(id)a3
{
  return (_TtC11EmojiPoster23EmojiCollectionViewCell *)sub_20B906834(a3);
}

- (_TtC11EmojiPoster23EmojiCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = OBJC_IVAR____TtC11EmojiPoster23EmojiCollectionViewCell_emojiView;
  id v9 = objc_allocWithZone(MEMORY[0x263F828E0]);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v8) = (Class)objc_msgSend(v9, sel_init);

  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for EmojiCollectionViewCell();
  v11 = -[EmojiCollectionViewCell initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  sub_20B9069CC();

  return v11;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster23EmojiCollectionViewCell_emojiView));
}

@end