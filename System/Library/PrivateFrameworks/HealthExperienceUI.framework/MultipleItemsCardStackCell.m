@interface MultipleItemsCardStackCell
- (_TtC18HealthExperienceUI26MultipleItemsCardStackCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI26MultipleItemsCardStackCell)initWithFrame:(CGRect)a3;
@end

@implementation MultipleItemsCardStackCell

- (_TtC18HealthExperienceUI26MultipleItemsCardStackCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI26MultipleItemsCardStackCell_item;
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((void *)v8 + 4) = 0;
  id v9 = objc_allocWithZone(MEMORY[0x1E4FB1EB0]);
  v10 = self;
  v11 = (objc_class *)objc_msgSend(v9, sel_init);
  *(Class *)((char *)&v10->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI26MultipleItemsCardStackCell_cardStackView) = v11;

  v14.receiver = v10;
  v14.super_class = (Class)type metadata accessor for MultipleItemsCardStackCell();
  v12 = -[MultipleItemsCardStackCell initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  sub_1AD44D968();

  return v12;
}

- (_TtC18HealthExperienceUI26MultipleItemsCardStackCell)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI26MultipleItemsCardStackCell *)sub_1AD44D618(a3);
}

- (void).cxx_destruct
{
  sub_1AD1E1AA8((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI26MultipleItemsCardStackCell_item);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI26MultipleItemsCardStackCell_cardStackView);
}

@end