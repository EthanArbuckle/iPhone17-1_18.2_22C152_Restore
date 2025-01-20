@interface MessagesViewController
- (BOOL)displaysAfterAppearance;
- (CGSize)contentSizeThatFits:(CGSize)a3;
- (_TtC28InviteMessageBubbleExtension22MessagesViewController)initWithCoder:(id)a3;
- (_TtC28InviteMessageBubbleExtension22MessagesViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC28InviteMessageBubbleExtension22MessagesViewController)initWithShouldBeSheetPresentationControllerDelegate:(BOOL)a3;
- (void)handleFamilyDidUpdate;
- (void)updateSnapshotWithCompletionBlock:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)willBecomeActiveWithConversation:(id)a3;
@end

@implementation MessagesViewController

- (CGSize)contentSizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  sub_1000035B4(width);
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.double width = v9;
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_100003C38(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_100003E44(a3);
}

- (void)willBecomeActiveWithConversation:(id)a3
{
  id v5 = a3;
  v4 = self;
  sub_100004048(v5);
}

- (void)updateSnapshotWithCompletionBlock:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  id v5 = self;
  sub_100007D38(v5, (void (**)(void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (BOOL)displaysAfterAppearance
{
  uint64_t v3 = sub_100006E88(&qword_10003C818);
  __chkstk_darwin(v3 - 8);
  id v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v6 = (char *)self + OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_inviteMessageDetails;
  swift_beginAccess();
  sub_100007AE0((uint64_t)v6, (uint64_t)v5, &qword_10003C818);
  uint64_t v7 = type metadata accessor for InviteMessageDetails();
  LOBYTE(v6) = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v5, 1, v7) != 1;
  sub_100008414((uint64_t)v5, &qword_10003C818);
  return (char)v6;
}

- (void)handleFamilyDidUpdate
{
  v2 = self;
  sub_100006268();
}

- (_TtC28InviteMessageBubbleExtension22MessagesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_100030C60();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC28InviteMessageBubbleExtension22MessagesViewController *)sub_10000664C(v5, v7, a4);
}

- (_TtC28InviteMessageBubbleExtension22MessagesViewController)initWithCoder:(id)a3
{
  return (_TtC28InviteMessageBubbleExtension22MessagesViewController *)sub_100006844(a3);
}

- (_TtC28InviteMessageBubbleExtension22MessagesViewController)initWithShouldBeSheetPresentationControllerDelegate:(BOOL)a3
{
  return (_TtC28InviteMessageBubbleExtension22MessagesViewController *)sub_1000069C8(a3);
}

- (void).cxx_destruct
{
  sub_100008804((uint64_t)self + OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_familyFetcher);
  swift_bridgeObjectRelease();
  sub_100008414((uint64_t)self + OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_urlComponents, &qword_10003C820);
  sub_100008414((uint64_t)self + OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_inviteMessageDetails, &qword_10003C818);
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC28InviteMessageBubbleExtension22MessagesViewController_bubbleViewControler);
}

@end