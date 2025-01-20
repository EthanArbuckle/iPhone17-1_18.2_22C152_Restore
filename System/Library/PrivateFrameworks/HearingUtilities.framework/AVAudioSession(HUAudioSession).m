@interface AVAudioSession(HUAudioSession)
- (uint64_t)currentFeature;
- (void)setActive:()HUAudioSession forFeature:error:;
- (void)setCurrentFeature:()HUAudioSession;
@end

@implementation AVAudioSession(HUAudioSession)

- (void)setActive:()HUAudioSession forFeature:error:
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if ((a3 & 1) != 0 || [a1 currentFeature] == a4)
  {
    HAInitializeLogging();
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"Setting session active %d for %lu", a3, a4);
    v10 = [NSString stringWithFormat:@"%s:%d %@", "-[AVAudioSession(HUAudioSession) setActive:forFeature:error:]", 779, v9];
    v11 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v10;
      v13 = v11;
      *(_DWORD *)buf = 136446210;
      uint64_t v32 = [v12 UTF8String];
      _os_log_impl(&dword_20CC86000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    CSInitializeLogging();
    v14 = objc_msgSend(NSString, "stringWithFormat:", @"Setting session active %d for %lu", a3, a4);
    v15 = [NSString stringWithFormat:@"%s:%d %@", "-[AVAudioSession(HUAudioSession) setActive:forFeature:error:]", 780, v14];
    v16 = (void *)*MEMORY[0x263F47288];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
    {
      id v17 = v15;
      v18 = v16;
      uint64_t v19 = [v17 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v32 = v19;
      _os_log_impl(&dword_20CC86000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    if (a3) {
      [a1 setCurrentFeature:a4];
    }
    [a1 setActive:a3 error:a5];
  }
  else
  {
    HAInitializeLogging();
    v20 = [NSString stringWithFormat:@"Skipping session change %d, %lu", 0, a4];
    v21 = [NSString stringWithFormat:@"%s:%d %@", "-[AVAudioSession(HUAudioSession) setActive:forFeature:error:]", 789, v20];
    v22 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v23 = v21;
      v24 = v22;
      *(_DWORD *)buf = 136446210;
      uint64_t v32 = [v23 UTF8String];
      _os_log_impl(&dword_20CC86000, v24, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    CSInitializeLogging();
    v25 = [NSString stringWithFormat:@"Skipping session change %d, %lu", 0, a4];
    v26 = [NSString stringWithFormat:@"%s:%d %@", "-[AVAudioSession(HUAudioSession) setActive:forFeature:error:]", 790, v25];
    v27 = (void *)*MEMORY[0x263F47288];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47288], OS_LOG_TYPE_DEFAULT))
    {
      id v28 = v26;
      v29 = v27;
      uint64_t v30 = [v28 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v32 = v30;
      _os_log_impl(&dword_20CC86000, v29, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
}

- (void)setCurrentFeature:()HUAudioSession
{
  objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &AVAS_PROPERTY_KEY, v2, (void *)1);
}

- (uint64_t)currentFeature
{
  v1 = objc_getAssociatedObject(a1, &AVAS_PROPERTY_KEY);
  uint64_t v2 = [v1 integerValue];

  return v2;
}

@end