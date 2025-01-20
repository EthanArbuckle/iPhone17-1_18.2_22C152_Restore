@interface ShelfHeaderView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC22SubscribePageExtension15ShelfHeaderView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension15ShelfHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)updateConfiguration;
@end

@implementation ShelfHeaderView

- (_TtC22SubscribePageExtension15ShelfHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension15ShelfHeaderView *)sub_100070568(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension15ShelfHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000770FC();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_100071C9C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v4 = type metadata accessor for ShelfHeaderLayout(0);
  __chkstk_darwin(v4 - 8, v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  sub_100072080((uint64_t)v7);
  id v9 = [(ShelfHeaderView *)v8 traitCollection];
  double v10 = ShelfHeaderLayout.measure(toFit:with:)(v9);
  double v12 = v11;

  sub_100078C18((uint64_t)v7, type metadata accessor for ShelfHeaderLayout);
  double v13 = v10;
  double v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)layoutSubviews
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = type metadata accessor for ShelfHeaderLayout(0);
  __chkstk_darwin(v4 - 8, v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11.receiver = self;
  v11.super_class = ObjectType;
  v8 = self;
  [(ShelfHeaderView *)&v11 layoutSubviews];
  id v9 = *(Class *)((char *)&v8->super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension15ShelfHeaderView_containerView);
  [(ShelfHeaderView *)v8 bounds];
  objc_msgSend(v9, "setFrame:");
  sub_100072080((uint64_t)v7);
  [(ShelfHeaderView *)v8 bounds];
  id v10 = [(ShelfHeaderView *)v8 traitCollection];
  ShelfHeaderLayout.place(at:with:)(v10);

  sub_100078C18((uint64_t)v7, type metadata accessor for ShelfHeaderLayout);
}

- (void)updateConfiguration
{
  v2 = self;
  sub_10007132C();
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
  sub_100078C18((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension15ShelfHeaderView_metrics, type metadata accessor for ShelfHeaderLayout.Metrics);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension15ShelfHeaderView_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension15ShelfHeaderView_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension15ShelfHeaderView_eyebrowButton));
  swift_release();
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension15ShelfHeaderView_eyebrowArtworkType, &qword_100935580);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension15ShelfHeaderView_eyebrowArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension15ShelfHeaderView_titleButton));
  swift_release();
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension15ShelfHeaderView_titleArtworkType, &qword_100935580);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension15ShelfHeaderView_titleArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension15ShelfHeaderView_accessoryButton));
  sub_10001A4D0(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC22SubscribePageExtension15ShelfHeaderView_titleAction));
  sub_10001A4D0(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC22SubscribePageExtension15ShelfHeaderView_accessoryAction));
  sub_10001A4D0(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC22SubscribePageExtension15ShelfHeaderView_eyebrowAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension15ShelfHeaderView_subtitleLabel));
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension15ShelfHeaderView_configuration, &qword_10093A1F0);
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension15ShelfHeaderView_currentTouch);
}

@end