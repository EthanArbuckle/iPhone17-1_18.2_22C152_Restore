@interface RequestMessageViewController
- (CGSize)contentSizeThatFits:(CGSize)a3;
- (MSConversation)activeConversation;
- (_TtC24PeopleMessagesScreenTime28RequestMessageViewController)initWithCoder:(id)a3;
- (_TtC24PeopleMessagesScreenTime28RequestMessageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC24PeopleMessagesScreenTime28RequestMessageViewController)initWithShouldBeSheetPresentationControllerDelegate:(BOOL)a3;
- (void)dealloc;
- (void)didTransitionToPresentationStyle:(unint64_t)a3;
- (void)requestResize;
- (void)setActiveConversation:(id)a3;
- (void)willBecomeActiveWithConversation:(id)a3;
- (void)willMoveToParentViewController:(id)a3;
- (void)willResignActiveWithConversation:(id)a3;
@end

@implementation RequestMessageViewController

- (void)dealloc
{
  v2 = self;
  sub_10001C100();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  sub_10000714C((uint64_t)self + OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_eventNotifier, &qword_100039FF8);
  sub_1000129A8((uint64_t)self + OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_bubbleDelegate);

  swift_release();
}

- (MSConversation)activeConversation
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for RequestMessageViewController();
  v2 = [(RequestMessageViewController *)&v4 activeConversation];

  return v2;
}

- (void)setActiveConversation:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_100022B50((uint64_t)a3);
}

- (CGSize)contentSizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = sub_10001C59C(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.CGFloat height = v10;
  result.double width = v9;
  return result;
}

- (void)willBecomeActiveWithConversation:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10001CF74(v4);
}

- (void)willMoveToParentViewController:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_10001E658(a3);
}

- (void)willResignActiveWithConversation:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10001EA54((uint64_t)v4);
}

- (void)didTransitionToPresentationStyle:(unint64_t)a3
{
  id v4 = self;
  sub_10001EB80(a3);
}

- (_TtC24PeopleMessagesScreenTime28RequestMessageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_10002A890();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC24PeopleMessagesScreenTime28RequestMessageViewController *)sub_10001F384(v5, v7, a4);
}

- (_TtC24PeopleMessagesScreenTime28RequestMessageViewController)initWithCoder:(id)a3
{
  return (_TtC24PeopleMessagesScreenTime28RequestMessageViewController *)sub_10001F698(a3);
}

- (_TtC24PeopleMessagesScreenTime28RequestMessageViewController)initWithShouldBeSheetPresentationControllerDelegate:(BOOL)a3
{
  return (_TtC24PeopleMessagesScreenTime28RequestMessageViewController *)sub_10001F938(a3);
}

- (void)requestResize
{
  v2 = (char *)self + OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_cachedSizeInfo;
  *(_OWORD *)v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  v2[32] = 1;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RequestMessageViewController();
  [(RequestMessageViewController *)&v3 requestResize];
}

@end