@interface MessagesViewController
- (BOOL)_handleTextInputPayload:(id)a3 withPayloadID:(id)a4;
- (BOOL)displaysAfterAppearance;
- (CGSize)contentSizeThatFits:(CGSize)a3;
- (_TtC26GameCenterMessageExtension22MessagesViewController)initWithCoder:(id)a3;
- (_TtC26GameCenterMessageExtension22MessagesViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC26GameCenterMessageExtension22MessagesViewController)initWithShouldBeSheetPresentationControllerDelegate:(BOOL)a3;
- (void)_validateMessageForSending:(MSMessage *)a3 conversation:(MSConversation *)a4 associatedText:(NSString *)a5 completionHandler:(id)a6;
- (void)dealloc;
- (void)didCancelSendingMessage:(id)a3 conversation:(id)a4;
- (void)didDismissFullScreen;
- (void)didSelectMessage:(id)a3 conversation:(id)a4;
- (void)didStartSendingMessage:(id)a3 conversation:(id)a4;
- (void)didTransitionToPresentationStyle:(unint64_t)a3;
- (void)gameCenterViewControllerDidFinish:(id)a3;
- (void)updateCard:(id)a3;
- (void)updateSnapshotWithCompletionBlock:(id)a3;
- (void)willBecomeActiveWithConversation:(id)a3;
- (void)willResignActiveWithConversation:(id)a3;
- (void)willTransitionToPresentationStyle:(unint64_t)a3;
@end

@implementation MessagesViewController

- (void)gameCenterViewControllerDidFinish:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100035E90();
}

- (_TtC26GameCenterMessageExtension22MessagesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_100047E68();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC26GameCenterMessageExtension22MessagesViewController *)sub_10002E338(v5, v7, a4);
}

- (_TtC26GameCenterMessageExtension22MessagesViewController)initWithCoder:(id)a3
{
  return (_TtC26GameCenterMessageExtension22MessagesViewController *)sub_10002E4E4(a3);
}

- (void)willBecomeActiveWithConversation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10002E61C(v4);
}

- (void)updateSnapshotWithCompletionBlock:(id)a3
{
  id v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_100036B34(v5, (void (**)(void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)updateCard:(id)a3
{
  uint64_t v5 = self;
  id v6 = a3;
  uint64_t v7 = self;
  NSString v8 = sub_100047E38();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  v12[4] = sub_100038B90;
  v12[5] = v9;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_10001479C;
  v12[3] = &unk_10005B4A0;
  v10 = _Block_copy(v12);
  v11 = v7;
  swift_release();
  [v5 named:v8 execute:v10];
  _Block_release(v10);
}

- (BOOL)displaysAfterAppearance
{
  return 0;
}

- (void)willTransitionToPresentationStyle:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(MessagesViewController *)&v5 willTransitionToPresentationStyle:a3];
  sub_1000300DC();
}

- (void)didTransitionToPresentationStyle:(unint64_t)a3
{
  id v4 = self;
  sub_1000302BC(a3);
}

- (void)didSelectMessage:(id)a3 conversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = self;
  unint64_t v8 = (unint64_t)[(MessagesViewController *)v9 presentationStyle];
  if (v8 >= 3)
  {
    type metadata accessor for MSMessagesAppPresentationStyle(0);
    sub_100048338();
    __break(1u);
  }
  else
  {
    [(MessagesViewController *)v9 requestPresentationStyle:qword_10004CF70[v8]];
  }
}

- (void)willResignActiveWithConversation:(id)a3
{
  objc_super v5 = self;
  id v6 = a3;
  id v7 = self;
  id v8 = [v5 defaultCenter];
  [v8 removeObserver:v7];
}

- (CGSize)contentSizeThatFits:(CGSize)a3
{
  double width = a3.width;
  id v4 = self;
  double v5 = sub_1000306C4(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (void)didCancelSendingMessage:(id)a3 conversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = self;
  sub_100036D28();
}

- (void)didStartSendingMessage:(id)a3 conversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = self;
  sub_1000372EC(v7);
}

- (void)_validateMessageForSending:(MSMessage *)a3 conversation:(MSConversation *)a4 associatedText:(NSString *)a5 completionHandler:(id)a6
{
  uint64_t v11 = sub_100004714(&qword_100061D58);
  __chkstk_darwin(v11 - 8);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = sub_100047FD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_100061D68;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_100061D78;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = self;
  sub_1000341FC((uint64_t)v13, (uint64_t)&unk_100061D88, (uint64_t)v18);
  swift_release();
}

- (void)didDismissFullScreen
{
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v4 = self;
  double v5 = self;
  id v6 = [v4 defaultCenter];
  [v6 removeObserver:v5];

  v7.receiver = v5;
  v7.super_class = ObjectType;
  [(MessagesViewController *)&v7 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_playerModel));
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_currentCardState);
  id v4 = *(void **)&self->playerModel[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_currentCardState];
  unsigned __int8 v5 = self->inviteCardResizingObserver[OBJC_IVAR____TtC26GameCenterMessageExtension22MessagesViewController_currentCardState];

  sub_100038920(v3, v4, v5);
}

- (BOOL)_handleTextInputPayload:(id)a3 withPayloadID:(id)a4
{
  uint64_t v5 = sub_100047DB8();
  uint64_t v6 = sub_100047E68();
  uint64_t v8 = v7;
  double v9 = self;
  LOBYTE(v6) = sub_10003328C(v5, v6, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (_TtC26GameCenterMessageExtension22MessagesViewController)initWithShouldBeSheetPresentationControllerDelegate:(BOOL)a3
{
  CGSize result = (_TtC26GameCenterMessageExtension22MessagesViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end