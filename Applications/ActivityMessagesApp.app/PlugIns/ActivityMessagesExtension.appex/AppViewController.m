@interface AppViewController
- (CGSize)contentSizeThatFits:(CGSize)a3;
- (_TtC25ActivityMessagesExtension17AppViewController)initWithCoder:(id)a3;
- (_TtC25ActivityMessagesExtension17AppViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC25ActivityMessagesExtension17AppViewController)initWithShouldBeSheetPresentationControllerDelegate:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)willBecomeActiveWithConversation:(id)a3;
@end

@implementation AppViewController

- (void)willBecomeActiveWithConversation:(id)a3
{
  id with = a3;
  v4 = self;
  AppViewController.willBecomeActive(with:)((MSConversation)with);
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AppViewController();
  id v2 = v6.receiver;
  [(AppViewController *)&v6 viewDidLoad];
  id v3 = [v2 view];
  if (v3)
  {
    v4 = v3;
    id v5 = [self clearColor];
    [v4 setBackgroundColor:v5];
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidLayoutSubviews
{
  id v2 = self;
  AppViewController.viewDidLayoutSubviews()();
}

- (CGSize)contentSizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v5 = self;
  CGSize v6 = AppViewController.contentSizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  double v7 = v6.width;
  double v8 = v6.height;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (_TtC25ActivityMessagesExtension17AppViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_100014FB8();
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC25ActivityMessagesExtension17AppViewController_bubbleView) = 0;
    id v6 = a4;
    NSString v7 = sub_100014F88();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC25ActivityMessagesExtension17AppViewController_bubbleView) = 0;
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for AppViewController();
  v9 = [(AppViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC25ActivityMessagesExtension17AppViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC25ActivityMessagesExtension17AppViewController_bubbleView) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AppViewController();
  return [(AppViewController *)&v5 initWithCoder:a3];
}

- (_TtC25ActivityMessagesExtension17AppViewController)initWithShouldBeSheetPresentationControllerDelegate:(BOOL)a3
{
  BOOL v3 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC25ActivityMessagesExtension17AppViewController_bubbleView) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AppViewController();
  return [(AppViewController *)&v5 initWithShouldBeSheetPresentationControllerDelegate:v3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC25ActivityMessagesExtension17AppViewController_bubbleView));
}

@end