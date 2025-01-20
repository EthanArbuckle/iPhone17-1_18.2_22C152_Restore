@interface NSError(MPCDialogs)
- (id)mpc_remoteCommandStatus;
@end

@implementation NSError(MPCDialogs)

- (id)mpc_remoteCommandStatus
{
  v2 = objc_msgSend(a1, "msv_firstValueForUserInfoKey:", @"MPCErrorUserInfoKeyRemoteCommandStatusCode");
  v3 = v2;
  if (v2) {
    uint64_t v4 = [v2 integerValue];
  }
  else {
    uint64_t v4 = 200;
  }
  v5 = objc_msgSend(a1, "msv_firstValueForUserInfoKey:", @"MPCErrorUserInfoKeyRemoteDialog");
  if (v5) {
    goto LABEL_5;
  }
  if (a1 && (_os_feature_enabled_impl() & 1) == 0)
  {
    v9 = objc_msgSend(a1, "msv_errorByUnwrappingDomain:", *MEMORY[0x263F54EA0]);
    if (v9)
    {
      v10 = (void *)MEMORY[0x263F121C0];
      v11 = [MEMORY[0x263F086E0] mediaPlaybackCoreBundle];
      v12 = [v11 localizedStringForKey:@"LIVE_LINK_UNABLE_TO_SHAREPLAY_ALERT_TITLE" value:&stru_26CBCA930 table:@"MediaPlaybackCore"];
      v13 = [v9 localizedDescription];
      v5 = [v10 dialogWithTitle:v12 message:v13];

      v14 = (void *)MEMORY[0x263F121C8];
      v15 = [MEMORY[0x263F086E0] mediaPlaybackCoreBundle];
      v16 = [v15 localizedStringForKey:@"LIVE_LINK_UNABLE_TO_SHAREPLAY_ALERT_ACTION" value:&stru_26CBCA930 table:@"MediaPlaybackCore"];
      v17 = [v14 actionWithTitle:v16 type:0 commandEvent:0];
      [v5 addAction:v17];
    }
    else
    {
      v15 = objc_msgSend(a1, "msv_errorByUnwrappingDomain:", *MEMORY[0x263F88F48]);
      if (!v15)
      {
        v5 = 0;
LABEL_17:

        if (v5)
        {
LABEL_5:
          uint64_t v6 = [MEMORY[0x263F121D0] statusWithCode:v4 dialog:v5];
          goto LABEL_6;
        }
        goto LABEL_18;
      }
      v18 = (void *)MEMORY[0x263F121C0];
      v19 = [MEMORY[0x263F086E0] mediaPlaybackCoreBundle];
      v20 = [v19 localizedStringForKey:@"LIVE_LINK_UNABLE_TO_SHAREPLAY_ALERT_TITLE" value:&stru_26CBCA930 table:@"MediaPlaybackCore"];
      v21 = [v15 localizedDescription];
      v5 = [v18 dialogWithTitle:v20 message:v21];

      v22 = [MEMORY[0x263F121C8] actionWithTitle:@"MPC_PLAY_ONLY_FOR_ME" type:0 commandEvent:0];
      [v5 addAction:v22];

      v23 = (void *)MEMORY[0x263F121C8];
      v16 = [MEMORY[0x263F086E0] mediaPlaybackCoreBundle];
      v17 = [v16 localizedStringForKey:@"LIVE_LINK_UNABLE_TO_SHAREPLAY_ALERT_ACTION" value:&stru_26CBCA930 table:@"MediaPlaybackCore"];
      v24 = [v23 actionWithTitle:v17 type:0 commandEvent:0];
      [v5 addAction:v24];
    }
    goto LABEL_17;
  }
LABEL_18:
  v5 = objc_msgSend(a1, "msv_firstValueForUserInfoKey:", @"MPCErrorUserInfoKeyCustomDataType");
  if (v5)
  {
    v25 = objc_msgSend(a1, "msv_firstValueForUserInfoKey:", @"MPCErrorUserInfoKeyCustomData");
    v26 = v25;
    if (v25)
    {
      id v27 = v25;
    }
    else
    {
      id v27 = [MEMORY[0x263EFF8F8] data];
    }
    v28 = v27;

    v7 = [MEMORY[0x263F121D0] statusWithCode:v4 customData:v28 type:v5];

    goto LABEL_7;
  }
  uint64_t v6 = [MEMORY[0x263F121D0] statusWithCode:v4 error:a1];
LABEL_6:
  v7 = (void *)v6;
LABEL_7:

  return v7;
}

@end