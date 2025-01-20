@interface HeadphoneAdaptiveControlsPersonalizedVolumeViewController
- (BOOL)_canShowWhileLocked;
- (_TtC20HeadphoneProxService57HeadphoneAdaptiveControlsPersonalizedVolumeViewController)initWithContentView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HeadphoneAdaptiveControlsPersonalizedVolumeViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100086020();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  [(HeadphoneAdaptiveControlsPersonalizedVolumeViewController *)&v5 viewDidAppear:v3];
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_10008F420(v4[OBJC_IVAR____TtC20HeadphoneProxService57HeadphoneAdaptiveControlsPersonalizedVolumeViewController_type]);

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

- (_TtC20HeadphoneProxService57HeadphoneAdaptiveControlsPersonalizedVolumeViewController)initWithContentView:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&self->presenter[OBJC_IVAR____TtC20HeadphoneProxService57HeadphoneAdaptiveControlsPersonalizedVolumeViewController_presenter] = 0;
  swift_unknownObjectWeakInit();
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService57HeadphoneAdaptiveControlsPersonalizedVolumeViewController_type] = 10;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(HeadphoneAdaptiveControlsPersonalizedVolumeViewController *)&v7 initWithContentView:a3];
}

- (void).cxx_destruct
{
}

@end