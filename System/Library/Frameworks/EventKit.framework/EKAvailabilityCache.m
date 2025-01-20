@interface EKAvailabilityCache
+ (BOOL)_isValidStartDate:(id)a3 endDate:(id)a4;
+ (id)_generateEventKitSpansFromPersistenceSpans:(id)a3;
+ (int64_t)_convertType:(int64_t)a3;
+ (void)_logRequestElapsedTime:(double)a3 forNumberOfAddresses:(unint64_t)a4;
- (BOOL)_validateRequestStartDate:(id)a3 endDate:(id)a4 addresses:(id)a5 error:(id *)a6;
- (EKAvailabilityCache)init;
- (EKAvailabilityCache)initWithSource:(id)a3;
- (id)_cachedSpanResultsBetweenStartDate:(id)a3 endDate:(id)a4 ignoredEventID:(id)a5 addresses:(id)a6;
- (id)_dictionaryForIgnoredEventID:(id)a3;
- (id)cachedAvailabilityInDateRange:(id)a3 ignoredEventID:(id)a4 addresses:(id)a5;
- (id)description;
- (id)requestAvailabilityBetweenStartDate:(id)a3 endDate:(id)a4 ignoredEventID:(id)a5 addresses:(id)a6 resultsBlock:(id)a7 completionBlock:(id)a8;
- (void)_handleResults:(id)a3 resultsBlock:(id)a4 ignoredEventID:(id)a5;
- (void)cachedAvailabilityInDateRange:(id)a3 ignoredEventID:(id)a4 addresses:(id)a5 results:(id)a6;
- (void)cancelAvailabilityRequestWithID:(id)a3;
@end

@implementation EKAvailabilityCache

- (EKAvailabilityCache)init
{
  return [(EKAvailabilityCache *)self initWithSource:0];
}

- (EKAvailabilityCache)initWithSource:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)EKAvailabilityCache;
  v5 = [(EKAvailabilityCache *)&v25 init];
  if (v5)
  {
    if (v4) {
      char v6 = [v4 constraintSupportsAvailabilityRequests];
    }
    else {
      char v6 = 0;
    }
    v7 = [v4 externalID];
    if (!v7)
    {
      v5->_sourceIsInvalid = 1;
      if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_ERROR)) {
        -[EKAvailabilityCache initWithSource:]();
      }
    }
    objc_storeStrong((id *)&v5->_accountID, v7);
    v5->_sourceSupportsAvailabilityRequests = v6;
    v5->_nextRequestID = 0;
    v5->_cancelledID = 0;
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    addressesToCachedSpanRanges = v5->_addressesToCachedSpanRanges;
    v5->_addressesToCachedSpanRanges = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    ignoredEventIDsToAddressBasedCaches = v5->_ignoredEventIDsToAddressBasedCaches;
    v5->_ignoredEventIDsToAddressBasedCaches = v10;

    v12 = [v4 sourceIdentifier];
    v13 = [v4 title];
    v14 = (void *)[[NSString alloc] initWithFormat:@"%@-%@-processing", v13, v12];
    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    id v15 = objc_claimAutoreleasedReturnValue();
    v16 = (const char *)[v15 UTF8String];

    dispatch_queue_t v17 = dispatch_queue_create(v16, 0);
    processingQueue = v5->_processingQueue;
    v5->_processingQueue = (OS_dispatch_queue *)v17;

    v19 = (void *)[[NSString alloc] initWithFormat:@"%@-%@-callback", v13, v12];
    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    id v20 = objc_claimAutoreleasedReturnValue();
    v21 = (const char *)[v20 UTF8String];

    dispatch_queue_t v22 = dispatch_queue_create(v21, 0);
    callbackQueue = v5->_callbackQueue;
    v5->_callbackQueue = (OS_dispatch_queue *)v22;

    if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG)) {
      -[EKAvailabilityCache initWithSource:]();
    }
  }
  return v5;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F576E8]);
  v8.receiver = self;
  v8.super_class = (Class)EKAvailabilityCache;
  id v4 = [(EKAvailabilityCache *)&v8 description];
  v5 = (void *)[v3 initWithSuperclassDescription:v4];

  [v5 setKey:@"accountID" withString:self->_accountID];
  [v5 setKey:@"sourceIsInvalid" withBoolean:self->_sourceIsInvalid];
  [v5 setKey:@"sourceSupportsAvailabilityRequests" withBoolean:self->_sourceSupportsAvailabilityRequests];
  [v5 setKey:@"addressesToCachedSpanRanges" withDictionary:self->_addressesToCachedSpanRanges];
  [v5 setKey:@"ignoredEventIDsToAddressBasedCaches" withDictionary:self->_ignoredEventIDsToAddressBasedCaches];
  char v6 = [v5 build];

  return v6;
}

- (id)_cachedSpanResultsBetweenStartDate:(id)a3 endDate:(id)a4 ignoredEventID:(id)a5 addresses:(id)a6
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v34 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processingQueue);
  v31 = v11;
  v13 = [(EKAvailabilityCache *)self _dictionaryForIgnoredEventID:v11];
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v12;
  uint64_t v14 = [obj countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v14)
  {
    uint64_t v16 = v14;
    uint64_t v17 = *(void *)v38;
    *(void *)&long long v15 = 138412546;
    long long v30 = v15;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v38 != v17) {
          objc_enumerationMutation(obj);
        }
        v19 = *(void **)(*((void *)&v37 + 1) + 8 * v18);
        id v20 = EKAvailabilityHandle;
        if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v42 = v19;
          _os_log_debug_impl(&dword_1A4E47000, v20, OS_LOG_TYPE_DEBUG, "Gathering cached availability for address: [%@]", buf, 0xCu);
        }
        v21 = objc_msgSend(v13, "objectForKey:", v19, v30);
        if (v21
          || (EKUtils_AdjustedAttendeeAddress(v19),
              dispatch_queue_t v22 = objc_claimAutoreleasedReturnValue(),
              [v13 objectForKey:v22],
              v21 = objc_claimAutoreleasedReturnValue(),
              v22,
              v21))
        {
          v23 = [v21 gatherFreshlyCachedSpansBetweenStartDate:v34 endDate:v10];
          v24 = v23;
          if (v23 && [v23 count])
          {
            objc_super v25 = EKAvailabilityHandle;
            if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG)) {
              -[EKAvailabilityCache _cachedSpanResultsBetweenStartDate:endDate:ignoredEventID:addresses:](&v35, v36, v25);
            }
            CalAnalyticsSendEvent();
            [v32 setObject:v24 forKey:v19];
          }
          else
          {
            v26 = EKAvailabilityHandle;
            if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              v42 = v19;
              __int16 v43 = 2112;
              id v44 = v34;
              __int16 v45 = 2112;
              id v46 = v10;
              _os_log_debug_impl(&dword_1A4E47000, v26, OS_LOG_TYPE_DEBUG, "Found stale cached spans for address [%@] in range with start date [%@] and end date: [%@].  Will send out remote fetch for availability.", buf, 0x20u);
            }
            CalAnalyticsSendEvent();
          }
        }
        else
        {
          v27 = EKAvailabilityHandle;
          if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v30;
            v42 = v19;
            __int16 v43 = 2112;
            id v44 = v31;
            _os_log_debug_impl(&dword_1A4E47000, v27, OS_LOG_TYPE_DEBUG, "No cached spans found for address: [%@].  Ignored event ID: [%@].  Will send out remote fetch for availability.", buf, 0x16u);
          }
        }
        ++v18;
      }
      while (v16 != v18);
      uint64_t v28 = [obj countByEnumeratingWithState:&v37 objects:v47 count:16];
      uint64_t v16 = v28;
    }
    while (v28);
  }

  return v32;
}

- (BOOL)_validateRequestStartDate:(id)a3 endDate:(id)a4 addresses:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (self->_sourceIsInvalid)
  {
    if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_ERROR)) {
      -[EKAvailabilityCache _validateRequestStartDate:endDate:addresses:error:].cold.4();
    }
    v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = 0;
LABEL_5:
    long long v15 = [v13 errorWithDomain:@"EKAvailabilityCacheError" code:v14 userInfo:0];
    goto LABEL_6;
  }
  if (!self->_sourceSupportsAvailabilityRequests)
  {
    uint64_t v18 = EKAvailabilityHandle;
    if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG)) {
      -[EKAvailabilityCache _validateRequestStartDate:endDate:addresses:error:]((uint64_t)self, v18);
    }
    v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = 1;
    goto LABEL_5;
  }
  if (([(id)objc_opt_class() _isValidStartDate:v10 endDate:v11] & 1) == 0)
  {
    v19 = EKAvailabilityHandle;
    if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_ERROR)) {
      -[EKAvailabilityCache _validateRequestStartDate:endDate:addresses:error:](v19);
    }
    v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = 2;
    goto LABEL_5;
  }
  if (v12 && [v12 count])
  {
    long long v15 = 0;
    BOOL v16 = 1;
    if (!a6) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v20 = EKAvailabilityHandle;
  if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG)) {
    -[EKAvailabilityCache _validateRequestStartDate:endDate:addresses:error:](v20);
  }
  long long v15 = 0;
LABEL_6:
  BOOL v16 = 0;
  if (a6) {
LABEL_7:
  }
    *a6 = v15;
LABEL_8:

  return v16;
}

- (id)requestAvailabilityBetweenStartDate:(id)a3 endDate:(id)a4 ignoredEventID:(id)a5 addresses:(id)a6 resultsBlock:(id)a7 completionBlock:(id)a8
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  BOOL v16 = (uint64_t (*)(uint64_t, uint64_t))a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = EKAvailabilityHandle;
  if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    *(void *)&uint8_t buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2112;
    id v46 = v16;
    LOWORD(v47) = 2112;
    *(void *)((char *)&v47 + 2) = v17;
    _os_log_debug_impl(&dword_1A4E47000, v20, OS_LOG_TYPE_DEBUG, "A client requested availability between start date [%@] and end date [%@].  Ignored event ID: [%@].  Addresses: [%@]", buf, 0x2Au);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v46 = __Block_byref_object_copy_;
  *(void *)&long long v47 = __Block_byref_object_dispose_;
  *((void *)&v47 + 1) = 0;
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 0;
  id v40 = 0;
  BOOL v21 = [(EKAvailabilityCache *)self _validateRequestStartDate:v14 endDate:v15 addresses:v17 error:&v40];
  id v22 = v40;
  if (v21)
  {
    processingQueue = self->_processingQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke;
    block[3] = &unk_1E5B96C20;
    block[4] = self;
    id v32 = v14;
    id v33 = v15;
    id v34 = v16;
    id v35 = v17;
    id v36 = v18;
    long long v38 = &v41;
    long long v39 = buf;
    id v37 = v19;
    dispatch_sync(processingQueue, block);

    BOOL v24 = *((unsigned char *)v42 + 24) != 0;
    if (!v19) {
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v24 = 1;
    *((unsigned char *)v42 + 24) = 1;
    if (!v19) {
      goto LABEL_9;
    }
  }
  if (v24)
  {
    callbackQueue = self->_callbackQueue;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_3;
    v28[3] = &unk_1E5B96B08;
    id v30 = v19;
    id v29 = v22;
    dispatch_async(callbackQueue, v28);
  }
LABEL_9:
  id v26 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(buf, 8);

  return v26;
}

void __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) _cachedSpanResultsBetweenStartDate:*(void *)(a1 + 40) endDate:*(void *)(a1 + 48) ignoredEventID:*(void *)(a1 + 56) addresses:*(void *)(a1 + 64)];
  uint64_t v3 = [v2 count];
  if (v3)
  {
    uint64_t v4 = v3;
    v5 = (void *)EKAvailabilityHandle;
    if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG))
    {
      v27 = v5;
      uint64_t v28 = [v2 allKeys];
      uint64_t v29 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 134218498;
      uint64_t v55 = v4;
      __int16 v56 = 2112;
      v57 = v28;
      __int16 v58 = 2112;
      uint64_t v59 = v29;
      _os_log_debug_impl(&dword_1A4E47000, v27, OS_LOG_TYPE_DEBUG, "[%lu] local cached spans were found for addresses: [%@].  Ignored event ID: [%@].  Sending these results immediately to the requesting client.", buf, 0x20u);
    }
    char v6 = *(void **)(a1 + 72);
    if (v6)
    {
      v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_36;
      block[3] = &unk_1E5B96B08;
      id v53 = v6;
      id v52 = v2;
      dispatch_async(v7, block);
    }
  }
  objc_super v8 = *(void **)(a1 + 64);
  v9 = (void *)MEMORY[0x1E4F28F60];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_2;
  v49[3] = &unk_1E5B96B30;
  id v10 = v2;
  id v50 = v10;
  id v11 = [v9 predicateWithBlock:v49];
  id v12 = [v8 filteredArrayUsingPredicate:v11];

  uint64_t v13 = [v12 count];
  if (v13)
  {
    uint64_t v14 = v13;
    id v15 = EKAvailabilityHandle;
    if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v30 = *(void *)(a1 + 48);
      uint64_t v31 = *(void *)(a1 + 56);
      id v32 = *(void **)(a1 + 40);
      uint64_t v33 = *(void *)(*(void *)(a1 + 32) + 16);
      *(_DWORD *)buf = 138413314;
      uint64_t v55 = (uint64_t)v12;
      __int16 v56 = 2112;
      v57 = v32;
      __int16 v58 = 2112;
      uint64_t v59 = v30;
      __int16 v60 = 2112;
      uint64_t v61 = v31;
      __int16 v62 = 2112;
      uint64_t v63 = v33;
      _os_log_debug_impl(&dword_1A4E47000, v15, OS_LOG_TYPE_DEBUG, "Sending network request for addresses: [%@].  Start date: [%@].  End date: [%@]  Ignored event ID: [%@].  Account ID: [%@]", buf, 0x34u);
    }
    id v16 = objc_alloc_init(MEMORY[0x1E4F577D0]);
    [v16 start];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_41;
    v43[3] = &unk_1E5B96B80;
    uint64_t v48 = *(void *)(a1 + 96);
    id v17 = v16;
    uint64_t v18 = *(void *)(a1 + 32);
    id v44 = v17;
    uint64_t v45 = v18;
    id v47 = *(id *)(a1 + 72);
    id v46 = *(id *)(a1 + 56);
    id v19 = (void *)MEMORY[0x1A6266730](v43);
    uint64_t v34 = MEMORY[0x1E4F143A8];
    uint64_t v35 = 3221225472;
    id v36 = __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_2_44;
    id v37 = &unk_1E5B96BF8;
    uint64_t v41 = *(void *)(a1 + 96);
    uint64_t v20 = *(void *)(a1 + 32);
    id v38 = v17;
    uint64_t v39 = v20;
    id v40 = *(id *)(a1 + 80);
    uint64_t v42 = v14;
    id v21 = v17;
    id v22 = (void *)MEMORY[0x1A6266730](&v34);
    v23 = [MEMORY[0x1E4F5E950] sharedConnection];
    uint64_t v24 = objc_msgSend(v23, "requestCalendarAvailabilityWithAccountID:startDate:endDate:ignoredEventID:addresses:resultsBlock:completionBlock:", *(void *)(*(void *)(a1 + 32) + 16), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), v12, v19, v22, v34, v35, v36, v37);
    uint64_t v25 = *(void *)(*(void *)(a1 + 96) + 8);
    id v26 = *(void **)(v25 + 40);
    *(void *)(v25 + 40) = v24;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
  }
}

uint64_t __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_36(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

BOOL __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  BOOL v3 = v2 == 0;

  return v3;
}

void __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_41(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)EKAvailabilityHandle;
  if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG)) {
    __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_41_cold_1(a1, (uint64_t)v3, v4);
  }
  uint64_t v5 = *(void *)(a1 + 40);
  char v6 = *(NSObject **)(v5 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_42;
  v8[3] = &unk_1E5B96B58;
  v8[4] = v5;
  id v9 = v3;
  id v11 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 48);
  id v7 = v3;
  dispatch_async(v6, v8);
}

uint64_t __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_42(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleResults:*(void *)(a1 + 40) resultsBlock:*(void *)(a1 + 56) ignoredEventID:*(void *)(a1 + 48)];
}

void __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_2_44(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)EKAvailabilityHandle;
  if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG)) {
    __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_2_44_cold_1(a1, (uint64_t)v3, v4);
  }
  double v5 = (double)(unint64_t)[*(id *)(a1 + 32) elapsedTimeAsNumber:1];
  char v6 = *(NSObject **)(*(void *)(a1 + 40) + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_45;
  block[3] = &unk_1E5B96BD0;
  id v7 = *(id *)(a1 + 48);
  id v10 = v3;
  id v11 = v7;
  void block[4] = *(void *)(a1 + 40);
  double v12 = v5;
  uint64_t v13 = *(void *)(a1 + 64);
  id v8 = v3;
  dispatch_async(v6, block);
}

uint64_t __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_45(uint64_t a1)
{
  if (*(void *)(a1 + 48))
  {
    v2 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_2_46;
    v4[3] = &unk_1E5B96BA8;
    id v5 = *(id *)(a1 + 40);
    id v6 = *(id *)(a1 + 48);
    dispatch_async(v2, v4);
  }
  return [(id)objc_opt_class() _logRequestElapsedTime:*(void *)(a1 + 64) forNumberOfAddresses:*(double *)(a1 + 56)];
}

void __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_2_46(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v6 = *MEMORY[0x1E4F28A50];
    v7[0] = v2;
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
    id v5 = [v3 errorWithDomain:@"EKAvailabilityCacheError" code:3 userInfo:v4];
  }
  else
  {
    id v5 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)cachedAvailabilityInDateRange:(id)a3 ignoredEventID:(id)a4 addresses:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy_;
  id v26 = __Block_byref_object_dispose_;
  id v27 = 0;
  id v11 = [v8 startDate];
  double v12 = [v8 endDate];
  BOOL v13 = [(EKAvailabilityCache *)self _validateRequestStartDate:v11 endDate:v12 addresses:v10 error:0];

  if (v13)
  {
    processingQueue = self->_processingQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__EKAvailabilityCache_cachedAvailabilityInDateRange_ignoredEventID_addresses___block_invoke;
    block[3] = &unk_1E5B96C48;
    id v21 = &v22;
    void block[4] = self;
    id v18 = v8;
    id v19 = v9;
    id v20 = v10;
    dispatch_sync(processingQueue, block);
  }
  id v15 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v15;
}

void __78__EKAvailabilityCache_cachedAvailabilityInDateRange_ignoredEventID_addresses___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) startDate];
  id v3 = [*(id *)(a1 + 40) endDate];
  uint64_t v4 = [v2 _cachedSpanResultsBetweenStartDate:v7 endDate:v3 ignoredEventID:*(void *)(a1 + 48) addresses:*(void *)(a1 + 56)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (void)cachedAvailabilityInDateRange:(id)a3 ignoredEventID:(id)a4 addresses:(id)a5 results:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [v10 startDate];
  id v15 = [v10 endDate];
  BOOL v16 = [(EKAvailabilityCache *)self _validateRequestStartDate:v14 endDate:v15 addresses:v12 error:0];

  if (v16)
  {
    processingQueue = self->_processingQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __86__EKAvailabilityCache_cachedAvailabilityInDateRange_ignoredEventID_addresses_results___block_invoke;
    block[3] = &unk_1E5B96C70;
    void block[4] = self;
    id v19 = v10;
    id v20 = v11;
    id v21 = v12;
    id v22 = v13;
    dispatch_async(processingQueue, block);
  }
  else
  {
    (*((void (**)(id, void))v13 + 2))(v13, 0);
  }
}

void __86__EKAvailabilityCache_cachedAvailabilityInDateRange_ignoredEventID_addresses_results___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) startDate];
  uint64_t v4 = [*(id *)(a1 + 40) endDate];
  id v5 = [v2 _cachedSpanResultsBetweenStartDate:v3 endDate:v4 ignoredEventID:*(void *)(a1 + 48) addresses:*(void *)(a1 + 56)];

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

- (void)cancelAvailabilityRequestWithID:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG)) {
      -[EKAvailabilityCache cancelAvailabilityRequestWithID:]();
    }
    uint64_t v4 = [MEMORY[0x1E4F5E950] sharedConnection];
    [v4 cancelCalendarAvailabilityRequestWithID:v3];
  }
}

- (void)_handleResults:(id)a3 resultsBlock:(id)a4 ignoredEventID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && [v8 count])
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __66__EKAvailabilityCache__handleResults_resultsBlock_ignoredEventID___block_invoke;
    v20[3] = &unk_1E5B96C98;
    v20[4] = self;
    id v12 = v11;
    id v21 = v12;
    [v8 enumerateKeysAndObjectsUsingBlock:v20];
    if (v9)
    {
      callbackQueue = self->_callbackQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __66__EKAvailabilityCache__handleResults_resultsBlock_ignoredEventID___block_invoke_2;
      block[3] = &unk_1E5B96B08;
      id v19 = v9;
      id v18 = v12;
      dispatch_async(callbackQueue, block);
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __66__EKAvailabilityCache__handleResults_resultsBlock_ignoredEventID___block_invoke_3;
    v14[3] = &unk_1E5B96C98;
    id v15 = v10;
    BOOL v16 = self;
    [v12 enumerateKeysAndObjectsUsingBlock:v14];
  }
}

void __66__EKAvailabilityCache__handleResults_resultsBlock_ignoredEventID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  uint64_t v6 = [(id)objc_opt_class() _generateEventKitSpansFromPersistenceSpans:v5];

  if (v6) {
    [*(id *)(a1 + 40) setObject:v6 forKey:v7];
  }
}

uint64_t __66__EKAvailabilityCache__handleResults_resultsBlock_ignoredEventID___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __66__EKAvailabilityCache__handleResults_resultsBlock_ignoredEventID___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 count])
  {
    id v7 = [*(id *)(a1 + 40) _dictionaryForIgnoredEventID:*(void *)(a1 + 32)];
    id v8 = [v7 objectForKey:v5];
    if (!v8)
    {
      id v8 = objc_alloc_init(EKAvailabilityCachedSpanRange);
      [v7 setObject:v8 forKey:v5];
    }
    [(EKAvailabilityCachedSpanRange *)v8 insertSpans:v6];
  }
  else if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_ERROR))
  {
    __66__EKAvailabilityCache__handleResults_resultsBlock_ignoredEventID___block_invoke_3_cold_1();
  }
}

- (id)_dictionaryForIgnoredEventID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_ignoredEventIDsToAddressBasedCaches objectForKey:v4];
    if (!v5)
    {
      id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [(NSMutableDictionary *)self->_ignoredEventIDsToAddressBasedCaches setObject:v5 forKey:v4];
    }
  }
  else
  {
    id v5 = self->_addressesToCachedSpanRanges;
  }

  return v5;
}

+ (BOOL)_isValidStartDate:(id)a3 endDate:(id)a4
{
  BOOL result = 0;
  if (a3)
  {
    if (a4) {
      return [a3 CalIsAfterDate:a4] ^ 1;
    }
  }
  return result;
}

+ (id)_generateEventKitSpansFromPersistenceSpans:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 count];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v5];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__EKAvailabilityCache__generateEventKitSpansFromPersistenceSpans___block_invoke;
  v9[3] = &unk_1E5B96CC0;
  id v11 = a1;
  id v7 = v6;
  id v10 = v7;
  [v4 enumerateObjectsUsingBlock:v9];

  return v7;
}

void __66__EKAvailabilityCache__generateEventKitSpansFromPersistenceSpans___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 type];
  id v7 = [v3 startDate];
  uint64_t v5 = [v3 endDate];

  id v6 = -[EKAvailabilitySpan initWithStartDate:endDate:type:]([EKAvailabilitySpan alloc], "initWithStartDate:endDate:type:", v7, v5, [(id)objc_opt_class() _convertType:v4]);
  [*(id *)(a1 + 32) addObject:v6];
}

+ (int64_t)_convertType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 6) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (void)_logRequestElapsedTime:(double)a3 forNumberOfAddresses:(unint64_t)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a4 >= 3)
  {
    if (a4 >= 6)
    {
      if (a4 >= 0xB)
      {
        if (a4 >= 0x10)
        {
          if (a4 >= 0x15)
          {
            if (a4 >= 0x1A)
            {
              if (a4 >= 0x33)
              {
                if (a4 >= 0x65)
                {
                  if (a4 >= 0x97)
                  {
                    uint64_t v5 = @"(201+)";
                    if (a4 < 0xC9) {
                      uint64_t v5 = @"(151-200)";
                    }
                  }
                  else
                  {
                    uint64_t v5 = @"(101-150)";
                  }
                }
                else
                {
                  uint64_t v5 = @"(51-100)";
                }
              }
              else
              {
                uint64_t v5 = @"(26-50)";
              }
            }
            else
            {
              uint64_t v5 = @"(21-25)";
            }
          }
          else
          {
            uint64_t v5 = @"(16-20)";
          }
        }
        else
        {
          uint64_t v5 = @"(11-15)";
        }
      }
      else
      {
        uint64_t v5 = @"(6-10)";
      }
    }
    else
    {
      uint64_t v5 = @"(3-5)";
    }
  }
  else
  {
    uint64_t v5 = off_1E5B96CE0[a4];
  }
  id v6 = [NSString stringWithFormat:@"AvailabilityCacheRoundtripTimeInMilliseconds-%@", v5];
  id v9 = @"elapsedTime";
  id v7 = [NSNumber numberWithDouble:a3];
  v10[0] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  CalAnalyticsSendEvent();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoredEventIDsToAddressBasedCaches, 0);
  objc_storeStrong((id *)&self->_addressesToCachedSpanRanges, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);

  objc_storeStrong((id *)&self->_accountID, 0);
}

- (void)initWithSource:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1A4E47000, v0, OS_LOG_TYPE_DEBUG, "[%@] initialized.", v1, 0xCu);
}

- (void)initWithSource:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1A4E47000, v0, OS_LOG_TYPE_ERROR, "The given source's 'accountID' is nil.  The availability cache will not be able to give availability data.  Cache: [%@]", v1, 0xCu);
}

- (void)_cachedSpanResultsBetweenStartDate:(os_log_t)log endDate:ignoredEventID:addresses:.cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1A4E47000, log, OS_LOG_TYPE_DEBUG, "Cache hit.   freshly cached spans found.", buf, 2u);
}

- (void)_validateRequestStartDate:(uint64_t)a1 endDate:(NSObject *)a2 addresses:error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 16);
  int v3 = 138412546;
  uint64_t v4 = v2;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_debug_impl(&dword_1A4E47000, a2, OS_LOG_TYPE_DEBUG, "This availability cache's source does not support availability requests. Will not execute the availability request.  Source account ID: [%@]. Cache: [%@].", (uint8_t *)&v3, 0x16u);
}

- (void)_validateRequestStartDate:(os_log_t)log endDate:addresses:error:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A4E47000, log, OS_LOG_TYPE_DEBUG, "No addresses given in the availability request.  Completing quickly.", v1, 2u);
}

- (void)_validateRequestStartDate:(os_log_t)log endDate:addresses:error:.cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A4E47000, log, OS_LOG_TYPE_ERROR, "Invalid start and end dates given.  Will not execute the availability request.", v1, 2u);
}

- (void)_validateRequestStartDate:endDate:addresses:error:.cold.4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1A4E47000, v0, OS_LOG_TYPE_ERROR, "This availability cache's source is invalid.  Will not execute the availability request.  Cache: [%@]", v1, 0xCu);
}

void __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_41_cold_1(uint64_t a1, uint64_t a2, void *a3)
{
  int v3 = *(void **)(a1 + 32);
  id v4 = a3;
  OUTLINED_FUNCTION_0_2((double)(unint64_t)[v3 elapsedTimeAsNumber:3], 1000000.0);
  OUTLINED_FUNCTION_2(&dword_1A4E47000, v5, v6, "Availability request with ID [%@] received a response with results: [%@]. Elapsed milliseconds: [%f]", v7, v8, v9, v10, 2u);
}

void __121__EKAvailabilityCache_requestAvailabilityBetweenStartDate_endDate_ignoredEventID_addresses_resultsBlock_completionBlock___block_invoke_2_44_cold_1(uint64_t a1, uint64_t a2, void *a3)
{
  int v3 = *(void **)(a1 + 32);
  id v4 = a3;
  OUTLINED_FUNCTION_0_2((double)(unint64_t)[v3 elapsedTimeAsNumber:3], 1000000.0);
  OUTLINED_FUNCTION_2(&dword_1A4E47000, v5, v6, "Availability request with ID [%@] completed with error: [%@].  Total elapsed milliseconds: [%f]", v7, v8, v9, v10, 2u);
}

- (void)cancelAvailabilityRequestWithID:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1A4E47000, v0, OS_LOG_TYPE_DEBUG, "Cancelling availability request with request ID: [%@]", v1, 0xCu);
}

void __66__EKAvailabilityCache__handleResults_resultsBlock_ignoredEventID___block_invoke_3_cold_1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1A4E47000, v1, OS_LOG_TYPE_ERROR, "No spans were returned for address [%@] and ignored event ID [%@]", v2, 0x16u);
}

@end