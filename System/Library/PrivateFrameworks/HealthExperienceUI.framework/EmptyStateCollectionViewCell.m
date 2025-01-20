@interface EmptyStateCollectionViewCell
- (_TtC18HealthExperienceUI28EmptyStateCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI28EmptyStateCollectionViewCell)initWithFrame:(CGRect)a3;
@end

@implementation EmptyStateCollectionViewCell

- (_TtC18HealthExperienceUI28EmptyStateCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI28EmptyStateCollectionViewCell *)sub_1AD448A80(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI28EmptyStateCollectionViewCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI28EmptyStateCollectionViewCell____lazy_storage___emptyStateCellView) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI28EmptyStateCollectionViewCell_item;
  v6 = (objc_class *)type metadata accessor for EmptyStateCollectionViewCell();
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(EmptyStateCollectionViewCell *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI28EmptyStateCollectionViewCell____lazy_storage___emptyStateCellView));
  v3 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI28EmptyStateCollectionViewCell_item;
  sub_1AD1E1AA8((uint64_t)v3);
}

@end