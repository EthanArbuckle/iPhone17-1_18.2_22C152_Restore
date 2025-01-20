@interface MOSuggestionSheetVideoPlaybackView
- (_TtC16MomentsUIService34MOSuggestionSheetVideoPlaybackView)initWithCoder:(id)a3;
- (_TtC16MomentsUIService34MOSuggestionSheetVideoPlaybackView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)didReceiveInteruptionWithNote:(id)a3;
- (void)finishedPlayingWithNote:(id)a3;
- (void)touchMute:(id)a3;
@end

@implementation MOSuggestionSheetVideoPlaybackView

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = [v3 defaultCenter];
  [v5 removeObserver:v4];

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for MOSuggestionSheetVideoPlaybackView();
  [(MOSuggestionSheetVideoPlaybackView *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionSheetVideoPlaybackView_baseVideoView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionSheetVideoPlaybackView_config));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionSheetVideoPlaybackView_muteButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionSheetVideoPlaybackView_playPauseButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionSheetVideoPlaybackView_muteButtonConfig));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionSheetVideoPlaybackView_unMutedImage));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionSheetVideoPlaybackView_mutedImage);
}

- (void)didReceiveInteruptionWithNote:(id)a3
{
  v4 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0x118);
  id v5 = a3;
  objc_super v6 = self;
  v4(0);
}

- (void)finishedPlayingWithNote:(id)a3
{
  id v4 = a3;
  id v5 = self;
  specialized MOSuggestionSheetVideoPlaybackView.finishedPlaying(note:)();
}

- (_TtC16MomentsUIService34MOSuggestionSheetVideoPlaybackView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized MOSuggestionSheetVideoPlaybackView.init(coder:)();
}

- (void)touchMute:(id)a3
{
  id v4 = a3;
  id v5 = self;
  specialized MOSuggestionSheetVideoPlaybackView.touchMute(_:)();
}

- (_TtC16MomentsUIService34MOSuggestionSheetVideoPlaybackView)initWithFrame:(CGRect)a3
{
}

@end