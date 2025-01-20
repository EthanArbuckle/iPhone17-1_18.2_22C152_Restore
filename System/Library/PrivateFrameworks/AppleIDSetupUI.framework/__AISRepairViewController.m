@interface __AISRepairViewController
- (BOOL)shouldAutoDismiss;
- (__AISRepairViewController)initWithCoder:(id)a3;
- (__AISRepairViewController)initWithContext:(id)a3 reportHandler:(id)a4;
- (__AISRepairViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)setShouldAutoDismiss:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation __AISRepairViewController

- (BOOL)shouldAutoDismiss
{
  v2 = (BOOL *)self + OBJC_IVAR_____AISRepairViewController_shouldAutoDismiss;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldAutoDismiss:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR_____AISRepairViewController_shouldAutoDismiss;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (__AISRepairViewController)initWithContext:(id)a3 reportHandler:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a3;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_2483435FC;
  *(void *)(v8 + 24) = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_248311010;
  *(void *)(v9 + 24) = v6;
  id v10 = objc_allocWithZone((Class)type metadata accessor for RepairViewController());
  id v11 = a3;
  v12 = RepairViewController.init(contextBuilder:reportHandler:)((uint64_t)sub_248341A50, v8, (uint64_t)sub_24834361C, v9);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (__AISRepairViewController *)v12;
}

- (__AISRepairViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR_____AISRepairViewController_shouldAutoDismiss) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR_____AISRepairViewController_hostingController) = 0;
  id v4 = a3;

  result = (__AISRepairViewController *)sub_24835D798();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_2483422A0();
}

- (__AISRepairViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (__AISRepairViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end