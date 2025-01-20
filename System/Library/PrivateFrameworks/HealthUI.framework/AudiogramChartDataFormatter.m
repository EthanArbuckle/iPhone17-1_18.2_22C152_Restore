@interface AudiogramChartDataFormatter
- (_TtC8HealthUI27AudiogramChartDataFormatter)init;
- (id)unitStringFromUnit:(id)a3 number:(id)a4;
- (id)valueStringFromNumber:(id)a3;
@end

@implementation AudiogramChartDataFormatter

- (_TtC8HealthUI27AudiogramChartDataFormatter)init
{
  sub_1E0ECD800();
  swift_bridgeObjectRelease();
  result = (_TtC8HealthUI27AudiogramChartDataFormatter *)sub_1E0ECD8F0();
  __break(1u);
  return result;
}

- (id)unitStringFromUnit:(id)a3 number:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  v9 = [(HKInteractiveChartDataFormatter *)v8 unitController];
  if (v9)
  {
    v10 = v9;
    id v11 = [(HKUnitPreferenceController *)v9 localizedDisplayNameForUnit:v6 value:v7];

    sub_1E0ECD1D0();
  }
  else
  {
  }
  v12 = (void *)sub_1E0ECD190();
  swift_bridgeObjectRelease();
  return v12;
}

- (id)valueStringFromNumber:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_msgSend(v4, sel_doubleValue);
  double v7 = HKRoundWithPositiveZeroForDoubleValue(v6);
  sub_1E0E3B45C();
  uint64_t v8 = swift_allocObject();
  uint64_t v9 = MEMORY[0x1E4FBB3D0];
  *(_OWORD *)(v8 + 16) = xmmword_1E0F07C90;
  uint64_t v10 = MEMORY[0x1E4FBB460];
  *(void *)(v8 + 56) = v9;
  *(void *)(v8 + 64) = v10;
  *(double *)(v8 + 32) = v7;
  sub_1E0ECD1E0();

  id v11 = (void *)sub_1E0ECD190();
  swift_bridgeObjectRelease();
  return v11;
}

@end