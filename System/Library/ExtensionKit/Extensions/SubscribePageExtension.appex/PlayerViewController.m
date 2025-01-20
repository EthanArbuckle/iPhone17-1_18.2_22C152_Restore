@interface PlayerViewController
- (UIViewController)presentingViewController;
- (_TtC22SubscribePageExtension20PlayerViewController)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension20PlayerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC22SubscribePageExtension20PlayerViewController)initWithPlayerLayerView:(id)a3;
- (void)dealloc;
- (void)playerItemDidPlayToEndWithNotification:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PlayerViewController

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = [v3 defaultCenter];
  [v5 removeObserver:v4];

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for PlayerViewController();
  [(PlayerViewController *)&v6 dealloc];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PlayerViewController();
  id v4 = v6.receiver;
  [(PlayerViewController *)&v6 viewDidAppear:v3];
  if (*((unsigned char *)v4 + OBJC_IVAR____TtC22SubscribePageExtension20PlayerViewController_autoplay) == 1)
  {
    id v5 = objc_msgSend(v4, "player", v6.receiver, v6.super_class);
    [v5 play];

    id v4 = v5;
  }
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100755220();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PlayerViewController();
  id v4 = v6.receiver;
  [(PlayerViewController *)&v6 viewWillDisappear:v3];
  id v5 = objc_msgSend(v4, "player", v6.receiver, v6.super_class);
  [v5 pause];
}

- (void)playerItemDidPlayToEndWithNotification:(id)a3
{
  uint64_t v4 = sub_100755B70();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (char *)&v9 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100755B40();
  if (*((unsigned char *)&self->super.super.super.super.isa
       + OBJC_IVAR____TtC22SubscribePageExtension20PlayerViewController_shouldDismissWhenPlaysToEnd) == 1)
    [(PlayerViewController *)self dismissViewControllerAnimated:1 completion:0];
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (UIViewController)presentingViewController
{
  if (*((unsigned char *)&self->super.super.super.super.isa
       + OBJC_IVAR____TtC22SubscribePageExtension20PlayerViewController_alwaysShowDoneButton) == 1)
  {
    v2 = (UIViewController *)[(PlayerViewController *)self parentViewController];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)type metadata accessor for PlayerViewController();
    v2 = [(PlayerViewController *)&v5 presentingViewController];
  }
  BOOL v3 = v2;

  return v3;
}

- (_TtC22SubscribePageExtension20PlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_1007675F0();
    *((unsigned char *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC22SubscribePageExtension20PlayerViewController_autoplay) = 0;
    *((unsigned char *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC22SubscribePageExtension20PlayerViewController_shouldDismissWhenPlaysToEnd) = 1;
    *((unsigned char *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC22SubscribePageExtension20PlayerViewController_alwaysShowDoneButton) = 0;
    id v6 = a4;
    NSString v7 = sub_1007675C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    *((unsigned char *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC22SubscribePageExtension20PlayerViewController_autoplay) = 0;
    *((unsigned char *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC22SubscribePageExtension20PlayerViewController_shouldDismissWhenPlaysToEnd) = 1;
    *((unsigned char *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC22SubscribePageExtension20PlayerViewController_alwaysShowDoneButton) = 0;
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for PlayerViewController();
  uint64_t v9 = [(PlayerViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC22SubscribePageExtension20PlayerViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension20PlayerViewController_autoplay) = 0;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtension20PlayerViewController_shouldDismissWhenPlaysToEnd) = 1;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtension20PlayerViewController_alwaysShowDoneButton) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PlayerViewController();
  return [(PlayerViewController *)&v5 initWithCoder:a3];
}

- (_TtC22SubscribePageExtension20PlayerViewController)initWithPlayerLayerView:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension20PlayerViewController_autoplay) = 0;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtension20PlayerViewController_shouldDismissWhenPlaysToEnd) = 1;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtension20PlayerViewController_alwaysShowDoneButton) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PlayerViewController();
  return [(PlayerViewController *)&v5 initWithPlayerLayerView:a3];
}

@end