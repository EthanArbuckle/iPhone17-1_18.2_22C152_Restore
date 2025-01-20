@interface BackgroundActivityProgressMicaView
- (_TtC18ActivityProgressUI34BackgroundActivityProgressMicaView)init;
- (_TtC18ActivityProgressUI34BackgroundActivityProgressMicaView)initWithCoder:(id)a3;
- (void)touchedDownCancelButton;
- (void)touchedUpCancelButton;
@end

@implementation BackgroundActivityProgressMicaView

- (_TtC18ActivityProgressUI34BackgroundActivityProgressMicaView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_progress;
  v6 = self;
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)[v6 progressWithTotalUnitCount:1000];
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_cancelAction) = 0;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_isTouchingDownButton) = 0;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_didPostAccessibilityLayoutChangeNotification) = 0;

  result = (_TtC18ActivityProgressUI34BackgroundActivityProgressMicaView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)touchedDownCancelButton
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_isTouchingDownButton) = 1;
  v2 = self;
  sub_10000BC54();
}

- (void)touchedUpCancelButton
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_isTouchingDownButton) = 0;
  v2 = self;
  sub_10000BC54();
}

- (_TtC18ActivityProgressUI34BackgroundActivityProgressMicaView)init
{
  result = (_TtC18ActivityProgressUI34BackgroundActivityProgressMicaView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_progress));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_cancelAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_progressMicaView));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18ActivityProgressUI34BackgroundActivityProgressMicaView_transparentCancelButton);
}

@end