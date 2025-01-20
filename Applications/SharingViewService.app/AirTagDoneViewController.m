@interface AirTagDoneViewController
- (_TtC18SharingViewService24AirTagDoneViewController)initWithContentView:(id)a3;
- (void)viewDidLoad;
@end

@implementation AirTagDoneViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10003676C();
}

- (_TtC18SharingViewService24AirTagDoneViewController)initWithContentView:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&self->PRXFeatureListViewController_opaque[OBJC_IVAR____TtC18SharingViewService24AirTagDoneViewController_mapViewController] = 0;
  swift_unknownObjectWeakInit();
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(AirTagDoneViewController *)&v7 initWithContentView:a3];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end