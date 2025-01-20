@interface MOSuggestionLivePhotoView
- (_TtC16MomentsUIService25MOSuggestionLivePhotoView)initWithCoder:(id)a3;
- (_TtC16MomentsUIService25MOSuggestionLivePhotoView)initWithFrame:(CGRect)a3;
- (void)livePhotoView:(id)a3 didEndPlaybackWithStyle:(int64_t)a4;
- (void)livePhotoView:(id)a3 willBeginPlaybackWithStyle:(int64_t)a4;
@end

@implementation MOSuggestionLivePhotoView

- (_TtC16MomentsUIService25MOSuggestionLivePhotoView)initWithCoder:(id)a3
{
  *(void *)&self->livePhotoView[OBJC_IVAR____TtC16MomentsUIService25MOSuggestionLivePhotoView_delegate] = 0;
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC16MomentsUIService25MOSuggestionLivePhotoView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC16MomentsUIService25MOSuggestionLivePhotoView)initWithFrame:(CGRect)a3
{
  result = (_TtC16MomentsUIService25MOSuggestionLivePhotoView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService25MOSuggestionLivePhotoView_livePhotoView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService25MOSuggestionLivePhotoView_iconView));
  v3 = (char *)self + OBJC_IVAR____TtC16MomentsUIService25MOSuggestionLivePhotoView_delegate;

  outlined destroy of weak MOSuggestionSheetInterstitialGridInteractionsDelegate?((uint64_t)v3);
}

- (void)livePhotoView:(id)a3 willBeginPlaybackWithStyle:(int64_t)a4
{
  id v5 = a3;
  v6 = self;
  specialized MOSuggestionLivePhotoView.livePhotoView(_:willBeginPlaybackWith:)();
}

- (void)livePhotoView:(id)a3 didEndPlaybackWithStyle:(int64_t)a4
{
  id v5 = a3;
  v6 = self;
  specialized MOSuggestionLivePhotoView.livePhotoView(_:didEndPlaybackWith:)();
}

@end