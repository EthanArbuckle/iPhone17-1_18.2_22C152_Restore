@interface AMRecordingViewController
- (_TtC22AudioMessagesExtension25AMRecordingViewController)initWithCoder:(id)a3;
- (_TtC22AudioMessagesExtension25AMRecordingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)controlButtonLongPress:(id)a3;
- (void)controllButtonTouchDown:(id)a3;
- (void)controllButtonTouchUpInside:(id)a3;
- (void)controllButtonTouchUpOutside:(id)a3;
- (void)handlePan:(id)a3;
- (void)viewDidLoad;
@end

@implementation AMRecordingViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_42E20();
}

- (void)controllButtonTouchDown:(id)a3
{
}

- (void)controllButtonTouchUpInside:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_45C44();
  swift_unknownObjectRelease();
}

- (void)controllButtonTouchUpOutside:(id)a3
{
}

- (void)controlButtonLongPress:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_435E4(v4);
}

- (void)handlePan:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_43D08(v4);
}

- (_TtC22AudioMessagesExtension25AMRecordingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_467B0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC22AudioMessagesExtension25AMRecordingViewController *)sub_4405C(v5, v7, a4);
}

- (_TtC22AudioMessagesExtension25AMRecordingViewController)initWithCoder:(id)a3
{
  return (_TtC22AudioMessagesExtension25AMRecordingViewController *)sub_441F4(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_viewPropertyAnimator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_recordingControlButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_recordingControlButtonWidthAnchor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_recordingControlButtonHeightAnchor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_panGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_longPressGestureRecognizer));
  sub_3DC24((uint64_t)self + OBJC_IVAR____TtC22AudioMessagesExtension25AMRecordingViewController_controlDelegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end