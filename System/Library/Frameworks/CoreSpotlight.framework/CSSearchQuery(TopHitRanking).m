@interface CSSearchQuery(TopHitRanking)
@end

@implementation CSSearchQuery(TopHitRanking)

- (void)setupTopHitQueryContextForClientBundleId:()TopHitRanking .cold.6(NSObject *a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = qos_class_self();
  _os_log_debug_impl(&dword_18D0E3000, a1, OS_LOG_TYPE_DEBUG, "[CSSearchQuery]QOS _topHitQueryParameters: %d", (uint8_t *)v2, 8u);
}

@end