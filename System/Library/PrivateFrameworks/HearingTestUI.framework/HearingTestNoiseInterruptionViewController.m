@interface HearingTestNoiseInterruptionViewController
- (void)didTapHowtoReduceNoise;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HearingTestNoiseInterruptionViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HearingTestNoiseInterruptionViewController();
  id v2 = v3.receiver;
  [(HearingTestInterruptionsViewController *)&v3 viewDidLoad];
  sub_2513D86A0();
  sub_2513D8A08();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HearingTestNoiseInterruptionViewController();
  id v4 = v5.receiver;
  [(HearingTestNoiseInterruptionViewController *)&v5 viewWillAppear:v3];
  sub_2513AFC50();
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for HearingTestNoiseInterruptionViewController();
  id v4 = (char *)v10.receiver;
  [(HearingTestNoiseInterruptionViewController *)&v10 viewDidDisappear:v3];
  objc_super v5 = *(void **)&v4[OBJC_IVAR____TtC13HearingTestUI42HearingTestNoiseInterruptionViewController_noiseDataProvider];
  uint64_t v6 = v5[7];
  uint64_t v7 = v5[8];
  __swift_project_boxed_opaque_existential_1(v5 + 4, v6);
  v9[3] = type metadata accessor for NoiseDataProvider();
  v9[4] = &off_270236DC0;
  v9[0] = v5;
  v8 = *(void (**)(void *, uint64_t, uint64_t))(v7 + 24);
  swift_retain();
  v8(v9, v6, v7);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
}

- (void)didTapHowtoReduceNoise
{
  id v3 = objc_allocWithZone((Class)type metadata accessor for HTUIHowToReduceNoiseViewController());
  id v4 = self;
  id v5 = HTUIHowToReduceNoiseViewController.init()();
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F46858]), sel_initWithRootViewController_, v5);

  [(HearingTestNoiseInterruptionViewController *)v4 presentViewController:v6 animated:1 completion:0];
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();

  swift_release();
}

@end