@interface ATXLockscreenBlacklistData
@end

@implementation ATXLockscreenBlacklistData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->cachedPredictionsDisabled, 0);
  objc_storeStrong((id *)&self->cachedBlacklist, 0);
}

@end