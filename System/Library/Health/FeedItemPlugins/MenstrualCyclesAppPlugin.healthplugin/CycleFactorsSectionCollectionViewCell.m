@interface CycleFactorsSectionCollectionViewCell
- (BOOL)isHighlighted;
- (_TtC24MenstrualCyclesAppPlugin37CycleFactorsSectionCollectionViewCell)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin37CycleFactorsSectionCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)awakeFromNib;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation CycleFactorsSectionCollectionViewCell

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(CycleFactorsSectionCollectionViewCell *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(CycleFactorsSectionCollectionViewCell *)&v5 setHighlighted:v3];
  sub_241446A84();
}

- (_TtC24MenstrualCyclesAppPlugin37CycleFactorsSectionCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC24MenstrualCyclesAppPlugin37CycleFactorsSectionCollectionViewCell *)sub_241446C94(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC24MenstrualCyclesAppPlugin37CycleFactorsSectionCollectionViewCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37CycleFactorsSectionCollectionViewCell____lazy_storage___healthStore) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37CycleFactorsSectionCollectionViewCell____lazy_storage___hostView) = 0;
  id v4 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37CycleFactorsSectionCollectionViewCell_item;
  *(_OWORD *)id v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin37CycleFactorsSectionCollectionViewCell *)sub_241633038();
  __break(1u);
  return result;
}

- (void)awakeFromNib
{
  v2 = self;
  sub_2414470D8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37CycleFactorsSectionCollectionViewCell____lazy_storage___healthStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37CycleFactorsSectionCollectionViewCell____lazy_storage___hostView));
  BOOL v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin37CycleFactorsSectionCollectionViewCell_item;

  sub_241299DB8((uint64_t)v3);
}

@end