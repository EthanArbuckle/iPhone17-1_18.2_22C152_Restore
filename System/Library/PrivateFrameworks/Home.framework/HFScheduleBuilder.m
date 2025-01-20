@interface HFScheduleBuilder
+ (id)scheduleBuilderFromHomeAccessSchedule:(id)a3;
+ (id)scheduleBuilderFromSchedule:(id)a3;
+ (id)scheduleBuilderFromType:(unint64_t)a3 withDefaultRules:(BOOL)a4;
+ (id)scheduleBuilderFromYearDayRules:(id)a3 weekDayRules:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsWeekDayRules;
- (BOOL)supportsYearDayRules;
- (HFScheduleBuilder)init;
- (NSSet)rules;
- (id)build;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)estimatedScheduleType;
- (unint64_t)hash;
- (unint64_t)maxNumberOfRules;
- (unint64_t)minNumberOfRules;
- (void)setMaxNumberOfRules:(unint64_t)a3;
- (void)setMinNumberOfRules:(unint64_t)a3;
- (void)setRules:(id)a3;
- (void)setSupportsWeekDayRules:(BOOL)a3;
- (void)setSupportsYearDayRules:(BOOL)a3;
@end

@implementation HFScheduleBuilder

- (void).cxx_destruct
{
}

- (NSSet)rules
{
  return self->_rules;
}

+ (id)scheduleBuilderFromHomeAccessSchedule:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 weekDayRules];
    v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_18_6);

    v8 = [v5 yearDayRules];
    v9 = objc_msgSend(v8, "na_map:", &__block_literal_global_21_5);

    v10 = [a1 scheduleBuilderFromYearDayRules:v9 weekDayRules:v7];
  }
  else
  {
    v10 = [a1 scheduleBuilderFromType:0 withDefaultRules:0];
  }

  return v10;
}

+ (id)scheduleBuilderFromType:(unint64_t)a3 withDefaultRules:(BOOL)a4
{
  BOOL v4 = a4;
  v8 = objc_alloc_init(HFScheduleBuilder);
  v9 = v8;
  if (a3 == 2)
  {
    [(HFScheduleBuilder *)v8 setSupportsWeekDayRules:1];
    if (!v4) {
      goto LABEL_12;
    }
    v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = 2;
  }
  else
  {
    if (a3 != 1)
    {
      if (a3)
      {
        v10 = [MEMORY[0x263F08690] currentHandler];
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"HFScheduleBuilder.m", 122, @"Unknown schedule type", a3);
      }
      else
      {
        [(HFScheduleBuilder *)v8 setMinNumberOfRules:0];
        [(HFScheduleBuilder *)v9 setMaxNumberOfRules:0];
        v10 = [MEMORY[0x263EFFA08] set];
        [(HFScheduleBuilder *)v9 setRules:v10];
      }
      goto LABEL_11;
    }
    [(HFScheduleBuilder *)v8 setSupportsYearDayRules:1];
    if (!v4) {
      goto LABEL_12;
    }
    v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = 1;
  }
  v10 = +[HFScheduleRule defaultRuleForType:v12];
  v13 = [v11 setWithObject:v10];
  [(HFScheduleBuilder *)v9 setRules:v13];

LABEL_11:
LABEL_12:
  return v9;
}

- (void)setRules:(id)a3
{
}

- (void)setMinNumberOfRules:(unint64_t)a3
{
  self->_minNumberOfRules = a3;
}

- (void)setMaxNumberOfRules:(unint64_t)a3
{
  self->_maxNumberOfRules = a3;
}

- (HFScheduleBuilder)init
{
  v7.receiver = self;
  v7.super_class = (Class)HFScheduleBuilder;
  v2 = [(HFScheduleBuilder *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v4 = [v3 initWithArray:MEMORY[0x263EFFA68]];
    v5 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v4;

    *((_WORD *)v2 + 4) = 0;
    *(_OWORD *)(v2 + 24) = xmmword_20BD13830;
  }
  return (HFScheduleBuilder *)v2;
}

HFScheduleRule *__59__HFScheduleBuilder_scheduleBuilderFromHomeAccessSchedule___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[HFScheduleRule alloc] initWithWeekDayRule:v2];

  return v3;
}

HFScheduleRule *__59__HFScheduleBuilder_scheduleBuilderFromHomeAccessSchedule___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[HFScheduleRule alloc] initWithYearDayRule:v2];

  return v3;
}

+ (id)scheduleBuilderFromSchedule:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"HFScheduleBuilder.m", 149, @"Invalid parameter not satisfying: %@", @"schedule" object file lineNumber description];
  }
  v6 = [v5 allYearDayRules];
  objc_super v7 = [v6 allObjects];
  v8 = [v5 allWeekDayRules];
  v9 = [v8 allObjects];
  v10 = [a1 scheduleBuilderFromYearDayRules:v7 weekDayRules:v9];

  return v10;
}

+ (id)scheduleBuilderFromYearDayRules:(id)a3 weekDayRules:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"HFScheduleBuilder.m", 155, @"Invalid parameter not satisfying: %@", @"yearDayRules" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_18:
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"HFScheduleBuilder.m", 156, @"Invalid parameter not satisfying: %@", @"weekDayRules" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_18;
  }
LABEL_3:
  v10 = objc_alloc_init(HFScheduleBuilder);
  if objc_msgSend(v9, "hmf_isEmpty") && (objc_msgSend(v7, "hmf_isEmpty"))
  {
    [(HFScheduleBuilder *)v10 setMinNumberOfRules:0];
    [(HFScheduleBuilder *)v10 setMaxNumberOfRules:0];
    v11 = [MEMORY[0x263EFFA08] set];
  }
  else
  {
    v11 = [MEMORY[0x263EFF9C0] set];
    if ((objc_msgSend(v9, "hmf_isEmpty") & 1) == 0)
    {
      [(HFScheduleBuilder *)v10 setSupportsWeekDayRules:1];
      [v11 addObjectsFromArray:v9];
    }
    if ((objc_msgSend(v7, "hmf_isEmpty") & 1) == 0)
    {
      [(HFScheduleBuilder *)v10 setSupportsYearDayRules:1];
      [v11 addObjectsFromArray:v7];
    }
    unint64_t v12 = [v11 count];
    unint64_t v13 = [(HFScheduleBuilder *)v10 maxNumberOfRules];
    if (v12 <= v13) {
      unint64_t v14 = v13;
    }
    else {
      unint64_t v14 = v12;
    }
    [(HFScheduleBuilder *)v10 setMaxNumberOfRules:v14];
  }
  [(HFScheduleBuilder *)v10 setRules:v11];

  return v10;
}

- (unint64_t)estimatedScheduleType
{
  id v3 = [(HFScheduleBuilder *)self rules];
  char v4 = objc_msgSend(v3, "hmf_isEmpty");

  if (v4) {
    return 0;
  }
  v6 = [(HFScheduleBuilder *)self rules];
  id v7 = [v6 allObjects];
  id v8 = [v7 firstObject];
  char v9 = [v8 isYearDayRule];

  if (v9) {
    return 1;
  }
  v10 = [(HFScheduleBuilder *)self rules];
  v11 = [v10 allObjects];
  unint64_t v12 = [v11 firstObject];
  [v12 isWeekDayRule];

  return 2;
}

- (id)build
{
  if (+[HFScheduleValidator isValid:self])
  {
    id v3 = [HFSchedule alloc];
    char v4 = [(HFScheduleBuilder *)self rules];
    id v5 = (void *)[v4 copy];
    v6 = [(HFSchedule *)v3 initWithScheduleRules:v5];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v4 = objc_alloc_init((Class)objc_opt_class());
  id v5 = [(HFScheduleBuilder *)self rules];
  uint64_t v6 = [v5 copy];
  id v7 = (void *)v4[2];
  v4[2] = v6;

  *((unsigned char *)v4 + 8) = [(HFScheduleBuilder *)self supportsWeekDayRules];
  *((unsigned char *)v4 + 9) = [(HFScheduleBuilder *)self supportsYearDayRules];
  v4[3] = [(HFScheduleBuilder *)self minNumberOfRules];
  v4[4] = [(HFScheduleBuilder *)self maxNumberOfRules];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  char v4 = (HFScheduleBuilder *)a3;
  if (self == v4) {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_10;
  }
  id v5 = [(HFScheduleBuilder *)v4 rules];
  uint64_t v6 = [(HFScheduleBuilder *)self rules];
  if (![v5 isEqualToSet:v6]
    || (BOOL v7 = [(HFScheduleBuilder *)v4 supportsWeekDayRules],
        v7 != [(HFScheduleBuilder *)self supportsWeekDayRules])
    || (BOOL v8 = [(HFScheduleBuilder *)v4 supportsYearDayRules],
        v8 != [(HFScheduleBuilder *)self supportsYearDayRules])
    || (uint64_t v9 = [(HFScheduleBuilder *)v4 minNumberOfRules],
        v9 != [(HFScheduleBuilder *)self minNumberOfRules]))
  {

    goto LABEL_10;
  }
  uint64_t v10 = [(HFScheduleBuilder *)v4 maxNumberOfRules];
  unint64_t v11 = [(HFScheduleBuilder *)self maxNumberOfRules];

  if (v10 != v11)
  {
LABEL_10:
    BOOL v12 = 0;
    goto LABEL_11;
  }
LABEL_8:
  BOOL v12 = 1;
LABEL_11:

  return v12;
}

- (unint64_t)hash
{
  id v3 = [(HFScheduleBuilder *)self rules];
  uint64_t v4 = [v3 hash];

  if ([(HFScheduleBuilder *)self supportsWeekDayRules]) {
    uint64_t v5 = 1231;
  }
  else {
    uint64_t v5 = 1237;
  }
  uint64_t v6 = v5 - v4 + 32 * v4;
  if ([(HFScheduleBuilder *)self supportsYearDayRules]) {
    uint64_t v7 = 1231;
  }
  else {
    uint64_t v7 = 1237;
  }
  unint64_t v8 = [(HFScheduleBuilder *)self minNumberOfRules] - (v7 - v6 + 32 * v6) + 32 * (v7 - v6 + 32 * v6);
  return [(HFScheduleBuilder *)self maxNumberOfRules] - v8 + 32 * v8 + 28629151;
}

- (id)description
{
  id v3 = [MEMORY[0x263F58188] builderWithObject:self];
  uint64_t v4 = [(HFScheduleBuilder *)self rules];
  id v5 = (id)[v3 appendObject:v4 withName:@"rules"];

  id v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[HFScheduleBuilder supportsWeekDayRules](self, "supportsWeekDayRules"), @"supportsWeekDayRules");
  id v7 = (id)objc_msgSend(v3, "appendBool:withName:", -[HFScheduleBuilder supportsYearDayRules](self, "supportsYearDayRules"), @"supportsYearDayRules");
  id v8 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[HFScheduleBuilder minNumberOfRules](self, "minNumberOfRules"), @"minNumberOfRules");
  id v9 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[HFScheduleBuilder maxNumberOfRules](self, "maxNumberOfRules"), @"maxNumberOfRules");
  uint64_t v10 = [v3 build];

  return v10;
}

- (BOOL)supportsWeekDayRules
{
  return self->_supportsWeekDayRules;
}

- (void)setSupportsWeekDayRules:(BOOL)a3
{
  self->_supportsWeekDayRules = a3;
}

- (BOOL)supportsYearDayRules
{
  return self->_supportsYearDayRules;
}

- (void)setSupportsYearDayRules:(BOOL)a3
{
  self->_supportsYearDayRules = a3;
}

- (unint64_t)minNumberOfRules
{
  return self->_minNumberOfRules;
}

- (unint64_t)maxNumberOfRules
{
  return self->_maxNumberOfRules;
}

@end