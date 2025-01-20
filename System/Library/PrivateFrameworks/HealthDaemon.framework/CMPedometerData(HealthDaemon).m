@interface CMPedometerData(HealthDaemon)
- (BOOL)hd_hasWorkout;
- (id)hd_unitForType:()HealthDaemon;
- (uint64_t)hd_compare:()HealthDaemon;
@end

@implementation CMPedometerData(HealthDaemon)

- (BOOL)hd_hasWorkout
{
  v1 = [a1 workoutType];
  BOOL v2 = [v1 integerValue] != 0;

  return v2;
}

- (uint64_t)hd_compare:()HealthDaemon
{
  id v4 = a3;
  uint64_t v5 = [a1 recordId];
  uint64_t v6 = [v4 recordId];

  if (v5 < v6) {
    return -1;
  }
  else {
    return v5 > v6;
  }
}

- (id)hd_unitForType:()HealthDaemon
{
  v3 = [a3 identifier];
  int v4 = [v3 isEqualToString:*MEMORY[0x1E4F2A7E0]];

  if (v4) {
    [MEMORY[0x1E4F2B618] meterUnit];
  }
  else {
  uint64_t v5 = [MEMORY[0x1E4F2B618] countUnit];
  }

  return v5;
}

@end