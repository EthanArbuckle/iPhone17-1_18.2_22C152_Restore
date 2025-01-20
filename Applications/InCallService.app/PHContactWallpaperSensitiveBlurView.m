@interface PHContactWallpaperSensitiveBlurView
- (_TtC13InCallService35PHContactWallpaperSensitiveBlurView)init;
- (_TtC13InCallService35PHContactWallpaperSensitiveBlurView)initWithCoder:(id)a3;
- (_TtC13InCallService35PHContactWallpaperSensitiveBlurView)initWithFrame:(CGRect)a3;
- (_TtC13InCallService35PHContactWallpaperSensitiveBlurView)initWithIsCommunicationSafety:(BOOL)a3;
- (id)didTapRevealButton;
- (void)didTapButton;
- (void)setDidTapRevealButton:(id)a3;
@end

@implementation PHContactWallpaperSensitiveBlurView

- (id)didTapRevealButton
{
  uint64_t v2 = sub_100183690();
  if (v2)
  {
    v6[4] = v2;
    v6[5] = v3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 1107296256;
    v6[2] = sub_10012EDF4;
    v6[3] = &unk_1002D37C8;
    v4 = _Block_copy(v6);
    swift_release();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setDidTapRevealButton:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_10011F72C;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  sub_100183778((uint64_t)v4, v5);
}

- (_TtC13InCallService35PHContactWallpaperSensitiveBlurView)initWithIsCommunicationSafety:(BOOL)a3
{
  return (_TtC13InCallService35PHContactWallpaperSensitiveBlurView *)sub_100183798(a3);
}

- (_TtC13InCallService35PHContactWallpaperSensitiveBlurView)init
{
}

- (_TtC13InCallService35PHContactWallpaperSensitiveBlurView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001846F4();
}

- (void)didTapButton
{
  uint64_t v2 = self;
  sub_100184780();
}

- (_TtC13InCallService35PHContactWallpaperSensitiveBlurView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  sub_100142E2C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC13InCallService35PHContactWallpaperSensitiveBlurView_didTapRevealButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13InCallService35PHContactWallpaperSensitiveBlurView_blurEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13InCallService35PHContactWallpaperSensitiveBlurView_descriptionLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13InCallService35PHContactWallpaperSensitiveBlurView_revealButton);
}

@end