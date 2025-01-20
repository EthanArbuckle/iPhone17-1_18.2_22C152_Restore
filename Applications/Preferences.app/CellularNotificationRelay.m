@interface CellularNotificationRelay
- (_TtC11SettingsApp25CellularNotificationRelay)init;
- (void)carrierBundleChange:(id)a3;
@end

@implementation CellularNotificationRelay

- (_TtC11SettingsApp25CellularNotificationRelay)init
{
  return (_TtC11SettingsApp25CellularNotificationRelay *)sub_1000117F0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SettingsApp25CellularNotificationRelay_telephonyClient));
}

- (void)carrierBundleChange:(id)a3
{
  v5 = self;
  id v6 = a3;
  v7 = self;
  id v8 = [v5 defaultCenter];
  id v9 = v8;
  if (qword_10015F098 != -1)
  {
    swift_once();
    id v8 = v9;
  }
  [v8 postNotificationName:qword_10016AE78 object:0];
}

@end