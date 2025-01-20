@interface BrowseTileContentViewTextAccessory
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)description;
- (_TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17134BrowseTileContentViewTextAccessory)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17134BrowseTileContentViewTextAccessory)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation BrowseTileContentViewTextAccessory

- (_TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17134BrowseTileContentViewTextAccessory)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17134BrowseTileContentViewTextAccessory____lazy_storage___label) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for BrowseTileContentViewTextAccessory();
  v7 = -[BrowseTileContentViewBase initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
  id v8 = sub_1AD46D4C4();
  [(BrowseTileContentViewTextAccessory *)v7 addSubview:v8];

  return v7;
}

- (_TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17134BrowseTileContentViewTextAccessory)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17134BrowseTileContentViewTextAccessory____lazy_storage___label) = 0;
  id v4 = a3;

  result = (_TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17134BrowseTileContentViewTextAccessory *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for BrowseTileContentViewTextAccessory();
  id v2 = v14.receiver;
  [(BrowseTileContentViewBase *)&v14 layoutSubviews];
  id v3 = sub_1AD46D4C4();
  objc_msgSend(v2, sel_bounds, v14.receiver, v14.super_class);
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  objc_msgSend(v2, sel_directionalLayoutMargins);
  CGFloat v13 = v12;
  v15.origin.double x = v5;
  v15.origin.double y = v7;
  v15.size.double width = v9;
  v15.size.double height = v11;
  CGRect v16 = CGRectInset(v15, 16.0, v13);
  objc_msgSend(v3, sel_setFrame_, v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  CGFloat v5 = self;
  double v6 = sub_1AD46E024((uint64_t (*)(void))sub_1AD46D4C4, width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (NSString)description
{
  return (NSString *)sub_1AD46E26C(self, (uint64_t)a2, (void (*)(void))sub_1AD46D8D4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUIP33_7A9E5CF486B0F4226BE0F022FE7FA17134BrowseTileContentViewTextAccessory____lazy_storage___label));
}

@end