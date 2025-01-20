@interface MPCMediaExperienceUtilities
+ (BOOL)requestBackgroundPlaybackInitiation;
@end

@implementation MPCMediaExperienceUtilities

+ (BOOL)requestBackgroundPlaybackInitiation
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = MPUIApplication();
  uint64_t v3 = [v2 applicationState];

  if (v3 == 2)
  {
    v4 = [MEMORY[0x263F086E0] mainBundle];
    v5 = [v4 bundleIdentifier];

    v6 = [MEMORY[0x263F544E0] sharedAVSystemController];
    uint64_t v7 = *MEMORY[0x263F54328];
    id v13 = 0;
    int v8 = [v6 setAttribute:v5 forKey:v7 error:&v13];
    id v9 = v13;

    if (v8) {
      BOOL v10 = v9 == 0;
    }
    else {
      BOOL v10 = 0;
    }
    if (!v10)
    {
      v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v15 = v5;
        __int16 v16 = 2112;
        id v17 = v9;
        _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_ERROR, "Error temporarily blessing %@ for playback initialization. %@", buf, 0x16u);
      }
    }
  }
  else
  {
    LOBYTE(v8) = 1;
  }
  return v8;
}

@end