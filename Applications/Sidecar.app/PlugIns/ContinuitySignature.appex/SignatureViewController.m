@interface SignatureViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)shouldAutorotate;
- (SignatureViewController)initWithCoder:(id)a3;
- (SignatureViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)_cancelWithSender:(id)a3;
- (void)_clearWithSender:(id)a3;
- (void)_doneWithSender:(id)a3;
- (void)receivedItems:(id)a3;
- (void)signatureViewSignatureUpdated:(id)a3;
- (void)viewDidLoad;
@end

@implementation SignatureViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 24;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100004910();
}

- (void)_cancelWithSender:(id)a3
{
}

- (void)_clearWithSender:(id)a3
{
}

- (void)receivedItems:(id)a3
{
  sub_100006DC8(0, &qword_10000C7B0);
  unint64_t v4 = sub_100007050();
  v5 = self;
  sub_100005570(v4);

  swift_bridgeObjectRelease();
}

- (void)_doneWithSender:(id)a3
{
}

- (SignatureViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_100007030();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (SignatureViewController *)sub_100005D98(v5, v7, a4);
}

- (SignatureViewController)initWithCoder:(id)a3
{
  return (SignatureViewController *)sub_100005F80(a3);
}

- (void).cxx_destruct
{
  v3 = *(void **)&self->SidecarServiceViewController_opaque[OBJC_IVAR___SignatureViewController_lineView];
}

- (void)signatureViewSignatureUpdated:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1000061B8();
}

@end