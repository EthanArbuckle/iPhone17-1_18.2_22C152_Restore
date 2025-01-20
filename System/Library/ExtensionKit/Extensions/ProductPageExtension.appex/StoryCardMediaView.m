@interface StoryCardMediaView
- (_TtC20ProductPageExtension18StoryCardMediaView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension18StoryCardMediaView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation StoryCardMediaView

- (_TtC20ProductPageExtension18StoryCardMediaView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension18StoryCardMediaView *)sub_10027C8DC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension18StoryCardMediaView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10027EE84();
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  [(StoryCardMediaView *)&v5 layoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC20ProductPageExtension18StoryCardMediaView_revealingImageView];
  objc_msgSend(v2, "bounds", v5.receiver, v5.super_class);
  objc_msgSend(v3, "setFrame:");
  v4 = *(void **)&v2[OBJC_IVAR____TtC20ProductPageExtension18StoryCardMediaView_revealingVideoView];
  [v2 bounds];
  objc_msgSend(v4, "setFrame:");
}

- (void).cxx_destruct
{
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension18StoryCardMediaView_pageGrid, &qword_100955830);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension18StoryCardMediaView_revealingImageView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension18StoryCardMediaView_revealingVideoView);
}

@end