@interface DefaultHeaderCollectionReusableView
- (_TtC18HealthExperienceUI35DefaultHeaderCollectionReusableView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI35DefaultHeaderCollectionReusableView)initWithFrame:(CGRect)a3;
- (void)detailButtonTapped:(id)a3;
- (void)preferredContentSizeCategoryDidChangeWithTraitEnvironment:(id)a3 previousTraitCollection:(id)a4;
@end

@implementation DefaultHeaderCollectionReusableView

- (_TtC18HealthExperienceUI35DefaultHeaderCollectionReusableView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI35DefaultHeaderCollectionReusableView____lazy_storage___detailButton) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI35DefaultHeaderCollectionReusableView____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI35DefaultHeaderCollectionReusableView_customConstraints) = (Class)MEMORY[0x1E4FBC860];
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI35DefaultHeaderCollectionReusableView____lazy_storage___detailButtonHeightConstraint) = 0;
  v8 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI35DefaultHeaderCollectionReusableView_item;
  v9 = (objc_class *)type metadata accessor for DefaultHeaderCollectionReusableView();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((void *)v8 + 4) = 0;
  v12.receiver = self;
  v12.super_class = v9;
  v10 = -[DefaultHeaderCollectionReusableView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  sub_1AD1EEAA8();

  return v10;
}

- (_TtC18HealthExperienceUI35DefaultHeaderCollectionReusableView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AD5D9B68();
}

- (void)preferredContentSizeCategoryDidChangeWithTraitEnvironment:(id)a3 previousTraitCollection:(id)a4
{
  v6 = *(void (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.super.super.super.isa) + 0x108);
  swift_unknownObjectRetain();
  id v7 = a4;
  v8 = self;
  v6();
  sub_1AD1EEBE8();
  swift_unknownObjectRelease();
}

- (void)detailButtonTapped:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1AD7404B0();
  swift_unknownObjectRelease();
  v5 = *(void (**)(_TtC18HealthExperienceUI35DefaultHeaderCollectionReusableView *))(sub_1AD1EED6C() + 72);
  sub_1AD21485C((uint64_t)v5);
  swift_release();
  if (v5)
  {
    v5(v4);
    sub_1AD1E4514((uint64_t)v5);
  }

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v6);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35DefaultHeaderCollectionReusableView____lazy_storage___detailButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35DefaultHeaderCollectionReusableView____lazy_storage___titleLabel));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI35DefaultHeaderCollectionReusableView____lazy_storage___detailButtonHeightConstraint));
  id v3 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI35DefaultHeaderCollectionReusableView_item;
  sub_1AD1E1AA8((uint64_t)v3);
}

@end