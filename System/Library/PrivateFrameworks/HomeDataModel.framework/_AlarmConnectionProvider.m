@interface _AlarmConnectionProvider
- (_TtC13HomeDataModelP33_06687A056795A35B04F0AB8E8B09184924_AlarmConnectionProvider)init;
- (id)alarmManagerServiceConnection;
@end

@implementation _AlarmConnectionProvider

- (id)alarmManagerServiceConnection
{
  v2 = self;
  id v3 = sub_251D5C34C();

  return v3;
}

- (_TtC13HomeDataModelP33_06687A056795A35B04F0AB8E8B09184924_AlarmConnectionProvider)init
{
  return (_TtC13HomeDataModelP33_06687A056795A35B04F0AB8E8B09184924_AlarmConnectionProvider *)sub_251D5C920((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC13HomeDataModelP33_06687A056795A35B04F0AB8E8B09184924_AlarmConnectionProvider__alarmManagerServiceConnection, (uint64_t (*)(void))type metadata accessor for _AlarmConnectionProvider);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13HomeDataModelP33_06687A056795A35B04F0AB8E8B09184924_AlarmConnectionProvider__alarmManagerServiceConnection));
}

@end