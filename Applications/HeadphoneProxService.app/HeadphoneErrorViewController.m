@interface HeadphoneErrorViewController
- (BOOL)_canShowWhileLocked;
- (_TtC20HeadphoneProxService28HeadphoneErrorViewController)initWithContentView:(id)a3;
- (void)viewDidLoad;
@end

@implementation HeadphoneErrorViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100031F70();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC20HeadphoneProxService28HeadphoneErrorViewController)initWithContentView:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&self->presenter[OBJC_IVAR____TtC20HeadphoneProxService28HeadphoneErrorViewController_presenter] = 0;
  swift_unknownObjectWeakInit();
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService28HeadphoneErrorViewController_type] = 14;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(HeadphoneErrorViewController *)&v7 initWithContentView:a3];
}

- (void).cxx_destruct
{
}

@end