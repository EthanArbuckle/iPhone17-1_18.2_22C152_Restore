@interface CollectionViewHeaderCell
- (_TtC18HealthExperienceUI24CollectionViewHeaderCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI24CollectionViewHeaderCell)initWithFrame:(CGRect)a3;
@end

@implementation CollectionViewHeaderCell

- (_TtC18HealthExperienceUI24CollectionViewHeaderCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI24CollectionViewHeaderCell_item;
  v9 = (objc_class *)type metadata accessor for CollectionViewHeaderCell();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((void *)v8 + 4) = 0;
  v14.receiver = self;
  v14.super_class = v9;
  v10 = -[CollectionViewHeaderCell initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  v11 = *(void (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)v10->super.super.super.super.super.super.isa) + 0x70);
  v12 = v10;
  v11();

  return v12;
}

- (_TtC18HealthExperienceUI24CollectionViewHeaderCell)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI24CollectionViewHeaderCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = a3;

  result = (_TtC18HealthExperienceUI24CollectionViewHeaderCell *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end