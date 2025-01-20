@interface BrandCardCopyMenu
- (_TtC18BusinessServicesUI17BrandCardCopyMenu)initWithCoder:(id)a3;
- (_TtC18BusinessServicesUI17BrandCardCopyMenu)initWithFrame:(CGRect)a3;
- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5;
- (void)handleLongPress:(id)a3;
@end

@implementation BrandCardCopyMenu

- (_TtC18BusinessServicesUI17BrandCardCopyMenu)initWithCoder:(id)a3
{
  sub_23F9A0974(a3);
  return result;
}

- (_TtC18BusinessServicesUI17BrandCardCopyMenu)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18BusinessServicesUI17BrandCardCopyMenu_editMenuInteraction) = 0;
  v8 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18BusinessServicesUI17BrandCardCopyMenu_name);
  void *v8 = 0;
  v8[1] = 0;
  v9 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18BusinessServicesUI17BrandCardCopyMenu_sip);
  v10 = (objc_class *)type metadata accessor for BrandCardCopyMenu();
  void *v9 = 0;
  v9[1] = 0;
  v13.receiver = self;
  v13.super_class = v10;
  v11 = -[BrandCardCopyMenu initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  sub_23F9A0B98();

  return v11;
}

- (void)handleLongPress:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23F9A10B4();
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  v10 = (void *)sub_23F9A1198();

  return v10;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18BusinessServicesUI17BrandCardCopyMenu_editMenuInteraction));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end