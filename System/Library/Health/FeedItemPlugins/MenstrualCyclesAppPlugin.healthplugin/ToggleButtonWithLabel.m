@interface ToggleButtonWithLabel
- (_TtC24MenstrualCyclesAppPluginP33_61BF7A68BF04E2E624D5FFBA5D55F26621ToggleButtonWithLabel)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPluginP33_61BF7A68BF04E2E624D5FFBA5D55F26621ToggleButtonWithLabel)initWithFrame:(CGRect)a3;
@end

@implementation ToggleButtonWithLabel

- (_TtC24MenstrualCyclesAppPluginP33_61BF7A68BF04E2E624D5FFBA5D55F26621ToggleButtonWithLabel)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC24MenstrualCyclesAppPluginP33_61BF7A68BF04E2E624D5FFBA5D55F26621ToggleButtonWithLabel_isChecked) = 0;
  uint64_t v4 = OBJC_IVAR____TtC24MenstrualCyclesAppPluginP33_61BF7A68BF04E2E624D5FFBA5D55F26621ToggleButtonWithLabel_toggleButton;
  id v5 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)sub_2412A7768();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPluginP33_61BF7A68BF04E2E624D5FFBA5D55F26621ToggleButtonWithLabel____lazy_storage___label) = 0;

  result = (_TtC24MenstrualCyclesAppPluginP33_61BF7A68BF04E2E624D5FFBA5D55F26621ToggleButtonWithLabel *)sub_241633038();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPluginP33_61BF7A68BF04E2E624D5FFBA5D55F26621ToggleButtonWithLabel)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPluginP33_61BF7A68BF04E2E624D5FFBA5D55F26621ToggleButtonWithLabel_toggleButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPluginP33_61BF7A68BF04E2E624D5FFBA5D55F26621ToggleButtonWithLabel____lazy_storage___label));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPluginP33_61BF7A68BF04E2E624D5FFBA5D55F26621ToggleButtonWithLabel_tintColorWhenChecked));

  swift_bridgeObjectRelease();
}

@end