@interface MOSuggestionMapSnapshotView
- (_TtC16MomentsUIService27MOSuggestionMapSnapshotView)initWithCoder:(id)a3;
- (_TtC16MomentsUIService27MOSuggestionMapSnapshotView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)handleTraitChange;
- (void)layoutSubviews;
@end

@implementation MOSuggestionMapSnapshotView

- (void)handleTraitChange
{
  v2 = self;
  MOSuggestionMapSnapshotView.handleTraitChange()();
}

- (void)layoutSubviews
{
  v2 = self;
  MOSuggestionMapSnapshotView.layoutSubviews()();
}

- (void)dealloc
{
  v2 = self;
  MOSuggestionMapSnapshotView.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService27MOSuggestionMapSnapshotView_imageView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService27MOSuggestionMapSnapshotView_platterBlurView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MomentsUIService27MOSuggestionMapSnapshotView_labelView);
}

- (_TtC16MomentsUIService27MOSuggestionMapSnapshotView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized MOSuggestionMapSnapshotView.init(coder:)();
}

- (_TtC16MomentsUIService27MOSuggestionMapSnapshotView)initWithFrame:(CGRect)a3
{
  result = (_TtC16MomentsUIService27MOSuggestionMapSnapshotView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end