@interface RadioCarManager
- (_TtC5Media15RadioCarManager)init;
- (void)accessoryDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
- (void)carDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
- (void)carDidUpdateAccessories:(id)a3;
- (void)dismissSettingsModal;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)nowPlayingTapped;
- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
- (void)sessionDidConnect:(id)a3;
- (void)showSoundSettingsWithOverrideDark:(BOOL)a3;
@end

@implementation RadioCarManager

- (_TtC5Media15RadioCarManager)init
{
  sub_1000076B8();
  return result;
}

- (void)nowPlayingTapped
{
  v2 = self;
  sub_10000A1F8();
}

- (void)dismissSettingsModal
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Media15RadioCarManager_navigationController);
  if (v2) {
    [v2 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)showSoundSettingsWithOverrideDark:(BOOL)a3
{
  v4 = self;
  sub_10000A48C(a3);
}

- (void)accessoryDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_10000A7D4((uint64_t)v6, a4);
}

- (void)serviceDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_10000A850((uint64_t)v6, a4);
}

- (void)carDidUpdateAccessories:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000AAA0(v4);
}

- (void)carDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v5 = a3;
  id v6 = self;
  sub_10000B12C(v5, "%@ has updated receivedAllValues");
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  sub_10000B2E4(v8);
}

- (void)sessionDidConnect:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10000B3C0();
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

@end