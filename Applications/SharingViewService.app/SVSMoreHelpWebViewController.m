@interface SVSMoreHelpWebViewController
- (_TtC18SharingViewService28SVSMoreHelpWebViewController)init;
- (_TtC18SharingViewService28SVSMoreHelpWebViewController)initWithCoder:(id)a3;
- (_TtC18SharingViewService28SVSMoreHelpWebViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC18SharingViewService28SVSMoreHelpWebViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC18SharingViewService28SVSMoreHelpWebViewController)initWithRootViewController:(id)a3;
- (_TtC18SharingViewService28SVSMoreHelpWebViewController)initWithType:(int64_t)a3;
- (_TtC18SharingViewService28SVSMoreHelpWebViewController)initWithURL:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation SVSMoreHelpWebViewController

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SVSMoreHelpWebViewController();
  id v4 = v6.receiver;
  [(SVSMoreHelpWebViewController *)&v6 viewDidDisappear:v3];
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    [Strong didRejectForInterventionViewController:0];

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (_TtC18SharingViewService28SVSMoreHelpWebViewController)init
{
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SVSMoreHelpWebViewController();
  return [(SVSMoreHelpWebViewController *)&v4 init];
}

- (_TtC18SharingViewService28SVSMoreHelpWebViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  swift_unknownObjectWeakInit();
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SVSMoreHelpWebViewController();
  return [(SVSMoreHelpWebViewController *)&v8 initWithNavigationBarClass:a3 toolbarClass:a4];
}

- (_TtC18SharingViewService28SVSMoreHelpWebViewController)initWithRootViewController:(id)a3
{
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SVSMoreHelpWebViewController();
  return [(SVSMoreHelpWebViewController *)&v6 initWithRootViewController:a3];
}

- (_TtC18SharingViewService28SVSMoreHelpWebViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    swift_unknownObjectWeakInit();
    id v6 = a4;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_unknownObjectWeakInit();
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for SVSMoreHelpWebViewController();
  v9 = [(SVSMoreHelpWebViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC18SharingViewService28SVSMoreHelpWebViewController)initWithCoder:(id)a3
{
  return (_TtC18SharingViewService28SVSMoreHelpWebViewController *)sub_1000B0B04(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (_TtC18SharingViewService28SVSMoreHelpWebViewController)initWithType:(int64_t)a3
{
  return (_TtC18SharingViewService28SVSMoreHelpWebViewController *)sub_1000B0B04(self, (uint64_t)a2, a3, (SEL *)&selRef_initWithType_);
}

- (_TtC18SharingViewService28SVSMoreHelpWebViewController)initWithURL:(id)a3
{
  uint64_t v4 = sub_100009A0C(&qword_1001C7620);
  __chkstk_darwin(v4 - 8);
  id v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = type metadata accessor for URL();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 0, 1, v7);
  }
  else
  {
    uint64_t v8 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
  }
  return (_TtC18SharingViewService28SVSMoreHelpWebViewController *)sub_1000B0B68((uint64_t)v6);
}

- (void).cxx_destruct
{
}

@end