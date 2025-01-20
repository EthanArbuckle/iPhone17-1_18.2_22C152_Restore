@interface SummarySharingProfileTileEscalatedDetailsProvider
- (_TtC18HealthExperienceUI49SummarySharingProfileTileEscalatedDetailsProvider)init;
- (void)controllerDidChangeContent:(id)a3;
@end

@implementation SummarySharingProfileTileEscalatedDetailsProvider

- (void)controllerDidChangeContent:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = objc_msgSend(v4, sel_sections);
  if (v6)
  {
    v7 = v6;
    sub_1AD2A94F8();
    unint64_t v8 = sub_1AD73F4B0();
  }
  else
  {
    unint64_t v8 = 0;
  }
  sub_1AD5D6868(v8);

  swift_bridgeObjectRelease();
}

- (_TtC18HealthExperienceUI49SummarySharingProfileTileEscalatedDetailsProvider)init
{
  result = (_TtC18HealthExperienceUI49SummarySharingProfileTileEscalatedDetailsProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self
     + OBJC_IVAR____TtC18HealthExperienceUI49SummarySharingProfileTileEscalatedDetailsProvider__alertsCount;
  sub_1AD5D79F4(0, &qword_1E9A31D38, MEMORY[0x1E4FBB550], MEMORY[0x1E4F1AC70]);
  uint64_t v5 = v4;
  id v6 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v6(v3, v4);
  v6((char *)self + OBJC_IVAR____TtC18HealthExperienceUI49SummarySharingProfileTileEscalatedDetailsProvider__changesCount, v5);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI49SummarySharingProfileTileEscalatedDetailsProvider_frc));
  v7 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI49SummarySharingProfileTileEscalatedDetailsProvider_sourceProfile);
}

@end