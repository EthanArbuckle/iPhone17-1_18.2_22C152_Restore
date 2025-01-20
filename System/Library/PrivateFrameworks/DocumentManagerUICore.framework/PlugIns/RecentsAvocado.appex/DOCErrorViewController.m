@interface DOCErrorViewController
- (_TtC14RecentsAvocado22DOCErrorViewController)initWithCoder:(id)a3;
- (void)actionController:(id)a3 presentError:(id)a4 completion:(id)a5;
- (void)actionControllerDidFinishAction:(id)a3 error:(id)a4;
- (void)applicationDidBecomeActive:(id)a3;
- (void)docUpdateContentUnavailableConfigurationUsingState:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation DOCErrorViewController

- (_TtC14RecentsAvocado22DOCErrorViewController)initWithCoder:(id)a3
{
  result = (_TtC14RecentsAvocado22DOCErrorViewController *)sub_1004CF6B0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1002CCA30();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1002CCBB4(a3);
}

- (void)willMoveToParentViewController:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = self;
  if (!a3) {
    sub_1002CC870(1);
  }
  v8.receiver = v6;
  v8.super_class = ObjectType;
  id v7 = a3;
  [(DOCErrorViewController *)&v8 willMoveToParentViewController:v7];
}

- (void)docUpdateContentUnavailableConfigurationUsingState:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1002CFD58();
}

- (void)applicationDidBecomeActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1002D0008();
}

- (void).cxx_destruct
{
  swift_errorRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado22DOCErrorViewController_source));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado22DOCErrorViewController_location));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC14RecentsAvocado22DOCErrorViewController_authenticationAction);
}

- (void)actionControllerDidFinishAction:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = a4;
  sub_1002D0144((uint64_t)a4);
}

- (void)actionController:(id)a3 presentError:(id)a4 completion:(id)a5
{
  id v8 = _Block_copy(a5);
  id v9 = a3;
  id v12 = a4;
  v10 = self;
  v11 = (void *)sub_1004CAA50();
  DOCPresentAlertForError();

  _Block_release(v8);
}

@end