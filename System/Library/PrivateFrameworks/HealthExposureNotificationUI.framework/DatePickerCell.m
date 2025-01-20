@interface DatePickerCell
- (_TtC28HealthExposureNotificationUIP33_B34324B7016DDD2106849E0328F1789A14DatePickerCell)initWithCoder:(id)a3;
- (_TtC28HealthExposureNotificationUIP33_B34324B7016DDD2106849E0328F1789A14DatePickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation DatePickerCell

- (_TtC28HealthExposureNotificationUIP33_B34324B7016DDD2106849E0328F1789A14DatePickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_2294191A8();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC28HealthExposureNotificationUIP33_B34324B7016DDD2106849E0328F1789A14DatePickerCell *)sub_229391394(a3, (uint64_t)a4, v6);
}

- (_TtC28HealthExposureNotificationUIP33_B34324B7016DDD2106849E0328F1789A14DatePickerCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC28HealthExposureNotificationUIP33_B34324B7016DDD2106849E0328F1789A14DatePickerCell_datePicker;
  id v6 = objc_allocWithZone(MEMORY[0x263F82650]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC28HealthExposureNotificationUIP33_B34324B7016DDD2106849E0328F1789A14DatePickerCell *)sub_2294195F8();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUIP33_B34324B7016DDD2106849E0328F1789A14DatePickerCell_datePicker));
}

@end