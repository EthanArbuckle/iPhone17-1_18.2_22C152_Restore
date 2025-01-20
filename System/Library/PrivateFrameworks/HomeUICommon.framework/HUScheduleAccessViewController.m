@interface HUScheduleAccessViewController
- (HUScheduleAccessViewController)initWithCoder:(id)a3;
- (HUScheduleAccessViewController)initWithGuestAccessSchedule:(id)a3 tintColor:(id)a4 shouldDisplayAlwaysAllowedSchedule:(BOOL)a5 scheduleBackgroundColor:(id)a6 listRowBackgroundColor:(id)a7;
- (HUScheduleAccessViewController)initWithHomeID:(id)a3 tintColor:(id)a4;
- (HUScheduleAccessViewController)initWithHomeID:(id)a3 tintColor:(id)a4 listRowBackgroundColor:(id)a5;
- (HUScheduleAccessViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation HUScheduleAccessViewController

- (HUScheduleAccessViewController)initWithGuestAccessSchedule:(id)a3 tintColor:(id)a4 shouldDisplayAlwaysAllowedSchedule:(BOOL)a5 scheduleBackgroundColor:(id)a6 listRowBackgroundColor:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  return (HUScheduleAccessViewController *)HUScheduleAccessViewController.init(guestAccessSchedule:tintColor:shouldDisplayAlwaysAllowedSchedule:scheduleBackgroundColor:listRowBackgroundColor:)(a3, v13, v9, v14, a7);
}

- (HUScheduleAccessViewController)initWithHomeID:(id)a3 tintColor:(id)a4
{
  uint64_t v6 = sub_252772300();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  BOOL v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2527722E0();
  id v10 = a4;
  v11 = (void *)sub_2527722C0();
  id v12 = [(HUScheduleAccessViewController *)self initWithHomeID:v11 tintColor:v10 listRowBackgroundColor:0];

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (HUScheduleAccessViewController)initWithHomeID:(id)a3 tintColor:(id)a4 listRowBackgroundColor:(id)a5
{
  uint64_t v7 = sub_252772300();
  MEMORY[0x270FA5388](v7 - 8);
  BOOL v9 = (void (*)(char *, uint64_t))((char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2527722E0();
  id v10 = a4;
  id v11 = a5;
  return (HUScheduleAccessViewController *)HUScheduleAccessViewController.init(homeID:tintColor:listRowBackgroundColor:)(v9, v10, (char *)a5);
}

- (HUScheduleAccessViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_25276E7FC();
}

- (HUScheduleAccessViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  sub_25276E7FC();
}

- (void)viewDidLoad
{
  v2 = self;
  HUScheduleAccessViewController.viewDidLoad()();
}

- (void).cxx_destruct
{
  sub_252768FC8(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___HUScheduleAccessViewController_scheduleAccessList), *(void *)((char *)&self->super.super._responderFlags+ OBJC_IVAR___HUScheduleAccessViewController_scheduleAccessList));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HUScheduleAccessViewController_hostingController));
  swift_release();
}

@end