@interface HeadphoneNotYoursViewController
- (BOOL)_canShowWhileLocked;
- (_TtC20HeadphoneProxService31HeadphoneNotYoursViewController)initWithContentView:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HeadphoneNotYoursViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(HeadphoneNotYoursViewController *)&v3 viewDidLoad];
  [v2 setDismissalType:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_100087FF0(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = (char *)v6.receiver;
  [(HeadphoneNotYoursViewController *)&v6 viewDidDisappear:v3];
  v5 = (id *)&v4[OBJC_IVAR____TtC20HeadphoneProxService31HeadphoneNotYoursViewController_movieView];
  swift_beginAccess();
  if (*v5) {
    [*v5 stop];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC20HeadphoneProxService31HeadphoneNotYoursViewController)initWithContentView:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService31HeadphoneNotYoursViewController_movieView] = 0;
  objc_super v6 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService31HeadphoneNotYoursViewController_viewModel];
  uint64_t v7 = type metadata accessor for HeadphoneViewModel(0);
  (*(void (**)(unsigned __int8 *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  *(void *)&self->movieView[OBJC_IVAR____TtC20HeadphoneProxService31HeadphoneNotYoursViewController_presenter] = 0;
  swift_unknownObjectWeakInit();
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService31HeadphoneNotYoursViewController_type] = 18;
  v9.receiver = self;
  v9.super_class = ObjectType;
  return [(HeadphoneNotYoursViewController *)&v9 initWithContentView:a3];
}

- (void).cxx_destruct
{
  sub_10001A2AC((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService31HeadphoneNotYoursViewController_viewModel], &qword_1000D5660);
  BOOL v3 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService31HeadphoneNotYoursViewController_presenter];

  sub_100008F00((uint64_t)v3);
}

@end