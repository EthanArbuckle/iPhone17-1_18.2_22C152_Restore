@interface CUIKTTLDescriptionGeneratorUtilities
+ (BOOL)ttlDescriptionShouldIncludeTrafficForHypothesis:(id)a3;
+ (BOOL)ttlDescriptionShouldIncludeTrafficForHypothesisThatSupportsLiveTraffic:(BOOL)a3 transportType:(int)a4 eta:(double)a5;
+ (id)descriptionForType:(unint64_t)a3;
+ (unint64_t)ttlDescriptionTypeForDate:(id)a3 hypothesis:(id)a4;
@end

@implementation CUIKTTLDescriptionGeneratorUtilities

+ (BOOL)ttlDescriptionShouldIncludeTrafficForHypothesis:(id)a3
{
  id v4 = a3;
  [v4 estimatedTravelTime];
  double v6 = v5;
  uint64_t v7 = [v4 supportsLiveTraffic];
  uint64_t v8 = [v4 transportType];

  return [a1 ttlDescriptionShouldIncludeTrafficForHypothesisThatSupportsLiveTraffic:v7 transportType:v8 eta:v6];
}

+ (BOOL)ttlDescriptionShouldIncludeTrafficForHypothesisThatSupportsLiveTraffic:(BOOL)a3 transportType:(int)a4 eta:(double)a5
{
  if (a4) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = a3;
  }
  return a5 > 300.0 && v5;
}

+ (unint64_t)ttlDescriptionTypeForDate:(id)a3 hypothesis:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([MEMORY[0x1E4F25650] date:v5 representsLatenessForHypothesis:v6]) {
    unint64_t v7 = 2;
  }
  else {
    unint64_t v7 = [MEMORY[0x1E4F25650] date:v5 representsApproachingDepartureDateForHypothesis:v6] ^ 1;
  }

  return v7;
}

+ (id)descriptionForType:(unint64_t)a3
{
  if (a3 < 3) {
    return off_1E636A7E0[a3];
  }
  id v5 = +[CUIKLogSubsystem defaultCategory];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    +[CUIKTTLDescriptionGeneratorUtilities descriptionForType:](a3, v5);
  }

  return &stru_1F187C430;
}

+ (void)descriptionForType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [NSNumber numberWithUnsignedInteger:a1];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1BDF08000, a2, OS_LOG_TYPE_ERROR, "Could not get description for type - error: Unexpected TTL description type: [%@]", (uint8_t *)&v4, 0xCu);
}

@end