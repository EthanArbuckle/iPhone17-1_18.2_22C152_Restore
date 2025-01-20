@interface HKAudiogramLongitudinalOverlayRoomViewController
- (BOOL)infographicSupportedForDisplayType:(id)a3 healthStore:(id)a4;
- (HKAudiogramLongitudinalOverlayRoomViewController)initWithApplicationItems:(id)a3 factorDisplayTypes:(id)a4;
- (HKAudiogramLongitudinalOverlayRoomViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 factorDisplayTypes:(id)a5 mode:(int64_t)a6;
- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5;
- (id)controllerTitleWithApplicationItems:(id)a3;
- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5;
- (id)infographicViewControllerForDisplayType:(id)a3 healthStore:(id)a4;
- (id)primaryDisplayTypeWithApplicationItems:(id)a3;
- (id)stringForValueRange:(id)a3 timeScope:(int64_t)a4;
- (void)viewDidLoad;
@end

@implementation HKAudiogramLongitudinalOverlayRoomViewController

- (HKAudiogramLongitudinalOverlayRoomViewController)initWithApplicationItems:(id)a3 factorDisplayTypes:(id)a4
{
  sub_1E0DF2C04(0, (unint64_t *)&unk_1EAD6DAF0);
  sub_1E0ECD330();
  id v6 = a3;
  v7 = (void *)sub_1E0ECD320();
  swift_bridgeObjectRelease();
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for AudiogramLongitudinalOverlayRoomViewController();
  v8 = [(HKOverlayRoomViewController *)&v10 initWithDisplayDate:0 applicationItems:v6 factorDisplayTypes:v7 mode:3];

  return v8;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AudiogramLongitudinalOverlayRoomViewController();
  id v2 = v5.receiver;
  [(HKOverlayRoomViewController *)&v5 viewDidLoad];
  id v3 = objc_msgSend(v2, sel_chartController, v5.receiver, v5.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_setCurrentValueViewDataSourceDelegate_, v2);
  }
  sub_1E0DF19D8();
}

- (id)controllerTitleWithApplicationItems:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_1E0DF241C(v4);

  id v6 = (void *)sub_1E0ECD190();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)primaryDisplayTypeWithApplicationItems:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_1E0E252F4(v4);
  v7 = v6;

  return v7;
}

- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = self;
  sub_1E0DF27B0();

  sub_1E0DF2C04(0, (unint64_t *)&unk_1EAD6F530);
  objc_super v10 = (void *)sub_1E0ECD320();
  swift_bridgeObjectRelease();
  return v10;
}

- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5
{
  sub_1E0DF2AF8();
  MEMORY[0x1F4188790](v6 - 8, v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_1E0ECB940();
    uint64_t v10 = sub_1E0ECB980();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    uint64_t v11 = sub_1E0ECB980();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
  }
  sub_1E0DF0AA0((uint64_t)v9);
  return 0;
}

- (HKAudiogramLongitudinalOverlayRoomViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 factorDisplayTypes:(id)a5 mode:(int64_t)a6
{
  sub_1E0DF2AF8();
  MEMORY[0x1F4188790](v8 - 8, v9);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1E0ECB940();
    uint64_t v12 = sub_1E0ECB980();
    uint64_t v14 = 0;
    uint64_t v13 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
  }
  else
  {
    uint64_t v12 = sub_1E0ECB980();
    uint64_t v13 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = 1;
  }
  (*v13)(v11, v14, 1, v12);
  id v15 = a4;
  result = (HKAudiogramLongitudinalOverlayRoomViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)infographicSupportedForDisplayType:(id)a3 healthStore:(id)a4
{
  return 1;
}

- (id)infographicViewControllerForDisplayType:(id)a3 healthStore:(id)a4
{
  id v4 = objc_msgSend(self, sel_hearingLossInfographicViewController);
  return v4;
}

- (id)stringForValueRange:(id)a3 timeScope:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  uint64_t v8 = [(HKOverlayRoomViewController *)v7 chartController];
  if (v8
    && (uint64_t v9 = v8,
        id v10 = [(HKInteractiveChartViewController *)v8 stringForValueRange:v6 timeScope:a4], v9, v10))
  {
    sub_1E0ECD1D0();

    uint64_t v11 = (void *)sub_1E0ECD190();
    swift_bridgeObjectRelease();
  }
  else
  {

    uint64_t v11 = 0;
  }
  return v11;
}

@end