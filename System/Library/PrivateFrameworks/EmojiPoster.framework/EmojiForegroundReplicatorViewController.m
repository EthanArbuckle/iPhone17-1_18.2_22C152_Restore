@interface EmojiForegroundReplicatorViewController
- (_TtC11EmojiPoster39EmojiForegroundReplicatorViewController)initWithCoder:(id)a3;
- (_TtC11EmojiPoster39EmojiForegroundReplicatorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)adjustScaleWithGesture:(id)a3;
- (void)viewDidLoad;
@end

@implementation EmojiForegroundReplicatorViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_20B8F9694();
}

- (void)adjustScaleWithGesture:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_20B8FA2F4(v4);
}

- (_TtC11EmojiPoster39EmojiForegroundReplicatorViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC11EmojiPoster39EmojiForegroundReplicatorViewController *)EmojiForegroundReplicatorViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC11EmojiPoster39EmojiForegroundReplicatorViewController)initWithCoder:(id)a3
{
  return (_TtC11EmojiPoster39EmojiForegroundReplicatorViewController *)EmojiForegroundReplicatorViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster39EmojiForegroundReplicatorViewController_emojiLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster39EmojiForegroundReplicatorViewController_secondaryEmojiLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster39EmojiForegroundReplicatorViewController_horizontalReplicatorLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster39EmojiForegroundReplicatorViewController_offsetHorizontalReplicatorLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster39EmojiForegroundReplicatorViewController_verticalReplicatorLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster39EmojiForegroundReplicatorViewController_offsetVerticalReplicatorLayer));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11EmojiPoster39EmojiForegroundReplicatorViewController_pinchGestureRecognizer);
}

@end