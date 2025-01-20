@interface ItemWithReleaseState
+ (id)titleTextWithTitle:(id)a3 accessibilityDescription:(id)a4 systemSymbolName:(id)a5 tooltipText:(id)a6 paragraphStyle:(id)a7;
- (_TtC12GameCenterUI20ItemWithReleaseState)init;
@end

@implementation ItemWithReleaseState

+ (id)titleTextWithTitle:(id)a3 accessibilityDescription:(id)a4 systemSymbolName:(id)a5 tooltipText:(id)a6 paragraphStyle:(id)a7
{
  uint64_t v9 = sub_1AF7AE0E0();
  uint64_t v11 = v10;
  uint64_t v12 = sub_1AF7AE0E0();
  uint64_t v14 = v13;
  uint64_t v15 = sub_1AF7AE0E0();
  uint64_t v17 = v16;
  if (a6)
  {
    uint64_t v18 = sub_1AF7AE0E0();
    a6 = v19;
  }
  else
  {
    uint64_t v18 = 0;
  }
  id v20 = a7;
  id v21 = static ItemWithReleaseState.titleText(title:accessibilityDescription:systemSymbolName:tooltipText:paragraphStyle:)(v9, v11, v12, v14, v15, v17, v18, (uint64_t)a6, a7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v21;
}

- (_TtC12GameCenterUI20ItemWithReleaseState)init
{
  return (_TtC12GameCenterUI20ItemWithReleaseState *)ItemWithReleaseState.init()();
}

@end