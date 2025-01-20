@interface HDCloudSyncSharedSummaryPushOperation
- (void)main;
@end

@implementation HDCloudSyncSharedSummaryPushOperation

- (void)main
{
  v3 = [HDCloudSyncSharedSummaryPushPrepareOperation alloc];
  v4 = [(HDCloudSyncOperation *)self configuration];
  v5 = [(HDCloudSyncOperation *)v3 initWithConfiguration:v4 cloudState:0];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__HDCloudSyncSharedSummaryPushOperation_main__block_invoke;
  v7[3] = &unk_1E6302F28;
  v7[4] = self;
  [(HDCloudSyncOperation *)v5 setOnError:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__HDCloudSyncSharedSummaryPushOperation_main__block_invoke_278;
  v6[3] = &unk_1E6302F50;
  v6[4] = self;
  [(HDCloudSyncOperation *)v5 setOnSuccess:v6];
  [(HDCloudSyncOperation *)v5 start];
}

void __45__HDCloudSyncSharedSummaryPushOperation_main__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543618;
    uint64_t v8 = v6;
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to prepare for push operation: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  [*(id *)(a1 + 32) finishWithSuccess:0 error:v4];
}

void __45__HDCloudSyncSharedSummaryPushOperation_main__block_invoke_278(uint64_t a1, void *a2)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v37 = a2;
  uint64_t v3 = [v37 privateMetadataZone];
  if (v3
    && (id v4 = (void *)v3,
        [v37 pendingAndAcceptedParticipants],
        v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v4,
        v6))
  {
    int v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v37 allTransactions];
    __int16 v9 = [v37 pendingAndAcceptedParticipants];
    id v10 = [v37 authorizationIdentifiersByContactIdentifier];
    uint64_t v11 = [v37 privateMetadataZone];
    id v36 = v8;
    id v35 = v9;
    id v34 = v10;
    id v33 = v11;
    if (v7)
    {
      _HKInitializeLogging();
      v12 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        v13 = v12;
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = v7;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = [v36 count];
        _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [summary-sharing] Starting push for %lu transactions", buf, 0x16u);
      }
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v17 = +[HDMutableDatabaseTransactionContext contextForReadingProtectedData];
      v18 = [v7 configuration];
      v19 = [v18 accessibilityAssertion];
      v20 = [v17 contextWithAccessibilityAssertion:v19];

      [v20 setCacheScope:1];
      id v21 = objc_alloc_init(MEMORY[0x1E4F65D90]);
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __158__HDCloudSyncSharedSummaryPushOperation_performSharedSummaryPushWithTransactions_pendingAndAcceptedParticipants_authorizationIdentifiers_privateMetadataZone___block_invoke;
      v39[3] = &unk_1E6302F78;
      v39[4] = v7;
      id v22 = v15;
      id v40 = v22;
      id v23 = v16;
      id v41 = v23;
      id v24 = v14;
      id v42 = v24;
      [v21 setDidFinish:v39];
      [v21 beginTask];
      v25 = [v7 profile];
      v26 = [v25 database];
      id v38 = 0;
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __158__HDCloudSyncSharedSummaryPushOperation_performSharedSummaryPushWithTransactions_pendingAndAcceptedParticipants_authorizationIdentifiers_privateMetadataZone___block_invoke_2_289;
      v44 = &unk_1E6302FA0;
      id v45 = v35;
      id v46 = v34;
      v47 = v7;
      id v48 = v33;
      id v27 = v24;
      id v49 = v27;
      id v50 = v36;
      id v28 = v22;
      id v51 = v28;
      id v29 = v23;
      id v52 = v29;
      id v30 = v21;
      id v53 = v30;
      char v31 = [v26 performTransactionWithContext:v20 error:&v38 block:buf inaccessibilityHandler:0];
      id v32 = v38;

      [v30 finishTask];
      if ((v31 & 1) == 0) {
        [v7 finishWithSuccess:0 error:v32];
      }
    }
  }
  else
  {
    [*(id *)(a1 + 32) finishWithSuccess:1 error:0];
  }
}

void __158__HDCloudSyncSharedSummaryPushOperation_performSharedSummaryPushWithTransactions_pendingAndAcceptedParticipants_authorizationIdentifiers_privateMetadataZone___block_invoke(uint64_t a1)
{
  v2 = [HDCloudSyncSharedSummaryPushPruningOperation alloc];
  uint64_t v3 = [*(id *)(a1 + 32) configuration];
  id v4 = [(HDCloudSyncSharedSummaryPushPruningOperation *)v2 initWithConfiguration:v3 allRecordsToSave:*(void *)(a1 + 40) participantZoneIDsToPush:*(void *)(a1 + 48) existingTransactionRecordsByZoneID:*(void *)(a1 + 56)];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __158__HDCloudSyncSharedSummaryPushOperation_performSharedSummaryPushWithTransactions_pendingAndAcceptedParticipants_authorizationIdentifiers_privateMetadataZone___block_invoke_2;
  v6[3] = &unk_1E62F2950;
  v6[4] = *(void *)(a1 + 32);
  [(HDCloudSyncOperation *)v4 setOnError:v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __158__HDCloudSyncSharedSummaryPushOperation_performSharedSummaryPushWithTransactions_pendingAndAcceptedParticipants_authorizationIdentifiers_privateMetadataZone___block_invoke_286;
  v5[3] = &unk_1E62F2928;
  v5[4] = *(void *)(a1 + 32);
  [(HDCloudSyncOperation *)v4 setOnSuccess:v5];
  [(HDCloudSyncOperation *)v4 start];
}

void __158__HDCloudSyncSharedSummaryPushOperation_performSharedSummaryPushWithTransactions_pendingAndAcceptedParticipants_authorizationIdentifiers_privateMetadataZone___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543618;
    uint64_t v8 = v6;
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [summary-sharing] Failed to prune %{public}@", (uint8_t *)&v7, 0x16u);
  }
  [*(id *)(a1 + 32) finishWithSuccess:0 error:v4];
}

uint64_t __158__HDCloudSyncSharedSummaryPushOperation_performSharedSummaryPushWithTransactions_pendingAndAcceptedParticipants_authorizationIdentifiers_privateMetadataZone___block_invoke_286(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithSuccess:1 error:0];
}

uint64_t __158__HDCloudSyncSharedSummaryPushOperation_performSharedSummaryPushWithTransactions_pendingAndAcceptedParticipants_authorizationIdentifiers_privateMetadataZone___block_invoke_2_289(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v155 = *MEMORY[0x1E4F143B8];
  long long v125 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v113 = [obj countByEnumeratingWithState:&v125 objects:v143 count:16];
  if (v113)
  {
    uint64_t v112 = *(void *)v126;
    uint64_t v109 = v1;
    do
    {
      uint64_t v2 = 0;
      do
      {
        if (*(void *)v126 != v112) {
          objc_enumerationMutation(obj);
        }
        uint64_t v3 = *(void **)(*((void *)&v125 + 1) + 8 * v2);
        id v4 = *(void **)(v1 + 40);
        v5 = [v3 contactIdentifier];
        uint64_t v6 = [v4 objectForKeyedSubscript:v5];

        if (v6)
        {
          id v8 = *(id *)(v1 + 48);
          int v7 = *(void **)(v1 + 56);
          id v9 = v3;
          if (v8)
          {
            id v10 = v7;
            uint64_t v11 = objc_opt_class();
            v129[0] = 0;
            v12 = [v10 recordsForClass:v11 error:v129];

            id v13 = v129[0];
            id v14 = v13;
            if (v12)
            {
              *(void *)buf = MEMORY[0x1E4F143A8];
              *(void *)&buf[8] = 3221225472;
              *(void *)&buf[16] = __87__HDCloudSyncSharedSummaryPushOperation__authorizationRecordForParticipant_zone_error___block_invoke;
              v153 = &unk_1E62F50B8;
              id v15 = v9;
              id v154 = v15;
              id v16 = objc_msgSend(v12, "hk_firstObjectPassingTest:", buf);
              v17 = v16;
              if (v16)
              {
                id v18 = v16;
                id v8 = 0;
              }
              else
              {
                v26 = v6;
                id v27 = (void *)MEMORY[0x1E4F28C58];
                id v28 = [v15 UUID];
                objc_msgSend(v27, "hk_error:format:", 720, @"Authorization Record for participant with UUID %@ not found", v28);
                id v29 = (id)objc_claimAutoreleasedReturnValue();
                id v8 = v29;
                if (v29) {
                  id v30 = v29;
                }

                uint64_t v6 = v26;
                v17 = 0;
              }

              id v25 = v154;
            }
            else
            {
              id v24 = v13;
              if (v24)
              {
                id v8 = v24;
                v17 = 0;
                id v25 = v8;
              }
              else
              {
                id v8 = 0;
                id v25 = 0;
                v17 = 0;
              }
            }
          }
          else
          {
            v17 = 0;
          }

          id v31 = v8;
          id v32 = v31;
          if (v17)
          {
            id v110 = v31;
            v114 = v6;
            uint64_t v111 = v2;
            id v33 = (void *)MEMORY[0x1E4F1A320];
            id v34 = [*(id *)(v1 + 48) configuration];
            id v35 = [v34 repository];
            id v36 = [v35 syncCircleIdentifier];
            v121 = v9;
            id v37 = [v9 UUID];
            id v38 = objc_msgSend(v33, "hd_sharedSummaryZoneIDWithSyncCircleIdentifier:userIdentifier:", v36, v37);

            v39 = *(void **)(v1 + 48);
            id v124 = 0;
            id v40 = v38;
            if (v39)
            {
              id v41 = [v39 configuration];
              id v42 = [v41 repository];
              v43 = [v42 primaryCKContainer];
              v44 = [v43 containerIdentifier];
              id v45 = +[HDCloudSyncZoneIdentifier identifierForZone:v40 container:v44 scope:2];

              id v46 = [v39 configuration];
              v47 = [v46 cachedCloudState];
              *(void *)buf = MEMORY[0x1E4F143A8];
              *(void *)&buf[8] = 3221225472;
              *(void *)&buf[16] = __77__HDCloudSyncSharedSummaryPushOperation__participantZoneForIdentifier_error___block_invoke;
              v153 = &unk_1E62F5FD8;
              id v48 = v45;
              id v154 = v48;
              id v49 = [v47 zonesByIdentifierWithError:&v124 filter:buf];

              if (v49)
              {
                id v50 = [v49 objectForKeyedSubscript:v48];
                id v51 = v50;
                uint64_t v2 = v111;
                uint64_t v6 = v114;
                if (v50)
                {
                  id v52 = v50;
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 724, @"Zone not found for participant ZoneID %@", v40);
                  id v57 = (id)objc_claimAutoreleasedReturnValue();
                  v58 = v57;
                  if (v57) {
                    id v124 = v57;
                  }
                }
                uint64_t v1 = v109;
              }
              else
              {
                id v51 = 0;
                uint64_t v2 = v111;
                uint64_t v6 = v114;
                uint64_t v1 = v109;
              }
            }
            else
            {
              id v51 = 0;
              uint64_t v2 = v111;
              uint64_t v6 = v114;
            }

            id v59 = v124;
            if (v51)
            {
              uint64_t v60 = objc_opt_class();
              id v123 = 0;
              v61 = [v51 recordsForClass:v60 error:&v123];
              id v107 = v123;
              if (v61)
              {
                v100 = v51;
                v103 = v61;
                v62 = objc_msgSend(v61, "hk_map:", &__block_literal_global_129);
                v63 = [*(id *)(v1 + 64) objectForKeyedSubscript:v40];

                v102 = v17;
                id v104 = v59;
                if (v63)
                {
                  v64 = [*(id *)(v1 + 64) objectForKeyedSubscript:v40];
                  [v64 addObjectsFromArray:v62];
                }
                else
                {
                  v64 = [MEMORY[0x1E4F1CA80] setWithArray:v62];
                  [*(id *)(v1 + 64) setObject:v64 forKeyedSubscript:v40];
                }
                v73 = v40;

                v120 = *(void **)(v1 + 48);
                v74 = *(void **)(v1 + 80);
                v75 = *(void **)(v1 + 88);
                v76 = *(void **)(v1 + 96);
                id v77 = *(id *)(v1 + 72);
                id v78 = v62;
                v101 = v73;
                id v79 = v73;
                v80 = v77;
                id v81 = v79;
                id v122 = v121;
                id v118 = v114;
                id v117 = v74;
                id v116 = v75;
                id v82 = v76;
                if (v120)
                {
                  v83 = [v120 configuration];
                  v84 = [v83 repository];
                  v85 = [v84 cloudSyncShimProvider];
                  v115 = [v85 sharedSummariesShim];

                  [v82 beginTask];
                  long long v139 = 0u;
                  long long v140 = 0u;
                  long long v141 = 0u;
                  long long v142 = 0u;
                  v99 = v80;
                  id v119 = v80;
                  uint64_t v86 = [v119 countByEnumeratingWithState:&v139 objects:buf count:16];
                  if (v86)
                  {
                    uint64_t v87 = v86;
                    uint64_t v88 = *(void *)v140;
                    do
                    {
                      for (uint64_t i = 0; i != v87; ++i)
                      {
                        if (*(void *)v140 != v88) {
                          objc_enumerationMutation(v119);
                        }
                        v90 = *(void **)(*((void *)&v139 + 1) + 8 * i);
                        v136[0] = MEMORY[0x1E4F143A8];
                        v136[1] = 3221225472;
                        v136[2] = __186__HDCloudSyncSharedSummaryPushOperation_createRecordsToSaveWithTransactions_transactionRecords_participantZoneID_participant_authorizationIdentifiers_allRecordsToSave_zoneIDs_taskGroup___block_invoke;
                        v136[3] = &unk_1E6302FC8;
                        id v91 = v81;
                        id v137 = v91;
                        v138 = v90;
                        if (objc_msgSend(v78, "hk_containsObjectPassingTest:", v136))
                        {
                          _HKInitializeLogging();
                          v92 = (void *)*MEMORY[0x1E4F29FA8];
                          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
                          {
                            v93 = v92;
                            v94 = [v90 UUID];
                            v95 = [v94 UUIDString];
                            v96 = [v122 contactIdentifier];
                            *(_DWORD *)v144 = 138544131;
                            v145 = v120;
                            __int16 v146 = 2114;
                            v147 = v95;
                            __int16 v148 = 2113;
                            v149 = v96;
                            __int16 v150 = 2114;
                            id v151 = v81;
                            _os_log_impl(&dword_1BCB7D000, v93, OS_LOG_TYPE_DEFAULT, "%{public}@: [summary-sharing] The transaction %{public}@ for participant %{private}@ has already been pushed to zone %{public}@. Skipping...", v144, 0x2Au);
                          }
                        }
                        else
                        {
                          [v82 beginTask];
                          v129[0] = (id)MEMORY[0x1E4F143A8];
                          v129[1] = (id)3221225472;
                          v129[2] = __186__HDCloudSyncSharedSummaryPushOperation_createRecordsToSaveWithTransactions_transactionRecords_participantZoneID_participant_authorizationIdentifiers_allRecordsToSave_zoneIDs_taskGroup___block_invoke_296;
                          v129[3] = &unk_1E6303018;
                          v129[4] = v120;
                          id v130 = v91;
                          v131 = v90;
                          id v132 = v117;
                          id v133 = v116;
                          id v134 = v122;
                          id v135 = v82;
                          [v115 summariesFromTransaction:v90 authorizationIdentifiers:v118 completion:v129];
                        }
                      }
                      uint64_t v87 = [v119 countByEnumeratingWithState:&v139 objects:buf count:16];
                    }
                    while (v87);
                  }

                  [v82 finishTask];
                  uint64_t v1 = v109;
                  uint64_t v2 = v111;
                  v80 = v99;
                }

                uint64_t v6 = v114;
                id v40 = v101;
                v17 = v102;
                id v51 = v100;
                v61 = v103;
                id v59 = v104;
              }
              else
              {
                _HKInitializeLogging();
                v69 = (void *)*MEMORY[0x1E4F29FA8];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
                {
                  id v106 = v59;
                  uint64_t v70 = *(void *)(v1 + 48);
                  v71 = v69;
                  v72 = [v51 zoneIdentifier];
                  *(_DWORD *)buf = 138543874;
                  *(void *)&buf[4] = v70;
                  *(_WORD *)&buf[12] = 2114;
                  *(void *)&buf[14] = v72;
                  *(_WORD *)&buf[22] = 2114;
                  id v59 = v106;
                  v153 = v107;
                  _os_log_error_impl(&dword_1BCB7D000, v71, OS_LOG_TYPE_ERROR, "%{public}@ [summary-sharing] Failed to get transaction records for %{public}@, %{public}@", buf, 0x20u);

                  v61 = 0;
                }
              }
            }
            else
            {
              _HKInitializeLogging();
              v65 = (void *)*MEMORY[0x1E4F29FA8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
              {
                id v105 = v59;
                uint64_t v66 = *(void *)(v1 + 48);
                v67 = v65;
                v68 = [v121 contactIdentifier];
                *(_DWORD *)buf = 138543875;
                *(void *)&buf[4] = v66;
                id v59 = v105;
                *(_WORD *)&buf[12] = 2113;
                *(void *)&buf[14] = v68;
                *(_WORD *)&buf[22] = 2113;
                v153 = v105;
                _os_log_error_impl(&dword_1BCB7D000, v67, OS_LOG_TYPE_ERROR, "%{public}@: [summary-sharing] Unable to find zone for participant %{private}@. Error %{private}@", buf, 0x20u);
              }
            }

            id v32 = v110;
          }
          else
          {
            _HKInitializeLogging();
            id v53 = (void *)*MEMORY[0x1E4F29FA8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
            {
              uint64_t v54 = *(void *)(v1 + 48);
              v55 = v53;
              v56 = [v9 contactIdentifier];
              *(_DWORD *)buf = 138543875;
              *(void *)&buf[4] = v54;
              *(_WORD *)&buf[12] = 2113;
              *(void *)&buf[14] = v56;
              *(_WORD *)&buf[22] = 2114;
              v153 = v32;
              _os_log_error_impl(&dword_1BCB7D000, v55, OS_LOG_TYPE_ERROR, "%{public}@: [summary-sharing] Unable to find authorization record for participant %{private}@. Error %{public}@", buf, 0x20u);
            }
          }
        }
        else
        {
          _HKInitializeLogging();
          v19 = (void *)*MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
          {
            uint64_t v20 = *(void *)(v1 + 48);
            id v21 = v19;
            id v22 = [v3 contactIdentifier];
            id v23 = [v3 UUID];
            *(_DWORD *)buf = 138543875;
            *(void *)&buf[4] = v20;
            *(_WORD *)&buf[12] = 2113;
            *(void *)&buf[14] = v22;
            *(_WORD *)&buf[22] = 2114;
            v153 = v23;
            _os_log_error_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_ERROR, "%{public}@ [summary-sharing] No authorization identifiers found for participant %{private}@ with UUID %{public}@", buf, 0x20u);
          }
        }

        ++v2;
      }
      while (v2 != v113);
      uint64_t v97 = [obj countByEnumeratingWithState:&v125 objects:v143 count:16];
      uint64_t v113 = v97;
    }
    while (v97);
  }

  return 1;
}

id __158__HDCloudSyncSharedSummaryPushOperation_performSharedSummaryPushWithTransactions_pendingAndAcceptedParticipants_authorizationIdentifiers_privateMetadataZone___block_invoke_292(uint64_t a1, void *a2)
{
  id v2 = a2;

  return v2;
}

uint64_t __186__HDCloudSyncSharedSummaryPushOperation_createRecordsToSaveWithTransactions_transactionRecords_participantZoneID_participant_authorizationIdentifiers_allRecordsToSave_zoneIDs_taskGroup___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 record];
  v5 = [v4 recordID];
  uint64_t v6 = [v5 zoneID];
  int v7 = [v6 isEqual:*(void *)(a1 + 32)];

  id v8 = [v3 UUID];
  id v9 = [v8 UUIDString];
  id v10 = [*(id *)(a1 + 40) UUID];
  uint64_t v11 = [v10 UUIDString];
  if (v9 == v11)
  {
    int v18 = 1;
  }
  else
  {
    v12 = [*(id *)(a1 + 40) UUID];
    id v13 = [v12 UUIDString];
    if (v13)
    {
      uint64_t v20 = [v3 UUID];
      [v20 UUIDString];
      id v14 = v22 = v7;
      id v15 = [*(id *)(a1 + 40) UUID];
      [v15 UUIDString];
      id v21 = v8;
      v17 = id v16 = v12;
      int v18 = [v14 isEqualToString:v17];

      v12 = v16;
      id v8 = v21;

      int v7 = v22;
    }
    else
    {
      int v18 = 0;
    }
  }
  return v7 & v18;
}

void __186__HDCloudSyncSharedSummaryPushOperation_createRecordsToSaveWithTransactions_transactionRecords_participantZoneID_participant_authorizationIdentifiers_allRecordsToSave_zoneIDs_taskGroup___block_invoke_296(uint64_t a1, int a2, void *a3, void *a4, void *a5)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (a2)
  {
    if ([v9 count])
    {
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __186__HDCloudSyncSharedSummaryPushOperation_createRecordsToSaveWithTransactions_transactionRecords_participantZoneID_participant_authorizationIdentifiers_allRecordsToSave_zoneIDs_taskGroup___block_invoke_2;
      v51[3] = &unk_1E6302FF0;
      v12 = *(void **)(a1 + 40);
      v51[4] = *(void *)(a1 + 32);
      id v52 = v12;
      id v48 = objc_msgSend(v9, "hk_map:", v51);
      _HKInitializeLogging();
      id v13 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        id v15 = *(void **)(a1 + 48);
        id v16 = v13;
        v17 = [v15 UUID];
        int v18 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        uint64_t v55 = v14;
        __int16 v56 = 2114;
        id v57 = v17;
        __int16 v58 = 2114;
        id v59 = v18;
        _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [summary-sharing] Adding transaction to push with UUID %{public}@ to participant zone %{public}@", buf, 0x20u);
      }
      id v49 = v11;
      v19 = *(void **)(a1 + 40);
      uint64_t v20 = *(void *)(a1 + 32);
      id v21 = *(id *)(a1 + 48);
      if (v20)
      {
        int v22 = (void *)MEMORY[0x1E4F28DB0];
        id v23 = v19;
        id v24 = v10;
        id v25 = [v21 metadata];
        id v53 = 0;
        v26 = [v22 archivedDataWithRootObject:v25 requiringSecureCoding:1 error:&v53];
        id v50 = v53;

        if (!v26)
        {
          _HKInitializeLogging();
          id v27 = (void *)*MEMORY[0x1E4F29FA8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
          {
            log = v27;
            id v45 = [v21 UUID];
            id v46 = [v45 UUIDString];
            *(_DWORD *)buf = 138543874;
            uint64_t v55 = v20;
            __int16 v56 = 2114;
            id v57 = v50;
            __int16 v58 = 2114;
            id v59 = v46;
            _os_log_error_impl(&dword_1BCB7D000, log, OS_LOG_TYPE_ERROR, "%{public}@: [summary-sharing] Error archiving metadata %{public}@ for transaction %{public}@.", buf, 0x20u);
          }
        }
        id v28 = [HDCloudSyncSharedSummaryTransactionRecord alloc];
        id v29 = [v21 UUID];
        id v30 = [v21 sourceDeviceIdentifier];
        id v31 = [(HDCloudSyncSharedSummaryTransactionRecord *)v28 initInZone:v23 UUID:v29 sourceDeviceIdentifier:v30 summaryIdentifiers:v24 metadata:v26];

        id v32 = [v31 record];
      }
      else
      {
        id v32 = 0;
      }

      [*(id *)(a1 + 56) addObjectsFromArray:v48];
      [*(id *)(a1 + 56) addObject:v32];
      [*(id *)(a1 + 64) addObject:*(void *)(a1 + 40)];

      id v11 = v49;
    }
    else
    {
      _HKInitializeLogging();
      id v34 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v35 = *(void *)(a1 + 32);
        id v36 = *(void **)(a1 + 48);
        id v37 = v34;
        id v38 = [v36 UUID];
        v39 = [v38 UUIDString];
        id v40 = [*(id *)(a1 + 72) contactIdentifier];
        *(_DWORD *)buf = 138543875;
        uint64_t v55 = v35;
        __int16 v56 = 2114;
        id v57 = v39;
        __int16 v58 = 2113;
        id v59 = v40;
        _os_log_impl(&dword_1BCB7D000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@: [summary-sharing] No summary records to add for transaction %{public}@ and participant %{private}@", buf, 0x20u);
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    id v33 = (void *)*MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v41 = *(void *)(a1 + 32);
      id v42 = *(void **)(a1 + 72);
      v43 = v33;
      v44 = [v42 contactIdentifier];
      *(_DWORD *)buf = 138543875;
      uint64_t v55 = v41;
      __int16 v56 = 2114;
      id v57 = v11;
      __int16 v58 = 2113;
      id v59 = v44;
      _os_log_error_impl(&dword_1BCB7D000, v43, OS_LOG_TYPE_ERROR, "%{public}@: [summary-sharing] Error %{public}@ enumerating summary records for participant %{private}@", buf, 0x20u);
    }
  }
  [*(id *)(a1 + 80) finishTask];
}

id __186__HDCloudSyncSharedSummaryPushOperation_createRecordsToSaveWithTransactions_transactionRecords_participantZoneID_participant_authorizationIdentifiers_allRecordsToSave_zoneIDs_taskGroup___block_invoke_2(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32))
  {
    id v3 = *(id *)(a1 + 40);
    id v4 = a2;
    int v18 = [HDCloudSyncSharedSummaryRecord alloc];
    id v16 = [v4 UUID];
    id v15 = [v4 package];
    v5 = [v4 name];
    uint64_t v6 = [v4 version];
    int v7 = [v4 compatibilityVersion];
    v17 = [v4 objectTypes];
    id v8 = [v17 allObjects];
    id v9 = [v4 authorizationIdentifiers];
    id v10 = [v9 allObjects];
    id v11 = [v4 summaryData];

    id v12 = [(HDCloudSyncSharedSummaryRecord *)v18 initInZone:v3 UUID:v16 package:v15 name:v5 version:v6 compatibilityVersion:v7 objectTypes:v8 authorizationIdentifiers:v10 summaryData:v11];
    id v13 = [v12 record];
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

uint64_t __87__HDCloudSyncSharedSummaryPushOperation__authorizationRecordForParticipant_zone_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 UUID];
  v5 = [v4 UUIDString];
  uint64_t v6 = [*(id *)(a1 + 32) authorizationRecordIdentifier];
  int v7 = [v6 UUIDString];
  if (v5 == v7)
  {
    uint64_t v14 = 1;
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) authorizationRecordIdentifier];
    id v9 = [v8 UUIDString];
    if (v9)
    {
      id v16 = [v3 UUID];
      id v10 = [v16 UUIDString];
      id v11 = [*(id *)(a1 + 32) authorizationRecordIdentifier];
      [v11 UUIDString];
      v17 = v4;
      id v13 = v12 = v8;
      uint64_t v14 = [v10 isEqualToString:v13];

      id v8 = v12;
      id v4 = v17;
    }
    else
    {
      uint64_t v14 = 0;
    }
  }
  return v14;
}

uint64_t __77__HDCloudSyncSharedSummaryPushOperation__participantZoneForIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(a1 + 32)];
}

@end