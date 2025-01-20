@interface _GCDefaultPhysicalDevice(Battery)
- (void)createPowerSource;
@end

@implementation _GCDefaultPhysicalDevice(Battery)

- (void)createPowerSource
{
  OUTLINED_FUNCTION_1_13();
  OUTLINED_FUNCTION_0_16(&dword_220998000, v0, v1, "Failed to set game controller power source details: %{mach.errno}d", v2, v3, v4, v5, v6);
}

@end