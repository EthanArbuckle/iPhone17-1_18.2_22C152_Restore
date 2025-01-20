@interface MPRemoteCommandEvent(MPCAdditions)
- (id)mpc_clientPreferredLanguages;
- (id)nowPlayingContentItemID;
- (id)userIdentity;
@end

@implementation MPRemoteCommandEvent(MPCAdditions)

- (id)mpc_clientPreferredLanguages
{
  v2 = [MEMORY[0x263F086E0] mediaPlaybackCoreBundle];
  v3 = [a1 mediaRemoteOptions];
  v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F54C80]];

  v5 = [v4 componentsSeparatedByString:@","];
  if (![v5 count])
  {
    uint64_t v6 = [MEMORY[0x263EFF960] preferredLanguages];

    v5 = (void *)v6;
  }
  v7 = (void *)MEMORY[0x263F086E0];
  v8 = [v2 localizations];
  v9 = [v7 preferredLocalizationsFromArray:v8 forPreferences:v5];

  return v9;
}

- (id)userIdentity
{
  v1 = [a1 mediaRemoteOptions];
  v2 = [v1 objectForKeyedSubscript:*MEMORY[0x263F54DB8]];

  if (v2)
  {
    uint64_t v10 = 0;
    v3 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:&v10];
    v4 = v3;
    if (v10)
    {
      v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_21BB87000, v5, OS_LOG_TYPE_ERROR, "❗️Cannot decode override user identity. Using active account.", v9, 2u);
      }

      id v6 = [MEMORY[0x263F893C0] activeAccount];
    }
    else
    {
      id v6 = v3;
    }
    v7 = v6;
  }
  else
  {
    v7 = [MEMORY[0x263F893C0] activeAccount];
  }

  return v7;
}

- (id)nowPlayingContentItemID
{
  v1 = [a1 mediaRemoteOptions];
  v2 = [v1 objectForKeyedSubscript:*MEMORY[0x263F54CF8]];

  return v2;
}

@end