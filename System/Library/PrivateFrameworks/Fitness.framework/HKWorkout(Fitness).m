@interface HKWorkout(Fitness)
- (FIWorkoutActivityType)fi_activityType;
- (id)fi_elevationGain;
- (uint64_t)fi_hasNonZeroElevationGain;
- (uint64_t)fi_swimmingLocationType;
@end

@implementation HKWorkout(Fitness)

- (uint64_t)fi_hasNonZeroElevationGain
{
  v1 = objc_msgSend(a1, "fi_elevationGain");
  v2 = v1;
  if (v1) {
    uint64_t v3 = objc_msgSend(v1, "fi_isNonzero");
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)fi_elevationGain
{
  v2 = [a1 metadata];
  uint64_t v3 = [v2 objectForKey:*MEMORY[0x263F09A68]];

  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v4 = [a1 metadata];
    uint64_t v5 = [v4 objectForKey:*MEMORY[0x263F0ABF0]];

    uint64_t v3 = (void *)v5;
  }
  return v3;
}

- (uint64_t)fi_swimmingLocationType
{
  v1 = [a1 metadata];
  v2 = [v1 objectForKeyedSubscript:*MEMORY[0x263F09AE0]];

  if (v2) {
    uint64_t v3 = [v2 integerValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (FIWorkoutActivityType)fi_activityType
{
  return +[FIWorkoutActivityType activityTypeWithWorkout:a1];
}

@end