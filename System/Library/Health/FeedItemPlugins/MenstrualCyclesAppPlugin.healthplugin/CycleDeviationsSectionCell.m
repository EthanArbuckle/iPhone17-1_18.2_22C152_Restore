@interface CycleDeviationsSectionCell
- (BOOL)isHighlighted;
- (_TtC24MenstrualCyclesAppPlugin26CycleDeviationsSectionCell)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin26CycleDeviationsSectionCell)initWithFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation CycleDeviationsSectionCell

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(CycleDeviationsSectionCell *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(CycleDeviationsSectionCell *)&v5 setHighlighted:v3];
  sub_2415303A4();
}

- (_TtC24MenstrualCyclesAppPlugin26CycleDeviationsSectionCell)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin26CycleDeviationsSectionCell *)sub_241530554(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC24MenstrualCyclesAppPlugin26CycleDeviationsSectionCell)initWithCoder:(id)a3
{
  id v4 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin26CycleDeviationsSectionCell_item;
  *(_OWORD *)id v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin26CycleDeviationsSectionCell *)sub_241633038();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end