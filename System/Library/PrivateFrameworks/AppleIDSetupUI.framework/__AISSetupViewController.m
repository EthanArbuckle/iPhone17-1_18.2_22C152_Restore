@interface __AISSetupViewController
- (BOOL)isPreEstablishedClient;
- (BOOL)shouldAutoDismiss;
- (__AISSetupViewController)initWithCoder:(id)a3;
- (__AISSetupViewController)initWithContext:(id)a3 dontSuggestUserAction:(id)a4 skipAction:(id)a5 shouldAutoDismiss:(BOOL)a6 isPreEstablishedClient:(BOOL)a7 reportHandler:(id)a8;
- (__AISSetupViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)setIsPreEstablishedClient:(BOOL)a3;
- (void)setShouldAutoDismiss:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation __AISSetupViewController

- (BOOL)shouldAutoDismiss
{
  return sub_24830E290(self);
}

- (void)setShouldAutoDismiss:(BOOL)a3
{
}

- (BOOL)isPreEstablishedClient
{
  return sub_24830E290(self);
}

- (void)setIsPreEstablishedClient:(BOOL)a3
{
}

- (__AISSetupViewController)initWithContext:(id)a3 dontSuggestUserAction:(id)a4 skipAction:(id)a5 shouldAutoDismiss:(BOOL)a6 isPreEstablishedClient:(BOOL)a7 reportHandler:(id)a8
{
  v13 = _Block_copy(a8);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v13;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a3;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = sub_2483112D0;
  *(void *)(v16 + 24) = v15;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = sub_248311010;
  *(void *)(v17 + 24) = v14;
  id v18 = objc_allocWithZone((Class)type metadata accessor for SetupViewController());
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  v22 = SetupViewController.init(dontSuggestUserAction:skipAction:shouldAutoDismiss:isPreEstablishedClient:contextBuilder:reportHandler:)(a4, a5, a6, a7, (uint64_t)sub_24830F54C, v16, (uint64_t)sub_2483112F4, v17);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (__AISSetupViewController *)v22;
}

- (__AISSetupViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR_____AISSetupViewController_hostingController) = 0;
  id v4 = a3;

  result = (__AISSetupViewController *)sub_24835D798();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_24830FDBC();
}

- (__AISSetupViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (__AISSetupViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR_____AISSetupViewController_hostingController);
}

@end