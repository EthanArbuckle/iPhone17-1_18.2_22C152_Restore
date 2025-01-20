@interface IRCandidateClassificationDetectorFiltered
- (BOOL)_isAggressiveFilteredCandidate:(id)a3 withSystemState:(id)a4 Candidates:(id)a5 andDate:(id)a6;
- (BOOL)_isCandidateIndirectlyUsed:(id)a3 withCandidates:(id)a4 andDate:(id)a5;
- (BOOL)_isConservativeFilteredCandidate:(id)a3 withSystemState:(id)a4;
- (void)adjustFilteredParametersForCandidates:(id)a3 withSystemState:(id)a4 andDate:(id)a5;
@end

@implementation IRCandidateClassificationDetectorFiltered

- (void)adjustFilteredParametersForCandidates:(id)a3 withSystemState:(id)a4 andDate:(id)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v27 = a5;
  id obj = v8;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v10 = [v8 countByEnumeratingWithState:&v29 objects:v43 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        objc_msgSend(v16, "setIsConservativeFiltered:", -[IRCandidateClassificationDetectorFiltered _isConservativeFilteredCandidate:withSystemState:](self, "_isConservativeFilteredCandidate:withSystemState:", v16, v9));
        v17 = +[IRFeatureFlags sharedFeatureFlags];
        int v18 = [v17 isAggressiveFilteringEnabled];

        if (v18) {
          uint64_t v19 = [(IRCandidateClassificationDetectorFiltered *)self _isAggressiveFilteredCandidate:v16 withSystemState:v9 Candidates:obj andDate:v27];
        }
        else {
          uint64_t v19 = [v16 isConservativeFiltered];
        }
        [v16 setIsFiltered:v19];
        v13 += [v16 isFiltered];
        v12 += [v16 isConservativeFiltered];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v29 objects:v43 count:16];
    }
    while (v11);
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v13 = 0;
  }
  v20 = dispatch_get_specific((const void *)*MEMORY[0x263F50120]);
  v21 = (void *)*MEMORY[0x263F50090];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F50090], OS_LOG_TYPE_INFO))
  {
    v22 = NSNumber;
    v23 = v21;
    v24 = [v22 numberWithUnsignedInteger:v13];
    v25 = [NSNumber numberWithUnsignedInteger:v12];
    v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(obj, "count"));
    *(_DWORD *)buf = 136316162;
    v34 = "#detector-filtered, ";
    __int16 v35 = 2112;
    v36 = v20;
    __int16 v37 = 2112;
    v38 = v24;
    __int16 v39 = 2112;
    v40 = v25;
    __int16 v41 = 2112;
    v42 = v26;
    _os_log_impl(&dword_25418E000, v23, OS_LOG_TYPE_INFO, "%s[%@], #filteredCandidates=%@, #conservativeFilteredCandidates=%@, #totalCandidatesTested=%@", buf, 0x34u);
  }
}

- (BOOL)_isConservativeFilteredCandidate:(id)a3 withSystemState:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 candidate];
  char v8 = [v7 isSameICloudWithSystemState:v6];

  if ((v8 & 1) != 0
    || ([v5 candidate],
        id v9 = objc_claimAutoreleasedReturnValue(),
        [v9 lastUsedDate],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v10))
  {
    char v11 = 0;
  }
  else
  {
    uint64_t v13 = [v5 candidate];
    if ([v13 isMac])
    {

      char v11 = 1;
    }
    else
    {
      uint64_t v14 = [v5 candidate];
      char v15 = [v14 isSameWiFi];

      char v11 = v15 ^ 1;
    }
  }

  return v11;
}

- (BOOL)_isAggressiveFilteredCandidate:(id)a3 withSystemState:(id)a4 Candidates:(id)a5 andDate:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v43 = a5;
  id v11 = a6;
  uint64_t v12 = [v9 candidate];
  uint64_t v13 = [v12 lastUsedDate];
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    char v15 = [v9 candidate];
    v16 = [v15 lastUsedDate];
    [v11 timeIntervalSinceDate:v16];
    double v18 = v17;
    uint64_t v19 = +[IRPreferences shared];
    v20 = [v19 timeInSecondsWithoutUsageToAggressiveFiltering];
    [v20 doubleValue];
    double v22 = v21;

    if (v18 < v22)
    {
LABEL_11:
      LOBYTE(v36) = 0;
      __int16 v37 = v43;
      goto LABEL_15;
    }
  }
  else
  {
  }
  v23 = objc_msgSend(v9, "candidate", self);
  v24 = [v23 firstSeenDate];
  if (v24)
  {
    v25 = [v9 candidate];
    v26 = [v25 firstSeenDate];
    [v11 timeIntervalSinceDate:v26];
    double v28 = v27;
    long long v29 = +[IRPreferences shared];
    long long v30 = [v29 timeInSecondsToBeClassifiedAsNewCandidateForAggressiveFiltering];
    [v30 doubleValue];
    BOOL v32 = v28 >= v31;
  }
  else
  {
    BOOL v32 = 1;
  }

  v33 = [v9 candidate];
  int v34 = [v33 isSameWiFi];

  int v35 = [v10 locationSemanticUserSpecificPlaceType];
  if (!v32 && v34 && v35 == 1) {
    goto LABEL_11;
  }
  v38 = [v9 candidate];
  char v39 = [v38 containsUnknownAVODTarget];

  __int16 v37 = v43;
  if (v39) {
    LOBYTE(v36) = 0;
  }
  else {
    int v36 = [v42 _isCandidateIndirectlyUsed:v9 withCandidates:v43 andDate:v11] ^ 1;
  }
LABEL_15:

  return v36;
}

- (BOOL)_isCandidateIndirectlyUsed:(id)a3 withCandidates:(id)a4 andDate:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v7 candidate];
  id v11 = [v10 nodes];
  unint64_t v12 = [v11 count];

  if (v12 >= 2)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v14 = [v7 candidate];
    char v15 = [v14 nodes];

    uint64_t v13 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v13)
    {
      uint64_t v16 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v16) {
            objc_enumerationMutation(v15);
          }
          double v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v19 = [v18 avOutpuDeviceIdentifier];

          if (v19)
          {
            v22[0] = MEMORY[0x263EF8330];
            v22[1] = 3221225472;
            v22[2] = __95__IRCandidateClassificationDetectorFiltered__isCandidateIndirectlyUsed_withCandidates_andDate___block_invoke;
            v22[3] = &unk_26539FBF0;
            v22[4] = v18;
            id v23 = v9;
            char v20 = [v8 containsObjectPassingTest:v22];

            if (v20)
            {
              LOBYTE(v13) = 1;
              goto LABEL_14;
            }
          }
        }
        uint64_t v13 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

BOOL __95__IRCandidateClassificationDetectorFiltered__isCandidateIndirectlyUsed_withCandidates_andDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 candidate];
  id v5 = [v4 nodes];
  if ([v5 count] == 1)
  {
    id v6 = [*(id *)(a1 + 32) avOutpuDeviceIdentifier];
    id v7 = [v3 candidate];
    id v8 = [v7 nodes];
    id v9 = [v8 anyObject];
    id v10 = [v9 avOutpuDeviceIdentifier];
    if ([v6 isEqual:v10])
    {
      id v11 = [v3 candidate];
      unint64_t v12 = [v11 lastUsedDate];
      if (v12)
      {
        uint64_t v13 = *(void **)(a1 + 40);
        id v23 = v12;
        double v22 = [v3 candidate];
        double v21 = [v22 lastUsedDate];
        [v13 timeIntervalSinceDate:v21];
        double v15 = v14;
        +[IRPreferences shared];
        uint64_t v16 = v24 = v11;
        [v16 timeInSecondsToBeClassifiedAsNewCandidateForAggressiveFiltering];
        double v17 = v25 = v6;
        [v17 doubleValue];
        BOOL v19 = v15 < v18;

        id v6 = v25;
        id v11 = v24;

        unint64_t v12 = v23;
      }
      else
      {
        BOOL v19 = 0;
      }
    }
    else
    {
      BOOL v19 = 0;
    }
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

@end