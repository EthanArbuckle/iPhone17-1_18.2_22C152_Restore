@interface BMStreamBase(PeriodicMaintenance)
- (void)_pruneDisabledSubstreams;
- (void)_pruneEmptyRemotesNotRecentlyModified;
@end

@implementation BMStreamBase(PeriodicMaintenance)

- (void)_pruneEmptyRemotesNotRecentlyModified
{
  v5 = [MEMORY[0x1E4F4FB78] privacyPathname:a2];
  *a1 = 138412290;
  *a3 = v5;
  OUTLINED_FUNCTION_0_9(&dword_18E67D000, v6, v7, "Unable to find or remove empty remote stream: %@");
}

- (void)_pruneDisabledSubstreams
{
  v5 = [MEMORY[0x1E4F4FB78] privacyPathname:a2];
  *a1 = 138543362;
  *a3 = v5;
  OUTLINED_FUNCTION_0_9(&dword_18E67D000, v6, v7, "Failed to remove substream: %{public}@");
}

@end