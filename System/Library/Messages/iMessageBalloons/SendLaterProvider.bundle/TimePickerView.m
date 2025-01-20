@interface TimePickerView
- (_TtC17SendLaterProvider14TimePickerView)initWithCoder:(id)a3;
- (_TtC17SendLaterProvider14TimePickerView)initWithFrame:(CGRect)a3;
- (void)dateChanged:(id)a3;
- (void)disableKeypad:(id)a3;
@end

@implementation TimePickerView

- (void)disableKeypad:(id)a3
{
  sub_7FDC(0, &qword_16958);
  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC17SendLaterProvider14TimePickerView_datePicker);
  id v6 = a3;
  v8 = self;
  id v7 = v5;
  LOBYTE(self) = sub_B980();

  if ((self & 1) != 0
    && ([self isInHardwareKeyboardMode] & 1) == 0)
  {
    [v6 resignFirstResponder];
  }
}

- (void)dateChanged:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_A55C(v4);
}

- (_TtC17SendLaterProvider14TimePickerView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC17SendLaterProvider14TimePickerView_cancellables) = (Class)&_swiftEmptySetSingleton;
  id v4 = a3;

  result = (_TtC17SendLaterProvider14TimePickerView *)sub_BA10();
  __break(1u);
  return result;
}

- (_TtC17SendLaterProvider14TimePickerView)initWithFrame:(CGRect)a3
{
  result = (_TtC17SendLaterProvider14TimePickerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SendLaterProvider14TimePickerView_datePicker));

  swift_bridgeObjectRelease();
}

@end