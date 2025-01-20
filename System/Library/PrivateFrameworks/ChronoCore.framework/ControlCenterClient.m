@interface ControlCenterClient
- (_TtC10ChronoCoreP33_84732AEFC5C87E9DA72C67176FE0A3AA19ControlCenterClient)init;
- (void)currentConfigurations:(id)a3;
- (void)reloadAllControlsForBundleIdentifier:(id)a3;
- (void)reloadControlsOfKind:(id)a3;
@end

@implementation ControlCenterClient

- (_TtC10ChronoCoreP33_84732AEFC5C87E9DA72C67176FE0A3AA19ControlCenterClient)init
{
  result = (_TtC10ChronoCoreP33_84732AEFC5C87E9DA72C67176FE0A3AA19ControlCenterClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ChronoCoreP33_84732AEFC5C87E9DA72C67176FE0A3AA19ControlCenterClient__processHandle));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ChronoCoreP33_84732AEFC5C87E9DA72C67176FE0A3AA19ControlCenterClient__queue));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC10ChronoCoreP33_84732AEFC5C87E9DA72C67176FE0A3AA19ControlCenterClient__queue_connection);
}

- (void)reloadAllControlsForBundleIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1DAD27918();
    unint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    unint64_t v6 = 0;
  }
  v7 = self;
  sub_1DAC7F480(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)reloadControlsOfKind:(id)a3
{
  uint64_t v4 = sub_1DAD27918();
  uint64_t v6 = v5;
  v7 = self;
  sub_1DAC80098(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)currentConfigurations:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_1DAC81344((uint64_t)v5, v4);
  _Block_release(v4);
  _Block_release(v4);
}

@end