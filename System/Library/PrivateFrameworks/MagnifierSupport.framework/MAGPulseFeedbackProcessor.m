@interface MAGPulseFeedbackProcessor
- (_TtC16MagnifierSupport25MAGPulseFeedbackProcessor)init;
@end

@implementation MAGPulseFeedbackProcessor

- (_TtC16MagnifierSupport25MAGPulseFeedbackProcessor)init
{
  return (_TtC16MagnifierSupport25MAGPulseFeedbackProcessor *)MAGPulseFeedbackProcessor.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport25MAGPulseFeedbackProcessor_toneGenerator));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport25MAGPulseFeedbackProcessor_doorToneGenerator));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport25MAGPulseFeedbackProcessor_objectUnderstandingToneGenerator));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport25MAGPulseFeedbackProcessor_pointSpeakDistanceToneGenerator));
  swift_release();
  swift_release();
  swift_release();
}

@end