@interface ISIcon(CALayerDelegate)
@end

@implementation ISIcon(CALayerDelegate)

- (void)displayLayer:()CALayerDelegate .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1AE771000, a2, OS_LOG_TYPE_DEBUG, "Updateing layer for icon: %@", (uint8_t *)&v2, 0xCu);
}

@end