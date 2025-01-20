@interface ATXNotificationGroupBaseRanker
@end

@implementation ATXNotificationGroupBaseRanker

uint64_t __65___ATXNotificationGroupBaseRanker_rankNotificationGroups_modeId___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) compareGroups:a2 group2:a3];
}

@end