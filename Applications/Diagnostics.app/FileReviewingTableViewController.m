@interface FileReviewingTableViewController
- (BOOL)hasSecondaryButton;
- (_TtC11Diagnostics32FileReviewingTableViewController)init;
- (_TtC11Diagnostics32FileReviewingTableViewController)initWithCoder:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FileReviewingTableViewController

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_100072D30(a3);
}

- (BOOL)hasSecondaryButton
{
  v2 = self;
  id v3 = (id)MobileGestalt_get_current_device();
  if (v3)
  {
    v4 = v3;
    char containsCellularRadioCapability = MobileGestalt_get_containsCellularRadioCapability();

    LOBYTE(v3) = containsCellularRadioCapability;
  }
  else
  {
    __break(1u);
  }
  return (char)v3;
}

- (_TtC11Diagnostics32FileReviewingTableViewController)init
{
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC11Diagnostics32FileReviewingTableViewController_activationReason) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11Diagnostics32FileReviewingTableViewController_remoteFiles) = (Class)_swiftEmptyArrayStorage;
  id v3 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC11Diagnostics32FileReviewingTableViewController_completion);
  v4 = (objc_class *)type metadata accessor for FileReviewingTableViewController();
  *id v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(ConsentNoticeTableViewController *)&v6 init];
}

- (_TtC11Diagnostics32FileReviewingTableViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC11Diagnostics32FileReviewingTableViewController_activationReason) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11Diagnostics32FileReviewingTableViewController_remoteFiles) = (Class)_swiftEmptyArrayStorage;
  v5 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC11Diagnostics32FileReviewingTableViewController_completion);
  objc_super v6 = (objc_class *)type metadata accessor for FileReviewingTableViewController();
  void *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(ConsentNoticeTableViewController *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC11Diagnostics32FileReviewingTableViewController_completion);

  sub_10003B0B8(v3);
}

@end