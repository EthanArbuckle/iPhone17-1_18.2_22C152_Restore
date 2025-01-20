@interface CHSWidgetRelevanceService.ConnectionClient
- (_TtCE14ChronoServicesCSo25CHSWidgetRelevanceService16ConnectionClient)init;
- (void)handleWidgetRelevanceEvent:(id)a3;
- (void)timelineEntryRelevanceDidChange:(id)a3;
@end

@implementation CHSWidgetRelevanceService.ConnectionClient

- (void)timelineEntryRelevanceDidChange:(id)a3
{
  sub_190C72C5C(0, &qword_1E92ABD50);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E92ABFD8);
  sub_190CF41CC((unint64_t *)&unk_1E92ABFE0, &qword_1E92ABD50);
  uint64_t v4 = sub_190D418C8();
  v5 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtCE14ChronoServicesCSo25CHSWidgetRelevanceService16ConnectionClient_timelineRelevanceDidChangeHandler);
  if (v5)
  {
    v6 = self;
    sub_190CEF1D0((uint64_t)v5);
    v5(v4);
    sub_190CDAA9C((uint64_t)v5);
  }
  swift_bridgeObjectRelease();
}

- (void)handleWidgetRelevanceEvent:(id)a3
{
  v3 = *(void (**)(id))((char *)&self->super.isa
                                 + OBJC_IVAR____TtCE14ChronoServicesCSo25CHSWidgetRelevanceService16ConnectionClient_widgetRelevanceEventHandler);
  if (v3)
  {
    id v5 = a3;
    v6 = self;
    sub_190CEF1D0((uint64_t)v3);
    v3(v5);
    sub_190CDAA9C((uint64_t)v3);
  }
}

- (_TtCE14ChronoServicesCSo25CHSWidgetRelevanceService16ConnectionClient)init
{
  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCE14ChronoServicesCSo25CHSWidgetRelevanceService16ConnectionClient_timelineRelevanceDidChangeHandler);
  void *v3 = 0;
  v3[1] = 0;
  uint64_t v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCE14ChronoServicesCSo25CHSWidgetRelevanceService16ConnectionClient_widgetRelevanceEventHandler);
  id v5 = (objc_class *)_s16ConnectionClientCMa_0();
  *uint64_t v4 = 0;
  v4[1] = 0;
  v7.receiver = self;
  v7.super_class = v5;
  return [(CHSWidgetRelevanceService.ConnectionClient *)&v7 init];
}

- (void).cxx_destruct
{
  sub_190CDAA9C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCE14ChronoServicesCSo25CHSWidgetRelevanceService16ConnectionClient_timelineRelevanceDidChangeHandler));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtCE14ChronoServicesCSo25CHSWidgetRelevanceService16ConnectionClient_widgetRelevanceEventHandler);
  sub_190CDAA9C(v3);
}

@end