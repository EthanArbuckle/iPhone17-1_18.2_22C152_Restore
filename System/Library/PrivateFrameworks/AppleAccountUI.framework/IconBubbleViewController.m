@interface IconBubbleViewController
- (CGSize)preferredContentSize;
- (_TtC14AppleAccountUI24IconBubbleViewController)initWithCoder:(id)a3;
- (_TtC14AppleAccountUI24IconBubbleViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)AAUIMicaPlayerDidChangePlaybackTime:(id)a3;
- (void)loadView;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation IconBubbleViewController

- (_TtC14AppleAccountUI24IconBubbleViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20985C7D0();
}

- (void)loadView
{
  v2 = self;
  sub_20985C9E4();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_20985CA98();
}

- (CGSize)preferredContentSize
{
  v2 = self;
  double v7 = sub_20985D2E0();
  double v8 = v3;

  double v4 = v7;
  double v5 = v8;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double v3 = self;
  sub_20985D388(a3.width, a3.height);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_20985D418();
}

- (_TtC14AppleAccountUI24IconBubbleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a3;
  id v5 = a4;
  if (a3)
  {
    sub_2098BF368();
  }
  return (_TtC14AppleAccountUI24IconBubbleViewController *)sub_2098607C8();
}

- (void).cxx_destruct
{
  sub_2097ECA5C((id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14AppleAccountUI24IconBubbleViewController_contentView));
  sub_2097ECA5C((id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14AppleAccountUI24IconBubbleViewController_player));
  sub_2097ECA5C((id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14AppleAccountUI24IconBubbleViewController_memojiWrapperLayer));
  sub_2097ECA5C((id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14AppleAccountUI24IconBubbleViewController_memojiContainerLayer));
  sub_2097ECA5C((id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14AppleAccountUI24IconBubbleViewController_memojiLayer));
  sub_2097ECA5C((id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14AppleAccountUI24IconBubbleViewController_logoLayer));
  sub_2097ECA5C((id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14AppleAccountUI24IconBubbleViewController_logoFillLayer));
  sub_20981227C();
  sub_20981227C();
  sub_2097FFA54();
}

- (void)AAUIMicaPlayerDidChangePlaybackTime:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_209860AE8(a3);
}

@end