@interface EmojiGreyscaleReplicatorViewController
- (_TtC11EmojiPoster38EmojiGreyscaleReplicatorViewController)initWithCoder:(id)a3;
- (_TtC11EmojiPoster38EmojiGreyscaleReplicatorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)adjustScaleWithGesture:(id)a3;
- (void)viewDidLoad;
@end

@implementation EmojiGreyscaleReplicatorViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_20B924D30();
}

- (void)adjustScaleWithGesture:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_20B925CF0(v4);
}

- (_TtC11EmojiPoster38EmojiGreyscaleReplicatorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_20B926948();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC11EmojiPoster38EmojiGreyscaleReplicatorViewController *)EmojiGreyscaleReplicatorViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC11EmojiPoster38EmojiGreyscaleReplicatorViewController)initWithCoder:(id)a3
{
  return (_TtC11EmojiPoster38EmojiGreyscaleReplicatorViewController *)EmojiGreyscaleReplicatorViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster38EmojiGreyscaleReplicatorViewController_emojiLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster38EmojiGreyscaleReplicatorViewController_secondaryEmojiLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster38EmojiGreyscaleReplicatorViewController_horizontalReplicatorLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster38EmojiGreyscaleReplicatorViewController_offsetHorizontalReplicatorLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster38EmojiGreyscaleReplicatorViewController_verticalReplicatorLayer));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11EmojiPoster38EmojiGreyscaleReplicatorViewController_offsetVerticalReplicatorLayer);
}

@end