@interface MOSuggestionStateOfMindAssetView
- (_TtC16MomentsUIService32MOSuggestionStateOfMindAssetView)initWithCoder:(id)a3;
- (_TtC16MomentsUIService32MOSuggestionStateOfMindAssetView)initWithFrame:(CGRect)a3;
- (void)handleTraitChange;
- (void)layoutSubviews;
@end

@implementation MOSuggestionStateOfMindAssetView

- (_TtC16MomentsUIService32MOSuggestionStateOfMindAssetView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized MOSuggestionStateOfMindAssetView.init(coder:)();
}

- (void)handleTraitChange
{
  v2 = self;
  MOSuggestionStateOfMindAssetView.handleTraitChange()();
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MOSuggestionStateOfMindAssetView();
  v2 = (char *)v5.receiver;
  [(MOSuggestionStateOfMindAssetView *)&v5 layoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC16MomentsUIService32MOSuggestionStateOfMindAssetView_gradient];
  if (v3)
  {
    v4 = v3;
    [v2 frame];
    [v4 setFrame:];

    v2 = v4;
  }
}

- (_TtC16MomentsUIService32MOSuggestionStateOfMindAssetView)initWithFrame:(CGRect)a3
{
  result = (_TtC16MomentsUIService32MOSuggestionStateOfMindAssetView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService32MOSuggestionStateOfMindAssetView_gradient));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService32MOSuggestionStateOfMindAssetView_primaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService32MOSuggestionStateOfMindAssetView_secondaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService32MOSuggestionStateOfMindAssetView_typeLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MomentsUIService32MOSuggestionStateOfMindAssetView_labelStack);
}

@end