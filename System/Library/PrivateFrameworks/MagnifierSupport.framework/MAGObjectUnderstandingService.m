@interface MAGObjectUnderstandingService
- (_TtC16MagnifierSupport29MAGObjectUnderstandingService)init;
- (void)session:(id)a3 didUpdateDetectedObjects:(id)a4;
@end

@implementation MAGObjectUnderstandingService

- (void)session:(id)a3 didUpdateDetectedObjects:(id)a4
{
  sub_2356594B0(0, &qword_268810598);
  unint64_t v6 = sub_235949D78();
  id v7 = a3;
  v8 = self;
  sub_2356DD3A4(v6);

  swift_bridgeObjectRelease();
}

- (_TtC16MagnifierSupport29MAGObjectUnderstandingService)init
{
  result = (_TtC16MagnifierSupport29MAGObjectUnderstandingService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport29MAGObjectUnderstandingService_arService));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport29MAGObjectUnderstandingService_pulseFeedbackProcessor));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport29MAGObjectUnderstandingService_detectedObjectsRootNode));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport29MAGObjectUnderstandingService_detectedPlanesRootNode));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport29MAGObjectUnderstandingService_detectedTargetObject));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport29MAGObjectUnderstandingService_objectPointerParentNode));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport29MAGObjectUnderstandingService_objectPointer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport29MAGObjectUnderstandingService_pointerHitTestDebugNode));

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16MagnifierSupport29MAGObjectUnderstandingService_ouSession);
}

@end