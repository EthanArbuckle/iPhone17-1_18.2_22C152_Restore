@interface _GCControllerManager(Legacy)
@end

@implementation _GCControllerManager(Legacy)

- (void)setCurrentController:()Legacy .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_220998000, a2, OS_LOG_TYPE_DEBUG, "GCControllerDidBecomeCurrent - %@", (uint8_t *)&v3, 0xCu);
}

- (void)setCurrentController:()Legacy .cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_220998000, a2, OS_LOG_TYPE_DEBUG, "GCControllerDidStopBeingCurrent - %@", (uint8_t *)&v3, 0xCu);
}

@end