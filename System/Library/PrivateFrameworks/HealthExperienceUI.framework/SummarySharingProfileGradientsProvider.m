@interface SummarySharingProfileGradientsProvider
- (_TtC18HealthExperienceUI38SummarySharingProfileGradientsProvider)init;
- (void)controllerDidChangeContent:(id)a3;
@end

@implementation SummarySharingProfileGradientsProvider

- (void)controllerDidChangeContent:(id)a3
{
  v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI38SummarySharingProfileGradientsProvider_fetchedResultsController);
  id v5 = a3;
  v6 = self;
  id v7 = objc_msgSend(v4, sel_sections);
  if (v7)
  {
    v8 = v7;
    sub_1AD2A94F8();
    unint64_t v9 = sub_1AD73F4B0();
  }
  else
  {
    unint64_t v9 = 0;
  }
  sub_1AD50A494(v9);

  swift_bridgeObjectRelease();
}

- (_TtC18HealthExperienceUI38SummarySharingProfileGradientsProvider)init
{
  result = (_TtC18HealthExperienceUI38SummarySharingProfileGradientsProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI38SummarySharingProfileGradientsProvider_fetchedResultsController));
}

@end