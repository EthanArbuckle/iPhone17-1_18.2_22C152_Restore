@interface EmptyStateTableViewCell
- (_TtC18HealthExperienceUI23EmptyStateTableViewCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI23EmptyStateTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation EmptyStateTableViewCell

- (_TtC18HealthExperienceUI23EmptyStateTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)_sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC18HealthExperienceUI23EmptyStateTableViewCell *)sub_1AD263AD4(a3, (uint64_t)a4, v6);
}

- (_TtC18HealthExperienceUI23EmptyStateTableViewCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI23EmptyStateTableViewCell____lazy_storage___emptyStateCellView) = 0;
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI23EmptyStateTableViewCell_item;
  uint64_t v6 = (objc_class *)type metadata accessor for EmptyStateTableViewCell();
  *(_OWORD *)uint64_t v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(EmptyStateTableViewCell *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI23EmptyStateTableViewCell____lazy_storage___emptyStateCellView));
  v3 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI23EmptyStateTableViewCell_item;
  sub_1AD1E1AA8((uint64_t)v3);
}

@end