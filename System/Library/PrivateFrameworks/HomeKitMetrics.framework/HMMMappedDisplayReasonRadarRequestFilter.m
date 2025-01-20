@interface HMMMappedDisplayReasonRadarRequestFilter
- (BOOL)shouldRequestRadarForDisplayReason:(id)a3;
- (HMMMappedDisplayReasonRadarRequestFilter)init;
- (void)radarRequestedForDisplayReason:(id)a3;
@end

@implementation HMMMappedDisplayReasonRadarRequestFilter

- (BOOL)shouldRequestRadarForDisplayReason:(id)a3
{
  uint64_t v4 = sub_1D49B36B0();
  uint64_t v6 = v5;
  v7 = self;
  v8 = (void *)sub_1D499C388(v4, v6);
  v9 = (void *)sub_1D49B36A0();
  unsigned __int8 v10 = objc_msgSend(v8, sel_shouldRequestRadarForDisplayReason_, v9);

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  return v10;
}

- (void)radarRequestedForDisplayReason:(id)a3
{
  uint64_t v4 = sub_1D49B36B0();
  uint64_t v6 = v5;
  v7 = self;
  v8 = (void *)sub_1D499C388(v4, v6);
  id v9 = (id)sub_1D49B36A0();
  objc_msgSend(v8, sel_radarRequestedForDisplayReason_, v9);

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

- (HMMMappedDisplayReasonRadarRequestFilter)init
{
  result = (HMMMappedDisplayReasonRadarRequestFilter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

@end