@interface InternalSettingsFeatureStateModel
- (_TtC18HealthExperienceUI33InternalSettingsFeatureStateModel)init;
- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(void *)a1;
@end

@implementation InternalSettingsFeatureStateModel

- (_TtC18HealthExperienceUI33InternalSettingsFeatureStateModel)init
{
  result = (_TtC18HealthExperienceUI33InternalSettingsFeatureStateModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33InternalSettingsFeatureStateModel_featureAvailabilityStore));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33InternalSettingsFeatureStateModel_featureStatusManager));
  v3 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI33InternalSettingsFeatureStateModel__featureState;
  v4 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E4F1AC70];
  sub_1AD6231F4(0, &qword_1E9A32590, (uint64_t (*)(uint64_t))type metadata accessor for InternalSettingsFeatureState, MEMORY[0x1E4F1AC70]);
  (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v3, v5);
  v6 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI33InternalSettingsFeatureStateModel__featureStatus;
  sub_1AD6231F4(0, &qword_1E9A32598, (uint64_t (*)(uint64_t))sub_1AD620B6C, v4);
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  v8 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI33InternalSettingsFeatureStateModel__errorMessage;
  sub_1AD6231F4(0, &qword_1E9A325A8, (uint64_t (*)(uint64_t))sub_1AD620BA0, v4);
  (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  swift_bridgeObjectRelease();
  v10 = *(Class *)((char *)&self->super.isa
                 + OBJC_IVAR____TtC18HealthExperienceUI33InternalSettingsFeatureStateModel____lazy_storage___dateFormatter);
}

- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(void *)a1
{
  swift_unknownObjectRetain();
  id v2 = a1;
  sub_1AD61E370();
  swift_unknownObjectRelease();
}

@end