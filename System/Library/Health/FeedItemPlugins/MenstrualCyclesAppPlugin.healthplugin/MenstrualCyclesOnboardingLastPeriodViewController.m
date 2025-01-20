@interface MenstrualCyclesOnboardingLastPeriodViewController
- (void)datePickerChangedWithPicker:(id)a3;
- (void)nextButtonTapped:(id)a3;
- (void)skipButtonTapped:(id)a3;
- (void)viewDidLoad;
@end

@implementation MenstrualCyclesOnboardingLastPeriodViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_241613C30();
}

- (void)nextButtonTapped:(id)a3
{
}

- (void)skipButtonTapped:(id)a3
{
}

- (void)datePickerChangedWithPicker:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_241528C44();
  objc_msgSend(v6, sel_setEnabled_, 1);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin49MenstrualCyclesOnboardingLastPeriodViewController____lazy_storage___periodLengthViewController));
}

@end