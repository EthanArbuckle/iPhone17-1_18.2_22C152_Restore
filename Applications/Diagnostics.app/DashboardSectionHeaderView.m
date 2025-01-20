@interface DashboardSectionHeaderView
- (_TtC11Diagnostics26DashboardSectionHeaderView)initWithCoder:(id)a3;
- (_TtC11Diagnostics26DashboardSectionHeaderView)initWithFrame:(CGRect)a3;
- (void)buttonDownWithSender:(id)a3;
- (void)buttonPressedWithSender:(id)a3;
- (void)buttonUpWithSender:(id)a3;
- (void)layoutSubviews;
- (void)tintColorDidChange;
@end

@implementation DashboardSectionHeaderView

- (_TtC11Diagnostics26DashboardSectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC11Diagnostics26DashboardSectionHeaderView *)sub_1000EEBB0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11Diagnostics26DashboardSectionHeaderView)initWithCoder:(id)a3
{
  return (_TtC11Diagnostics26DashboardSectionHeaderView *)sub_1000EEF28(a3);
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DashboardSectionHeaderView();
  v2 = (char *)v5.receiver;
  [(DashboardSectionHeaderView *)&v5 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC11Diagnostics26DashboardSectionHeaderView_button];
  id v4 = [v3 layer];
  [v3 bounds];
  [v4 setCornerRadius:CGRectGetHeight(v6) * 0.5];
}

- (void)buttonPressedWithSender:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_1000F023C();
}

- (void)buttonDownWithSender:(id)a3
{
  id v5 = objc_allocWithZone((Class)UIColor);
  id v6 = a3;
  v7 = self;
  id v8 = [v5 initWithRed:0.0 green:0.5 blue:1.0 alpha:0.125];
  id v9 = [v8 CGColor];

  sub_1000EFE10((uint64_t)v9);
}

- (void)buttonUpWithSender:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [(DashboardSectionHeaderView *)v5 tintColor];
  if (v6)
  {
    v7 = v6;
    id v8 = [v6 CGColor];

    sub_1000EFE10((uint64_t)v8);
  }
  else
  {
    __break(1u);
  }
}

- (void)tintColorDidChange
{
  v2 = self;
  id v3 = [(DashboardSectionHeaderView *)v2 tintColor];
  if (v3)
  {
    id v4 = v3;
    id v5 = [v3 CGColor];

    sub_1000EFE10((uint64_t)v5);
  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  sub_10003B0B8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC11Diagnostics26DashboardSectionHeaderView_buttonAction));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics26DashboardSectionHeaderView_label));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11Diagnostics26DashboardSectionHeaderView_button);
}

@end