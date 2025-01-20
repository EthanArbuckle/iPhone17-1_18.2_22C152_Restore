@interface HKMCDayViewModel
+ (id)dayViewModelWithMenstruationLevel:(unint64_t)a3 fertileWindowLevel:(unint64_t)a4 pregnancyState:(unint64_t)a5 bleedingInPregnancyLevel:(unint64_t)a6 bleedingAfterPregnancyLevel:(unint64_t)a7 daySummary:(id)a8 cycleFactors:(id)a9 partiallyLoggedPeriod:(BOOL)a10 fetched:(BOOL)a11;
+ (id)emptyDayViewModel;
+ (id)unfetchedDayViewModel;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFetched;
- (BOOL)isPartiallyLoggedPeriod;
- (BOOL)isSupplementaryDataLogged;
- (HKMCDaySummary)daySummary;
- (NSArray)cycleFactors;
- (NSString)accessibilityIdentifier;
- (NSString)hk_redactedDescription;
- (id)_initWithMenstruationLevel:(unint64_t)a3 fertileWindowLevel:(unint64_t)a4 pregnancyState:(unint64_t)a5 bleedingInPregnancyLevel:(unint64_t)a6 bleedingAfterPregnancyLevel:(unint64_t)a7 daySummary:(id)a8 cycleFactors:(id)a9 partiallyLoggedPeriod:(BOOL)a10 fetched:(BOOL)a11;
- (id)description;
- (unint64_t)bleedingAfterPregnancyLevel;
- (unint64_t)bleedingInPregnancyLevel;
- (unint64_t)bleedingTypesWithFlowLogged;
- (unint64_t)defaultLoggingBleedingType;
- (unint64_t)fertileWindowLevel;
- (unint64_t)menstruationLevel;
- (unint64_t)pregnancyState;
@end

@implementation HKMCDayViewModel

+ (id)unfetchedDayViewModel
{
  if (unfetchedDayViewModel_onceToken != -1) {
    dispatch_once(&unfetchedDayViewModel_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)unfetchedDayViewModel_viewModel;
  return v2;
}

uint64_t __41__HKMCDayViewModel_unfetchedDayViewModel__block_invoke()
{
  LOWORD(v1) = 0;
  unfetchedDayViewModel_viewModel = -[HKMCDayViewModel _initWithMenstruationLevel:fertileWindowLevel:pregnancyState:bleedingInPregnancyLevel:bleedingAfterPregnancyLevel:daySummary:cycleFactors:partiallyLoggedPeriod:fetched:]([HKMCDayViewModel alloc], "_initWithMenstruationLevel:fertileWindowLevel:pregnancyState:bleedingInPregnancyLevel:bleedingAfterPregnancyLevel:daySummary:cycleFactors:partiallyLoggedPeriod:fetched:", 0, 0, 0, 0, 0, 0, 0, v1);
  return MEMORY[0x270F9A758]();
}

+ (id)emptyDayViewModel
{
  if (emptyDayViewModel_onceToken != -1) {
    dispatch_once(&emptyDayViewModel_onceToken, &__block_literal_global_279);
  }
  v2 = (void *)emptyDayViewModel_viewModel;
  return v2;
}

uint64_t __37__HKMCDayViewModel_emptyDayViewModel__block_invoke()
{
  v0 = [HKMCDayViewModel alloc];
  LOWORD(v2) = 256;
  emptyDayViewModel_viewModel = -[HKMCDayViewModel _initWithMenstruationLevel:fertileWindowLevel:pregnancyState:bleedingInPregnancyLevel:bleedingAfterPregnancyLevel:daySummary:cycleFactors:partiallyLoggedPeriod:fetched:](v0, "_initWithMenstruationLevel:fertileWindowLevel:pregnancyState:bleedingInPregnancyLevel:bleedingAfterPregnancyLevel:daySummary:cycleFactors:partiallyLoggedPeriod:fetched:", 0, 0, 0, 0, 0, 0, MEMORY[0x263EFFA68], v2);
  return MEMORY[0x270F9A758]();
}

+ (id)dayViewModelWithMenstruationLevel:(unint64_t)a3 fertileWindowLevel:(unint64_t)a4 pregnancyState:(unint64_t)a5 bleedingInPregnancyLevel:(unint64_t)a6 bleedingAfterPregnancyLevel:(unint64_t)a7 daySummary:(id)a8 cycleFactors:(id)a9 partiallyLoggedPeriod:(BOOL)a10 fetched:(BOOL)a11
{
  id v17 = a9;
  id v18 = a8;
  LOWORD(v21) = __PAIR16__(a11, a10);
  id v19 = -[HKMCDayViewModel _initWithMenstruationLevel:fertileWindowLevel:pregnancyState:bleedingInPregnancyLevel:bleedingAfterPregnancyLevel:daySummary:cycleFactors:partiallyLoggedPeriod:fetched:]([HKMCDayViewModel alloc], "_initWithMenstruationLevel:fertileWindowLevel:pregnancyState:bleedingInPregnancyLevel:bleedingAfterPregnancyLevel:daySummary:cycleFactors:partiallyLoggedPeriod:fetched:", a3, a4, a5, a6, a7, v18, v17, v21);

  return v19;
}

- (id)_initWithMenstruationLevel:(unint64_t)a3 fertileWindowLevel:(unint64_t)a4 pregnancyState:(unint64_t)a5 bleedingInPregnancyLevel:(unint64_t)a6 bleedingAfterPregnancyLevel:(unint64_t)a7 daySummary:(id)a8 cycleFactors:(id)a9 partiallyLoggedPeriod:(BOOL)a10 fetched:(BOOL)a11
{
  id v18 = a8;
  id v19 = a9;
  v25.receiver = self;
  v25.super_class = (Class)HKMCDayViewModel;
  v20 = [(HKMCDayViewModel *)&v25 init];
  uint64_t v21 = v20;
  if (v20)
  {
    v20->_menstruationLevel = a3;
    v20->_fertileWindowLevel = a4;
    v20->_pregnancyState = a5;
    v20->_bleedingInPregnancyLevel = a6;
    v20->_bleedingAfterPregnancyLevel = a7;
    objc_storeStrong((id *)&v20->_daySummary, a8);
    uint64_t v22 = [v19 copy];
    cycleFactors = v21->_cycleFactors;
    v21->_cycleFactors = (NSArray *)v22;

    v21->_partiallyLoggedPeriod = a10;
    v21->_fetched = a11;
  }

  return v21;
}

- (unint64_t)defaultLoggingBleedingType
{
  unint64_t v2 = self->_pregnancyState - 1;
  if (v2 > 5) {
    return 0;
  }
  else {
    return qword_224A17C48[v2];
  }
}

- (unint64_t)bleedingTypesWithFlowLogged
{
  unint64_t menstruationLevel = self->_menstruationLevel;
  unint64_t bleedingInPregnancyLevel = self->_bleedingInPregnancyLevel;
  unint64_t bleedingAfterPregnancyLevel = self->_bleedingAfterPregnancyLevel;
  v5 = [NSNumber numberWithBool:menstruationLevel == 4];
  uint64_t v6 = [v5 integerValue];
  v7 = [NSNumber numberWithBool:bleedingInPregnancyLevel == 1];
  uint64_t v8 = [v7 integerValue] + v6;
  v9 = [NSNumber numberWithBool:bleedingAfterPregnancyLevel == 1];
  uint64_t v10 = v8 + [v9 integerValue];

  if (!v10) {
    return 0;
  }
  if (v10 != 1) {
    return 4;
  }
  unint64_t v11 = 2;
  if (bleedingInPregnancyLevel != 1) {
    unint64_t v11 = 3;
  }
  if (menstruationLevel == 4) {
    unint64_t result = 1;
  }
  else {
    unint64_t result = v11;
  }
  if (menstruationLevel != 4 && bleedingInPregnancyLevel != 1 && bleedingAfterPregnancyLevel != 1) {
    return 0;
  }
  return result;
}

- (BOOL)isSupplementaryDataLogged
{
  return [(HKMCDaySummary *)self->_daySummary isSupplementaryDataLogged];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKMCDayViewModel *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = v5;
      BOOL v7 = self->_menstruationLevel == v5->_menstruationLevel
        && self->_fertileWindowLevel == v5->_fertileWindowLevel
        && self->_partiallyLoggedPeriod == v5->_partiallyLoggedPeriod
        && self->_fetched == v5->_fetched
        && [(HKMCDaySummary *)self->_daySummary isEqual:v5->_daySummary]
        && self->_pregnancyState == v6->_pregnancyState;
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = self->_menstruationLevel - 1;
  if (v5 > 4) {
    uint64_t v6 = @"None";
  }
  else {
    uint64_t v6 = off_2646E9CB0[v5];
  }
  unint64_t v7 = self->_fertileWindowLevel - 1;
  if (v7 > 2) {
    uint64_t v8 = @"None";
  }
  else {
    uint64_t v8 = off_2646E9CD8[v7];
  }
  unint64_t v9 = self->_pregnancyState - 1;
  if (v9 > 5) {
    uint64_t v10 = @"None -- No recently ended pregnancy";
  }
  else {
    uint64_t v10 = off_2646E9CF0[v9];
  }
  daySummary = self->_daySummary;
  NSUInteger v12 = [(NSArray *)self->_cycleFactors count];
  v13 = [NSNumber numberWithBool:self->_partiallyLoggedPeriod];
  v14 = [NSNumber numberWithBool:self->_fetched];
  v15 = [v3 stringWithFormat:@"<%@:%p menstruationLevel:%@ fertileWindowLevel:%@ pregnancyState:%@ supplementaryDataLogged summary:%@ cycleFactors:%lu partialPeriod:%@ fetched:%@>", v4, self, v6, v8, v10, daySummary, v12, v13, v14];

  return v15;
}

- (NSString)hk_redactedDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [NSNumber numberWithInt:self->_daySummary != 0];
  uint64_t v6 = [NSNumber numberWithBool:self->_fetched];
  unint64_t v7 = [v3 stringWithFormat:@"<%@:%p has summary:%@ fetched:%@>", v4, self, v5, v6];

  return (NSString *)v7;
}

- (NSString)accessibilityIdentifier
{
  unint64_t v3 = self->_menstruationLevel - 1;
  if (v3 > 4) {
    uint64_t v4 = @"None";
  }
  else {
    uint64_t v4 = off_2646E9CB0[v3];
  }
  unint64_t v5 = NSString;
  unint64_t v6 = self->_fertileWindowLevel - 1;
  if (v6 > 2) {
    unint64_t v7 = @"None";
  }
  else {
    unint64_t v7 = off_2646E9CD8[v6];
  }
  BOOL v8 = [(HKMCDayViewModel *)self isSupplementaryDataLogged];
  unint64_t v9 = @"NO";
  if (v8) {
    unint64_t v9 = @"YES";
  }
  unint64_t v10 = self->_pregnancyState - 1;
  if (v10 > 5) {
    unint64_t v11 = @"None -- No recently ended pregnancy";
  }
  else {
    unint64_t v11 = off_2646E9CF0[v10];
  }
  return (NSString *)[v5 stringWithFormat:@"menstruationLevel:%@|fertileWindowLevel:%@|supplementaryDataLogged:%@|pregnancyState:%@", v4, v7, v9, v11];
}

- (unint64_t)menstruationLevel
{
  return self->_menstruationLevel;
}

- (unint64_t)fertileWindowLevel
{
  return self->_fertileWindowLevel;
}

- (unint64_t)pregnancyState
{
  return self->_pregnancyState;
}

- (unint64_t)bleedingInPregnancyLevel
{
  return self->_bleedingInPregnancyLevel;
}

- (unint64_t)bleedingAfterPregnancyLevel
{
  return self->_bleedingAfterPregnancyLevel;
}

- (BOOL)isFetched
{
  return self->_fetched;
}

- (BOOL)isPartiallyLoggedPeriod
{
  return self->_partiallyLoggedPeriod;
}

- (HKMCDaySummary)daySummary
{
  return self->_daySummary;
}

- (NSArray)cycleFactors
{
  return self->_cycleFactors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cycleFactors, 0);
  objc_storeStrong((id *)&self->_daySummary, 0);
}

@end