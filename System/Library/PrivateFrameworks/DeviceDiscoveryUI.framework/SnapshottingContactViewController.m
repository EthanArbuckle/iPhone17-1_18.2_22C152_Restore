@interface SnapshottingContactViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (_TtC17DeviceDiscoveryUI33SnapshottingContactViewController)initWithCoder:(id)a3;
- (_TtC17DeviceDiscoveryUI33SnapshottingContactViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)contactViewController:(id)a3 didDeleteContact:(id)a4;
- (void)didTapDone;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation SnapshottingContactViewController

- (_TtC17DeviceDiscoveryUI33SnapshottingContactViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC17DeviceDiscoveryUI33SnapshottingContactViewController_phase) = 0;
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC17DeviceDiscoveryUI33SnapshottingContactViewController_dismiss);
  void *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17DeviceDiscoveryUI33SnapshottingContactViewController____lazy_storage___viewController) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17DeviceDiscoveryUI33SnapshottingContactViewController_snapshotView) = 0;
  id v5 = a3;

  result = (_TtC17DeviceDiscoveryUI33SnapshottingContactViewController *)sub_24CBABA18();
  __break(1u);
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  v3 = self;
  sub_24CB90FDC();
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)didTapDone
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC17DeviceDiscoveryUI33SnapshottingContactViewController_dismiss);
  if (v2)
  {
    v4 = self;
    uint64_t v3 = sub_24CB1A484((uint64_t)v2);
    v2(v3);
    sub_24CB0BDEC((uint64_t)v2);
  }
}

- (void)contactViewController:(id)a3 didDeleteContact:(id)a4
{
  v4 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC17DeviceDiscoveryUI33SnapshottingContactViewController_dismiss);
  if (v4)
  {
    id v7 = a3;
    id v8 = a4;
    v10 = self;
    uint64_t v9 = sub_24CB1A484((uint64_t)v4);
    v4(v9);
    sub_24CB0BDEC((uint64_t)v4);
  }
}

- (_TtC17DeviceDiscoveryUI33SnapshottingContactViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC17DeviceDiscoveryUI33SnapshottingContactViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17DeviceDiscoveryUI33SnapshottingContactViewController_contact));
  sub_24CB0BDEC(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC17DeviceDiscoveryUI33SnapshottingContactViewController_dismiss));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17DeviceDiscoveryUI33SnapshottingContactViewController____lazy_storage___viewController));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC17DeviceDiscoveryUI33SnapshottingContactViewController_snapshotView);
}

@end