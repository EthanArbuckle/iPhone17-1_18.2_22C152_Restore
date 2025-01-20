@interface DEDDevice(UI)
@end

@implementation DEDDevice(UI)

- (void)imageURLForDeviceClass:()UI deviceModel:deviceColor:size:variant:scale:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21FE04000, a2, OS_LOG_TYPE_DEBUG, "icon url used %@", (uint8_t *)&v2, 0xCu);
}

@end