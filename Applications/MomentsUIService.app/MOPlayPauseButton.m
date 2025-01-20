@interface MOPlayPauseButton
- (_TtC16MomentsUIService17MOPlayPauseButton)init;
- (_TtC16MomentsUIService17MOPlayPauseButton)initWithCoder:(id)a3;
- (_TtC16MomentsUIService17MOPlayPauseButton)initWithFrame:(CGRect)a3;
- (void)touchPlayPause:(id)a3;
@end

@implementation MOPlayPauseButton

- (_TtC16MomentsUIService17MOPlayPauseButton)init
{
  return (_TtC16MomentsUIService17MOPlayPauseButton *)MOPlayPauseButton.init()();
}

- (void)touchPlayPause:(id)a3
{
  id v4 = a3;
  v5 = self;
  specialized MOPlayPauseButton.touchPlayPause(_:)();
}

- (_TtC16MomentsUIService17MOPlayPauseButton)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized MOPlayPauseButton.init(coder:)();
}

- (_TtC16MomentsUIService17MOPlayPauseButton)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService17MOPlayPauseButton_playPauseButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService17MOPlayPauseButton_playButtonConfig));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService17MOPlayPauseButton_pauseImage));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService17MOPlayPauseButton_playImage));
  id v3 = (char *)self + OBJC_IVAR____TtC16MomentsUIService17MOPlayPauseButton_delegate;

  outlined destroy of weak MOSuggestionSheetInterstitialGridInteractionsDelegate?((uint64_t)v3);
}

@end