@interface RootViewController
- (BOOL)inExpandedPresentation;
- (BOOL)inFullScreenModalPresentation;
- (BOOL)isDismissing;
- (BOOL)isLoaded;
- (BOOL)isPrimaryViewController;
- (BOOL)isiMessage;
- (BOOL)mayBeKeptInViewHierarchy;
- (BOOL)shouldShowChatChrome;
- (BOOL)shouldSuppressEntryView;
- (BOOL)supportsQuickView;
- (BOOL)wantsDarkUI;
- (BOOL)wantsOpaqueUI;
- (CKBrowserViewControllerSendDelegate)sendDelegate;
- (IMBalloonPlugin)balloonPlugin;
- (IMBalloonPluginDataSource)balloonPluginDataSource;
- (NSNumber)adamID;
- (NSString)conversationID;
- (RootViewController)initWithBalloonPlugin:(id)a3;
- (RootViewController)initWithBalloonPlugin:(id)a3 dataSource:(id)a4;
- (RootViewController)initWithCoder:(id)a3;
- (RootViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIViewController)presentationViewController;
- (int64_t)browserPresentationStyle;
- (int64_t)currentBrowserConsumer;
- (unint64_t)sheetDetentStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)dismiss;
- (void)setAdamID:(id)a3;
- (void)setBalloonPlugin:(id)a3;
- (void)setBalloonPluginDataSource:(id)a3;
- (void)setConversationID:(id)a3;
- (void)setCurrentBrowserConsumer:(int64_t)a3;
- (void)setDismissing:(BOOL)a3;
- (void)setInFullScreenModalPresentation:(BOOL)a3;
- (void)setIsPrimaryViewController:(BOOL)a3;
- (void)setIsiMessage:(BOOL)a3;
- (void)setPresentationViewController:(id)a3;
- (void)setSendDelegate:(id)a3;
- (void)setShouldSuppressEntryView:(BOOL)a3;
- (void)setStoreLaunchURL:(id)a3 sourceApplication:(id)a4;
- (void)shieldViewUnlockButtonPressed:(id)a3;
- (void)storeRootViewController:(id)a3 didComplete:(id)a4;
- (void)storeRootViewController:(id)a3 openApp:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation RootViewController

- (RootViewController)initWithBalloonPlugin:(id)a3 dataSource:(id)a4
{
  v6 = (objc_class *)a4;
  v7 = [(RootViewController *)self initWithBalloonPlugin:a3];
  v8 = v7;
  if (v7)
  {
    v9 = *(Class *)((char *)&v7->super.super.super.isa + OBJC_IVAR___RootViewController_balloonPluginDataSource);
    *(Class *)((char *)&v7->super.super.super.isa + OBJC_IVAR___RootViewController_balloonPluginDataSource) = v6;
    v6 = v9;
  }

  return v8;
}

- (RootViewController)initWithBalloonPlugin:(id)a3
{
  id v4 = a3;
  return (RootViewController *)sub_53078((uint64_t)a3);
}

- (RootViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_55650();
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for RootViewController();
  id v2 = v6.receiver;
  [(RootViewController *)&v6 viewDidLoad];
  id v3 = objc_msgSend(v2, "view", v6.receiver, v6.super_class);
  if (v3)
  {
    id v4 = v3;
    id v5 = [self systemBackgroundColor];
    [v4 setBackgroundColor:v5];
  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RootViewController();
  id v4 = v5.receiver;
  [(RootViewController *)&v5 viewWillAppear:v3];
  sub_53588();
}

- (void)viewIsAppearing:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RootViewController();
  id v4 = (char *)v5.receiver;
  [(RootViewController *)&v5 viewIsAppearing:v3];
  if (objc_msgSend(*(id *)&v4[OBJC_IVAR___RootViewController_appProtectionSubject], "isLocked", v5.receiver, v5.super_class))sub_53964(); {
  else
  }
    sub_53734();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RootViewController();
  id v4 = (char *)v5.receiver;
  [(RootViewController *)&v5 viewDidAppear:v3];
  if ((objc_msgSend(*(id *)&v4[OBJC_IVAR___RootViewController_appProtectionSubject], "isLocked", v5.receiver, v5.super_class) & 1) == 0)sub_53CFC(); {
}
  }

- (unint64_t)supportedInterfaceOrientations
{
  BOOL v3 = self;
  id v4 = self;
  id v5 = [v3 currentTraitCollection];
  objc_super v6 = (char *)[v5 userInterfaceIdiom];

  if (v6 == (unsigned char *)&def_270DE0 + 1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (NSNumber)adamID
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR___RootViewController_adamID));
}

- (void)setAdamID:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___RootViewController_adamID);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___RootViewController_adamID) = (Class)a3;
  id v3 = a3;
}

- (UIViewController)presentationViewController
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                     + OBJC_IVAR___RootViewController_presentationViewController));
}

- (void)setPresentationViewController:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___RootViewController_presentationViewController);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___RootViewController_presentationViewController) = (Class)a3;
  id v3 = a3;
}

- (CKBrowserViewControllerSendDelegate)sendDelegate
{
  id v2 = (void *)swift_unknownObjectRetain();

  return (CKBrowserViewControllerSendDelegate *)v2;
}

- (void)setSendDelegate:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___RootViewController_sendDelegate) = (Class)a3;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
}

- (IMBalloonPlugin)balloonPlugin
{
  return (IMBalloonPlugin *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                    + OBJC_IVAR___RootViewController_balloonPlugin));
}

- (void)setBalloonPlugin:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___RootViewController_balloonPlugin);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___RootViewController_balloonPlugin) = (Class)a3;
  id v3 = a3;
}

- (IMBalloonPluginDataSource)balloonPluginDataSource
{
  return (IMBalloonPluginDataSource *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                              + OBJC_IVAR___RootViewController_balloonPluginDataSource));
}

- (void)setBalloonPluginDataSource:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___RootViewController_balloonPluginDataSource);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___RootViewController_balloonPluginDataSource) = (Class)a3;
  id v3 = a3;
}

- (BOOL)isiMessage
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___RootViewController_isiMessage);
}

- (void)setIsiMessage:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___RootViewController_isiMessage) = a3;
}

- (NSString)conversationID
{
  return (NSString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR___RootViewController_conversationID));
}

- (void)setConversationID:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___RootViewController_conversationID);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___RootViewController_conversationID) = (Class)a3;
  id v3 = a3;
}

- (BOOL)wantsDarkUI
{
  return 0;
}

- (BOOL)wantsOpaqueUI
{
  return 0;
}

- (BOOL)supportsQuickView
{
  return 0;
}

- (BOOL)shouldSuppressEntryView
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___RootViewController_shouldSuppressEntryView);
}

- (void)setShouldSuppressEntryView:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___RootViewController_shouldSuppressEntryView) = a3;
}

- (BOOL)isPrimaryViewController
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___RootViewController_isPrimaryViewController);
}

- (void)setIsPrimaryViewController:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___RootViewController_isPrimaryViewController) = a3;
}

- (BOOL)isDismissing
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___RootViewController_isDismissing);
}

- (void)setDismissing:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___RootViewController_isDismissing) = a3;
}

- (BOOL)mayBeKeptInViewHierarchy
{
  return 1;
}

- (unint64_t)sheetDetentStyle
{
  return 2;
}

- (int64_t)browserPresentationStyle
{
  return 0;
}

- (BOOL)shouldShowChatChrome
{
  return 1;
}

- (BOOL)inFullScreenModalPresentation
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___RootViewController_inFullScreenModalPresentation);
}

- (void)setInFullScreenModalPresentation:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___RootViewController_inFullScreenModalPresentation) = a3;
}

- (void)dismiss
{
  id v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___RootViewController_sendDelegate);
  if (v2) {
    [v2 dismiss];
  }
  else {
    __break(1u);
  }
}

- (BOOL)isLoaded
{
  return 1;
}

- (int64_t)currentBrowserConsumer
{
  return *(int64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___RootViewController_currentBrowserConsumer);
}

- (void)setCurrentBrowserConsumer:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___RootViewController_currentBrowserConsumer) = (Class)a3;
}

- (BOOL)inExpandedPresentation
{
  return (*(unint64_t *)((unsigned char *)&self->super.super.super.isa
                              + OBJC_IVAR___RootViewController_currentBrowserConsumer) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (void)setStoreLaunchURL:(id)a3 sourceApplication:(id)a4
{
  uint64_t v7 = sub_FD50(&qword_9526C0);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_76BBF0();
    uint64_t v10 = sub_76BC30();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    uint64_t v11 = sub_76BC30();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
  }
  if (a4)
  {
    uint64_t v12 = sub_77D670();
    a4 = v13;
  }
  else
  {
    uint64_t v12 = 0;
  }
  v14 = self;
  sub_54700((uint64_t)v9, v12, (uint64_t)a4);

  swift_bridgeObjectRelease();
  sub_14C88((uint64_t)v9, &qword_9526C0);
}

- (void)storeRootViewController:(id)a3 didComplete:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_55850(v7);
}

- (void)storeRootViewController:(id)a3 openApp:(id)a4
{
  if (*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___RootViewController_sendDelegate))
  {
    id v5 = (void *)swift_dynamicCastObjCProtocolConditional();
    if (v5)
    {
      id v6 = v5;
      if ([v5 respondsToSelector:"openAppExtensionWithAdamID:"]) {
        [v6 openAppExtensionWithAdamID:a4];
      }
    }
  }
}

- (void)shieldViewUnlockButtonPressed:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_54B50(v4);
}

- (RootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (RootViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_14C88((uint64_t)self + OBJC_IVAR___RootViewController_latestStoreLaunchDetails, &qword_9526C8);
  swift_unknownObjectRelease();

  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___RootViewController_conversationID);
}

@end