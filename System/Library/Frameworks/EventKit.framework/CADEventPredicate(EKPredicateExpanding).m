@interface CADEventPredicate(EKPredicateExpanding)
+ (void)_addEventOccurrenceAndProposedTimeOccurrenceFor:()EKPredicateExpanding withOccurrenceStartDate:toResults:excludeProposed:excludeDeclinedUnlessProposed:excludeSkippedReminders:;
- (void)expandWithObjectsPendingCommit:()EKPredicateExpanding deletedObjectIDs:andResultArray:;
@end

@implementation CADEventPredicate(EKPredicateExpanding)

- (void)expandWithObjectsPendingCommit:()EKPredicateExpanding deletedObjectIDs:andResultArray:
{
  uint64_t v144 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v103 = a5;
  v105 = objc_opt_new();
  v95 = v8;
  if ([v8 count] || objc_msgSend(v7, "count"))
  {
    id v87 = v7;
    v9 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v7, "count") + objc_msgSend(v8, "count"));
    v10 = v9;
    *(void *)&long long v139 = 0;
    *((void *)&v139 + 1) = &v139;
    uint64_t v140 = 0x3032000000;
    v141 = __Block_byref_object_copy__14;
    v142 = __Block_byref_object_dispose__14;
    id v143 = 0;
    if (v8) {
      objc_msgSend(v9, "unionSet:");
    }
    v129[0] = MEMORY[0x1E4F143A8];
    v129[1] = 3221225472;
    v129[2] = __106__CADEventPredicate_EKPredicateExpanding__expandWithObjectsPendingCommit_deletedObjectIDs_andResultArray___block_invoke;
    v129[3] = &unk_1E5B982F8;
    v129[4] = &v139;
    v11 = (void (**)(void, void))MEMORY[0x1A6266730](v129);
    long long v127 = 0u;
    long long v128 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    obuint64_t j = v7;
    os_log_t log = (os_log_t)[obj countByEnumeratingWithState:&v125 objects:v138 count:16];
    if (log)
    {
      id v91 = *(id *)v126;
      do
      {
        for (os_log_t i = 0; i != log; os_log_t i = (os_log_t)((char *)i + 1))
        {
          if (*(id *)v126 != v91) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v125 + 1) + 8 * i);
          v101 = [v12 objectID];
          [v10 addObject:v101];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v99 = v12;
            int v13 = [v99 isIntegrationEvent];
            if (([v101 isTemporary] & v13) == 1) {
              ((void (**)(void, id))v11)[2](v11, v99);
            }
            long long v123 = 0u;
            long long v124 = 0u;
            long long v121 = 0u;
            long long v122 = 0u;
            v14 = [v99 detachedItems];
            uint64_t v15 = [v14 countByEnumeratingWithState:&v121 objects:v137 count:16];
            if (v15)
            {
              uint64_t v16 = *(void *)v122;
              do
              {
                for (uint64_t j = 0; j != v15; ++j)
                {
                  if (*(void *)v122 != v16) {
                    objc_enumerationMutation(v14);
                  }
                  v18 = *(void **)(*((void *)&v121 + 1) + 8 * j);
                  v19 = [v18 objectID];
                  if (v19)
                  {
                    [v10 addObject:v19];
                    [v105 addObject:v19];
                    if (v13 && [v19 isTemporary]) {
                      ((void (**)(void, void *))v11)[2](v11, v18);
                    }
                  }
                  else
                  {
                    v20 = logHandle();
                    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412546;
                      id v134 = v99;
                      __int16 v135 = 2114;
                      v136 = v101;
                      _os_log_error_impl(&dword_1A4E47000, v20, OS_LOG_TYPE_ERROR, "A detached item's objectID is nil for event %@ (%{public}@)", buf, 0x16u);
                    }
                  }
                }
                uint64_t v15 = [v14 countByEnumeratingWithState:&v121 objects:v137 count:16];
              }
              while (v15);
            }
          }
        }
        os_log_t log = (os_log_t)[obj countByEnumeratingWithState:&v125 objects:v138 count:16];
      }
      while (log);
    }

    v118[0] = MEMORY[0x1E4F143A8];
    v118[1] = 3221225472;
    v118[2] = __106__CADEventPredicate_EKPredicateExpanding__expandWithObjectsPendingCommit_deletedObjectIDs_andResultArray___block_invoke_5;
    v118[3] = &unk_1E5B98320;
    id v21 = v10;
    id v119 = v21;
    v120 = &v139;
    v22 = [v103 indexesOfObjectsPassingTest:v118];
    [v103 removeObjectsAtIndexes:v22];

    _Block_object_dispose(&v139, 8);
    id v7 = v87;
  }
  int v83 = [a1 excludeDeclined];
  unsigned int v102 = [a1 excludeProposed];
  unsigned int v100 = [a1 excludeDeclinedUnlessProposed];
  int v82 = [a1 excludeTimedEvents];
  int v84 = [a1 excludeAllDayEvents];
  unsigned int v98 = [a1 excludeSkippedReminders];
  long long v116 = 0u;
  long long v117 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  id v85 = v7;
  uint64_t v88 = [v85 countByEnumeratingWithState:&v114 objects:v132 count:16];
  if (v88)
  {
    uint64_t v86 = *(void *)v115;
    do
    {
      id obja = 0;
      do
      {
        if (*(void *)v115 != v86) {
          objc_enumerationMutation(v85);
        }
        v23 = *(void **)(*((void *)&v114 + 1) + 8 * (void)obja);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v24 = [v23 objectID];
          char v25 = [v95 containsObject:v24];

          if ((v25 & 1) == 0)
          {
            id v97 = v23;
            v26 = [v97 objectID];
            BOOL v27 = v26 == 0;

            if (v27)
            {
              loga = logHandle();
              if (os_log_type_enabled(loga, OS_LOG_TYPE_ERROR))
              {
                LODWORD(v139) = 138412290;
                *(void *)((char *)&v139 + 4) = v97;
                _os_log_error_impl(&dword_1A4E47000, loga, OS_LOG_TYPE_ERROR, "An object pending commit's objectID is nil for event %@", (uint8_t *)&v139, 0xCu);
              }
            }
            else
            {
              v28 = [EKEvent alloc];
              v29 = [v97 persistentObject];
              loga = [(EKEvent *)v28 initWithPersistentObject:v29];

              if ((([loga isAllDay] ^ 1 | v84) != 1
                 || (([loga isAllDay] | v82) & 1) == 0)
                && (!v83 || [loga participationStatus] != 3))
              {
                v30 = [a1 calendars];
                if (!v30) {
                  goto LABEL_97;
                }
                v31 = [a1 calendars];
                v32 = [v97 calendar];
                v33 = [v32 CADObjectID];
                int v34 = [v31 containsObject:v33];

                if (v34)
                {
LABEL_97:
                  v35 = [a1 eventUUID];
                  if (!v35) {
                    goto LABEL_98;
                  }
                  v36 = [v97 uniqueID];
                  v37 = [a1 eventUUID];
                  int v38 = [v36 isEqualToString:v37];

                  if (v38)
                  {
LABEL_98:
                    v39 = [loga objectID];
                    char v40 = [v105 containsObject:v39];

                    if ((v40 & 1) == 0)
                    {
                      v41 = [a1 startDate];
                      if (v41)
                      {
                        v42 = [a1 endDate];
                        BOOL v43 = v42 != 0;
                      }
                      else
                      {
                        BOOL v43 = 0;
                      }

                      v44 = (void *)MEMORY[0x1E4F576D0];
                      v45 = [loga startDate];
                      v46 = [loga endDateUnadjustedForLegacyClients];
                      v81 = [v44 rangeWithStartDate:v45 endDate:v46];

                      v47 = (void *)MEMORY[0x1E4F576D0];
                      v48 = [a1 startDate];
                      v49 = [a1 endDate];
                      v80 = [v47 rangeWithStartDate:v48 endDate:v49];

                      if (v43)
                      {
                        int v50 = [v81 intersectsRange:v80];
                        if (([loga hasRecurrenceRules] & v43) == 1)
                        {
                          v51 = objc_opt_new();
                          v52 = [a1 startDate];
                          v53 = [a1 endDate];
                          v54 = [loga effectiveTimeZone];
                          v55 = [loga exceptionDates];
                          LOBYTE(v79) = 1;
                          v56 = (void *)[v51 copyOccurrenceDatesWithEKEvent:loga startDate:v52 endDate:v53 timeZone:v54 exceptionDates:v55 limit:0 adjustDatesForAllDayEvents:v79];

                          goto LABEL_61;
                        }
                        if (!v50)
                        {
                          v56 = 0;
                          goto LABEL_62;
                        }
                      }
                      else
                      {
                        [loga hasRecurrenceRules];
                      }
                      v57 = (void *)MEMORY[0x1E4F1C978];
                      v51 = [loga startDate];
                      v56 = [v57 arrayWithObject:v51];
LABEL_61:

LABEL_62:
                      v58 = [MEMORY[0x1E4F1CA80] set];
                      if (v43)
                      {
                        long long v112 = 0u;
                        long long v113 = 0u;
                        long long v110 = 0u;
                        long long v111 = 0u;
                        id v92 = [loga detachedItems];
                        uint64_t v59 = [v92 countByEnumeratingWithState:&v110 objects:v131 count:16];
                        if (v59)
                        {
                          uint64_t v60 = *(void *)v111;
                          do
                          {
                            for (uint64_t k = 0; k != v59; ++k)
                            {
                              if (*(void *)v111 != v60) {
                                objc_enumerationMutation(v92);
                              }
                              v62 = *(void **)(*((void *)&v110 + 1) + 8 * k);
                              v63 = [v62 objectID];
                              char v64 = [v95 containsObject:v63];

                              if ((v64 & 1) == 0)
                              {
                                v65 = [v62 startDate];
                                v66 = [a1 startDate];
                                v67 = [a1 endDate];
                                int v68 = [v65 CalIsBetweenStartDate:v66 endDate:v67];

                                if (v68) {
                                  [(id)objc_opt_class() _addEventOccurrenceAndProposedTimeOccurrenceFor:v62 withOccurrenceStartDate:v65 toResults:v103 excludeProposed:v102 excludeDeclinedUnlessProposed:v100 excludeSkippedReminders:v98];
                                }
                                v69 = [v62 originalStartDate];
                                if (v69)
                                {
                                  if ([loga isFloating])
                                  {
                                    v70 = [loga effectiveTimeZone];
                                    uint64_t v71 = [v69 dateInTimeZone:v70 fromTimeZone:0];

                                    v69 = v71;
                                  }
                                  [v58 addObject:v69];
                                }
                                else
                                {
                                  v69 = logHandle();
                                  if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
                                    -[CADEventPredicate(EKPredicateExpanding) expandWithObjectsPendingCommit:deletedObjectIDs:andResultArray:](buf, &buf[1], v69);
                                  }
                                }
                              }
                            }
                            uint64_t v59 = [v92 countByEnumeratingWithState:&v110 objects:v131 count:16];
                          }
                          while (v59);
                        }
                      }
                      long long v108 = 0u;
                      long long v109 = 0u;
                      long long v106 = 0u;
                      long long v107 = 0u;
                      id v72 = v56;
                      uint64_t v73 = [v72 countByEnumeratingWithState:&v106 objects:v130 count:16];
                      if (v73)
                      {
                        uint64_t v74 = *(void *)v107;
                        do
                        {
                          for (uint64_t m = 0; m != v73; ++m)
                          {
                            if (*(void *)v107 != v74) {
                              objc_enumerationMutation(v72);
                            }
                            uint64_t v76 = *(void *)(*((void *)&v106 + 1) + 8 * m);
                            if (([v58 containsObject:v76] & 1) == 0) {
                              [(id)objc_opt_class() _addEventOccurrenceAndProposedTimeOccurrenceFor:v97 withOccurrenceStartDate:v76 toResults:v103 excludeProposed:v102 excludeDeclinedUnlessProposed:v100 excludeSkippedReminders:v98];
                            }
                          }
                          uint64_t v73 = [v72 countByEnumeratingWithState:&v106 objects:v130 count:16];
                        }
                        while (v73);
                      }

                      v77 = [loga objectID];
                      [v105 addObject:v77];
                    }
                  }
                }
              }
            }
          }
        }
        id obja = (char *)obja + 1;
      }
      while (obja != (id)v88);
      uint64_t v78 = [v85 countByEnumeratingWithState:&v114 objects:v132 count:16];
      uint64_t v88 = v78;
    }
    while (v78);
  }
}

+ (void)_addEventOccurrenceAndProposedTimeOccurrenceFor:()EKPredicateExpanding withOccurrenceStartDate:toResults:excludeProposed:excludeDeclinedUnlessProposed:excludeSkippedReminders:
{
  id v19 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v15 = [v19 persistentObject];
  if (a8 && [v19 isReminderIntegrationEvent])
  {
    uint64_t v16 = [[EKEvent alloc] initWithPersistentObject:v15 occurrenceDate:v13];
    if ([(EKEvent *)v16 reminderOccurrenceType] != 1) {
      [v14 addObject:v16];
    }
LABEL_11:

    goto LABEL_12;
  }
  if (!a7 || [v19 participationStatus] != 3)
  {
    v17 = [[EKEvent alloc] initWithPersistentObject:v15 occurrenceDate:v13];
    [v14 addObject:v17];
  }
  if ((a6 & 1) == 0)
  {
    uint64_t v16 = [v19 proposedStartDate];
    if (v16)
    {
      v18 = [[EKEvent alloc] initWithPersistentObject:v15 occurrenceDate:v16];
      [v14 addObject:v18];
    }
    goto LABEL_11;
  }
LABEL_12:
}

- (void)expandWithObjectsPendingCommit:()EKPredicateExpanding deletedObjectIDs:andResultArray:.cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1A4E47000, log, OS_LOG_TYPE_ERROR, "originalStartDate should not be nil", buf, 2u);
}

@end