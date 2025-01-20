@interface ATXPowerThrottlingCreditPool
- (ATXPowerThrottlingCreditPool)init;
- (ATXPowerThrottlingCreditPool)initWithConfig:(id)a3;
- (void)consumeCredits:(int64_t)a3 toRun:(id)a4;
@end

@implementation ATXPowerThrottlingCreditPool

- (ATXPowerThrottlingCreditPool)initWithConfig:(id)a3
{
  id v3 = a3;
  v4 = (ATXPowerThrottlingCreditPool *)sub_1D139BCDC(v3);

  return v4;
}

- (void)consumeCredits:(int64_t)a3 toRun:(id)a4
{
  v6 = _Block_copy(a4);
  v8[2] = v6;
  v7 = self;
  sub_1D139B164(a3, (uint64_t)sub_1D139C260, (uint64_t)v8);
  _Block_release(v6);
}

- (ATXPowerThrottlingCreditPool)init
{
  result = (ATXPowerThrottlingCreditPool *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  id v3 = (char *)self + OBJC_IVAR___ATXPowerThrottlingCreditPool_logger;
  uint64_t v4 = sub_1D13F2538();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ATXPowerThrottlingCreditPool_queue);
}

@end