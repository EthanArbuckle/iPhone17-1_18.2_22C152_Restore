@interface CaptureFrameReceiverObserver
- (_TtC34VideoConferenceControlCenterModule28CaptureFrameReceiverObserver)init;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation CaptureFrameReceiverObserver

- (_TtC34VideoConferenceControlCenterModule28CaptureFrameReceiverObserver)init
{
  return (_TtC34VideoConferenceControlCenterModule28CaptureFrameReceiverObserver *)sub_43CAC();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a3)
  {
    sub_4B300();
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    memset(v16, 0, sizeof(v16));
    id v11 = a5;
    v12 = self;
    if (!a5) {
      goto LABEL_7;
    }
    goto LABEL_4;
  }
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  swift_unknownObjectRetain();
  id v9 = a5;
  v10 = self;
  sub_4B5A0();
  swift_unknownObjectRelease();
  if (a5)
  {
LABEL_4:
    type metadata accessor for NSKeyValueChangeKey(0);
    sub_44A48(&qword_7DC00, type metadata accessor for NSKeyValueChangeKey);
    sub_4B2A0();
  }
LABEL_7:
  v13 = (void (**)(uint64_t))((char *)self
                                      + OBJC_IVAR____TtC34VideoConferenceControlCenterModule28CaptureFrameReceiverObserver_captureFrameReceiverDidChange);
  swift_beginAccess();
  v14 = *v13;
  uint64_t v15 = swift_retain();
  v14(v15);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_44B54((uint64_t)v16);
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

@end