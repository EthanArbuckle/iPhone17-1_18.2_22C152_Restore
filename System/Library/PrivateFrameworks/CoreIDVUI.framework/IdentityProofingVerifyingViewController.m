@interface IdentityProofingVerifyingViewController
- (_TtC9CoreIDVUI39IdentityProofingVerifyingViewController)initWithCoder:(id)a3;
- (_TtC9CoreIDVUI39IdentityProofingVerifyingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation IdentityProofingVerifyingViewController

- (_TtC9CoreIDVUI39IdentityProofingVerifyingViewController)initWithCoder:(id)a3
{
  result = (_TtC9CoreIDVUI39IdentityProofingVerifyingViewController *)sub_21F551B40();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_21F4A4504();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for IdentityProofingVerifyingViewController();
  id v4 = v5.receiver;
  [(IdentityProofingVerifyingViewController *)&v5 viewDidAppear:v3];
  sub_21F5502A0();
  sub_21F4A5EBC();

  swift_bridgeObjectRelease();
}

- (_TtC9CoreIDVUI39IdentityProofingVerifyingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9CoreIDVUI39IdentityProofingVerifyingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  swift_release();
}

@end