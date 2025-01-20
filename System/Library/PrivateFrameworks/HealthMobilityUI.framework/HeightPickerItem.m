@interface HeightPickerItem
- (_TtC16HealthMobilityUI16HeightPickerItem)init;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
@end

@implementation HeightPickerItem

- (_TtC16HealthMobilityUI16HeightPickerItem)init
{
  result = (_TtC16HealthMobilityUI16HeightPickerItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1E0ACD748((uint64_t)self + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_delegate);

  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC16HealthMobilityUI16HeightPickerItem_valueFormatter);
  swift_bridgeObjectRelease();
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1E0AE0BAC();

  if (self) {
    return 2;
  }
  else {
    return 1;
  }
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  char v8 = sub_1E0AE0BAC();

  int64_t v9 = 246;
  if (a4) {
    int64_t v9 = 0;
  }
  int64_t v10 = 12;
  if (a4 != 1) {
    int64_t v10 = 0;
  }
  if (!a4) {
    int64_t v10 = 9;
  }
  if (v8) {
    return v10;
  }
  else {
    return v9;
  }
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  id v8 = a3;
  int64_t v9 = self;
  sub_1E0AE18AC(a4, a5);
  uint64_t v11 = v10;

  if (v11)
  {
    v12 = (void *)sub_1E0B06788();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v7 = a3;
  id v8 = self;
  _s16HealthMobilityUI16HeightPickerItemC10pickerView_12didSelectRow11inComponentySo08UIPickerH0C_S2itF_0(v7, a4);
}

@end