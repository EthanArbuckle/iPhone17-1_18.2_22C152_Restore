@interface ADSegmentDataManager
+ (id)sharedInstance;
- (BOOL)isEligibleForSensitiveContent:(int64_t)a3;
- (BOOL)isSegmentReductionEnabled;
- (BOOL)segmentRetrievalInProgress;
- (BOOL)segmentUpdateInProgress;
- (BOOL)shouldSendSegmentDataToAdPlatforms:(id)a3;
- (BOOL)shouldSendSegmentRequest:(id)a3 ignoreTimestamps:(BOOL)a4;
- (BOOL)verifyGenderInSegmentData:(id)a3;
- (NSNumber)pendingJingleRequestToken;
- (id)_ageDistributionOverrides;
- (id)checkTokenAndDSID:(id)a3;
- (id)noiseAppliedBirthYearFromActual:(id)a3;
- (id)parseBirthYearFromSegmentData:(id)a3;
- (void)handleJingleSegmentResponse:(id)a3 activeRecord:(id)a4 completionHandler:(id)a5;
- (void)handleSegmentUpdateResponse:(id)a3 error:(id)a4 completionHandler:(id)a5;
- (void)handleSuccessfulJingleSegmentResponse:(id)a3 dsidRecord:(id)a4 completionHandler:(id)a5;
- (void)populateAccountTypeFields:(id)a3;
- (void)retrieveSegmentData:(id)a3 forceSegments:(BOOL)a4 completionHandler:(id)a5;
- (void)retrieveSegmentData:(id)a3 forceSegments:(BOOL)a4 ignoreTimestamps:(BOOL)a5 completionHandler:(id)a6;
- (void)retrieveSegmentDataIgnoringTimestamps:(id)a3 forceSegments:(BOOL)a4 completionHandler:(id)a5;
- (void)sendSegmentDataToAdPlatforms:(id)a3 completionHandler:(id)a4;
- (void)setPendingJingleRequestToken:(id)a3;
- (void)setSegmentUpdateInProgress:(BOOL)a3;
@end

@implementation ADSegmentDataManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__ADSegmentDataManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__onceToken_3 != -1) {
    dispatch_once(&sharedInstance__onceToken_3, block);
  }
  v2 = (void *)sharedInstance__instance_3;

  return v2;
}

uint64_t __38__ADSegmentDataManager_sharedInstance__block_invoke()
{
  sharedInstance__instance_3 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return MEMORY[0x270F9A758]();
}

- (BOOL)segmentRetrievalInProgress
{
  return self->_pendingJingleRequestToken != 0;
}

- (BOOL)shouldSendSegmentRequest:(id)a3 ignoreTimestamps:(BOOL)a4
{
  id v6 = a3;
  v7 = [MEMORY[0x263F241D8] sharedInstance];
  v8 = [v7 activeDSIDRecord];

  if (![(ADSegmentDataManager *)self segmentRetrievalInProgress])
  {
    if ([v8 isPlaceholderAccount])
    {
      [NSString stringWithFormat:@"[%@]: Skipping segment retrieval request. DSID %@ is not logged into iTunes.", objc_opt_class(), v6];
      goto LABEL_5;
    }
    v12 = [v8 DSID];
    char v13 = [v12 isEqualToString:v6];

    if ((v13 & 1) == 0)
    {
      v17 = NSString;
      uint64_t v18 = objc_opt_class();
      v9 = [v8 DSID];
      v19 = [v17 stringWithFormat:@"[%@]: Skipping segment retrieval request. Current active record DSID %@ does not match request DSID %@.", v18, v9, v6];
      _ADLog();

      goto LABEL_6;
    }
    v14 = [MEMORY[0x263F241D8] sharedInstance];
    v15 = [v14 reconcileOperations];
    int v16 = [v15 isSet:1];

    if (v16)
    {
      [NSString stringWithFormat:@"[%@]: Forcing segment retrieval request for DSID %@ because ADReconcileOp_RetrieveSegments flag is set", objc_opt_class(), v6];
    }
    else if (a4)
    {
      [NSString stringWithFormat:@"[%@]: Forcing segment retrieval request for DSID %@ because 'ignoreTimestamps' was specified.", objc_opt_class(), v6];
    }
    else
    {
      int v20 = [v8 segmentDataTimestamp];
      v21 = [MEMORY[0x263F241C0] sharedInstance];
      int v22 = [v21 segmentRetrievalInterval] + v20;
      v23 = [MEMORY[0x263EFF910] date];
      uint64_t v24 = v22 - objc_msgSend(v23, "AD_toServerTime");

      if ((int)v24 >= 1)
      {
        [NSString stringWithFormat:@"[%@]: Skipping segment retrieval request. Segment data for DSID %@ has not expired.", objc_opt_class(), v6];
        goto LABEL_5;
      }
      if ([v8 segmentDataTimestamp]
        || ([v8 segmentData], v25 = objc_claimAutoreleasedReturnValue(), v25, v25))
      {
        v26 = NSString;
        uint64_t v27 = objc_opt_class();
        v9 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:(double)(int)v24];
        v28 = objc_msgSend(v9, "AD_doubleDateTimeAsString");
        v29 = [v26 stringWithFormat:@"[%@]: Segments for DSID %@ expired %d seconds ago (%@). Asking Jingle for new segments.", v27, v6, v24, v28];
        _ADLog();

        goto LABEL_15;
      }
      [NSString stringWithFormat:@"[%@]: Retrieving segment data for DSID %@ because we don't have any.", objc_opt_class(), v6];
    v9 = };
    _ADLog();
LABEL_15:
    BOOL v10 = 1;
    goto LABEL_7;
  }
  [NSString stringWithFormat:@"[%@]: Skipping segment retrieval request. Request for %@ already in-flight.", objc_opt_class(), v6];
  v9 = LABEL_5:;
  _ADLog();
LABEL_6:
  BOOL v10 = 0;
LABEL_7:

  return v10;
}

- (id)checkTokenAndDSID:(id)a3
{
  id v4 = a3;
  v5 = [v4 token];
  char v6 = [v5 isEqual:self->_pendingJingleRequestToken];

  if (v6)
  {
    v7 = [v4 DSID];
    v8 = [MEMORY[0x263F241D8] sharedInstance];
    v9 = [v8 activeDSIDRecord];
    BOOL v10 = [v9 DSID];
    char v11 = [v7 isEqualToString:v10];

    if (v11)
    {
      v12 = 0;
      goto LABEL_7;
    }
    id v18 = objc_alloc(MEMORY[0x263F087E8]);
    v19 = NSString;
    uint64_t v20 = objc_opt_class();
    int v16 = [v4 DSID];
    v17 = [MEMORY[0x263F241D8] sharedInstance];
    v21 = [v17 activeDSIDRecord];
    int v22 = [v21 DSID];
    v23 = [v19 stringWithFormat:@"[%@]: Segment update response has DSID %@, but current DSID is %@. Ignoring.", v20, v16, v22];
    v12 = (void *)[v18 initWithAdCode:5 andDescription:v23];
  }
  else
  {
    id v13 = objc_alloc(MEMORY[0x263F087E8]);
    v14 = NSString;
    uint64_t v15 = objc_opt_class();
    int v16 = [v4 token];
    v17 = [v14 stringWithFormat:@"[%@]: Segment update response has token %@, but was expecting token %@.", v15, v16, self->_pendingJingleRequestToken];
    v12 = (void *)[v13 initWithAdCode:4 andDescription:v17];
  }

  objc_msgSend(v12, "AD_Log:", @"iAdIDLogging");
LABEL_7:

  return v12;
}

- (void)retrieveSegmentDataIgnoringTimestamps:(id)a3 forceSegments:(BOOL)a4 completionHandler:(id)a5
{
}

- (void)retrieveSegmentData:(id)a3 forceSegments:(BOOL)a4 completionHandler:(id)a5
{
}

- (void)retrieveSegmentData:(id)a3 forceSegments:(BOOL)a4 ignoreTimestamps:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a6;
  char v11 = [MEMORY[0x263F241D8] sharedInstance];
  v12 = [v11 activeDSIDRecord];

  id v13 = [MEMORY[0x263F241B8] sharedInstance];
  if ([v13 BOOLForKey:@"ForceSegmentDataRetrieval"])
  {
    char v14 = [v9 isEqualToString:@"0"];

    if ((v14 & 1) == 0)
    {
      uint64_t v15 = [NSString stringWithFormat:@"[%@]: The Force Segment Data Retrieval switch is enabled - overriding forceSegments parameter.", objc_opt_class()];
LABEL_7:
      _ADLog();

      int v16 = +[ADJingleRequestManager sharedInstance];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __93__ADSegmentDataManager_retrieveSegmentData_forceSegments_ignoreTimestamps_completionHandler___block_invoke;
      v23[3] = &unk_264669FB0;
      v23[4] = self;
      id v24 = v12;
      id v25 = v10;
      v17 = [v16 makeSegmentRequest:v9 forceSegments:1 withCompletion:v23];
      pendingJingleRequestToken = self->_pendingJingleRequestToken;
      self->_pendingJingleRequestToken = v17;

      goto LABEL_11;
    }
  }
  else
  {
  }
  if ([(ADSegmentDataManager *)self shouldSendSegmentRequest:v9 ignoreTimestamps:v7])
  {
    uint64_t v15 = [NSString stringWithFormat:@"[%@ retrieveSegmentData]: Forcing 'ioflag = 1'.", objc_opt_class()];
    goto LABEL_7;
  }
  v19 = [MEMORY[0x263F241C0] sharedInstance];
  int v22 = [v12 isRestrictedByApple];
  unsigned int v20 = [v12 accountAgeUnknown];
  v21 = [NSString stringWithFormat:@"[%@]: The current account is: EDU: %d. Managed: %d. U13: %d. T13: %d. U18: %d. Unknown Age: %d.", objc_opt_class(), objc_msgSend(v19, "educationModeEnabled"), objc_msgSend(v19, "isManagedAppleID"), objc_msgSend(v12, "accountIsU13"), objc_msgSend(v12, "accountIsT13"), objc_msgSend(v12, "accountIsU18"), v20];
  _ADLog();

  [v19 setIdentifierForAdvertisingAllowed:(v22 | v20) ^ 1];
  if (v10) {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }

LABEL_11:
}

uint64_t __93__ADSegmentDataManager_retrieveSegmentData_forceSegments_ignoreTimestamps_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleJingleSegmentResponse:a2 activeRecord:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)handleJingleSegmentResponse:(id)a3 activeRecord:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, uint64_t))a5;
  char v11 = (void *)MEMORY[0x223CA6640]();
  if (v8)
  {
    v12 = [v8 error];

    if (v12)
    {
      if (v10)
      {
        id v13 = [v8 error];
        v10[2](v10, v13, 1);
      }
      [(ADSegmentDataManager *)self setPendingJingleRequestToken:0];
      id v14 = 0;
      goto LABEL_11;
    }
    v17 = NSString;
    uint64_t v18 = objc_opt_class();
    v19 = [v8 DSID];
    unsigned int v20 = [v17 stringWithFormat:@"[%@ retrieveSegmentData]: Received segment update response for DSID %@", v18, v19];
    _ADLog();

    id v14 = [(ADSegmentDataManager *)self checkTokenAndDSID:v8];
    [(ADSegmentDataManager *)self setPendingJingleRequestToken:0];
    if (v14)
    {
      v21 = [NSString stringWithFormat:@"[%@ retrieveSegmentData] Error making segment request: %@", objc_opt_class(), v14];
      _ADLog();

      if (!v10) {
        goto LABEL_11;
      }
LABEL_10:
      v10[2](v10, v14, 1);
      goto LABEL_11;
    }
    int v22 = [v8 responseBody];

    if (!v22)
    {
      id v31 = objc_alloc(MEMORY[0x263F087E8]);
      v32 = [NSString stringWithFormat:@"[%@ retrieveSegmentData]: Segment update returned empty response body. Segments not updated.", objc_opt_class()];
      id v14 = (id)[v31 initWithAdCode:3 andDescription:v32];

      objc_msgSend(v14, "AD_Log:", @"iAdIDLogging");
      if (!v10) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    v23 = (void *)MEMORY[0x263F08900];
    id v24 = [v8 responseBody];
    id v48 = 0;
    id v25 = [v23 JSONObjectWithData:v24 options:0 error:&v48];
    id v14 = v48;

    v26 = NSString;
    uint64_t v27 = objc_opt_class();
    if (v14)
    {
      uint64_t v28 = [v14 code];
      v29 = [v14 localizedDescription];
      v30 = [v26 stringWithFormat:@"[%@ retrieveSegmentData]: Error %ld decoding segment update response: %@", v27, v28, v29];
      _ADLog();

      if (!v10)
      {
LABEL_31:

        goto LABEL_11;
      }
LABEL_15:
      v10[2](v10, v14, 1);
      goto LABEL_31;
    }
    v33 = [v8 DSID];
    v34 = objc_msgSend(v25, "AD_jsonString");
    v35 = [v26 stringWithFormat:@"[%@ retrieveSegmentData]: Successfully decoded segment update response for DSID %@:\n%@", v27, v33, v34];
    _ADLog();

    if (!v9)
    {
      id v38 = objc_alloc(MEMORY[0x263F087E8]);
      v39 = [NSString stringWithFormat:@"activeRecord == nil. Please file a Radar!"];
      id v14 = (id)[v38 initWithAdCode:13 andDescription:v39];

      v40 = NSString;
      uint64_t v41 = objc_opt_class();
      v42 = [v14 localizedDescription];
      v43 = [v40 stringWithFormat:@"[%@ retrieveSegmentData]: %@", v41, v42];
      _ADLog();

      if (!v10) {
        goto LABEL_31;
      }
      goto LABEL_15;
    }
    v36 = [v25 objectForKeyedSubscript:@"status"];
    uint64_t v37 = [v36 intValue];

    if (v37 != 1602)
    {
      if (v37 == 1601)
      {
        if ([v9 lastJingleAccountStatus] == 1 && objc_msgSend(v9, "accountAgeUnknown")) {
          [v9 setAccountAgeUnknown:0];
        }
        [v9 setLastJingleAccountStatus:1];
        v44 = [MEMORY[0x263EFF910] date];
        objc_msgSend(v9, "setSegmentDataTimestamp:", objc_msgSend(v44, "AD_toServerTime"));

        v45 = [NSString stringWithFormat:@"[%@ retrieveSegmentData]: The Jingle Weak Token for this user has expired. No action is possible by iAd, the user must log into the account.", objc_opt_class()];
        _ADLog();

        if (v10) {
          v10[2](v10, 0, 1);
        }
        goto LABEL_30;
      }
      if (v37)
      {
        if ((v37 & 0x80000000) != 0)
        {
          id v46 = objc_alloc(MEMORY[0x263F087E8]);
          [NSString stringWithFormat:@"[%@ retrieveSegmentData]: Jingle response code %d indicates a malformed request. Please file a Radar!", objc_opt_class(), v37];
        }
        else
        {
          [v9 setLastJingleAccountStatus:-1];
          id v46 = objc_alloc(MEMORY[0x263F087E8]);
          [NSString stringWithFormat:@"[%@ retrieveSegmentData]: Unhandled Jingle response code %d. Please file a Radar!", objc_opt_class(), v37];
        v47 = };
        id v14 = (id)[v46 initWithAdCode:3 andDescription:v47];

        objc_msgSend(v14, "AD_Log:", @"iAdIDLogging");
        if (!v10) {
          goto LABEL_31;
        }
        goto LABEL_15;
      }
    }
    [v9 setLastJingleAccountStatus:0];
    [(ADSegmentDataManager *)self handleSuccessfulJingleSegmentResponse:v25 dsidRecord:v9 completionHandler:v10];
LABEL_30:
    id v14 = 0;
    goto LABEL_31;
  }
  id v15 = objc_alloc(MEMORY[0x263F087E8]);
  int v16 = [NSString stringWithFormat:@"[%@ retrieveSegmentData]: Segment update returned nil request. An update was not even attempted.", objc_opt_class()];
  id v14 = (id)[v15 initWithAdCode:11 andDescription:v16];

  objc_msgSend(v14, "AD_Log:", @"iAdIDLogging");
  [(ADSegmentDataManager *)self setPendingJingleRequestToken:0];
  if (v10) {
    v10[2](v10, v14, 0);
  }
LABEL_11:
}

- (BOOL)verifyGenderInSegmentData:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"it"];
  id v4 = v3;
  if (v3)
  {
    v5 = [v3 objectForKeyedSubscript:@"dm"];
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v6 = [v5 objectForKeyedSubscript:@"14"];
        uint64_t v7 = [v5 objectForKeyedSubscript:@"17"];
        uint64_t v8 = [v5 objectForKeyedSubscript:@"18"];
        id v9 = (void *)v8;
        if (v6 || v7 || v8)
        {
          if (v6 || !(v7 | v8))
          {
            char v11 = NSString;
            uint64_t v12 = objc_opt_class();
            if (!v6 || v7 || v9)
            {
              id v15 = [v11 stringWithFormat:@"[%@]: Both old and new gender data is present in segmentData. This is an error.", v12];
              _ADLog();

              id v13 = [NSString stringWithFormat:@"[%@]: Demographic data is: %@", objc_opt_class(), v5];
              _ADLog();
              BOOL v10 = 0;
              goto LABEL_20;
            }
            [v11 stringWithFormat:@"[%@]: Only old gender data present.", v12];
          }
          else
          {
            [NSString stringWithFormat:@"[%@]: Only new gender data present.", objc_opt_class()];
          }
        }
        else
        {
          [NSString stringWithFormat:@"[%@]: No gender data present.", objc_opt_class()];
        id v13 = };
        _ADLog();
        BOOL v10 = 1;
LABEL_20:

        goto LABEL_21;
      }
      [NSString stringWithFormat:@"[%@]: demographicData returned is not a dictionary!", objc_opt_class(), v16];
    }
    else
    {
      [NSString stringWithFormat:@"[%@]: %@ key not present in segmentData", objc_opt_class(), @"dm"];
    char v6 = };
    _ADLog();
    BOOL v10 = 1;
LABEL_21:

    goto LABEL_22;
  }
  v5 = [NSString stringWithFormat:@"[%@]: %@ key not present in segmentData", objc_opt_class(), @"it"];
  _ADLog();
  BOOL v10 = 1;
LABEL_22:

  return v10;
}

- (void)handleSuccessfulJingleSegmentResponse:(id)a3 dsidRecord:(id)a4 completionHandler:(id)a5
{
  v100[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v93 = a5;
  context = (void *)MEMORY[0x223CA6640]();
  id v9 = [v7 objectForKeyedSubscript:@"last-served"];
  if (MGGetBoolAnswer()
    && ([MEMORY[0x263F241B8] sharedInstance],
        BOOL v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 BOOLForKey:@"adForceConsumerStatus"],
        v10,
        (v11 & 1) != 0))
  {
    int v12 = 0;
    int v13 = 1;
  }
  else
  {
    int v12 = [v8 isRestrictedByApple];
    int v13 = 0;
  }
  id v14 = [MEMORY[0x263F241C0] sharedInstance];
  id v15 = v14;
  v90 = v9;
  id v91 = v7;
  v94 = v14;
  if (v12)
  {
    if (([v14 isManagedAppleID] & 1) == 0)
    {
      uint64_t v16 = NSString;
      uint64_t v17 = objc_opt_class();
      [v8 DSID];
      v19 = uint64_t v18 = v15;
      unsigned int v20 = [v16 stringWithFormat:@"[%@ retrieveSegmentData]: %@ is a restricted account, ignoring segments from Jingle.", v17, v19];
      _ADLog();

      id v15 = v18;
      goto LABEL_23;
    }
    goto LABEL_11;
  }
  if (!v9)
  {
LABEL_11:
    v26 = [MEMORY[0x263EFF910] date];
    objc_msgSend(v8, "setSegmentDataTimestamp:", objc_msgSend(v26, "AD_toServerTime"));

    if ([v15 isPersonalizedAdsEnabled])
    {
      objc_msgSend(v8, "setLastSegmentServedTimestamp:", objc_msgSend(v8, "segmentDataTimestamp"));
      [NSString stringWithFormat:@"[%@]: Segments have changed for opted-in user. Updating lastSegmentServedTimestamp to %d", objc_opt_class(), objc_msgSend(v8, "lastSegmentServedTimestamp")];
    }
    else
    {
      [NSString stringWithFormat:@"[%@]: Ignoring segment change for opted-out user.", objc_opt_class(), v88];
    uint64_t v27 = };
    _ADLog();

    uint64_t v28 = [v7 objectForKeyedSubscript:@"payload"];
    if (v28)
    {
      if ([(ADSegmentDataManager *)self verifyGenderInSegmentData:v28])
      {
        id v96 = 0;
        v29 = [MEMORY[0x263F08900] dataWithJSONObject:v28 options:0 error:&v96];
        id v30 = v96;
        id v31 = NSString;
        if (v30)
        {
          uint64_t v32 = objc_opt_class();
          uint64_t v33 = [v30 code];
          v34 = [v30 localizedDescription];
          v35 = [v31 stringWithFormat:@"[%@ retrieveSegmentData]: Error %ld decoding segment dictionary %@: %@", v32, v33, v28, v34];
          _ADLog();

          v36 = NSString;
          uint64_t v37 = objc_opt_class();
          uint64_t v38 = [v30 code];
          v39 = [v30 localizedDescription];
          uint64_t v89 = v38;
          id v7 = v91;
          v40 = [v36 stringWithFormat:@"[%@ retrieveSegmentData]: Error %ld decoding segment dictionary %@: %@", v37, v89, v28, v39];

          ADSimulateCrash();
        }
        else
        {
          v40 = (void *)[[NSString alloc] initWithData:v29 encoding:4];
          [v8 setSegmentData:v40];
        }
      }
      else
      {
        v44 = NSString;
        v45 = [v8 DSID];
        id v30 = [v44 stringWithFormat:@"For DSID: %@ both old and new gender data is present in segmentData: %@. This is an error.", v45, v28];

        ADSimulateCrash();
      }
    }
    else
    {
      uint64_t v41 = NSString;
      uint64_t v42 = objc_opt_class();
      id v30 = [v8 DSID];
      v43 = [v41 stringWithFormat:@"[%@ retrieveSegmentData]: Jingle did not return segment payload for DSID %@", v42, v30];
      _ADLog();
    }
    id v15 = v94;
    goto LABEL_23;
  }
  objc_msgSend(v8, "setLastSegmentServedTimestamp:", objc_msgSend(v9, "intValue"));
  int v21 = [v8 segmentDataTimestamp];
  if (v21 < (int)[v8 lastSegmentServedTimestamp])
  {
    int v22 = [NSString stringWithFormat:@"[%@ retrieveSegmentData]: Overriding unchanged segments - local segment timestamp (%d) is older than last-served timestamp (%d)", objc_opt_class(), objc_msgSend(v8, "segmentDataTimestamp"), objc_msgSend(v8, "lastSegmentServedTimestamp")];
    _ADLog();

    v23 = [v8 DSID];
    v97[0] = MEMORY[0x263EF8330];
    v97[1] = 3221225472;
    v97[2] = __91__ADSegmentDataManager_handleSuccessfulJingleSegmentResponse_dsidRecord_completionHandler___block_invoke;
    v97[3] = &unk_264669FD8;
    id v24 = v93;
    id v98 = v93;
    [(ADSegmentDataManager *)self retrieveSegmentData:v23 forceSegments:1 completionHandler:v97];

    id v25 = v98;
    goto LABEL_39;
  }
LABEL_23:
  if (v13)
  {
    [v8 setAccountIsU13:0];
    id v46 = [v7 objectForKeyedSubscript:@"t13flag"];
    objc_msgSend(v8, "setAccountIsT13:", (int)objc_msgSend(v46, "intValue") > 0);

    [v8 setAccountIsU18:0];
    [v8 setAccountAgeUnknown:0];
  }
  else
  {
    v47 = [v7 objectForKeyedSubscript:@"u13flag"];
    objc_msgSend(v8, "setAccountIsU13:", (int)objc_msgSend(v47, "intValue") > 0);

    id v48 = [v7 objectForKeyedSubscript:@"t13flag"];
    objc_msgSend(v8, "setAccountIsT13:", (int)objc_msgSend(v48, "intValue") > 0);

    v49 = [v7 objectForKeyedSubscript:@"u18flag"];
    objc_msgSend(v8, "setAccountIsU18:", (int)objc_msgSend(v49, "intValue") > 0);

    v50 = [v7 objectForKeyedSubscript:@"no-segment"];
    objc_msgSend(v8, "setAccountAgeUnknown:", objc_msgSend(v50, "BOOLValue"));
  }
  v51 = [NSString stringWithFormat:@"[%@]: The current account is: EDU: %d. Managed: %d. U13: %d. T13: %d. U18: %d. Unknown Age: %d.", objc_opt_class(), objc_msgSend(v15, "educationModeEnabled"), objc_msgSend(v15, "isManagedAppleID"), objc_msgSend(v8, "accountIsU13"), objc_msgSend(v8, "accountIsT13"), objc_msgSend(v8, "accountIsU18"), objc_msgSend(v8, "accountAgeUnknown")];
  _ADLog();

  uint64_t v52 = 0;
  id v24 = v93;
  if ((v12 & 1) == 0)
  {
    if (objc_msgSend(v8, "accountIsU13", 0) & 1) != 0 || (objc_msgSend(v8, "accountIsU18")) {
      uint64_t v52 = 0;
    }
    else {
      uint64_t v52 = [v8 accountAgeUnknown] ^ 1;
    }
  }
  [v94 setIdentifierForAdvertisingAllowed:v52];
  id v25 = [MEMORY[0x263EFF8F0] calendarWithIdentifier:*MEMORY[0x263EFF3F8]];
  v53 = [MEMORY[0x263EFF910] date];
  uint64_t v54 = [v25 component:4 fromDate:v53];

  v55 = [v8 segmentData];
  v56 = [(ADSegmentDataManager *)self parseBirthYearFromSegmentData:v55];

  if (([v8 isPlaceholderAccount] & 1) == 0 && (objc_msgSend(v8, "accountAgeUnknown") & 1) == 0)
  {
    char v63 = [v8 isRestrictedByApple];
    uint64_t v57 = 0;
    if (!v56 || (v63 & 1) != 0) {
      goto LABEL_34;
    }
    v64 = objc_msgSend(MEMORY[0x263F241C0], "sharedInstance", 0);
    char v65 = [v64 isPersonalizedAdsEnabled];

    if (v65)
    {
      v66 = self;
      [NSString stringWithFormat:@"[%@]: Personalized Ads is ON. We must use actual birth year.", objc_opt_class()];
    }
    else
    {
      if ([v8 noiseAppliedVersion] == 1)
      {
        v66 = self;
        v68 = [NSString stringWithFormat:@"[%@]: Personalized Ads is OFF and we have already applied noise before. Checking if basel year is younger than noised.", objc_opt_class()];
        _ADLog();

        LODWORD(v68) = [v56 intValue];
        if ((int)v68 <= (int)[v8 effectiveBirthYear]) {
          goto LABEL_46;
        }
        goto LABEL_45;
      }
      int v69 = [v8 noiseAppliedVersion];
      v70 = NSString;
      v66 = self;
      uint64_t v71 = objc_opt_class();
      if (v69 != 2)
      {
        v72 = [v70 stringWithFormat:@"[%@]: Personalized Ads is OFF and we have not applied noise before. Running noise calculation now.", v71];
        _ADLog();

        if (v54 - [v56 integerValue] < 21)
        {
          v80 = [NSString stringWithFormat:@"[%@]: User INELIGIBLE to be treated with noise.", objc_opt_class()];
          _ADLog();

          objc_msgSend(v8, "setEffectiveBirthYear:", objc_msgSend(v56, "intValue"));
          [v8 setNoiseAppliedVersion:2];
        }
        else
        {
          v73 = [(ADSegmentDataManager *)self noiseAppliedBirthYearFromActual:v56];
          int v74 = [v56 isEqualToNumber:v73];
          v75 = NSString;
          uint64_t v76 = objc_opt_class();
          if (v74)
          {
            v77 = [v75 stringWithFormat:@"[%@]: User IS NOT being treated with noise.", v76];
            _ADLog();

            uint64_t v78 = [v56 intValue];
            uint64_t v79 = 2;
          }
          else
          {
            v81 = [v75 stringWithFormat:@"[%@]: User IS being treated with noise.", v76];
            _ADLog();

            uint64_t v78 = [v73 intValue];
            uint64_t v79 = 1;
          }
          [v8 setEffectiveBirthYear:v78];
          [v8 setNoiseAppliedVersion:v79];
          v82 = [MEMORY[0x263F241C0] sharedInstance];
          v83 = [v82 iTunesStorefront];

          if (v83 && (unint64_t)[v83 length] >= 6)
          {
            uint64_t v84 = [v83 substringToIndex:6];

            v83 = (void *)v84;
          }
          int v85 = [v8 effectiveBirthYear];
          v99[0] = @"EffectiveAge";
          v86 = [NSNumber numberWithInteger:v54 + ~v85];
          v99[1] = @"Storefront";
          v100[0] = v86;
          v100[1] = v83;
          v87 = [NSDictionary dictionaryWithObjects:v100 forKeys:v99 count:2];
          AnalyticsSendEvent();

          v66 = self;
        }
        goto LABEL_46;
      }
      [v70 stringWithFormat:@"[%@]: Personalized Ads is OFF and we have already calculated noise before. No noise applied and basel year is honored.", v71];
    v67 = };
    _ADLog();

LABEL_45:
    objc_msgSend(v8, "setEffectiveBirthYear:", objc_msgSend(v56, "intValue"));
LABEL_46:
    uint64_t v57 = -[ADSegmentDataManager isEligibleForSensitiveContent:](v66, "isEligibleForSensitiveContent:", (int)[v8 effectiveBirthYear]);
    goto LABEL_34;
  }
  uint64_t v57 = 0;
LABEL_34:
  [v8 setSensitiveContentEligible:v57];
  v58 = NSString;
  uint64_t v59 = objc_opt_class();
  int v60 = [v8 sensitiveContentEligible];
  v61 = @"NOT eligible";
  if (v60) {
    v61 = @"eligible";
  }
  v62 = [v58 stringWithFormat:@"[%@]: This user is %@ for sensitive content.", v59, v61];
  _ADLog();

  if (v93) {
    (*((void (**)(id, void, uint64_t))v93 + 2))(v93, 0, 1);
  }

  id v9 = v90;
  id v7 = v91;
  id v15 = v94;
LABEL_39:
}

uint64_t __91__ADSegmentDataManager_handleSuccessfulJingleSegmentResponse_dsidRecord_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)parseBirthYearFromSegmentData:(id)a3
{
  v3 = (void *)MEMORY[0x263F08900];
  id v4 = [a3 dataUsingEncoding:4];
  uint64_t v12 = 0;
  v5 = [v3 JSONObjectWithData:v4 options:0 error:&v12];
  uint64_t v6 = v12;

  if (v6)
  {
    id v7 = [NSString stringWithFormat:@"segmentData is not in JSON format. Unable to parse segmentData."];
    _ADLog();
    id v8 = 0;
  }
  else
  {
    id v7 = [v5 objectForKeyedSubscript:@"it"];
    id v9 = [v7 objectForKeyedSubscript:@"dm"];
    BOOL v10 = [v9 objectForKeyedSubscript:@"13"];
    id v8 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "intValue"));
  }

  return v8;
}

- (id)noiseAppliedBirthYearFromActual:(id)a3
{
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__3;
  uint64_t v27 = __Block_byref_object_dispose__3;
  id v4 = a3;
  id v28 = v4;
  v5 = (void *)MEMORY[0x223CA6640]();
  uint64_t v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  id v7 = (void *)MEMORY[0x263F61F40];
  uint64_t v8 = objc_opt_class();
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __56__ADSegmentDataManager_noiseAppliedBirthYearFromActual___block_invoke;
  uint64_t v18 = &unk_26466A000;
  id v9 = v4;
  id v19 = v9;
  unsigned int v20 = self;
  int v22 = &v23;
  BOOL v10 = v6;
  int v21 = v10;
  [v7 fetchConfigurationForClass:v8 completion:&v15];
  dispatch_time_t v11 = dispatch_time(0, 10000000000);
  if (dispatch_group_wait(v10, v11))
  {
    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"[FILE A RADAR] We failed to fetch the noise config in time.", v15, v16, v17, v18, v19, v20);
    _ADLog();
  }
  id v13 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v13;
}

void __56__ADSegmentDataManager_noiseAppliedBirthYearFromActual___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  v3 = [a2 lowerAgeLimits];
  if (!v3)
  {
    id v4 = [NSString stringWithFormat:@"[FILE A RADAR] There is an issue with the config payload."];
    _ADLog();

    v5 = [@"{\"noiseRange\":{\"startAge\":18,\"endAge\":20},\"adolescentNoise\":0,\"noise\":[{\"age\":18,\"percentage\":0.52},{\"age\":19,\"percentage\":0.73},{\"age\":20,\"percentage\":0.96}]}" dataUsingEncoding:4];
    uint64_t v76 = 0;
    v3 = [MEMORY[0x263F08900] JSONObjectWithData:v5 options:0 error:&v76];
  }
  uint64_t v6 = [v3 objectForKey:@"noiseRange"];
  id v7 = [v6 objectForKey:@"startAge"];
  v61 = v6;
  uint64_t v8 = [v6 objectForKey:@"endAge"];
  if ((int)[v7 intValue] <= 12)
  {
    uint64_t v9 = [NSNumber numberWithInt:13];

    id v7 = (void *)v9;
  }
  if ((int)[v7 intValue] >= 19)
  {
    uint64_t v10 = [NSNumber numberWithInt:18];

    id v7 = (void *)v10;
  }
  if ((int)[v8 intValue] <= 19)
  {
    uint64_t v11 = [NSNumber numberWithInt:20];

    uint64_t v8 = (void *)v11;
  }
  uint64_t v64 = a1;
  uint64_t v12 = [MEMORY[0x263EFF980] array];
  char v65 = v7;
  uint64_t v13 = [v7 intValue];
  if ((int)v13 <= (int)[v8 intValue])
  {
    do
    {
      id v14 = [NSNumber numberWithInt:v13];
      [v12 addObject:v14];

      BOOL v15 = (int)v13 < (int)[v8 intValue];
      uint64_t v13 = (v13 + 1);
    }
    while (v15);
  }
  v62 = v8;
  char v63 = v3;
  uint64_t v16 = [v3 objectForKey:@"noise"];
  uint64_t v17 = (void *)[v16 mutableCopy];

  id v66 = v17;
  uint64_t v18 = [v17 valueForKey:@"age"];
  id v19 = (void *)[v18 mutableCopy];

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  obuint64_t j = v12;
  uint64_t v20 = [obj countByEnumeratingWithState:&v72 objects:v82 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v73;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v73 != v22) {
          objc_enumerationMutation(obj);
        }
        id v24 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        if (([v19 containsObject:v24] & 1) == 0)
        {
          uint64_t v25 = objc_msgSend(NSString, "stringWithFormat:", @"There is a broken config for age noise where (%d) is missing.", objc_msgSend(v24, "intValue"));
          _ADLog();

          v80[0] = @"age";
          v80[1] = @"percentage";
          v81[0] = v24;
          v81[1] = &unk_26D5A54E8;
          v26 = [NSDictionary dictionaryWithObjects:v81 forKeys:v80 count:2];
          [v66 addObject:v26];
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v72 objects:v82 count:16];
    }
    while (v21);
  }

  uint64_t v27 = v63;
  id v28 = [v63 objectForKey:@"adolescentNoise"];
  [v28 floatValue];
  if (v29 > 0.0)
  {
    int v30 = [v65 intValue];
    id v31 = [NSNumber numberWithInt:(v30 - 1)];
    v78[0] = @"age";
    v78[1] = @"percentage";
    v79[0] = v31;
    v79[1] = v28;
    uint64_t v32 = [NSDictionary dictionaryWithObjects:v79 forKeys:v78 count:2];
    [v66 addObject:v32];
  }
  uint64_t v33 = [MEMORY[0x263EFF8F0] calendarWithIdentifier:*MEMORY[0x263EFF3F8]];
  v34 = [MEMORY[0x263EFF910] date];
  uint64_t v35 = [v33 component:4 fromDate:v34];

  uint64_t v36 = v64;
  uint64_t v37 = v35 + ~[*(id *)(v64 + 32) integerValue];
  if (v37 <= [v8 integerValue])
  {
    uint64_t v52 = v37;
  }
  else
  {
    uint64_t v59 = v35;
    if (MGGetBoolAnswer())
    {
      uint64_t v38 = [*(id *)(v64 + 40) _ageDistributionOverrides];
      v39 = v38;
      if (v38)
      {
        id v40 = v38;

        id v66 = v40;
      }
    }
    signed int v41 = arc4random_uniform(0x2710u);
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id v66 = v66;
    uint64_t v42 = [v66 countByEnumeratingWithState:&v68 objects:v77 count:16];
    uint64_t v60 = v37;
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v57 = v33;
      v58 = v28;
      signed int v44 = 0;
      uint64_t v45 = *(void *)v69;
      while (2)
      {
        for (uint64_t j = 0; j != v43; ++j)
        {
          if (*(void *)v69 != v45) {
            objc_enumerationMutation(v66);
          }
          v47 = *(void **)(*((void *)&v68 + 1) + 8 * j);
          id v48 = [v47 objectForKey:@"percentage"];
          v49 = [v47 objectForKey:@"age"];
          [v48 floatValue];
          int v51 = (int)(float)(v50 * 100.0);
          if (v51 <= 50) {
            int v51 = 50;
          }
          v44 += v51;
          if (v41 < v44)
          {
            uint64_t v37 = [v49 integerValue];

            goto LABEL_40;
          }
        }
        uint64_t v43 = [v66 countByEnumeratingWithState:&v68 objects:v77 count:16];
        if (v43) {
          continue;
        }
        break;
      }
LABEL_40:
      uint64_t v27 = v63;
      uint64_t v36 = v64;
      uint64_t v8 = v62;
      uint64_t v33 = v57;
      id v28 = v58;
    }

    uint64_t v35 = v59;
    uint64_t v52 = v60;
  }
  v53 = objc_msgSend(NSString, "stringWithFormat:", @"User with age %ld being treated with effective age of %ld.", v52, v37);
  _ADLog();

  if (v52 != v37)
  {
    uint64_t v54 = [NSNumber numberWithInteger:v35 + ~v37];
    uint64_t v55 = *(void *)(*(void *)(v36 + 56) + 8);
    v56 = *(void **)(v55 + 40);
    *(void *)(v55 + 40) = v54;
  }
  dispatch_group_leave(*(dispatch_group_t *)(v36 + 48));
}

- (BOOL)isEligibleForSensitiveContent:(int64_t)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  id v4 = (void *)MEMORY[0x223CA6640](self, a2);
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  uint64_t v6 = (void *)MEMORY[0x263F61F40];
  uint64_t v7 = objc_opt_class();
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __54__ADSegmentDataManager_isEligibleForSensitiveContent___block_invoke;
  v13[3] = &unk_26466A028;
  BOOL v15 = &v17;
  int64_t v16 = a3;
  uint64_t v8 = v5;
  id v14 = v8;
  [v6 fetchConfigurationForClass:v7 completion:v13];
  dispatch_time_t v9 = dispatch_time(0, 10000000000);
  if (dispatch_group_wait(v8, v9))
  {
    uint64_t v10 = [NSString stringWithFormat:@"[FILE A RADAR] We failed to fetch the storefront threshold config in time."];
    _ADLog();
  }
  BOOL v11 = *((unsigned char *)v18 + 24) != 0;
  _Block_object_dispose(&v17, 8);
  return v11;
}

void __54__ADSegmentDataManager_isEligibleForSensitiveContent___block_invoke(uint64_t a1, void *a2)
{
  id v19 = a2;
  v3 = [v19 enabled];
  int v4 = [v3 BOOLValue];

  if (v4)
  {
    v5 = [v19 sensitiveContentEligibilityThreshold];
    uint64_t v6 = v5;
    if (v5)
    {
      uint64_t v7 = [v5 objectForKey:@"default"];
      uint64_t v8 = [MEMORY[0x263F241C0] sharedInstance];
      dispatch_time_t v9 = [v8 iTunesStorefront];

      if (v9 && (unint64_t)[v9 length] >= 6)
      {
        uint64_t v10 = [v9 substringToIndex:6];

        dispatch_time_t v9 = (void *)v10;
      }
      id v11 = v6;
      uint64_t v12 = [v11 objectForKey:v9];

      if (v12)
      {
        uint64_t v13 = [v11 objectForKey:v9];

        uint64_t v7 = (void *)v13;
      }
      id v14 = [MEMORY[0x263EFF8F0] calendarWithIdentifier:*MEMORY[0x263EFF3F8]];
      BOOL v15 = [MEMORY[0x263EFF910] date];
      uint64_t v16 = [v14 component:4 fromDate:v15];

      uint64_t v17 = [NSNumber numberWithInteger:v16 + ~*(void *)(a1 + 48)];
      uint64_t v18 = [NSString stringWithFormat:@"The storefront: %@ has a threshold of: %d. The user's age is: %d", v9, objc_msgSend(v7, "intValue"), objc_msgSend(v17, "intValue")];
      _ADLog();

      LODWORD(v18) = [v17 intValue];
      if ((int)v18 >= (int)[v7 intValue]) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      }
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (id)_ageDistributionOverrides
{
  v28[2] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263EFFA40]);
  v3 = (void *)[v2 initWithSuiteName:*MEMORY[0x263F24150]];
  int v4 = [v3 objectForKey:@"enableAgeDistributionOverrides"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = (id)MEMORY[0x263EFFA80];
  }
  if ([v5 BOOLValue])
  {
    uint64_t v6 = [MEMORY[0x263EFF980] array];
    uint64_t v22 = [v3 objectForKey:@"ageDistribution18"];
    uint64_t v7 = [v3 objectForKey:@"ageDistribution19"];
    uint64_t v21 = [v3 objectForKey:@"ageDistribution20"];
    v27[0] = @"age";
    uint64_t v8 = [NSNumber numberWithInt:18];
    v27[1] = @"percentage";
    v28[0] = v8;
    dispatch_time_t v9 = NSNumber;
    [v22 floatValue];
    uint64_t v10 = objc_msgSend(v9, "numberWithFloat:");
    v28[1] = v10;
    char v20 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];

    [v6 addObject:v20];
    v25[0] = @"age";
    id v11 = [NSNumber numberWithInt:19];
    v25[1] = @"percentage";
    v26[0] = v11;
    uint64_t v12 = NSNumber;
    [v7 floatValue];
    uint64_t v13 = objc_msgSend(v12, "numberWithFloat:");
    v26[1] = v13;
    id v14 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];

    [v6 addObject:v14];
    v23[0] = @"age";
    BOOL v15 = [NSNumber numberWithInt:20];
    v23[1] = @"percentage";
    v24[0] = v15;
    uint64_t v16 = NSNumber;
    [v21 floatValue];
    uint64_t v17 = objc_msgSend(v16, "numberWithFloat:");
    v24[1] = v17;
    uint64_t v18 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];

    [v6 addObject:v18];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)populateAccountTypeFields:(id)a3
{
  id v11 = a3;
  v3 = [MEMORY[0x263F241C0] sharedInstance];
  int v4 = [MEMORY[0x263F241D8] sharedInstance];
  id v5 = [v4 activeDSIDRecord];

  uint64_t v6 = [v3 iTunesStoreAccount];

  if (!v6)
  {
    uint64_t v7 = 0;
    goto LABEL_6;
  }
  if (([v5 accountAgeUnknown] & 1) != 0 || objc_msgSend(v5, "lastJingleAccountStatus") == 1)
  {
    uint64_t v7 = 6;
LABEL_6:
    [v11 addAccountType:v7];
    goto LABEL_7;
  }
  int v8 = [v3 isManagedAppleID];
  if (v8) {
    [v11 addAccountType:2];
  }
  if ([v5 accountIsU13])
  {
    [v11 addAccountType:3];
    int v9 = 0;
  }
  else
  {
    int v9 = v8 ^ 1;
  }
  [v5 accountIsT13];
  int v10 = [v5 accountIsU18];
  if (v10) {
    uint64_t v7 = 5;
  }
  else {
    uint64_t v7 = 1;
  }
  if ((v10 & 1) != 0 || v9) {
    goto LABEL_6;
  }
LABEL_7:
}

- (BOOL)isSegmentReductionEnabled
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  id v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  v3 = (void *)MEMORY[0x263F61F40];
  uint64_t v4 = objc_opt_class();
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __49__ADSegmentDataManager_isSegmentReductionEnabled__block_invoke;
  uint64_t v13 = &unk_26466A050;
  BOOL v15 = &v16;
  id v5 = v2;
  id v14 = v5;
  [v3 fetchConfigurationForClass:v4 completion:&v10];
  dispatch_time_t v6 = dispatch_time(0, 10000000000);
  if (dispatch_group_wait(v5, v6))
  {
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"[FILE A RADAR] We failed to fetch the segments config in time.", v10, v11, v12, v13);
    _ADLog();
  }
  char v8 = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __49__ADSegmentDataManager_isSegmentReductionEnabled__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [v5 segmentReductionEnabled];

  if (v3)
  {
    uint64_t v4 = [v5 segmentReductionEnabled];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 BOOLValue];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (BOOL)shouldSendSegmentDataToAdPlatforms:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F241B8] sharedInstance];
  int v6 = [v5 BOOLForKey:@"EnableCustomPayload"];

  if (!v6)
  {
    int v9 = [MEMORY[0x263F241D8] sharedInstance];
    uint64_t v7 = [v9 activeDSIDRecord];

    if ([(ADSegmentDataManager *)self isSegmentReductionEnabled])
    {
      if ([v7 isRestrictedByApple])
      {
        [NSString stringWithFormat:@"[%@]: Skipping sending segment data to AdPlatforms. Account %@ is a restricted account (U13, U18, MAID or EDU).", objc_opt_class(), v4];
        BOOL v15 = LABEL_14:;
        _ADLog();

        uint64_t v16 = [NSString stringWithFormat:@"[%@]: Segment update request should NOT be sent.", objc_opt_class()];
LABEL_15:
        _ADLog();
LABEL_16:
        BOOL v8 = 0;
LABEL_17:

        goto LABEL_18;
      }
      uint64_t v11 = [MEMORY[0x263F241C0] sharedInstance];
      char v12 = [v11 isPersonalizedAdsEnabled];

      if ((v12 & 1) == 0)
      {
        [NSString stringWithFormat:@"[%@]: Skipping sending segment data to AdPlatforms. PA is set to OFF", objc_opt_class(), v45];
        goto LABEL_14;
      }
LABEL_19:
      if ([(ADSegmentDataManager *)self segmentUpdateInProgress])
      {
        [NSString stringWithFormat:@"[%@]: Skipping sending segment data to AdPlatforms. Segment update for %@ is in-flight.", objc_opt_class(), v4, v46];
        uint64_t v16 = LABEL_23:;
        goto LABEL_15;
      }
      if ([(ADSegmentDataManager *)self segmentRetrievalInProgress])
      {
        [NSString stringWithFormat:@"[%@]: Skipping sending segment data to AdPlatforms. Segment retrieval request to Jingle for %@ is in-flight.", objc_opt_class(), v4, v46];
        goto LABEL_23;
      }
      uint64_t v18 = [v7 DSID];
      char v19 = [v18 isEqualToString:v4];

      if (v19)
      {
        char v20 = [MEMORY[0x263F241C0] sharedInstance];
        if (![v20 isPersonalizedAdsEnabled])
        {
LABEL_28:

          goto LABEL_29;
        }
        uint64_t v21 = [v7 encryptedIDForClientType:5];
        if (v21)
        {

          goto LABEL_28;
        }
        char v38 = [v7 isPlaceholderAccount];

        if (v38)
        {
LABEL_29:
          uint64_t v22 = [MEMORY[0x263EFF910] date];
          int v23 = objc_msgSend(v22, "AD_toServerTime");
          int v24 = v23 - [v7 lastSentSegmentDataTimestamp];
          uint64_t v25 = [MEMORY[0x263F241C0] sharedInstance];
          int v26 = [v25 maxSegmentSendInterval];

          if (v24 > v26)
          {
            int v27 = [v7 lastSentSegmentDataTimestamp];
            id v28 = NSString;
            uint64_t v29 = objc_opt_class();
            if (v27)
            {
              uint64_t v16 = [MEMORY[0x263F241C0] sharedInstance];
              [v28 stringWithFormat:@"[%@]: Sending segment data to AdPlatforms - maximum update interval of %d seconds exceeded.", v29, objc_msgSend(v16, "maxSegmentSendInterval")];
            }
            else
            {
              uint64_t v16 = [v7 DSID];
              [v28 stringWithFormat:@"[%@]: Sending segment data to AdPlatforms - we have not sent segments before for DSID %@.", v29, v16];
            signed int v41 = };
            _ADLog();

            goto LABEL_51;
          }
          uint64_t v33 = [MEMORY[0x263F241D8] sharedInstance];
          v34 = [v33 reconcileOperations];
          if ([v34 isSet:4])
          {
            uint64_t v35 = [MEMORY[0x263F241C0] sharedInstance];
            int v36 = [v35 isPersonalizedAdsEnabled];

            if (v36)
            {
              [NSString stringWithFormat:@"[%@]: Sending segment data to AdPlatforms because ADReconcileOp_SendSegmentUpdate is set.", objc_opt_class(), v45, v46];
              uint64_t v16 = LABEL_50:;
              _ADLog();
LABEL_51:
              BOOL v8 = 1;
              goto LABEL_17;
            }
          }
          else
          {
          }
          int v37 = [v7 lastSegmentServedTimestamp];
          if (v37 < (int)[v7 lastSentSegmentDataTimestamp])
          {
            [NSString stringWithFormat:@"[%@]: Skipping sending segment data to AdPlatforms. Segment data has not changed (lastSegmentServedTimestamp = %d < lastSentSegmentDataTimestamp %d).", objc_opt_class(), objc_msgSend(v7, "lastSegmentServedTimestamp"), objc_msgSend(v7, "lastSentSegmentDataTimestamp")];
            goto LABEL_23;
          }
          int v42 = [v7 segmentDataTimestamp];
          if (v42 <= (int)[v7 lastSentSegmentDataTimestamp])
          {
            [NSString stringWithFormat:@"[%@]: Skipping sending segment data to AdPlatforms, it was previously sent at %d and hasn't changed since %d.", objc_opt_class(), objc_msgSend(v7, "lastSentSegmentDataTimestamp"), objc_msgSend(v7, "segmentDataTimestamp")];
            goto LABEL_23;
          }
          int v43 = [v7 lastSegmentServedTimestamp];
          if (v43 <= (int)[v7 lastSentSegmentDataTimestamp])
          {
            int v44 = [v7 segmentDataTimestamp];
            if (v44 <= (int)[v7 lastSentSegmentDataTimestamp]) {
              goto LABEL_3;
            }
            [NSString stringWithFormat:@"[%@]: Sending segment data to AdPlatforms because segment data changed (segmentDataTimestamp = %d > lastSentSegmentDataTimestamp %d).", objc_opt_class(), objc_msgSend(v7, "segmentDataTimestamp"), objc_msgSend(v7, "lastSentSegmentDataTimestamp")];
          }
          else
          {
            [NSString stringWithFormat:@"[%@]: Sending segment data to AdPlatforms because segment data changed (lastSegmentServedTimestamp = %d > lastSentSegmentDataTimestamp %d).", objc_opt_class(), objc_msgSend(v7, "lastSegmentServedTimestamp"), objc_msgSend(v7, "lastSentSegmentDataTimestamp")];
          }
          goto LABEL_50;
        }
        v39 = NSString;
        uint64_t v40 = objc_opt_class();
        uint64_t v16 = [v7 DSID];
        [v39 stringWithFormat:@"[%@]: Skipping sending segment data to AdPlatforms. Device is opted-in but DPID for %@ is NULL.", v40, v16, v46];
      }
      else
      {
        int v30 = NSString;
        uint64_t v31 = objc_opt_class();
        uint64_t v16 = [v7 DSID];
        [v30 stringWithFormat:@"[%@]: Skipping sending segment data to AdPlatforms. Current active record DSID %@ does not match request DSID %@.", v31, v16, v4];
      uint64_t v32 = };
      _ADLog();

      goto LABEL_16;
    }
    if (([v7 accountIsU13] & 1) == 0)
    {
      uint64_t v10 = [MEMORY[0x263F241C0] sharedInstance];
      if ([v10 isManagedAppleID])
      {
      }
      else
      {
        uint64_t v13 = [MEMORY[0x263F241C0] sharedInstance];
        int v14 = [v13 educationModeEnabled];

        if (!v14) {
          goto LABEL_19;
        }
      }
    }
    [NSString stringWithFormat:@"[%@]: Skipping sending segment data to AdPlatforms. Account %@ is a U13 or MAID or EDU account.", objc_opt_class(), v4];
    goto LABEL_14;
  }
  uint64_t v7 = [NSString stringWithFormat:@"[%@]: Sending segment data to AdPlatforms because AD_ENABLE_CUSTOM_SEGMENT_PAYLOAD is enabled.", objc_opt_class()];
  _ADLog();
LABEL_3:
  BOOL v8 = 1;
LABEL_18:

  return v8;
}

- (void)sendSegmentDataToAdPlatforms:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)MEMORY[0x223CA6640]();
  if ([(ADSegmentDataManager *)self shouldSendSegmentDataToAdPlatforms:v6])
  {
    self->_segmentUpdateInProgress = 1;
    int v9 = [MEMORY[0x263F24230] workQueue];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __71__ADSegmentDataManager_sendSegmentDataToAdPlatforms_completionHandler___block_invoke;
    v10[3] = &unk_264669710;
    v10[4] = self;
    id v11 = v7;
    [v9 addOperationWithBlock:v10];
  }
  else if (v7)
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

void __71__ADSegmentDataManager_sendSegmentDataToAdPlatforms_completionHandler___block_invoke(uint64_t a1)
{
  v1 = [MEMORY[0x263F241C0] sharedInstance];
  uint64_t v2 = [MEMORY[0x263F24230] sharedInstance];
  v3 = [MEMORY[0x263F241D8] sharedInstance];
  id v4 = objc_alloc_init(MEMORY[0x263F24220]);
  id v5 = [v3 activeDSIDRecord];
  id v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
  id v7 = [v6 UUIDString];
  [v4 setAdvertisingIdentifier:v7];

  BOOL v8 = [v3 monthlyResetArray];
  objc_msgSend(v4, "setAdvertisingIdentifierMonthResetCount:", objc_msgSend(v8, "count"));

  int v9 = [v5 encryptedIDForClientType:0];
  [v4 setIAdID:v9];

  uint64_t v10 = [v5 encryptedIDForClientType:5];
  [v4 setDPID:v10];

  id v11 = objc_alloc(MEMORY[0x263EFFA40]);
  char v12 = (void *)[v11 initWithSuiteName:*MEMORY[0x263F24150]];
  uint64_t v13 = [v12 objectForKey:@"acknowledgedPersonalizedAdsVersion"];

  v49 = (void *)v2;
  v47 = v12;
  id v48 = v6;
  if (([v5 isRestrictedByApple] & 1) != 0 || !objc_msgSend(v1, "isPersonalizedAdsEnabled"))
  {
    int v14 = 1;
  }
  else
  {
    int v14 = [v5 isPlaceholderAccount];
    if ((v14 & 1) == 0)
    {
      uint64_t v15 = a1;
      if (v13)
      {
        if ([v5 lastJingleAccountStatus] != 1)
        {
LABEL_24:
          int v23 = [v5 segmentData];
          [v4 setSegmentInfo:v23];
          goto LABEL_25;
        }
        goto LABEL_21;
      }
    }
  }
  int v46 = v14;
  uint64_t v16 = NSString;
  uint64_t v17 = objc_opt_class();
  if ([v5 isRestrictedByApple]) {
    uint64_t v18 = @"YES";
  }
  else {
    uint64_t v18 = @"NO";
  }
  if ([v1 isPersonalizedAdsEnabled]) {
    char v19 = @"YES";
  }
  else {
    char v19 = @"NO";
  }
  if ([v5 isPlaceholderAccount]) {
    char v20 = @"YES";
  }
  else {
    char v20 = @"NO";
  }
  if (v13) {
    uint64_t v21 = @"YES";
  }
  else {
    uint64_t v21 = @"NO";
  }
  uint64_t v15 = a1;
  uint64_t v22 = [v16 stringWithFormat:@"[%@ sendSegmentDataToAdPlatforms]: NOT including segment data in ADSegmentUpdateRequest because -\nisRestrictedByApple: %@\npersonalizedAdsEnabled: %@\nisPlaceholderAccount: %@\nconsentedToPA: %@", v17, v18, v19, v20, v21];
  _ADLog();

  if ([v5 lastJingleAccountStatus] != 1)
  {
    if (v46)
    {
      [v4 setSegmentInfo:0];
      goto LABEL_26;
    }
    goto LABEL_24;
  }
LABEL_21:
  [v4 setSegmentInfo:@"{\"t\":6, \"o\":0}"];
  int v23 = [NSString stringWithFormat:@"[%@ sendSegmentDataToAdPlatforms]: Forcing segment data to %@", objc_opt_class(), @"{\"t\":6, \"o\":0}"];
  _ADLog();
LABEL_25:

LABEL_26:
  int v24 = [MEMORY[0x263F241B8] sharedInstance];
  int v25 = [v24 BOOLForKey:@"EnableCustomPayload"];

  if (v25)
  {
    int v26 = [v1 customJinglePayload];
    int v27 = [v1 isPersonalizedAdsEnabled];
    id v28 = NSString;
    uint64_t v29 = objc_opt_class();
    int v30 = @"nil (LAT Enabled)";
    if (v27)
    {
      int v30 = v26;
      uint64_t v31 = v26;
    }
    else
    {
      uint64_t v31 = 0;
    }
    uint64_t v32 = [v28 stringWithFormat:@"[%@] Using Custom Segment Payload from Internal Settings: %@", v29, v30];
    _ADLog();

    [v4 setSegmentInfo:v31];
    [v5 setSegmentData:v26];
    uint64_t v33 = NSString;
    v34 = [v5 segmentData];
    uint64_t v35 = [v33 stringWithFormat:@"Active DSID record segments set to: %@", v34];
    _ADLog();
  }
  [v4 setIsFirstPartyIdentifier:0];
  objc_msgSend(v4, "setITunesRefreshTime:", (double)(int)objc_msgSend(v5, "segmentDataTimestamp"));
  int v36 = [MEMORY[0x263EFF910] date];
  objc_msgSend(v4, "setUpdateSentTime:", (double)(int)objc_msgSend(v36, "AD_toServerTime"));

  [v1 timezone];
  objc_msgSend(v4, "setTimezone:");
  int v37 = [v1 osVersionAndBuild];
  [v4 setOsVersionAndBuild:v37];

  char v38 = [v1 localeIdentifier];
  [v4 setLocaleIdentifier:v38];

  objc_msgSend(v4, "addDeviceMode:", objc_msgSend(v1, "educationModeEnabled"));
  [*(id *)(v15 + 32) populateAccountTypeFields:v4];
  v39 = [v1 iCloudDSID];

  if (v39)
  {
    uint64_t v40 = [v1 iCloudDSID];
    signed int v41 = [v1 iTunesAccountDSID];
    int v42 = [v40 isEqualToString:v41];

    if (v42) {
      uint64_t v43 = 1;
    }
    else {
      uint64_t v43 = 2;
    }
  }
  else
  {
    uint64_t v43 = 0;
  }
  [v4 addAccountState:v43];
  int v44 = [v1 defaultServerURL];
  v51[0] = MEMORY[0x263EF8330];
  v51[1] = 3221225472;
  v51[2] = __71__ADSegmentDataManager_sendSegmentDataToAdPlatforms_completionHandler___block_invoke_2;
  v51[3] = &unk_26466A078;
  uint64_t v45 = *(void **)(v15 + 40);
  v51[4] = *(void *)(v15 + 32);
  id v52 = v45;
  [v49 handleRequest:v4 serverURL:v44 responseHandler:v51];
}

void __71__ADSegmentDataManager_sendSegmentDataToAdPlatforms_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = (objc_class *)MEMORY[0x263F24228];
  id v7 = a4;
  id v8 = a2;
  id v9 = (id)[[v6 alloc] initWithData:v8];

  [*(id *)(a1 + 32) handleSegmentUpdateResponse:v9 error:v7 completionHandler:*(void *)(a1 + 40)];
}

- (void)handleSegmentUpdateResponse:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v29 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, id, uint64_t))a5;
  uint64_t v10 = [MEMORY[0x263F241D8] sharedInstance];
  id v11 = [v10 activeDSIDRecord];

  char v12 = NSString;
  uint64_t v13 = objc_opt_class();
  if (v8)
  {
    int v14 = [v11 DSID];
    uint64_t v15 = ClientTypeToString();
    uint64_t v16 = [v8 code];
    uint64_t v17 = [v8 localizedDescription];
    uint64_t v18 = [v12 stringWithFormat:@"[%@] Error sending segments to AdPlatforms for %@ %@. Error %ld - %@", v13, v14, v15, v16, v17];
    _ADLog();

LABEL_3:
    goto LABEL_4;
  }
  char v19 = objc_msgSend(v29, "AD_jsonString");
  char v20 = [v12 stringWithFormat:@"[%@] Received segment update response: %@", v13, v19];
  _ADLog();

  uint64_t v21 = [MEMORY[0x263EFF910] date];
  objc_msgSend(v11, "setLastSentSegmentDataTimestamp:", objc_msgSend(v21, "AD_toServerTime"));

  if ([v29 hasSegmentRefreshIntervalInSeconds])
  {
    [v29 segmentRefreshIntervalInSeconds];
    if (v22 > 0.0)
    {
      [v29 segmentRefreshIntervalInSeconds];
      uint64_t v24 = (int)v23;
      int v25 = [MEMORY[0x263F241C0] sharedInstance];
      [v25 setSegmentRetrievalInterval:v24];
    }
  }
  if ([v29 hasMaxSegmentUpdateIntervalInSeconds])
  {
    [v29 maxSegmentUpdateIntervalInSeconds];
    if (v26 > 0.0)
    {
      [v29 maxSegmentUpdateIntervalInSeconds];
      uint64_t v28 = (int)v27;
      int v14 = [MEMORY[0x263F241C0] sharedInstance];
      [v14 setMaxSegmentSendInterval:v28];
      goto LABEL_3;
    }
  }
LABEL_4:
  self->_segmentUpdateInProgress = 0;
  if (v9) {
    v9[2](v9, v8, 1);
  }
}

- (BOOL)segmentUpdateInProgress
{
  return self->_segmentUpdateInProgress;
}

- (void)setSegmentUpdateInProgress:(BOOL)a3
{
  self->_segmentUpdateInProgress = a3;
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