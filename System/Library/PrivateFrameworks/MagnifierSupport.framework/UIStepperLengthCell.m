@interface UIStepperLengthCell
- (_TtC16MagnifierSupport19UIStepperLengthCell)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport19UIStepperLengthCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)distanceStepperValueChanged:(id)a3;
@end

@implementation UIStepperLengthCell

- (void)accessibilityIncrement
{
  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16MagnifierSupport19UIStepperLengthCell__distanceStepper);
  v7 = self;
  id v3 = v2;
  objc_msgSend(v3, sel_stepValue);
  double v5 = v4;
  objc_msgSend(v3, sel_value);
  objc_msgSend(v3, sel_setValue_, v5 + v6);

  sub_2357C46A4();
}

- (void)accessibilityDecrement
{
  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16MagnifierSupport19UIStepperLengthCell__distanceStepper);
  v7 = self;
  id v3 = v2;
  objc_msgSend(v3, sel_stepValue);
  double v5 = v4;
  objc_msgSend(v3, sel_value);
  objc_msgSend(v3, sel_setValue_, v6 - v5);

  sub_2357C46A4();
}

- (void)distanceStepperValueChanged:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_2357C4F34();
}

- (_TtC16MagnifierSupport19UIStepperLengthCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_235949AC8();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC16MagnifierSupport19UIStepperLengthCell *)sub_2357C49D0(a3, (uint64_t)a4, v6);
}

- (_TtC16MagnifierSupport19UIStepperLengthCell)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport19UIStepperLengthCell *)sub_2357C4B50(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport19UIStepperLengthCell__distanceStepper));
  sub_2357C5380((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport19UIStepperLengthCell__lengthMeasure);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC16MagnifierSupport19UIStepperLengthCell__valueChangedHandler);
  sub_235689A84(v3);
}

@end