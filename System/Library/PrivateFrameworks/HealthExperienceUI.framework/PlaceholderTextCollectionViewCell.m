@interface PlaceholderTextCollectionViewCell
- (_TtC18HealthExperienceUI33PlaceholderTextCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI33PlaceholderTextCollectionViewCell)initWithFrame:(CGRect)a3;
@end

@implementation PlaceholderTextCollectionViewCell

- (_TtC18HealthExperienceUI33PlaceholderTextCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI33PlaceholderTextCollectionViewCell *)sub_1AD427704(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI33PlaceholderTextCollectionViewCell)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI33PlaceholderTextCollectionViewCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI33PlaceholderTextCollectionViewCell____lazy_storage___label) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI33PlaceholderTextCollectionViewCell____lazy_storage___spinnerZeroWidthConstraint) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI33PlaceholderTextCollectionViewCell____lazy_storage___spinnerToLabelWidthConstraint) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI33PlaceholderTextCollectionViewCell____lazy_storage___spinner) = 0;
  id v5 = a3;

  result = (_TtC18HealthExperienceUI33PlaceholderTextCollectionViewCell *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD1E1AA8((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI33PlaceholderTextCollectionViewCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33PlaceholderTextCollectionViewCell_subview));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33PlaceholderTextCollectionViewCell____lazy_storage___label));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33PlaceholderTextCollectionViewCell____lazy_storage___spinnerZeroWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33PlaceholderTextCollectionViewCell____lazy_storage___spinnerToLabelWidthConstraint));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI33PlaceholderTextCollectionViewCell____lazy_storage___spinner);
}

@end