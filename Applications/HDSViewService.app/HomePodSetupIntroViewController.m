@interface HomePodSetupIntroViewController
- (_TtC14HDSViewService31HomePodSetupIntroViewController)initWithContentView:(id)a3;
- (void)handleTapOnInfoButton;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HomePodSetupIntroViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100075A28();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HomePodSetupIntroViewController();
  id v4 = v5.receiver;
  [(HomePodSetupIconContentViewController *)&v5 viewDidAppear:v3];
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_10007E75C();

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for HomePodSetupIntroViewController();
  id v4 = (char *)v6.receiver;
  [(HomePodSetupIconContentViewController *)&v6 viewWillDisappear:v3];
  objc_super v5 = *(void **)&v4[OBJC_IVAR____TtC14HDSViewService31HomePodSetupIntroViewController_audioPlayer];
  if (v5) {
    [v5 invalidateWithFlags:1];
  }
}

- (void)handleTapOnInfoButton
{
  objc_super v5 = self;
  id v2 = [(HomePodSetupIntroViewController *)v5 infoButton];
  if (v2 && (BOOL v3 = v2, v4 = [v2 isActive], v3, v4)) {
    sub_10007679C();
  }
  else {
    sub_100076CE0();
  }
}

- (_TtC14HDSViewService31HomePodSetupIntroViewController)initWithContentView:(id)a3
{
  *(void *)&self->super.PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService31HomePodSetupIntroViewController_audioPlayer] = 0;
  *(void *)&self->super.PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService31HomePodSetupIntroViewController____lazy_storage___infoTableView] = 0;
  self->super.PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService31HomePodSetupIntroViewController_loadedInfo] = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HomePodSetupIntroViewController();
  return [(HomePodSetupIconContentViewController *)&v5 initWithContentView:a3];
}

- (void).cxx_destruct
{
  BOOL v3 = *(void **)&self->super.PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService31HomePodSetupIntroViewController____lazy_storage___infoTableView];
}

@end