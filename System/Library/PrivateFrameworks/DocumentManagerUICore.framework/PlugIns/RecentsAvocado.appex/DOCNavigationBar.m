@interface DOCNavigationBar
- (UINavigationBarAppearance)scrollEdgeAppearance;
- (_TtC14RecentsAvocado16DOCNavigationBar)initWithCoder:(id)a3;
- (_TtC14RecentsAvocado16DOCNavigationBar)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setScrollEdgeAppearance:(id)a3;
@end

@implementation DOCNavigationBar

- (_TtC14RecentsAvocado16DOCNavigationBar)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC14RecentsAvocado16DOCNavigationBar_titlePositionAdjustment) = 0;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC14RecentsAvocado16DOCNavigationBar_chromelessAppearanceDisabled) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC14RecentsAvocado16DOCNavigationBar_overrideScrollEdgeAppearance) = 0;
  id v4 = a3;

  result = (_TtC14RecentsAvocado16DOCNavigationBar *)sub_1004CF6B0();
  __break(1u);
  return result;
}

- (_TtC14RecentsAvocado16DOCNavigationBar)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC14RecentsAvocado16DOCNavigationBar_titlePositionAdjustment) = 0;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC14RecentsAvocado16DOCNavigationBar_chromelessAppearanceDisabled) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC14RecentsAvocado16DOCNavigationBar_overrideScrollEdgeAppearance) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DOCNavigationBar();
  return -[DOCNavigationBar initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCNavigationBar();
  id v2 = v4.receiver;
  [(DOCNavigationBar *)&v4 layoutSubviews];
  id v3 = objc_msgSend(v2, "doc_nearestAncestorViewController", v4.receiver, v4.super_class);
  objc_msgSend(v3, "doc_updateBarButtonTrackingViewsIfNecessary");
}

- (UINavigationBarAppearance)scrollEdgeAppearance
{
  id v3 = *(UINavigationBarAppearance **)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC14RecentsAvocado16DOCNavigationBar_overrideScrollEdgeAppearance);
  if (v3)
  {
    objc_super v4 = self;
    v5 = v3;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)type metadata accessor for DOCNavigationBar();
    v6 = self;
    v5 = [(DOCNavigationBar *)&v9 scrollEdgeAppearance];
  }
  v7 = v3;

  return v5;
}

- (void)setScrollEdgeAppearance:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCNavigationBar();
  [(DOCNavigationBar *)&v4 setScrollEdgeAppearance:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado16DOCNavigationBar_overrideScrollEdgeAppearance));
}

@end