@interface IDScanConfirmationViewController
- (_TtC9CoreIDVUI32IDScanConfirmationViewController)initWithCoder:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation IDScanConfirmationViewController

- (_TtC9CoreIDVUI32IDScanConfirmationViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC9CoreIDVUI32IDScanConfirmationViewController_eligibilityHelper;
  type metadata accessor for IdentityProofingEligibilityHelper();
  v6 = (objc_class *)swift_allocObject();
  sub_21F54F050();
  swift_allocObject();
  id v7 = a3;
  *((void *)v6 + 2) = sub_21F54F040();
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = v6;

  result = (_TtC9CoreIDVUI32IDScanConfirmationViewController *)sub_21F551B40();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_21F4CE680();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for IDScanConfirmationViewController();
  v4 = v8.receiver;
  [(IDScanConfirmationViewController *)&v8 viewDidAppear:v3];
  uint64_t v5 = sub_21F5502A0();
  uint64_t v7 = v6;
  sub_21F54FFA0();
  sub_21F4D2030(v5, v7, 0, 0, v4[OBJC_IVAR____TtC9CoreIDVUI32IDScanConfirmationViewController_scanSide], 0, 0);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_21F4CEA1C(a3);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI32IDScanConfirmationViewController_docScanConfig));
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC9CoreIDVUI32IDScanConfirmationViewController_configuration);
  swift_release();

  swift_release();
}

@end