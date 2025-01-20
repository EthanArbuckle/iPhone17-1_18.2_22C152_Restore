@interface HeadphoneHeadGesturesUpsellViewController
- (BOOL)_canShowWhileLocked;
- (_TtC20HeadphoneProxService41HeadphoneHeadGesturesUpsellViewController)initWithContentView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HeadphoneHeadGesturesUpsellViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100069C68();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  [(HeadphoneHeadGesturesUpsellViewController *)&v5 viewDidAppear:v3];
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_10008F420(v4[OBJC_IVAR____TtC20HeadphoneProxService41HeadphoneHeadGesturesUpsellViewController_type]);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)swift_getObjectType();
  id v4 = v11.receiver;
  [(HeadphoneHeadGesturesUpsellViewController *)&v11 viewWillAppear:v3];
  objc_super v5 = (char *)sub_10006998C(&OBJC_IVAR____TtC20HeadphoneProxService41HeadphoneHeadGesturesUpsellViewController____lazy_storage___movieLoopView, (uint64_t (*)(uint64_t))sub_1000695F8);
  uint64_t v6 = OBJC_IVAR____TtC20HeadphoneProxService19ProxMovieLoopPlayer_videoPlayer;
  v7 = *(void **)&v5[OBJC_IVAR____TtC20HeadphoneProxService19ProxMovieLoopPlayer_videoPlayer];
  CMTimeEpoch epoch = kCMTimeZero.epoch;
  v10[0] = kCMTimeZero.value;
  v10[1] = *(void *)&kCMTimeZero.timescale;
  v10[2] = epoch;
  [v7 seekToTime:v10];
  LODWORD(v9) = 1.0;
  [*(id *)&v5[v6] playImmediatelyAtRate:v9];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC20HeadphoneProxService41HeadphoneHeadGesturesUpsellViewController)initWithContentView:(id)a3
{
  id v4 = a3;
  objc_super v5 = (_TtC20HeadphoneProxService41HeadphoneHeadGesturesUpsellViewController *)sub_10006A934((uint64_t)a3);

  return v5;
}

- (void).cxx_destruct
{
  swift_release();

  BOOL v3 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService41HeadphoneHeadGesturesUpsellViewController_presenter];

  sub_100008F00((uint64_t)v3);
}

@end