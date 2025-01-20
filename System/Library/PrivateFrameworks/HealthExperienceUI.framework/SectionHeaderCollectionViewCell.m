@interface SectionHeaderCollectionViewCell
- (_TtC18HealthExperienceUI31SectionHeaderCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI31SectionHeaderCollectionViewCell)initWithFrame:(CGRect)a3;
@end

@implementation SectionHeaderCollectionViewCell

- (_TtC18HealthExperienceUI31SectionHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI31SectionHeaderCollectionViewCell_item;
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((void *)v8 + 4) = 0;
  v9 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC18HealthExperienceUI31SectionHeaderCollectionViewCell_baseIdentifier);
  v10 = (objc_class *)type metadata accessor for DefaultHeaderCollectionReusableView();
  void *v9 = 0;
  v9[1] = 0;
  id v11 = objc_allocWithZone(v10);
  v12 = self;
  v13 = (objc_class *)objc_msgSend(v11, sel_initWithFrame_, x, y, width, height);
  *(Class *)((char *)&v12->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI31SectionHeaderCollectionViewCell_headerView) = v13;

  v18.receiver = v12;
  v18.super_class = (Class)type metadata accessor for SectionHeaderCollectionViewCell();
  v14 = -[SectionHeaderCollectionViewCell initWithFrame:](&v18, sel_initWithFrame_, x, y, width, height);
  v15 = *(void (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)v14->super.super.super.super.super.isa) + 0xB0);
  v16 = v14;
  v15();

  return v16;
}

- (_TtC18HealthExperienceUI31SectionHeaderCollectionViewCell)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI31SectionHeaderCollectionViewCell *)sub_1AD40B964(a3);
}

- (void).cxx_destruct
{
  sub_1AD1E1AA8((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI31SectionHeaderCollectionViewCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31SectionHeaderCollectionViewCell_headerView));
  swift_bridgeObjectRelease();
}

@end