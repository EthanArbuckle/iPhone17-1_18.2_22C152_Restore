@interface CBPeripheral(_AX_HA_)
- (void)axTag:()_AX_HA_;
- (void)axUntag:()_AX_HA_;
@end

@implementation CBPeripheral(_AX_HA_)

- (void)axTag:()_AX_HA_
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([a1 hasTag:v4])
  {
    HAInitializeLogging();
    v5 = [NSString stringWithFormat:@"Skipping tag %@ - %@", v4, a1];
    v6 = [NSString stringWithFormat:@"%s:%d %@", "-[CBPeripheral(_AX_HA_) axTag:]", 750, v5];
    v7 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v6;
      v9 = v7;
      *(_DWORD *)buf = 136446210;
      uint64_t v11 = [v8 UTF8String];
      _os_log_impl(&dword_20CC86000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
  else
  {
    [a1 tag:v4];
  }
}

- (void)axUntag:()_AX_HA_
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([a1 hasTag:v4])
  {
    [a1 untag:v4];
  }
  else
  {
    HAInitializeLogging();
    v5 = [NSString stringWithFormat:@"Skipping untag %@ - %@", v4, a1];
    v6 = [NSString stringWithFormat:@"%s:%d %@", "-[CBPeripheral(_AX_HA_) axUntag:]", 762, v5];
    v7 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v6;
      v9 = v7;
      *(_DWORD *)buf = 136446210;
      uint64_t v11 = [v8 UTF8String];
      _os_log_impl(&dword_20CC86000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
}

@end