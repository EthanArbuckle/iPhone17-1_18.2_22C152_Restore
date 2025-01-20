@interface AnnotationViewController
- (AnnotationViewController)initWithCoder:(id)a3;
- (AnnotationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (BOOL)_canShowWhileLocked;
- (BOOL)shouldAutorotate;
- (UINavigationItem)navigationItem;
- (unint64_t)supportedInterfaceOrientations;
- (void)dealloc;
- (void)done:(id)a3;
- (void)sidecarController:(id)a3 sendOPACKObject:(id)a4;
- (void)sidecarControllerCancelled:(id)a3;
- (void)viewDidLoad;
@end

@implementation AnnotationViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (UINavigationItem)navigationItem
{
  id v2 = sub_100005268();

  return (UINavigationItem *)v2;
}

- (void)dealloc
{
  id v2 = self;
  sub_100005278();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___AnnotationViewController_markupStream);
}

- (void)viewDidLoad
{
  id v2 = self;
  sub_1000053A0();
}

- (void)done:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_10000A2C0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_100006A30();

  sub_100008410((uint64_t)v6);
}

- (AnnotationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return (AnnotationViewController *)sub_100007D50((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, void *))sub_100007538);
}

- (AnnotationViewController)initWithCoder:(id)a3
{
  return (AnnotationViewController *)sub_100007690(a3);
}

- (void)sidecarController:(id)a3 sendOPACKObject:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  sub_10000A2C0();
  uint64_t v7 = swift_unknownObjectRelease();
  sub_1000077E0(v7, (uint64_t)v8);

  sub_1000080D8((uint64_t)v8);
}

- (void)sidecarControllerCancelled:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100007978();
}

@end