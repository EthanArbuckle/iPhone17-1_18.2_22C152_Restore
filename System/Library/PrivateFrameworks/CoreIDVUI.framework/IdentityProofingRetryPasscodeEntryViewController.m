@interface IdentityProofingRetryPasscodeEntryViewController
- (_TtC9CoreIDVUI48IdentityProofingRetryPasscodeEntryViewController)initWithCoder:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation IdentityProofingRetryPasscodeEntryViewController

- (_TtC9CoreIDVUI48IdentityProofingRetryPasscodeEntryViewController)initWithCoder:(id)a3
{
  result = (_TtC9CoreIDVUI48IdentityProofingRetryPasscodeEntryViewController *)sub_21F551B40();
  __break(1u);
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for IdentityProofingRetryPasscodeEntryViewController();
  id v4 = v6.receiver;
  [(IdentityProofingRetryPasscodeEntryViewController *)&v6 viewWillAppear:v3];
  id v5 = objc_msgSend(v4, sel_navigationItem, v6.receiver, v6.super_class);
  objc_msgSend(v5, sel_setLeftBarButtonItem_, 0);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_21F50AB08();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI48IdentityProofingRetryPasscodeEntryViewController_config));

  swift_release();
}

@end