@interface SendLaterRootViewController
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
- (NSString)conversationID;
- (SendLaterRootViewController)initWithBalloonPlugin:(id)a3;
- (SendLaterRootViewController)initWithBalloonPlugin:(id)a3 dataSource:(id)a4;
- (SendLaterRootViewController)initWithCoder:(id)a3;
- (SendLaterRootViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIViewController)presentationViewController;
- (id)pluginContext;
- (int64_t)browserPresentationStyle;
- (unint64_t)sheetDetentStyle;
- (void)dismiss;
- (void)pluginInfoSelectedDateDidChange:(id)a3;
- (void)setBalloonPlugin:(id)a3;
- (void)setBalloonPluginDataSource:(id)a3;
- (void)setConversationID:(id)a3;
- (void)setDismissing:(BOOL)a3;
- (void)setInExpandedPresentation:(BOOL)a3;
- (void)setInFullScreenModalPresentation:(BOOL)a3;
- (void)setIsPrimaryViewController:(BOOL)a3;
- (void)setIsiMessage:(BOOL)a3;
- (void)setMayBeKeptInViewHierarchy:(BOOL)a3;
- (void)setPluginContext:(id)a3;
- (void)setPresentationViewController:(id)a3;
- (void)setSendDelegate:(id)a3;
- (void)setShouldShowChatChrome:(BOOL)a3;
- (void)setShouldSuppressEntryView:(BOOL)a3;
- (void)setSupportsQuickView:(BOOL)a3;
- (void)setWantsDarkUI:(BOOL)a3;
- (void)setWantsOpaqueUI:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SendLaterRootViewController

- (UIViewController)presentationViewController
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                     + OBJC_IVAR___SendLaterRootViewController_presentationViewController));
}

- (void)setPresentationViewController:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___SendLaterRootViewController_presentationViewController);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SendLaterRootViewController_presentationViewController) = (Class)a3;
  id v3 = a3;
}

- (CKBrowserViewControllerSendDelegate)sendDelegate
{
  v2 = (void *)swift_unknownObjectRetain();

  return (CKBrowserViewControllerSendDelegate *)v2;
}

- (void)setSendDelegate:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SendLaterRootViewController_sendDelegate) = (Class)a3;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
}

- (IMBalloonPlugin)balloonPlugin
{
  return (IMBalloonPlugin *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                    + OBJC_IVAR___SendLaterRootViewController_balloonPlugin));
}

- (void)setBalloonPlugin:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SendLaterRootViewController_balloonPlugin);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SendLaterRootViewController_balloonPlugin) = (Class)a3;
  id v3 = a3;
}

- (IMBalloonPluginDataSource)balloonPluginDataSource
{
  return (IMBalloonPluginDataSource *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                              + OBJC_IVAR___SendLaterRootViewController_balloonPluginDataSource));
}

- (void)setBalloonPluginDataSource:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SendLaterRootViewController_balloonPluginDataSource);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SendLaterRootViewController_balloonPluginDataSource) = (Class)a3;
  id v3 = a3;
}

- (BOOL)isiMessage
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___SendLaterRootViewController_isiMessage);
}

- (void)setIsiMessage:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___SendLaterRootViewController_isiMessage) = a3;
}

- (NSString)conversationID
{
  return (NSString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR___SendLaterRootViewController_conversationID));
}

- (void)setConversationID:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SendLaterRootViewController_conversationID);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SendLaterRootViewController_conversationID) = (Class)a3;
  id v3 = a3;
}

- (BOOL)wantsDarkUI
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___SendLaterRootViewController_wantsDarkUI);
}

- (void)setWantsDarkUI:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___SendLaterRootViewController_wantsDarkUI) = a3;
}

- (BOOL)wantsOpaqueUI
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___SendLaterRootViewController_wantsOpaqueUI);
}

- (void)setWantsOpaqueUI:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___SendLaterRootViewController_wantsOpaqueUI) = a3;
}

- (BOOL)supportsQuickView
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___SendLaterRootViewController_supportsQuickView);
}

- (void)setSupportsQuickView:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___SendLaterRootViewController_supportsQuickView) = a3;
}

- (BOOL)shouldSuppressEntryView
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___SendLaterRootViewController_shouldSuppressEntryView);
}

- (void)setShouldSuppressEntryView:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___SendLaterRootViewController_shouldSuppressEntryView) = a3;
}

- (BOOL)isPrimaryViewController
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___SendLaterRootViewController_isPrimaryViewController);
}

- (void)setIsPrimaryViewController:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___SendLaterRootViewController_isPrimaryViewController) = a3;
}

- (BOOL)isDismissing
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___SendLaterRootViewController_isDismissing);
}

- (void)setDismissing:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___SendLaterRootViewController_isDismissing) = a3;
}

- (BOOL)mayBeKeptInViewHierarchy
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___SendLaterRootViewController_mayBeKeptInViewHierarchy);
}

- (void)setMayBeKeptInViewHierarchy:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___SendLaterRootViewController_mayBeKeptInViewHierarchy) = a3;
}

- (id)pluginContext
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SendLaterRootViewController_context);
  if (v2)
  {
    v6 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SendLaterRootViewController_context);
    sub_B970();
    id v3 = v2;
    id v4 = (void *)sub_BA30();
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)setPluginContext:(id)a3
{
  if (a3)
  {
    id v3 = self;
    swift_unknownObjectRetain();
    sub_B9B0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    id v4 = self;
  }
  sub_5690((uint64_t)v6);
}

- (unint64_t)sheetDetentStyle
{
  return 1;
}

- (SendLaterRootViewController)initWithBalloonPlugin:(id)a3 dataSource:(id)a4
{
  v6 = (objc_class *)a4;
  v7 = [(SendLaterRootViewController *)self initWithBalloonPlugin:a3];
  v8 = v7;
  if (v7)
  {
    v9 = *(Class *)((char *)&v7->super.super.super.isa + OBJC_IVAR___SendLaterRootViewController_balloonPluginDataSource);
    *(Class *)((char *)&v7->super.super.super.isa + OBJC_IVAR___SendLaterRootViewController_balloonPluginDataSource) = v6;
    v6 = v9;
  }

  return v8;
}

- (SendLaterRootViewController)initWithBalloonPlugin:(id)a3
{
  id v4 = a3;
  return (SendLaterRootViewController *)sub_58A0((uint64_t)a3);
}

- (SendLaterRootViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_8018();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_5A50();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_6420();
}

- (void)viewWillAppear:(BOOL)a3
{
}

- (void)viewWillDisappear:(BOOL)a3
{
}

- (int64_t)browserPresentationStyle
{
  return 0;
}

- (BOOL)shouldShowChatChrome
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___SendLaterRootViewController_shouldShowChatChrome);
}

- (void)setShouldShowChatChrome:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___SendLaterRootViewController_shouldShowChatChrome) = a3;
}

- (BOOL)inExpandedPresentation
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___SendLaterRootViewController_inExpandedPresentation);
}

- (void)setInExpandedPresentation:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___SendLaterRootViewController_inExpandedPresentation) = a3;
}

- (BOOL)inFullScreenModalPresentation
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___SendLaterRootViewController_inFullScreenModalPresentation);
}

- (void)setInFullScreenModalPresentation:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___SendLaterRootViewController_inFullScreenModalPresentation) = a3;
}

- (void)dismiss
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SendLaterRootViewController_sendDelegate);
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

- (void)pluginInfoSelectedDateDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_6E80(v4);
}

- (SendLaterRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (SendLaterRootViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___SendLaterRootViewController_presentationViewController));
  swift_unknownObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___SendLaterRootViewController_balloonPluginDataSource));

  swift_release();

  swift_bridgeObjectRelease();
}

@end