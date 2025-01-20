@interface IRCandidateClassificationDetectorSameSpace
+ (id)sameSpaceMiLoScoresForCandidate:(id)a3 basedOnMiLoPrediction:(id)a4 andHistoryEventsAsc:(id)a5 andDate:(id)a6;
- (BOOL)_isSameSpaceBasedOnPDRFenceForCandidate:(id)a3 basedOnSystemState:(id)a4;
- (BOOL)_isSameSpaceBrokeredDeviceForCandidate:(id)a3 basedOnSystemState:(id)a4 andHistoryEventsAsc:(id)a5 andDate:(id)a6;
- (BOOL)_isSameSpaceCandidate:(id)a3;
- (BOOL)_isSameSpaceForCandidate:(id)a3 basedOnHistoryEventsAsc:(id)a4 andDate:(id)a5;
- (BOOL)_isSameSpaceForCandidate:(id)a3 basedOnMiLoPrediction:(id)a4 andHistoryEventsAsc:(id)a5 andDate:(id)a6;
- (id)_isSameSpaceForCandidate:(id)a3 basedOnNearbyDevices:(id)a4 andExpiryDate:(id)a5 isUWB:(BOOL)a6;
- (void)adjustSameSpaceParametersForCandidates:(id)a3 withSystemState:(id)a4 andHistoryEventsAsc:(id)a5 andMiLoPrediction:(id)a6 andNearbyDevicesContainer:(id)a7 andDate:(id)a8;
@end

@implementation IRCandidateClassificationDetectorSameSpace

- (void)adjustSameSpaceParametersForCandidates:(id)a3 withSystemState:(id)a4 andHistoryEventsAsc:(id)a5 andMiLoPrediction:(id)a6 andNearbyDevicesContainer:(id)a7 andDate:(id)a8
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v40 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v19 = [v17 freezeDateNIHomeDevice];
  if (v19)
  {
    id v39 = [v17 freezeDateNIHomeDevice];
  }
  else
  {
    id v39 = v18;
  }

  v20 = +[IRPreferences shared];
  v21 = [v20 nearbyDeviceMeasurmentExpityTimeSeconds];
  [v21 doubleValue];
  v23 = [v39 dateByAddingTimeInterval:-v22];

  v24 = [MEMORY[0x263EFF910] distantPast];
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  uint64_t v53 = 0;
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __173__IRCandidateClassificationDetectorSameSpace_adjustSameSpaceParametersForCandidates_withSystemState_andHistoryEventsAsc_andMiLoPrediction_andNearbyDevicesContainer_andDate___block_invoke;
  v41[3] = &unk_26539F698;
  v41[4] = self;
  id v25 = v16;
  id v42 = v25;
  id v26 = v15;
  id v43 = v26;
  id v27 = v18;
  id v44 = v27;
  id v28 = v14;
  id v45 = v28;
  id v29 = v17;
  id v46 = v29;
  id v30 = v23;
  id v47 = v30;
  id v31 = v24;
  id v48 = v31;
  v49 = &v50;
  [v40 enumerateObjectsUsingBlock:v41];
  v32 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  v33 = (id)*MEMORY[0x263F50090];
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    id v38 = v25;
    id v34 = v28;
    id v35 = v26;
    v36 = [NSNumber numberWithUnsignedInteger:v51[3]];
    v37 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v40, "count"));
    *(_DWORD *)buf = 136315906;
    v55 = "#detector-same-space, ";
    __int16 v56 = 2112;
    v57 = v32;
    __int16 v58 = 2112;
    v59 = v36;
    __int16 v60 = 2112;
    v61 = v37;
    _os_log_impl(&dword_25418E000, v33, OS_LOG_TYPE_INFO, "%s[%@], #sameSpaceCandidates=%@, #totalCandidatesTested=%@", buf, 0x2Au);

    id v26 = v35;
    id v28 = v34;
    id v25 = v38;
  }
  _Block_object_dispose(&v50, 8);
}

+ (id)sameSpaceMiLoScoresForCandidate:(id)a3 basedOnMiLoPrediction:(id)a4 andHistoryEventsAsc:(id)a5 andDate:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v10 canUse])
  {
    v13 = +[IRPreferences shared];
    id v14 = [v13 miloSameSpaceEventsTimeIntervalSeconds];
    [v14 doubleValue];
    id v16 = [v12 dateByAddingTimeInterval:-v15];

    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __128__IRCandidateClassificationDetectorSameSpace_sameSpaceMiLoScoresForCandidate_basedOnMiLoPrediction_andHistoryEventsAsc_andDate___block_invoke;
    v43[3] = &unk_26539F620;
    id v44 = v9;
    id v17 = v16;
    id v45 = v17;
    id v18 = [v11 allWhere:v43];
    uint64_t v39 = 0;
    id v40 = &v39;
    uint64_t v41 = 0x2020000000;
    uint64_t v42 = 0;
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x2020000000;
    uint64_t v38 = 0;
    v19 = +[IRPreferences shared];
    v20 = [v19 miloLslIsSameMiloThreshold];
    [v20 doubleValue];
    uint64_t v22 = v21;

    uint64_t v27 = MEMORY[0x263EF8330];
    uint64_t v28 = 3221225472;
    id v29 = __128__IRCandidateClassificationDetectorSameSpace_sameSpaceMiLoScoresForCandidate_basedOnMiLoPrediction_andHistoryEventsAsc_andDate___block_invoke_2;
    id v30 = &unk_26539F670;
    v32 = &v39;
    id v31 = v10;
    v33 = &v35;
    uint64_t v34 = v22;
    [v18 enumerateObjectsUsingBlock:&v27];
    v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v36[3], v27, v28, v29, v30);
    v24 = [NSNumber numberWithUnsignedInteger:v40[3]];
    id v25 = +[IRPair pairWithFirst:v23 second:v24];

    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(&v39, 8);
  }
  else
  {
    id v25 = +[IRPair pairWithFirst:&unk_2703AEFF0 second:&unk_2703AEFF0];
  }

  return v25;
}

uint64_t __128__IRCandidateClassificationDetectorSameSpace_sameSpaceMiLoScoresForCandidate_basedOnMiLoPrediction_andHistoryEventsAsc_andDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 candidateIdentifier];
  int v5 = [v4 isEqual:*(void *)(a1 + 32)];

  if (v5
    && ([v3 date],
        v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 isEarlierThan:*(void *)(a1 + 40)],
        v6,
        (v7 & 1) == 0))
  {
    id v9 = [v3 event];
    uint64_t v8 = [v9 isUserIntentionEvent];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void __128__IRCandidateClassificationDetectorSameSpace_sameSpaceMiLoScoresForCandidate_basedOnMiLoPrediction_andHistoryEventsAsc_andDate___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  unint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  uint64_t v8 = +[IRPreferences shared];
  id v9 = [v8 miloSameSpaceEventsNumberOfEventsToWatch];
  unsigned int v10 = [v9 unsignedIntValue];

  if (v7 >= v10)
  {
    *a4 = 1;
  }
  else
  {
    id v11 = [v6 miloPredictionEvent];
    id v12 = [v11 predictionId];
    v13 = [*(id *)(a1 + 32) predictionId];
    int v14 = [v12 isEqual:v13];

    if (v14)
    {
      ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    }
    else
    {
      double v15 = [*(id *)(a1 + 32) scores];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __128__IRCandidateClassificationDetectorSameSpace_sameSpaceMiLoScoresForCandidate_basedOnMiLoPrediction_andHistoryEventsAsc_andDate___block_invoke_3;
      v18[3] = &unk_26539F648;
      id v19 = v6;
      id v16 = [v15 firstWhere:v18];

      if (v16)
      {
        ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
        [v16 score];
        if (v17 > *(double *)(a1 + 56)) {
          ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        }
      }
    }
  }
}

uint64_t __128__IRCandidateClassificationDetectorSameSpace_sameSpaceMiLoScoresForCandidate_basedOnMiLoPrediction_andHistoryEventsAsc_andDate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 eventID];
  v4 = [*(id *)(a1 + 32) miloPredictionEvent];
  int v5 = [v4 label];
  uint64_t v6 = [v3 isEqual:v5];

  return v6;
}

void __173__IRCandidateClassificationDetectorSameSpace_adjustSameSpaceParametersForCandidates_withSystemState_andHistoryEventsAsc_andMiLoPrediction_andNearbyDevicesContainer_andDate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  int v5 = [v3 candidate];
  uint64_t v6 = [v4 _isSameSpaceForCandidate:v5 basedOnMiLoPrediction:*(void *)(a1 + 40) andHistoryEventsAsc:*(void *)(a1 + 48) andDate:*(void *)(a1 + 56)];

  unint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v3 candidate];
  uint64_t v9 = [v7 _isSameSpaceBrokeredDeviceForCandidate:v8 basedOnSystemState:*(void *)(a1 + 64) andHistoryEventsAsc:*(void *)(a1 + 48) andDate:*(void *)(a1 + 56)];

  unsigned int v10 = *(void **)(a1 + 32);
  id v11 = [v3 candidate];
  uint64_t v12 = [v10 _isSameSpaceBasedOnPDRFenceForCandidate:v11 basedOnSystemState:*(void *)(a1 + 64)];

  v13 = *(void **)(a1 + 32);
  int v14 = [v3 candidate];
  double v15 = [*(id *)(a1 + 72) nearbyDevices];
  id v16 = [v13 _isSameSpaceForCandidate:v14 basedOnNearbyDevices:v15 andExpiryDate:*(void *)(a1 + 80) isUWB:1];

  double v17 = *(void **)(a1 + 32);
  id v18 = [v3 candidate];
  id v19 = [*(id *)(a1 + 72) nearbyDevices];
  v20 = [v17 _isSameSpaceForCandidate:v18 basedOnNearbyDevices:v19 andExpiryDate:*(void *)(a1 + 88) isUWB:0];

  uint64_t v21 = 0;
  if (+[IRPlatformInfo isTVOS])
  {
    uint64_t v22 = *(void **)(a1 + 32);
    v23 = [v3 candidate];
    uint64_t v21 = [v22 _isSameSpaceForCandidate:v23 basedOnHistoryEventsAsc:*(void *)(a1 + 48) andDate:*(void *)(a1 + 56)];
  }
  v24 = +[IRPreferences shared];
  id v25 = [v24 miloRoomDetectionInCustomLOIEnabled];
  if ([v25 BOOLValue] & 1) != 0 || ((v6 ^ 1))
  {
  }
  else
  {
    id v46 = v20;
    id v26 = v16;
    uint64_t v27 = v21;
    uint64_t v28 = v6;
    uint64_t v29 = v12;
    uint64_t v30 = v9;
    int v31 = [*(id *)(a1 + 64) locationSemanticUserSpecificPlaceType];

    BOOL v32 = v31 == 5;
    uint64_t v9 = v30;
    uint64_t v12 = v29;
    uint64_t v6 = v28;
    uint64_t v21 = v27;
    id v16 = v26;
    v20 = v46;
    if (v32)
    {
      v33 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
      uint64_t v34 = *MEMORY[0x263F50090];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v49 = "#detector-same-space, ";
        __int16 v50 = 2112;
        v51 = v33;
        _os_log_impl(&dword_25418E000, v34, OS_LOG_TYPE_INFO, "%s[%@], MiLo room detection in custom LOI is disabled and LOI is custom, disabling sameSpaceBasedOnMiLo", buf, 0x16u);
      }

      uint64_t v6 = 0;
    }
  }
  [v3 setSameSpaceBasedOnMiLo:v6];
  [v3 setSameSpaceBasedOnBrokeredLOI:v9];
  [v3 setSameSpaceBasedOnUWB:v16 != 0];
  [v3 setSameSpaceBasedOnBLE:v20 != 0];
  [v3 setSameSpaceBasedOnPDRFence:v12];
  [v3 setUwbRange:v16];
  [v3 setBleRange:v20];
  [v3 setSameSpaceBasedOnHistory:v21];
  objc_msgSend(v3, "setIsSameSpace:", objc_msgSend(*(id *)(a1 + 32), "_isSameSpaceCandidate:", v3));
  if ([v3 isSameSpace])
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
    uint64_t v35 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
    v36 = (void *)*MEMORY[0x263F50090];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
    {
      log = v36;
      id v45 = [v3 candidate];
      uint64_t v37 = [v45 name];
      id v44 = [v3 candidate];
      [v44 candidateIdentifier];
      uint64_t v38 = v47 = v35;
      uint64_t v39 = [NSNumber numberWithBool:v6];
      id v40 = [NSNumber numberWithBool:v9];
      uint64_t v41 = [NSNumber numberWithBool:v12];
      uint64_t v42 = [NSNumber numberWithBool:v21];
      *(_DWORD *)buf = 136317442;
      v49 = "#detector-same-space, ";
      __int16 v50 = 2112;
      v51 = v47;
      __int16 v52 = 2112;
      uint64_t v53 = v37;
      __int16 v54 = 2112;
      v55 = v38;
      __int16 v56 = 2112;
      v57 = v39;
      __int16 v58 = 2112;
      v59 = v40;
      __int16 v60 = 2112;
      v61 = v41;
      __int16 v62 = 2112;
      v63 = v16;
      __int16 v64 = 2112;
      v65 = v20;
      __int16 v66 = 2112;
      v67 = v42;
      _os_log_impl(&dword_25418E000, log, OS_LOG_TYPE_INFO, "%s[%@], SameSpaceCandidate: name: %@, identifier: %@, MiLo: %@, BrokeredDeviceInLOI: %@, PDRFence: %@, uwbRange: %@, bleRange: %@, history: %@", buf, 0x66u);

      uint64_t v35 = v47;
    }
  }
}

- (BOOL)_isSameSpaceCandidate:(id)a3
{
  id v3 = a3;
  if (([v3 sameSpaceBasedOnMiLo] & 1) != 0
    || ([v3 sameSpaceBasedOnUWB] & 1) != 0
    || ([v3 sameSpaceBasedOnBLE] & 1) != 0
    || ([v3 sameSpaceBasedOnBrokeredLOI] & 1) != 0
    || ([v3 sameSpaceBasedOnPDRFence] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 sameSpaceBasedOnHistory];
  }

  return v4;
}

- (id)_isSameSpaceForCandidate:(id)a3 basedOnNearbyDevices:(id)a4 andExpiryDate:(id)a5 isUWB:(BOOL)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v29 = 0;
  uint64_t v30 = (double *)&v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0x408F400000000000;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy_;
  v27[4] = __Block_byref_object_dispose_;
  id v28 = 0;
  uint64_t v12 = [v9 nodes];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __112__IRCandidateClassificationDetectorSameSpace__isSameSpaceForCandidate_basedOnNearbyDevices_andExpiryDate_isUWB___block_invoke;
  v21[3] = &unk_26539F708;
  id v13 = v10;
  id v22 = v13;
  id v14 = v11;
  BOOL v26 = a6;
  id v23 = v14;
  v24 = v27;
  id v25 = &v29;
  [v12 enumerateObjectsUsingBlock:v21];

  double v15 = +[IRPreferences shared];
  id v16 = [v15 deviceRangeProximityThreshold];
  [v16 doubleValue];
  double v18 = v17;

  if (v30[3] <= v18)
  {
    id v19 = objc_msgSend(NSNumber, "numberWithDouble:");
  }
  else
  {
    id v19 = 0;
  }

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(&v29, 8);

  return v19;
}

void __112__IRCandidateClassificationDetectorSameSpace__isSameSpaceForCandidate_basedOnNearbyDevices_andExpiryDate_isUWB___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  v20 = __112__IRCandidateClassificationDetectorSameSpace__isSameSpaceForCandidate_basedOnNearbyDevices_andExpiryDate_isUWB___block_invoke_2;
  uint64_t v21 = &unk_26539F6C0;
  char v4 = *(void **)(a1 + 32);
  id v22 = *(id *)(a1 + 40);
  id v5 = v3;
  id v23 = v5;
  uint64_t v6 = [v4 allWhere:&v18];
  unint64_t v7 = v6;
  if (!*(unsigned char *)(a1 + 64))
  {
    id v11 = &__block_literal_global_15;
    goto LABEL_5;
  }
  uint64_t v8 = objc_msgSend(v6, "firstWhere:", &__block_literal_global_0, v18, v19, v20, v21, v22);
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v11 = &__block_literal_global_12;
LABEL_5:
    uint64_t v12 = objc_msgSend(v7, "firstWhere:", v11, v18, v19, v20, v21);
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
  double v15 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v15)
  {
    [v15 range];
    if (v16 <= *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) range];
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v17;
    }
  }
}

uint64_t __112__IRCandidateClassificationDetectorSameSpace__isSameSpaceForCandidate_basedOnNearbyDevices_andExpiryDate_isUWB___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [v3 measurementDate];
  char v5 = [v4 isEarlierThan:*(void *)(a1 + 32)];

  if (v5)
  {
    uint64_t v6 = 0;
  }
  else
  {
    unint64_t v7 = [*(id *)(a1 + 40) computedIdsIdentifier];
    uint64_t v8 = [v3 idsIdentifier];
    if ([v7 isEqual:v8])
    {
      uint64_t v6 = 1;
    }
    else
    {
      uint64_t v9 = [*(id *)(a1 + 40) computedMediaRemoteIdenfifier];
      id v10 = [v3 mediaRemoteIdentifier];
      if ([v9 isEqual:v10])
      {
        uint64_t v6 = 1;
      }
      else
      {
        id v11 = [*(id *)(a1 + 40) computedMediaRouteIdentifier];
        uint64_t v12 = [v3 mediaRemoteIdentifier];
        uint64_t v6 = [v11 isEqual:v12];
      }
    }
  }
  return v6;
}

uint64_t __112__IRCandidateClassificationDetectorSameSpace__isSameSpaceForCandidate_basedOnNearbyDevices_andExpiryDate_isUWB___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 proximityType];
  uint64_t v3 = [v2 isEqual:@"NIHomeDevice"];

  return v3;
}

BOOL __112__IRCandidateClassificationDetectorSameSpace__isSameSpaceForCandidate_basedOnNearbyDevices_andExpiryDate_isUWB___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = [a2 proximityType];
  BOOL v3 = +[IRProximityProvider isUWBProximityType:v2];

  return v3;
}

BOOL __112__IRCandidateClassificationDetectorSameSpace__isSameSpaceForCandidate_basedOnNearbyDevices_andExpiryDate_isUWB___block_invoke_5(uint64_t a1, void *a2)
{
  v2 = [a2 proximityType];
  BOOL v3 = +[IRProximityProvider isBLEProximityType:v2];

  return v3;
}

- (BOOL)_isSameSpaceForCandidate:(id)a3 basedOnMiLoPrediction:(id)a4 andHistoryEventsAsc:(id)a5 andDate:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = objc_opt_class();
  id v14 = [v12 candidateIdentifier];

  double v15 = [v13 sameSpaceMiLoScoresForCandidate:v14 basedOnMiLoPrediction:v11 andHistoryEventsAsc:v10 andDate:v9];

  double v16 = [v15 first];
  [v16 doubleValue];
  double v18 = v17;

  uint64_t v19 = [v15 second];
  [v19 doubleValue];
  double v21 = v20;

  if (v21 <= 0.0)
  {
    BOOL v25 = 0;
  }
  else
  {
    id v22 = +[IRPreferences shared];
    id v23 = [v22 miloSameSpaceRatioThreshold];
    [v23 doubleValue];
    BOOL v25 = v18 / v21 > v24;
  }
  return v25;
}

- (BOOL)_isSameSpaceBrokeredDeviceForCandidate:(id)a3 basedOnSystemState:(id)a4 andHistoryEventsAsc:(id)a5 andDate:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v9 isBrokeredDevice])
  {
    uint64_t v13 = +[IRPreferences shared];
    id v14 = [v13 loiSameSpaceEventsTimeIntervalSeconds];
    [v14 doubleValue];
    double v16 = [v12 dateByAddingTimeInterval:-v15];

    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __132__IRCandidateClassificationDetectorSameSpace__isSameSpaceBrokeredDeviceForCandidate_basedOnSystemState_andHistoryEventsAsc_andDate___block_invoke;
    v21[3] = &unk_26539F730;
    id v22 = v9;
    id v23 = v16;
    id v24 = v10;
    id v17 = v16;
    double v18 = [v11 firstWhere:v21];
    BOOL v19 = v18 != 0;
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

uint64_t __132__IRCandidateClassificationDetectorSameSpace__isSameSpaceBrokeredDeviceForCandidate_basedOnSystemState_andHistoryEventsAsc_andDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [v3 candidateIdentifier];
  char v5 = [*(id *)(a1 + 32) candidateIdentifier];
  int v6 = [v4 isEqual:v5];

  if (!v6) {
    goto LABEL_3;
  }
  unint64_t v7 = [v3 date];
  char v8 = [v7 isEarlierThan:*(void *)(a1 + 40)];

  if (v8) {
    goto LABEL_3;
  }
  id v11 = [v3 systemState];
  if ([v11 locationSemanticUserSpecificPlaceType] != 5)
  {
    uint64_t v9 = 0;
    goto LABEL_10;
  }
  int v12 = [*(id *)(a1 + 48) locationSemanticUserSpecificPlaceType];

  if (v12 == 5)
  {
    uint64_t v13 = [v3 systemState];
    id v14 = [v13 locationSemanticLoiIdentifier];
    double v15 = [*(id *)(a1 + 48) locationSemanticLoiIdentifier];
    int v16 = [v14 isEqual:v15];

    if (v16)
    {
      id v11 = [v3 event];
      uint64_t v9 = [v11 isUserIntentionEvent];
LABEL_10:

      goto LABEL_4;
    }
  }
LABEL_3:
  uint64_t v9 = 0;
LABEL_4:

  return v9;
}

- (BOOL)_isSameSpaceBasedOnPDRFenceForCandidate:(id)a3 basedOnSystemState:(id)a4
{
  id v5 = a4;
  if ([a3 isBrokeredDevice]) {
    char v6 = [v5 pdrFenceActive];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)_isSameSpaceForCandidate:(id)a3 basedOnHistoryEventsAsc:(id)a4 andDate:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = +[IRPreferences shared];
  id v11 = [v10 historySameSpaceEventsTimeIntervalSeconds];
  [v11 doubleValue];
  uint64_t v13 = [v8 dateByAddingTimeInterval:-v12];

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __103__IRCandidateClassificationDetectorSameSpace__isSameSpaceForCandidate_basedOnHistoryEventsAsc_andDate___block_invoke;
  v17[3] = &unk_26539F620;
  id v18 = v7;
  id v19 = v13;
  id v14 = v13;
  id v15 = v7;
  LOBYTE(v11) = [v9 containsObjectPassingTest:v17];

  return (char)v11;
}

uint64_t __103__IRCandidateClassificationDetectorSameSpace__isSameSpaceForCandidate_basedOnHistoryEventsAsc_andDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [v3 candidateIdentifier];
  id v5 = [*(id *)(a1 + 32) candidateIdentifier];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    id v7 = [v3 date];
    uint64_t v8 = [v7 isLaterThanOrEqualTo:*(void *)(a1 + 40)];

    if (v8)
    {
      id v9 = [v3 event];
      uint64_t v8 = [v9 isUserIntentionEvent];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

@end