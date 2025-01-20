@interface HeadhponeHeartRateTutorial1ViewController
- (BOOL)_canShowWhileLocked;
- (_TtC20HeadphoneProxService41HeadhponeHeartRateTutorial1ViewController)initWithContentView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HeadhponeHeartRateTutorial1ViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100086EC8();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HeadhponeHeartRateTutorial1ViewController();
  v4 = v5.receiver;
  [(HeadhponeHeartRateTutorial1ViewController *)&v5 viewDidAppear:v3];
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_10008F420(v4[OBJC_IVAR____TtC20HeadphoneProxService41HeadhponeHeartRateTutorial1ViewController_type]);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC20HeadphoneProxService41HeadhponeHeartRateTutorial1ViewController)initWithContentView:(id)a3
{
  *(void *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService41HeadhponeHeartRateTutorial1ViewController____lazy_storage___topAsset] = 0;
  *(void *)&self->$__lazy_storage_$_topAsset[OBJC_IVAR____TtC20HeadphoneProxService41HeadhponeHeartRateTutorial1ViewController_presenter] = 0;
  swift_unknownObjectWeakInit();
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService41HeadhponeHeartRateTutorial1ViewController_type] = 28;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for HeadhponeHeartRateTutorial1ViewController();
  return [(HeadhponeHeartRateTutorial1ViewController *)&v6 initWithContentView:a3];
}

- (void).cxx_destruct
{
  BOOL v3 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService41HeadhponeHeartRateTutorial1ViewController_presenter];

  sub_100008F00((uint64_t)v3);
}

@end