@interface HKFitnessFriendObjectComparisonFilter
@end

@implementation HKFitnessFriendObjectComparisonFilter

id __79___HKFitnessFriendObjectComparisonFilter_HealthDaemon___predicateForFriendUUID__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = objc_msgSend(MEMORY[0x1E4F29128], "hk_UUIDWithData:", a2);
  v3 = HDFitnessFriendWorkoutEntityEntityPredicateForFriendUUID();

  return v3;
}

@end