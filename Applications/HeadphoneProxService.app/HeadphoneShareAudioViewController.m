@interface HeadphoneShareAudioViewController
- (BOOL)_canShowWhileLocked;
- (_TtC20HeadphoneProxService33HeadphoneShareAudioViewController)initWithContentView:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HeadphoneShareAudioViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(HeadphoneShareAudioViewController *)&v3 viewDidLoad];
  [v2 setDismissalType:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10007B844(a3, (SEL *)&selRef_viewWillAppear_, "Playing movie", (SEL *)&selRef_play);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_10007B844(a3, (SEL *)&selRef_viewDidDisappear_, "Stopping movie", (SEL *)&selRef_stop);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC20HeadphoneProxService33HeadphoneShareAudioViewController)initWithContentView:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService33HeadphoneShareAudioViewController_movieContainer];
  sub_10004D660((uint64_t)v9);
  sub_10004BF88((uint64_t)v9, (uint64_t)v6, &qword_1000D5B10);
  *(void *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService33HeadphoneShareAudioViewController_movieView] = 0;
  *(void *)&self->movieContainer[OBJC_IVAR____TtC20HeadphoneProxService33HeadphoneShareAudioViewController_presenter] = 0;
  swift_unknownObjectWeakInit();
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService33HeadphoneShareAudioViewController_type] = 20;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(HeadphoneShareAudioViewController *)&v8 initWithContentView:a3];
}

- (void).cxx_destruct
{
  sub_10004BF88((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService33HeadphoneShareAudioViewController_movieContainer], (uint64_t)v3, &qword_1000D5B10);
  sub_10007C6C4((uint64_t)v3);

  sub_100008F00((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService33HeadphoneShareAudioViewController_presenter]);
}

@end