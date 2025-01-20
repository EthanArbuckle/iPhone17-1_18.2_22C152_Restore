@interface SGEnrichmentWritebackAdapter
+ (BOOL)_isEligibleEvent:(id)a3;
+ (BOOL)_isSupportedEntityTypes:(id)a3;
+ (id)_attributeSetForEvent:(id)a3;
+ (id)_bundleIdentifierFromEvent:(id)a3;
+ (id)_index;
- (id)_deleteEventsMatchingEvent:(id)a3 keepingNewerEvents:(BOOL)a4;
- (id)_deleteEventsMatchingGroupId:(id)a3 fallbackGroupId:(id)a4 olderThanDate:(id)a5;
- (id)_uniqueIdentifiersMatchingEvent:(id)a3 olderThanDate:(id)a4;
- (id)_uniqueIdentifiersMatchingGroupId:(id)a3 fallbackGroupId:(id)a4 olderThanDate:(id)a5;
- (void)addEvent:(id)a3;
- (void)addEvents:(id)a3;
- (void)cancelEvents:(id)a3;
- (void)orphanEvent:(id)a3;
@end

@implementation SGEnrichmentWritebackAdapter

- (void)cancelEvents:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1CB79B230](v5);
        -[SGEnrichmentWritebackAdapter cancelEvent:](self, "cancelEvent:", v9, (void)v11);
        ++v8;
      }
      while (v6 != v8);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v6 = v5;
    }
    while (v5);
  }
}

- (void)addEvents:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1CB79B230](v5);
        -[SGEnrichmentWritebackAdapter addEvent:](self, "addEvent:", v9, (void)v11);
        ++v8;
      }
      while (v6 != v8);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      uint64_t v6 = v5;
    }
    while (v5);
  }
}

- (void)orphanEvent:(id)a3
{
  id v4 = [(SGEnrichmentWritebackAdapter *)self _deleteEventsMatchingEvent:a3 keepingNewerEvents:0];
  [v4 setTimeout:60.0];
  id v3 = (id)[v4 wait];
}

- (void)addEvent:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!+[SGEnrichmentWritebackAdapter _isEligibleEvent:v5])
  {
    uint64_t v6 = sgLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138739971;
      id v60 = v5;
      _os_log_impl(&dword_1CA650000, v6, OS_LOG_TYPE_DEFAULT, "addEvent:%{sensitive}@ skipping due to being ineligible", buf, 0xCu);
    }
    goto LABEL_39;
  }
  uint64_t v6 = +[SGEnrichmentWritebackAdapter _bundleIdentifierFromEvent:v5];
  if ([v6 isEqualToString:*MEMORY[0x1E4F5DC28]])
  {
    uint64_t v7 = [v5 duplicateKey];
    uint64_t v8 = [v7 parentKey];
    uint64_t v9 = [v8 emailKey];
    uint64_t v10 = [v9 messageId];
    goto LABEL_8;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4F5DC38]])
  {
    uint64_t v7 = [v5 duplicateKey];
    uint64_t v8 = [v7 parentKey];
    uint64_t v9 = [v8 messageKey];
    uint64_t v10 = [v9 uniqueIdentifier];
LABEL_8:
    long long v11 = (void *)v10;

    if (v11)
    {
      long long v12 = [(SGEnrichmentWritebackAdapter *)self _deleteEventsMatchingEvent:v5 keepingNewerEvents:1];
      [v12 setTimeout:60.0];
      id v13 = (id)[v12 wait];
      long long v14 = [v12 result];
      char v15 = [v14 BOOLValue];

      if (v15)
      {
        uint64_t v16 = [(SGEnrichmentWritebackAdapter *)self _uniqueIdentifiersMatchingEvent:v5 olderThanDate:0];
        [v16 setTimeout:60.0];
        id v17 = (id)[v16 wait];
        v18 = [v16 error];

        if (v18)
        {
          v19 = sgLogHandle();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          {
            v43 = [v16 error];
            *(_DWORD *)buf = 138740227;
            id v60 = v5;
            __int16 v61 = 2112;
            v62 = v43;
            _os_log_fault_impl(&dword_1CA650000, v19, OS_LOG_TYPE_FAULT, "addEvent:%{sensitive}@ bailing because failed to query spotlight for newer events: %@", buf, 0x16u);
          }
          if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
            goto LABEL_22;
          }
          goto LABEL_37;
        }
        v22 = [v16 result];
        uint64_t v23 = [v22 count];

        if (v23)
        {
          v24 = sgLogHandle();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            v25 = [v16 result];
            *(_DWORD *)buf = 138740227;
            id v60 = v5;
            __int16 v61 = 2117;
            v62 = v25;
            _os_log_impl(&dword_1CA650000, v24, OS_LOG_TYPE_DEFAULT, "addEvent:%{sensitive}@ bailing because newer events were found in spotlight: %{sensitive}@", buf, 0x16u);
          }
          goto LABEL_36;
        }
        uint64_t v26 = +[SGEnrichmentWritebackAdapter _attributeSetForEvent:v5];
        if (!v26)
        {
          v24 = 0;
          goto LABEL_36;
        }
        v53 = v26;
        context = (void *)MEMORY[0x1CB79B230]();
        v27 = NSNumber;
        v50 = [v5 duplicateKey];
        v28 = [v50 parentKey];
        v29 = objc_msgSend(v27, "numberWithLongLong:", objc_msgSend(v28, "entityType"));
        BOOL v48 = +[SGEnrichmentWritebackAdapter _isSupportedEntityTypes:v29];

        if (!v48)
        {
          v44 = [MEMORY[0x1E4F28B00] currentHandler];
          v52 = [v5 duplicateKey];
          v45 = [v52 parentKey];
          objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SGEnrichmentWritebackAdapter.m", 257, @"unexpected entityType %lld (uniqueIdentifier logic only supports mail and message bundle ID)", objc_msgSend(v45, "entityType"));
        }
        if ([v6 rangeOfString:@"-" options:2] == 0x7FFFFFFFFFFFFFFFLL)
        {
          id v30 = [NSString alloc];
          v31 = [v53 eventGroupIdentifier];
          v51 = (void *)[v30 initWithFormat:@"%@-%@-default-%@-%@", @"CoreSuggestions", @"v3", v31, v6];

          contexta = (void *)MEMORY[0x1CB79B230]();
          v32 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"%."];
          v33 = [v32 invertedSet];

          v58[0] = @"CoreSuggestions";
          v58[1] = @"v3";
          v58[2] = @"default";
          v34 = [v11 stringByAddingPercentEncodingWithAllowedCharacters:v33];
          v58[3] = v34;
          v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:4];
          v49 = objc_msgSend(v35, "_pas_componentsJoinedByString:", @".");

          v24 = v53;
          v36 = (void *)[objc_alloc(MEMORY[0x1E4F23840]) initWithUniqueIdentifier:v51 domainIdentifier:v49 attributeSet:v53];
          dispatch_semaphore_t v37 = dispatch_semaphore_create(0);
          v38 = +[SGEnrichmentWritebackAdapter _index];
          v57 = v36;
          v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
          v54[0] = MEMORY[0x1E4F143A8];
          v54[1] = 3221225472;
          v54[2] = __41__SGEnrichmentWritebackAdapter_addEvent___block_invoke;
          v54[3] = &unk_1E65BA6C8;
          id v55 = v5;
          dispatch_semaphore_t v56 = v37;
          v40 = v37;
          [v38 indexSearchableItems:v39 completionHandler:v54];

          dispatch_semaphore_wait(v40, 0xFFFFFFFFFFFFFFFFLL);
LABEL_36:

LABEL_37:
LABEL_38:

          goto LABEL_39;
        }
        v42 = sgLogHandle();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138740227;
          id v60 = v5;
          __int16 v61 = 2114;
          v62 = v6;
          _os_log_fault_impl(&dword_1CA650000, v42, OS_LOG_TYPE_FAULT, "addEvent:%{sensitive}@ bailing because bundleIdentifierForUniqueIdentifier contains '-': %{public}@", buf, 0x16u);
        }

        v24 = v53;
        if (!_PASEvaluateLogFaultAndProbCrashCriteria())
        {
          goto LABEL_36;
        }
      }
      else
      {
        v21 = sgLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        {
          v41 = [v12 error];
          *(_DWORD *)buf = 138740227;
          id v60 = v5;
          __int16 v61 = 2112;
          v62 = v41;
          _os_log_fault_impl(&dword_1CA650000, v21, OS_LOG_TYPE_FAULT, "addEvent:%{sensitive}@ bailing because deletion timed out or failed: %@", buf, 0x16u);
        }
        if (!_PASEvaluateLogFaultAndProbCrashCriteria()) {
          goto LABEL_38;
        }
      }
LABEL_22:
      abort();
    }
  }
  v20 = sgLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138739971;
    id v60 = v5;
    _os_log_fault_impl(&dword_1CA650000, v20, OS_LOG_TYPE_FAULT, "addEvent:%{sensitive}@ bailing due to nil messageId", buf, 0xCu);
  }

  if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
    goto LABEL_22;
  }
LABEL_39:
}

void __41__SGEnrichmentWritebackAdapter_addEvent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = sgLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138740227;
      uint64_t v7 = v5;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_fault_impl(&dword_1CA650000, v4, OS_LOG_TYPE_FAULT, "addEvent:%{sensitive}@ indexing failed with error %@", (uint8_t *)&v6, 0x16u);
    }

    if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
      abort();
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)_deleteEventsMatchingEvent:(id)a3 keepingNewerEvents:(BOOL)a4
{
  id v6 = a3;
  if ([v6 heuristicUpdatingEnabled])
  {
    uint64_t v7 = [v6 duplicateKey];
    __int16 v8 = [v7 pseudoEventKey];
    id v9 = [v8 groupId];
    uint64_t v10 = [v6 extraKeyTag];
    long long v11 = [v10 value];
    if (a4)
    {
      [v6 creationTimestamp];
      id v13 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:v12];
      long long v14 = [(SGEnrichmentWritebackAdapter *)self _deleteEventsMatchingGroupId:v9 fallbackGroupId:v11 olderThanDate:v13];
    }
    else
    {
      long long v14 = [(SGEnrichmentWritebackAdapter *)self _deleteEventsMatchingGroupId:v9 fallbackGroupId:v11 olderThanDate:0];
    }
  }
  else
  {
    long long v14 = [MEMORY[0x1E4F5DA30] createWithImmediateResult:MEMORY[0x1E4F1CC38]];
  }

  return v14;
}

- (id)_deleteEventsMatchingGroupId:(id)a3 fallbackGroupId:(id)a4 olderThanDate:(id)a5
{
  unint64_t v8 = (unint64_t)a3;
  unint64_t v9 = (unint64_t)a4;
  id v10 = a5;
  if (v8 | v9)
  {
    double v12 = objc_opt_new();
    id v13 = [v12 workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91__SGEnrichmentWritebackAdapter__deleteEventsMatchingGroupId_fallbackGroupId_olderThanDate___block_invoke;
    block[3] = &unk_1E65BF020;
    block[4] = self;
    id v18 = (id)v8;
    id v19 = (id)v9;
    id v20 = v10;
    id v14 = v12;
    id v21 = v14;
    dispatch_async(v13, block);

    char v15 = v21;
    id v11 = v14;
  }
  else
  {
    id v11 = [MEMORY[0x1E4F5DA30] createWithImmediateResult:MEMORY[0x1E4F1CC38]];
  }

  return v11;
}

void __91__SGEnrichmentWritebackAdapter__deleteEventsMatchingGroupId_fallbackGroupId_olderThanDate___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) _uniqueIdentifiersMatchingGroupId:*(void *)(a1 + 40) fallbackGroupId:*(void *)(a1 + 48) olderThanDate:*(void *)(a1 + 56)];
  id v3 = (id)[v2 wait];
  if (([*(id *)(a1 + 64) isComplete] & 1) == 0)
  {
    id v4 = [v2 result];

    if (v4)
    {
      uint64_t v5 = +[SGEnrichmentWritebackAdapter _index];
      id v6 = [v2 result];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __91__SGEnrichmentWritebackAdapter__deleteEventsMatchingGroupId_fallbackGroupId_olderThanDate___block_invoke_2;
      v14[3] = &unk_1E65C0100;
      uint64_t v7 = &v15;
      id v15 = *(id *)(a1 + 64);
      [v5 deleteSearchableItemsWithIdentifiers:v6 completionHandler:v14];
    }
    else
    {
      unint64_t v8 = sgLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        uint64_t v9 = *(void *)(a1 + 40);
        uint64_t v10 = *(void *)(a1 + 48);
        id v11 = [v2 error];
        *(_DWORD *)buf = 138740483;
        uint64_t v17 = v9;
        __int16 v18 = 2117;
        uint64_t v19 = v10;
        __int16 v20 = 2112;
        id v21 = v11;
        _os_log_fault_impl(&dword_1CA650000, v8, OS_LOG_TYPE_FAULT, "deleteEventsMatchingGroupId:%{sensitive}@ fallbackGroupId:%{sensitive}@ deleting all because we couldn't find existing stuff in Spotlight (%@)", buf, 0x20u);
      }
      if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
        abort();
      }
      uint64_t v5 = +[SGEnrichmentWritebackAdapter _index];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __91__SGEnrichmentWritebackAdapter__deleteEventsMatchingGroupId_fallbackGroupId_olderThanDate___block_invoke_33;
      v12[3] = &unk_1E65C0100;
      uint64_t v7 = &v13;
      id v13 = *(id *)(a1 + 64);
      [v5 deleteSearchableItemsWithDomainIdentifiers:&unk_1F25368F0 completionHandler:v12];
    }
  }
}

uint64_t __91__SGEnrichmentWritebackAdapter__deleteEventsMatchingGroupId_fallbackGroupId_olderThanDate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = MEMORY[0x1E4F1CC38];
  }
  return [v2 completeWithResult:v3 error:a2];
}

uint64_t __91__SGEnrichmentWritebackAdapter__deleteEventsMatchingGroupId_fallbackGroupId_olderThanDate___block_invoke_33(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = MEMORY[0x1E4F1CC38];
  }
  return [v2 completeWithResult:v3 error:a2];
}

- (id)_uniqueIdentifiersMatchingEvent:(id)a3 olderThanDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 heuristicUpdatingEnabled])
  {
    unint64_t v8 = [v6 duplicateKey];
    uint64_t v9 = [v8 pseudoEventKey];
    uint64_t v10 = [v9 groupId];
    id v11 = [v6 extraKeyTag];
    double v12 = [v11 value];
    id v13 = [(SGEnrichmentWritebackAdapter *)self _uniqueIdentifiersMatchingGroupId:v10 fallbackGroupId:v12 olderThanDate:v7];
  }
  else
  {
    id v13 = [MEMORY[0x1E4F5DA30] createWithImmediateResult:MEMORY[0x1E4F1CBF0]];
  }

  return v13;
}

- (id)_uniqueIdentifiersMatchingGroupId:(id)a3 fallbackGroupId:(id)a4 olderThanDate:(id)a5
{
  v46[1] = *MEMORY[0x1E4F143B8];
  unint64_t v7 = (unint64_t)a3;
  unint64_t v8 = (unint64_t)a4;
  id v9 = a5;
  if (v7 | v8)
  {
    v34 = objc_opt_new();
    id v11 = objc_opt_new();
    [v11 setLowPriority:qos_class_self() < QOS_CLASS_USER_INITIATED];
    v46[0] = *MEMORY[0x1E4F23670];
    double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
    [v11 setFetchAttributes:v12];

    [v11 setReason:@"reason:SGEnrichmentWritebackAdapter-1; code:8"];
    id v13 = objc_opt_new();
    if (v7)
    {
      id v14 = (void *)MEMORY[0x1CB79B230]();
      id v15 = spotlightEscaped((void *)v7);
      uint64_t v16 = [@"kMDItemEventGroupIdentifier == " stringByAppendingString:v15];
      [v13 addObject:v16];
    }
    if (v8)
    {
      uint64_t v17 = (void *)MEMORY[0x1CB79B230]();
      __int16 v18 = spotlightEscaped((void *)v8);
      uint64_t v19 = [@"kMDItemEventGroupIdentifier == " stringByAppendingString:v18];
      [v13 addObject:v19];
    }
    __int16 v20 = objc_msgSend(v13, "_pas_componentsJoinedByString:", @" || ");

    if (v9)
    {
      id v21 = [NSString alloc];
      [v9 timeIntervalSinceReferenceDate];
      uint64_t v23 = [v21 initWithFormat:@"(%@) && kMDItemContentCreationDate < %f", v20, v22, v34];

      __int16 v20 = (void *)v23;
    }
    v24 = (void *)[objc_alloc(MEMORY[0x1E4F23828]) initWithQueryString:v20 context:v11];
    [v24 setPrivateIndex:0];
    v45 = @"com.apple.spotlight.events";
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
    [v24 setBundleIDs:v25];

    if ([MEMORY[0x1E4F93B10] isDeviceFormattedForProtection])
    {
      uint64_t v44 = *MEMORY[0x1E4F28358];
      uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
      [v24 setProtectionClasses:v26];
    }
    v27 = objc_opt_new();
    v28 = (void *)[objc_alloc(MEMORY[0x1E4F93B20]) initWithDomain:@"CoreSuggestions"];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __96__SGEnrichmentWritebackAdapter__uniqueIdentifiersMatchingGroupId_fallbackGroupId_olderThanDate___block_invoke;
    v41[3] = &unk_1E65BB658;
    id v29 = v27;
    id v42 = v29;
    id v30 = v28;
    id v43 = v30;
    [v24 setFoundItemsHandler:v41];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __96__SGEnrichmentWritebackAdapter__uniqueIdentifiersMatchingGroupId_fallbackGroupId_olderThanDate___block_invoke_3;
    v38[3] = &unk_1E65BA6C8;
    id v31 = v34;
    id v39 = v31;
    id v32 = v29;
    id v40 = v32;
    [v24 setCompletionHandler:v38];
    id location = 0;
    objc_initWeak(&location, v24);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __96__SGEnrichmentWritebackAdapter__uniqueIdentifiersMatchingGroupId_fallbackGroupId_olderThanDate___block_invoke_4;
    v35[3] = &unk_1E65BA6F0;
    objc_copyWeak(&v36, &location);
    [v31 wait:v35];
    [v24 start];
    id v10 = v31;
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }
  else
  {
    id v10 = [MEMORY[0x1E4F5DA30] createWithImmediateResult:MEMORY[0x1E4F1CBF0]];
  }

  return v10;
}

void __96__SGEnrichmentWritebackAdapter__uniqueIdentifiersMatchingGroupId_fallbackGroupId_olderThanDate___block_invoke(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __96__SGEnrichmentWritebackAdapter__uniqueIdentifiersMatchingGroupId_fallbackGroupId_olderThanDate___block_invoke_2;
  v5[3] = &unk_1E65B8258;
  uint64_t v3 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v4 = objc_msgSend(a2, "_pas_mappedArrayWithTransform:", v5);
  [v3 addObjectsFromArray:v4];
}

uint64_t __96__SGEnrichmentWritebackAdapter__uniqueIdentifiersMatchingGroupId_fallbackGroupId_olderThanDate___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (a2) {
    return [v3 fail:a2];
  }
  else {
    return [v3 succeed:*(void *)(a1 + 40)];
  }
}

void __96__SGEnrichmentWritebackAdapter__uniqueIdentifiersMatchingGroupId_fallbackGroupId_olderThanDate___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained cancel];
  }
}

id __96__SGEnrichmentWritebackAdapter__uniqueIdentifiersMatchingGroupId_fallbackGroupId_olderThanDate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 domainIdentifier];
  LODWORD(v4) = [v4 containsDomain:v5];

  if (v4)
  {
    id v6 = [v3 uniqueIdentifier];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)_attributeSetForEvent:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 attributeSetForEvent];
  if (!v4) {
    goto LABEL_20;
  }
  uint64_t v5 = +[SGEnrichmentWritebackAdapter _bundleIdentifierFromEvent:v3];
  if ([v5 isEqualToString:*MEMORY[0x1E4F5DC28]])
  {
    [v4 setEventSourceBundleIdentifier:@"com.apple.mobilemail"];
    id v6 = [v3 duplicateKey];
    unint64_t v7 = [v6 parentKey];
    unint64_t v8 = [v7 emailKey];
    uint64_t v9 = [v8 messageId];
LABEL_6:
    id v10 = (void *)v9;
    [v4 setEventMessageIdentifier:v9];

    goto LABEL_7;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F5DC38]])
  {
    [v4 setEventSourceBundleIdentifier:@"com.apple.MobileSMS"];
    id v6 = [v3 duplicateKey];
    unint64_t v7 = [v6 parentKey];
    unint64_t v8 = [v7 messageKey];
    uint64_t v9 = [v8 uniqueIdentifier];
    goto LABEL_6;
  }
LABEL_7:
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v11 = objc_msgSend(v3, "tags", 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v33;
LABEL_9:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v33 != v14) {
        objc_enumerationMutation(v11);
      }
      uint64_t v16 = *(void **)(*((void *)&v32 + 1) + 8 * v15);
      if ([v16 isAppleMailMessageId]) {
        break;
      }
      if (v13 == ++v15)
      {
        uint64_t v13 = [v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v13) {
          goto LABEL_9;
        }
        goto LABEL_18;
      }
    }
    id v17 = v16;

    if (!v17) {
      goto LABEL_19;
    }
    __int16 v18 = [v17 value];
    uint64_t v19 = SGDelimitedStringsDeserialize();

    __int16 v20 = [v19 firstObject];
    [v4 setAccountIdentifier:v20];

    id v21 = [v19 lastObject];
    [v4 setMailMessageID:v21];

    id v11 = v17;
  }
LABEL_18:

LABEL_19:
  uint64_t v22 = [v3 tags];
  uint64_t v23 = objc_msgSend(v22, "_pas_mappedSetWithTransform:", &__block_literal_global_73);
  v24 = [v23 allObjects];
  [v4 setMailboxIdentifiers:v24];

  v25 = [v3 duplicateKey];
  uint64_t v26 = [v25 pseudoEventKey];
  v27 = [v26 groupId];
  [v4 setEventGroupIdentifier:v27];

  v28 = [v3 extraKeyTag];
  id v29 = [v28 value];
  [v4 setEventFallbackGroupIdentifier:v29];

  id v30 = v4;
LABEL_20:

  return v4;
}

id __54__SGEnrichmentWritebackAdapter__attributeSetForEvent___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isMailboxIdentifier])
  {
    id v3 = [v2 value];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

+ (BOOL)_isEligibleEvent:(id)a3
{
  id v24 = a3;
  v25 = (void *)MEMORY[0x1CB79B230]();
  id v22 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v21 = [MEMORY[0x1E4F5D9F0] extractedFlight];
  __int16 v20 = [MEMORY[0x1E4F5D9F0] extractedHotel];
  id v3 = [MEMORY[0x1E4F5D9F0] extractedFood];
  id v4 = [MEMORY[0x1E4F5D9F0] extractedCarRental];
  uint64_t v5 = [MEMORY[0x1E4F5D9F0] extractedTicket];
  id v6 = [MEMORY[0x1E4F5D9F0] extractedMovie];
  unint64_t v7 = [MEMORY[0x1E4F5D9F0] extractedAppointment];
  unint64_t v8 = [MEMORY[0x1E4F5D9F0] extractedSocial];
  uint64_t v9 = [MEMORY[0x1E4F5D9F0] extractedBus];
  id v10 = [MEMORY[0x1E4F5D9F0] extractedBoat];
  id v11 = [MEMORY[0x1E4F5D9F0] extractedTrain];
  uint64_t v23 = objc_msgSend(v22, "initWithObjects:", v21, v20, v3, v4, v5, v6, v7, v8, v9, v10, v11, 0);

  uint64_t v12 = NSNumber;
  uint64_t v13 = [v24 duplicateKey];
  uint64_t v14 = [v13 parentKey];
  uint64_t v15 = objc_msgSend(v12, "numberWithLongLong:", objc_msgSend(v14, "entityType"));
  if ([a1 _isSupportedEntityTypes:v15])
  {
    uint64_t v16 = [v24 tags];
    id v17 = (void *)v23;
    char v18 = [v16 intersectsSet:v23];
  }
  else
  {
    char v18 = 0;
    id v17 = (void *)v23;
  }

  return v18;
}

+ (BOOL)_isSupportedEntityTypes:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1F2535988, &unk_1F25359A0, 0);
  LOBYTE(v4) = [v5 containsObject:v3];

  return (char)v4;
}

+ (id)_bundleIdentifierFromEvent:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1C9E8];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = objc_msgSend(v5, "initWithObjectsAndKeys:", *MEMORY[0x1E4F5DC28], &unk_1F2535988, *MEMORY[0x1E4F5DC38], &unk_1F25359A0, 0);
  unint64_t v7 = NSNumber;
  unint64_t v8 = [v4 duplicateKey];

  uint64_t v9 = [v8 parentKey];
  id v10 = objc_msgSend(v7, "numberWithLongLong:", objc_msgSend(v9, "entityType"));
  id v11 = [v6 objectForKey:v10];

  return v11;
}

+ (id)_index
{
  if (_index__pasOnceToken5 != -1) {
    dispatch_once(&_index__pasOnceToken5, &__block_literal_global_14584);
  }
  id v2 = (void *)_index__pasExprOnceResult;
  return v2;
}

void __38__SGEnrichmentWritebackAdapter__index__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79B230]();
  id v1 = objc_alloc(MEMORY[0x1E4F23838]);
  uint64_t v2 = [v1 initWithName:@"com.apple.spotlight.events" protectionClass:*MEMORY[0x1E4F28358] bundleIdentifier:@"com.apple.spotlight.events"];
  id v3 = (void *)_index__pasExprOnceResult;
  _index__pasExprOnceResult = v2;
}

@end