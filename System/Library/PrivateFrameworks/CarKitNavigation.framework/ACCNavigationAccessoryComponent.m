@interface ACCNavigationAccessoryComponent
@end

@implementation ACCNavigationAccessoryComponent

void __62__ACCNavigationAccessoryComponent_CarPlay__CP_ignoreMaxLength__block_invoke()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v1 = [v0 valueForKey:@"CPACCNavIgnoreMaxLengths"];

  if (v1)
  {
    CP_ignoreMaxLength_ignoreMaxLength = [v1 BOOLValue];
    v2 = CarNavLogging();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      if (CP_ignoreMaxLength_ignoreMaxLength) {
        v3 = @"YES";
      }
      else {
        v3 = @"NO";
      }
      int v4 = 138543362;
      v5 = v3;
      _os_log_impl(&dword_24986C000, v2, OS_LOG_TYPE_DEFAULT, "ignoreMaxLength set to %{public}@", (uint8_t *)&v4, 0xCu);
    }
  }
}

@end