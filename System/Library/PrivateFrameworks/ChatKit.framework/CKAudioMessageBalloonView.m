@interface CKAudioMessageBalloonView
- (BOOL)isAudioMessage;
- (BOOL)isPlayed;
- (BOOL)isPlaying;
- (BOOL)serviceIsRCS;
- (BOOL)serviceIsSMS;
- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (CKAudioMediaObject)mediaObject;
- (_TtC7ChatKit20AudioMessageWaveform)waveformView;
- (_TtC7ChatKit25CKAudioMessageBalloonView)initWithCoder:(id)a3;
- (_TtC7ChatKit25CKAudioMessageBalloonView)initWithFrame:(CGRect)a3;
- (double)duration;
- (double)initialTimeBeforePan;
- (double)playbackSpeed;
- (double)time;
- (id)nonVibrantSubViews;
- (id)playPauseButtonColorFor:(char)a3;
- (id)playPauseButtonConfiguration;
- (id)playbackSpeedMenu;
- (id)speedLabelColorFor:(char)a3 idiom:(int64_t)a4;
- (id)timeLabelColorFor:(char)a3 idiom:(int64_t)a4;
- (id)transcriptionButtonColorWithIsFromMe:(BOOL)a3 idiom:(int64_t)a4;
- (id)waveformColorWithIsFromMe:(BOOL)a3 isPlayed:(BOOL)a4 idiom:(int64_t)a5;
- (int64_t)waveformContentMode;
- (void)addOverlaySubview:(id)a3;
- (void)configureForComposition:(id)a3;
- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5;
- (void)configureForMessagePart:(id)a3;
- (void)layoutSubviews;
- (void)prepareForDisplay;
- (void)setDuration:(double)a3;
- (void)setInitialTimeBeforePan:(double)a3;
- (void)setMediaObject:(id)a3;
- (void)setPlaybackSpeed:(double)a3;
- (void)setPlayed:(BOOL)a3;
- (void)setPlaying:(BOOL)a3;
- (void)setServiceIsRCS:(BOOL)a3;
- (void)setServiceIsSMS:(BOOL)a3;
- (void)setTime:(double)a3;
- (void)setWaveformContentMode:(int64_t)a3;
- (void)setWaveformView:(id)a3;
- (void)tapGestureRecognized:(id)a3;
- (void)vibrantContainerWillReparentNonVibrantSubviews:(id)a3;
- (void)waveformProgressViewPanning:(id)a3;
@end

@implementation CKAudioMessageBalloonView

- (id)waveformColorWithIsFromMe:(BOOL)a3 isPlayed:(BOOL)a4 idiom:(int64_t)a5
{
  v8 = self;
  sub_18F4B1CF8(a3, a4, a5);
  v10 = v9;

  return v10;
}

- (id)transcriptionButtonColorWithIsFromMe:(BOOL)a3 idiom:(int64_t)a4
{
  id v4 = sub_18F4B2350(a3, a4);

  return v4;
}

- (id)timeLabelColorFor:(char)a3 idiom:(int64_t)a4
{
  id v4 = sub_18F4B23C4(a3, a4);

  return v4;
}

- (id)playPauseButtonColorFor:(char)a3
{
  id v4 = self;
  sub_18F4B1F70(a3);
  v6 = v5;

  return v6;
}

- (id)speedLabelColorFor:(char)a3 idiom:(int64_t)a4
{
  v6 = self;
  sub_18F4B2144(a3, a4);
  v8 = v7;

  return v8;
}

- (id)playbackSpeedMenu
{
  v2 = self;
  id v3 = sub_18F676354();

  return v3;
}

- (void)waveformProgressViewPanning:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_18F676A80(v4);
}

- (BOOL)isAudioMessage
{
  return 1;
}

- (CKAudioMediaObject)mediaObject
{
  v2 = (id *)((char *)&self->super.super.super.super.super.super.isa
            + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView_mediaObject);
  swift_beginAccess();
  return (CKAudioMediaObject *)*v2;
}

- (void)setMediaObject:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_18F6CFEF0(a3);
}

- (_TtC7ChatKit20AudioMessageWaveform)waveformView
{
  v2 = self;
  id v3 = sub_18F6CC13C();

  return (_TtC7ChatKit20AudioMessageWaveform *)v3;
}

- (void)setWaveformView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView____lazy_storage___waveformView);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView____lazy_storage___waveformView) = (Class)a3;
  id v3 = a3;
}

- (id)playPauseButtonConfiguration
{
  uint64_t v3 = sub_18F7BA1C0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  id v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_18F7BA180();
  id v8 = objc_msgSend(self, sel_configurationWithTextStyle_scale_, *MEMORY[0x1E4F438F0], 3);
  sub_18F7BA020();

  v9 = (void *)sub_18F7BA0E0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return v9;
}

- (double)playbackSpeed
{
  return *(double *)((char *)&self->super.super.super.super.super.super.isa
                   + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView_playbackSpeed);
}

- (void)setPlaybackSpeed:(double)a3
{
  uint64_t v4 = self;
  sub_18F6CCD38(a3);
}

- (int64_t)waveformContentMode
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView_waveformContentMode);
  swift_beginAccess();
  return *v2;
}

- (void)setWaveformContentMode:(int64_t)a3
{
  uint64_t v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView_waveformContentMode);
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (double)time
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView_time);
  swift_beginAccess();
  return *v2;
}

- (void)setTime:(double)a3
{
  uint64_t v5 = (double *)((char *)self + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView_time);
  swift_beginAccess();
  double *v5 = a3;
  id v6 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView_panGestureRecognizer);
  if (v6) {
    objc_msgSend(v6, sel_setEnabled_, a3 > 0.0);
  }
}

- (double)initialTimeBeforePan
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView_initialTimeBeforePan);
  swift_beginAccess();
  return *v2;
}

- (void)setInitialTimeBeforePan:(double)a3
{
  uint64_t v4 = (double *)((char *)self + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView_initialTimeBeforePan);
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (double)duration
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView_duration);
  swift_beginAccess();
  return *v2;
}

- (void)setDuration:(double)a3
{
  uint64_t v5 = (double *)((char *)self + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView_duration);
  swift_beginAccess();
  double *v5 = a3;
  id v6 = self;
  sub_18F6CD794();
}

- (BOOL)isPlaying
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView_isPlaying;
  swift_beginAccess();
  return *v2;
}

- (void)setPlaying:(BOOL)a3
{
  uint64_t v4 = self;
  sub_18F6CDA20(a3);
}

- (BOOL)isPlayed
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView_isPlayed;
  swift_beginAccess();
  return *v2;
}

- (void)setPlayed:(BOOL)a3
{
  uint64_t v4 = self;
  sub_18F6CDCBC(a3);
}

- (BOOL)serviceIsSMS
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView_serviceIsSMS;
  swift_beginAccess();
  return *v2;
}

- (void)setServiceIsSMS:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView_serviceIsSMS;
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (BOOL)serviceIsRCS
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView_serviceIsRCS;
  swift_beginAccess();
  return *v2;
}

- (void)setServiceIsRCS:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView_serviceIsRCS;
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (void)addOverlaySubview:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_18F6CCB2C();
  [(CKAudioMessageBalloonView *)v5 insertSubview:v4 belowSubview:v6];
}

- (_TtC7ChatKit25CKAudioMessageBalloonView)initWithFrame:(CGRect)a3
{
  return (_TtC7ChatKit25CKAudioMessageBalloonView *)sub_18F6CE530(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7ChatKit25CKAudioMessageBalloonView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_18F6CFFD8();
}

- (void)prepareForDisplay
{
  v2 = self;
  sub_18F6CE93C();
}

- (void)vibrantContainerWillReparentNonVibrantSubviews:(id)a3
{
  if (!a3) {
    goto LABEL_15;
  }
  sub_18EF3528C(0, (unint64_t *)&qword_1E922B6C0);
  unint64_t v3 = sub_18F7B99C0();
  unint64_t v4 = v3;
  if (v3 >> 62)
  {
    v10 = self;
    sub_18F7B6CA0();
    uint64_t v5 = sub_18F7BA5F0();
    if (v5) {
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v5 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    id v6 = self;
    sub_18F7B6CA0();
    if (v5)
    {
LABEL_4:
      if (v5 >= 1)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if ((v4 & 0xC000000000000001) != 0) {
            id v8 = (id)MEMORY[0x192FB89F0](i, v4);
          }
          else {
            id v8 = *(id *)(v4 + 8 * i + 32);
          }
          v9 = v8;
          objc_msgSend(v8, sel_setUserInteractionEnabled_, 0);
        }
        goto LABEL_11;
      }
      __break(1u);
LABEL_15:
      __break(1u);
      return;
    }
  }
LABEL_11:
  swift_bridgeObjectRelease_n();
}

- (id)nonVibrantSubViews
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E922C140);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_18F824F40;
  unint64_t v4 = self;
  *(void *)(v3 + 32) = sub_18F6CBBA8();
  *(void *)(v3 + 40) = sub_18F6CC13C();
  *(void *)(v3 + 48) = sub_18F6CC32C();
  sub_18F7B99E0();

  sub_18EF3528C(0, (unint64_t *)&qword_1E922B6C0);
  uint64_t v5 = (void *)sub_18F7B99A0();
  swift_bridgeObjectRelease();

  return v5;
}

- (void)configureForComposition:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_18F6CF134(a3);
}

- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5
{
  id v9 = a3;
  v10 = self;
  sub_18F6CF368(a3, a5, a4);
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height = a3.height;
  double width = a3.width;
  id v6 = self;
  sub_18F6D013C(width, height);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_18F6CF594();
}

- (void)configureForMessagePart:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_18F6CF718(a3);
}

- (void)tapGestureRecognized:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_18F6CFCB4(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView_panGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView_mediaObject));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView____lazy_storage___timeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView____lazy_storage___speedLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView____lazy_storage___transcriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView____lazy_storage___waveformView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView____lazy_storage___playPauseButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView____lazy_storage___horizontalStackView));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC7ChatKit25CKAudioMessageBalloonView____lazy_storage___verticalStackView);
}

@end