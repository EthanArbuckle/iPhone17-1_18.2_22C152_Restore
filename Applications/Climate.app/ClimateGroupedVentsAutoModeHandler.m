@interface ClimateGroupedVentsAutoModeHandler
- (_TtC7Climate34ClimateGroupedVentsAutoModeHandler)init;
- (void)ventService:(id)a3 didUpdateAutoMode:(BOOL)a4;
@end

@implementation ClimateGroupedVentsAutoModeHandler

- (_TtC7Climate34ClimateGroupedVentsAutoModeHandler)init
{
  return (_TtC7Climate34ClimateGroupedVentsAutoModeHandler *)sub_10002BA64();
}

- (void)ventService:(id)a3 didUpdateAutoMode:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_10002C308(v6, a4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7Climate34ClimateGroupedVentsAutoModeHandler_disabledStateTimer));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end