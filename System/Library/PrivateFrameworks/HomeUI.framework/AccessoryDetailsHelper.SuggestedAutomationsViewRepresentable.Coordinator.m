@interface AccessoryDetailsHelper.SuggestedAutomationsViewRepresentable.Coordinator
- (_TtCVC6HomeUI22AccessoryDetailsHelper37SuggestedAutomationsViewRepresentable11Coordinator)init;
@end

@implementation AccessoryDetailsHelper.SuggestedAutomationsViewRepresentable.Coordinator

- (_TtCVC6HomeUI22AccessoryDetailsHelper37SuggestedAutomationsViewRepresentable11Coordinator)init
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtCVC6HomeUI22AccessoryDetailsHelper37SuggestedAutomationsViewRepresentable11Coordinator__parentChangeObservation) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtCVC6HomeUI22AccessoryDetailsHelper37SuggestedAutomationsViewRepresentable11Coordinator__navigationItemTitleObservation) = 0;
  v2 = self;
  sub_1BE9C1258();
  *(Class *)((char *)&v2->super.isa
           + OBJC_IVAR____TtCVC6HomeUI22AccessoryDetailsHelper37SuggestedAutomationsViewRepresentable11Coordinator__viewHeight) = (Class)0x3FF0000000000000;
  *((unsigned char *)&v2->super.isa
  + OBJC_IVAR____TtCVC6HomeUI22AccessoryDetailsHelper37SuggestedAutomationsViewRepresentable11Coordinator__shouldShowView) = 0;
  v3 = (Class *)((char *)&v2->super.isa
               + OBJC_IVAR____TtCVC6HomeUI22AccessoryDetailsHelper37SuggestedAutomationsViewRepresentable11Coordinator__requestUpdate);
  void *v3 = CGSizeMake;
  v3[1] = 0;

  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for AccessoryDetailsHelper.SuggestedAutomationsViewRepresentable.Coordinator(0);
  return [(AccessoryDetailsHelper.SuggestedAutomationsViewRepresentable.Coordinator *)&v5 init];
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCVC6HomeUI22AccessoryDetailsHelper37SuggestedAutomationsViewRepresentable11Coordinator__parentChangeObservation));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCVC6HomeUI22AccessoryDetailsHelper37SuggestedAutomationsViewRepresentable11Coordinator__navigationItemTitleObservation));
  v3 = (char *)self
     + OBJC_IVAR____TtCVC6HomeUI22AccessoryDetailsHelper37SuggestedAutomationsViewRepresentable11Coordinator___observationRegistrar;
  uint64_t v4 = sub_1BE9C1268();
  objc_super v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end