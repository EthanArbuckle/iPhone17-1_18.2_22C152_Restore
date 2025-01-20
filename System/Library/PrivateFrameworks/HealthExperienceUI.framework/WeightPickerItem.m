@interface WeightPickerItem
- (_TtC18HealthExperienceUI16WeightPickerItem)init;
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
@end

@implementation WeightPickerItem

- (_TtC18HealthExperienceUI16WeightPickerItem)init
{
  result = (_TtC18HealthExperienceUI16WeightPickerItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI16WeightPickerItem____lazy_storage___localeUnit));
  sub_1AD24D3D8((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI16WeightPickerItem_delegate);

  v3 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI16WeightPickerItem_valueFormatter;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
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
  id v6 = a3;
  v7 = self;
  sub_1AD669D9C();
  uint64_t v9 = v8;
  sub_1AD669DC8();
  uint64_t v11 = v10;

  uint64_t v12 = v9 - v11;
  if (__OFSUB__(v9, v11))
  {
    __break(1u);
    goto LABEL_7;
  }
  int64_t result = v12 + 1;
  if (__OFADD__(v12, 1)) {
LABEL_7:
  }
    __break(1u);
  return result;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  id v8 = a3;
  uint64_t v9 = self;
  sub_1AD66A758(a4, a5);
  uint64_t v11 = v10;

  if (v11)
  {
    uint64_t v12 = (void *)sub_1AD73F180();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = 0;
  }
  return v12;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v7 = a3;
  id v8 = self;
  sub_1AD66A850(a4);
}

@end