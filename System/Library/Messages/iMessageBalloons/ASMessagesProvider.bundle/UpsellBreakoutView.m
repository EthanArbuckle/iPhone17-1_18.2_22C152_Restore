@interface UpsellBreakoutView
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC18ASMessagesProvider18UpsellBreakoutView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider18UpsellBreakoutView)initWithFrame:(CGRect)a3;
- (void)didTapVideo;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation UpsellBreakoutView

- (_TtC18ASMessagesProvider18UpsellBreakoutView)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider18UpsellBreakoutView *)sub_44E08C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider18UpsellBreakoutView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_450134();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_44EAFC(width);
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
  sub_44ED84();
}

- (void)didTapVideo
{
  v2 = self;
  sub_44F248();
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = self;
  char v9 = sub_4505A8(v7);

  return v9 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = sub_770150();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  char v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16.receiver = self;
  v16.super_class = ObjectType;
  id v10 = a3;
  v11 = self;
  [(UpsellBreakoutView *)&v16 traitCollectionDidChange:v10];
  v12 = *(Class *)((char *)&v11->super.super.super.isa
                 + OBJC_IVAR____TtC18ASMessagesProvider18UpsellBreakoutView_buttonDetailsView);
  v13 = (char *)v11 + OBJC_IVAR____TtC18ASMessagesProvider18UpsellBreakoutView_buttonDetailsTextAlignment;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, v13, v6);
  uint64_t v14 = sub_770140();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  [v12 setTextAlignment:v14];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider18UpsellBreakoutView_tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider18UpsellBreakoutView_backgroundEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider18UpsellBreakoutView_mediaViewContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider18UpsellBreakoutView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider18UpsellBreakoutView_detailsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider18UpsellBreakoutView_buttonDetailsView));
  id v3 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider18UpsellBreakoutView_buttonDetailsTextAlignment;
  uint64_t v4 = sub_770150();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider18UpsellBreakoutView_offerButton));

  swift_unknownObjectRelease();
}

@end