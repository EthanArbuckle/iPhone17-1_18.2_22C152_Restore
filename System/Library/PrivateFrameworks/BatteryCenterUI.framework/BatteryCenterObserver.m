@interface BatteryCenterObserver
- (_TtC15BatteryCenterUI21BatteryCenterObserver)init;
- (void)connectedDevicesDidChange:(id)a3;
@end

@implementation BatteryCenterObserver

- (_TtC15BatteryCenterUI21BatteryCenterObserver)init
{
  return (_TtC15BatteryCenterUI21BatteryCenterObserver *)sub_1DADDB7DC();
}

- (void)connectedDevicesDidChange:(id)a3
{
  sub_1DADA73E8(0, &qword_1EB683680);
  unint64_t v4 = sub_1DADF6910();
  v5 = self;
  sub_1DADDBEF8(v4);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15BatteryCenterUI21BatteryCenterObserver_batteryController));

  swift_release();
}

@end