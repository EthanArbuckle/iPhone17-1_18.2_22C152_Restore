@interface ShelfHeaderView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC20ProductPageExtension15ShelfHeaderView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension15ShelfHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)updateConfiguration;
@end

@implementation ShelfHeaderView

- (_TtC20ProductPageExtension15ShelfHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension15ShelfHeaderView *)sub_10042F308(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension15ShelfHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10043483C();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_100430A3C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v4 = type metadata accessor for ShelfHeaderLayout(0);
  __chkstk_darwin(v4 - 8);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_100430E20((uint64_t)v6);
  id v8 = [(ShelfHeaderView *)v7 traitCollection];
  double v9 = ShelfHeaderLayout.measure(toFit:with:)(v8);
  double v11 = v10;

  sub_100434778((uint64_t)v6, type metadata accessor for ShelfHeaderLayout);
  double v12 = v9;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)layoutSubviews
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = type metadata accessor for ShelfHeaderLayout(0);
  __chkstk_darwin(v4 - 8);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10.receiver = self;
  v10.super_class = ObjectType;
  v7 = self;
  [(ShelfHeaderView *)&v10 layoutSubviews];
  id v8 = *(Class *)((char *)&v7->super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension15ShelfHeaderView_containerView);
  [(ShelfHeaderView *)v7 bounds];
  objc_msgSend(v8, "setFrame:");
  sub_100430E20((uint64_t)v6);
  [(ShelfHeaderView *)v7 bounds];
  id v9 = [(ShelfHeaderView *)v7 traitCollection];
  ShelfHeaderLayout.place(at:with:)(v9);

  sub_100434778((uint64_t)v6, type metadata accessor for ShelfHeaderLayout);
}

- (void)updateConfiguration
{
  v2 = self;
  sub_1004300CC();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void).cxx_destruct
{
  sub_100434778((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension15ShelfHeaderView_metrics, type metadata accessor for ShelfHeaderLayout.Metrics);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension15ShelfHeaderView_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension15ShelfHeaderView_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension15ShelfHeaderView_eyebrowButton));
  swift_release();
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension15ShelfHeaderView_eyebrowArtworkType, &qword_10094D600);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension15ShelfHeaderView_eyebrowArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension15ShelfHeaderView_titleButton));
  swift_release();
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension15ShelfHeaderView_titleArtworkType, &qword_10094D600);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension15ShelfHeaderView_titleArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension15ShelfHeaderView_accessoryButton));
  sub_1000194B0(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC20ProductPageExtension15ShelfHeaderView_titleAction));
  sub_1000194B0(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC20ProductPageExtension15ShelfHeaderView_accessoryAction));
  sub_1000194B0(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC20ProductPageExtension15ShelfHeaderView_eyebrowAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension15ShelfHeaderView_subtitleLabel));
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension15ShelfHeaderView_configuration, &qword_1009543A0);
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension15ShelfHeaderView_currentTouch);
}

@end