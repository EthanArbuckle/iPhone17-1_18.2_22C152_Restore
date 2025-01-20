@interface DebugRecordReplayOverlayView
- (_TtC11AssetViewer28DebugRecordReplayOverlayView)init;
- (_TtC11AssetViewer28DebugRecordReplayOverlayView)initWithCoder:(id)a3;
- (_TtC11AssetViewer28DebugRecordReplayOverlayView)initWithFrame:(CGRect)a3;
- (void)bottomButtonPressed:(id)a3;
@end

@implementation DebugRecordReplayOverlayView

- (_TtC11AssetViewer28DebugRecordReplayOverlayView)init
{
  return (_TtC11AssetViewer28DebugRecordReplayOverlayView *)sub_1E28E5FF8();
}

- (_TtC11AssetViewer28DebugRecordReplayOverlayView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E28E7120();
}

- (void)bottomButtonPressed:(id)a3
{
  id v4 = a3;
  v6 = self;
  uint64_t v5 = objc_msgSend(v4, sel_isSelected) ^ 1;
  objc_msgSend(v4, sel_setSelected_, v5);
  if (MEMORY[0x1E4E5FA30]((char *)v6 + OBJC_IVAR____TtC11AssetViewer28DebugRecordReplayOverlayView_delegate))
  {
    sub_1E290D7B8((uint64_t)objc_msgSend(v4, sel_tag), v5);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (_TtC11AssetViewer28DebugRecordReplayOverlayView)initWithFrame:(CGRect)a3
{
  result = (_TtC11AssetViewer28DebugRecordReplayOverlayView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28DebugRecordReplayOverlayView_topControlsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28DebugRecordReplayOverlayView_recordButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28DebugRecordReplayOverlayView_playButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28DebugRecordReplayOverlayView_resetButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28DebugRecordReplayOverlayView_blinkButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28DebugRecordReplayOverlayView_backButtonColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28DebugRecordReplayOverlayView_bottomBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer28DebugRecordReplayOverlayView_bottomControlsStackView));
  id v3 = (char *)self + OBJC_IVAR____TtC11AssetViewer28DebugRecordReplayOverlayView_delegate;
  sub_1E2874254((uint64_t)v3);
}

@end