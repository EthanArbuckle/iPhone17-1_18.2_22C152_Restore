@interface MenstrualCyclesOnboardingItemCell
- (_TtC24MenstrualCyclesAppPlugin33MenstrualCyclesOnboardingItemCell)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin33MenstrualCyclesOnboardingItemCell)initWithFrame:(CGRect)a3;
- (void)awakeFromNib;
@end

@implementation MenstrualCyclesOnboardingItemCell

- (_TtC24MenstrualCyclesAppPlugin33MenstrualCyclesOnboardingItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin33MenstrualCyclesOnboardingItemCell *)sub_2415E6AF4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC24MenstrualCyclesAppPlugin33MenstrualCyclesOnboardingItemCell)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33MenstrualCyclesOnboardingItemCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33MenstrualCyclesOnboardingItemCell____lazy_storage___hostView) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for MenstrualCyclesOnboardingItemCell();
  return [(MenstrualCyclesOnboardingItemCell *)&v6 initWithCoder:a3];
}

- (void)awakeFromNib
{
  v2 = self;
  sub_2415E6EAC();
}

- (void).cxx_destruct
{
  sub_241299DB8((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33MenstrualCyclesOnboardingItemCell_item);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33MenstrualCyclesOnboardingItemCell____lazy_storage___hostView);
}

@end