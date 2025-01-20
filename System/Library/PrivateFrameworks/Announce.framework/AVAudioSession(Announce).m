@interface AVAudioSession(Announce)
+ (id)an_category;
+ (id)an_mode;
+ (uint64_t)an_categoryOptions;
- (uint64_t)an_configureForEndpointWithError:()Announce;
- (uint64_t)an_configureWithError:()Announce;
@end

@implementation AVAudioSession(Announce)

+ (id)an_category
{
  return (id)*MEMORY[0x263EF9050];
}

+ (id)an_mode
{
  return (id)*MEMORY[0x263EF9150];
}

+ (uint64_t)an_categoryOptions
{
  v0 = [MEMORY[0x263F544E0] sharedAVSystemController];
  int v1 = objc_msgSend(v0, "an_isCarPlayConnected");

  if (v1) {
    return 40;
  }
  else {
    return 59;
  }
}

- (uint64_t)an_configureWithError:()Announce
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v5 = objc_msgSend(MEMORY[0x263EF93E0], "an_category");
  v6 = objc_msgSend(MEMORY[0x263EF93E0], "an_mode");
  uint64_t v7 = objc_msgSend(MEMORY[0x263EF93E0], "an_categoryOptions");
  v8 = ANLogHandleAudioSession();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [NSNumber numberWithUnsignedInteger:v7];
    int v12 = 138413058;
    v13 = &stru_26D2D46B0;
    __int16 v14 = 2112;
    v15 = v5;
    __int16 v16 = 2112;
    v17 = v6;
    __int16 v18 = 2112;
    v19 = v9;
    _os_log_impl(&dword_220FAA000, v8, OS_LOG_TYPE_DEFAULT, "%@Category: %@, Mode: %@, Options: %@", (uint8_t *)&v12, 0x2Au);
  }
  uint64_t v10 = [a1 setCategory:v5 mode:v6 options:v7 error:a3];

  return v10;
}

- (uint64_t)an_configureForEndpointWithError:()Announce
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = (id)*MEMORY[0x263EF9060];
  v6 = objc_msgSend(MEMORY[0x263EF93E0], "an_mode");
  uint64_t v7 = ANLogHandleAudioSession();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [NSNumber numberWithUnsignedInteger:19];
    int v11 = 138413058;
    int v12 = &stru_26D2D46B0;
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2112;
    __int16 v16 = v6;
    __int16 v17 = 2112;
    __int16 v18 = v8;
    _os_log_impl(&dword_220FAA000, v7, OS_LOG_TYPE_DEFAULT, "%@Category: %@, Mode: %@, Options: %@", (uint8_t *)&v11, 0x2Au);
  }
  uint64_t v9 = [a1 setCategory:v5 mode:v6 options:19 error:a3];

  return v9;
}

@end