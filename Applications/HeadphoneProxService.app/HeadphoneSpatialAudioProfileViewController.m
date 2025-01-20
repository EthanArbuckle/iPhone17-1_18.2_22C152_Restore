@interface HeadphoneSpatialAudioProfileViewController
- (BOOL)_canShowWhileLocked;
- (_TtC20HeadphoneProxService42HeadphoneSpatialAudioProfileViewController)initWithContentView:(id)a3;
- (void)viewDidLoad;
@end

@implementation HeadphoneSpatialAudioProfileViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1000874D4();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC20HeadphoneProxService42HeadphoneSpatialAudioProfileViewController)initWithContentView:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&self->presenter[OBJC_IVAR____TtC20HeadphoneProxService42HeadphoneSpatialAudioProfileViewController_presenter] = 0;
  swift_unknownObjectWeakInit();
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService42HeadphoneSpatialAudioProfileViewController_type] = 23;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(HeadphoneSpatialAudioProfileViewController *)&v7 initWithContentView:a3];
}

- (void).cxx_destruct
{
}

@end