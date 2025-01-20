@interface MOSuggestionCutoutView
- (_TtC16MomentsUIService22MOSuggestionCutoutView)init;
- (_TtC16MomentsUIService22MOSuggestionCutoutView)initWithCoder:(id)a3;
- (_TtC16MomentsUIService22MOSuggestionCutoutView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MOSuggestionCutoutView

- (_TtC16MomentsUIService22MOSuggestionCutoutView)init
{
  return (_TtC16MomentsUIService22MOSuggestionCutoutView *)MOSuggestionCutoutView.init()();
}

- (_TtC16MomentsUIService22MOSuggestionCutoutView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC16MomentsUIService22MOSuggestionCutoutView_fillLayer;
  id v6 = objc_allocWithZone((Class)CAShapeLayer);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC16MomentsUIService22MOSuggestionCutoutView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  MOSuggestionCutoutView.layoutSubviews()();
}

- (_TtC16MomentsUIService22MOSuggestionCutoutView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService22MOSuggestionCutoutView_fillLayer));
}

@end