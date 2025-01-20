@interface ClimateZonesSyncedServiceButton
- (_TtC7Climate31ClimateZonesSyncedServiceButton)init;
- (void)zonesSyncedService:(id)a3 didUpdateOn:(BOOL)a4;
@end

@implementation ClimateZonesSyncedServiceButton

- (_TtC7Climate31ClimateZonesSyncedServiceButton)init
{
  result = (_TtC7Climate31ClimateZonesSyncedServiceButton *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate31ClimateZonesSyncedServiceButton_zonesSynced));
}

- (void)zonesSyncedService:(id)a3 didUpdateOn:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  sub_10009F8A4();
  [(ClimateZonesSyncedServiceButton *)v6 setEnabled:(unint64_t)sub_10001C874() < 8];
  sub_10008896C();
  sub_100088B54();
}

@end