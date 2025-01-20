@interface WOWorkoutConfigurationDataSourcesBridgedModel
+ (NSString)localizedInformationalFooterText;
+ (NSString)localizedTitle;
- (BOOL)hasDataSources;
- (NSArray)bridgedExternalProviders;
- (WOWorkoutConfigurationDataSourcesBridgedModel)init;
- (void)reload:(id)a3;
- (void)updateExternalProvider:(id)a3 enable:(BOOL)a4;
@end

@implementation WOWorkoutConfigurationDataSourcesBridgedModel

- (NSArray)bridgedExternalProviders
{
  v2 = self;
  sub_19B44();

  type metadata accessor for QueriedExternalProviderBridge();
  v3.super.isa = sub_202D0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (BOOL)hasDataSources
{
  v2 = self;
  unint64_t v3 = sub_1FE50();
  if (v3 >> 62) {
    uint64_t v4 = sub_20390();
  }
  else {
    uint64_t v4 = *(void *)((char *)&dword_10 + (v3 & 0xFFFFFFFFFFFFFF8));
  }

  swift_bridgeObjectRelease();
  return v4 != 0;
}

- (void)reload:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v7 = sub_1A16C;
  }
  else
  {
    v7 = 0;
    uint64_t v6 = 0;
  }
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = v6;
  v9 = self;
  sub_1A114((uint64_t)v7);
  sub_1FE60();
  swift_release();
  sub_1A124((uint64_t)v7);
}

- (void)updateExternalProvider:(id)a3 enable:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1FE40();
}

+ (NSString)localizedTitle
{
  return (NSString *)sub_19F7C();
}

+ (NSString)localizedInformationalFooterText
{
  return (NSString *)sub_19F7C();
}

- (WOWorkoutConfigurationDataSourcesBridgedModel)init
{
  uint64_t v3 = OBJC_IVAR___WOWorkoutConfigurationDataSourcesBridgedModel_model;
  sub_1FE80();
  swift_allocObject();
  uint64_t v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_1FE70();

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for WorkoutConfigurationDataSourcesBridgedModel();
  return [(WOWorkoutConfigurationDataSourcesBridgedModel *)&v6 init];
}

- (void).cxx_destruct
{
}

@end