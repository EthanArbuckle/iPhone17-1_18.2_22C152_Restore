@interface FindMyMessagesAppViewController
- (BOOL)displaysAfterAppearance;
- (CGSize)contentSizeThatFits:(CGSize)a3;
- (UINavigationItem)navigationItem;
- (_TtC17FindMyMessagesApp31FindMyMessagesAppViewController)initWithCoder:(id)a3;
- (_TtC17FindMyMessagesApp31FindMyMessagesAppViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC17FindMyMessagesApp31FindMyMessagesAppViewController)initWithShouldBeSheetPresentationControllerDelegate:(BOOL)a3;
- (id)contentScrollViewForEdge:(unint64_t)a3;
- (void)_validateMessageForSending:(MSMessage *)a3 conversation:(MSConversation *)a4 associatedText:(NSString *)a5 completionHandler:(id)a6;
- (void)dealloc;
- (void)didBecomeActiveWithConversation:(id)a3;
- (void)didCancelSendingMessage:(id)a3 conversation:(id)a4;
- (void)didReceiveMessage:(id)a3 conversation:(id)a4;
- (void)didResignActiveWithConversation:(id)a3;
- (void)didStartSendingMessage:(id)a3 conversation:(id)a4;
- (void)didTransitionToPresentationStyle:(unint64_t)a3;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)sceneDidDisconnectWithNotification:(id)a3;
- (void)sceneDidEnterBackgroundWithNotification:(id)a3;
- (void)sceneWillEnterForegroundWithNotification:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willBecomeActiveWithConversation:(id)a3;
- (void)willTransitionToPresentationStyle:(unint64_t)a3;
@end

@implementation FindMyMessagesAppViewController

- (void)dealloc
{
  v2 = self;
  FindMyMessagesAppViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC17FindMyMessagesApp31FindMyMessagesAppViewController_hostingViewController);
}

- (void)sceneWillEnterForegroundWithNotification:(id)a3
{
}

- (void)sceneDidEnterBackgroundWithNotification:(id)a3
{
}

- (void)sceneDidDisconnectWithNotification:(id)a3
{
}

- (void)willBecomeActiveWithConversation:(id)a3
{
  id v4 = a3;
  v5 = self;
  FindMyMessagesAppViewController.willBecomeActive(with:)((MSConversation)v4);
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  FindMyMessagesAppViewController.preferredContentSizeDidChange(forChildContentContainer:)(a3);
  swift_unknownObjectRelease();
}

- (void)didBecomeActiveWithConversation:(id)a3
{
  id v4 = a3;
  v5 = self;
  FindMyMessagesAppViewController.didBecomeActive(with:)((MSConversation)v4);
}

- (BOOL)displaysAfterAppearance
{
  v2 = self;
  FindMyMessagesAppViewController.displaysAfterAppearance()();

  return 0;
}

- (void)didResignActiveWithConversation:(id)a3
{
  id v4 = a3;
  v5 = self;
  FindMyMessagesAppViewController.didResignActive(with:)((MSConversation)v4);
}

- (void)didReceiveMessage:(id)a3 conversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  FindMyMessagesAppViewController.didReceive(_:conversation:)((MSMessage)v6, (MSConversation)v7);
}

- (void)didStartSendingMessage:(id)a3 conversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  FindMyMessagesAppViewController.didStartSending(_:conversation:)((MSMessage)v6, (MSConversation)v7);
}

- (void)didCancelSendingMessage:(id)a3 conversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  FindMyMessagesAppViewController.didCancelSending(_:conversation:)((MSMessage)v6, (MSConversation)v7);
}

- (void)willTransitionToPresentationStyle:(unint64_t)a3
{
  id v4 = self;
  FindMyMessagesAppViewController.willTransition(to:)(a3);
}

- (void)didTransitionToPresentationStyle:(unint64_t)a3
{
  id v4 = self;
  FindMyMessagesAppViewController.didTransition(to:)(a3);
}

- (CGSize)contentSizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  if ([(FindMyMessagesAppViewController *)v5 presentationStyle] == (char *)&dword_0 + 2)
  {
    [(FindMyMessagesAppViewController *)v5 _balloonMaskEdgeInsets];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    [*(id *)((char *)&v5->super.super.super.super.isa+ OBJC_IVAR____TtC17FindMyMessagesApp31FindMyMessagesAppViewController_hostingViewController) preferredContentSize];
    double v15 = v14;
    double v17 = v16;

    double width = v13 + v9 + v15;
    double height = v11 + v7 + v17 + 1.0;
  }
  else
  {
  }
  double v18 = width;
  double v19 = height;
  result.double height = v19;
  result.double width = v18;
  return result;
}

- (UINavigationItem)navigationItem
{
  id v2 = [*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC17FindMyMessagesApp31FindMyMessagesAppViewController_hostingViewController) navigationItem];

  return (UINavigationItem *)v2;
}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  id v3 = [*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC17FindMyMessagesApp31FindMyMessagesAppViewController_hostingViewController) contentScrollViewForEdge:a3];

  return v3;
}

- (void)viewDidLoad
{
  id v2 = self;
  FindMyMessagesAppViewController.viewDidLoad()();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  FindMyMessagesAppViewController.viewWillAppear(_:)(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4 = self;
  FindMyMessagesAppViewController.viewDidDisappear(_:)(a3);
}

- (void)_validateMessageForSending:(MSMessage *)a3 conversation:(MSConversation *)a4 associatedText:(NSString *)a5 completionHandler:(id)a6
{
  uint64_t v11 = sub_53FC(&qword_18498);
  __chkstk_darwin(v11 - 8);
  double v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v14 = _Block_copy(a6);
  double v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = sub_11338();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  double v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_18580;
  v17[5] = v15;
  double v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_18590;
  v18[5] = v17;
  double v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = self;
  sub_EDC4((uint64_t)v13, (uint64_t)&unk_185A0, (uint64_t)v18);
  swift_release();
}

- (_TtC17FindMyMessagesApp31FindMyMessagesAppViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_11298();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC17FindMyMessagesApp31FindMyMessagesAppViewController *)FindMyMessagesAppViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC17FindMyMessagesApp31FindMyMessagesAppViewController)initWithCoder:(id)a3
{
  return (_TtC17FindMyMessagesApp31FindMyMessagesAppViewController *)FindMyMessagesAppViewController.init(coder:)(a3);
}

- (_TtC17FindMyMessagesApp31FindMyMessagesAppViewController)initWithShouldBeSheetPresentationControllerDelegate:(BOOL)a3
{
  return (_TtC17FindMyMessagesApp31FindMyMessagesAppViewController *)FindMyMessagesAppViewController.init(shouldBeSheetPresentationControllerDelegate:)(a3);
}

@end