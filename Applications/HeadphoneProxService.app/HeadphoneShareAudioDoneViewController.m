@interface HeadphoneShareAudioDoneViewController
- (BOOL)_canShowWhileLocked;
- (_TtC20HeadphoneProxService37HeadphoneShareAudioDoneViewController)initWithContentView:(id)a3;
- (void)viewDidLoad;
@end

@implementation HeadphoneShareAudioDoneViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(HeadphoneShareAudioDoneViewController *)&v3 viewDidLoad];
  [v2 setDismissalType:1];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC20HeadphoneProxService37HeadphoneShareAudioDoneViewController)initWithContentView:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&self->presenter[OBJC_IVAR____TtC20HeadphoneProxService37HeadphoneShareAudioDoneViewController_presenter] = 0;
  swift_unknownObjectWeakInit();
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService37HeadphoneShareAudioDoneViewController_type] = 21;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(HeadphoneShareAudioDoneViewController *)&v7 initWithContentView:a3];
}

- (void).cxx_destruct
{
}

@end