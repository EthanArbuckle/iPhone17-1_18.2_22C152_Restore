@interface RGBLivenessCaptureSelfieVC
- (_TtC18CoreIDVRGBLiveness17CaptureSelfieView)captureSelfieView;
- (_TtC18CoreIDVRGBLiveness26RGBLivenessCaptureSelfieVC)initWithCoder:(id)a3;
- (_TtC18CoreIDVRGBLiveness26RGBLivenessCaptureSelfieVC)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)preferredStatusBarStyle;
- (void)cancelFromStitchDetectionWithNotification:(id)a3;
- (void)loadView;
- (void)performClosuresAwaitingImageQualityVerification;
- (void)presentCoachingSuccess:(id)a3;
- (void)presentSkipGestureAlert;
- (void)restartSelfieCapture;
- (void)showAXOptions;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation RGBLivenessCaptureSelfieVC

- (_TtC18CoreIDVRGBLiveness17CaptureSelfieView)captureSelfieView
{
  v2 = self;
  result = (_TtC18CoreIDVRGBLiveness17CaptureSelfieView *)[(RGBLivenessCaptureSelfieVC *)v2 view];
  if (result)
  {

    type metadata accessor for CaptureSelfieView();
    v4 = (void *)swift_dynamicCastClassUnconditional();
    return (_TtC18CoreIDVRGBLiveness17CaptureSelfieView *)v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (_TtC18CoreIDVRGBLiveness26RGBLivenessCaptureSelfieVC)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_21EE92144();
}

- (void)loadView
{
  id v3 = objc_allocWithZone((Class)type metadata accessor for CaptureSelfieView());
  v4 = self;
  uint64_t v5 = swift_retain();
  sub_21EDF5CC4(v5);
  id v7 = v6;
  [(RGBLivenessCaptureSelfieVC *)v4 setView:v6];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  id v2 = v4.receiver;
  [(RGBLivenessCaptureSelfieVC *)&v4 viewDidLoad];
  sub_21EE7B304();
  id v3 = objc_msgSend(self, sel_defaultCenter, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_addObserver_selector_name_object_, v2, sel_cancelFromStitchDetectionWithNotification_, *MEMORY[0x263F35F78], 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  objc_super v4 = v9.receiver;
  [(RGBLivenessCaptureSelfieVC *)&v9 viewWillAppear:v3];
  uint64_t v5 = self;
  id v6 = objc_msgSend(v5, sel_sharedApplication, v9.receiver, v9.super_class);
  unsigned __int8 v7 = objc_msgSend(v6, sel_isIdleTimerDisabled);

  v4[OBJC_IVAR____TtC18CoreIDVRGBLiveness26RGBLivenessCaptureSelfieVC_originalIdleTimerDisabled] = v7;
  id v8 = objc_msgSend(v5, sel_sharedApplication);
  objc_msgSend(v8, sel_setIdleTimerDisabled_, 1);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  objc_super v4 = (unsigned __int8 *)v6.receiver;
  [(RGBLivenessCaptureSelfieVC *)&v6 viewWillDisappear:v3];
  id v5 = objc_msgSend(self, sel_sharedApplication, v6.receiver, v6.super_class);
  objc_msgSend(v5, sel_setIdleTimerDisabled_, v4[OBJC_IVAR____TtC18CoreIDVRGBLiveness26RGBLivenessCaptureSelfieVC_originalIdleTimerDisabled]);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4 = self;
  RGBLivenessCaptureSelfieVC.viewDidDisappear(_:)(a3);
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (void)restartSelfieCapture
{
  id v2 = self;
  sub_21EE7C6B4();
}

- (void)cancelFromStitchDetectionWithNotification:(id)a3
{
  uint64_t v4 = sub_21EE9A3E8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  unsigned __int8 v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EE9A3C8();
  id v8 = self;
  sub_21EE7D724();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)showAXOptions
{
  id v2 = self;
  sub_21EE7F4D0();
}

- (void)presentSkipGestureAlert
{
  id v2 = self;
  sub_21EE86330();
}

- (void)presentCoachingSuccess:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_21EE923B4(v5, (void (**)(void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)performClosuresAwaitingImageQualityVerification
{
  id v2 = self;
  sub_21EE8CBC0();
}

- (_TtC18CoreIDVRGBLiveness26RGBLivenessCaptureSelfieVC)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC18CoreIDVRGBLiveness26RGBLivenessCaptureSelfieVC *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_weakDestroy();
  swift_release();
  sub_21EDFBD10(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC18CoreIDVRGBLiveness26RGBLivenessCaptureSelfieVC_livenessPrimaryClosure));
  sub_21EDFBD10(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC18CoreIDVRGBLiveness26RGBLivenessCaptureSelfieVC_livenessSecondaryClosure));
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness26RGBLivenessCaptureSelfieVC_gestureDetectedTimer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness26RGBLivenessCaptureSelfieVC_hapticGenerator));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness26RGBLivenessCaptureSelfieVC_latestImageQualityError));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness26RGBLivenessCaptureSelfieVC_errorReminderTimer));
  swift_release();
  swift_release();
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18CoreIDVRGBLiveness26RGBLivenessCaptureSelfieVC____lazy_storage___flashIndicator);
}

@end