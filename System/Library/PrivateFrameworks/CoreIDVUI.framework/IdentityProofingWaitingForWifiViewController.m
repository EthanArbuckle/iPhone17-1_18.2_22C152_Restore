@interface IdentityProofingWaitingForWifiViewController
- (_TtC9CoreIDVUI44IdentityProofingWaitingForWifiViewController)initWithCoder:(id)a3;
- (_TtC9CoreIDVUI44IdentityProofingWaitingForWifiViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation IdentityProofingWaitingForWifiViewController

- (_TtC9CoreIDVUI44IdentityProofingWaitingForWifiViewController)initWithCoder:(id)a3
{
  result = (_TtC9CoreIDVUI44IdentityProofingWaitingForWifiViewController *)sub_21F551B40();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_21F4E104C();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_21F4E2070(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for IdentityProofingWaitingForWifiViewController();
  id v4 = v5.receiver;
  [(IdentityProofingWaitingForWifiViewController *)&v5 viewDidAppear:v3];
  sub_21F5502A0();
  sub_21F4E32D0();

  swift_bridgeObjectRelease();
}

- (_TtC9CoreIDVUI44IdentityProofingWaitingForWifiViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9CoreIDVUI44IdentityProofingWaitingForWifiViewController *)_swift_stdlib_reportUnimplementedInitializer();
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