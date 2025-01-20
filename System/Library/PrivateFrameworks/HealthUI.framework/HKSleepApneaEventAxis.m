@interface HKSleepApneaEventAxis
- (HKSleepApneaEventAxis)initWithConfiguration:(id)a3;
- (HKSleepApneaEventAxis)initWithDisplayType:(id)a3;
- (id)findAxisLabelsInModelRange:(id)a3 zoomScale:(double)a4;
@end

@implementation HKSleepApneaEventAxis

- (HKSleepApneaEventAxis)initWithDisplayType:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___HKSleepApneaEventAxis_displayType) = (Class)a3;
  id v5 = objc_allocWithZone((Class)HKNumericAxisConfiguration);
  id v6 = a3;
  id v7 = objc_msgSend(v5, sel_init);
  v8 = self;
  id v9 = v7;
  id v10 = objc_msgSend(v8, sel_preferredAxisStyle);
  objc_msgSend(v9, sel_setPreferredStyle_, v10);

  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for SleepApneaEventAxis();
  v11 = [(HKNumericAxis *)&v13 initWithConfiguration:v9];

  return v11;
}

- (id)findAxisLabelsInModelRange:(id)a3 zoomScale:(double)a4
{
  id v5 = a3;
  id v6 = self;
  uint64_t v7 = sub_1E0E51EEC(v5);

  if (v7)
  {
    sub_1E0E52230();
    v8 = (void *)sub_1E0ECD320();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (HKSleepApneaEventAxis)initWithConfiguration:(id)a3
{
  id v3 = a3;
  result = (HKSleepApneaEventAxis *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end