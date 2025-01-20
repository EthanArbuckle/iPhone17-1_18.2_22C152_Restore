@interface CADConferenceUtils
+ (BOOL)_performConferenceURLRenewalWithDatabase:(CalDatabase *)a3;
+ (id)_conferenceURLsToRenewWithDatabase:(CalDatabase *)a3 URLString:(id)a4;
+ (id)_extractURLStringsFromCalEvent:(void *)a3;
+ (void)performConferenceLinkRenewalIfNeeded;
+ (void)removeNextConferenceLinkRenewalDate;
+ (void)setNextConferenceLinkRenewalDate:(id)a3;
@end

@implementation CADConferenceUtils

+ (void)performConferenceLinkRenewalIfNeeded
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v3 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBC88000, v3, OS_LOG_TYPE_INFO, "ConferenceRenewal: Starting. Checking whether it is time to run conference link renewal.", buf, 2u);
  }
  uint64_t v4 = CalDatabaseCreateWithOptions();
  if (v4)
  {
    v5 = (const void *)v4;
    v6 = (void *)CalDatabaseCopyProperty();
    v7 = v6;
    if (v6
      && ([v6 doubleValue], v8 > 1.0)
      && (objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:"),
          (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v10 = (void *)v9;
      v11 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v10;
        _os_log_impl(&dword_1BBC88000, v11, OS_LOG_TYPE_INFO, "ConferenceRenewal: Found next scheduled run date: %@", buf, 0xCu);
      }
      v12 = [MEMORY[0x1E4F1C9C8] date];
      [v12 timeIntervalSinceReferenceDate];
      double v14 = v13;
      [v10 timeIntervalSinceReferenceDate];
      if (v14 <= v15)
      {
        v28 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:31622400.0];
        [v10 timeIntervalSinceReferenceDate];
        double v30 = v29;
        [v28 timeIntervalSinceReferenceDate];
        double v32 = v31;

        if (v30 <= v32)
        {
LABEL_20:
          CFRelease(v5);
          v26 = CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BBC88000, v26, OS_LOG_TYPE_INFO, "ConferenceRenewal: Complete.", buf, 2u);
          }

          return;
        }
      }
      else
      {
        v16 = CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v34 = v12;
          __int16 v35 = 2112;
          v36 = v10;
          _os_log_impl(&dword_1BBC88000, v16, OS_LOG_TYPE_INFO, "ConferenceRenewal: Current date (%@) is after next scheduled run date (%@). Performing link renewal.", buf, 0x16u);
        }
        char v17 = [a1 _performConferenceURLRenewalWithDatabase:v5];

        if ((v17 & 1) == 0) {
          goto LABEL_20;
        }
      }
      unsigned int v18 = 7776000;
      double v20 = 20736000.0;
    }
    else
    {
      unsigned int v18 = 2592000;
      v19 = CADLogHandle;
      double v20 = 1296000.0;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBC88000, v19, OS_LOG_TYPE_DEBUG, "ConferenceRenewal: No date found for next scheduled run date. Will generate one within 45 days.", buf, 2u);
      }
      v10 = 0;
    }
    v21 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v20 + (double)(arc4random() % v18)];
    v22 = NSString;
    [v21 timeIntervalSinceReferenceDate];
    v24 = objc_msgSend(v22, "stringWithFormat:", @"%lf", v23);
    v25 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v21;
      _os_log_impl(&dword_1BBC88000, v25, OS_LOG_TYPE_INFO, "ConferenceRenewal: Setting next scheduled run date to %@", buf, 0xCu);
    }
    CalDatabaseSetProperty();
    CalDatabaseSave();

    goto LABEL_20;
  }
  v27 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBC88000, v27, OS_LOG_TYPE_ERROR, "ConferenceRenewal: Database is nil. Cannot check renewal dates. Aborting", buf, 2u);
  }
}

+ (void)setNextConferenceLinkRenewalDate:(id)a3
{
  id v3 = a3;
  uint64_t v4 = CalDatabaseCreateWithOptions();
  if (v4)
  {
    v5 = (const void *)v4;
    v6 = NSString;
    [v3 timeIntervalSinceReferenceDate];
    double v8 = objc_msgSend(v6, "stringWithFormat:", @"%lf", v7);
    CalDatabaseSetProperty();
    CalDatabaseSave();
    CFRelease(v5);
  }
  else
  {
    uint64_t v9 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBC88000, v9, OS_LOG_TYPE_ERROR, "setNextConferenceLinkRenewalDate: Database is nil. Cannot set renewal date. Aborting", buf, 2u);
    }
  }
}

+ (void)removeNextConferenceLinkRenewalDate
{
  uint64_t v2 = CalDatabaseCreateWithOptions();
  if (v2)
  {
    id v3 = (const void *)v2;
    CalDatabaseRemoveProperty();
    CalDatabaseSave();
    CFRelease(v3);
  }
  else
  {
    uint64_t v4 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1BBC88000, v4, OS_LOG_TYPE_ERROR, "setNextConferenceLinkRenewalDate: Database is nil. Cannot set renewal date. Aborting", v5, 2u);
    }
  }
}

+ (BOOL)_performConferenceURLRenewalWithDatabase:(CalDatabase *)a3
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  v5 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBC88000, v5, OS_LOG_TYPE_INFO, "ConferenceRenewal: Starting URL renewal.", buf, 2u);
  }
  mach_absolute_time();
  v6 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BBC88000, v6, OS_LOG_TYPE_INFO, "ConferenceRenewal: Retrieving all active conversation links.", buf, 2u);
  }
  id v55 = objc_alloc_init(MEMORY[0x1E4FADB78]);
  *(void *)buf = 0;
  v77 = buf;
  uint64_t v78 = 0x3032000000;
  v79 = __Block_byref_object_copy__10;
  v80 = __Block_byref_object_dispose__10;
  id v81 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = __63__CADConferenceUtils__performConferenceURLRenewalWithDatabase___block_invoke;
  v73[3] = &unk_1E624F4A0;
  v75 = buf;
  double v8 = v7;
  v74 = v8;
  [v55 getActiveLinksWithCreatedOnly:1 completionHandler:v73];
  dispatch_time_t v9 = dispatch_time(0, 60000000000);
  v52 = v8;
  dispatch_semaphore_wait(v8, v9);
  if (*((void *)v77 + 5))
  {
    v10 = (id)CADLogHandle;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = [*((id *)v77 + 5) count];
      LODWORD(v91) = 134217984;
      *(void *)((char *)&v91 + 4) = v11;
      _os_log_impl(&dword_1BBC88000, v10, OS_LOG_TYPE_INFO, "ConferenceRenewal: Found %lu links.", (uint8_t *)&v91, 0xCu);
    }

    v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(*((id *)v77 + 5), "count"));
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v13 = *((id *)v77 + 5);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v69 objects:v95 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v70;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v70 != v15) {
            objc_enumerationMutation(v13);
          }
          char v17 = *(void **)(*((void *)&v69 + 1) + 8 * i);
          unsigned int v18 = [v17 URL];
          v19 = [v18 absoluteString];
          [v12 setObject:v17 forKey:v19];
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v69 objects:v95 count:16];
      }
      while (v14);
    }

    double v20 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      LOWORD(v91) = 0;
      _os_log_impl(&dword_1BBC88000, v20, OS_LOG_TYPE_INFO, "ConferenceRenewal: Searching for events that contain conference URLs that require renewal.", (uint8_t *)&v91, 2u);
    }
    v21 = [MEMORY[0x1E4FADB70] baseURLs];
    v22 = [MEMORY[0x1E4F1CA80] set];
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    obuint64_t j = v21;
    uint64_t v23 = [obj countByEnumeratingWithState:&v65 objects:v94 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v66;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v66 != v24) {
            objc_enumerationMutation(obj);
          }
          v26 = [*(id *)(*((void *)&v65 + 1) + 8 * j) host];
          v27 = [a1 _conferenceURLsToRenewWithDatabase:a3 URLString:v26];
          [v22 addObjectsFromArray:v27];
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v65 objects:v94 count:16];
      }
      while (v23);
    }

    group = dispatch_group_create();
    *(void *)&long long v91 = 0;
    *((void *)&v91 + 1) = &v91;
    uint64_t v92 = 0x2020000000;
    uint64_t v93 = 0;
    v53 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:31622400.0];
    v28 = (id)CADLogHandle;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      uint64_t v29 = [v22 count];
      *(_DWORD *)v89 = 134218242;
      *(void *)&v89[4] = v29;
      *(_WORD *)&v89[12] = 2112;
      *(void *)&v89[14] = v53;
      _os_log_impl(&dword_1BBC88000, v28, OS_LOG_TYPE_INFO, "ConferenceRenewal: Found a total of %lu conference URLs from events to renew. Setting new expiration date to %@", v89, 0x16u);
    }

    *(void *)v89 = 0;
    *(void *)&v89[8] = v89;
    *(void *)&v89[16] = 0x2020000000;
    uint64_t v90 = 0;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v30 = v22;
    unint64_t v31 = 0;
    uint64_t v32 = [v30 countByEnumeratingWithState:&v61 objects:v88 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v62;
      do
      {
        for (uint64_t k = 0; k != v32; ++k)
        {
          if (*(void *)v62 != v33) {
            objc_enumerationMutation(v30);
          }
          double v35 = *(double *)(*((void *)&v61 + 1) + 8 * k);
          v36 = [v12 objectForKey:*(void *)&v35];
          uint64_t v37 = v36;
          if (!v36)
          {
            uint64_t v39 = CADLogHandle;
            if (!os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_42;
            }
            *(_DWORD *)v82 = 138412290;
            double v83 = v35;
            v40 = v39;
            v41 = "ConferenceRenewal: Skipping URL because it isn't owned by this account: %@";
            goto LABEL_41;
          }
          if ([v36 isLocallyCreated])
          {
            v38 = CADLogHandle;
            if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v82 = 138412290;
              double v83 = v35;
              _os_log_impl(&dword_1BBC88000, v38, OS_LOG_TYPE_DEBUG, "ConferenceRenewal: Attempting to renew URL: %@", v82, 0xCu);
            }
            dispatch_group_enter(group);
            v57[0] = MEMORY[0x1E4F143A8];
            v57[1] = 3221225472;
            v57[2] = __63__CADConferenceUtils__performConferenceURLRenewalWithDatabase___block_invoke_16;
            v57[3] = &unk_1E624F4C8;
            *(double *)&v57[4] = v35;
            v59 = v89;
            v60 = &v91;
            v58 = group;
            [v55 renewLink:v37 expirationDate:v53 reason:1 completionHandler:v57];

            ++v31;
          }
          else if (([v37 isLocallyCreated] & 1) == 0)
          {
            uint64_t v42 = CADLogHandle;
            if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v82 = 138412290;
              double v83 = v35;
              v40 = v42;
              v41 = "ConferenceRenewal: Skipping URL because it wasn't locally created: %@";
LABEL_41:
              _os_log_impl(&dword_1BBC88000, v40, OS_LOG_TYPE_DEBUG, v41, v82, 0xCu);
            }
          }
LABEL_42:
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v61 objects:v88 count:16];
      }
      while (v32);
    }

    dispatch_time_t v43 = dispatch_time(0, (uint64_t)(((double)(unint64_t)[v30 count] * 2.0 + 30.0) * 1000000000.0));
    dispatch_group_wait(group, v43);
    mach_absolute_time();
    CalAnalyticsTimeIntervalFromMachTimes();
    double v45 = v44;
    v46 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      float v47 = v45;
      uint64_t v48 = *(void *)(*((void *)&v91 + 1) + 24);
      *(_DWORD *)v82 = 134218496;
      double v83 = v47;
      __int16 v84 = 2048;
      uint64_t v85 = v48;
      __int16 v86 = 2048;
      unint64_t v87 = v31;
      _os_log_impl(&dword_1BBC88000, v46, OS_LOG_TYPE_INFO, "ConferenceRenewal: Finished URL renewal in %f seconds. Renewed %lu / %lu links.", v82, 0x20u);
    }
    if (v31 < 3 || *(void *)(*((void *)&v91 + 1) + 24) || *(void *)(*(void *)&v89[8] + 24) != v31)
    {
      BOOL v50 = 1;
    }
    else
    {
      v49 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v82 = 0;
        _os_log_impl(&dword_1BBC88000, v49, OS_LOG_TYPE_ERROR, "ConferenceRenewal: all link renewals failed with seemingly transient errors. Will retry later.", v82, 2u);
      }
      BOOL v50 = 0;
    }
    _Block_object_dispose(v89, 8);

    _Block_object_dispose(&v91, 8);
  }
  else
  {
    BOOL v50 = 0;
  }

  _Block_object_dispose(buf, 8);
  return v50;
}

void __63__CADConferenceUtils__performConferenceURLRenewalWithDatabase___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    double v8 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl(&dword_1BBC88000, v8, OS_LOG_TYPE_ERROR, "ConferenceRenewal: Failed to retrieve links. error = %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __63__CADConferenceUtils__performConferenceURLRenewalWithDatabase___block_invoke_16(uint64_t a1, char a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    id v6 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v12 = 138412290;
      uint64_t v13 = v7;
      _os_log_impl(&dword_1BBC88000, v6, OS_LOG_TYPE_DEBUG, "ConferenceRenewal: Successfully renewed URL: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    double v8 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v12 = 138412546;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_1BBC88000, v8, OS_LOG_TYPE_ERROR, "ConferenceRenewal: Unable to renew URL: %@, error = %@", (uint8_t *)&v12, 0x16u);
    }
    id v10 = [v5 domain];
    if ([v10 isEqual:*MEMORY[0x1E4F281F8]])
    {
      if ([v5 code] == 4099)
      {
      }
      else
      {
        uint64_t v11 = [v5 code];

        if (v11 != 4097) {
          goto LABEL_12;
        }
      }
      ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      goto LABEL_12;
    }
  }
LABEL_12:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

+ (id)_conferenceURLsToRenewWithDatabase:(CalDatabase *)a3 URLString:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = CADLogHandle;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      CFIndex v58 = (CFIndex)v6;
      _os_log_impl(&dword_1BBC88000, v7, OS_LOG_TYPE_DEBUG, "ConferenceRenewal: Starting search for conference URLs with base host: %@", buf, 0xCu);
    }
    double v8 = (const void *)CalFilterCreateWithDatabaseShowingAll();
    uint64_t v9 = [MEMORY[0x1E4F1C9C8] date];
    [v9 timeIntervalSinceReferenceDate];
    double v11 = v10;

    uint64_t v12 = CalDatabaseCopyEventOccurrenceCache();
    uint64_t v13 = CADLogHandle;
    if (v12)
    {
      __int16 v14 = (const void *)v12;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        CFIndex v58 = (CFIndex)v6;
        _os_log_impl(&dword_1BBC88000, v13, OS_LOG_TYPE_DEBUG, "ConferenceRenewal: searching for events containing the base URL %@", buf, 0xCu);
      }
      CFArrayRef v15 = (const __CFArray *)CalDatabaseCopyEventIDsOfEventsMatching();
      if (v15)
      {
        CFArrayRef v16 = v15;
        v54 = v14;
        id v55 = v8;
        uint64_t Count = CFArrayGetCount(v15);
        unsigned int v18 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:Count];
        v19 = CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          CFIndex v58 = (CFIndex)v6;
          __int16 v59 = 2048;
          uint64_t v60 = Count;
          _os_log_impl(&dword_1BBC88000, v19, OS_LOG_TYPE_DEBUG, "ConferenceRenewal: Search for events containing URL %@ returned %lu results", buf, 0x16u);
        }
        id v52 = v6;
        double v20 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
        theArray = CFArrayCreateMutable(0, Count, MEMORY[0x1E4F1D510]);
        Mutable = CFArrayCreateMutable(0, Count, v20);
        if (Count < 1)
        {
          v22 = 0;
        }
        else
        {
          v22 = 0;
          for (CFIndex i = 0; i != Count; ++i)
          {
            *(_DWORD *)buf = CFArrayGetValueAtIndex(v16, i);
            uint64_t v24 = MEMORY[0x1C1865800](a3);
            if (v24)
            {
              v25 = (const void *)v24;
              if (CalCalendarItemHasRecurrenceRules())
              {
                CFNumberRef v26 = CFNumberCreate(0, kCFNumberIntType, buf);
                CFArrayAppendValue(theArray, v26);
                CFArrayAppendValue(Mutable, v25);
                CFRelease(v26);
              }
              else
              {
                CalEventGetEndDate();
                if (v27 > v11)
                {
                  v28 = [a1 _extractURLStringsFromCalEvent:v25];
                  if ([v28 count]) {
                    [v18 addObjectsFromArray:v28];
                  }
                  ++v22;
                }
              }
              CFRelease(v25);
            }
          }
        }
        id v30 = (void *)CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
        {
          unint64_t v31 = v30;
          CFIndex v32 = CFArrayGetCount(theArray);
          *(_DWORD *)buf = 134217984;
          CFIndex v58 = v32;
          _os_log_impl(&dword_1BBC88000, v31, OS_LOG_TYPE_DEBUG, "ConferenceRenewal: Of those, %lu have recurrences", buf, 0xCu);
        }
        uint64_t v33 = CADLogHandle;
        __int16 v14 = v54;
        double v8 = v55;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          CFIndex v58 = (CFIndex)v22;
          _os_log_impl(&dword_1BBC88000, v33, OS_LOG_TYPE_DEBUG, "ConferenceRenewal: Also found %lu events in the future", buf, 0xCu);
        }
        v34 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", v52);
        [v34 timeIntervalSinceReferenceDate];

        uint64_t HaveOccurrencesAfterDate = CalEventOccurrenceCacheDoEventsHaveOccurrencesAfterDate();
        if (HaveOccurrencesAfterDate)
        {
          CFArrayRef v36 = (const __CFArray *)HaveOccurrencesAfterDate;
          CFIndex v37 = CFArrayGetCount(Mutable);
          v38 = CFArrayCreateMutable(0, v37, MEMORY[0x1E4F1D510]);
          id v6 = v53;
          if (CFArrayGetCount(v36) >= 1)
          {
            CFIndex v39 = 0;
            do
            {
              CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v36, v39);
              *(_DWORD *)buf = 0;
              CFNumberGetValue(ValueAtIndex, kCFNumberIntType, buf);
              if (*(_DWORD *)buf)
              {
                v41 = CFArrayGetValueAtIndex(Mutable, v39);
                CFArrayAppendValue(v38, v41);
              }
              ++v39;
            }
            while (v39 < CFArrayGetCount(v36));
          }
          CFIndex v42 = CFArrayGetCount(v38);
          dispatch_time_t v43 = CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134217984;
            CFIndex v58 = v42;
            _os_log_impl(&dword_1BBC88000, v43, OS_LOG_TYPE_DEBUG, "ConferenceRenewal: And of those, %lu events with future occurrences.", buf, 0xCu);
          }
          if (CFArrayGetCount(v38) >= 1)
          {
            CFIndex v44 = 0;
            do
            {
              double v45 = objc_msgSend(a1, "_extractURLStringsFromCalEvent:", CFArrayGetValueAtIndex(v38, v44));
              if ([v45 count]) {
                [v18 addObjectsFromArray:v45];
              }

              ++v44;
            }
            while (v44 < CFArrayGetCount(v38));
          }
          CFRelease(v36);
          CFRelease(v38);
          __int16 v14 = v54;
          double v8 = v55;
        }
        else
        {
          v46 = CADLogHandle;
          id v6 = v53;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BBC88000, v46, OS_LOG_TYPE_INFO, "ConferenceRenewal: No events found with occurrences after date.", buf, 2u);
          }
        }
        CFRelease(v16);
        CFRelease(theArray);
        CFRelease(Mutable);
      }
      else
      {
        uint64_t v29 = CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          CFIndex v58 = (CFIndex)v6;
          _os_log_impl(&dword_1BBC88000, v29, OS_LOG_TYPE_INFO, "ConferenceRenewal: Search for events containing URL %@ returned nil", buf, 0xCu);
        }
        unsigned int v18 = 0;
      }
      CFRelease(v14);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBC88000, v13, OS_LOG_TYPE_ERROR, "ConferenceRenewal: Occurrence cache is nil. Will not perform link renewal.", buf, 2u);
      }
      unsigned int v18 = 0;
    }
    CFRelease(v8);
    uint64_t v47 = [v18 count];
    uint64_t v48 = CADLogHandle;
    if (v47)
    {
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
      {
        v49 = v48;
        uint64_t v50 = [v18 count];
        *(_DWORD *)buf = 134218242;
        CFIndex v58 = v50;
        __int16 v59 = 2112;
        uint64_t v60 = (uint64_t)v6;
        _os_log_impl(&dword_1BBC88000, v49, OS_LOG_TYPE_INFO, "ConferenceRenewal: Search completed. Found %lu URLs with host %@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFIndex v58 = (CFIndex)v6;
      _os_log_impl(&dword_1BBC88000, v48, OS_LOG_TYPE_ERROR, "ConferenceRenewal. Search completed. Unable to find URLs for with host %@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBC88000, v7, OS_LOG_TYPE_INFO, "ConferenceRenewal: conference URL search returning nil because no URLString was provided.", buf, 2u);
    }
    unsigned int v18 = 0;
  }

  return v18;
}

+ (id)_extractURLStringsFromCalEvent:(void *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CalCalendarItemCopyDescription();
  if (v3)
  {
    uint64_t v4 = (const void *)v3;
    id v5 = [MEMORY[0x1E4F57698] deserializeConference:v3];
    id v6 = [v5 conference];
    uint64_t v7 = [v6 joinMethods];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      CFIndex v32 = v4;
      uint64_t v9 = (void *)MEMORY[0x1E4F1CA48];
      double v10 = [v5 conference];
      double v11 = [v10 joinMethods];
      uint64_t v12 = objc_msgSend(v9, "arrayWithCapacity:", objc_msgSend(v11, "count"));

      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      unint64_t v31 = v5;
      uint64_t v13 = [v5 conference];
      __int16 v14 = [v13 joinMethods];

      uint64_t v15 = [v14 countByEnumeratingWithState:&v33 objects:v39 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v34 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            double v20 = (void *)MEMORY[0x1E4F576A0];
            v21 = [v19 URL];
            LODWORD(v20) = [v20 isTUConversationLink:v21];

            if (v20)
            {
              v22 = (void *)CADLogHandle;
              if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v23 = v22;
                uint64_t v24 = [v19 URL];
                v25 = [v24 absoluteString];
                *(_DWORD *)buf = 138412290;
                v38 = v25;
                _os_log_impl(&dword_1BBC88000, v23, OS_LOG_TYPE_DEBUG, "ConferenceRenewal: adding URL: %@", buf, 0xCu);
              }
              CFNumberRef v26 = [v19 URL];
              double v27 = [v26 absoluteString];
              [v12 addObject:v27];
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v33 objects:v39 count:16];
        }
        while (v16);
      }

      id v5 = v31;
      uint64_t v4 = v32;
    }
    else
    {
      uint64_t v29 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBC88000, v29, OS_LOG_TYPE_INFO, "ConferenceRenewal: Skipping a found event because was unable to deserialize conference data", buf, 2u);
      }
      uint64_t v12 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    v28 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBC88000, v28, OS_LOG_TYPE_DEBUG, "ConferenceRenewal: Skipping a found event because it has no notes", buf, 2u);
    }
    uint64_t v12 = 0;
  }
  return v12;
}

@end