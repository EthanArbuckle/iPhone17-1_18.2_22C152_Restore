@interface RGBCaptureViewController
- (_TtC9CoreIDVUI24RGBCaptureViewController)initWithCoder:(id)a3;
- (void)cancelBarButtonClicked;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation RGBCaptureViewController

- (_TtC9CoreIDVUI24RGBCaptureViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_21F49466C();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for RGBCaptureViewController();
  id v4 = v10.receiver;
  [(RGBCaptureViewController *)&v10 viewDidAppear:v3];
  uint64_t v5 = sub_21F5502A0();
  uint64_t v7 = v6;
  uint64_t v8 = sub_21F5500A0();
  sub_21F48E92C(v5, v7, v8, v9, 0, 0, 0, 0, 0, 0, 0);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_21F48F9AC(a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_21F48FB80();
}

- (void).cxx_destruct
{
  swift_release();
  BOOL v3 = (char *)self + OBJC_IVAR____TtC9CoreIDVUI24RGBCaptureViewController_captureConfig;
  uint64_t v4 = sub_21F550640();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC9CoreIDVUI24RGBCaptureViewController_configuration);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI24RGBCaptureViewController_uiConfig));

  swift_release();
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  sub_21F494980(v8);
}

- (void)cancelBarButtonClicked
{
  v2 = self;
  sub_21F493EF8();
}

@end