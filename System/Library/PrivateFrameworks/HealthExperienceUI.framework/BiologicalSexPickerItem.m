@interface BiologicalSexPickerItem
- (_TtC18HealthExperienceUI23BiologicalSexPickerItem)init;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
@end

@implementation BiologicalSexPickerItem

- (_TtC18HealthExperienceUI23BiologicalSexPickerItem)init
{
  result = (_TtC18HealthExperienceUI23BiologicalSexPickerItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  if (a4) {
    return 0;
  }
  else {
    return 3;
  }
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  sub_1AD5AD2D8(a4, a5);
  if (v5)
  {
    v6 = (void *)sub_1AD73F180();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v8 = a3;
  v9 = self;
  sub_1AD5AD3CC(a4, a5);
}

@end