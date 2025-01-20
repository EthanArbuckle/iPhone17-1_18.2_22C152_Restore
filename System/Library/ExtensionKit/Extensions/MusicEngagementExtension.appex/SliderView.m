@interface SliderView
- (_TtC11MusicCoreUI10SliderView)initWithCoder:(id)a3;
- (_TtC11MusicCoreUI10SliderView)initWithFrame:(CGRect)a3;
- (int64_t)semanticContentAttribute;
- (void)layoutSubviews;
- (void)panGestureRecognized:(id)a3;
- (void)setSemanticContentAttribute:(int64_t)a3;
@end

@implementation SliderView

- (int64_t)semanticContentAttribute
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SliderView();
  return [(SliderView *)&v3 semanticContentAttribute];
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SliderView();
  v4 = (char *)v5.receiver;
  [(SliderView *)&v5 setSemanticContentAttribute:a3];
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC11MusicCoreUI10SliderView_stackView], "setSemanticContentAttribute:", objc_msgSend(v4, "semanticContentAttribute", v5.receiver, v5.super_class));
}

- (_TtC11MusicCoreUI10SliderView)initWithFrame:(CGRect)a3
{
  return (_TtC11MusicCoreUI10SliderView *)SliderView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11MusicCoreUI10SliderView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized SliderView.init(coder:)();
}

- (void)layoutSubviews
{
  v2 = self;
  SliderView.layoutSubviews()();
}

- (void)panGestureRecognized:(id)a3
{
  id v5 = a3;
  v4 = self;
  SliderView.panGestureRecognized(_:)(v5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI10SliderView_elapsedTrackWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI10SliderView_trackHeightConstraint));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI10SliderView____lazy_storage___panRecognizer));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI10SliderView_remainingTrackColor));

  outlined consume of (@escaping @callee_guaranteed () -> ())?(*(uint64_t *)((char *)&self->super.super.super.isa
                                                                          + OBJC_IVAR____TtC11MusicCoreUI10SliderView_valueChangedHandler));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11MusicCoreUI10SliderView_cancelledHandler);

  outlined consume of (@escaping @callee_guaranteed () -> ())?(v3);
}

@end