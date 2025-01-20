@interface CUIKTravelAdvisoryDescriptionUtilities
+ (BOOL)shouldIncludeTravelAdvisoryDescription:(id)a3;
@end

@implementation CUIKTravelAdvisoryDescriptionUtilities

+ (BOOL)shouldIncludeTravelAdvisoryDescription:(id)a3
{
  id v3 = a3;
  v4 = +[CUIKLogSubsystem defaultCategory];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[CUIKTravelAdvisoryDescriptionUtilities shouldIncludeTravelAdvisoryDescription:].cold.5((uint64_t)v3, v4);
  }

  [MEMORY[0x1E4F25650] minimumAllowableTravelTime];
  double v6 = v5;
  if ([v3 travelState] == 5)
  {
    v7 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      +[CUIKTravelAdvisoryDescriptionUtilities shouldIncludeTravelAdvisoryDescription:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
LABEL_15:
    BOOL v29 = 0;
    goto LABEL_16;
  }
  if (objc_msgSend(MEMORY[0x1E4F25650], "travelStateIndicatesTravelingTowardDestination:", objc_msgSend(v3, "travelState")))
  {
    v7 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      +[CUIKTravelAdvisoryDescriptionUtilities shouldIncludeTravelAdvisoryDescription:](v7, v15, v16, v17, v18, v19, v20, v21);
    }
    goto LABEL_15;
  }
  if (!+[CUIKTravelAdvisoryUtilities doesHypothesisSatisfyMinimumAllowableTravelTime:v3 minimumAllowableTravelTime:v6])
  {
    [v3 estimatedTravelTime];
    double v31 = v30;
    v7 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      +[CUIKTravelAdvisoryDescriptionUtilities shouldIncludeTravelAdvisoryDescription:v6];
    }
    goto LABEL_15;
  }
  v7 = +[CUIKLogSubsystem defaultCategory];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    +[CUIKTravelAdvisoryDescriptionUtilities shouldIncludeTravelAdvisoryDescription:](v7, v22, v23, v24, v25, v26, v27, v28);
  }
  BOOL v29 = 1;
LABEL_16:

  return v29;
}

+ (void)shouldIncludeTravelAdvisoryDescription:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)shouldIncludeTravelAdvisoryDescription:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)shouldIncludeTravelAdvisoryDescription:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)shouldIncludeTravelAdvisoryDescription:(double)a3 .cold.4(NSObject *a1, double a2, double a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  double v5 = objc_msgSend(NSNumber, "numberWithDouble:");
  double v6 = [NSNumber numberWithDouble:a3];
  int v7 = 138412546;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_debug_impl(&dword_1BDF08000, a1, OS_LOG_TYPE_DEBUG, "Hypothesis travel time: [%@] does not satisfy minimum allowable travel time: [%@].", (uint8_t *)&v7, 0x16u);
}

+ (void)shouldIncludeTravelAdvisoryDescription:(uint64_t)a1 .cold.5(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1BDF08000, a2, OS_LOG_TYPE_DEBUG, "Determining whether or not travel advisory description should be included for hypothesis: [%@].", (uint8_t *)&v2, 0xCu);
}

@end