@interface BrowseTileContentViewImageTextAccessory
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)description;
- (_TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17139BrowseTileContentViewImageTextAccessory)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17139BrowseTileContentViewImageTextAccessory)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation BrowseTileContentViewImageTextAccessory

- (_TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17139BrowseTileContentViewImageTextAccessory)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17139BrowseTileContentViewImageTextAccessory *)sub_1AD46DC3C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17139BrowseTileContentViewImageTextAccessory)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17139BrowseTileContentViewImageTextAccessory____lazy_storage___categoryView) = 0;
  id v4 = a3;

  result = (_TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17139BrowseTileContentViewImageTextAccessory *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AD46DE78();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = sub_1AD46E024((uint64_t (*)(void))sub_1AD46D9E0, width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (NSString)description
{
  return (NSString *)sub_1AD46E26C(self, (uint64_t)a2, (void (*)(void))sub_1AD46E2DC);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17139BrowseTileContentViewImageTextAccessory____lazy_storage___categoryView));
}

@end