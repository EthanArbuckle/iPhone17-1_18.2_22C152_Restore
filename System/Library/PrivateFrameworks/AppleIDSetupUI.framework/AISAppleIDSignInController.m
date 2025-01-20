@interface AISAppleIDSignInController
- (AISAppleIDSignInConfiguration)configuration;
- (AISAppleIDSignInController)init;
- (AISAppleIDSignInController)initWithConfiguration:(id)a3;
- (AISAppleIDSignInControllerDelegate)delegate;
- (UIViewController)hostingViewController;
- (void)presentWithViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setHostingViewController:(id)a3;
@end

@implementation AISAppleIDSignInController

- (AISAppleIDSignInConfiguration)configuration
{
  return (AISAppleIDSignInConfiguration *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                  + OBJC_IVAR___AISAppleIDSignInController_configuration));
}

- (AISAppleIDSignInControllerDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR___AISAppleIDSignInController_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x24C579D50](v2);
  return (AISAppleIDSignInControllerDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (UIViewController)hostingViewController
{
  v2 = self;
  id v3 = sub_248332794();

  return (UIViewController *)v3;
}

- (void)setHostingViewController:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___AISAppleIDSignInController____lazy_storage___hostingViewController);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AISAppleIDSignInController____lazy_storage___hostingViewController) = (Class)a3;
  id v3 = a3;
}

- (AISAppleIDSignInController)initWithConfiguration:(id)a3
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AISAppleIDSignInController____lazy_storage___hostingViewController) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AISAppleIDSignInController_configuration) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for AISAppleIDSignInController();
  id v5 = a3;
  return [(AISAppleIDSignInController *)&v7 init];
}

- (void)presentWithViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  v8 = _Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    v10 = sub_2483334E4;
  }
  else
  {
    v10 = 0;
    uint64_t v9 = 0;
  }
  id v11 = a3;
  v12 = self;
  id v13 = sub_248332794();
  if (v8)
  {
    v14[4] = v10;
    v14[5] = v9;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 1107296256;
    v14[2] = sub_24831A5A0;
    v14[3] = &block_descriptor_11_0;
    v8 = _Block_copy(v14);
    swift_retain();
    swift_release();
  }
  objc_msgSend(v11, sel_presentViewController_animated_completion_, v13, v5, v8);
  _Block_release(v8);

  sub_2482F50B4((uint64_t)v10);
}

- (AISAppleIDSignInController)init
{
  result = (AISAppleIDSignInController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2482C3D88((uint64_t)self + OBJC_IVAR___AISAppleIDSignInController_delegate);
  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___AISAppleIDSignInController____lazy_storage___hostingViewController);
}

@end