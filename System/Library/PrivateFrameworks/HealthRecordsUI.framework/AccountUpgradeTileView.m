@interface AccountUpgradeTileView
- (_TtC15HealthRecordsUI22AccountUpgradeTileView)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI22AccountUpgradeTileView)initWithFrame:(CGRect)a3;
- (void)dismissAction;
- (void)upgradeAction;
@end

@implementation AccountUpgradeTileView

- (_TtC15HealthRecordsUI22AccountUpgradeTileView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C22CB11C();
}

- (void)upgradeAction
{
  id v3 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC15HealthRecordsUI22AccountUpgradeTileView_configurationProvider);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  __swift_project_boxed_opaque_existential_1Tm(v3, v4);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 56);
  v7 = self;
  v6(v4, v5);
}

- (void)dismissAction
{
  id v3 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC15HealthRecordsUI22AccountUpgradeTileView_configurationProvider);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  __swift_project_boxed_opaque_existential_1Tm(v3, v4);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 64);
  v7 = self;
  v6(v4, v5);
}

- (_TtC15HealthRecordsUI22AccountUpgradeTileView)initWithFrame:(CGRect)a3
{
  result = (_TtC15HealthRecordsUI22AccountUpgradeTileView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC15HealthRecordsUI22AccountUpgradeTileView_configurationProvider);
  sub_1C22CB0FC(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC15HealthRecordsUI22AccountUpgradeTileView____lazy_storage___clipboardIcon));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI22AccountUpgradeTileView____lazy_storage___iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI22AccountUpgradeTileView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI22AccountUpgradeTileView____lazy_storage___bodyLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI22AccountUpgradeTileView____lazy_storage___separator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI22AccountUpgradeTileView____lazy_storage___actionButton));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15HealthRecordsUI22AccountUpgradeTileView____lazy_storage___dismissButton);
}

@end