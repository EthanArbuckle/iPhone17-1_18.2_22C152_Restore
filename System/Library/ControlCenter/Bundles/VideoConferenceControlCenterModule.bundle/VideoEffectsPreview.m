@interface VideoEffectsPreview
- (_TtC34VideoConferenceControlCenterModule19VideoEffectsPreview)init;
@end

@implementation VideoEffectsPreview

- (_TtC34VideoConferenceControlCenterModule19VideoEffectsPreview)init
{
  return (_TtC34VideoConferenceControlCenterModule19VideoEffectsPreview *)sub_424D0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC34VideoConferenceControlCenterModule19VideoEffectsPreview_videoView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC34VideoConferenceControlCenterModule19VideoEffectsPreview_frameReceiver));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC34VideoConferenceControlCenterModule19VideoEffectsPreview_captureFrameReceiverObserver);
}

@end