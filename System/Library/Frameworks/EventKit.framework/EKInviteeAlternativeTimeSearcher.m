@interface EKInviteeAlternativeTimeSearcher
+ (BOOL)_span:(id)a3 hasSameConflictedParticipantsAsSpan:(id)a4;
+ (id)_addressesForParticipants:(id)a3;
+ (id)_allButFirstItemInArray:(id)a3;
+ (id)_allButLastItemInArray:(id)a3;
+ (id)_findHighestRankedNonOptimalTimeSpans:(id)a3;
+ (id)_findLeftoverSpans:(id)a3 usingFreeTimes:(id)a4 andNonOptimalTimes:(id)a5;
+ (id)_rankNonOptimalTimeSpans:(id)a3;
+ (id)_selfOrganizerForNewlyScheduledEventWithAddress:(id)a3;
+ (id)stateAsString:(int64_t)a3;
+ (int64_t)_binarySearchForIndexOfTimeSpanInArray:(id)a3 containingDate:(id)a4;
+ (int64_t)_invalidBinarySearchIndex;
+ (void)_insertUniqueParticipants:(id)a3 intoExistingParticipantsArray:(id)a4;
+ (void)_validateSpans:(id)a3;
- (BOOL)availabilityRequestInProgress;
- (BOOL)internalSearchingForMoreTimesWhenAllAttendeesCanAttend;
- (BOOL)internalSearchingForMoreTimesWhenSomeAttendeesCanAttend;
- (BOOL)noConflictRequired;
- (BOOL)searchingForMoreTimesWhenAllAttendeesCanAttend;
- (BOOL)searchingForMoreTimesWhenSomeAttendeesCanAttend;
- (EKInviteeAlternativeTimeSearcher)initWithStateChangedCallback:(id)a3;
- (EKSource)source;
- (NSArray)originalConflictedParticipants;
- (NSArray)proposedTimes;
- (NSArray)timesWhenAllAttendeesCanAttend;
- (NSArray)timesWhenSomeAttendeesCanAttend;
- (NSDate)internalOriginalEndDate;
- (NSDate)internalOriginalStartDate;
- (NSDate)nextAvailabilityRangeStartDate;
- (NSDate)originalEndDate;
- (NSDate)originalRangeStartDate;
- (NSDate)originalStartDate;
- (NSMutableArray)internalOriginalConflictedParticipants;
- (NSMutableArray)internalProposedStarts;
- (NSMutableArray)internalProposedTimes;
- (NSMutableArray)internalTimesWhenAllAttendeesCanAttend;
- (NSMutableArray)internalTimesWhenSomeAttendeesCanAttend;
- (NSMutableArray)leftoverSpans;
- (NSMutableDictionary)participantAddressesToParticipants;
- (NSOperationQueue)availabilityRequestsQueue;
- (NSString)ignoredEventID;
- (NSString)organizerAddress;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)processingQueue;
- (double)availabilitySearchDurationMultiplier;
- (id)_filterOutUnreasonableTimeSlots:(id)a3;
- (id)_generateNonOptimalTimesFromTimeSpans:(id)a3;
- (id)_generateOpenFreeTimesFromTimeSpans:(id)a3;
- (id)_generateTimeSpansForResults:(id)a3 betweenStartDate:(id)a4 endDate:(id)a5;
- (id)_mergeAdjacentSpansWithSameConflictedParticipants:(id)a3;
- (id)_participantforParticipantAddress:(id)a3;
- (id)_spliceLeftTimeSpans:(id)a3 andNewTimeSpans:(id)a4;
- (id)stateChanged;
- (unint64_t)remainingSearchAttempts;
- (void)_attemptSearch;
- (void)_haltSearchWithError:(BOOL)a3;
- (void)_processResults:(id)a3 betweenStartDate:(id)a4 endDate:(id)a5;
- (void)_resetSearchFallbackNumbers;
- (void)_sendStateChange:(int64_t)a3;
- (void)_transitionToConflictFoundStateAndSearch;
- (void)dealloc;
- (void)resetWithEvent:(id)a3 organizerAddressForNewlyScheduledEvent:(id)a4;
- (void)searchForMoreTimesWhenAllAttendeesCanAttend;
- (void)searchForMoreTimesWhenSomeAttendeesCanAttend;
- (void)setAvailabilityRequestInProgress:(BOOL)a3;
- (void)setAvailabilityRequestsQueue:(id)a3;
- (void)setAvailabilitySearchDurationMultiplier:(double)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setIgnoredEventID:(id)a3;
- (void)setInternalOriginalConflictedParticipants:(id)a3;
- (void)setInternalOriginalEndDate:(id)a3;
- (void)setInternalOriginalStartDate:(id)a3;
- (void)setInternalProposedStarts:(id)a3;
- (void)setInternalProposedTimes:(id)a3;
- (void)setInternalSearchingForMoreTimesWhenAllAttendeesCanAttend:(BOOL)a3;
- (void)setInternalSearchingForMoreTimesWhenSomeAttendeesCanAttend:(BOOL)a3;
- (void)setInternalTimesWhenAllAttendeesCanAttend:(id)a3;
- (void)setInternalTimesWhenSomeAttendeesCanAttend:(id)a3;
- (void)setLeftoverSpans:(id)a3;
- (void)setNextAvailabilityRangeStartDate:(id)a3;
- (void)setNoConflictRequired:(BOOL)a3;
- (void)setOrganizerAddress:(id)a3;
- (void)setOriginalRangeStartDate:(id)a3;
- (void)setParticipantAddressesToParticipants:(id)a3;
- (void)setProcessingQueue:(id)a3;
- (void)setRemainingSearchAttempts:(unint64_t)a3;
- (void)setSource:(id)a3;
- (void)setStateChanged:(id)a3;
@end

@implementation EKInviteeAlternativeTimeSearcher

- (EKInviteeAlternativeTimeSearcher)initWithStateChangedCallback:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)EKInviteeAlternativeTimeSearcher;
  v5 = [(EKInviteeAlternativeTimeSearcher *)&v22 init];
  v6 = v5;
  if (v5)
  {
    [(EKInviteeAlternativeTimeSearcher *)v5 setStateChanged:v4];
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(EKInviteeAlternativeTimeSearcher *)v6 setParticipantAddressesToParticipants:v7];

    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(EKInviteeAlternativeTimeSearcher *)v6 setInternalTimesWhenAllAttendeesCanAttend:v8];

    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(EKInviteeAlternativeTimeSearcher *)v6 setInternalTimesWhenSomeAttendeesCanAttend:v9];

    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(EKInviteeAlternativeTimeSearcher *)v6 setInternalOriginalConflictedParticipants:v10];

    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(EKInviteeAlternativeTimeSearcher *)v6 setInternalProposedTimes:v11];

    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(EKInviteeAlternativeTimeSearcher *)v6 setLeftoverSpans:v12];

    id v13 = objc_alloc_init(MEMORY[0x1E4F28F08]);
    objc_opt_class();
    v14 = CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    [v13 setName:v14];

    [(EKInviteeAlternativeTimeSearcher *)v6 setAvailabilityRequestsQueue:v13];
    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    id v15 = objc_claimAutoreleasedReturnValue();
    v16 = (const char *)[v15 UTF8String];

    dispatch_queue_t v17 = dispatch_queue_create(v16, 0);
    [(EKInviteeAlternativeTimeSearcher *)v6 setProcessingQueue:v17];

    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    id v18 = objc_claimAutoreleasedReturnValue();
    v19 = (const char *)[v18 UTF8String];

    dispatch_queue_t v20 = dispatch_queue_create(v19, 0);
    [(EKInviteeAlternativeTimeSearcher *)v6 setCallbackQueue:v20];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [(EKInviteeAlternativeTimeSearcher *)self availabilityRequestsQueue];
  [v3 cancelAllOperations];

  v4.receiver = self;
  v4.super_class = (Class)EKInviteeAlternativeTimeSearcher;
  [(EKInviteeAlternativeTimeSearcher *)&v4 dealloc];
}

- (NSDate)originalStartDate
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__6;
  id v11 = __Block_byref_object_dispose__6;
  id v12 = 0;
  v3 = [(EKInviteeAlternativeTimeSearcher *)self processingQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__EKInviteeAlternativeTimeSearcher_originalStartDate__block_invoke;
  v6[3] = &unk_1E5B96F20;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDate *)v4;
}

uint64_t __53__EKInviteeAlternativeTimeSearcher_originalStartDate__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) internalOriginalStartDate];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (NSDate)originalEndDate
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__6;
  id v11 = __Block_byref_object_dispose__6;
  id v12 = 0;
  uint64_t v3 = [(EKInviteeAlternativeTimeSearcher *)self processingQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__EKInviteeAlternativeTimeSearcher_originalEndDate__block_invoke;
  v6[3] = &unk_1E5B96F20;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDate *)v4;
}

uint64_t __51__EKInviteeAlternativeTimeSearcher_originalEndDate__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) internalOriginalEndDate];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (NSArray)originalConflictedParticipants
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__6;
  id v11 = __Block_byref_object_dispose__6;
  id v12 = 0;
  uint64_t v3 = [(EKInviteeAlternativeTimeSearcher *)self processingQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__EKInviteeAlternativeTimeSearcher_originalConflictedParticipants__block_invoke;
  v6[3] = &unk_1E5B96F20;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __66__EKInviteeAlternativeTimeSearcher_originalConflictedParticipants__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) internalOriginalConflictedParticipants];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSArray)timesWhenAllAttendeesCanAttend
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__6;
  id v11 = __Block_byref_object_dispose__6;
  id v12 = 0;
  uint64_t v3 = [(EKInviteeAlternativeTimeSearcher *)self processingQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__EKInviteeAlternativeTimeSearcher_timesWhenAllAttendeesCanAttend__block_invoke;
  v6[3] = &unk_1E5B96F20;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __66__EKInviteeAlternativeTimeSearcher_timesWhenAllAttendeesCanAttend__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) internalTimesWhenAllAttendeesCanAttend];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSArray)timesWhenSomeAttendeesCanAttend
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__6;
  id v11 = __Block_byref_object_dispose__6;
  id v12 = 0;
  uint64_t v3 = [(EKInviteeAlternativeTimeSearcher *)self processingQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__EKInviteeAlternativeTimeSearcher_timesWhenSomeAttendeesCanAttend__block_invoke;
  v6[3] = &unk_1E5B96F20;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __67__EKInviteeAlternativeTimeSearcher_timesWhenSomeAttendeesCanAttend__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) internalTimesWhenSomeAttendeesCanAttend];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSArray)proposedTimes
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__6;
  id v11 = __Block_byref_object_dispose__6;
  id v12 = 0;
  uint64_t v3 = [(EKInviteeAlternativeTimeSearcher *)self processingQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__EKInviteeAlternativeTimeSearcher_proposedTimes__block_invoke;
  v6[3] = &unk_1E5B96F20;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __49__EKInviteeAlternativeTimeSearcher_proposedTimes__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) internalProposedTimes];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)searchingForMoreTimesWhenAllAttendeesCanAttend
{
  uint64_t v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(EKInviteeAlternativeTimeSearcher *)self processingQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __82__EKInviteeAlternativeTimeSearcher_searchingForMoreTimesWhenAllAttendeesCanAttend__block_invoke;
  v5[3] = &unk_1E5B96F20;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __82__EKInviteeAlternativeTimeSearcher_searchingForMoreTimesWhenAllAttendeesCanAttend__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) internalSearchingForMoreTimesWhenAllAttendeesCanAttend];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)searchingForMoreTimesWhenSomeAttendeesCanAttend
{
  uint64_t v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(EKInviteeAlternativeTimeSearcher *)self processingQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __83__EKInviteeAlternativeTimeSearcher_searchingForMoreTimesWhenSomeAttendeesCanAttend__block_invoke;
  v5[3] = &unk_1E5B96F20;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __83__EKInviteeAlternativeTimeSearcher_searchingForMoreTimesWhenSomeAttendeesCanAttend__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) internalSearchingForMoreTimesWhenSomeAttendeesCanAttend];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)searchForMoreTimesWhenAllAttendeesCanAttend
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "A request to search for more times when all attendees can attend was made.", v2, v3, v4, v5, v6);
}

uint64_t __79__EKInviteeAlternativeTimeSearcher_searchForMoreTimesWhenAllAttendeesCanAttend__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setInternalSearchingForMoreTimesWhenAllAttendeesCanAttend:1];
  [*(id *)(a1 + 32) _resetSearchFallbackNumbers];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _attemptSearch];
}

- (void)searchForMoreTimesWhenSomeAttendeesCanAttend
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "A request to search for more times when some attendees can attend was made.", v2, v3, v4, v5, v6);
}

uint64_t __80__EKInviteeAlternativeTimeSearcher_searchForMoreTimesWhenSomeAttendeesCanAttend__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setInternalSearchingForMoreTimesWhenSomeAttendeesCanAttend:1];
  [*(id *)(a1 + 32) _resetSearchFallbackNumbers];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _attemptSearch];
}

- (void)resetWithEvent:(id)a3 organizerAddressForNewlyScheduledEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(EKInviteeAlternativeTimeSearcher *)self processingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke;
  block[3] = &unk_1E5B97190;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke(uint64_t a1)
{
  uint64_t v135 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = [*(id *)(a1 + 32) availabilityRequestsQueue];
  [v1 cancelAllOperations];

  uint64_t v2 = EKUIAvailabilitySearchHandle;
  if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG)) {
    __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_16(a1, v2);
  }
  [*(id *)(a1 + 32) setAvailabilityRequestInProgress:0];
  [*(id *)(a1 + 32) setInternalSearchingForMoreTimesWhenAllAttendeesCanAttend:0];
  [*(id *)(a1 + 32) setInternalSearchingForMoreTimesWhenSomeAttendeesCanAttend:0];
  uint64_t v3 = [*(id *)(a1 + 32) internalTimesWhenAllAttendeesCanAttend];
  [v3 removeAllObjects];

  uint64_t v4 = [*(id *)(a1 + 32) internalTimesWhenSomeAttendeesCanAttend];
  [v4 removeAllObjects];

  uint64_t v5 = [*(id *)(a1 + 32) internalProposedTimes];
  [v5 removeAllObjects];

  id v6 = [*(id *)(a1 + 32) internalOriginalConflictedParticipants];
  [v6 removeAllObjects];

  id v7 = [*(id *)(a1 + 32) participantAddressesToParticipants];
  [v7 removeAllObjects];

  uint64_t v8 = [*(id *)(a1 + 32) leftoverSpans];
  [v8 removeAllObjects];

  [*(id *)(a1 + 32) setNextAvailabilityRangeStartDate:0];
  [*(id *)(a1 + 32) setInternalOriginalStartDate:0];
  [*(id *)(a1 + 32) setInternalOriginalEndDate:0];
  [*(id *)(a1 + 32) setOriginalRangeStartDate:0];
  [*(id *)(a1 + 32) setSource:0];
  [*(id *)(a1 + 32) setIgnoredEventID:0];
  [*(id *)(a1 + 32) setOrganizerAddress:0];
  [*(id *)(a1 + 32) _resetSearchFallbackNumbers];
  [*(id *)(a1 + 32) _sendStateChange:0];
  id v9 = (id *)(a1 + 40);
  id v10 = [*(id *)(a1 + 40) constraints];
  char v11 = [v10 supportsAvailabilityRequests];

  if (*(void *)(a1 + 40))
  {
    if (v11)
    {
      id v12 = [*(id *)(a1 + 40) startDate];
      id v13 = [*v9 endDateUnadjustedForLegacyClients];
      int v14 = [v12 isEqualToDate:v13];

      if (v14)
      {
        if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG)) {
          __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_2();
        }
        return;
      }
      if ([*v9 isAllDay])
      {
        if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG)) {
          __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_3();
        }
        return;
      }
      char v15 = [*v9 isDetached];
      id v16 = *v9;
      if (v15)
      {
        dispatch_queue_t v17 = [v16 originalItem];
        v88 = [v17 uniqueId];
      }
      else
      {
        v88 = [v16 uniqueId];
      }
      id v18 = (void *)EKUIAvailabilitySearchHandle;
      if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG)) {
        __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_14(v9, v18, (uint64_t)v88);
      }
      v84 = objc_opt_new();
      v19 = [*(id *)(a1 + 40) startDate];
      [*(id *)(a1 + 32) setInternalOriginalStartDate:v19];

      dispatch_queue_t v20 = [*(id *)(a1 + 40) endDateUnadjustedForLegacyClients];
      [*(id *)(a1 + 32) setInternalOriginalEndDate:v20];

      v87 = objc_opt_new();
      v21 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      objc_super v22 = [*(id *)(a1 + 40) timeZone];
      if (!v22) {
        goto LABEL_22;
      }
      v23 = [v21 timeZone];
      v24 = [*v9 timeZone];
      char v25 = [v23 isEqualToTimeZone:v24];

      if ((v25 & 1) == 0)
      {
        v27 = (void *)[v21 copy];

        v28 = [*v9 timeZone];
        [v27 setTimeZone:v28];

        v26 = v27;
      }
      else
      {
LABEL_22:
        v26 = v21;
      }
      v86 = v26;
      v29 = objc_msgSend(v87, "dateByAddingHours:inCalendar:", 1);
      v85 = [v29 dateRoundedToNearestFifteenMinutesInCalendar:v86];

      [*(id *)(a1 + 32) setOriginalRangeStartDate:v85];
      v30 = [*(id *)(a1 + 32) originalRangeStartDate];
      [*(id *)(a1 + 32) setNextAvailabilityRangeStartDate:v30];

      [*(id *)(a1 + 32) setIgnoredEventID:v88];
      v31 = [*(id *)(a1 + 40) calendar];
      v32 = [v31 source];
      [*(id *)(a1 + 32) setSource:v32];

      if ([*(id *)(a1 + 40) isStartDateDirty]) {
        int v99 = 1;
      }
      else {
        int v99 = [*v9 isEndDateDirty];
      }
      id v91 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v98 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG)) {
        __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_13();
      }
      v92 = [*v9 organizer];
      long long v127 = 0u;
      long long v128 = 0u;
      long long v125 = 0u;
      long long v126 = 0u;
      v33 = [*v9 attendees];
      uint64_t v34 = [v33 countByEnumeratingWithState:&v125 objects:v134 count:16];
      if (v34)
      {
        uint64_t v35 = *(void *)v126;
        do
        {
          for (uint64_t i = 0; i != v34; ++i)
          {
            if (*(void *)v126 != v35) {
              objc_enumerationMutation(v33);
            }
            v37 = *(void **)(*((void *)&v125 + 1) + 8 * i);
            if ([v37 participantType] != 2)
            {
              v39 = [v37 URL];
              v40 = [v39 absoluteString];

              if (v40)
              {
                if (([v37 isEqualToParticipant:v92] & 1) == 0)
                {
                  if (v99)
                  {
                    v41 = EKUIAvailabilitySearchHandle;
                    if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      v131 = v37;
                      _os_log_debug_impl(&dword_1A4E47000, v41, OS_LOG_TYPE_DEBUG, "The event has a dirty date property, so we'll forcibly request availability for this participant: [%@]", buf, 0xCu);
                    }
                    goto LABEL_52;
                  }
                  if ([v37 participantStatus] == 3)
                  {
                    v43 = EKUIAvailabilitySearchHandle;
                    if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      v131 = v37;
                      _os_log_debug_impl(&dword_1A4E47000, v43, OS_LOG_TYPE_DEBUG, "Attendee has declined: [%@]", buf, 0xCu);
                    }
                    [v91 addObject:v37];
                  }
                  else if (!EKUIAttendeeUtils_AttendeeHasResponded(v37))
                  {
                    v44 = EKUIAvailabilitySearchHandle;
                    if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      v131 = v37;
                      _os_log_debug_impl(&dword_1A4E47000, v44, OS_LOG_TYPE_DEBUG, "Attendee needs to respond: [%@]", buf, 0xCu);
                    }
LABEL_52:
                    [v98 addObject:v40];
                  }
                  v45 = EKUIAvailabilitySearchHandle;
                  if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412546;
                    v131 = v40;
                    __int16 v132 = 2112;
                    v133 = v37;
                    _os_log_debug_impl(&dword_1A4E47000, v45, OS_LOG_TYPE_DEBUG, "Adding participant with address [%@] to the list of attendees to be included in conflict resolution.  Participant: [%@]", buf, 0x16u);
                  }
                  v46 = [*(id *)(a1 + 32) participantAddressesToParticipants];
                  [v46 setObject:v37 forKey:v40];
                }
              }
              else
              {
                v42 = EKUIAvailabilitySearchHandle;
                if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v131 = v37;
                  _os_log_error_impl(&dword_1A4E47000, v42, OS_LOG_TYPE_ERROR, "No participant address found for participant: [%@].  Will not search use this participant to search for alternative times.", buf, 0xCu);
                }
              }

              goto LABEL_57;
            }
            v38 = EKUIAvailabilitySearchHandle;
            if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v131 = v37;
              _os_log_debug_impl(&dword_1A4E47000, v38, OS_LOG_TYPE_DEBUG, "Will not consider attendee for conflict detection because it is a room: [%@]", buf, 0xCu);
            }
LABEL_57:
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v47 = v37;
              v48 = [v47 proposedStartDateForEvent:*v9];
              if (v48)
              {
                v49 = [*(id *)(a1 + 32) internalProposedStarts];
                [v49 addObject:v48];
              }
            }
          }
          uint64_t v34 = [v33 countByEnumeratingWithState:&v125 objects:v134 count:16];
        }
        while (v34);
      }

      v50 = [v92 URL];
      v90 = [v50 absoluteString];

      BOOL v51 = os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG);
      if (v90)
      {
        if (v51) {
          __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_12();
        }
        [*(id *)(a1 + 32) setOrganizerAddress:v90];
        v52 = [*(id *)(a1 + 32) participantAddressesToParticipants];
        [v52 setObject:v92 forKey:v90];
      }
      else
      {
        if (v51) {
          __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_11();
        }
        uint64_t v53 = a1;
        if (*(void *)(a1 + 48))
        {
          objc_msgSend(*(id *)(a1 + 32), "setOrganizerAddress:");
          v54 = [(id)objc_opt_class() _selfOrganizerForNewlyScheduledEventWithAddress:*(void *)(a1 + 48)];
          v55 = [*(id *)(a1 + 32) participantAddressesToParticipants];
          [v55 setObject:v54 forKey:*(void *)(a1 + 48)];
        }
        else
        {
          if (!os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_ERROR)) {
            goto LABEL_74;
          }
          __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_10();
        }
      }
      uint64_t v53 = a1;
LABEL_74:
      if ((v99 & 1) != 0 || (uint64_t v53 = a1, [v98 count]))
      {
        objc_initWeak((id *)buf, *(id *)(v53 + 32));
        id v56 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v122[0] = MEMORY[0x1E4F143A8];
        v122[1] = 3221225472;
        v122[2] = __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_19;
        v122[3] = &unk_1E5B97888;
        objc_copyWeak(&v124, (id *)buf);
        id v57 = v56;
        id v123 = v57;
        v97 = (void *)MEMORY[0x1A6266730](v122);
        if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG)) {
          __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_5();
        }
        v58 = [EKRequestAvailabilityOperation alloc];
        v59 = [*(id *)(a1 + 32) source];
        v60 = [*(id *)(a1 + 32) internalOriginalStartDate];
        v61 = [*(id *)(a1 + 32) internalOriginalEndDate];
        v62 = [*(id *)(a1 + 32) ignoredEventID];
        val = [(EKRequestAvailabilityOperation *)v58 initWithSource:v59 startDate:v60 endDate:v61 ignoredEventID:v62 addresses:v98 resultsBlock:v97];

        objc_initWeak(&location, val);
        v114[0] = MEMORY[0x1E4F143A8];
        v114[1] = 3221225472;
        v114[2] = __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_22;
        v114[3] = &unk_1E5B978D8;
        objc_copyWeak(&v118, (id *)buf);
        objc_copyWeak(&v119, &location);
        id v96 = v57;
        id v115 = v96;
        char v120 = v99;
        id v63 = v91;
        uint64_t v64 = a1;
        uint64_t v65 = *(void *)(a1 + 32);
        id v95 = v63;
        id v116 = v63;
        uint64_t v117 = v65;
        [(EKRequestAvailabilityOperation *)val setCompletionBlock:v114];
        if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
        {
          __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_4();
          uint64_t v64 = a1;
        }
        [*(id *)(v64 + 32) setAvailabilityRequestInProgress:1];
        v66 = [*(id *)(v64 + 32) availabilityRequestsQueue];
        [v66 addOperation:val];

        v67 = [*(id *)(a1 + 32) internalOriginalEndDate];
        v68 = [*(id *)(a1 + 32) internalOriginalStartDate];
        [v67 timeIntervalSinceDate:v68];
        v70 = v69;

        long long v112 = 0u;
        long long v113 = 0u;
        long long v110 = 0u;
        long long v111 = 0u;
        obuint64_t j = v84;
        uint64_t v71 = [obj countByEnumeratingWithState:&v110 objects:v129 count:16];
        if (v71)
        {
          uint64_t v94 = *(void *)v111;
          do
          {
            for (uint64_t j = 0; j != v71; ++j)
            {
              if (*(void *)v111 != v94) {
                objc_enumerationMutation(obj);
              }
              v73 = *(void **)(*((void *)&v110 + 1) + 8 * j);
              v74 = [EKRequestAvailabilityOperation alloc];
              v75 = [*(id *)(a1 + 32) source];
              v76 = [v73 dateByAddingTimeInterval:*(double *)&v70];
              v77 = [*(id *)(a1 + 32) ignoredEventID];
              v78 = [(EKRequestAvailabilityOperation *)v74 initWithSource:v75 startDate:v73 endDate:v76 ignoredEventID:v77 addresses:v98 resultsBlock:v97];

              objc_initWeak(&from, v78);
              v101[0] = MEMORY[0x1E4F143A8];
              v101[1] = 3221225472;
              v101[2] = __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_27;
              v101[3] = &unk_1E5B97928;
              objc_copyWeak(&v106, (id *)buf);
              objc_copyWeak(v107, &from);
              id v102 = v96;
              char v108 = v99;
              id v103 = v95;
              v104 = v73;
              v107[1] = v70;
              uint64_t v105 = *(void *)(a1 + 32);
              [(EKRequestAvailabilityOperation *)v78 setCompletionBlock:v101];
              v79 = [*(id *)(a1 + 32) availabilityRequestsQueue];
              [v79 addOperation:v78];

              objc_destroyWeak(v107);
              objc_destroyWeak(&v106);
              objc_destroyWeak(&from);
            }
            uint64_t v71 = [obj countByEnumeratingWithState:&v110 objects:v129 count:16];
          }
          while (v71);
        }

        objc_destroyWeak(&v119);
        objc_destroyWeak(&v118);
        objc_destroyWeak(&location);

        objc_destroyWeak(&v124);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG)) {
          __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_9();
        }
        if ([v91 count])
        {
          v80 = (void *)EKUIAvailabilitySearchHandle;
          if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG)) {
            __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_8(v80, v91);
          }
          v81 = [*(id *)(a1 + 32) internalOriginalConflictedParticipants];
          [v81 addObjectsFromArray:v91];

          [*(id *)(a1 + 32) _transitionToConflictFoundStateAndSearch];
        }
        else
        {
          int v82 = [*(id *)(a1 + 32) noConflictRequired];
          BOOL v83 = os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG);
          if (v82)
          {
            if (v83) {
              __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_6();
            }
            [*(id *)(a1 + 32) _transitionToConflictFoundStateAndSearch];
          }
          else if (v83)
          {
            __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_7();
          }
        }
      }

      return;
    }
    if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG)) {
      __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_15();
    }
  }
  else if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_ERROR))
  {
    __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_1();
  }
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_19(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained processingQueue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_2;
    v7[3] = &unk_1E5B97140;
    id v8 = *(id *)(a1 + 32);
    id v9 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) addEntriesFromDictionary:*(void *)(a1 + 40)];
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_22(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v4 = v3;
  if (WeakRetained)
  {
    if (v3)
    {
      if (([v3 isCancelled] & 1) == 0)
      {
        uint64_t v5 = [v4 error];
        id v6 = [WeakRetained processingQueue];
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_23;
        v10[3] = &unk_1E5B978B0;
        id v11 = v5;
        id v12 = WeakRetained;
        id v13 = *(id *)(a1 + 32);
        char v16 = *(unsigned char *)(a1 + 72);
        id v7 = *(id *)(a1 + 40);
        uint64_t v8 = *(void *)(a1 + 48);
        id v14 = v7;
        uint64_t v15 = v8;
        id v9 = v5;
        dispatch_async(v6, v10);
      }
    }
    else if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
    {
      __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_22_cold_2();
    }
  }
  else if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
  {
    __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_22_cold_1();
  }
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_23(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  if (*(void *)(a1 + 32))
  {
    id v3 = EKUIAvailabilitySearchHandle;
    if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG)) {
      __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_23_cold_5(v2, v3, v4, v5, v6, v7, v8, v9);
    }
    [*(id *)(a1 + 40) setAvailabilityRequestInProgress:0];
    [*(id *)(a1 + 40) _haltSearchWithError:1];
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    v21 = __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_24;
    objc_super v22 = &unk_1E5B96C98;
    id v11 = *(void **)(a1 + 48);
    uint64_t v23 = *(void *)(a1 + 40);
    id v12 = v10;
    id v24 = v12;
    [v11 enumerateKeysAndObjectsUsingBlock:&v19];
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_msgSend(v13, "addObjectsFromArray:", v12, v19, v20, v21, v22, v23);
    if (!*(unsigned char *)(a1 + 72))
    {
      if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG)) {
        __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_23_cold_4();
      }
      [v13 addObjectsFromArray:*(void *)(a1 + 56)];
    }
    if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG)) {
      __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_23_cold_3();
    }
    id v14 = [*(id *)(a1 + 40) internalOriginalConflictedParticipants];
    [v14 addObjectsFromArray:v13];

    uint64_t v15 = [*(id *)(a1 + 40) originalRangeStartDate];
    [*(id *)(a1 + 40) setNextAvailabilityRangeStartDate:v15];

    [*(id *)(a1 + 40) setAvailabilityRequestInProgress:0];
    uint64_t v16 = [v13 count];
    char v17 = [*(id *)(a1 + 64) noConflictRequired];
    BOOL v18 = os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG);
    if ((v17 & 1) != 0 || v16)
    {
      if (v18) {
        __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_23_cold_1();
      }
      [*(id *)(a1 + 40) _transitionToConflictFoundStateAndSearch];
    }
    else if (v18)
    {
      __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_23_cold_2();
    }
  }
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_24(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (+[EKAvailabilityUtilities spansIncludeBusyPeriod:a3])
  {
    uint64_t v6 = [*(id *)(a1 + 32) _participantforParticipantAddress:v5];
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG)) {
        __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_24_cold_2();
      }
      [*(id *)(a1 + 40) addObject:v6];
    }
    else if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_ERROR))
    {
      __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_24_cold_1();
    }
  }
  else if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
  {
    __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_24_cold_3();
  }
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_27(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v3 = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v4 = v3;
  if (WeakRetained)
  {
    if (v3)
    {
      if (([v3 isCancelled] & 1) == 0)
      {
        id v5 = [v4 error];
        uint64_t v6 = [WeakRetained processingQueue];
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_28;
        v8[3] = &unk_1E5B97900;
        id v9 = v5;
        id v10 = WeakRetained;
        id v11 = *(id *)(a1 + 32);
        char v15 = *(unsigned char *)(a1 + 88);
        id v12 = *(id *)(a1 + 40);
        uint64_t v14 = *(void *)(a1 + 80);
        long long v13 = *(_OWORD *)(a1 + 48);
        id v7 = v5;
        dispatch_async(v6, v8);
      }
    }
    else if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
    {
      __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_22_cold_2();
    }
  }
  else if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
  {
    __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_22_cold_1();
  }
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_28(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  if (*(void *)(a1 + 32))
  {
    id v3 = EKUIAvailabilitySearchHandle;
    if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG)) {
      __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_23_cold_5(v2, v3, v4, v5, v6, v7, v8, v9);
    }
    [*(id *)(a1 + 40) setAvailabilityRequestInProgress:0];
    [*(id *)(a1 + 40) _haltSearchWithError:1];
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    v21 = __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_29;
    objc_super v22 = &unk_1E5B96C98;
    id v11 = *(void **)(a1 + 48);
    uint64_t v23 = *(void *)(a1 + 40);
    id v12 = v10;
    id v24 = v12;
    [v11 enumerateKeysAndObjectsUsingBlock:&v19];
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_msgSend(v13, "addObjectsFromArray:", v12, v19, v20, v21, v22, v23);
    if (!*(unsigned char *)(a1 + 88))
    {
      if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG)) {
        __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_23_cold_4();
      }
      [v13 addObjectsFromArray:*(void *)(a1 + 56)];
    }
    if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG)) {
      __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_23_cold_3();
    }
    uint64_t v14 = [EKInviteeAlternativeTime alloc];
    char v15 = *(void **)(a1 + 64);
    uint64_t v16 = [v15 dateByAddingTimeInterval:*(double *)(a1 + 80)];
    char v17 = [(EKInviteeAlternativeTime *)v14 initWithStartDate:v15 endDate:v16 conflictedParticipants:v13];

    BOOL v18 = [*(id *)(a1 + 72) internalProposedTimes];
    [v18 addObject:v17];

    [*(id *)(a1 + 72) _sendStateChange:2];
    [*(id *)(a1 + 40) setAvailabilityRequestInProgress:0];
  }
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_29(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (+[EKAvailabilityUtilities spansIncludeBusyPeriod:a3])
  {
    uint64_t v6 = [*(id *)(a1 + 32) _participantforParticipantAddress:v5];
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG)) {
        __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_24_cold_2();
      }
      [*(id *)(a1 + 40) addObject:v6];
    }
    else if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_ERROR))
    {
      __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_24_cold_1();
    }
  }
  else if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
  {
    __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_24_cold_3();
  }
}

+ (id)stateAsString:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return @"Unknown";
  }
  else {
    return off_1E5B97A50[a3];
  }
}

- (void)_attemptSearch
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "A search attempt was requested.", v2, v3, v4, v5, v6);
}

void __50__EKInviteeAlternativeTimeSearcher__attemptSearch__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    uint8_t v6 = [WeakRetained processingQueue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __50__EKInviteeAlternativeTimeSearcher__attemptSearch__block_invoke_2;
    v7[3] = &unk_1E5B97140;
    id v8 = *(id *)(a1 + 32);
    id v9 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t __50__EKInviteeAlternativeTimeSearcher__attemptSearch__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) addEntriesFromDictionary:*(void *)(a1 + 40)];
}

void __50__EKInviteeAlternativeTimeSearcher__attemptSearch__block_invoke_3(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v3 = objc_loadWeakRetained(a1 + 8);
  if (v3)
  {
    if (WeakRetained)
    {
      if ([WeakRetained isCancelled])
      {
        if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG)) {
          __50__EKInviteeAlternativeTimeSearcher__attemptSearch__block_invoke_3_cold_3();
        }
      }
      else
      {
        uint64_t v4 = [WeakRetained error];
        uint64_t v5 = [v3 processingQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __50__EKInviteeAlternativeTimeSearcher__attemptSearch__block_invoke_46;
        block[3] = &unk_1E5B97950;
        block[4] = v3;
        id v8 = v4;
        id v9 = a1[4];
        id v10 = a1[5];
        id v11 = a1[6];
        id v6 = v4;
        dispatch_async(v5, block);
      }
    }
    else if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
    {
      __50__EKInviteeAlternativeTimeSearcher__attemptSearch__block_invoke_3_cold_2();
    }
  }
  else if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
  {
    __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_22_cold_1();
  }
}

uint64_t __50__EKInviteeAlternativeTimeSearcher__attemptSearch__block_invoke_46(uint64_t a1)
{
  [*(id *)(a1 + 32) setAvailabilityRequestInProgress:0];
  if (*(void *)(a1 + 40))
  {
    uint64_t v2 = EKUIAvailabilitySearchHandle;
    if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG)) {
      __50__EKInviteeAlternativeTimeSearcher__attemptSearch__block_invoke_46_cold_1(a1 + 40, v2, v3, v4, v5, v6, v7, v8);
    }
    return [*(id *)(a1 + 32) _attemptSearch];
  }
  else
  {
    [*(id *)(a1 + 32) setNextAvailabilityRangeStartDate:*(void *)(a1 + 48)];
    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 56);
    uint64_t v12 = *(void *)(a1 + 64);
    uint64_t v13 = *(void *)(a1 + 48);
    return [v10 _processResults:v11 betweenStartDate:v12 endDate:v13];
  }
}

- (void)_resetSearchFallbackNumbers
{
  uint64_t v3 = NSNumber;
  id v4 = a1;
  uint64_t v5 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(a2, "remainingSearchAttempts"));
  uint64_t v6 = NSNumber;
  [a2 availabilitySearchDurationMultiplier];
  uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_1A4E47000, v8, v9, "Resetting search fallback numbers.  Current remaining search attempts: [%@].  Current availability search duration multiplier: [%@]", v10, v11, v12, v13, v14);
}

- (void)_sendStateChange:(int64_t)a3
{
  uint64_t v5 = [(EKInviteeAlternativeTimeSearcher *)self callbackQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__EKInviteeAlternativeTimeSearcher__sendStateChange___block_invoke;
  v6[3] = &unk_1E5B97778;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

void __53__EKInviteeAlternativeTimeSearcher__sendStateChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  uint64_t v3 = [*(id *)(a1 + 32) stateChanged];

  id v4 = (void *)EKUIAvailabilitySearchHandle;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG)) {
      __53__EKInviteeAlternativeTimeSearcher__sendStateChange___block_invoke_cold_2(v2, v4, a1);
    }
    uint64_t v5 = [*(id *)(a1 + 32) stateChanged];
    v5[2](v5, *(void *)(a1 + 40));
  }
  else if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_ERROR))
  {
    __53__EKInviteeAlternativeTimeSearcher__sendStateChange___block_invoke_cold_1(v2, v4, a1);
  }
}

- (void)_transitionToConflictFoundStateAndSearch
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1;
  uint64_t v2 = [(id)objc_opt_class() stateAsString:1];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1A4E47000, v1, v3, "Transitioning to the [%@] state and attempting a search.", v4);
}

- (id)_participantforParticipantAddress:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(EKInviteeAlternativeTimeSearcher *)self participantAddressesToParticipants];
  uint64_t v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    uint64_t v7 = EKUtils_AdjustedAttendeeAddress(v4);
    uint64_t v8 = [(EKInviteeAlternativeTimeSearcher *)self participantAddressesToParticipants];
    uint64_t v6 = [v8 objectForKey:v7];
  }

  return v6;
}

- (void)_processResults:(id)a3 betweenStartDate:(id)a4 endDate:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = EKUIAvailabilitySearchHandle;
  if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v39 = v9;
    __int16 v40 = 2112;
    id v41 = v10;
    __int16 v42 = 2112;
    id v43 = v8;
    _os_log_debug_impl(&dword_1A4E47000, v11, OS_LOG_TYPE_DEBUG, "Processing results - start date: [%@] end date: [%@] results: [%@]", buf, 0x20u);
  }
  uint64_t v35 = v9;
  v36 = v8;
  uint64_t v34 = v10;
  uint64_t v12 = [(EKInviteeAlternativeTimeSearcher *)self _generateTimeSpansForResults:v8 betweenStartDate:v9 endDate:v10];
  uint64_t v13 = [(EKInviteeAlternativeTimeSearcher *)self leftoverSpans];
  uint64_t v14 = [(EKInviteeAlternativeTimeSearcher *)self _spliceLeftTimeSpans:v13 andNewTimeSpans:v12];

  v33 = (void *)v14;
  char v15 = [(EKInviteeAlternativeTimeSearcher *)self _mergeAdjacentSpansWithSameConflictedParticipants:v14];
  uint64_t v16 = [(EKInviteeAlternativeTimeSearcher *)self _generateOpenFreeTimesFromTimeSpans:v15];
  char v17 = [(EKInviteeAlternativeTimeSearcher *)self _generateNonOptimalTimesFromTimeSpans:v15];
  uint64_t v18 = [(id)objc_opt_class() _findLeftoverSpans:v12 usingFreeTimes:v16 andNonOptimalTimes:v17];
  uint64_t v19 = [(EKInviteeAlternativeTimeSearcher *)self leftoverSpans];
  v32 = (void *)v18;
  [v19 setArray:v18];

  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __77__EKInviteeAlternativeTimeSearcher__processResults_betweenStartDate_endDate___block_invoke;
  v37[3] = &unk_1E5B979A0;
  v37[4] = self;
  uint64_t v20 = (void *)MEMORY[0x1A6266730](v37);
  v21 = [v16 indexesOfObjectsPassingTest:v20];
  objc_super v22 = [v17 indexesOfObjectsPassingTest:v20];
  uint64_t v23 = [(EKInviteeAlternativeTimeSearcher *)self internalTimesWhenAllAttendeesCanAttend];
  id v24 = [v16 objectsAtIndexes:v21];
  [v23 addObjectsFromArray:v24];

  char v25 = [(EKInviteeAlternativeTimeSearcher *)self internalTimesWhenSomeAttendeesCanAttend];
  v26 = [v17 objectsAtIndexes:v22];
  [v25 addObjectsFromArray:v26];

  if (-[EKInviteeAlternativeTimeSearcher internalSearchingForMoreTimesWhenAllAttendeesCanAttend](self, "internalSearchingForMoreTimesWhenAllAttendeesCanAttend")&& [v16 count])
  {
    [(EKInviteeAlternativeTimeSearcher *)self setInternalSearchingForMoreTimesWhenAllAttendeesCanAttend:0];
    int v27 = 1;
  }
  else
  {
    int v27 = 0;
  }
  if (-[EKInviteeAlternativeTimeSearcher internalSearchingForMoreTimesWhenSomeAttendeesCanAttend](self, "internalSearchingForMoreTimesWhenSomeAttendeesCanAttend")&& [v17 count])
  {
    [(EKInviteeAlternativeTimeSearcher *)self setInternalSearchingForMoreTimesWhenSomeAttendeesCanAttend:0];
  }
  else if (!v27)
  {
    goto LABEL_14;
  }
  v28 = (void *)EKUIAvailabilitySearchHandle;
  if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG)) {
    -[EKInviteeAlternativeTimeSearcher _processResults:betweenStartDate:endDate:].cold.4(v28, v16, v17);
  }
  [(EKInviteeAlternativeTimeSearcher *)self _sendStateChange:2];
  LOBYTE(v27) = 1;
LABEL_14:
  if (![(EKInviteeAlternativeTimeSearcher *)self internalSearchingForMoreTimesWhenAllAttendeesCanAttend]&& ![(EKInviteeAlternativeTimeSearcher *)self internalSearchingForMoreTimesWhenSomeAttendeesCanAttend])
  {
    if ((v27 & 1) == 0)
    {
      CalAnalyticsSendEvent();
      if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_ERROR)) {
        -[EKInviteeAlternativeTimeSearcher _processResults:betweenStartDate:endDate:]();
      }
    }
    goto LABEL_25;
  }
  unint64_t v29 = [(EKInviteeAlternativeTimeSearcher *)self remainingSearchAttempts];
  v30 = (void *)EKUIAvailabilitySearchHandle;
  BOOL v31 = os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG);
  if (!v29)
  {
    if (v31) {
      -[EKInviteeAlternativeTimeSearcher _processResults:betweenStartDate:endDate:]();
    }
LABEL_25:
    [(EKInviteeAlternativeTimeSearcher *)self _haltSearchWithError:0];
    goto LABEL_26;
  }
  if (v31) {
    -[EKInviteeAlternativeTimeSearcher _processResults:betweenStartDate:endDate:](v30, self);
  }
  [(EKInviteeAlternativeTimeSearcher *)self _attemptSearch];
LABEL_26:
}

uint64_t __77__EKInviteeAlternativeTimeSearcher__processResults_betweenStartDate_endDate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 endDate];
  id v4 = [*(id *)(a1 + 32) originalRangeStartDate];
  int v5 = [v3 CalIsBeforeDate:v4];

  return v5 ^ 1u;
}

- (void)_haltSearchWithError:(BOOL)a3
{
  BOOL v3 = a3;
  if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG)) {
    -[EKInviteeAlternativeTimeSearcher _haltSearchWithError:]();
  }
  [(EKInviteeAlternativeTimeSearcher *)self setInternalSearchingForMoreTimesWhenAllAttendeesCanAttend:0];
  [(EKInviteeAlternativeTimeSearcher *)self setInternalSearchingForMoreTimesWhenSomeAttendeesCanAttend:0];
  if (v3) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 2;
  }
  [(EKInviteeAlternativeTimeSearcher *)self _sendStateChange:v5];
}

+ (id)_findLeftoverSpans:(id)a3 usingFreeTimes:(id)a4 andNonOptimalTimes:(id)a5
{
  id v7 = a3;
  id v8 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v9 = a5;
  id v10 = a4;
  id v11 = objc_alloc_init(v8);
  uint64_t v12 = [v10 lastObject];

  uint64_t v13 = [v12 endDate];
  uint64_t v14 = [v9 lastObject];

  char v15 = [v14 endDate];
  id v16 = v13;
  char v17 = v16;
  if (v16)
  {
    id v18 = v16;
    if (v15)
    {
      id v18 = v16;
      if (([v16 CalIsAfterDate:v15] & 1) == 0)
      {
        id v18 = v15;
      }
    }
  }
  else
  {
    id v18 = v15;
    if (!v18) {
      goto LABEL_12;
    }
  }
  uint64_t v19 = [(id)objc_opt_class() _binarySearchForIndexOfTimeSpanInArray:v7 containingDate:v18];
  if (v19 == [(id)objc_opt_class() _invalidBinarySearchIndex])
  {
    if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG)) {
      +[EKInviteeAlternativeTimeSearcher _findLeftoverSpans:usingFreeTimes:andNonOptimalTimes:]();
    }
  }
  else
  {
    uint64_t v20 = [v7 objectAtIndex:v19];
    v21 = (void *)[v20 copy];
    [v21 setStartDate:v18];
    [v11 addObject:v21];
    uint64_t v22 = [v7 count] + ~v19;
    if (v22)
    {
      uint64_t v23 = objc_msgSend(v7, "subarrayWithRange:", v19 + 1, v22);
      [v11 addObjectsFromArray:v23];
    }
  }
LABEL_12:
  id v24 = +[EKDebugPreferences shared];
  int v25 = [v24 verifyIntegrityOfAvailabilityTimeSearchTimelines];

  if (v25) {
    [(id)objc_opt_class() _validateSpans:v11];
  }

  return v11;
}

+ (id)_addressesForParticipants:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if (v3 && [v3 count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "participant", (void)v14);
          id v11 = [v10 URL];
          uint64_t v12 = [v11 absoluteString];

          if (v12) {
            [v4 addObject:v12];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }

  return v4;
}

+ (BOOL)_span:(id)a3 hasSameConflictedParticipantsAsSpan:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = [v6 conflictedParticipants];

  id v9 = [v7 _addressesForParticipants:v8];

  id v10 = objc_opt_class();
  id v11 = [v5 conflictedParticipants];

  uint64_t v12 = [v10 _addressesForParticipants:v11];

  if (v9)
  {
    char v13 = [v9 count] == 0;
    if (!v12) {
      goto LABEL_14;
    }
  }
  else
  {
    char v13 = 1;
    if (!v12) {
      goto LABEL_14;
    }
  }
  uint64_t v14 = [v12 count];
  if (v14) {
    char v15 = 0;
  }
  else {
    char v15 = v13;
  }
  if (v14) {
    char v16 = v13;
  }
  else {
    char v16 = 1;
  }
  if (v16) {
    char v13 = v15;
  }
  else {
    char v13 = [v9 isEqualToSet:v12];
  }
LABEL_14:

  return v13;
}

+ (id)_allButLastItemInArray:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
    if (v5 > 1) {
      objc_msgSend(v4, "subarrayWithRange:", 0, v5 - 1);
    }
    else {
    id v6 = [MEMORY[0x1E4F1C978] array];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)_allButFirstItemInArray:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
    if (v5 > 1) {
      objc_msgSend(v4, "subarrayWithRange:", 1, v5 - 1);
    }
    else {
    id v6 = [MEMORY[0x1E4F1C978] array];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)_spliceLeftTimeSpans:(id)a3 andNewTimeSpans:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v5 && [v5 count])
  {
    uint64_t v8 = [v5 lastObject];
    id v9 = [v6 firstObject];
    id v10 = [v8 conflictedParticipants];
    uint64_t v11 = [v10 count];

    uint64_t v12 = [v9 conflictedParticipants];
    BOOL v13 = [v12 count] == 0;

    if ((((v11 != 0) ^ v13) & 1) != 0
      && (!v11 || [(id)objc_opt_class() _span:v8 hasSameConflictedParticipantsAsSpan:v9]))
    {
      uint64_t v14 = [(id)objc_opt_class() _allButLastItemInArray:v5];
      [v7 addObjectsFromArray:v14];
      char v15 = objc_alloc_init(EKInviteeTimeSpan);
      char v16 = [v8 startDate];
      [(EKInviteeTimeSpan *)v15 setStartDate:v16];

      long long v17 = [v9 endDate];
      [(EKInviteeTimeSpan *)v15 setEndDate:v17];

      id v18 = [v8 conflictedParticipants];
      [(EKInviteeTimeSpan *)v15 setConflictedParticipants:v18];

      [v7 addObject:v15];
      uint64_t v19 = [(id)objc_opt_class() _allButFirstItemInArray:v6];
      [v7 addObjectsFromArray:v19];
    }
    else
    {
      [v7 addObjectsFromArray:v5];
      [v7 addObjectsFromArray:v6];
    }
  }
  else
  {
    [v7 addObjectsFromArray:v6];
  }
  uint64_t v20 = +[EKDebugPreferences shared];
  int v21 = [v20 verifyIntegrityOfAvailabilityTimeSearchTimelines];

  if (v21) {
    [(id)objc_opt_class() _validateSpans:v7];
  }

  return v7;
}

- (id)_mergeAdjacentSpansWithSameConflictedParticipants:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v3 && [v3 count])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (v8
            && objc_msgSend((id)objc_opt_class(), "_span:hasSameConflictedParticipantsAsSpan:", v11, v8, (void)v17))
          {
            uint64_t v12 = [v11 endDate];
            [v8 setEndDate:v12];
          }
          else
          {
            id v13 = v11;

            [v4 addObject:v13];
            uint64_t v8 = v13;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  uint64_t v14 = +[EKDebugPreferences shared];
  int v15 = [v14 verifyIntegrityOfAvailabilityTimeSearchTimelines];

  if (v15) {
    [(id)objc_opt_class() _validateSpans:v4];
  }

  return v4;
}

- (id)_generateOpenFreeTimesFromTimeSpans:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v6 = [(EKInviteeAlternativeTimeSearcher *)self internalOriginalEndDate];
  uint64_t v7 = [(EKInviteeAlternativeTimeSearcher *)self internalOriginalStartDate];
  [v6 timeIntervalSinceDate:v7];
  double v9 = v8;

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v32;
    uint64_t v29 = *(void *)v32;
    id v30 = v10;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(v10);
        }
        int v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        char v16 = objc_msgSend(v15, "conflictedParticipants", v29, v30, (void)v31);
        uint64_t v17 = [v16 count];

        if (!v17)
        {
          long long v18 = [v15 endDate];
          long long v19 = [v15 startDate];
          [v18 timeIntervalSinceDate:v19];
          double v21 = v20;

          if (v21 >= v9)
          {
            unint64_t v22 = (unint64_t)(v21 / v9);
            for (uint64_t j = [v15 startDate];
            {
              uint64_t v24 = [j dateByAddingTimeInterval:v9];
              int v25 = [EKInviteeAlternativeTime alloc];
              v26 = [v15 conflictedParticipants];
              int v27 = [(EKInviteeAlternativeTime *)v25 initWithStartDate:j endDate:v24 conflictedParticipants:v26];

              [v5 addObject:v27];
              uint64_t j = (void *)v24;
            }

            uint64_t v13 = v29;
            id v10 = v30;
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v12);
  }

  return v5;
}

+ (void)_insertUniqueParticipants:(id)a3 intoExistingParticipantsArray:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v14 = [v13 participant];
        int v15 = [v14 URL];
        char v16 = [v15 absoluteString];

        if (v16) {
          [v7 setObject:v13 forKey:v16];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v10);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v17 = v6;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v17);
        }
        unint64_t v22 = *(void **)(*((void *)&v27 + 1) + 8 * j);
        uint64_t v23 = objc_msgSend(v22, "participant", (void)v27);
        uint64_t v24 = [v23 URL];
        int v25 = [v24 absoluteString];

        if (v25) {
          [v7 setObject:v22 forKey:v25];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v19);
  }

  v26 = [v7 allValues];
  [v17 setArray:v26];
}

- (id)_generateNonOptimalTimesFromTimeSpans:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v60 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = [(EKInviteeAlternativeTimeSearcher *)self internalOriginalEndDate];
  uint64_t v64 = self;
  id v6 = [(EKInviteeAlternativeTimeSearcher *)self internalOriginalStartDate];
  [v5 timeIntervalSinceDate:v6];
  double v8 = v7;

  uint64_t v9 = [v4 firstObject];
  uint64_t v10 = [v4 lastObject];
  v58 = v9;
  uint64_t v11 = [v9 startDate];
  id v57 = v10;
  uint64_t v12 = [v10 endDate];
  id v13 = v11;
  v66 = v4;
  unint64_t v67 = [v4 count];
  v59 = v13;
  v61 = (void *)v12;
  if ([v13 CalIsBeforeDate:v12] && v67)
  {
    unint64_t v14 = 0;
    int v15 = v13;
    while (1)
    {
      char v16 = [v15 dateByAddingTimeInterval:v8];
      if ([v16 CalIsAfterDate:v12])
      {

        id v13 = v15;
        break;
      }
      id v17 = objc_alloc_init(EKInviteeTimeSpan);
      [(EKInviteeTimeSpan *)v17 setStartDate:v15];
      uint64_t v18 = v16;
      [(EKInviteeTimeSpan *)v17 setEndDate:v16];
      uint64_t v19 = [v66 objectAtIndex:v14];
      id v20 = objc_alloc(MEMORY[0x1E4F1CA48]);
      double v21 = [v19 conflictedParticipants];
      unint64_t v22 = (void *)[v20 initWithArray:v21];

      uint64_t v23 = [(EKInviteeTimeSpan *)v17 endDate];
      uint64_t v24 = [v19 endDate];
      int v25 = [v23 isEqualToDate:v24];

      v62 = v19;
      if (v25)
      {
        ++v14;
      }
      else
      {
        long long v28 = [(EKInviteeTimeSpan *)v17 endDate];
        long long v29 = [v19 endDate];
        int v30 = [v28 CalIsAfterDate:v29];

        if (v30)
        {
          unint64_t v31 = v14 + 1;
          if (v14 + 1 < v67)
          {
            unint64_t v32 = v14;
            unint64_t v33 = v14 + 1;
            id v13 = v18;
            while (1)
            {
              long long v34 = [v66 objectAtIndex:v31];
              uint64_t v35 = [v34 startDate];
              int v36 = [v35 CalIsBeforeDate:v13];

              if (!v36) {
                break;
              }
              uint64_t v37 = objc_opt_class();
              v38 = [v34 conflictedParticipants];
              [v37 _insertUniqueParticipants:v38 intoExistingParticipantsArray:v22];

              id v39 = [v34 endDate];
              LODWORD(v38) = [v39 isEqualToDate:v13];

              if (v38)
              {
                unint64_t v31 = v32 + 2;
                break;
              }
              __int16 v40 = [v34 endDate];
              int v41 = [v40 CalIsAfterDate:v13];

              unint64_t v14 = v32 + 1;
              if ((v41 & 1) == 0)
              {
                unint64_t v31 = v33++;
                unint64_t v42 = v32 + 2;
                ++v32;
                if (v42 < v67) {
                  continue;
                }
              }
              goto LABEL_8;
            }

            unint64_t v14 = v31;
            goto LABEL_8;
          }
        }
      }
      id v13 = v18;
LABEL_8:
      [(EKInviteeTimeSpan *)v17 setConflictedParticipants:v22];
      v26 = [(EKInviteeTimeSpan *)v17 conflictedParticipants];
      uint64_t v27 = [v26 count];

      if (v27) {
        [v60 addObject:v17];
      }

      uint64_t v12 = (uint64_t)v61;
      if ([v13 CalIsBeforeDate:v61])
      {
        int v15 = v13;
        if (v14 < v67) {
          continue;
        }
      }
      break;
    }
  }
  v68 = v13;
  id v63 = [(EKInviteeAlternativeTimeSearcher *)v64 _filterOutUnreasonableTimeSlots:v60];
  uint64_t v65 = [(id)objc_opt_class() _rankNonOptimalTimeSpans:v63];
  id v43 = [(id)objc_opt_class() _findHighestRankedNonOptimalTimeSpans:v65];
  id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v45 = v43;
  uint64_t v46 = [v45 countByEnumeratingWithState:&v69 objects:v73 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v47; ++i)
      {
        if (*(void *)v70 != v48) {
          objc_enumerationMutation(v45);
        }
        v50 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        BOOL v51 = [EKInviteeAlternativeTime alloc];
        v52 = [v50 startDate];
        uint64_t v53 = [v50 endDate];
        v54 = [v50 conflictedParticipants];
        v55 = [(EKInviteeAlternativeTime *)v51 initWithStartDate:v52 endDate:v53 conflictedParticipants:v54];

        [v44 addObject:v55];
      }
      uint64_t v47 = [v45 countByEnumeratingWithState:&v69 objects:v73 count:16];
    }
    while (v47);
  }

  return v44;
}

- (id)_filterOutUnreasonableTimeSlots:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(EKInviteeAlternativeTimeSearcher *)self participantAddressesToParticipants];
    id v6 = [v5 allKeys];
    uint64_t v7 = [v6 count];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __68__EKInviteeAlternativeTimeSearcher__filterOutUnreasonableTimeSlots___block_invoke;
    v11[3] = &__block_descriptor_40_e34_B32__0__EKInviteeTimeSpan_8Q16_B24l;
    v11[4] = v7;
    double v8 = [v4 indexesOfObjectsPassingTest:v11];
    uint64_t v9 = [v4 objectsAtIndexes:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

BOOL __68__EKInviteeAlternativeTimeSearcher__filterOutUnreasonableTimeSlots___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = objc_msgSend(v3, "conflictedParticipants", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v16 + 1) + 8 * v9) participant];
        uint64_t v11 = [v10 URL];
        uint64_t v12 = [v11 absoluteString];

        if (v12) {
          [v4 addObject:v12];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  if ([v4 count])
  {
    uint64_t v13 = *(void *)(a1 + 32);
    BOOL v14 = v13 != [v4 count];
  }
  else
  {
    BOOL v14 = 1;
  }

  return v14;
}

+ (id)_findHighestRankedNonOptimalTimeSpans:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ((unint64_t)[v3 count] <= 0x14)
  {
    id v4 = v3;
LABEL_20:
    id v17 = v4;
    goto LABEL_21;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v6)
  {

LABEL_19:
    objc_msgSend(v5, "subarrayWithRange:", 0, 20, (void)v25);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  uint64_t v7 = v6;
  uint64_t v8 = 0;
  unint64_t v9 = 0;
  uint64_t v10 = *(void *)v26;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v26 != v10) {
        objc_enumerationMutation(v5);
      }
      uint64_t v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      uint64_t v13 = objc_msgSend(v12, "conflictedParticipants", (void)v25);
      uint64_t v14 = [v13 count];

      if (v8 == v14)
      {
        ++v9;
      }
      else if (v8)
      {
        goto LABEL_13;
      }
      int v15 = [v12 conflictedParticipants];
      uint64_t v8 = [v15 count];
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v25 objects:v29 count:16];
  }
  while (v7);
LABEL_13:

  if (v9 <= 0x14) {
    goto LABEL_19;
  }
  long long v16 = (void *)[v5 mutableCopy];
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v18 = -20;
  do
  {
    unint64_t v19 = arc4random();
    unint64_t v20 = v19 % [v16 count];
    uint64_t v21 = [v16 objectAtIndex:v20];
    [v17 addObject:v21];
    [v16 removeObjectAtIndex:v20];
  }
  while (!__CFADD__(v18++, 1));

LABEL_21:
  uint64_t v23 = [v17 sortedArrayWithOptions:16 usingComparator:&__block_literal_global_28];

  return v23;
}

uint64_t __74__EKInviteeAlternativeTimeSearcher__findHighestRankedNonOptimalTimeSpans___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 startDate];
  uint64_t v6 = [v4 startDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

+ (id)_rankNonOptimalTimeSpans:(id)a3
{
  return (id)[a3 sortedArrayWithOptions:16 usingComparator:&__block_literal_global_58];
}

uint64_t __61__EKInviteeAlternativeTimeSearcher__rankNonOptimalTimeSpans___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 conflictedParticipants];
  if (v6)
  {
    uint64_t v7 = [v4 conflictedParticipants];
    unint64_t v8 = [v7 count];
  }
  else
  {
    unint64_t v8 = 0;
  }

  unint64_t v9 = [v5 conflictedParticipants];
  if (v9)
  {
    uint64_t v10 = [v5 conflictedParticipants];
    unint64_t v11 = [v10 count];
  }
  else
  {
    unint64_t v11 = 0;
  }

  if (v8 >= v11)
  {
    if (v8 > v11)
    {
      uint64_t v12 = 1;
    }
    else
    {
      uint64_t v13 = [v4 startDate];
      uint64_t v14 = [v5 startDate];
      uint64_t v12 = [v13 compare:v14];
    }
  }
  else
  {
    uint64_t v12 = -1;
  }

  return v12;
}

- (id)_generateTimeSpansForResults:(id)a3 betweenStartDate:(id)a4 endDate:(id)a5
{
  unint64_t v8 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_alloc_init(v8);
  uint64_t v13 = objc_alloc_init(EKInviteeTimeSpan);
  [(EKInviteeTimeSpan *)v13 setStartDate:v10];

  [(EKInviteeTimeSpan *)v13 setEndDate:v9];
  [v12 addObject:v13];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __90__EKInviteeAlternativeTimeSearcher__generateTimeSpansForResults_betweenStartDate_endDate___block_invoke;
  unint64_t v22 = &unk_1E5B96C98;
  uint64_t v23 = self;
  id v14 = v12;
  id v24 = v14;
  [v11 enumerateKeysAndObjectsUsingBlock:&v19];

  int v15 = +[EKDebugPreferences shared];
  LODWORD(v9) = [v15 verifyIntegrityOfAvailabilityTimeSearchTimelines];

  if (v9) {
    [(id)objc_opt_class() _validateSpans:v14];
  }
  long long v16 = v24;
  id v17 = v14;

  return v17;
}

void __90__EKInviteeAlternativeTimeSearcher__generateTimeSpansForResults_betweenStartDate_endDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) _participantforParticipantAddress:v5];
  if (v7)
  {
    unint64_t v8 = +[EKParticipantForSorting participantForSortingWithEKParticipant:v7];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __90__EKInviteeAlternativeTimeSearcher__generateTimeSpansForResults_betweenStartDate_endDate___block_invoke_60;
    v10[3] = &unk_1E5B97A08;
    id v11 = *(id *)(a1 + 40);
    id v12 = v8;
    uint64_t v13 = *(void *)(a1 + 32);
    id v9 = v8;
    [v6 enumerateObjectsUsingBlock:v10];
  }
  else if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_ERROR))
  {
    __90__EKInviteeAlternativeTimeSearcher__generateTimeSpansForResults_betweenStartDate_endDate___block_invoke_cold_1();
  }
}

void __90__EKInviteeAlternativeTimeSearcher__generateTimeSpansForResults_betweenStartDate_endDate___block_invoke_60(uint64_t a1, void *a2)
{
  v66[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 startDate];
  id v5 = [v3 endDate];
  int v6 = [v4 isEqualToDate:v5];

  if (v6)
  {
    if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_ERROR)) {
      __90__EKInviteeAlternativeTimeSearcher__generateTimeSpansForResults_betweenStartDate_endDate___block_invoke_60_cold_1();
    }
  }
  else if (+[EKAvailabilityUtilities showTypeAsBusy:](EKAvailabilityUtilities, "showTypeAsBusy:", [v3 type]))
  {
    uint64_t v7 = [*(id *)(a1 + 32) firstObject];
    unint64_t v8 = [*(id *)(a1 + 32) lastObject];
    id v9 = [v3 startDate];
    id v10 = [v7 startDate];
    int v11 = [v9 CalIsBeforeDate:v10];

    if (v11)
    {
      id v12 = objc_alloc_init(EKInviteeTimeSpan);
      uint64_t v13 = [v3 startDate];
      [(EKInviteeTimeSpan *)v12 setStartDate:v13];

      id v14 = [v7 startDate];
      [(EKInviteeTimeSpan *)v12 setEndDate:v14];

      int v15 = [(EKInviteeTimeSpan *)v12 conflictedParticipants];
      v66[0] = *(void *)(a1 + 40);
      long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:1];
      [v15 addObjectsFromArray:v16];

      [*(id *)(a1 + 32) insertObject:v12 atIndex:0];
    }
    id v17 = [v3 endDate];
    uint64_t v18 = [v8 endDate];
    int v19 = [v17 CalIsAfterDate:v18];

    if (v19)
    {
      uint64_t v20 = objc_alloc_init(EKInviteeTimeSpan);
      uint64_t v21 = [v8 endDate];
      [(EKInviteeTimeSpan *)v20 setStartDate:v21];

      unint64_t v22 = [v3 endDate];
      [(EKInviteeTimeSpan *)v20 setEndDate:v22];

      uint64_t v23 = [(EKInviteeTimeSpan *)v20 conflictedParticipants];
      uint64_t v65 = *(void *)(a1 + 40);
      id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];
      [v23 addObjectsFromArray:v24];

      [*(id *)(a1 + 32) addObject:v20];
    }
    long long v25 = objc_opt_class();
    uint64_t v26 = *(void *)(a1 + 32);
    long long v27 = [v3 startDate];
    unint64_t v28 = [v25 _binarySearchForIndexOfTimeSpanInArray:v26 containingDate:v27];

    if (v28 == [(id)objc_opt_class() _invalidBinarySearchIndex])
    {
      long long v29 = (void *)EKUIAvailabilitySearchHandle;
      if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_ERROR)) {
        __90__EKInviteeAlternativeTimeSearcher__generateTimeSpansForResults_betweenStartDate_endDate___block_invoke_60_cold_2(v29, v3);
      }
    }
    else
    {
      id v63 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v30 = [*(id *)(a1 + 32) count];
      unint64_t v61 = v30 - v28;
      uint64_t v62 = a1;
      if (v30 <= v28)
      {
        unint64_t v31 = 0;
      }
      else
      {
        v59 = v8;
        id v60 = v7;
        unint64_t v31 = 0;
        while (1)
        {
          unint64_t v32 = [*(id *)(a1 + 32) objectAtIndex:v28 + v31];
          unint64_t v33 = [v3 endDate];
          long long v34 = [v32 startDate];
          int v35 = [v33 CalIsBeforeOrSameAsDate:v34];

          if (v35) {
            break;
          }
          int v36 = [v32 startDate];
          uint64_t v37 = [v32 endDate];
          v38 = [v3 startDate];
          id v39 = [v32 startDate];
          int v40 = [v38 CalIsAfterDate:v39];

          if (v40)
          {
            int v41 = objc_alloc_init(EKInviteeTimeSpan);
            unint64_t v42 = [v32 startDate];
            [(EKInviteeTimeSpan *)v41 setStartDate:v42];

            id v43 = [v3 startDate];
            [(EKInviteeTimeSpan *)v41 setEndDate:v43];

            id v44 = [(EKInviteeTimeSpan *)v41 conflictedParticipants];
            id v45 = [v32 conflictedParticipants];
            [v44 addObjectsFromArray:v45];

            uint64_t v46 = v63;
            [v63 addObject:v41];
            uint64_t v47 = [v3 startDate];

            int v36 = (void *)v47;
          }
          else
          {
            uint64_t v46 = v63;
          }
          [v46 addObject:v32];
          uint64_t v48 = [v3 endDate];
          v49 = [v32 endDate];
          int v50 = [v48 CalIsBeforeDate:v49];

          if (v50)
          {
            BOOL v51 = objc_alloc_init(EKInviteeTimeSpan);
            v52 = [v3 endDate];
            [(EKInviteeTimeSpan *)v51 setStartDate:v52];

            uint64_t v53 = [v32 endDate];
            [(EKInviteeTimeSpan *)v51 setEndDate:v53];

            v54 = [(EKInviteeTimeSpan *)v51 conflictedParticipants];
            v55 = [v32 conflictedParticipants];
            [v54 addObjectsFromArray:v55];

            [v46 addObject:v51];
            uint64_t v56 = [v3 endDate];

            uint64_t v37 = (void *)v56;
          }
          ++v31;
          [v32 setStartDate:v36];
          [v32 setEndDate:v37];
          id v57 = [v32 conflictedParticipants];
          a1 = v62;
          uint64_t v64 = *(void *)(v62 + 40);
          v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
          [v57 addObjectsFromArray:v58];

          if (v61 == v31)
          {
            unint64_t v31 = v61;
            goto LABEL_24;
          }
        }

LABEL_24:
        unint64_t v8 = v59;
        uint64_t v7 = v60;
      }
      if ([v63 count])
      {
        objc_msgSend(*(id *)(v62 + 32), "replaceObjectsInRange:withObjectsFromArray:", v28, v31, v63);
      }
      else if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_ERROR))
      {
        __90__EKInviteeAlternativeTimeSearcher__generateTimeSpansForResults_betweenStartDate_endDate___block_invoke_60_cold_3();
      }
    }
  }
}

+ (int64_t)_binarySearchForIndexOfTimeSpanInArray:(id)a3 containingDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int64_t v7 = [(id)objc_opt_class() _invalidBinarySearchIndex];
  uint64_t v8 = [v5 count];
  if (v5 && v8)
  {
    unint64_t v9 = 0;
    unint64_t v10 = v8 - 1;
    do
    {
      uint64_t v11 = v9 + ((v10 - v9) >> 1);
      id v12 = [v5 objectAtIndex:v11];
      uint64_t v13 = [v12 startDate];
      if ([v6 CalIsAfterOrSameAsDate:v13])
      {
        id v14 = [v12 endDate];
        int v15 = [v6 CalIsBeforeDate:v14];

        if (v15)
        {

          int64_t v7 = v9 + ((v10 - v9) >> 1);
          break;
        }
      }
      else
      {
      }
      long long v16 = [v12 startDate];
      int v17 = [v6 CalIsBeforeDate:v16];

      if (v17) {
        unint64_t v10 = v11 - 1;
      }
      else {
        unint64_t v9 = v11 + 1;
      }
    }
    while (v9 <= v10);
  }

  return v7;
}

+ (int64_t)_invalidBinarySearchIndex
{
  return -1;
}

+ (id)_selfOrganizerForNewlyScheduledEventWithAddress:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F576B0];
  id v4 = a3;
  id v5 = [v3 defaultProvider];
  id v6 = [v5 myFullName];
  int64_t v7 = v6;
  if (!v6 || ![v6 length])
  {
    uint64_t v8 = EKBundle();
    uint64_t v9 = [v8 localizedStringForKey:@"You" value:&stru_1EF932508 table:0];

    int64_t v7 = (void *)v9;
  }
  unint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v4];

  uint64_t v11 = +[EKOrganizer organizerWithName:v7 emailAddress:0 phoneNumber:0 address:v10 isCurrentUser:1];

  return v11;
}

+ (void)_validateSpans:(id)a3
{
  id v3 = a3;
  id v4 = (void *)EKUIAvailabilitySearchHandle;
  if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_DEBUG)) {
    +[EKInviteeAlternativeTimeSearcher _validateSpans:].cold.5(v4, v3);
  }
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v18 = 0;
  int v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy__6;
  void v8[4] = __Block_byref_object_dispose__6;
  id v9 = 0;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__6;
  v6[4] = __Block_byref_object_dispose__6;
  id v7 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__EKInviteeAlternativeTimeSearcher__validateSpans___block_invoke;
  v5[3] = &unk_1E5B97A30;
  v5[4] = v8;
  v5[5] = &v22;
  void v5[6] = &v18;
  v5[7] = &v14;
  v5[8] = v6;
  v5[9] = &v10;
  [v3 enumerateObjectsUsingBlock:v5];
  if (*((unsigned char *)v23 + 24) && os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_ERROR)) {
    +[EKInviteeAlternativeTimeSearcher _validateSpans:].cold.4();
  }
  if (*((unsigned char *)v19 + 24) && os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_ERROR)) {
    +[EKInviteeAlternativeTimeSearcher _validateSpans:]();
  }
  if (*((unsigned char *)v15 + 24) && os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_ERROR)) {
    +[EKInviteeAlternativeTimeSearcher _validateSpans:]();
  }
  if (*((unsigned char *)v11 + 24) && os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_ERROR)) {
    +[EKInviteeAlternativeTimeSearcher _validateSpans:]();
  }
  _Block_object_dispose(v6, 8);

  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
}

void __51__EKInviteeAlternativeTimeSearcher__validateSpans___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 startDate];
  id v5 = [v3 endDate];
  if (*(void *)(*(void *)(a1[4] + 8) + 40) && (objc_msgSend(v4, "isEqualToDate:") & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_ERROR)) {
      __51__EKInviteeAlternativeTimeSearcher__validateSpans___block_invoke_cold_4();
    }
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  }
  uint64_t v6 = [v3 endDate];
  uint64_t v7 = *(void *)(a1[4] + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if ([v4 isEqualToDate:v5])
  {
    if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_ERROR)) {
      __51__EKInviteeAlternativeTimeSearcher__validateSpans___block_invoke_cold_2();
    }
    uint64_t v9 = a1[6];
  }
  else
  {
    if (![v4 CalIsAfterDate:v5]) {
      goto LABEL_15;
    }
    if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_ERROR)) {
      __51__EKInviteeAlternativeTimeSearcher__validateSpans___block_invoke_cold_3();
    }
    uint64_t v9 = a1[7];
  }
  *(unsigned char *)(*(void *)(v9 + 8) + 24) = 1;
LABEL_15:
  uint64_t v10 = a1 + 8;
  uint64_t v11 = *(void **)(*(void *)(a1[8] + 8) + 40);
  if (v11)
  {
    uint64_t v12 = [v11 conflictedParticipants];
    if (v12)
    {
      char v13 = [*(id *)(*(void *)(*v10 + 8) + 40) conflictedParticipants];
      BOOL v14 = [v13 count] != 0;
    }
    else
    {
      BOOL v14 = 0;
    }

    int v15 = [v3 conflictedParticipants];
    if (v15)
    {
      uint64_t v16 = [v3 conflictedParticipants];
      BOOL v17 = [v16 count] != 0;
    }
    else
    {
      BOOL v17 = 0;
    }

    if (!v14 && !v17)
    {
      *(unsigned char *)(*(void *)(a1[9] + 8) + 24) = 1;
      if (os_log_type_enabled((os_log_t)EKUIAvailabilitySearchHandle, OS_LOG_TYPE_ERROR)) {
        __51__EKInviteeAlternativeTimeSearcher__validateSpans___block_invoke_cold_1();
      }
    }
  }
  uint64_t v18 = *(void *)(*v10 + 8);
  int v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v3;
}

- (BOOL)noConflictRequired
{
  return self->_noConflictRequired;
}

- (void)setNoConflictRequired:(BOOL)a3
{
  self->_noConflictRequired = a3;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void)setProcessingQueue:(id)a3
{
}

- (NSDate)internalOriginalStartDate
{
  return self->_internalOriginalStartDate;
}

- (void)setInternalOriginalStartDate:(id)a3
{
}

- (NSDate)internalOriginalEndDate
{
  return self->_internalOriginalEndDate;
}

- (void)setInternalOriginalEndDate:(id)a3
{
}

- (NSDate)originalRangeStartDate
{
  return self->_originalRangeStartDate;
}

- (void)setOriginalRangeStartDate:(id)a3
{
}

- (NSMutableArray)internalProposedStarts
{
  return self->_internalProposedStarts;
}

- (void)setInternalProposedStarts:(id)a3
{
}

- (EKSource)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (NSString)ignoredEventID
{
  return self->_ignoredEventID;
}

- (void)setIgnoredEventID:(id)a3
{
}

- (NSOperationQueue)availabilityRequestsQueue
{
  return self->_availabilityRequestsQueue;
}

- (void)setAvailabilityRequestsQueue:(id)a3
{
}

- (NSMutableDictionary)participantAddressesToParticipants
{
  return self->_participantAddressesToParticipants;
}

- (void)setParticipantAddressesToParticipants:(id)a3
{
}

- (NSString)organizerAddress
{
  return self->_organizerAddress;
}

- (void)setOrganizerAddress:(id)a3
{
}

- (BOOL)availabilityRequestInProgress
{
  return self->_availabilityRequestInProgress;
}

- (void)setAvailabilityRequestInProgress:(BOOL)a3
{
  self->_availabilityRequestInProgress = a3;
}

- (NSDate)nextAvailabilityRangeStartDate
{
  return self->_nextAvailabilityRangeStartDate;
}

- (void)setNextAvailabilityRangeStartDate:(id)a3
{
}

- (double)availabilitySearchDurationMultiplier
{
  return self->_availabilitySearchDurationMultiplier;
}

- (void)setAvailabilitySearchDurationMultiplier:(double)a3
{
  self->_availabilitySearchDurationMultiplier = a3;
}

- (unint64_t)remainingSearchAttempts
{
  return self->_remainingSearchAttempts;
}

- (void)setRemainingSearchAttempts:(unint64_t)a3
{
  self->_remainingSearchAttempts = a3;
}

- (NSMutableArray)leftoverSpans
{
  return self->_leftoverSpans;
}

- (void)setLeftoverSpans:(id)a3
{
}

- (NSMutableArray)internalTimesWhenAllAttendeesCanAttend
{
  return self->_internalTimesWhenAllAttendeesCanAttend;
}

- (void)setInternalTimesWhenAllAttendeesCanAttend:(id)a3
{
}

- (NSMutableArray)internalTimesWhenSomeAttendeesCanAttend
{
  return self->_internalTimesWhenSomeAttendeesCanAttend;
}

- (void)setInternalTimesWhenSomeAttendeesCanAttend:(id)a3
{
}

- (NSMutableArray)internalProposedTimes
{
  return self->_internalProposedTimes;
}

- (void)setInternalProposedTimes:(id)a3
{
}

- (NSMutableArray)internalOriginalConflictedParticipants
{
  return self->_internalOriginalConflictedParticipants;
}

- (void)setInternalOriginalConflictedParticipants:(id)a3
{
}

- (BOOL)internalSearchingForMoreTimesWhenAllAttendeesCanAttend
{
  return self->_internalSearchingForMoreTimesWhenAllAttendeesCanAttend;
}

- (void)setInternalSearchingForMoreTimesWhenAllAttendeesCanAttend:(BOOL)a3
{
  self->_internalSearchingForMoreTimesWhenAllAttendeesCanAttend = a3;
}

- (BOOL)internalSearchingForMoreTimesWhenSomeAttendeesCanAttend
{
  return self->_internalSearchingForMoreTimesWhenSomeAttendeesCanAttend;
}

- (void)setInternalSearchingForMoreTimesWhenSomeAttendeesCanAttend:(BOOL)a3
{
  self->_internalSearchingForMoreTimesWhenSomeAttendeesCanAttend = a3;
}

- (id)stateChanged
{
  return self->_stateChanged;
}

- (void)setStateChanged:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stateChanged, 0);
  objc_storeStrong((id *)&self->_internalOriginalConflictedParticipants, 0);
  objc_storeStrong((id *)&self->_internalProposedTimes, 0);
  objc_storeStrong((id *)&self->_internalTimesWhenSomeAttendeesCanAttend, 0);
  objc_storeStrong((id *)&self->_internalTimesWhenAllAttendeesCanAttend, 0);
  objc_storeStrong((id *)&self->_leftoverSpans, 0);
  objc_storeStrong((id *)&self->_nextAvailabilityRangeStartDate, 0);
  objc_storeStrong((id *)&self->_organizerAddress, 0);
  objc_storeStrong((id *)&self->_participantAddressesToParticipants, 0);
  objc_storeStrong((id *)&self->_availabilityRequestsQueue, 0);
  objc_storeStrong((id *)&self->_ignoredEventID, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_internalProposedStarts, 0);
  objc_storeStrong((id *)&self->_originalRangeStartDate, 0);
  objc_storeStrong((id *)&self->_internalOriginalEndDate, 0);
  objc_storeStrong((id *)&self->_internalOriginalStartDate, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);

  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_1A4E47000, v0, v1, "No event given.  Will not search for alternative times.", v2, v3, v4, v5, v6);
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "The event's start date is the same as its end date.  Will not issue search for alternative times.", v2, v3, v4, v5, v6);
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "The event is an all-day.  This is currently not supported.  Will not issue search for alternative times.", v2, v3, v4, v5, v6);
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A4E47000, v0, v1, "Sending off availability request operation for execution: [%@]", v2, v3, v4, v5, v6);
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A4E47000, v0, v1, "We need to figure out the availability status of some attendees in order to complete conflict detection.  Attendees: [%@].", v2, v3, v4, v5, v6);
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_6()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "No conflicts detected, but noConflictFound flag set. Will attempt to perform conflict resolution.", v2, v3, v4, v5, v6);
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_7()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "No conflicts detected.  Will not attempt to perform conflict resolution.", v2, v3, v4, v5, v6);
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_8(void *a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSNumber;
  uint64_t v4 = a1;
  uint64_t v5 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(a2, "count"));
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1A4E47000, v4, v6, "Detected a conflict.  [%@] attendees have declined.  Will perform conflict resolution by searching for time slots in the future. ", v7);
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_9()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "The event's dates have not been dirtied and there are no addresses collected for looking up availability information for the event's original time span.", v2, v3, v4, v5, v6);
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_10()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_1A4E47000, v0, v1, "No 'organizerAddressForNewlyScheduledEvent' given.  The organizer for this event is unknown and conflict resolution will likely be incorrect and irrelevant.", v2, v3, v4, v5, v6);
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_11()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A4E47000, v0, v1, "Could not find the organizer's address.  This can sometimes happen if the event is being scheduled for the first time.  Organizer: [%@]", v2, v3, v4, v5, v6);
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_12()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_9();
  _os_log_debug_impl(&dword_1A4E47000, v0, OS_LOG_TYPE_DEBUG, "Adding organizer with address [%@] to the list of attendees to be included in conflict resolution.  Participant: [%@]", v1, 0x16u);
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_13()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "Extracting attendees for original conflict detection.", v2, v3, v4, v5, v6);
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_14(id *a1, void *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = *a1;
  uint8_t v6 = a2;
  uint64_t v7 = [v5 startDate];
  uint64_t v8 = [*a1 endDateUnadjustedForLegacyClients];
  uint64_t v9 = [*a1 calendar];
  uint64_t v10 = [v9 source];
  int v11 = 138413058;
  uint64_t v12 = v7;
  __int16 v13 = 2112;
  BOOL v14 = v8;
  __int16 v15 = 2112;
  uint64_t v16 = a3;
  __int16 v17 = 2112;
  uint64_t v18 = v10;
  _os_log_debug_impl(&dword_1A4E47000, v6, OS_LOG_TYPE_DEBUG, "Starting original conflict detection - event start date: [%@] event end date: [%@] ignored event ID: [%@] source: [%@]", (uint8_t *)&v11, 0x2Au);
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_15()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "The event's source does not support availability requests.  Will not issue search for alternative times.", v2, v3, v4, v5, v6);
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_cold_16(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = 138412546;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_1A4E47000, a2, OS_LOG_TYPE_DEBUG, "Searching reset with organizerAddressForNewlyScheduledEvent [%@] and event [%@]", (uint8_t *)&v4, 0x16u);
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_22_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "self went away.  Returning early.", v2, v3, v4, v5, v6);
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_22_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "The availability operation went away.  Returning early.", v2, v3, v4, v5, v6);
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_23_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A4E47000, v0, v1, "Participants with conflicts found.  Will search for other time slots.  Participants with conflicts: [%@]", v2, v3, v4, v5, v6);
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_23_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "No participants with conflicts found.  Will not continue on by searching for other time slots.", v2, v3, v4, v5, v6);
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_23_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A4E47000, v0, v1, "Conflict detection complete.  Conflicted participants: [%@]", v2, v3, v4, v5, v6);
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_23_cold_4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "Including declined participants in the list of participants with conflicts.", v2, v3, v4, v5, v6);
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_23_cold_5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_24_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "Could not find participant.  Will not count as busy.  Address: [%@]", v2, v3, v4, v5, v6);
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_24_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A4E47000, v0, v1, "This participant is busy during the event's time range: [%@]", v2, v3, v4, v5, v6);
}

void __90__EKInviteeAlternativeTimeSearcher_resetWithEvent_organizerAddressForNewlyScheduledEvent___block_invoke_24_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A4E47000, v0, v1, "This participant is completely free during the event's time range: [%@]", v2, v3, v4, v5, v6);
}

void __50__EKInviteeAlternativeTimeSearcher__attemptSearch__block_invoke_3_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "The availability search operation went away.  Returning early.", v2, v3, v4, v5, v6);
}

void __50__EKInviteeAlternativeTimeSearcher__attemptSearch__block_invoke_3_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A4E47000, v0, v1, "This availability search operation was cancelled: [%@]", v2, v3, v4, v5, v6);
}

void __50__EKInviteeAlternativeTimeSearcher__attemptSearch__block_invoke_46_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __53__EKInviteeAlternativeTimeSearcher__sendStateChange___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a2;
  uint64_t v5 = [(id)objc_opt_class() stateAsString:*(void *)(a3 + 40)];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1A4E47000, v4, OS_LOG_TYPE_ERROR, "No 'state changed' callback found.  Will not send state changed information.  State: [%@]", v6, 0xCu);
}

void __53__EKInviteeAlternativeTimeSearcher__sendStateChange___block_invoke_cold_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a2;
  uint64_t v5 = [(id)objc_opt_class() stateAsString:*(void *)(a3 + 40)];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1A4E47000, v4, v6, "Sending state change.  State: [%@]", v7);
}

- (void)_processResults:betweenStartDate:endDate:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "Work remains, but there are no more remaining search attempts left.  Search exhausted.", v2, v3, v4, v5, v6);
}

- (void)_processResults:(void *)a1 betweenStartDate:(void *)a2 endDate:.cold.2(void *a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSNumber;
  uint64_t v4 = a1;
  uint64_t v5 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(a2, "remainingSearchAttempts"));
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1A4E47000, v4, v6, "There are [%@] remaining search attempts left.  Continuing search.", v7);
}

- (void)_processResults:betweenStartDate:endDate:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_1A4E47000, v0, v1, "Search has not progressed and no more work remains.  This is an invalid state, as there should always be work to do until we've seen search results or there are no more search attempts left.", v2, v3, v4, v5, v6);
}

- (void)_processResults:(void *)a1 betweenStartDate:(void *)a2 endDate:(void *)a3 .cold.4(void *a1, void *a2, void *a3)
{
  uint64_t v5 = NSNumber;
  id v6 = a1;
  uint64_t v7 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(a2, "count"));
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "count"));
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_1A4E47000, v9, v10, "Found [%@] free times and [%@] non-free times.", v11, v12, v13, v14, v15);
}

- (void)_haltSearchWithError:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_5(&dword_1A4E47000, v0, v1, "Halting search.", v2, v3, v4, v5, v6);
}

+ (void)_findLeftoverSpans:usingFreeTimes:andNonOptimalTimes:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A4E47000, v0, v1, "No leftover spans found for latest date: [%@]", v2, v3, v4, v5, v6);
}

void __90__EKInviteeAlternativeTimeSearcher__generateTimeSpansForResults_betweenStartDate_endDate___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "No participant found for participant with address: [%@].  Will not generate time spans for this participant's availability information.", v2, v3, v4, v5, v6);
}

void __90__EKInviteeAlternativeTimeSearcher__generateTimeSpansForResults_betweenStartDate_endDate___block_invoke_60_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "This span's start date is equal to its end date: [%@].  Will not consider this span in alternative time calculations.", v2, v3, v4, v5, v6);
}

void __90__EKInviteeAlternativeTimeSearcher__generateTimeSpansForResults_betweenStartDate_endDate___block_invoke_60_cold_2(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 startDate];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1A4E47000, v3, OS_LOG_TYPE_ERROR, "Could not find a time span that contains date: [%@]", v5, 0xCu);
}

void __90__EKInviteeAlternativeTimeSearcher__generateTimeSpansForResults_betweenStartDate_endDate___block_invoke_60_cold_3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_7(&dword_1A4E47000, v0, v1, "No replacement spans found.", v2, v3, v4, v5, v6);
}

+ (void)_validateSpans:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "At least two contiguous spans are marked as being free in the spans range: [%@]", v2, v3, v4, v5, v6);
}

+ (void)_validateSpans:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "At least one span's start date comes after its end date in the spans range: [%@]", v2, v3, v4, v5, v6);
}

+ (void)_validateSpans:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "A zero-duration span exists in the spans range: [%@]", v2, v3, v4, v5, v6);
}

+ (void)_validateSpans:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "Time gaps exist in the spans range: [%@]", v2, v3, v4, v5, v6);
}

+ (void)_validateSpans:(void *)a1 .cold.5(void *a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSNumber;
  uint64_t v4 = a1;
  uint64_t v5 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(a2, "count"));
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_1(&dword_1A4E47000, v4, v6, "Validating [%@] spans.", v7);
}

void __51__EKInviteeAlternativeTimeSearcher__validateSpans___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_10(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_11(&dword_1A4E47000, v1, v2, "Contiguous free spans exist.  Last inspected span: [%@].  This span: [%@]", (void)v3, DWORD2(v3));
}

void __51__EKInviteeAlternativeTimeSearcher__validateSpans___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "Span's start and end date is the same: [%@]", v2, v3, v4, v5, v6);
}

void __51__EKInviteeAlternativeTimeSearcher__validateSpans___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1A4E47000, v0, v1, "Span's start date is after its end date: [%@]", v2, v3, v4, v5, v6);
}

void __51__EKInviteeAlternativeTimeSearcher__validateSpans___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_10(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_11(&dword_1A4E47000, v1, v2, "Found span whose start date doesn't match previous span's end date.  Previous lastEndDate: [%@].  Cached span: [%@]", (void)v3, DWORD2(v3));
}

@end