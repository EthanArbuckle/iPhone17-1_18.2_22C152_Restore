@interface UpsellBreakoutView
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC22SubscribePageExtension18UpsellBreakoutView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension18UpsellBreakoutView)initWithFrame:(CGRect)a3;
- (void)didTapVideo;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation UpsellBreakoutView

- (_TtC22SubscribePageExtension18UpsellBreakoutView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension18UpsellBreakoutView *)sub_100160CB8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension18UpsellBreakoutView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100162D00();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_100161844(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100161ACC();
}

- (void)didTapVideo
{
  v2 = self;
  sub_100161F90();
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = self;
  char v9 = sub_1001632F0(v7);

  return v9 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = sub_10075A140();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17.receiver = self;
  v17.super_class = ObjectType;
  id v11 = a3;
  v12 = self;
  [(UpsellBreakoutView *)&v17 traitCollectionDidChange:v11];
  v13 = *(Class *)((char *)&v12->super.super.super.isa
                 + OBJC_IVAR____TtC22SubscribePageExtension18UpsellBreakoutView_buttonDetailsView);
  v14 = (char *)v12 + OBJC_IVAR____TtC22SubscribePageExtension18UpsellBreakoutView_buttonDetailsTextAlignment;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v14, v6);
  uint64_t v15 = sub_10075A130();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  [v13 setTextAlignment:v15];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension18UpsellBreakoutView_tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension18UpsellBreakoutView_backgroundEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension18UpsellBreakoutView_mediaViewContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension18UpsellBreakoutView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension18UpsellBreakoutView_detailsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension18UpsellBreakoutView_buttonDetailsView));
  id v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension18UpsellBreakoutView_buttonDetailsTextAlignment;
  uint64_t v4 = sub_10075A140();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension18UpsellBreakoutView_offerButton));

  swift_unknownObjectRelease();
}

@end