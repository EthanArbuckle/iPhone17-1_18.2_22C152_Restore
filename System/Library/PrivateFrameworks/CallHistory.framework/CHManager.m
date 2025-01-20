@interface CHManager
+ (id)limitingCallKindsForCallType:(unsigned int)a3;
+ (unsigned)CHCallStatusForCallWithDuration:(double)a3 isOriginated:(BOOL)a4 isAnswered:(BOOL)a5;
- (BOOL)cacheIsDirty;
- (BOOL)canLoadOlderRecentCalls;
- (BOOL)finishedLoadingAllCalls;
- (BOOL)generateSyncTransactions;
- (BOOL)reCoalesce;
- (BOOL)shouldLoadOlderCalls;
- (BOOL)showsFaceTimeAudioCalls;
- (BOOL)showsFaceTimeVideoCalls;
- (BOOL)showsProtectedApps;
- (BOOL)showsTelephonyCalls;
- (CHFeatureFlags)featureFlags;
- (CHManager)init;
- (CHManager)initWithContactStore:(id)a3;
- (CHManager)initWithContactStore:(id)a3 featureFlags:(id)a4 protectedAppProvider:(id)a5 queue:(id)a6;
- (CHManager)initWithFetchingLimitsDictionary:(id)a3 andCoalescingStrategy:(id)a4 andPostFetchingPredicate:(id)a5 withQueue:(id)a6;
- (CHManager)initWithQueue:(id)a3;
- (CHPhoneBookIOSManager)phoneBookManager;
- (CHProtectedAppProvider)protectedAppProvider;
- (NSArray)limitingCallKinds;
- (NSArray)recentCalls;
- (NSArray)uncoalescedRecentCallsSync;
- (NSArray)uncoalescedUnFilteredRecentCalls;
- (NSDate)limitingEndDate;
- (NSDate)limitingStartDate;
- (NSPredicate)postFetchingPredicate;
- (NSPredicate)preFetchingPredicate;
- (NSSet)allowedProtectedAppBundleIDs;
- (NSString)coalescingStrategy;
- (SyncManagerProtocol)syncManager;
- (double)callTimersGetIncoming;
- (double)callTimersGetLifetime;
- (double)callTimersGetOutgoing;
- (id)applyPredicate:(id)a3 toCalls:(id)a4;
- (id)callIdentifiersWithPredicate:(id)a3 limit:(unint64_t)a4 offset:(unint64_t)a5 batchSize:(unint64_t)a6;
- (id)callsWithLimits:(id)a3 limit:(unint64_t)a4 offset:(unint64_t)a5 batchSize:(unint64_t)a6;
- (id)callsWithPredicate:(id)a3 limit:(unint64_t)a4 offset:(unint64_t)a5 batchSize:(unint64_t)a6;
- (id)coalescedCallsWithCalls:(id)a3 usingStrategy:(id)a4;
- (id)coalescedCallsWithPredicate:(id)a3 limit:(unint64_t)a4 offset:(unint64_t)a5 batchSize:(unint64_t)a6;
- (id)fetchRecentCallsSyncWithCoalescing:(BOOL)a3;
- (id)getLimitsDictionary;
- (id)getLimitsDictionaryForPrivateHeader;
- (id)latestCallMatchingNormalizedRemoteParticipantHandleValues:(id)a3;
- (id)latestRecentCallMatchingPredicate:(id)a3;
- (id)loadOlderRecentCalls;
- (id)loadOlderRecentCallsSyncWithCoalescing:(BOOL)a3;
- (id)loadOlderRecentCallsWithPredicate:(id)a3;
- (id)protectedBundleIDsExcludingCurrentProcess;
- (id)recentCallsWithPredicate:(id)a3;
- (id)unCoalesceCall:(id)a3;
- (int64_t)callHistoryDBFetchLimit;
- (int64_t)deleteCallsWithPredicate:(id)a3;
- (int64_t)numberOfUnseenMissedCalls;
- (int64_t)setRead:(BOOL)a3 forCallsWithPredicate:(id)a4;
- (unint64_t)callCountWithPredicate:(id)a3;
- (unint64_t)coalescedCallCountWithPredicate:(id)a3;
- (unint64_t)countCallsWithPredicate:(id)a3;
- (unint64_t)countCallsWithPredicateSync:(id)a3;
- (unsigned)limitingCallTypes;
- (void)addArrayToCallHistory:(id)a3;
- (void)addArrayToCallHistory:(id)a3 withCompletion:(id)a4;
- (void)addMultipleCallsToCallHistory:(id)a3;
- (void)addMultipleCallsToCallHistoryWithTransactions:(id)a3;
- (void)addToCallHistory:(id)a3;
- (void)callTimersReset;
- (void)clearDatabase;
- (void)currentLocaleChanged:(id)a3;
- (void)dealloc;
- (void)deleteAllCalls;
- (void)deleteAllCallsSync;
- (void)deleteCall:(id)a3;
- (void)deleteCallAtIndex:(unint64_t)a3;
- (void)deleteCalls:(id)a3 withCompletion:(id)a4;
- (void)deleteCallsWithPredicate:(id)a3 completion:(id)a4;
- (void)deleteTheseCalls:(id)a3;
- (void)deleteTheseCallsSync:(id)a3;
- (void)flush;
- (void)handleCallHistoryContactStoreChangedInternalNotification:(id)a3;
- (void)handleCallHistoryDatabaseChangedInternalNotification:(id)a3;
- (void)markAllCallsAsReadWithPredicate:(id)a3;
- (void)protectedAppsChanged;
- (void)registerForNotifications;
- (void)resetCalls;
- (void)setAllowedProtectedAppBundleIDs:(id)a3;
- (void)setCacheIsDirty:(BOOL)a3;
- (void)setCoalescingStrategy:(id)a3;
- (void)setDefaultInitValues;
- (void)setFinishedLoadingAllCalls:(BOOL)a3;
- (void)setGenerateSyncTransactions:(BOOL)a3;
- (void)setInitialLimitingCallKinds:(id)a3;
- (void)setLimitingCallKinds:(id)a3;
- (void)setLimitingCallKindsSync:(id)a3;
- (void)setLimitingCallTypes:(unsigned int)a3;
- (void)setLimitingCallTypesSync:(unsigned int)a3;
- (void)setLimitingEndDate:(id)a3;
- (void)setLimitingStartDate:(id)a3;
- (void)setNumberOfUnseenMissedCalls:(int64_t)a3;
- (void)setOutgoingLocalParticipantUUID:(id)a3 forRecentCallsMatchingPredicate:(id)a4;
- (void)setPostFetchingPredicate:(id)a3;
- (void)setPreFetchingPredicate:(id)a3;
- (void)setReCoalesce:(BOOL)a3;
- (void)setRead:(BOOL)a3 forCallsWithPredicate:(id)a4 completion:(id)a5;
- (void)setRecentCalls:(id)a3;
- (void)setShouldLoadOlderCalls:(BOOL)a3;
- (void)setShowsFaceTimeAudioCalls:(BOOL)a3;
- (void)setShowsFaceTimeVideoCalls:(BOOL)a3;
- (void)setShowsProtectedApps:(BOOL)a3;
- (void)setShowsTelephonyCalls:(BOOL)a3;
- (void)setSyncManager:(id)a3;
- (void)setUncoalescedRecentCalls:(id)a3;
- (void)setUncoalescedUnFilteredRecentCalls:(id)a3;
- (void)updateAutoAnsweredReasonFor:(id)a3 with:(int64_t)a4;
- (void)updateBytesOfDataUsedFor:(id)a3 with:(id)a4;
- (void)updateEmergencyMediaItemFor:(id)a3 with:(id)a4;
- (void)updateMessageStatusFor:(id)a3 with:(id)a4;
@end

@implementation CHManager

- (id)loadOlderRecentCallsSyncWithCoalescing:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  v6 = (void *)MEMORY[0x1BA9CD070]();
  if (![(CHManager *)self shouldLoadOlderCalls])
  {
LABEL_42:
    v44 = [(CHSynchronizedLoggable *)self logHandle];
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      v45 = NSStringFromSelector(a2);
      NSUInteger v46 = [(NSArray *)self->_recentCalls count];
      *(_DWORD *)buf = 138543618;
      uint64_t v57 = (uint64_t)v45;
      __int16 v58 = 2048;
      NSUInteger v59 = v46;
      _os_log_impl(&dword_1B8E4A000, v44, OS_LOG_TYPE_DEFAULT, "<== %{public}@ returns %lu calls", buf, 0x16u);
    }
    p_recentCalls = &self->_recentCalls;
    goto LABEL_45;
  }
  p_recentCalls = &self->_recentCalls;
  if (!self->_recentCalls || [(CHManager *)self cacheIsDirty]) {
    id v8 = [(CHManager *)self fetchRecentCallsSyncWithCoalescing:v3];
  }
  if ([(NSArray *)*p_recentCalls count])
  {
    v9 = [(CHSynchronizedLoggable *)self logHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (v3) {
        v10 = @"Yes";
      }
      else {
        v10 = @"No";
      }
      v11 = +[CHRecentCall callTypeAsString:self->_limitingCallTypes];
      *(_DWORD *)buf = 138543618;
      uint64_t v57 = (uint64_t)v10;
      __int16 v58 = 2114;
      NSUInteger v59 = (NSUInteger)v11;
      _os_log_impl(&dword_1B8E4A000, v9, OS_LOG_TYPE_DEFAULT, "loadOlderRecentCallsSyncWithCoalescing: Fetching from DB and updating cache. And coalescing: %{public}@, With callType limit: %{public}@", buf, 0x16u);
    }
    v12 = [(CHManager *)self getLimitsDictionary];
    v13 = [(CHManager *)self callsWithLimits:v12 limit:100 offset:[(NSArray *)self->_uncoalescedUnFilteredRecentCalls count] batchSize:0];
    v14 = [(CHSynchronizedLoggable *)self logHandle];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v13 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v57 = v15;
      _os_log_impl(&dword_1B8E4A000, v14, OS_LOG_TYPE_DEFAULT, "SyncManager returned %lu calls", buf, 0xCu);
    }

    if ([v13 count])
    {
      uncoalescedRecentCalls = self->_uncoalescedRecentCalls;
      v49 = v12;
      if (uncoalescedRecentCalls)
      {
        v17 = [(NSArray *)uncoalescedRecentCalls arrayByAddingObjectsFromArray:v13];
      }
      else
      {
        v17 = (NSArray *)[v13 copy];
      }
      v18 = self->_uncoalescedRecentCalls;
      self->_uncoalescedRecentCalls = v17;

      v19 = [(CHManager *)self applyPredicate:self->_postFetchingPredicate toCalls:self->_uncoalescedRecentCalls];
      v20 = self->_uncoalescedRecentCalls;
      self->_uncoalescedRecentCalls = v19;

      uncoalescedUnFilteredRecentCalls = self->_uncoalescedUnFilteredRecentCalls;
      if (uncoalescedUnFilteredRecentCalls)
      {
        uint64_t v22 = [(NSArray *)uncoalescedUnFilteredRecentCalls arrayByAddingObjectsFromArray:v13];
      }
      else
      {
        uint64_t v22 = [v13 copy];
      }
      v23 = (void *)v22;
      [(CHManager *)self setUncoalescedUnFilteredRecentCalls:v22];

      v24 = [(CHManager *)self uncoalescedUnFilteredRecentCalls];
      unint64_t v25 = [v24 count];
      unint64_t v26 = [(CHManager *)self callHistoryDBFetchLimit];

      if (v25 >= v26) {
        [(CHManager *)self setFinishedLoadingAllCalls:1];
      }
      if (v3)
      {
        v27 = [(NSArray *)*p_recentCalls lastObject];
        if (v27)
        {
          v28 = [(NSArray *)*p_recentCalls lastObject];
          v55 = v28;
          v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
        }
        else
        {
          v29 = (void *)MEMORY[0x1E4F1CBF0];
        }

        v31 = [v29 arrayByAddingObjectsFromArray:v13];

        v30 = [(CHManager *)self coalescedCallsWithCalls:v31 usingStrategy:self->_coalescingStrategy];

        v32 = -[NSArray subarrayWithRange:](*p_recentCalls, "subarrayWithRange:", 0, [(NSArray *)*p_recentCalls count] - 1);
        if ([v32 count])
        {
          v33 = [v32 arrayByAddingObjectsFromArray:v30];
        }
        else
        {
          v33 = v30;
        }
        v34 = *p_recentCalls;
        *p_recentCalls = v33;

        uint64_t v35 = [(CHManager *)self applyPredicate:self->_postFetchingPredicate toCalls:*p_recentCalls];
        v36 = *p_recentCalls;
        *p_recentCalls = (NSArray *)v35;
      }
      else
      {
        v30 = [(CHSynchronizedLoggable *)self logHandle];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B8E4A000, v30, OS_LOG_TYPE_DEFAULT, "User fetching without coalescing!", buf, 2u);
        }
      }

      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      v37 = *p_recentCalls;
      uint64_t v38 = [(NSArray *)v37 countByEnumeratingWithState:&v50 objects:v54 count:16];
      if (v38)
      {
        uint64_t v39 = v38;
        uint64_t v40 = *(void *)v51;
        do
        {
          for (uint64_t i = 0; i != v39; ++i)
          {
            if (*(void *)v51 != v40) {
              objc_enumerationMutation(v37);
            }
            v42 = *(void **)(*((void *)&v50 + 1) + 8 * i);
            v43 = [(CHManager *)self phoneBookManager];
            [v42 setPhoneBookManager:v43];
          }
          uint64_t v39 = [(NSArray *)v37 countByEnumeratingWithState:&v50 objects:v54 count:16];
        }
        while (v39);
      }

      v12 = v49;
    }
    else
    {
      [(CHManager *)self setFinishedLoadingAllCalls:1];
    }
    [(CHManager *)self setCacheIsDirty:0];
    [(CHManager *)self setShouldLoadOlderCalls:0];

    goto LABEL_42;
  }
LABEL_45:
  v47 = *p_recentCalls;
  return v47;
}

- (id)fetchRecentCallsSyncWithCoalescing:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  v6 = (void *)MEMORY[0x1BA9CD070]();
  p_recentCalls = (id *)&self->_recentCalls;
  if (!self->_recentCalls || [(CHManager *)self cacheIsDirty])
  {
    id v8 = [(CHSynchronizedLoggable *)self logHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (v3) {
        v9 = @"Yes";
      }
      else {
        v9 = @"No";
      }
      v10 = +[CHRecentCall callTypeAsString:self->_limitingCallTypes];
      *(_DWORD *)buf = 138543618;
      uint64_t v67 = (uint64_t)v9;
      __int16 v68 = 2114;
      uint64_t v69 = (uint64_t)v10;
      _os_log_impl(&dword_1B8E4A000, v8, OS_LOG_TYPE_DEFAULT, "Fetching from DB and updating cache. And coalescing: %{public}@, With callType limit: %{public}@", buf, 0x16u);
    }
    v11 = [(CHManager *)self getLimitsDictionary];
    v12 = [(CHManager *)self featureFlags];
    int v13 = [v12 increaseCallHistoryEnabled];

    if (v13)
    {
      uncoalescedUnFilteredRecentCalls = self->_uncoalescedUnFilteredRecentCalls;
      if (uncoalescedUnFilteredRecentCalls)
      {
        unint64_t v15 = [(NSArray *)uncoalescedUnFilteredRecentCalls count];
        if (v15 <= 0x64) {
          uint64_t v16 = 100;
        }
        else {
          uint64_t v16 = v15;
        }
      }
      else
      {
        uint64_t v16 = 100;
      }
      uint64_t v27 = [(CHManager *)self callsWithLimits:v11 limit:v16 offset:0 batchSize:0];
      id v17 = *p_recentCalls;
      id *p_recentCalls = (id)v27;
    }
    else
    {
      id v17 = [(CHManager *)self syncManager];
      uint64_t v18 = [v17 fetchObjectsWithLimits:v11];
      id v19 = *p_recentCalls;
      id *p_recentCalls = (id)v18;
    }
    v28 = [(CHSynchronizedLoggable *)self logHandle];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = [*p_recentCalls count];
      *(_DWORD *)buf = 134217984;
      uint64_t v67 = v29;
      _os_log_impl(&dword_1B8E4A000, v28, OS_LOG_TYPE_DEFAULT, "SyncManager returned %lu calls", buf, 0xCu);
    }

    if (!*p_recentCalls) {
      goto LABEL_44;
    }
    uint64_t v60 = v6;
    v30 = (NSArray *)[*p_recentCalls copy];
    uncoalescedRecentCalls = self->_uncoalescedRecentCalls;
    self->_uncoalescedRecentCalls = v30;

    v32 = [(CHManager *)self applyPredicate:self->_postFetchingPredicate toCalls:self->_uncoalescedRecentCalls];
    v33 = self->_uncoalescedRecentCalls;
    self->_uncoalescedRecentCalls = v32;

    v34 = (void *)[*p_recentCalls copy];
    [(CHManager *)self setUncoalescedUnFilteredRecentCalls:v34];

    uint64_t v35 = [(CHManager *)self featureFlags];
    v36 = a2;
    if ([v35 increaseCallHistoryEnabled])
    {
      v37 = [(CHManager *)self uncoalescedUnFilteredRecentCalls];
      unint64_t v38 = [v37 count];
      unint64_t v39 = [(CHManager *)self callHistoryDBFetchLimit];

      if (v38 >= v39) {
        [(CHManager *)self setFinishedLoadingAllCalls:1];
      }
      if (v3) {
        goto LABEL_30;
      }
    }
    else
    {

      if (v3)
      {
LABEL_30:
        uint64_t v40 = [(CHManager *)self coalescedCallsWithCalls:*p_recentCalls usingStrategy:self->_coalescingStrategy];
        id v41 = *p_recentCalls;
        id *p_recentCalls = (id)v40;

        v42 = [(CHSynchronizedLoggable *)self logHandle];
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v43 = [*p_recentCalls count];
          *(_DWORD *)buf = 134217984;
          uint64_t v67 = v43;
          _os_log_impl(&dword_1B8E4A000, v42, OS_LOG_TYPE_DEFAULT, "After coalescing we have %lu calls", buf, 0xCu);
        }

        uint64_t v44 = [(CHManager *)self applyPredicate:self->_postFetchingPredicate toCalls:*p_recentCalls];
        v45 = *p_recentCalls;
        id *p_recentCalls = (id)v44;
LABEL_36:

        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        id v46 = *p_recentCalls;
        uint64_t v47 = [v46 countByEnumeratingWithState:&v61 objects:v65 count:16];
        if (v47)
        {
          uint64_t v48 = v47;
          uint64_t v49 = *(void *)v62;
          do
          {
            for (uint64_t i = 0; i != v48; ++i)
            {
              if (*(void *)v62 != v49) {
                objc_enumerationMutation(v46);
              }
              long long v51 = *(void **)(*((void *)&v61 + 1) + 8 * i);
              long long v52 = [(CHManager *)self phoneBookManager];
              [v51 setPhoneBookManager:v52];
            }
            uint64_t v48 = [v46 countByEnumeratingWithState:&v61 objects:v65 count:16];
          }
          while (v48);
        }

        a2 = v36;
        v6 = v60;
LABEL_44:
        long long v53 = [(CHManager *)self featureFlags];
        if ([v53 increaseCallHistoryEnabled])
        {
          uint64_t v54 = [*p_recentCalls count];

          if (!v54) {
            [(CHManager *)self setFinishedLoadingAllCalls:1];
          }
        }
        else
        {
        }
        [(CHManager *)self setCacheIsDirty:0];
LABEL_49:

        goto LABEL_50;
      }
    }
    v45 = [(CHSynchronizedLoggable *)self logHandle];
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8E4A000, v45, OS_LOG_TYPE_DEFAULT, "User fetching without coalescing!", buf, 2u);
    }
    goto LABEL_36;
  }
  if (v3 && [(CHManager *)self reCoalesce])
  {
    v20 = [(CHSynchronizedLoggable *)self logHandle];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8E4A000, v20, OS_LOG_TYPE_DEFAULT, "No fetching required. Recoalscing & applying global filter", buf, 2u);
    }

    v21 = [(CHManager *)self uncoalescedUnFilteredRecentCalls];
    v11 = (void *)[v21 copy];

    uint64_t v22 = [(CHManager *)self coalescedCallsWithCalls:v11 usingStrategy:self->_coalescingStrategy];
    id v23 = *p_recentCalls;
    id *p_recentCalls = (id)v22;

    v24 = [(CHSynchronizedLoggable *)self logHandle];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      -[CHManager fetchRecentCallsSyncWithCoalescing:]((id *)&self->_recentCalls, v24);
    }

    uint64_t v25 = [(CHManager *)self applyPredicate:self->_postFetchingPredicate toCalls:*p_recentCalls];
    id v26 = *p_recentCalls;
    id *p_recentCalls = (id)v25;

    goto LABEL_49;
  }
LABEL_50:
  v55 = [(CHSynchronizedLoggable *)self logHandle];
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    v56 = NSStringFromSelector(a2);
    uint64_t v57 = [*p_recentCalls count];
    *(_DWORD *)buf = 138543618;
    uint64_t v67 = (uint64_t)v56;
    __int16 v68 = 2048;
    uint64_t v69 = v57;
    _os_log_impl(&dword_1B8E4A000, v55, OS_LOG_TYPE_DEFAULT, "<== %{public}@ returns %lu calls", buf, 0x16u);
  }
  id v58 = *p_recentCalls;
  return v58;
}

- (id)applyPredicate:(id)a3 toCalls:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([v7 count])
    {
      unint64_t v8 = 0;
      do
      {
        v9 = [v7 objectAtIndexedSubscript:v8];
        if ([v9 multiCall])
        {
          v10 = [(CHManager *)self unCoalesceCall:v9];
          v11 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"date" ascending:0];
          v12 = [v10 filteredArrayUsingPredicate:v6];
          v20[0] = v11;
          int v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
          v14 = [v12 sortedArrayUsingDescriptors:v13];

          unint64_t v15 = [(CHManager *)self coalescedCallsWithCalls:v14 usingStrategy:self->_coalescingStrategy];
          [v18 addObjectsFromArray:v15];
        }
        else if ([v6 evaluateWithObject:v9])
        {
          [v18 addObject:v9];
        }

        ++v8;
      }
      while (v8 < [v7 count]);
    }
  }
  else
  {
    uint64_t v16 = [(CHSynchronizedLoggable *)self logHandle];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8E4A000, v16, OS_LOG_TYPE_DEFAULT, "No predicate to apply, return all calls", buf, 2u);
    }

    id v18 = v7;
  }

  return v18;
}

- (NSArray)uncoalescedUnFilteredRecentCalls
{
  return (NSArray *)objc_getProperty(self, a2, 144, 1);
}

- (void)setUncoalescedUnFilteredRecentCalls:(id)a3
{
}

- (id)callsWithLimits:(id)a3 limit:(unint64_t)a4 offset:(unint64_t)a5 batchSize:(unint64_t)a6
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"date" ascending:0];
  v28[0] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  int v13 = [(CHManager *)self syncManager];
  v14 = [v13 fetchCallsWithPredicate:self->_preFetchingPredicate sortDescriptors:v12 limitsDictionary:v10 limit:a4 offset:a5 batchSize:a6];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v21 = [(CHManager *)self phoneBookManager];
        [v20 setPhoneBookManager:v21];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v17);
  }

  return v15;
}

- (CHPhoneBookIOSManager)phoneBookManager
{
  return self->_phoneBookManager;
}

- (SyncManagerProtocol)syncManager
{
  syncManager = self->_syncManager;
  if (!syncManager)
  {
    v4 = objc_alloc_init(SyncManager);
    v5 = self->_syncManager;
    self->_syncManager = (SyncManagerProtocol *)v4;

    syncManager = self->_syncManager;
  }
  return syncManager;
}

void __36__CHManager_callCountWithPredicate___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1B8E4A000, v2, OS_LOG_TYPE_DEFAULT, "Retrieving count of calls matching predicate %@", (uint8_t *)&v6, 0xCu);
  }

  v4 = [*(id *)(a1 + 32) getLimitsDictionaryForPrivateHeader];
  v5 = [*(id *)(a1 + 32) syncManager];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v5 fetchCallCountWithPredicate:*(void *)(a1 + 40) sortDescriptors:*(void *)(a1 + 48) limitsDictionary:v4];
}

- (id)getLimitsDictionaryForPrivateHeader
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [(CHManager *)self featureFlags];
  int v5 = [v4 protectedAppsEnabled];

  if (v5)
  {
    int v6 = [(CHManager *)self protectedBundleIDsExcludingCurrentProcess];
    [v3 setObject:v6 forKeyedSubscript:@"kCHLimitProtectedBundleIDsKey"];
  }
  uint64_t v7 = (void *)[v3 copy];

  return v7;
}

- (id)getLimitsDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = v3;
  limitingCallKinds = self->_limitingCallKinds;
  if (limitingCallKinds)
  {
    [v3 setObject:limitingCallKinds forKeyedSubscript:@"kCHLimitCallKindsKey"];
  }
  else
  {
    int v6 = +[CHManager limitingCallKindsForCallType:self->_limitingCallTypes];
    [v4 setObject:v6 forKeyedSubscript:@"kCHLimitCallKindsKey"];
  }
  limitingStartDate = self->_limitingStartDate;
  if (limitingStartDate) {
    [v4 setObject:limitingStartDate forKeyedSubscript:@"kCHLimitStartDateKey"];
  }
  limitingEndDate = self->_limitingEndDate;
  if (limitingEndDate) {
    [v4 setObject:limitingEndDate forKeyedSubscript:@"kCHLimitEndDateKey"];
  }
  v9 = [(CHManager *)self featureFlags];
  int v10 = [v9 protectedAppsEnabled];

  if (v10)
  {
    v11 = [(CHManager *)self protectedBundleIDsExcludingCurrentProcess];
    [v4 setObject:v11 forKeyedSubscript:@"kCHLimitProtectedBundleIDsKey"];
  }
  return v4;
}

- (int64_t)callHistoryDBFetchLimit
{
  id v3 = [(CHManager *)self featureFlags];
  int v4 = [v3 increaseCallHistoryEnabled];

  if (!v4) {
    return 200;
  }
  int v5 = [(CHManager *)self featureFlags];
  int v6 = [v5 keepCallsEnabled];
  uint64_t v7 = (int64_t *)&kCallHistoryNoFetchLimit;
  if (!v6) {
    uint64_t v7 = (int64_t *)&kCallHistoryIncreasedFetchLimit;
  }
  int64_t v8 = *v7;

  return v8;
}

- (CHFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (id)protectedBundleIDsExcludingCurrentProcess
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CAD0] set];
  int v4 = [(CHManager *)self featureFlags];
  if ([v4 protectedAppsEnabled])
  {
    BOOL v5 = [(CHManager *)self showsProtectedApps];

    if (!v5)
    {
      int v6 = [(CHManager *)self protectedAppProvider];
      uint64_t v7 = [v6 protectedApplicationBundleIDs];

      int64_t v8 = [(CHSynchronizedLoggable *)self logHandle];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138543362;
        v14 = v7;
        _os_log_impl(&dword_1B8E4A000, v8, OS_LOG_TYPE_DEFAULT, "Fetched %{public}@ protected apps to exclude from call history fetches", (uint8_t *)&v13, 0xCu);
      }
      goto LABEL_15;
    }
  }
  else
  {
  }
  int64_t v8 = [(CHSynchronizedLoggable *)self logHandle];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [(CHManager *)self featureFlags];
    if ([v9 protectedAppsEnabled]) {
      int v10 = @"YES";
    }
    else {
      int v10 = @"NO";
    }
    if ([(CHManager *)self showsProtectedApps]) {
      v11 = @"YES";
    }
    else {
      v11 = @"NO";
    }
    int v13 = 138543618;
    v14 = v10;
    __int16 v15 = 2114;
    uint64_t v16 = v11;
    _os_log_impl(&dword_1B8E4A000, v8, OS_LOG_TYPE_DEFAULT, "Protected apps feature flag is off %{public}@ or we allow showing protectedApps %{public}@", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v7 = v3;
LABEL_15:

  return v7;
}

- (BOOL)showsProtectedApps
{
  return self->_showsProtectedApps;
}

- (CHProtectedAppProvider)protectedAppProvider
{
  return self->_protectedAppProvider;
}

- (void)setLimitingCallTypesSync:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(CHSynchronizedLoggable *)self logHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = +[CHRecentCall callTypeAsString:v3];
    int v8 = 138543618;
    v9 = v6;
    __int16 v10 = 1024;
    int v11 = v3;
    _os_log_impl(&dword_1B8E4A000, v5, OS_LOG_TYPE_DEFAULT, "Setting limiting call type to %{public}@ (0x%x). Cache is drity.", (uint8_t *)&v8, 0x12u);
  }
  self->_limitingCallTypes = v3;
  [(CHManager *)self setCacheIsDirty:1];
  [(CHManager *)self setFinishedLoadingAllCalls:0];
  uint64_t v7 = +[CHManager limitingCallKindsForCallType:self->_limitingCallTypes];
  [(CHManager *)self setLimitingCallKindsSync:v7];
}

- (void)setLimitingCallKindsSync:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v4 = (NSArray *)a3;
  BOOL v5 = [(CHSynchronizedLoggable *)self logHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    int v8 = v4;
    _os_log_impl(&dword_1B8E4A000, v5, OS_LOG_TYPE_DEFAULT, "Setting limiting call kinds: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  limitingCallKinds = self->_limitingCallKinds;
  self->_limitingCallKinds = v4;

  [(CHManager *)self setCacheIsDirty:1];
  [(CHManager *)self setFinishedLoadingAllCalls:0];
}

- (void)setCacheIsDirty:(BOOL)a3
{
  self->_cacheIsDirty = a3;
}

- (void)setFinishedLoadingAllCalls:(BOOL)a3
{
  self->_finishedLoadingAllCalls = a3;
}

+ (id)limitingCallKindsForCallType:(unsigned int)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (a3 != -1)
  {
    if (a3)
    {
      v13[0] = @"kCHServiceProviderKey";
      v13[1] = @"kCHMediaTypeKey";
      v14[0] = @"com.apple.Telephony";
      v14[1] = &unk_1F12ABBB0;
      BOOL v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
      [v4 addObject:v5];
    }
    if ((a3 & 0x10) != 0)
    {
      v11[0] = @"kCHServiceProviderKey";
      v11[1] = @"kCHMediaTypeKey";
      v12[0] = @"com.apple.FaceTime";
      v12[1] = &unk_1F12ABBB0;
      int v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
      [v4 addObject:v6];
    }
    if ((a3 & 8) != 0)
    {
      v9[0] = @"kCHServiceProviderKey";
      v9[1] = @"kCHMediaTypeKey";
      v10[0] = @"com.apple.FaceTime";
      v10[1] = &unk_1F12ABBC8;
      int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
      [v4 addObject:v7];
    }
  }
  return v4;
}

- (void)setShouldLoadOlderCalls:(BOOL)a3
{
  self->_shouldLoadOlderCalls = a3;
}

- (id)coalescedCallsWithCalls:(id)a3 usingStrategy:(id)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![v6 count]) {
    goto LABEL_54;
  }
  long long v51 = self;
  if ([v7 isEqualToString:@"kCHCoalescingStrategyRecents"])
  {
    int v8 = [(CHSynchronizedLoggable *)self logHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8E4A000, v8, OS_LOG_TYPE_DEFAULT, "Coalescing with kCHCoalescingStrategyRecents", buf, 2u);
    }

    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v63 objects:v71 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      id v49 = v6;
      id v13 = 0;
      uint64_t v14 = *(void *)v64;
      do
      {
        uint64_t v15 = 0;
        uint64_t v16 = v13;
        do
        {
          if (*(void *)v64 != v14) {
            objc_enumerationMutation(v10);
          }
          uint64_t v17 = *(void **)(*((void *)&v63 + 1) + 8 * v15);
          if (v16)
          {
            id v18 = [v16 coalescedCallWithCall:*(void *)(*((void *)&v63 + 1) + 8 * v15) usingStrategy:v7];
          }
          else
          {
            id v18 = v17;
          }
          id v19 = v18;
          v20 = v18;
          if (!v18)
          {
            [v9 addObject:v16];
            v20 = v17;
          }
          id v13 = v20;

          ++v15;
          uint64_t v16 = v13;
        }
        while (v12 != v15);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v63 objects:v71 count:16];
      }
      while (v12);

      self = v51;
      id v6 = v49;
      if (!v13) {
        goto LABEL_57;
      }
      [v9 addObject:v13];
    }
    else
    {
      id v13 = v10;
    }

LABEL_57:
    id v45 = (id)[v9 copy];

    goto LABEL_58;
  }
  if ([v7 isEqualToString:@"kCHCoalescingStrategyCollapseIfEqual"])
  {
    v21 = [(CHSynchronizedLoggable *)self logHandle];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8E4A000, v21, OS_LOG_TYPE_DEFAULT, "Coalescing with kCHCoalescingStrategyCollapseIfEqual", buf, 2u);
    }
    id v53 = v7;

    id v52 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v48 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v50 = v6;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    obuint64_t j = v6;
    uint64_t v23 = [obj countByEnumeratingWithState:&v59 objects:v70 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v60 != v25) {
            objc_enumerationMutation(obj);
          }
          uint64_t v27 = *(void **)(*((void *)&v59 + 1) + 8 * i);
          v28 = [v27 remoteParticipantHandles];
          if ([v28 count] == 1)
          {
            uint64_t v29 = [v28 anyObject];
            v30 = [v29 normalizedValue];
            v31 = v30;
            if (v30)
            {
              id v32 = v30;
            }
            else
            {
              v33 = [v28 anyObject];
              id v32 = [v33 value];

              self = v51;
            }
          }
          else
          {
            id v32 = [v27 notificationThreadIdentifier];
          }
          if (![v32 length])
          {
            uint64_t v34 = [v27 uniqueId];

            id v32 = (id)v34;
          }
          if ([v32 length])
          {
            uint64_t v35 = [v22 objectForKeyedSubscript:v32];
            if (v35)
            {
              v36 = v35;
              v37 = [v35 coalescedCallWithCall:v27 usingStrategy:v53];

              if (v37)
              {
                [v22 setObject:v37 forKeyedSubscript:v32];
              }
            }
            else
            {
              [v22 setObject:v27 forKeyedSubscript:v32];
              [v52 addObject:v32];
            }
          }
          else
          {
            unint64_t v38 = [(CHSynchronizedLoggable *)self logHandle];
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
              [(CHManager *)buf coalescedCallsWithCalls:&v69 usingStrategy:v38];
            }
          }
        }
        uint64_t v24 = [obj countByEnumeratingWithState:&v59 objects:v70 count:16];
      }
      while (v24);
    }

    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v39 = v52;
    uint64_t v40 = [v39 countByEnumeratingWithState:&v55 objects:v67 count:16];
    id v6 = v50;
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v56;
      do
      {
        for (uint64_t j = 0; j != v41; ++j)
        {
          if (*(void *)v56 != v42) {
            objc_enumerationMutation(v39);
          }
          uint64_t v44 = [v22 objectForKeyedSubscript:*(void *)(*((void *)&v55 + 1) + 8 * j)];
          [v48 addObject:v44];
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v55 objects:v67 count:16];
      }
      while (v41);
    }

    id v45 = (id)[v48 copy];
    id v7 = v53;
    goto LABEL_58;
  }
  if (v7)
  {
LABEL_54:
    id v45 = 0;
    goto LABEL_58;
  }
  uint64_t v47 = [(CHSynchronizedLoggable *)self logHandle];
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v69 = 0;
    _os_log_impl(&dword_1B8E4A000, v47, OS_LOG_TYPE_DEFAULT, "Returning calls with no coalescing since none or invalid (%{public}@) strategy was provided", buf, 0xCu);
  }

  id v45 = v6;
LABEL_58:
  [(CHManager *)self setReCoalesce:0];

  return v45;
}

- (void)setReCoalesce:(BOOL)a3
{
  self->_reCoalesce = a3;
}

- (BOOL)shouldLoadOlderCalls
{
  return self->_shouldLoadOlderCalls;
}

- (BOOL)cacheIsDirty
{
  return self->_cacheIsDirty;
}

uint64_t __34__CHManager_setLimitingCallKinds___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setLimitingCallKindsSync:*(void *)(a1 + 40)];
}

- (id)loadOlderRecentCalls
{
  return [(CHManager *)self loadOlderRecentCallsWithPredicate:0];
}

- (void)setRead:(BOOL)a3 forCallsWithPredicate:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __54__CHManager_setRead_forCallsWithPredicate_completion___block_invoke;
  v12[3] = &unk_1E61C7B08;
  v12[4] = self;
  id v13 = v8;
  BOOL v15 = a3;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(CHSynchronizedLoggable *)self execute:v12];
}

- (id)loadOlderRecentCallsWithPredicate:(id)a3
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __47__CHManager_loadOlderRecentCallsWithPredicate___block_invoke;
  v9[3] = &unk_1E61C7810;
  id v10 = v5;
  SEL v11 = a2;
  v9[4] = self;
  id v6 = v5;
  id v7 = [(CHSynchronizedLoggable *)self executeSyncWithResult:v9];

  return v7;
}

- (NSArray)recentCalls
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __24__CHManager_recentCalls__block_invoke;
  v4[3] = &unk_1E61C77E8;
  v4[4] = self;
  v4[5] = a2;
  v2 = [(CHSynchronizedLoggable *)self executeSyncWithResult:v4];
  return (NSArray *)v2;
}

- (void)setLimitingCallKinds:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__CHManager_setLimitingCallKinds___block_invoke;
  v6[3] = &unk_1E61C7568;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CHSynchronizedLoggable *)self execute:v6];
}

- (void)setCoalescingStrategy:(id)a3
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__CHManager_setCoalescingStrategy___block_invoke;
  v7[3] = &unk_1E61C7740;
  id v8 = v5;
  SEL v9 = a2;
  v7[4] = self;
  id v6 = v5;
  [(CHSynchronizedLoggable *)self execute:v7];
}

- (unint64_t)callCountWithPredicate:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"date" ascending:0];
  v19[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __36__CHManager_callCountWithPredicate___block_invoke;
  v11[3] = &unk_1E61C7B80;
  v11[4] = self;
  id v7 = v4;
  id v12 = v7;
  id v14 = &v15;
  id v8 = v6;
  id v13 = v8;
  [(CHSynchronizedLoggable *)self executeSync:v11];
  unint64_t v9 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (CHManager)initWithContactStore:(id)a3 featureFlags:(id)a4 protectedAppProvider:(id)a5 queue:(id)a6
{
  id v9 = a3;
  id v10 = (CHFeatureFlags *)a4;
  SEL v11 = (CHProtectedAppProvider *)a5;
  v21.receiver = self;
  v21.super_class = (Class)CHManager;
  id v12 = [(CHSynchronizedLoggable *)&v21 initWithName:"CHManager"];
  id v13 = v12;
  if (v12)
  {
    id v14 = [(CHSynchronizedLoggable *)v12 logHandle];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_1B8E4A000, v14, OS_LOG_TYPE_DEFAULT, "Creating CHManager with default values!", v20, 2u);
    }

    [(CHManager *)v13 setDefaultInitValues];
    uint64_t v15 = [[CHPhoneBookIOSManager alloc] initWithContactStore:v9];
    phoneBookManager = v13->_phoneBookManager;
    v13->_phoneBookManager = v15;

    uint64_t v17 = v10;
    if (!v10) {
      uint64_t v17 = objc_alloc_init(CHFeatureFlags);
    }
    objc_storeStrong((id *)&v13->_featureFlags, v17);
    if (!v10) {

    }
    uint64_t v18 = v11;
    if (!v11) {
      uint64_t v18 = objc_alloc_init(CHProtectedAppProvider);
    }
    objc_storeStrong((id *)&v13->_protectedAppProvider, v18);
    if (!v11) {

    }
    [(CHProtectedAppProvider *)v13->_protectedAppProvider setDelegate:v13];
  }

  return v13;
}

- (void)setDefaultInitValues
{
  [(CHManager *)self setLimitingCallTypesSync:0xFFFFFFFFLL];
  self->_showsFaceTimeVideoCalls = 1;
  self->_showsFaceTimeAudioCalls = 1;
  self->_showsTelephonyCalls = 1;
  self->_generateSyncTransactions = 1;
  self->_numberOfUnseenMissedCalls = 0;
  self->_cacheIsDirty = 1;
  self->_reCoalesce = 1;
  uncoalescedUnFilteredRecentCalls = self->_uncoalescedUnFilteredRecentCalls;
  self->_uncoalescedUnFilteredRecentCalls = 0;

  self->_finishedLoadingAllCalls = 0;
  [(CHManager *)self registerForNotifications];
  maybeLogVersionInfo();
}

- (void)registerForNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_handleCallHistoryContactStoreChangedInternalNotification_ name:@"kCallHistoryContactStoreChangedInternalNotification" object:0];
  [v3 addObserver:self selector:sel_handleCallHistoryDatabaseChangedInternalNotification_ name:@"kCallHistoryDatabaseChangedInternalNotification" object:0];
  [v3 addObserver:self selector:sel_currentLocaleChanged_ name:*MEMORY[0x1E4F1C370] object:0];
}

- (CHManager)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  id v4 = [(CHManager *)self initWithContactStore:v3];

  return v4;
}

- (CHManager)initWithContactStore:(id)a3
{
  return [(CHManager *)self initWithContactStore:a3 featureFlags:0 protectedAppProvider:0 queue:0];
}

- (BOOL)canLoadOlderRecentCalls
{
  id v3 = [(CHManager *)self featureFlags];
  if ([v3 increaseCallHistoryEnabled])
  {
    if ([(CHManager *)self finishedLoadingAllCalls]) {
      BOOL v4 = [(CHManager *)self cacheIsDirty];
    }
    else {
      BOOL v4 = 1;
    }
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)finishedLoadingAllCalls
{
  return self->_finishedLoadingAllCalls;
}

id __24__CHManager_recentCalls__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v9 = 138543362;
    id v10 = v3;
    _os_log_impl(&dword_1B8E4A000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@", (uint8_t *)&v9, 0xCu);
  }
  BOOL v4 = [*(id *)(a1 + 32) fetchRecentCallsSyncWithCoalescing:1];
  id v5 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = NSStringFromSelector(*(SEL *)(a1 + 40));
    uint64_t v7 = [v4 count];
    int v9 = 138543618;
    id v10 = v6;
    __int16 v11 = 2048;
    uint64_t v12 = v7;
    _os_log_impl(&dword_1B8E4A000, v5, OS_LOG_TYPE_DEFAULT, "<== %{public}@ => %lu calls", (uint8_t *)&v9, 0x16u);
  }
  return v4;
}

id __47__CHManager_loadOlderRecentCallsWithPredicate___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setShouldLoadOlderCalls:1];
  v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v10 = 138543362;
    __int16 v11 = v3;
    _os_log_impl(&dword_1B8E4A000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@", (uint8_t *)&v10, 0xCu);
  }
  BOOL v4 = [*(id *)(a1 + 32) loadOlderRecentCallsSyncWithCoalescing:1];
  id v5 = [*(id *)(a1 + 32) applyPredicate:*(void *)(a1 + 40) toCalls:v4];
  id v6 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v8 = [v4 count];
    int v10 = 138543618;
    __int16 v11 = v7;
    __int16 v12 = 2048;
    uint64_t v13 = v8;
    _os_log_impl(&dword_1B8E4A000, v6, OS_LOG_TYPE_DEFAULT, "<== %{public}@ => %lu calls", (uint8_t *)&v10, 0x16u);
  }
  return v5;
}

uint64_t __35__CHManager_setCoalescingStrategy___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1B8E4A000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@:%{public}@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 88) isEqualToString:*(void *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 88), *(id *)(a1 + 40));
    return [*(id *)(a1 + 32) setReCoalesce:1];
  }
  return result;
}

void __54__CHManager_setRead_forCallsWithPredicate_completion___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v3;
    _os_log_impl(&dword_1B8E4A000, v2, OS_LOG_TYPE_DEFAULT, "Updating read status for calls matching predicate %@", buf, 0xCu);
  }

  uint64_t v4 = [*(id *)(a1 + 32) syncManager];
  uint64_t v5 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 40);
  id v12 = 0;
  uint64_t v7 = [v4 setRead:v5 forCallsWithPredicate:v6 error:&v12];
  id v8 = v12;

  if (v7 == 0x7FFFFFFFFFFFFFFFLL && v8 != 0)
  {
    uint64_t v10 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __43__CHManager_setRead_forCallsWithPredicate___block_invoke_cold_1();
    }
  }
  uint64_t v11 = *(void *)(a1 + 48);
  if (v11) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, v7);
  }
}

- (void)setInitialLimitingCallKinds:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v27 = v4;
    uint64_t v5 = [v4 objectForKeyedSubscript:@"kCHLimitCallKindsKey"];

    if (v5)
    {
      uint64_t v6 = [v27 objectForKeyedSubscript:@"kCHLimitCallKindsKey"];
      [(CHManager *)self setLimitingCallKindsSync:v6];
    }
    else
    {
      uint64_t v7 = [v27 objectForKeyedSubscript:@"kCHLimitCallTypeKey"];
      if (v7)
      {
        id v8 = [v27 objectForKeyedSubscript:@"kCHLimitCallTypeKey"];
        int v9 = (int)v8;
      }
      else
      {
        int v9 = -1;
      }

      uint64_t v10 = [v27 objectForKeyedSubscript:@"kCHLimitStartDateKey"];
      if (v10)
      {
        uint64_t v11 = [v27 objectForKeyedSubscript:@"kCHLimitStartDateKey"];
      }
      else
      {
        uint64_t v11 = 0;
      }
      objc_storeStrong((id *)&self->_limitingStartDate, v11);
      if (v10) {

      }
      id v12 = [v27 objectForKeyedSubscript:@"kCHLimitEndDateKey"];
      if (v12)
      {
        uint64_t v13 = [v27 objectForKeyedSubscript:@"kCHLimitEndDateKey"];
      }
      else
      {
        uint64_t v13 = 0;
      }
      objc_storeStrong((id *)&self->_limitingEndDate, v13);
      if (v12) {

      }
      uint64_t v14 = [v27 objectForKeyedSubscript:@"kShowsFaceTimeVideoCallsKey"];
      if (v14)
      {
        uint64_t v15 = [v27 objectForKeyedSubscript:@"kShowsFaceTimeVideoCallsKey"];
        p_showsFaceTimeVideoCalls = &self->_showsFaceTimeVideoCalls;
        self->_showsFaceTimeVideoCalls = [v15 BOOLValue];
      }
      else
      {
        p_showsFaceTimeVideoCalls = &self->_showsFaceTimeVideoCalls;
        self->_showsFaceTimeVideoCalls = 1;
      }

      uint64_t v17 = [v27 objectForKeyedSubscript:@"kShowsFaceTimeAudioCallsKey"];
      if (v17)
      {
        uint64_t v18 = [v27 objectForKeyedSubscript:@"kShowsFaceTimeAudioCallsKey"];
        p_showsFaceTimeAudioCalls = &self->_showsFaceTimeAudioCalls;
        self->_showsFaceTimeAudioCalls = [v18 BOOLValue];
      }
      else
      {
        p_showsFaceTimeAudioCalls = &self->_showsFaceTimeAudioCalls;
        self->_showsFaceTimeAudioCalls = 1;
      }

      v20 = [v27 objectForKeyedSubscript:@"kShowsTelephonyCallsKey"];
      if (v20)
      {
        objc_super v21 = [v27 objectForKeyedSubscript:@"kShowsTelephonyCallsKey"];
        p_showsTelephonyCalls = &self->_showsTelephonyCalls;
        self->_showsTelephonyCalls = [v21 BOOLValue];
      }
      else
      {
        p_showsTelephonyCalls = &self->_showsTelephonyCalls;
        self->_showsTelephonyCalls = 1;
      }

      if (*p_showsFaceTimeVideoCalls) {
        int v23 = 0;
      }
      else {
        int v23 = 8;
      }
      int v24 = ~v23;
      if (*p_showsFaceTimeAudioCalls) {
        int v25 = 0;
      }
      else {
        int v25 = 16;
      }
      if (*p_showsTelephonyCalls) {
        int v26 = 0;
      }
      else {
        int v26 = 7;
      }
      [(CHManager *)self setLimitingCallTypesSync:(v24 ^ v25 ^ v26) & v9];
    }
    id v4 = v27;
  }
}

- (CHManager)initWithQueue:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1B980];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  uint64_t v7 = [(CHManager *)self initWithContactStore:v6 featureFlags:0 protectedAppProvider:0 queue:v5];

  return v7;
}

- (CHManager)initWithFetchingLimitsDictionary:(id)a3 andCoalescingStrategy:(id)a4 andPostFetchingPredicate:(id)a5 withQueue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [(CHManager *)self initWithQueue:a6];
  uint64_t v14 = v13;
  if (v13)
  {
    uint64_t v15 = [(CHSynchronizedLoggable *)v13 logHandle];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_1B8E4A000, v15, OS_LOG_TYPE_DEFAULT, "Creating CHManager with user values!", v17, 2u);
    }

    [(CHManager *)v14 setInitialLimitingCallKinds:v10];
    objc_storeStrong((id *)&v14->_coalescingStrategy, a4);
    objc_storeStrong((id *)&v14->_postFetchingPredicate, a5);
  }

  return v14;
}

- (void)dealloc
{
  uint64_t v3 = [(CHSynchronizedLoggable *)self logHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8E4A000, v3, OS_LOG_TYPE_DEFAULT, "CHManager is getting destroyed...", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)CHManager;
  [(CHManager *)&v4 dealloc];
}

- (void)handleCallHistoryContactStoreChangedInternalNotification:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70__CHManager_handleCallHistoryContactStoreChangedInternalNotification___block_invoke;
  v6[3] = &unk_1E61C7568;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CHSynchronizedLoggable *)self execute:v6];
}

void __70__CHManager_handleCallHistoryContactStoreChangedInternalNotification___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1B8E4A000, v2, OS_LOG_TYPE_DEFAULT, "--- Contact Store changed! Invalidating call's AB info.", v6, 2u);
  }

  [*(id *)(a1 + 32) setCacheIsDirty:1];
  [*(id *)(a1 + 32) setFinishedLoadingAllCalls:0];
  [*(id *)(a1 + 32) setReCoalesce:1];
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3[12]) {
    id v4 = (id)[v3 fetchRecentCallsSyncWithCoalescing:1];
  }
  id v5 = [*(id *)(a1 + 40) userInfo];
  notifyClientsOfEvent(@"kCallHistoryDatabaseChangedNotification", v5);
}

- (void)setPreFetchingPredicate:(id)a3
{
  id v5 = (NSPredicate *)a3;
  p_preFetchingPredicate = &self->_preFetchingPredicate;
  if (self->_preFetchingPredicate != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)p_preFetchingPredicate, a3);
    uncoalescedUnFilteredRecentCalls = self->_uncoalescedUnFilteredRecentCalls;
    self->_uncoalescedUnFilteredRecentCalls = 0;

    p_preFetchingPredicate = (NSPredicate **)[(CHManager *)self resetCalls];
    id v5 = v8;
  }
  MEMORY[0x1F41817F8](p_preFetchingPredicate, v5);
}

- (void)resetCalls
{
  [(CHManager *)self setCacheIsDirty:1];
  [(CHManager *)self setFinishedLoadingAllCalls:0];
  [(CHManager *)self setReCoalesce:1];
  if (self->_recentCalls) {
    id v3 = [(CHManager *)self fetchRecentCallsSyncWithCoalescing:1];
  }
}

- (void)handleCallHistoryDatabaseChangedInternalNotification:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__CHManager_handleCallHistoryDatabaseChangedInternalNotification___block_invoke;
  v6[3] = &unk_1E61C7568;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(CHSynchronizedLoggable *)self execute:v6];
}

void __66__CHManager_handleCallHistoryDatabaseChangedInternalNotification___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [*(id *)(a1 + 40) logHandle];
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      int v8 = 138543362;
      int v9 = v2;
      id v5 = "--- Got Database changed notification: %{public}@. Make cache dirty and send client DB Changed Notification";
      id v6 = v3;
      uint32_t v7 = 12;
LABEL_6:
      _os_log_impl(&dword_1B8E4A000, v6, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, v7);
    }
  }
  else if (v4)
  {
    LOWORD(v8) = 0;
    id v5 = "--- Got Database changed notification due to an external change! Make cache dirty and send client DB Changed Notification";
    id v6 = v3;
    uint32_t v7 = 2;
    goto LABEL_6;
  }

  [*(id *)(a1 + 40) resetCalls];
}

- (void)currentLocaleChanged:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__CHManager_currentLocaleChanged___block_invoke;
  v6[3] = &unk_1E61C7568;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CHSynchronizedLoggable *)self execute:v6];
}

void __34__CHManager_currentLocaleChanged___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    uint64_t v15 = v3;
    _os_log_impl(&dword_1B8E4A000, v2, OS_LOG_TYPE_DEFAULT, "--- Received current locale changed notification: %{public}@. Invalidating all calls' caller ID formatted values.", buf, 0xCu);
  }

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = *(id *)(*(void *)(a1 + 32) + 96);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "setCallerIdFormatted:", 0, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (NSArray)uncoalescedRecentCallsSync
{
  id v3 = [(CHManager *)self fetchRecentCallsSyncWithCoalescing:0];
  uncoalescedRecentCalls = self->_uncoalescedRecentCalls;
  return uncoalescedRecentCalls;
}

- (id)unCoalesceCall:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v5 = [v3 numberOfOccurrences];
  uint64_t v6 = [v3 callOccurrences];
  if (v5)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      uint64_t v8 = [v6 objectAtIndexedSubscript:i];
      long long v9 = (void *)[v3 copy];
      [v8 objectForKeyedSubscript:@"kCHCallOccurrenceUniqueIdKey"];
      v11 = id v10 = v3;
      [v9 setUniqueId:v11];

      long long v12 = [v8 objectForKeyedSubscript:@"kCHCallOccurrenceCallTypeKey"];
      objc_msgSend(v9, "setCallType:", objc_msgSend(v12, "unsignedIntegerValue"));

      uint64_t v13 = [v8 objectForKeyedSubscript:@"kCHCallOccurrenceCallStatusKey"];
      objc_msgSend(v9, "setCallStatus:", objc_msgSend(v13, "unsignedIntegerValue"));

      uint64_t v14 = [v8 objectForKeyedSubscript:@"kCHCallOccurrenceDurationKey"];
      [v14 doubleValue];
      objc_msgSend(v9, "setDuration:");

      uint64_t v15 = [v8 objectForKeyedSubscript:@"kCHCallOccurrenceDateKey"];
      [v9 setDate:v15];

      uint64_t v16 = [v8 objectForKeyedSubscript:@"kCHCallOccurrenceDataUsageKey"];
      [v9 setBytesOfDataUsed:v16];

      uint64_t v17 = [v8 objectForKeyedSubscript:@"kCHCallOccurrenceMediaTypeKey"];
      objc_msgSend(v9, "setMediaType:", objc_msgSend(v17, "unsignedIntegerValue"));

      uint64_t v18 = [v8 objectForKeyedSubscript:@"kCHCallOccurrenceTTYTypeKey"];
      objc_msgSend(v9, "setTtyType:", objc_msgSend(v18, "unsignedIntegerValue"));

      id v19 = [v8 objectForKeyedSubscript:@"kCHCallOccurrenceServiceProviderKey"];
      [v9 setServiceProvider:v19];

      id v3 = v10;
      [v9 setCallOccurrences:0];
      [v9 setMultiCall:0];
      [v4 setObject:v9 atIndexedSubscript:i];
    }
  }

  return v4;
}

- (id)recentCallsWithPredicate:(id)a3
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __38__CHManager_recentCallsWithPredicate___block_invoke;
  v9[3] = &unk_1E61C7810;
  id v10 = v5;
  SEL v11 = a2;
  v9[4] = self;
  id v6 = v5;
  uint64_t v7 = [(CHSynchronizedLoggable *)self executeSyncWithResult:v9];

  return v7;
}

id __38__CHManager_recentCallsWithPredicate___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1BA9CD070]();
  id v3 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v5 = *(void *)(a1 + 40);
    int v15 = 138543618;
    uint64_t v16 = v4;
    __int16 v17 = 2112;
    uint64_t v18 = v5;
    _os_log_impl(&dword_1B8E4A000, v3, OS_LOG_TYPE_DEFAULT, "==> %{public}@(%@)", (uint8_t *)&v15, 0x16u);
  }
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = [v6 fetchRecentCallsSyncWithCoalescing:1];
  long long v9 = [v6 applyPredicate:v7 toCalls:v8];

  id v10 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    SEL v11 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = [v9 count];
    int v15 = 138543874;
    uint64_t v16 = v11;
    __int16 v17 = 2112;
    uint64_t v18 = v12;
    __int16 v19 = 2048;
    uint64_t v20 = v13;
    _os_log_impl(&dword_1B8E4A000, v10, OS_LOG_TYPE_DEFAULT, "<== %{public}@(%@) => %lu calls", (uint8_t *)&v15, 0x20u);
  }
  return v9;
}

- (unint64_t)countCallsWithPredicateSync:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(CHSynchronizedLoggable *)self logHandle];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = NSStringFromSelector(a2);
    uint64_t v8 = [v5 predicateFormat];
    int v18 = 138543618;
    __int16 v19 = v7;
    __int16 v20 = 2112;
    unint64_t v21 = (unint64_t)v8;
    _os_log_impl(&dword_1B8E4A000, v6, OS_LOG_TYPE_DEFAULT, "==> %{public}@(%@)", (uint8_t *)&v18, 0x16u);
  }
  if (v5)
  {
    long long v9 = [(CHManager *)self uncoalescedRecentCallsSync];
    id v10 = [v9 filteredArrayUsingPredicate:v5];
  }
  else
  {
    id v10 = [(CHManager *)self fetchRecentCallsSyncWithCoalescing:1];
  }
  unint64_t v11 = [v10 count];
  uint64_t v12 = [(CHSynchronizedLoggable *)self logHandle];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [v5 predicateFormat];
    int v18 = 138412546;
    __int16 v19 = v13;
    __int16 v20 = 2048;
    unint64_t v21 = v11;
    _os_log_impl(&dword_1B8E4A000, v12, OS_LOG_TYPE_DEFAULT, "User requested to count calls with predicate, %@. Returning %lu.", (uint8_t *)&v18, 0x16u);
  }
  uint64_t v14 = [(CHSynchronizedLoggable *)self logHandle];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = NSStringFromSelector(a2);
    uint64_t v16 = [v5 predicateFormat];
    int v18 = 138543874;
    __int16 v19 = v15;
    __int16 v20 = 2112;
    unint64_t v21 = (unint64_t)v16;
    __int16 v22 = 2048;
    unint64_t v23 = v11;
    _os_log_impl(&dword_1B8E4A000, v14, OS_LOG_TYPE_DEFAULT, "<== %{public}@(%@) %lu calls", (uint8_t *)&v18, 0x20u);
  }
  return v11;
}

- (unint64_t)countCallsWithPredicate:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__CHManager_countCallsWithPredicate___block_invoke;
  v8[3] = &unk_1E61C7838;
  id v10 = &v11;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [(CHSynchronizedLoggable *)self executeSync:v8];
  unint64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __37__CHManager_countCallsWithPredicate___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) countCallsWithPredicateSync:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)addToCallHistory:(id)a3
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __30__CHManager_addToCallHistory___block_invoke;
  v7[3] = &unk_1E61C7740;
  id v8 = v5;
  SEL v9 = a2;
  v7[4] = self;
  id v6 = v5;
  [(CHSynchronizedLoggable *)self execute:v7];
}

void __30__CHManager_addToCallHistory___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1B8E4A000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@(%@)", (uint8_t *)&v6, 0x16u);
  }
  id v5 = [*(id *)(a1 + 32) syncManager];
  objc_msgSend(v5, "insert:withTransaction:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "generateSyncTransactions"));
}

- (void)addArrayToCallHistory:(id)a3
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__CHManager_addArrayToCallHistory___block_invoke;
  v7[3] = &unk_1E61C7740;
  id v8 = v5;
  SEL v9 = a2;
  v7[4] = self;
  id v6 = v5;
  [(CHSynchronizedLoggable *)self execute:v7];
}

void __35__CHManager_addArrayToCallHistory___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v4 = *(void *)(a1 + 40);
    int v10 = 138543618;
    uint64_t v11 = v3;
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    _os_log_impl(&dword_1B8E4A000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@(%@)", (uint8_t *)&v10, 0x16u);
  }
  int v5 = [*(id *)(a1 + 32) generateSyncTransactions];
  id v6 = *(void **)(a1 + 32);
  if (v5)
  {
    uint64_t v7 = [v6 syncManager];
    [v7 insertRecords:*(void *)(a1 + 40)];
  }
  else
  {
    id v8 = [v6 logHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      SEL v9 = *(void **)(a1 + 40);
      int v10 = 138412290;
      uint64_t v11 = v9;
      _os_log_impl(&dword_1B8E4A000, v8, OS_LOG_TYPE_DEFAULT, "User requested to insert new calls without sync transactions: \n %@", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v7 = [*(id *)(a1 + 32) syncManager];
    [v7 insertRecordsWithoutTransactions:*(void *)(a1 + 40)];
  }
}

- (void)addArrayToCallHistory:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __50__CHManager_addArrayToCallHistory_withCompletion___block_invoke;
  v11[3] = &unk_1E61C7860;
  v11[4] = self;
  id v12 = v7;
  id v13 = v8;
  SEL v14 = a2;
  id v9 = v8;
  id v10 = v7;
  [(CHSynchronizedLoggable *)self execute:v11];
}

uint64_t __50__CHManager_addArrayToCallHistory_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v4 = *(void *)(a1 + 40);
    int v11 = 138543618;
    id v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl(&dword_1B8E4A000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@(%@)", (uint8_t *)&v11, 0x16u);
  }
  int v5 = [*(id *)(a1 + 32) generateSyncTransactions];
  id v6 = *(void **)(a1 + 32);
  if (v5)
  {
    id v7 = [v6 syncManager];
    [v7 insertRecords:*(void *)(a1 + 40)];
  }
  else
  {
    id v8 = [v6 logHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = *(void **)(a1 + 40);
      int v11 = 138412290;
      id v12 = v9;
      _os_log_impl(&dword_1B8E4A000, v8, OS_LOG_TYPE_DEFAULT, "User requested to insert new calls without sync transactions: \n %@", (uint8_t *)&v11, 0xCu);
    }

    id v7 = [*(id *)(a1 + 32) syncManager];
    [v7 insertRecordsWithoutTransactions:*(void *)(a1 + 40)];
  }

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setOutgoingLocalParticipantUUID:(id)a3 forRecentCallsMatchingPredicate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __77__CHManager_setOutgoingLocalParticipantUUID_forRecentCallsMatchingPredicate___block_invoke;
  v10[3] = &unk_1E61C7888;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(CHSynchronizedLoggable *)self execute:v10];
}

void __77__CHManager_setOutgoingLocalParticipantUUID_forRecentCallsMatchingPredicate___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    uint64_t v28 = v3;
    __int16 v29 = 2112;
    uint64_t v30 = v4;
    _os_log_impl(&dword_1B8E4A000, v2, OS_LOG_TYPE_DEFAULT, "Updating outgoing local participant UUID to %{public}@ for recent calls matching predicate %@.", buf, 0x16u);
  }

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = [*(id *)(a1 + 32) uncoalescedRecentCallsSync];
  id v7 = [v6 filteredArrayUsingPredicate:*(void *)(a1 + 48)];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        __int16 v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "uniqueId", (void)v20);
        uint64_t v15 = [v14 length];

        if (v15)
        {
          uint64_t v16 = *(void *)(a1 + 40);
          uint64_t v24 = kCallUpdatePropertyOutgoingLocalParticipantUUID;
          uint64_t v25 = v16;
          __int16 v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
          int v18 = [v13 uniqueId];
          [v5 setObject:v17 forKeyedSubscript:v18];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v10);
  }

  if ([v5 count])
  {
    __int16 v19 = [*(id *)(a1 + 32) syncManager];
    [v19 updateObjects:v5];
  }
}

- (void)markAllCallsAsReadWithPredicate:(id)a3
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__CHManager_markAllCallsAsReadWithPredicate___block_invoke;
  v7[3] = &unk_1E61C7740;
  id v8 = v5;
  SEL v9 = a2;
  v7[4] = self;
  id v6 = v5;
  [(CHSynchronizedLoggable *)self execute:v7];
}

void __45__CHManager_markAllCallsAsReadWithPredicate___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v4 = *(void *)(a1 + 40);
    int v19 = 138543618;
    long long v20 = v3;
    __int16 v21 = 2112;
    uint64_t v22 = v4;
    _os_log_impl(&dword_1B8E4A000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@(%@)", (uint8_t *)&v19, 0x16u);
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = [NSNumber numberWithBool:1];
  [v5 setObject:v6 forKeyedSubscript:kCallUpdatePropertyRead];

  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = [*(id *)(a1 + 32) logHandle];
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      uint64_t v10 = *(void **)(a1 + 40);
      int v19 = 138412290;
      long long v20 = v10;
      _os_log_impl(&dword_1B8E4A000, v8, OS_LOG_TYPE_DEFAULT, "User requested to mark some calls with this predicate, %@, as read", (uint8_t *)&v19, 0xCu);
    }

    uint64_t v11 = [*(id *)(a1 + 32) uncoalescedRecentCallsSync];
    id v12 = [v11 filteredArrayUsingPredicate:*(void *)(a1 + 40)];

    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if ([v12 count])
    {
      unint64_t v14 = 0;
      do
      {
        uint64_t v15 = [v12 objectAtIndexedSubscript:v14];
        uint64_t v16 = [v15 uniqueId];

        if (v16)
        {
          __int16 v17 = [v15 uniqueId];
          [v13 setObject:v5 forKey:v17];
        }
        ++v14;
      }
      while (v14 < [v12 count]);
    }
    int v18 = [*(id *)(a1 + 32) syncManager];
    [v18 updateObjects:v13];
  }
  else
  {
    if (v9)
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1B8E4A000, v8, OS_LOG_TYPE_DEFAULT, "User requested to mark ALL calls as read", (uint8_t *)&v19, 2u);
    }

    id v12 = [*(id *)(a1 + 32) syncManager];
    [v12 updateAllObjects:v5];
  }
}

- (void)updateBytesOfDataUsedFor:(id)a3 with:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __43__CHManager_updateBytesOfDataUsedFor_with___block_invoke;
  v11[3] = &unk_1E61C78B0;
  v11[4] = self;
  id v12 = v7;
  id v13 = v8;
  SEL v14 = a2;
  id v9 = v8;
  id v10 = v7;
  [(CHSynchronizedLoggable *)self execute:v11];
}

void __43__CHManager_updateBytesOfDataUsedFor_with___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    int v9 = 138543874;
    id v10 = v3;
    __int16 v11 = 2114;
    uint64_t v12 = v4;
    __int16 v13 = 2114;
    uint64_t v14 = v5;
    _os_log_impl(&dword_1B8E4A000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@(%{public}@, %{public}@)", (uint8_t *)&v9, 0x20u);
  }
  if (*(void *)(a1 + 40) && *(void *)(a1 + 48))
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v6 setObject:*(void *)(a1 + 48) forKeyedSubscript:kCallUpdatePropertyBytesUsed];
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v7 setObject:v6 forKey:*(void *)(a1 + 40)];
    id v8 = [*(id *)(a1 + 32) syncManager];
    [v8 updateObjects:v7];
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __43__CHManager_updateBytesOfDataUsedFor_with___block_invoke_cold_1();
    }
  }
}

- (void)updateMessageStatusFor:(id)a3 with:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __41__CHManager_updateMessageStatusFor_with___block_invoke;
  v11[3] = &unk_1E61C78B0;
  v11[4] = self;
  id v12 = v7;
  id v13 = v8;
  SEL v14 = a2;
  id v9 = v8;
  id v10 = v7;
  [(CHSynchronizedLoggable *)self execute:v11];
}

void __41__CHManager_updateMessageStatusFor_with___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    int v9 = 138543874;
    id v10 = v3;
    __int16 v11 = 2114;
    uint64_t v12 = v4;
    __int16 v13 = 2114;
    uint64_t v14 = v5;
    _os_log_impl(&dword_1B8E4A000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@(%{public}@, hasMessage=%{public}@)", (uint8_t *)&v9, 0x20u);
  }
  if (*(void *)(a1 + 40))
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v6 setObject:*(void *)(a1 + 48) forKeyedSubscript:kCallUpdatePropertyHasMessage];
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v7 setObject:v6 forKey:*(void *)(a1 + 40)];
    id v8 = [*(id *)(a1 + 32) syncManager];
    [v8 updateObjects:v7];
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __41__CHManager_updateMessageStatusFor_with___block_invoke_cold_1();
    }
  }
}

- (void)updateAutoAnsweredReasonFor:(id)a3 with:(int64_t)a4
{
  id v7 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __46__CHManager_updateAutoAnsweredReasonFor_with___block_invoke;
  v9[3] = &unk_1E61C78D8;
  v9[4] = self;
  id v10 = v7;
  SEL v11 = a2;
  int64_t v12 = a4;
  id v8 = v7;
  [(CHSynchronizedLoggable *)self execute:v9];
}

void __46__CHManager_updateAutoAnsweredReasonFor_with___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void **)(a1 + 56);
    int v13 = 138543874;
    uint64_t v14 = v3;
    __int16 v15 = 2114;
    uint64_t v16 = v4;
    __int16 v17 = 2048;
    int v18 = v5;
    _os_log_impl(&dword_1B8E4A000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@(%{public}@, autoAnsweredReason=%ld)", (uint8_t *)&v13, 0x20u);
  }
  if (*(void *)(a1 + 40))
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v7 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
    id v8 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = NSStringFromSelector(*(SEL *)(a1 + 48));
      uint64_t v10 = *(void *)(a1 + 40);
      int v13 = 138543874;
      uint64_t v14 = v9;
      __int16 v15 = 2114;
      uint64_t v16 = v10;
      __int16 v17 = 2114;
      int v18 = v7;
      _os_log_impl(&dword_1B8E4A000, v8, OS_LOG_TYPE_DEFAULT, "==> %{public}@(%{public}@, autoAnsweredReason=%{public}@)", (uint8_t *)&v13, 0x20u);
    }
    [v6 setObject:v7 forKeyedSubscript:kCallUpdatePropertyAutoAnsweredReason];
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v11 setObject:v6 forKey:*(void *)(a1 + 40)];
    int64_t v12 = [*(id *)(a1 + 32) syncManager];
    [v12 updateObjects:v11];
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __41__CHManager_updateMessageStatusFor_with___block_invoke_cold_1();
    }
  }
}

- (void)updateEmergencyMediaItemFor:(id)a3 with:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __46__CHManager_updateEmergencyMediaItemFor_with___block_invoke;
  v11[3] = &unk_1E61C78B0;
  v11[4] = self;
  id v12 = v7;
  id v13 = v8;
  SEL v14 = a2;
  id v9 = v8;
  id v10 = v7;
  [(CHSynchronizedLoggable *)self execute:v11];
}

void __46__CHManager_updateEmergencyMediaItemFor_with___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    int v10 = 138543874;
    id v11 = v3;
    __int16 v12 = 2114;
    uint64_t v13 = v4;
    __int16 v14 = 2114;
    uint64_t v15 = v5;
    _os_log_impl(&dword_1B8E4A000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@(%{public}@, mediaItem=%{public}@)", (uint8_t *)&v10, 0x20u);
  }
  if (*(void *)(a1 + 40))
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v7 = [*(id *)(a1 + 48) getDictionary];
    [v6 setObject:v7 forKeyedSubscript:kCallUpdatePropertyEmergencyMediaItem];

    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v8 setObject:v6 forKey:*(void *)(a1 + 40)];
    id v9 = [*(id *)(a1 + 32) syncManager];
    [v9 updateObjects:v8];
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __41__CHManager_updateMessageStatusFor_with___block_invoke_cold_1();
    }
  }
}

- (void)deleteTheseCallsSync:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v4 count])
  {
    uint64_t v6 = 0;
    while (1)
    {
      id v7 = [v4 objectAtIndexedSubscript:v6];
      if ([v7 multiCall]) {
        break;
      }
      __int16 v12 = [v7 uniqueId];

      if (v12)
      {
        id v8 = [v7 uniqueId];
        [v5 addObject:v8];
LABEL_12:
      }
      if (++v6 >= (unint64_t)[v4 count]) {
        goto LABEL_14;
      }
    }
    id v8 = [v7 callOccurrences];
    if ([v8 count])
    {
      unint64_t v9 = 0;
      do
      {
        int v10 = [v8 objectAtIndexedSubscript:v9];
        id v11 = [v10 objectForKeyedSubscript:@"kCHCallOccurrenceUniqueIdKey"];
        if (v11) {
          [v5 addObject:v11];
        }

        ++v9;
      }
      while (v9 < [v8 count]);
    }
    goto LABEL_12;
  }
LABEL_14:
  id v13 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v14 = [v5 count];
  if (v14)
  {
    uint64_t v15 = 0;
    uint64_t v16 = v14 - 1;
    while (1)
    {
      __int16 v17 = [v5 objectAtIndexedSubscript:v15];
      [v13 appendString:v17];

      if (v16 == v15) {
        break;
      }
      [v13 appendString:@","];
      ++v15;
    }
  }
  int v18 = [(CHSynchronizedLoggable *)self logHandle];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543618;
    uint64_t v23 = v19;
    __int16 v24 = 2114;
    id v25 = v13;
    _os_log_impl(&dword_1B8E4A000, v18, OS_LOG_TYPE_DEFAULT, "=> %{public}@(%{public}@)", buf, 0x16u);
  }
  long long v20 = [(CHManager *)self syncManager];
  [v20 deleteObjectsWithUniqueIds:v5 withTransaction:1];

  [(CHManager *)self setCacheIsDirty:1];
  [(CHManager *)self setFinishedLoadingAllCalls:0];
}

- (void)deleteTheseCalls:(id)a3
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __30__CHManager_deleteTheseCalls___block_invoke;
  v7[3] = &unk_1E61C7740;
  id v8 = v5;
  SEL v9 = a2;
  v7[4] = self;
  id v6 = v5;
  [(CHSynchronizedLoggable *)self execute:v7];
}

uint64_t __30__CHManager_deleteTheseCalls___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_1B8E4A000, v2, OS_LOG_TYPE_DEFAULT, "=> %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(a1 + 32) deleteTheseCallsSync:*(void *)(a1 + 40)];
}

- (void)deleteCall:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __24__CHManager_deleteCall___block_invoke;
  v6[3] = &unk_1E61C7568;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CHSynchronizedLoggable *)self execute:v6];
}

void __24__CHManager_deleteCall___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 40) uniqueId];
    *(_DWORD *)buf = 138543362;
    SEL v9 = v3;
    _os_log_impl(&dword_1B8E4A000, v2, OS_LOG_TYPE_DEFAULT, "=> deleteCall:%{public}@", buf, 0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4)
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v7 = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];
    [v5 deleteTheseCallsSync:v6];
  }
}

- (void)deleteCalls:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __40__CHManager_deleteCalls_withCompletion___block_invoke;
  v11[3] = &unk_1E61C7860;
  v11[4] = self;
  id v12 = v7;
  id v13 = v8;
  SEL v14 = a2;
  id v9 = v8;
  id v10 = v7;
  [(CHSynchronizedLoggable *)self execute:v11];
}

uint64_t __40__CHManager_deleteCalls_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 56));
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_1B8E4A000, v2, OS_LOG_TYPE_DEFAULT, "=> %{public}@", (uint8_t *)&v5, 0xCu);
  }
  [*(id *)(a1 + 32) deleteTheseCallsSync:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)deleteCallAtIndex:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __31__CHManager_deleteCallAtIndex___block_invoke;
  v3[3] = &unk_1E61C7900;
  v3[4] = self;
  v3[5] = a2;
  v3[6] = a3;
  [(CHSynchronizedLoggable *)self execute:v3];
}

void __31__CHManager_deleteCallAtIndex___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    uint64_t v4 = *(void *)(a1 + 48);
    int v8 = 138543618;
    id v9 = v3;
    __int16 v10 = 2048;
    uint64_t v11 = v4;
    _os_log_impl(&dword_1B8E4A000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@: User requested to delete call at index, %lu", (uint8_t *)&v8, 0x16u);
  }
  int v5 = [*(id *)(a1 + 32) fetchRecentCallsSyncWithCoalescing:1];
  unint64_t v6 = [v5 count];
  if (v6 && *(void *)(a1 + 48) < v6)
  {
    uint64_t v7 = objc_msgSend(v5, "objectAtIndex:");
    [*(id *)(a1 + 32) deleteCall:v7];
  }
}

- (void)deleteAllCallsSync
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(CHSynchronizedLoggable *)self logHandle];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = NSStringFromSelector(a2);
    int v8 = 138543362;
    id v9 = v5;
    _os_log_impl(&dword_1B8E4A000, v4, OS_LOG_TYPE_DEFAULT, "==> %{public}@: User requested to delete ALL calls (with the global limits of course)", (uint8_t *)&v8, 0xCu);
  }
  unint64_t v6 = [(CHManager *)self syncManager];
  uint64_t v7 = [(CHManager *)self getLimitsDictionary];
  [v6 deleteObjectsWithLimits:v7];

  [(CHManager *)self setCacheIsDirty:1];
  [(CHManager *)self setFinishedLoadingAllCalls:0];
}

- (void)deleteAllCalls
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __27__CHManager_deleteAllCalls__block_invoke;
  v2[3] = &unk_1E61C74A8;
  v2[4] = self;
  [(CHSynchronizedLoggable *)self execute:v2];
}

uint64_t __27__CHManager_deleteAllCalls__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deleteAllCallsSync];
}

- (void)clearDatabase
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __26__CHManager_clearDatabase__block_invoke;
  v2[3] = &unk_1E61C74A8;
  v2[4] = self;
  [(CHSynchronizedLoggable *)self execute:v2];
}

void __26__CHManager_clearDatabase__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) syncManager];
  [v1 deleteAllObjects];
}

- (void)setLimitingCallTypes:(unsigned int)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __34__CHManager_setLimitingCallTypes___block_invoke;
  v3[3] = &unk_1E61C7928;
  v3[4] = self;
  v3[5] = a2;
  unsigned int v4 = a3;
  [(CHSynchronizedLoggable *)self execute:v3];
}

uint64_t __34__CHManager_setLimitingCallTypes___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    unsigned int v4 = +[CHRecentCall callTypeAsString:*(unsigned int *)(a1 + 48)];
    int v5 = *(_DWORD *)(a1 + 48);
    int v7 = 138543874;
    int v8 = v3;
    __int16 v9 = 2114;
    uint64_t v10 = v4;
    __int16 v11 = 1024;
    int v12 = v5;
    _os_log_impl(&dword_1B8E4A000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@:%{public}@(0x%x)", (uint8_t *)&v7, 0x1Cu);
  }
  return [*(id *)(a1 + 32) setLimitingCallTypesSync:*(unsigned int *)(a1 + 48)];
}

- (void)setPostFetchingPredicate:(id)a3
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__CHManager_setPostFetchingPredicate___block_invoke;
  v7[3] = &unk_1E61C7740;
  id v8 = v5;
  SEL v9 = a2;
  v7[4] = self;
  id v6 = v5;
  [(CHSynchronizedLoggable *)self execute:v7];
}

uint64_t __38__CHManager_setPostFetchingPredicate___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138543618;
    int v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1B8E4A000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@:%{public}@", (uint8_t *)&v6, 0x16u);
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 80), *(id *)(a1 + 40));
  return [*(id *)(a1 + 32) setReCoalesce:1];
}

- (void)setLimitingStartDate:(id)a3
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__CHManager_setLimitingStartDate___block_invoke;
  v7[3] = &unk_1E61C7740;
  id v8 = v5;
  SEL v9 = a2;
  v7[4] = self;
  id v6 = v5;
  [(CHSynchronizedLoggable *)self execute:v7];
}

uint64_t __34__CHManager_setLimitingStartDate___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138543618;
    int v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1B8E4A000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@:%{public}@", (uint8_t *)&v6, 0x16u);
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), *(id *)(a1 + 40));
  [*(id *)(a1 + 32) setCacheIsDirty:1];
  return [*(id *)(a1 + 32) setFinishedLoadingAllCalls:0];
}

- (void)setLimitingEndDate:(id)a3
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__CHManager_setLimitingEndDate___block_invoke;
  v7[3] = &unk_1E61C7740;
  id v8 = v5;
  SEL v9 = a2;
  v7[4] = self;
  id v6 = v5;
  [(CHSynchronizedLoggable *)self execute:v7];
}

uint64_t __32__CHManager_setLimitingEndDate___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138543618;
    int v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1B8E4A000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@:%{public}@", (uint8_t *)&v6, 0x16u);
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), *(id *)(a1 + 40));
  [*(id *)(a1 + 32) setCacheIsDirty:1];
  return [*(id *)(a1 + 32) setFinishedLoadingAllCalls:0];
}

- (void)setShowsFaceTimeVideoCalls:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__CHManager_setShowsFaceTimeVideoCalls___block_invoke;
  v3[3] = &unk_1E61C7950;
  v3[4] = self;
  v3[5] = a2;
  BOOL v4 = a3;
  [(CHSynchronizedLoggable *)self execute:v3];
}

uint64_t __40__CHManager_setShowsFaceTimeVideoCalls___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v4 = *(unsigned __int8 *)(a1 + 48);
    *(_DWORD *)int v18 = 138543618;
    *(void *)&v18[4] = v3;
    *(_WORD *)&v18[12] = 1024;
    *(_DWORD *)&v18[14] = v4;
    _os_log_impl(&dword_1B8E4A000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@: User setting showsFaceTimeVideoCalls to %d", v18, 0x12u);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 25) = *(unsigned char *)(a1 + 48);
  int v5 = *(unsigned __int8 *)(a1 + 48);
  int v6 = [*(id *)(a1 + 32) logHandle];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v7) {
      goto LABEL_9;
    }
    unsigned int v8 = *(_DWORD *)(*(void *)(a1 + 32) + 36);
    uint64_t v9 = +[CHRecentCall callTypeAsString:v8];
    int v10 = *(_DWORD *)(*(void *)(a1 + 32) + 36) | 8;
    *(_DWORD *)int v18 = 67109890;
    *(_DWORD *)&v18[4] = v8;
    *(_WORD *)&v18[8] = 2114;
    *(void *)&v18[10] = v9;
    *(_WORD *)&v18[18] = 1024;
    *(_DWORD *)&v18[20] = 8;
    LOWORD(v19) = 1024;
    *(_DWORD *)((char *)&v19 + 2) = v10;
    __int16 v11 = "Old limitingCallType: 0x%x (%{public}@). OR Mask: 0x%x. New limitingCallType: 0x%x.";
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    unsigned int v12 = *(_DWORD *)(*(void *)(a1 + 32) + 36);
    uint64_t v9 = +[CHRecentCall callTypeAsString:v12];
    unsigned int v13 = *(_DWORD *)(*(void *)(a1 + 32) + 36) & 0xFFFFFFF7;
    *(_DWORD *)int v18 = 67109890;
    *(_DWORD *)&v18[4] = v12;
    *(_WORD *)&v18[8] = 2112;
    *(void *)&v18[10] = v9;
    *(_WORD *)&v18[18] = 1024;
    *(_DWORD *)&v18[20] = -9;
    LOWORD(v19) = 1024;
    *(_DWORD *)((char *)&v19 + 2) = v13;
    __int16 v11 = "Old limitingCallType: 0x%x (%@). AND Mask: 0x%x. New limitingCallType: 0x%x.";
  }
  _os_log_impl(&dword_1B8E4A000, v6, OS_LOG_TYPE_DEFAULT, v11, v18, 0x1Eu);

LABEL_9:
  SEL v14 = *(_DWORD **)(a1 + 32);
  int v15 = v14[9];
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v16 = v15 | 8u;
  }
  else {
    uint64_t v16 = v15 & 0xFFFFFFF7;
  }
  return objc_msgSend(v14, "setLimitingCallTypesSync:", v16, *(_OWORD *)v18, *(void *)&v18[16], v19);
}

- (void)setShowsFaceTimeAudioCalls:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__CHManager_setShowsFaceTimeAudioCalls___block_invoke;
  v3[3] = &unk_1E61C7950;
  v3[4] = self;
  v3[5] = a2;
  BOOL v4 = a3;
  [(CHSynchronizedLoggable *)self execute:v3];
}

uint64_t __40__CHManager_setShowsFaceTimeAudioCalls___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v4 = *(unsigned __int8 *)(a1 + 48);
    *(_DWORD *)int v15 = 138543618;
    *(void *)&v15[4] = v3;
    *(_WORD *)&v15[12] = 1024;
    *(_DWORD *)&v15[14] = v4;
    _os_log_impl(&dword_1B8E4A000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@: User setting showsFaceTimeAudioCalls to %d", v15, 0x12u);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 26) = *(unsigned char *)(a1 + 48);
  int v5 = *(unsigned __int8 *)(a1 + 48);
  int v6 = [*(id *)(a1 + 32) logHandle];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v7) {
      goto LABEL_9;
    }
    int v8 = *(_DWORD *)(*(void *)(a1 + 32) + 36);
    *(_DWORD *)int v15 = 67109632;
    *(_DWORD *)&v15[4] = v8;
    *(_WORD *)&v15[8] = 1024;
    *(_DWORD *)&v15[10] = 16;
    *(_WORD *)&v15[14] = 1024;
    *(_DWORD *)&v15[16] = v8 | 0x10;
    uint64_t v9 = "Old limitingCallType: 0x%x. OR Mask: 0x%x. New limitingCallType: 0x%x.";
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    int v10 = *(_DWORD *)(*(void *)(a1 + 32) + 36);
    *(_DWORD *)int v15 = 67109632;
    *(_DWORD *)&v15[4] = v10;
    *(_WORD *)&v15[8] = 1024;
    *(_DWORD *)&v15[10] = -17;
    *(_WORD *)&v15[14] = 1024;
    *(_DWORD *)&v15[16] = v10 & 0xFFFFFFEF;
    uint64_t v9 = "Old limitingCallType: 0x%x. AND Mask: 0x%x. New limitingCallType: 0x%x.";
  }
  _os_log_impl(&dword_1B8E4A000, v6, OS_LOG_TYPE_DEFAULT, v9, v15, 0x14u);
LABEL_9:

  __int16 v11 = *(_DWORD **)(a1 + 32);
  int v12 = v11[9];
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v13 = v12 | 0x10u;
  }
  else {
    uint64_t v13 = v12 & 0xFFFFFFEF;
  }
  return objc_msgSend(v11, "setLimitingCallTypesSync:", v13, *(_OWORD *)v15, *(void *)&v15[16]);
}

- (void)setShowsProtectedApps:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35__CHManager_setShowsProtectedApps___block_invoke;
  v3[3] = &unk_1E61C7950;
  v3[4] = self;
  v3[5] = a2;
  BOOL v4 = a3;
  [(CHSynchronizedLoggable *)self execute:v3];
}

uint64_t __35__CHManager_setShowsProtectedApps___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v4 = *(unsigned __int8 *)(a1 + 48);
    int v6 = 138543618;
    BOOL v7 = v3;
    __int16 v8 = 1024;
    int v9 = v4;
    _os_log_impl(&dword_1B8E4A000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@: User setting showsProtectedAppsTo to %d", (uint8_t *)&v6, 0x12u);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 27) = *(unsigned char *)(a1 + 48);
  return [*(id *)(a1 + 32) resetCalls];
}

- (NSSet)allowedProtectedAppBundleIDs
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__CHManager_allowedProtectedAppBundleIDs__block_invoke;
  v4[3] = &unk_1E61C7978;
  v4[4] = self;
  v2 = [(CHSynchronizedLoggable *)self executeSyncWithResult:v4];
  return (NSSet *)v2;
}

uint64_t __41__CHManager_allowedProtectedAppBundleIDs__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) allowedProtectedAppBundleIDs];
}

- (void)setAllowedProtectedAppBundleIDs:(id)a3
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__CHManager_setAllowedProtectedAppBundleIDs___block_invoke;
  v7[3] = &unk_1E61C7740;
  id v8 = v5;
  SEL v9 = a2;
  v7[4] = self;
  id v6 = v5;
  [(CHSynchronizedLoggable *)self execute:v7];
}

uint64_t __45__CHManager_setAllowedProtectedAppBundleIDs___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138543618;
    BOOL v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1B8E4A000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@: User setting allowedProtectedAppBundleIDs to %{public}@", (uint8_t *)&v6, 0x16u);
  }
  [*(id *)(*(void *)(a1 + 32) + 72) setAllowedProtectedAppBundleIDs:*(void *)(a1 + 40)];
  return [*(id *)(a1 + 32) resetCalls];
}

- (BOOL)showsTelephonyCalls
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __32__CHManager_showsTelephonyCalls__block_invoke;
  v3[3] = &unk_1E61C79A0;
  v3[4] = self;
  return [(CHSynchronizedLoggable *)self executeSyncWithBOOL:v3];
}

uint64_t __32__CHManager_showsTelephonyCalls__block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 24);
}

- (BOOL)showsFaceTimeVideoCalls
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__CHManager_showsFaceTimeVideoCalls__block_invoke;
  v3[3] = &unk_1E61C79A0;
  v3[4] = self;
  return [(CHSynchronizedLoggable *)self executeSyncWithBOOL:v3];
}

uint64_t __36__CHManager_showsFaceTimeVideoCalls__block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 25);
}

- (BOOL)showsFaceTimeAudioCalls
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__CHManager_showsFaceTimeAudioCalls__block_invoke;
  v3[3] = &unk_1E61C79A0;
  v3[4] = self;
  return [(CHSynchronizedLoggable *)self executeSyncWithBOOL:v3];
}

uint64_t __36__CHManager_showsFaceTimeAudioCalls__block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 25);
}

- (unsigned)limitingCallTypes
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x2020000000;
  unsigned int v8 = 0x80000000;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __30__CHManager_limitingCallTypes__block_invoke;
  v4[3] = &unk_1E61C79C8;
  v4[4] = self;
  void v4[5] = &v5;
  [(CHSynchronizedLoggable *)self executeSync:v4];
  unsigned int v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __30__CHManager_limitingCallTypes__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 36);
  return result;
}

- (NSDate)limitingStartDate
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __30__CHManager_limitingStartDate__block_invoke;
  v4[3] = &unk_1E61C79F0;
  v4[4] = self;
  unsigned int v2 = [(CHSynchronizedLoggable *)self executeSyncWithResult:v4];
  return (NSDate *)v2;
}

id __30__CHManager_limitingStartDate__block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 48);
}

- (NSDate)limitingEndDate
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __28__CHManager_limitingEndDate__block_invoke;
  v4[3] = &unk_1E61C79F0;
  v4[4] = self;
  unsigned int v2 = [(CHSynchronizedLoggable *)self executeSyncWithResult:v4];
  return (NSDate *)v2;
}

id __28__CHManager_limitingEndDate__block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 56);
}

- (NSArray)limitingCallKinds
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __30__CHManager_limitingCallKinds__block_invoke;
  v4[3] = &unk_1E61C7A18;
  v4[4] = self;
  unsigned int v2 = [(CHSynchronizedLoggable *)self executeSyncWithResult:v4];
  return (NSArray *)v2;
}

id __30__CHManager_limitingCallKinds__block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 64);
}

- (NSPredicate)postFetchingPredicate
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__CHManager_postFetchingPredicate__block_invoke;
  v4[3] = &unk_1E61C7A40;
  v4[4] = self;
  unsigned int v2 = [(CHSynchronizedLoggable *)self executeSyncWithResult:v4];
  return (NSPredicate *)v2;
}

id __34__CHManager_postFetchingPredicate__block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 80);
}

- (NSString)coalescingStrategy
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __31__CHManager_coalescingStrategy__block_invoke;
  v4[3] = &unk_1E61C7A68;
  v4[4] = self;
  unsigned int v2 = [(CHSynchronizedLoggable *)self executeSyncWithResult:v4];
  return (NSString *)v2;
}

id __31__CHManager_coalescingStrategy__block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 88);
}

- (void)setShowsTelephonyCalls:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__CHManager_setShowsTelephonyCalls___block_invoke;
  v3[3] = &unk_1E61C7950;
  v3[4] = self;
  void v3[5] = a2;
  BOOL v4 = a3;
  [(CHSynchronizedLoggable *)self execute:v3];
}

uint64_t __36__CHManager_setShowsTelephonyCalls___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unsigned int v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v4 = *(unsigned __int8 *)(a1 + 48);
    *(_DWORD *)int v15 = 138543618;
    *(void *)&v15[4] = v3;
    *(_WORD *)&v15[12] = 1024;
    *(_DWORD *)&v15[14] = v4;
    _os_log_impl(&dword_1B8E4A000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@: User setting showsTelephonyCalls to %d", v15, 0x12u);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = *(unsigned char *)(a1 + 48);
  int v5 = *(unsigned __int8 *)(a1 + 48);
  int v6 = [*(id *)(a1 + 32) logHandle];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v7) {
      goto LABEL_9;
    }
    int v8 = *(_DWORD *)(*(void *)(a1 + 32) + 36);
    *(_DWORD *)int v15 = 67109632;
    *(_DWORD *)&v15[4] = v8;
    *(_WORD *)&v15[8] = 1024;
    *(_DWORD *)&v15[10] = 7;
    *(_WORD *)&v15[14] = 1024;
    *(_DWORD *)&v15[16] = v8 | 7;
    uint64_t v9 = "Old limitingCallType: 0x%x. OR Mask: 0x%x. New limitingCallType: 0x%x.";
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    int v10 = *(_DWORD *)(*(void *)(a1 + 32) + 36);
    *(_DWORD *)int v15 = 67109632;
    *(_DWORD *)&v15[4] = v10;
    *(_WORD *)&v15[8] = 1024;
    *(_DWORD *)&v15[10] = -8;
    *(_WORD *)&v15[14] = 1024;
    *(_DWORD *)&v15[16] = v10 & 0xFFFFFFF8;
    uint64_t v9 = "Old limitingCallType: 0x%x. AND Mask: 0x%x. New limitingCallType: 0x%x.";
  }
  _os_log_impl(&dword_1B8E4A000, v6, OS_LOG_TYPE_DEFAULT, v9, v15, 0x14u);
LABEL_9:

  __int16 v11 = *(_DWORD **)(a1 + 32);
  int v12 = v11[9];
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v13 = v12 | 7u;
  }
  else {
    uint64_t v13 = v12 & 0xFFFFFFF8;
  }
  return objc_msgSend(v11, "setLimitingCallTypesSync:", v13, *(_OWORD *)v15, *(void *)&v15[16]);
}

- (double)callTimersGetIncoming
{
  uint64_t v5 = 0;
  int v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__CHManager_callTimersGetIncoming__block_invoke;
  v4[3] = &unk_1E61C7A90;
  v4[4] = self;
  void v4[5] = &v5;
  void v4[6] = a2;
  [(CHSynchronizedLoggable *)self executeSync:v4];
  double v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __34__CHManager_callTimersGetIncoming__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  double v2 = [*(id *)(a1 + 32) syncManager];
  [v2 timerIncoming];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;

  int v4 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    int v7 = 138543618;
    uint64_t v8 = v5;
    __int16 v9 = 2048;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1B8E4A000, v4, OS_LOG_TYPE_DEFAULT, "==> %{public}@ => %f seconds", (uint8_t *)&v7, 0x16u);
  }
}

- (double)callTimersGetOutgoing
{
  uint64_t v5 = 0;
  uint64_t v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__CHManager_callTimersGetOutgoing__block_invoke;
  v4[3] = &unk_1E61C7A90;
  v4[4] = self;
  void v4[5] = &v5;
  void v4[6] = a2;
  [(CHSynchronizedLoggable *)self executeSync:v4];
  double v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __34__CHManager_callTimersGetOutgoing__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  double v2 = [*(id *)(a1 + 32) syncManager];
  [v2 timerOutgoing];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;

  int v4 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    int v7 = 138543618;
    uint64_t v8 = v5;
    __int16 v9 = 2048;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1B8E4A000, v4, OS_LOG_TYPE_DEFAULT, "==> %{public}@ => %f seconds", (uint8_t *)&v7, 0x16u);
  }
}

- (double)callTimersGetLifetime
{
  uint64_t v5 = 0;
  uint64_t v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__CHManager_callTimersGetLifetime__block_invoke;
  v4[3] = &unk_1E61C7A90;
  v4[4] = self;
  void v4[5] = &v5;
  void v4[6] = a2;
  [(CHSynchronizedLoggable *)self executeSync:v4];
  double v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __34__CHManager_callTimersGetLifetime__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  double v2 = [*(id *)(a1 + 32) syncManager];
  [v2 timerLifetime];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;

  int v4 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    int v7 = 138543618;
    uint64_t v8 = v5;
    __int16 v9 = 2048;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1B8E4A000, v4, OS_LOG_TYPE_DEFAULT, "==> %{public}@ => %f seconds", (uint8_t *)&v7, 0x16u);
  }
}

- (void)callTimersReset
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __28__CHManager_callTimersReset__block_invoke;
  v2[3] = &unk_1E61C7AB8;
  v2[4] = self;
  void v2[5] = a2;
  [(CHSynchronizedLoggable *)self execute:v2];
}

void __28__CHManager_callTimersReset__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  double v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1B8E4A000, v2, OS_LOG_TYPE_DEFAULT, "==> %{public}@: User requested to reset call timers", (uint8_t *)&v5, 0xCu);
  }
  int v4 = [*(id *)(a1 + 32) syncManager];
  [v4 resetTimers];
}

+ (unsigned)CHCallStatusForCallWithDuration:(double)a3 isOriginated:(BOOL)a4 isAnswered:(BOOL)a5
{
  int v5 = (unsigned int *)&kCHCallStatusConnectedIncoming;
  uint64_t v6 = &kCHCallStatusMissed;
  if (a5) {
    uint64_t v6 = &kCHCallStatusAnsweredElsewhere;
  }
  if (a3 > 0.0)
  {
    uint64_t v7 = &kCHCallStatusConnectedOutgoing;
  }
  else
  {
    int v5 = (unsigned int *)v6;
    uint64_t v7 = &kCHCallStatusCancelled;
  }
  if (a4) {
    int v5 = (unsigned int *)v7;
  }
  return *v5;
}

- (void)flush
{
}

- (void)addMultipleCallsToCallHistoryWithTransactions:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__CHManager_addMultipleCallsToCallHistoryWithTransactions___block_invoke;
  v6[3] = &unk_1E61C7568;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CHSynchronizedLoggable *)self execute:v6];
}

void __59__CHManager_addMultipleCallsToCallHistoryWithTransactions___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) syncManager];
  [v2 insertRecords:*(void *)(a1 + 40)];
}

- (void)addMultipleCallsToCallHistory:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__CHManager_addMultipleCallsToCallHistory___block_invoke;
  v6[3] = &unk_1E61C7568;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CHSynchronizedLoggable *)self execute:v6];
}

void __43__CHManager_addMultipleCallsToCallHistory___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) syncManager];
  [v2 insertRecordsWithoutTransactions:*(void *)(a1 + 40)];
}

- (int64_t)setRead:(BOOL)a3 forCallsWithPredicate:(id)a4
{
  id v6 = a4;
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __43__CHManager_setRead_forCallsWithPredicate___block_invoke;
  v10[3] = &unk_1E61C7AE0;
  v10[4] = self;
  id v7 = v6;
  id v11 = v7;
  int v12 = &v14;
  BOOL v13 = a3;
  [(CHSynchronizedLoggable *)self executeSync:v10];
  int64_t v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __43__CHManager_setRead_forCallsWithPredicate___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v3;
    _os_log_impl(&dword_1B8E4A000, v2, OS_LOG_TYPE_DEFAULT, "Updating read status for calls matching predicate %@", buf, 0xCu);
  }

  id v4 = [*(id *)(a1 + 32) syncManager];
  uint64_t v5 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 40);
  id v11 = 0;
  uint64_t v7 = [v4 setRead:v5 forCallsWithPredicate:v6 error:&v11];
  id v8 = v11;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v7;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL && v8 != 0)
  {
    uint64_t v10 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __43__CHManager_setRead_forCallsWithPredicate___block_invoke_cold_1();
    }
  }
}

- (int64_t)deleteCallsWithPredicate:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__CHManager_deleteCallsWithPredicate___block_invoke;
  v8[3] = &unk_1E61C7B30;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  uint64_t v10 = &v11;
  [(CHSynchronizedLoggable *)self executeSync:v8];
  int64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __38__CHManager_deleteCallsWithPredicate___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = v3;
    _os_log_impl(&dword_1B8E4A000, v2, OS_LOG_TYPE_DEFAULT, "Deleting calls matching predicate %@", buf, 0xCu);
  }

  id v4 = [*(id *)(a1 + 32) syncManager];
  uint64_t v5 = *(void *)(a1 + 40);
  id v10 = 0;
  uint64_t v6 = [v4 deleteCallsWithPredicate:v5 error:&v10];
  id v7 = v10;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v6;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL && v7 != 0)
  {
    id v9 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __38__CHManager_deleteCallsWithPredicate___block_invoke_cold_1();
    }
  }
}

- (void)deleteCallsWithPredicate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __49__CHManager_deleteCallsWithPredicate_completion___block_invoke;
  v10[3] = &unk_1E61C7B58;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(CHSynchronizedLoggable *)self execute:v10];
}

void __49__CHManager_deleteCallsWithPredicate_completion___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v3;
    _os_log_impl(&dword_1B8E4A000, v2, OS_LOG_TYPE_DEFAULT, "Deleting calls matching predicate %@", buf, 0xCu);
  }

  id v4 = [*(id *)(a1 + 32) syncManager];
  uint64_t v5 = *(void *)(a1 + 40);
  id v11 = 0;
  uint64_t v6 = [v4 deleteCallsWithPredicate:v5 error:&v11];
  id v7 = v11;

  if (v6 == 0x7FFFFFFFFFFFFFFFLL && v7 != 0)
  {
    id v9 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __38__CHManager_deleteCallsWithPredicate___block_invoke_cold_1();
    }
  }
  uint64_t v10 = *(void *)(a1 + 48);
  if (v10) {
    (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, v6);
  }
}

- (id)callsWithPredicate:(id)a3 limit:(unint64_t)a4 offset:(unint64_t)a5 batchSize:(unint64_t)a6
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__1;
  uint64_t v28 = __Block_byref_object_dispose__1;
  id v29 = 0;
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"date" ascending:0];
  v30[0] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __55__CHManager_callsWithPredicate_limit_offset_batchSize___block_invoke;
  v17[3] = &unk_1E61C7BA8;
  v17[4] = self;
  id v13 = v10;
  id v18 = v13;
  uint64_t v20 = &v24;
  id v14 = v12;
  id v19 = v14;
  unint64_t v21 = a4;
  unint64_t v22 = a5;
  unint64_t v23 = a6;
  [(CHSynchronizedLoggable *)self executeSync:v17];
  id v15 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v15;
}

void __55__CHManager_callsWithPredicate_limit_offset_batchSize___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v22 = v3;
    _os_log_impl(&dword_1B8E4A000, v2, OS_LOG_TYPE_DEFAULT, "Retrieving calls matching predicate %@", buf, 0xCu);
  }

  id v4 = [*(id *)(a1 + 32) getLimitsDictionaryForPrivateHeader];
  uint64_t v5 = [*(id *)(a1 + 32) syncManager];
  uint64_t v6 = [v5 fetchCallsWithPredicate:*(void *)(a1 + 40) sortDescriptors:*(void *)(a1 + 48) limitsDictionary:v4 limit:*(void *)(a1 + 64) offset:*(void *)(a1 + 72) batchSize:*(void *)(a1 + 80)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v16 + 1) + 8 * v13);
        id v15 = objc_msgSend(*(id *)(a1 + 32), "phoneBookManager", (void)v16);
        [v14 setPhoneBookManager:v15];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
}

- (id)callIdentifiersWithPredicate:(id)a3 limit:(unint64_t)a4 offset:(unint64_t)a5 batchSize:(unint64_t)a6
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__1;
  uint64_t v28 = __Block_byref_object_dispose__1;
  id v29 = 0;
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"date" ascending:0];
  v30[0] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __65__CHManager_callIdentifiersWithPredicate_limit_offset_batchSize___block_invoke;
  v17[3] = &unk_1E61C7BA8;
  v17[4] = self;
  id v13 = v10;
  id v18 = v13;
  uint64_t v20 = &v24;
  id v14 = v12;
  id v19 = v14;
  unint64_t v21 = a4;
  unint64_t v22 = a5;
  unint64_t v23 = a6;
  [(CHSynchronizedLoggable *)self executeSync:v17];
  id v15 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v15;
}

void __65__CHManager_callIdentifiersWithPredicate_limit_offset_batchSize___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v9 = 138412290;
    uint64_t v10 = v3;
    _os_log_impl(&dword_1B8E4A000, v2, OS_LOG_TYPE_DEFAULT, "Retrieving identifiers for calls matching predicate %@", (uint8_t *)&v9, 0xCu);
  }

  id v4 = [*(id *)(a1 + 32) getLimitsDictionaryForPrivateHeader];
  uint64_t v5 = [*(id *)(a1 + 32) syncManager];
  uint64_t v6 = [v5 fetchCallIdentifiersWithPredicate:*(void *)(a1 + 40) sortDescriptors:*(void *)(a1 + 48) limitsDictionary:v4 limit:*(void *)(a1 + 64) offset:*(void *)(a1 + 72) batchSize:*(void *)(a1 + 80)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (unint64_t)coalescedCallCountWithPredicate:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"date" ascending:0];
  v19[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __45__CHManager_coalescedCallCountWithPredicate___block_invoke;
  v11[3] = &unk_1E61C7B80;
  v11[4] = self;
  id v7 = v4;
  id v12 = v7;
  id v14 = &v15;
  id v8 = v6;
  id v13 = v8;
  [(CHSynchronizedLoggable *)self executeSync:v11];
  unint64_t v9 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __45__CHManager_coalescedCallCountWithPredicate___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1B8E4A000, v2, OS_LOG_TYPE_DEFAULT, "Retrieving count of coalesced calls matching predicate %@", (uint8_t *)&v6, 0xCu);
  }

  id v4 = [*(id *)(a1 + 32) getLimitsDictionaryForPrivateHeader];
  uint64_t v5 = [*(id *)(a1 + 32) syncManager];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v5 fetchCoalescedCallCountWithPredicate:*(void *)(a1 + 40) sortDescriptors:*(void *)(a1 + 48) limitsDictionary:v4];
}

- (id)coalescedCallsWithPredicate:(id)a3 limit:(unint64_t)a4 offset:(unint64_t)a5 batchSize:(unint64_t)a6
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__1;
  uint64_t v28 = __Block_byref_object_dispose__1;
  id v29 = 0;
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"date" ascending:0];
  v30[0] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64__CHManager_coalescedCallsWithPredicate_limit_offset_batchSize___block_invoke;
  v17[3] = &unk_1E61C7BA8;
  v17[4] = self;
  id v13 = v10;
  id v18 = v13;
  uint64_t v20 = &v24;
  id v14 = v12;
  id v19 = v14;
  unint64_t v21 = a4;
  unint64_t v22 = a5;
  unint64_t v23 = a6;
  [(CHSynchronizedLoggable *)self executeSync:v17];
  id v15 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v15;
}

void __64__CHManager_coalescedCallsWithPredicate_limit_offset_batchSize___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v22 = v3;
    _os_log_impl(&dword_1B8E4A000, v2, OS_LOG_TYPE_DEFAULT, "Retrieving coalesced calls matching predicate %@", buf, 0xCu);
  }

  id v4 = [*(id *)(a1 + 32) getLimitsDictionaryForPrivateHeader];
  uint64_t v5 = [*(id *)(a1 + 32) syncManager];
  uint64_t v6 = [v5 fetchCoalescedCallsWithPredicate:*(void *)(a1 + 40) sortDescriptors:*(void *)(a1 + 48) limitsDictionary:v4 limit:*(void *)(a1 + 64) offset:*(void *)(a1 + 72) batchSize:*(void *)(a1 + 80)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v16 + 1) + 8 * v13);
        id v15 = objc_msgSend(*(id *)(a1 + 32), "phoneBookManager", (void)v16);
        [v14 setPhoneBookManager:v15];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
}

- (id)latestRecentCallMatchingPredicate:(id)a3
{
  uint64_t v3 = [(CHManager *)self callsWithPredicate:a3 limit:1 offset:0 batchSize:1];
  id v4 = [v3 firstObject];

  return v4;
}

- (id)latestCallMatchingNormalizedRemoteParticipantHandleValues:(id)a3
{
  void v11[2] = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY remoteParticipantHandles.normalizedValue IN %@", a3];
  uint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(service_provider = %@) OR (service_provider = %@)", @"com.apple.FaceTime", @"com.apple.Telephony"];
  uint64_t v6 = (void *)MEMORY[0x1E4F28BA0];
  v11[0] = v5;
  v11[1] = v4;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  uint64_t v8 = [v6 andPredicateWithSubpredicates:v7];

  id v9 = [(CHManager *)self latestRecentCallMatchingPredicate:v8];

  return v9;
}

- (void)protectedAppsChanged
{
  uint64_t v3 = [(CHSynchronizedLoggable *)self logHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1B8E4A000, v3, OS_LOG_TYPE_DEFAULT, "CHManager reset calls because protected apps changed", v4, 2u);
  }

  [(CHManager *)self resetCalls];
  notifyClientsOfEvent(@"kCallHistoryDatabaseChangedNotification", 0);
}

- (NSPredicate)preFetchingPredicate
{
  return self->_preFetchingPredicate;
}

- (void)setRecentCalls:(id)a3
{
}

- (BOOL)generateSyncTransactions
{
  return self->_generateSyncTransactions;
}

- (void)setGenerateSyncTransactions:(BOOL)a3
{
  self->_generateSyncTransactions = a3;
}

- (int64_t)numberOfUnseenMissedCalls
{
  return self->_numberOfUnseenMissedCalls;
}

- (void)setNumberOfUnseenMissedCalls:(int64_t)a3
{
  self->_numberOfUnseenMissedCalls = a3;
}

- (void)setSyncManager:(id)a3
{
}

- (BOOL)reCoalesce
{
  return self->_reCoalesce;
}

- (void)setUncoalescedRecentCalls:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uncoalescedUnFilteredRecentCalls, 0);
  objc_storeStrong((id *)&self->_uncoalescedRecentCalls, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_phoneBookManager, 0);
  objc_storeStrong((id *)&self->_recentCalls, 0);
  objc_storeStrong((id *)&self->_coalescingStrategy, 0);
  objc_storeStrong((id *)&self->_postFetchingPredicate, 0);
  objc_storeStrong((id *)&self->_protectedAppProvider, 0);
  objc_storeStrong((id *)&self->_limitingCallKinds, 0);
  objc_storeStrong((id *)&self->_limitingEndDate, 0);
  objc_storeStrong((id *)&self->_limitingStartDate, 0);
  objc_storeStrong((id *)&self->_preFetchingPredicate, 0);
}

- (void)coalescedCallsWithCalls:(void *)a3 usingStrategy:(NSObject *)a4 .cold.1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 uniqueId];
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_error_impl(&dword_1B8E4A000, a4, OS_LOG_TYPE_ERROR, "Coalescing hash not found for call with uniqueID %{public}@", a1, 0xCu);
}

- (void)fetchRecentCallsSyncWithCoalescing:(id *)a1 .cold.1(id *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [*a1 count];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1B8E4A000, a2, OS_LOG_TYPE_DEBUG, "After coalescing we have %lu calls", v3, 0xCu);
}

void __43__CHManager_updateBytesOfDataUsedFor_with___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B8E4A000, v0, v1, "Cannot update. Nil unique id or bytes used!", v2, v3, v4, v5, v6);
}

void __41__CHManager_updateMessageStatusFor_with___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1B8E4A000, v0, v1, "Cannot update. Nil unique id used!", v2, v3, v4, v5, v6);
}

void __43__CHManager_setRead_forCallsWithPredicate___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B8E4A000, v0, v1, "Could not update calls; operation failed with error %{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __38__CHManager_deleteCallsWithPredicate___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1B8E4A000, v0, v1, "Could not delete calls; operation failed with error %{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

@end