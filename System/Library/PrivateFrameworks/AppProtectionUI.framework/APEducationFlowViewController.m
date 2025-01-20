@interface APEducationFlowViewController
- (APEducationFlowViewController)initWithCoder:(id)a3;
- (APEducationFlowViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (APEducationViewControllerDelegate)delegate;
- (BOOL)wantsAnimatedPresentation;
- (id)initForApplication:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation APEducationFlowViewController

- (APEducationViewControllerDelegate)delegate
{
  v2 = (void *)MEMORY[0x24C56D1C0]((char *)self + OBJC_IVAR___APEducationFlowViewController_delegate, a2);

  return (APEducationViewControllerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)wantsAnimatedPresentation
{
  return 0;
}

- (id)initForApplication:(id)a3
{
  return sub_247E15A0C(a3);
}

- (APEducationFlowViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  _sSo29APEducationFlowViewControllerC15AppProtectionUIE5coderABSgSo7NSCoderC_tcfc_0();
}

- (void)viewDidAppear:(BOOL)a3
{
  id v3 = self;
  _sSo29APEducationFlowViewControllerC15AppProtectionUIE13viewDidAppearyySbF_0();
}

- (APEducationFlowViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (APEducationFlowViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___APEducationFlowViewController_initialAlertController));
  swift_bridgeObjectRelease();

  id v3 = (char *)self + OBJC_IVAR___APEducationFlowViewController_delegate;

  sub_247E0D020((uint64_t)v3);
}

@end