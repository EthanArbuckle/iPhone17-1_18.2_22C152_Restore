@interface HFSchedule
- (HFSchedule)initWithScheduleRules:(id)a3;
- (NSSet)rules;
- (id)allWeekDayRules;
- (id)allYearDayRules;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setRules:(id)a3;
@end

@implementation HFSchedule

- (HFSchedule)initWithScheduleRules:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"HFSchedule.m", 21, @"Invalid parameter not satisfying: %@", @"rules" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)HFSchedule;
  v7 = [(HFSchedule *)&v11 init];
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_rules, a3);
  }

  return v8;
}

- (id)allYearDayRules
{
  v2 = [(HFSchedule *)self rules];
  v3 = objc_msgSend(v2, "na_filter:", &__block_literal_global_100);

  return v3;
}

uint64_t __29__HFSchedule_allYearDayRules__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isYearDayRule];
}

- (id)allWeekDayRules
{
  v2 = [(HFSchedule *)self rules];
  v3 = objc_msgSend(v2, "na_filter:", &__block_literal_global_9_4);

  return v3;
}

uint64_t __29__HFSchedule_allWeekDayRules__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isWeekDayRule];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = [(HFSchedule *)self rules];
  uint64_t v6 = [v5 copy];
  v7 = (void *)v4[1];
  v4[1] = v6;

  return v4;
}

- (id)description
{
  v3 = [MEMORY[0x263F58188] builderWithObject:self];
  v4 = [(HFSchedule *)self rules];
  id v5 = (id)[v3 appendObject:v4 withName:@"rules"];

  uint64_t v6 = [v3 build];

  return v6;
}

- (NSSet)rules
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRules:(id)a3
{
}

- (void).cxx_destruct
{
}

@end