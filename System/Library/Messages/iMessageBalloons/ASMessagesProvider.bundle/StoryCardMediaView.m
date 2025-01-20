@interface StoryCardMediaView
- (_TtC18ASMessagesProvider18StoryCardMediaView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider18StoryCardMediaView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation StoryCardMediaView

- (_TtC18ASMessagesProvider18StoryCardMediaView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider18StoryCardMediaView *)sub_50A788(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider18StoryCardMediaView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_50C118();
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  [(StoryCardMediaView *)&v5 layoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC18ASMessagesProvider18StoryCardMediaView_revealingImageView];
  objc_msgSend(v2, "bounds", v5.receiver, v5.super_class);
  objc_msgSend(v3, "setFrame:");
  v4 = *(void **)&v2[OBJC_IVAR____TtC18ASMessagesProvider18StoryCardMediaView_revealingVideoView];
  [v2 bounds];
  objc_msgSend(v4, "setFrame:");
}

- (void).cxx_destruct
{
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider18StoryCardMediaView_pageGrid, (uint64_t *)&unk_95C520);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider18StoryCardMediaView_revealingImageView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider18StoryCardMediaView_revealingVideoView);
}

@end