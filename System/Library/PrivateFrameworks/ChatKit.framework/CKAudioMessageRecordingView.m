@interface CKAudioMessageRecordingView
+ (id)buttonFor:(int64_t)a3 with:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isStopButtonHighlighted;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKAudioMessageRecordingView)initWithCoder:(id)a3;
- (CKAudioMessageRecordingView)initWithFrame:(CGRect)a3;
- (CKAudioMessageRecordingView)initWithFrame:(CGRect)a3 service:(id)a4;
- (CKAudioMessageRecordingViewDelegate)delegate;
- (IMService)service;
- (NSArray)intensities;
- (UIButton)sendButton;
- (UIButton)stopButton;
- (UIView)backgroundView;
- (double)cornerRadius;
- (double)playbackCurrentTime;
- (double)playbackDuration;
- (int64_t)state;
- (void)addToWaveformWithIntensity:(double)a3;
- (void)closeFrom:(id)a3;
- (void)displayLinkFiredFrom:(id)a3;
- (void)invalidateDisplayLink;
- (void)layoutSubviews;
- (void)playFrom:(id)a3;
- (void)resumeFrom:(id)a3;
- (void)scrubFrom:(id)a3;
- (void)sendFrom:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setIsStopButtonHighlighted:(BOOL)a3;
- (void)setPlaybackCurrentTime:(double)a3;
- (void)setPlaybackDuration:(double)a3;
- (void)setSendButton:(id)a3;
- (void)setService:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setWithIntensities:(id)a3;
- (void)setupDisplayLink;
- (void)stopFrom:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CKAudioMessageRecordingView

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  v4 = (UIGestureRecognizer *)a3;
  v5 = self;
  LOBYTE(self) = AudioMessageRecordingView.gestureRecognizerShouldBegin(_:)(v4);

  return self & 1;
}

- (void)scrubFrom:(id)a3
{
  v4 = (UILongPressGestureRecognizer *)a3;
  v5 = self;
  AudioMessageRecordingView.scrub(from:)(v4);
}

- (void)closeFrom:(id)a3
{
}

- (void)stopFrom:(id)a3
{
}

- (void)sendFrom:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_18F7BA320();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = (char *)self + OBJC_IVAR___CKAudioMessageRecordingView_delegate;
  swift_beginAccess();
  v7 = (void *)MEMORY[0x192FBC390](v6);
  if (v7)
  {
    objc_msgSend(v7, sel_audioMessageRecordingViewDidSend_, self);

    swift_unknownObjectRelease();
  }
  else
  {
  }
  sub_18EF288F8((uint64_t)v8);
}

- (void)resumeFrom:(id)a3
{
}

- (void)playFrom:(id)a3
{
}

+ (id)buttonFor:(int64_t)a3 with:(id)a4
{
  switch(a3)
  {
    case 0:
      sub_18F61F92C();
      break;
    case 1:
      sub_18F61FCDC();
      break;
    case 2:
      sub_18F620048();
      break;
    case 3:
      v4 = sub_18F6204FC();
      break;
    default:
      id v6 = a4;
      sub_18F7BA740();
      __break(1u);
      JUMPOUT(0x18F61F00CLL);
  }

  return v4;
}

- (CKAudioMessageRecordingViewDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR___CKAudioMessageRecordingView_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x192FBC390](v2);

  return (CKAudioMessageRecordingViewDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)state
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___CKAudioMessageRecordingView_state);
  swift_beginAccess();
  return *v2;
}

- (void)setState:(int64_t)a3
{
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___CKAudioMessageRecordingView_state);
  swift_beginAccess();
  uint64_t v6 = *v5;
  uint64_t *v5 = a3;
  v7 = self;
  sub_18F78E5D0(v6);
}

- (double)cornerRadius
{
  v2 = (double *)((char *)self + OBJC_IVAR___CKAudioMessageRecordingView_cornerRadius);
  swift_beginAccess();
  return *v2;
}

- (void)setCornerRadius:(double)a3
{
  v5 = (double *)((char *)self + OBJC_IVAR___CKAudioMessageRecordingView_cornerRadius);
  swift_beginAccess();
  double v6 = *v5;
  double *v5 = a3;
  if (v6 != a3) {
    [(CKAudioMessageRecordingView *)self setNeedsLayout];
  }
}

- (BOOL)isStopButtonHighlighted
{
  v2 = (BOOL *)self + OBJC_IVAR___CKAudioMessageRecordingView_isStopButtonHighlighted;
  swift_beginAccess();
  return *v2;
}

- (void)setIsStopButtonHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (char *)self + OBJC_IVAR___CKAudioMessageRecordingView_isStopButtonHighlighted;
  swift_beginAccess();
  int v6 = *v5;
  unsigned char *v5 = v3;
  if (v6 != v3) {
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKAudioMessageRecordingView_stopButton), sel_setHighlighted_, v3);
  }
}

- (double)playbackDuration
{
  v2 = (double *)((char *)self + OBJC_IVAR___CKAudioMessageRecordingView_playbackDuration);
  swift_beginAccess();
  return *v2;
}

- (void)setPlaybackDuration:(double)a3
{
}

- (double)playbackCurrentTime
{
  v2 = (double *)((char *)self + OBJC_IVAR___CKAudioMessageRecordingView_playbackCurrentTime);
  swift_beginAccess();
  return *v2;
}

- (void)setPlaybackCurrentTime:(double)a3
{
}

- (NSArray)intensities
{
  swift_beginAccess();
  sub_18F7B6CA0();
  v2 = (void *)sub_18F7B99A0();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (UIView)backgroundView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR___CKAudioMessageRecordingView_backgroundView));
}

- (IMService)service
{
  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKAudioMessageRecordingView_service);
  swift_beginAccess();
  return (IMService *)*v2;
}

- (void)setService:(id)a3
{
  v5 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR___CKAudioMessageRecordingView_service);
  swift_beginAccess();
  int v6 = *v5;
  unsigned char *v5 = a3;
  id v7 = a3;
  v8 = self;

  v9 = (id *)((char *)&v8->super.super.super.isa + OBJC_IVAR___CKAudioMessageRecordingView_sendButton);
  swift_beginAccess();
  objc_msgSend(*v9, sel_setNeedsUpdateConfiguration);
}

- (UIButton)stopButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR___CKAudioMessageRecordingView_stopButton));
}

- (UIButton)sendButton
{
  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKAudioMessageRecordingView_sendButton);
  swift_beginAccess();
  return (UIButton *)*v2;
}

- (void)setSendButton:(id)a3
{
  v4 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR___CKAudioMessageRecordingView_sendButton);
  swift_beginAccess();
  v5 = *v4;
  void *v4 = a3;
  id v6 = a3;
}

- (CKAudioMessageRecordingView)initWithFrame:(CGRect)a3
{
  return (CKAudioMessageRecordingView *)AudioMessageRecordingView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CKAudioMessageRecordingView)initWithFrame:(CGRect)a3 service:(id)a4
{
  return (CKAudioMessageRecordingView *)AudioMessageRecordingView.init(frame:service:)(a4);
}

- (void)setupDisplayLink
{
  uint64_t v2 = OBJC_IVAR___CKAudioMessageRecordingView_displayLink;
  if (!*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKAudioMessageRecordingView_displayLink))
  {
    v4 = self;
    v5 = self;
    id v6 = (objc_class *)objc_msgSend(v4, sel_displayLinkWithTarget_selector_, v5, sel_displayLinkFiredFrom_);
    id v7 = *(Class *)((char *)&self->super.super.super.isa + v2);
    *(Class *)((char *)&self->super.super.super.isa + v2) = v6;
  }
}

- (void)invalidateDisplayLink
{
  uint64_t v3 = OBJC_IVAR___CKAudioMessageRecordingView_displayLink;
  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKAudioMessageRecordingView_displayLink);
  v5 = self;
  objc_msgSend(v4, sel_invalidate);
  id v6 = *(Class *)((char *)&self->super.super.super.isa + v3);
  *(Class *)((char *)&self->super.super.super.isa + v3) = 0;
}

- (CKAudioMessageRecordingView)initWithCoder:(id)a3
{
  id v3 = a3;
  _s7ChatKit25AudioMessageRecordingViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)layoutSubviews
{
  uint64_t v2 = self;
  sub_18F7908EC();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  sub_18F79184C();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  double v7 = self;
  id v5 = [(CKAudioMessageRecordingView *)v7 traitCollection];
  unsigned int v6 = objc_msgSend(v5, sel_hasDifferentColorAppearanceComparedToTraitCollection_, v4);

  if (v6) {
    [(CKAudioMessageRecordingView *)v7 setNeedsLayout];
  }
}

- (void)displayLinkFiredFrom:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_18F7BA320();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    id v5 = self;
  }
  sub_18F791A3C();

  sub_18EF27FE8((uint64_t)v6, (uint64_t *)&unk_1E922C090);
}

- (void)setWithIntensities:(id)a3
{
  uint64_t v4 = sub_18F7B99C0();
  id v5 = *(char **)((char *)&self->super.super.super.isa + OBJC_IVAR___CKAudioMessageRecordingView_waveformView);
  unsigned int v6 = (uint64_t *)&v5[OBJC_IVAR____TtC7ChatKit33AudioMessageRecordingWaveformView_intensities];
  swift_beginAccess();
  uint64_t *v6 = v4;
  double v7 = self;
  sub_18F7B6CA0();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_setNeedsLayout);

  swift_bridgeObjectRelease();
}

- (void)addToWaveformWithIntensity:(double)a3
{
  id v5 = *(char **)((char *)&self->super.super.super.isa + OBJC_IVAR___CKAudioMessageRecordingView_waveformView);
  unsigned int v6 = &v5[OBJC_IVAR____TtC7ChatKit33AudioMessageRecordingWaveformView_intensities];
  swift_beginAccess();
  double v7 = *(void **)v6;
  double v8 = self;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)unsigned int v6 = v7;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    double v7 = sub_18F4B6578(0, v7[2] + 1, 1, v7);
    *(void *)unsigned int v6 = v7;
  }
  unint64_t v11 = v7[2];
  unint64_t v10 = v7[3];
  if (v11 >= v10 >> 1)
  {
    double v7 = sub_18F4B6578((void *)(v10 > 1), v11 + 1, 1, v7);
    *(void *)unsigned int v6 = v7;
  }
  v7[2] = v11 + 1;
  *(double *)&v7[v11 + 4] = a3;
  swift_endAccess();
  objc_msgSend(v5, sel_setNeedsLayout);
}

- (void).cxx_destruct
{
  sub_18F4C25DC((uint64_t)self + OBJC_IVAR___CKAudioMessageRecordingView_delegate);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKAudioMessageRecordingView_durationAppendButton));

  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKAudioMessageRecordingView_displayLink);
}

@end