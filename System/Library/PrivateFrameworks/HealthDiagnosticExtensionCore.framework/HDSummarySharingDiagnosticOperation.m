@interface HDSummarySharingDiagnosticOperation
- (id)reportFilename;
- (void)_reportDiagnosticsForProfileIdentifier:(id)a3;
- (void)_reportHeaderWithProfileIdentifiers:(id)a3;
- (void)_reportInvitationsForPrimaryProfile;
- (void)_reportProfileInformationForProfileIdentifier:(id)a3;
- (void)_reportSharedSummariesForProfileIdentifier:(id)a3 committedTransactions:(BOOL)a4;
- (void)run;
@end

@implementation HDSummarySharingDiagnosticOperation

- (id)reportFilename
{
  return @"HealthSummarySharing.txt";
}

- (void)run
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F0A410]);
  v4 = (void *)[objc_alloc(MEMORY[0x263F0A620]) initWithHealthStore:v3];
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  id v24 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __42__HDSummarySharingDiagnosticOperation_run__block_invoke;
  v16[3] = &unk_264866E00;
  v16[4] = self;
  v18 = &v19;
  v6 = v5;
  v17 = v6;
  [v4 fetchAllProfilesWithCompletion:v16];
  dispatch_time_t v7 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v6, v7)) {
    [(HDDiagnosticOperation *)self log:@"ERROR: Timed out attempting to fetch profiles"];
  }
  [(HDSummarySharingDiagnosticOperation *)self _reportHeaderWithProfileIdentifiers:v20[5]];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v8 = (id)v20[5];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        -[HDSummarySharingDiagnosticOperation _reportDiagnosticsForProfileIdentifier:](self, "_reportDiagnosticsForProfileIdentifier:", *(void *)(*((void *)&v12 + 1) + 8 * v11++), (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v25 count:16];
    }
    while (v9);
  }

  _Block_object_dispose(&v19, 8);
}

void __42__HDSummarySharingDiagnosticOperation_run__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (!v5) {
    [*(id *)(a1 + 32) appendFormat:@"Error listing profiles: %@", a3];
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_time_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_reportHeaderWithProfileIdentifiers:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(HDDiagnosticOperation *)self appendString:@"Active invitations:"];
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = objc_alloc_init(MEMORY[0x263F0A410]);
  dispatch_time_t v7 = (void *)[objc_alloc(MEMORY[0x263F0A7F8]) initWithHealthStore:v6];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __75__HDSummarySharingDiagnosticOperation__reportHeaderWithProfileIdentifiers___block_invoke;
  v23[3] = &unk_264866E28;
  id v8 = v7;
  id v24 = v8;
  v25 = self;
  uint64_t v9 = v5;
  uint64_t v26 = v9;
  [v8 fetchSharingEntriesWithCompletion:v23];
  dispatch_time_t v10 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v9, v10)) {
    [(HDDiagnosticOperation *)self log:@"ERROR: Timed out attempting to fetch active invitations"];
  }
  [(HDDiagnosticOperation *)self appendNewline];
  [(HDDiagnosticOperation *)self appendString:@"Summary Sharing profiles:"];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = v4;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (!v12)
  {

LABEL_15:
    [(HDDiagnosticOperation *)self appendString:@"No Summary Sharing profiles"];
    goto LABEL_16;
  }
  uint64_t v13 = v12;
  id v18 = v6;
  char v14 = 0;
  uint64_t v15 = *(void *)v20;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v20 != v15) {
        objc_enumerationMutation(v11);
      }
      v17 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      if ([v17 type] == 2)
      {
        [(HDDiagnosticOperation *)self appendFormat:@"%@", v17];
        char v14 = 1;
      }
    }
    uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
  }
  while (v13);

  id v6 = v18;
  if ((v14 & 1) == 0) {
    goto LABEL_15;
  }
LABEL_16:
  [(HDDiagnosticOperation *)self appendNewline];
  [(HDDiagnosticOperation *)self appendStrongSeparator];
}

intptr_t __75__HDSummarySharingDiagnosticOperation__reportHeaderWithProfileIdentifiers___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (!a2)
  {
    [*(id *)(a1 + 40) appendFormat:@"Error fetching active invitations: %@", a3];
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [*(id *)(a1 + 32) sharingEntries];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v5)
  {

LABEL_17:
    [*(id *)(a1 + 40) appendString:@"There are no active summary sharing invitations"];
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
  uint64_t v6 = v5;
  char v7 = 0;
  uint64_t v8 = *(void *)v15;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v4);
      }
      dispatch_time_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
      if (![v10 type] && (!objc_msgSend(v10, "status") || objc_msgSend(v10, "status") == 1))
      {
        id v11 = *(void **)(a1 + 40);
        uint64_t v12 = _HKSummarySharingEntryToDiagnosticsString(v10);
        [v11 appendString:v12];

        char v7 = 1;
      }
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  }
  while (v6);

  if ((v7 & 1) == 0) {
    goto LABEL_17;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)_reportDiagnosticsForProfileIdentifier:(id)a3
{
  id v4 = a3;
  [(HDDiagnosticOperation *)self appendNewline];
  [(HDDiagnosticOperation *)self appendString:@"    ****"];
  [(HDDiagnosticOperation *)self appendFormat:@"    **** %@", v4];
  [(HDDiagnosticOperation *)self appendString:@"    ****"];
  [(HDDiagnosticOperation *)self appendNewline];
  if ([v4 type] == 1)
  {
    [(HDDiagnosticOperation *)self appendSeparator];
    [(HDSummarySharingDiagnosticOperation *)self _reportInvitationsForPrimaryProfile];
  }
  else
  {
    [(HDSummarySharingDiagnosticOperation *)self _reportProfileInformationForProfileIdentifier:v4];
  }
  [(HDDiagnosticOperation *)self appendSeparator];
  [(HDSummarySharingDiagnosticOperation *)self _reportSharedSummariesForProfileIdentifier:v4 committedTransactions:1];
  [(HDSummarySharingDiagnosticOperation *)self _reportSharedSummariesForProfileIdentifier:v4 committedTransactions:0];
  [(HDDiagnosticOperation *)self appendStrongSeparator];
}

- (void)_reportProfileInformationForProfileIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = objc_alloc_init(MEMORY[0x263F0A410]);
  char v7 = (void *)[objc_alloc(MEMORY[0x263F0A620]) initWithHealthStore:v6];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __85__HDSummarySharingDiagnosticOperation__reportProfileInformationForProfileIdentifier___block_invoke;
  uint64_t v13 = &unk_264866E50;
  long long v14 = self;
  uint64_t v8 = v5;
  long long v15 = v8;
  [v7 fetchSharingInformationForProfileIdentifier:v4 completion:&v10];

  dispatch_time_t v9 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v8, v9)) {
    [(HDDiagnosticOperation *)self log:@"ERROR: Timed out attempting to fetch profile sharing information", v10, v11, v12, v13, v14];
  }
}

void __85__HDSummarySharingDiagnosticOperation__reportProfileInformationForProfileIdentifier___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v10) {
    [*(id *)(a1 + 32) appendFormat:@"Creation date: %@", v10];
  }
  if (v7)
  {
    dispatch_time_t v9 = @"Owner participant set";
LABEL_5:
    [*(id *)(a1 + 32) appendString:v9];
    goto LABEL_7;
  }
  if (!v8)
  {
    dispatch_time_t v9 = @"Owner participant not set";
    goto LABEL_5;
  }
LABEL_7:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_reportInvitationsForPrimaryProfile
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  [(HDDiagnosticOperation *)self appendString:@"Sharing Invitations:"];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x2810000000;
  v49[3] = &unk_22944ED53;
  int v50 = 0;
  dispatch_semaphore_t v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  id v6 = objc_alloc_init(MEMORY[0x263F0A410]);
  id v7 = (void *)[objc_alloc(MEMORY[0x263F0A7F8]) initWithHealthStore:v6];
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __74__HDSummarySharingDiagnosticOperation__reportInvitationsForPrimaryProfile__block_invoke;
  v41[3] = &unk_264866EA0;
  id v42 = v7;
  id v22 = v6;
  id v43 = v22;
  id v8 = v5;
  v44 = v8;
  v48 = v49;
  id v24 = v3;
  id v45 = v24;
  v46 = self;
  id v26 = v4;
  id v47 = v26;
  id v23 = v42;
  [v42 fetchSharingEntriesWithCompletion:v41];
  dispatch_time_t v9 = dispatch_time(0, 10000000000);
  if (dispatch_group_wait(v8, v9)) {
    [(HDDiagnosticOperation *)self log:@"ERROR: Timed out attempting collect invitations"];
  }
  if ([v24 count])
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    obuint64_t j = v24;
    uint64_t v10 = [obj countByEnumeratingWithState:&v37 objects:v53 count:16];
    if (v10)
    {
      uint64_t v25 = *(void *)v38;
      do
      {
        uint64_t v27 = v10;
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v38 != v25) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          uint64_t v13 = _HKSummarySharingEntryToDiagnosticsString(v12);
          [(HDDiagnosticOperation *)self appendString:v13];

          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          long long v14 = [obj objectForKeyedSubscript:v12];
          uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v52 count:16];
          if (v15)
          {
            uint64_t v16 = *(void *)v34;
            do
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v34 != v16) {
                  objc_enumerationMutation(v14);
                }
                [(HDDiagnosticOperation *)self appendFormat:@"  %@", *(void *)(*((void *)&v33 + 1) + 8 * j), v22];
              }
              uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v52 count:16];
            }
            while (v15);
          }

          long long v31 = 0u;
          long long v32 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          id v18 = [v26 objectForKeyedSubscript:v12];
          uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v51 count:16];
          if (v19)
          {
            uint64_t v20 = *(void *)v30;
            do
            {
              for (uint64_t k = 0; k != v19; ++k)
              {
                if (*(void *)v30 != v20) {
                  objc_enumerationMutation(v18);
                }
                [(HDDiagnosticOperation *)self appendFormat:@"  %@ (delete on commit)", *(void *)(*((void *)&v29 + 1) + 8 * k)];
              }
              uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v51 count:16];
            }
            while (v19);
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v37 objects:v53 count:16];
      }
      while (v10);
    }
  }
  else
  {
    [(HDDiagnosticOperation *)self appendString:@"There are no shared summary invitations in profile"];
  }
  [(HDDiagnosticOperation *)self appendNewline];

  _Block_object_dispose(v49, 8);
}

void __74__HDSummarySharingDiagnosticOperation__reportInvitationsForPrimaryProfile__block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (a2)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v4 = [*(id *)(a1 + 32) sharingEntries];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v28 != v7) {
            objc_enumerationMutation(v4);
          }
          dispatch_time_t v9 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if (![v9 type])
          {
            id v10 = objc_alloc(MEMORY[0x263F0A740]);
            uint64_t v11 = [v9 UUID];
            uint64_t v12 = (void *)[v10 initForInvitationUUID:v11];

            uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F0A738]) initWithHealthStore:*(void *)(a1 + 40) recipientIdentifier:v12];
            dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
            v21[0] = MEMORY[0x263EF8330];
            v21[1] = 3221225472;
            v21[2] = __74__HDSummarySharingDiagnosticOperation__reportInvitationsForPrimaryProfile__block_invoke_2;
            v21[3] = &unk_264866E78;
            uint64_t v26 = *(void *)(a1 + 80);
            id v22 = *(id *)(a1 + 56);
            id v23 = v9;
            uint64_t v24 = *(void *)(a1 + 64);
            id v25 = *(id *)(a1 + 48);
            [v13 fetchSharingAuthorizationsWithCompletion:v21];
            dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
            v15[0] = MEMORY[0x263EF8330];
            v15[1] = 3221225472;
            v15[2] = __74__HDSummarySharingDiagnosticOperation__reportInvitationsForPrimaryProfile__block_invoke_3;
            v15[3] = &unk_264866E78;
            long long v14 = *(void **)(a1 + 72);
            uint64_t v20 = *(void *)(a1 + 80);
            id v16 = v14;
            long long v17 = v9;
            uint64_t v18 = *(void *)(a1 + 64);
            id v19 = *(id *)(a1 + 48);
            [v13 fetchSharingAuthorizationsMarkedForDeletionWithCompletion:v15];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v6);
    }
  }
  else
  {
    [*(id *)(a1 + 64) appendFormat:@"Error fetching sharing entries for primary profile: %@", a3];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __74__HDSummarySharingDiagnosticOperation__reportInvitationsForPrimaryProfile__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v9)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 64) + 8) + 32));
    [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:*(void *)(a1 + 40)];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 64) + 8) + 32));
  }
  else
  {
    uint64_t v6 = *(void **)(a1 + 48);
    uint64_t v7 = [*(id *)(a1 + 40) UUID];
    id v8 = [v7 UUIDString];
    [v6 appendFormat:@"Error fetching authorizations for sharing entry %@: %@", v8, v5];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __74__HDSummarySharingDiagnosticOperation__reportInvitationsForPrimaryProfile__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v9)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 64) + 8) + 32));
    [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:*(void *)(a1 + 40)];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 64) + 8) + 32));
  }
  else
  {
    uint64_t v6 = *(void **)(a1 + 48);
    uint64_t v7 = [*(id *)(a1 + 40) UUID];
    id v8 = [v7 UUIDString];
    [v6 appendFormat:@"Error fetching authorizations marked for deletion for sharing entry %@: %@", v8, v5];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

- (void)_reportSharedSummariesForProfileIdentifier:(id)a3 committedTransactions:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = @"Uncommitted";
  BOOL v35 = v4;
  if (v4) {
    uint64_t v7 = @"Committed";
  }
  [(HDDiagnosticOperation *)self appendFormat:@"Shared Summary %@ Transactions:", v7];
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x2810000000;
  v51[3] = &unk_22944ED53;
  int v52 = 0;
  id v9 = dispatch_group_create();
  dispatch_group_enter(v9);
  id v10 = objc_alloc_init(MEMORY[0x263F0A410]);
  [v10 setProfileIdentifier:v6];
  [v10 resume];
  uint64_t v11 = @"uncommitted";
  if (v4) {
    uint64_t v11 = @"committed";
  }
  uint64_t v12 = v11;
  id v13 = objc_alloc(MEMORY[0x263F0A728]);
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __104__HDSummarySharingDiagnosticOperation__reportSharedSummariesForProfileIdentifier_committedTransactions___block_invoke;
  v44[3] = &unk_264866EF0;
  v44[4] = self;
  uint64_t v32 = v12;
  id v45 = v32;
  id v30 = v6;
  id v46 = v30;
  dispatch_group_t group = v9;
  dispatch_group_t v47 = group;
  int v50 = v51;
  id v14 = v8;
  id v48 = v14;
  id v15 = v10;
  id v49 = v15;
  uint64_t v16 = [v13 initWithCommittedTransactions:v35 handler:v44];
  [v15 executeQuery:v16];
  long long v31 = (void *)v16;
  dispatch_time_t v17 = dispatch_time(0, 10000000000);
  if (dispatch_group_wait(group, v17)) {
    [(HDDiagnosticOperation *)self log:@"ERROR: Timed out attempting collect transaction list and summaries"];
  }
  if (![v14 count]) {
    [(HDDiagnosticOperation *)self appendFormat:@"Found no %@ transactions", v32];
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v18 = v14;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v40 objects:v54 count:16];
  if (v19)
  {
    uint64_t v34 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v41 != v34) {
          objc_enumerationMutation(v18);
        }
        uint64_t v21 = *(void *)(*((void *)&v40 + 1) + 8 * i);
        if (v35)
        {
          id v22 = [*(id *)(*((void *)&v40 + 1) + 8 * i) metadata];
          id v23 = [v22 objectForKeyedSubscript:@"HKSharedSummaryTransactionMetadataKeyDateCommitted"];

          uint64_t v24 = [(HDDiagnosticOperation *)self stringFromDate:v23];
          [(HDDiagnosticOperation *)self appendFormat:@"%@ commit date=%@", v21, v24, v30, v31];
        }
        else
        {
          [(HDDiagnosticOperation *)self appendFormat:@"%@", v21];
        }
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v25 = [v18 objectForKeyedSubscript:v21];
        uint64_t v26 = [v25 countByEnumeratingWithState:&v36 objects:v53 count:16];
        id v27 = v15;
        if (v26)
        {
          uint64_t v28 = *(void *)v37;
          do
          {
            for (uint64_t j = 0; j != v26; ++j)
            {
              if (*(void *)v37 != v28) {
                objc_enumerationMutation(v25);
              }
              [(HDDiagnosticOperation *)self appendFormat:@"  %@", *(void *)(*((void *)&v36 + 1) + 8 * j)];
            }
            uint64_t v26 = [v25 countByEnumeratingWithState:&v36 objects:v53 count:16];
          }
          while (v26);
        }

        id v15 = v27;
      }
      uint64_t v19 = [v18 countByEnumeratingWithState:&v40 objects:v54 count:16];
    }
    while (v19);
  }

  [(HDDiagnosticOperation *)self appendNewline];
  _Block_object_dispose(v51, 8);
}

void __104__HDSummarySharingDiagnosticOperation__reportSharedSummariesForProfileIdentifier_committedTransactions___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v16 = a2;
  id v7 = a3;
  id v8 = a4;
  if (!v7) {
    [*(id *)(a1 + 32) appendFormat:@"Error querying for %@ transactions for profile %@: %@", *(void *)(a1 + 40), *(void *)(a1 + 48), v8];
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 56));
        id v14 = objc_alloc(MEMORY[0x263F0A718]);
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __104__HDSummarySharingDiagnosticOperation__reportSharedSummariesForProfileIdentifier_committedTransactions___block_invoke_2;
        v18[3] = &unk_264866EC8;
        uint64_t v23 = *(void *)(a1 + 80);
        id v19 = *(id *)(a1 + 64);
        uint64_t v20 = v13;
        uint64_t v21 = *(void *)(a1 + 32);
        id v22 = *(id *)(a1 + 56);
        id v15 = (void *)[v14 initWithTransaction:v13 package:0 resultsHandler:v18];
        [*(id *)(a1 + 72) executeQuery:v15];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v10);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __104__HDSummarySharingDiagnosticOperation__reportSharedSummariesForProfileIdentifier_committedTransactions___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v11 = a3;
  id v7 = a5;
  if (v11)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 64) + 8) + 32));
    [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:*(void *)(a1 + 40)];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 64) + 8) + 32));
  }
  else
  {
    id v8 = *(void **)(a1 + 48);
    uint64_t v9 = [*(id *)(a1 + 40) UUID];
    uint64_t v10 = [v9 UUIDString];
    [v8 appendFormat:@"Error querying summaries for transaction %@: %@", v10, v7];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

@end