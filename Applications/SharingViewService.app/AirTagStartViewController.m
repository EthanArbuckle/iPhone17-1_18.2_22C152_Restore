@interface AirTagStartViewController
- (BOOL)_canShowWhileLocked;
- (_TtC18SharingViewService25AirTagStartViewController)initWithContentView:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AirTagStartViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10006ED90();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10006F658(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = (char *)v7.receiver;
  [(AirTagStartViewController *)&v7 viewDidDisappear:v3];
  v5 = *(void (**)(uint64_t))&v4[OBJC_IVAR____TtC18SharingViewService25AirTagStartViewController_invalidateBubbleMonitor];
  if (v5)
  {
    uint64_t v6 = swift_retain();
    v5(v6);
    sub_100017C38((uint64_t)v5);
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC18SharingViewService25AirTagStartViewController)initWithContentView:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = &self->super.PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService25AirTagStartViewController_invalidateBubbleMonitor];
  *(void *)uint64_t v6 = 0;
  *((void *)v6 + 1) = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(AirTagMovieViewController *)&v8 initWithContentView:a3];
}

- (void).cxx_destruct
{
}

@end