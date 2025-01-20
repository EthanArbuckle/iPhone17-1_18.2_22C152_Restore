@interface _TimerConnectionProvider
- (_TtC13HomeDataModelP33_06687A056795A35B04F0AB8E8B09184924_TimerConnectionProvider)init;
- (id)timerManagerServiceConnection;
@end

@implementation _TimerConnectionProvider

- (id)timerManagerServiceConnection
{
  v2 = self;
  id v3 = sub_251D5C62C();

  return v3;
}

- (_TtC13HomeDataModelP33_06687A056795A35B04F0AB8E8B09184924_TimerConnectionProvider)init
{
  return (_TtC13HomeDataModelP33_06687A056795A35B04F0AB8E8B09184924_TimerConnectionProvider *)sub_251D5C920((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC13HomeDataModelP33_06687A056795A35B04F0AB8E8B09184924_TimerConnectionProvider__timerManagerServiceConnection, (uint64_t (*)(void))type metadata accessor for _TimerConnectionProvider);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13HomeDataModelP33_06687A056795A35B04F0AB8E8B09184924_TimerConnectionProvider__timerManagerServiceConnection));
}

@end