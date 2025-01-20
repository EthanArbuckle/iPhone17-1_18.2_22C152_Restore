@interface GKMatchmaker(Nearby)
@end

@implementation GKMatchmaker(Nearby)

- (void)setNearbyDevice:()Nearby reachable:.cold.1(void *a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v5 = NSNumber;
  v6 = a1;
  v7 = [v5 numberWithInt:a2];
  v8 = [a3 player];
  int v9 = 138412546;
  v10 = v7;
  __int16 v11 = 2112;
  v12 = v8;
  _os_log_debug_impl(&dword_1C2D22000, v6, OS_LOG_TYPE_DEBUG, "Number of nearby devices: %@, for player: %@.", (uint8_t *)&v9, 0x16u);
}

@end