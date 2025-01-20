@interface ADPersonalizedAdsStatusManager
+ (id)sharedInstance;
- (BOOL)sendingPersonalizedAdsToAdPlatforms;
- (NSNumber)pendingJingleRequestToken;
- (void)sendPersonalizedAdsStatusToAdPlatforms:(id)a3 completionHandler:(id)a4;
- (void)setPendingJingleRequestToken:(id)a3;
- (void)setSendingPersonalizedAdsToAdPlatforms:(BOOL)a3;
@end

@implementation ADPersonalizedAdsStatusManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__ADPersonalizedAdsStatusManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__onceToken_1 != -1) {
    dispatch_once(&sharedInstance__onceToken_1, block);
  }
  v2 = (void *)sharedInstance__instance_1;

  return v2;
}

uint64_t __48__ADPersonalizedAdsStatusManager_sharedInstance__block_invoke()
{
  sharedInstance__instance_1 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return MEMORY[0x270F9A758]();
}

- (void)sendPersonalizedAdsStatusToAdPlatforms:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x263F241D8] sharedInstance];
  v9 = [v8 activeDSIDRecord];

  v10 = [MEMORY[0x263F241C0] sharedInstance];
  uint64_t v11 = [v10 isPersonalizedAdsEnabled];

  v12 = [v9 DSID];
  char v13 = [v6 isEqualToString:v12];

  if (v13)
  {
    if (self->_sendingPersonalizedAdsToAdPlatforms)
    {
      v14 = NSString;
      uint64_t v36 = objc_opt_class();
      v15 = @"[%@]: Not sending Personalized Ads status to AdPlatforms - request already in-flight.";
LABEL_4:
      objc_msgSend(v14, "stringWithFormat:", v15, v36, v37);
      v16 = LABEL_5:;
      _ADLog();
      goto LABEL_8;
    }
    if ([v9 isPlaceholderAccount])
    {
      v16 = [v9 idForClientType:0];
      v20 = [v9 iAdIDBeforeReset];
      int v21 = [v20 isEqualToString:v16];

      v22 = NSString;
      uint64_t v23 = objc_opt_class();
      if (v21 && (v11 & 1) != 0)
      {
        [v22 stringWithFormat:@"[%@]: Not sending ADOptOutRequest to AdPlatforms for what is now the old iAdID: %@.", v23, v16, v38];
        goto LABEL_7;
      }
      v25 = @"Out";
      if (v11) {
        v25 = @"In";
      }
      v26 = [v22 stringWithFormat:@"[%@]: Sending Opted-%@ Personalized Ads status to AdPlatforms for logged out iTunes user (DSID 0) - Backend needs knowledge of iAdID's Personalized Ads status.", v23, v25];
      _ADLog();
    }
    else
    {
      if (v11)
      {
        v24 = [v9 idForClientType:5];

        if (!v24)
        {
          v14 = NSString;
          uint64_t v36 = objc_opt_class();
          v15 = @"[%@]: Not sending Personalized Ads status to AdPlatforms - Personalized Ads is on with no DPID. FILE A RADAR.";
          goto LABEL_4;
        }
      }
      if (llround((double)(int)[v9 lastSentPersonalizedAdsTimestamp]))
      {
        if (v11 == [v9 lastSentPersonalizedAdsStatus]
          && (int)[v9 lastSentPersonalizedAdsTimestamp] >= 1)
        {
          [NSString stringWithFormat:@"[%@]: Not sending Personalized Ads status to AdPlatforms - Personalized Ads status has not changed (%d).", objc_opt_class(), v11];
          goto LABEL_5;
        }
      }
      else
      {
        v27 = NSString;
        uint64_t v28 = objc_opt_class();
        v29 = [v9 idForClientType:0];
        v30 = [v27 stringWithFormat:@"[%@]: Personalized Ads status for %@ (%d) has never been sent to AdPlatforms. Sending now.", v28, v29, v11];
        _ADLog();
      }
    }
    v31 = NSString;
    uint64_t v32 = objc_opt_class();
    v33 = [v9 idForClientType:0];
    v34 = [v31 stringWithFormat:@"[%@]: Sending current Personalized Ads status (%d) for %@ to AdPlatforms.", v32, v11, v33];
    _ADLog();

    self->_sendingPersonalizedAdsToAdPlatforms = 1;
    v35 = [MEMORY[0x263F24230] workQueue];
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __91__ADPersonalizedAdsStatusManager_sendPersonalizedAdsStatusToAdPlatforms_completionHandler___block_invoke;
    v39[3] = &unk_264669F60;
    id v40 = v9;
    char v44 = v11;
    id v41 = v6;
    v42 = self;
    id v43 = v7;
    [v35 addOperationWithBlock:v39];

    goto LABEL_10;
  }
  v17 = NSString;
  uint64_t v18 = objc_opt_class();
  v16 = [v9 DSID];
  [v17 stringWithFormat:@"[%@]: Not sending Personalized Ads status to AdPlatforms - invalid argument. %@ is not the current DSID (%@).", v18, v6, v16];
  v19 = LABEL_7:;
  _ADLog();

LABEL_8:
  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
LABEL_10:
}

void __91__ADPersonalizedAdsStatusManager_sendPersonalizedAdsStatusToAdPlatforms_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F24200]);
  v3 = [MEMORY[0x263F24230] sharedInstance];
  objc_msgSend(v2, "setStatusChangeTimestamp:", (double)(int)objc_msgSend(*(id *)(a1 + 32), "personalizedAdsTimestamp"));
  v4 = [MEMORY[0x263EFF910] date];
  objc_msgSend(v2, "setTransmitTimestamp:", (double)(int)objc_msgSend(v4, "AD_toServerTime"));

  v5 = [*(id *)(a1 + 32) encryptedIDForClientType:5];
  [v2 setDPID:v5];

  id v6 = [*(id *)(a1 + 32) encryptedIDForClientType:0];
  [v2 setIAdID:v6];

  id v7 = [MEMORY[0x263F241C0] sharedInstance];
  [v7 timezone];
  objc_msgSend(v2, "setTimezone:");

  [v2 setOptedOutStatus:*(unsigned char *)(a1 + 64) == 0];
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__2;
  v16[4] = __Block_byref_object_dispose__2;
  id v17 = *(id *)(a1 + 40);
  v8 = [MEMORY[0x263F241C0] sharedInstance];
  v9 = [v8 defaultServerURL];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __91__ADPersonalizedAdsStatusManager_sendPersonalizedAdsStatusToAdPlatforms_completionHandler___block_invoke_37;
  v11[3] = &unk_264669F38;
  v11[4] = *(void *)(a1 + 48);
  id v10 = *(id *)(a1 + 32);
  char v15 = *(unsigned char *)(a1 + 64);
  id v12 = v10;
  v14 = v16;
  id v13 = *(id *)(a1 + 56);
  [v3 handleRequest:v2 serverURL:v9 responseHandler:v11];

  _Block_object_dispose(v16, 8);
}

void __91__ADPersonalizedAdsStatusManager_sendPersonalizedAdsStatusToAdPlatforms_completionHandler___block_invoke_37(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v19 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    v9 = NSString;
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    id v12 = ClientTypeToString();
    uint64_t v13 = [v8 code];
    v14 = [v8 localizedDescription];
    char v15 = [v9 stringWithFormat:@"[%@] Error sending segments to AdPlatforms for %@ %@. Error %ld - %@", v10, v11, v12, v13, v14];
    _ADLog();
  }
  else
  {
    id v12 = (void *)[objc_alloc(MEMORY[0x263F24208]) initWithData:v19];
    v16 = [NSString stringWithFormat:@"[%@] Received opt-out response: %@", objc_opt_class(), v12];
    _ADLog();

    id v17 = [MEMORY[0x263EFF910] date];
    objc_msgSend(*(id *)(a1 + 40), "setLastSentPersonalizedAdsTimestamp:", objc_msgSend(v17, "AD_toServerTime"));

    [*(id *)(a1 + 40) setLastSentPersonalizedAdsStatus:*(unsigned __int8 *)(a1 + 64)];
  }

  [*(id *)(a1 + 32) setSendingPersonalizedAdsToAdPlatforms:0];
  uint64_t v18 = *(void *)(a1 + 48);
  if (v18) {
    (*(void (**)(uint64_t, id, uint64_t))(v18 + 16))(v18, v8, 1);
  }
}

- (BOOL)sendingPersonalizedAdsToAdPlatforms
{
  return self->_sendingPersonalizedAdsToAdPlatforms;
}

- (void)setSendingPersonalizedAdsToAdPlatforms:(BOOL)a3
{
  self->_sendingPersonalizedAdsToAdPlatforms = a3;
}

- (NSNumber)pendingJingleRequestToken
{
  return self->_pendingJingleRequestToken;
}

- (void)setPendingJingleRequestToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end