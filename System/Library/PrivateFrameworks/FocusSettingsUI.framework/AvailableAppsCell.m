@interface AvailableAppsCell
- (_TtC15FocusSettingsUIP33_2EF9E2442F70F98F7D31043B99BD6EC917AvailableAppsCell)initWithCoder:(id)a3;
- (_TtC15FocusSettingsUIP33_2EF9E2442F70F98F7D31043B99BD6EC917AvailableAppsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)dealloc;
@end

@implementation AvailableAppsCell

- (_TtC15FocusSettingsUIP33_2EF9E2442F70F98F7D31043B99BD6EC917AvailableAppsCell)initWithCoder:(id)a3
{
  return (_TtC15FocusSettingsUIP33_2EF9E2442F70F98F7D31043B99BD6EC917AvailableAppsCell *)sub_220EB1290(a3);
}

- (_TtC15FocusSettingsUIP33_2EF9E2442F70F98F7D31043B99BD6EC917AvailableAppsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_220F32768();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC15FocusSettingsUIP33_2EF9E2442F70F98F7D31043B99BD6EC917AvailableAppsCell *)sub_220EB1418(a3, (uint64_t)a4, v6);
}

- (void)dealloc
{
  v2 = self;
  sub_220EB1FB0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15FocusSettingsUIP33_2EF9E2442F70F98F7D31043B99BD6EC917AvailableAppsCell_stateIconSelectedTintColor));
  sub_220D67630(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC15FocusSettingsUIP33_2EF9E2442F70F98F7D31043B99BD6EC917AvailableAppsCell_updateAppIcon));
  swift_release();
  sub_220E88B48((uint64_t)self+ OBJC_IVAR____TtC15FocusSettingsUIP33_2EF9E2442F70F98F7D31043B99BD6EC917AvailableAppsCell_changeObserver);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15FocusSettingsUIP33_2EF9E2442F70F98F7D31043B99BD6EC917AvailableAppsCell____lazy_storage___stateIconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15FocusSettingsUIP33_2EF9E2442F70F98F7D31043B99BD6EC917AvailableAppsCell____lazy_storage___appIconView));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC15FocusSettingsUIP33_2EF9E2442F70F98F7D31043B99BD6EC917AvailableAppsCell____lazy_storage___appNameLabel);
}

@end