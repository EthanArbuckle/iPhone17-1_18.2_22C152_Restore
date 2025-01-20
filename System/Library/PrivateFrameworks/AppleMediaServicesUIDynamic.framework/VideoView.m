@interface VideoView
- (AVPlayerViewController)accessibilityPlayerViewController;
- (BOOL)accessibilityIsPlaying;
- (BOOL)accessibilityShouldBePlaying;
- (CGRect)frame;
- (UIColor)backgroundColor;
- (_TtC27AppleMediaServicesUIDynamic10PlayButton)accessibilityPlayButton;
- (_TtC27AppleMediaServicesUIDynamic9VideoView)initWithCoder:(id)a3;
- (_TtC27AppleMediaServicesUIDynamic9VideoView)initWithFrame:(CGRect)a3;
- (void)didChangeAutoPlayVideoSetting;
- (void)handleMediaServicesReset;
- (void)layoutSubviews;
- (void)playerViewController:(id)a3 willBeginFullScreenPresentationWithAnimationCoordinator:(id)a4;
- (void)setBackgroundColor:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)updateAudioSessionCategoryWithIsAudioOn:(BOOL)a3;
@end

@implementation VideoView

- (UIColor)backgroundColor
{
  v2 = self;
  id v3 = VideoView.backgroundColor.getter();

  return (UIColor *)v3;
}

- (void)setBackgroundColor:(id)a3
{
  id v5 = a3;
  v6 = self;
  VideoView.backgroundColor.setter(a3);
}

- (CGRect)frame
{
  v2 = self;
  VideoView.frame.getter();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double v3 = self;
  VideoView.frame.setter();
}

- (_TtC27AppleMediaServicesUIDynamic9VideoView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BF455EF0();
}

- (void)didChangeAutoPlayVideoSetting
{
  v2 = self;
  sub_1BF457674();
}

- (void)layoutSubviews
{
  v2 = self;
  VideoView.layoutSubviews()();
}

- (void)updateAudioSessionCategoryWithIsAudioOn:(BOOL)a3
{
  id v3 = self;
  sub_1BF458998();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (void)handleMediaServicesReset
{
  v2 = self;
  sub_1BF45A04C();
}

- (void)playerViewController:(id)a3 willBeginFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  double v6 = self;
  VideoView.playerViewController(_:willBeginFullScreenPresentationWithAnimationCoordinator:)();

  swift_unknownObjectRelease();
}

- (AVPlayerViewController)accessibilityPlayerViewController
{
  v2 = sub_1BF45A268();

  return (AVPlayerViewController *)v2;
}

- (_TtC27AppleMediaServicesUIDynamic10PlayButton)accessibilityPlayButton
{
  id v2 = sub_1BF45A2CC();

  return (_TtC27AppleMediaServicesUIDynamic10PlayButton *)v2;
}

- (BOOL)accessibilityIsPlaying
{
  id v2 = self;
  char v3 = j___s27AppleMediaServicesUIDynamic9VideoViewC9isPlayingSbvg();

  return v3 & 1;
}

- (BOOL)accessibilityShouldBePlaying
{
  return j___s27AppleMediaServicesUIDynamic9VideoViewC15shouldBePlayingSbvg() & 1;
}

- (_TtC27AppleMediaServicesUIDynamic9VideoView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_weakDestroy();
  sub_1BF3C5518((uint64_t)self + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_fullScreenDelegate);
  sub_1BF3C5518((uint64_t)self + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayerDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_previewFrameArtwork));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoPlayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playerViewController));
  sub_1BF3E9E30((uint64_t)self + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_templateMediaEvent, (uint64_t *)&unk_1EA1488E0);
  sub_1BF3E9E30((uint64_t)self + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_templateClickEvent, (uint64_t *)&unk_1EA1488E0);
  sub_1BF3E9E30((uint64_t)self + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_networkInquiry, &qword_1EA147DE8);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_playButton));
  char v3 = (char *)self + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_videoUrl;
  sub_1BF464E58();
  OUTLINED_FUNCTION_0_3();
  (*(void (**)(char *))(v4 + 8))(v3);
  swift_bridgeObjectRelease();
  sub_1BF3C5518((uint64_t)self + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_delegate);
  sub_1BF4598FC((uint64_t)self + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_configuration, (void (*)(void))type metadata accessor for VideoConfiguration);
  id v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic9VideoView_currentTouch);
}

@end