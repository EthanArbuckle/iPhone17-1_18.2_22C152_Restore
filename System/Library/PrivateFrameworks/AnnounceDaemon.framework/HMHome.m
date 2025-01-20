@interface HMHome
@end

@implementation HMHome

uint64_t __66__HMHome_Announce___usersWithAnnounceEnabledIncludingCurrentUser___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) announceAccessAllowedForUser:a2];
}

@end