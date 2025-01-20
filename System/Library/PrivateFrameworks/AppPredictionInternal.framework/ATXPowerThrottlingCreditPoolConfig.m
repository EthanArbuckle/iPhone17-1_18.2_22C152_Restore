@interface ATXPowerThrottlingCreditPoolConfig
- (ATXPowerThrottlingCreditPoolConfig)init;
- (ATXPowerThrottlingCreditPoolConfig)initWithIdentifier:(id)a3 maxCredits:(int64_t)a4 secondsToReplenishOneCredit:(int64_t)a5 loggingSubsystem:(id)a6 loggingCategory:(id)a7;
@end

@implementation ATXPowerThrottlingCreditPoolConfig

- (ATXPowerThrottlingCreditPoolConfig)initWithIdentifier:(id)a3 maxCredits:(int64_t)a4 secondsToReplenishOneCredit:(int64_t)a5 loggingSubsystem:(id)a6 loggingCategory:(id)a7
{
  uint64_t v10 = sub_1D13F2688();
  uint64_t v12 = v11;
  uint64_t v13 = sub_1D13F2688();
  uint64_t v15 = v14;
  uint64_t v16 = sub_1D13F2688();
  v17 = (uint64_t *)((char *)self + OBJC_IVAR___ATXPowerThrottlingCreditPoolConfig_identifier);
  uint64_t *v17 = v10;
  v17[1] = v12;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ATXPowerThrottlingCreditPoolConfig_maxCredits) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ATXPowerThrottlingCreditPoolConfig_secondsToReplenishOneCredit) = (Class)a5;
  v18 = (uint64_t *)((char *)self + OBJC_IVAR___ATXPowerThrottlingCreditPoolConfig_loggingSubsystem);
  uint64_t *v18 = v13;
  v18[1] = v15;
  v19 = (uint64_t *)((char *)self + OBJC_IVAR___ATXPowerThrottlingCreditPoolConfig_loggingCategory);
  uint64_t *v19 = v16;
  v19[1] = v20;
  v22.receiver = self;
  v22.super_class = (Class)type metadata accessor for PowerThrottlingCreditPool.Config();
  return [(ATXPowerThrottlingCreditPoolConfig *)&v22 init];
}

- (ATXPowerThrottlingCreditPoolConfig)init
{
  result = (ATXPowerThrottlingCreditPoolConfig *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end