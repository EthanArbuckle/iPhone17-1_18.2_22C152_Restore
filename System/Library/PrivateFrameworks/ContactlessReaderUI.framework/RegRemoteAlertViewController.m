@interface RegRemoteAlertViewController
- (_TtC19ContactlessReaderUI28RegRemoteAlertViewController)initWithCoder:(id)a3;
- (_TtC19ContactlessReaderUI28RegRemoteAlertViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation RegRemoteAlertViewController

- (void)dealloc
{
  v2 = self;
  sub_23EE1D41C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19ContactlessReaderUI28RegRemoteAlertViewController_regViewController));
  sub_23EDC4A90((uint64_t)self + OBJC_IVAR____TtC19ContactlessReaderUI28RegRemoteAlertViewController_viewDisappearListener);
  v3 = (char *)self + OBJC_IVAR____TtC19ContactlessReaderUI28RegRemoteAlertViewController_suppressible;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v3);
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for RegRemoteAlertViewController();
  [(RegRemoteAlertViewController *)&v4 viewWillAppear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4 = self;
  sub_23EE1D6D0(a3);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = (void (*)(void))sub_23EE1FD00;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  sub_23EE1D9A8(a3, v6, v7);
  sub_23EDB8970((uint64_t)v6);
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  if (v5)
  {
    *(void *)(swift_allocObject() + 16) = v5;
    v6 = sub_23EE1FC2C;
  }
  else
  {
    v6 = 0;
  }
  uint64_t v7 = self;
  sub_23EE1F928();
  sub_23EDB8970((uint64_t)v6);
}

- (_TtC19ContactlessReaderUI28RegRemoteAlertViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_23EF05418();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC19ContactlessReaderUI28RegRemoteAlertViewController *)sub_23EE1F604(v5, v7, a4);
}

- (_TtC19ContactlessReaderUI28RegRemoteAlertViewController)initWithCoder:(id)a3
{
  return (_TtC19ContactlessReaderUI28RegRemoteAlertViewController *)sub_23EE1F754(a3);
}

@end