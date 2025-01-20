@interface CHRecentCall(Intents)
- (void)interaction;
@end

@implementation CHRecentCall(Intents)

- (void)interaction
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1B8E4A000, log, OS_LOG_TYPE_ERROR, "Retrieving interaction for call with identifier %{public}@ failed with error %{public}@", (uint8_t *)&v3, 0x16u);
}

@end