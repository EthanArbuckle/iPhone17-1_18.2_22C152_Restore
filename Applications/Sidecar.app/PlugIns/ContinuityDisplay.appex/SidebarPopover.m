@interface SidebarPopover
- (BOOL)_canShowWhileLocked;
- (_TtC17ContinuityDisplay14SidebarPopover)initWithCoder:(id)a3;
- (_TtC17ContinuityDisplay14SidebarPopover)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)preferredUserInterfaceStyle;
- (void)loadView;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SidebarPopover

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC17ContinuityDisplay14SidebarPopover)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100020CA0();
}

- (int64_t)preferredUserInterfaceStyle
{
  return 2;
}

- (void)loadView
{
  v2 = self;
  sub_100020D6C();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_100021338(a3);
}

- (_TtC17ContinuityDisplay14SidebarPopover)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_10005E920();
  }
  id v5 = a4;
  sub_100021450();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17ContinuityDisplay14SidebarPopover_titleField));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC17ContinuityDisplay14SidebarPopover_detailsField);
}

@end