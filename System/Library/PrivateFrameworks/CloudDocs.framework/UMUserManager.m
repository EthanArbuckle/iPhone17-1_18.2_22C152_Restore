@interface UMUserManager
@end

@implementation UMUserManager

void __47__UMUserManager_BRAdditions__br_isInSyncBubble__block_invoke()
{
  id v2 = [MEMORY[0x1E4FB36F8] sharedManager];
  if ([v2 isSharedIPad])
  {
    v0 = [v2 currentUser];
    int v1 = [v0 uid];
    br_isInSyncBubble_res = v1 != geteuid();
  }
  else
  {
    br_isInSyncBubble_res = 0;
  }
}

@end