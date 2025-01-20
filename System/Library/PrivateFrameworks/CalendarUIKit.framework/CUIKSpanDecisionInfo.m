@interface CUIKSpanDecisionInfo
+ (BOOL)_allowSlicingEvent:(id)a3;
+ (id)spanDecisionInfoForEvents:(id)a3;
- (BOOL)proposeFuture;
- (BOOL)shouldRequestSpan;
- (int64_t)recurringEventCount;
- (void)setProposeFuture:(BOOL)a3;
- (void)setRecurringEventCount:(int64_t)a3;
- (void)setShouldRequestSpan:(BOOL)a3;
@end

@implementation CUIKSpanDecisionInfo

+ (id)spanDecisionInfoForEvents:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_alloc_init(CUIKSpanDecisionInfo);
  v43 = objc_opt_new();
  v42 = objc_opt_new();
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (!v5)
  {
    LOBYTE(v7) = 0;
    uint64_t v44 = 0;
    uint64_t v8 = 0;
    goto LABEL_33;
  }
  uint64_t v6 = v5;
  LOBYTE(v7) = 0;
  uint64_t v44 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = *(void *)v50;
  uint64_t v35 = *(void *)v50;
  v36 = v4;
  do
  {
    uint64_t v10 = 0;
    uint64_t v38 = v6;
    do
    {
      if (*(void *)v50 != v9) {
        objc_enumerationMutation(obj);
      }
      v11 = *(void **)(*((void *)&v49 + 1) + 8 * v10);
      if (objc_msgSend(v11, "isOnlyOccurrence", v35, v36))
      {
        uint64_t v40 = v10;
        char v41 = v7;
        v12 = [v11 eventStore];
        v13 = [v12 eventsWithSameRecurrenceSetAsEvent:v11];

        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v14 = v13;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v45 objects:v53 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v46;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v46 != v17) {
                objc_enumerationMutation(v14);
              }
              v19 = *(void **)(*((void *)&v45 + 1) + 8 * i);
              v20 = [v19 eventOccurrenceID];
              v21 = [v11 eventOccurrenceID];
              char v22 = [v20 isEqualToString:v21];

              if ((v22 & 1) == 0)
              {
                ++v8;
                int v23 = [v19 isFirstOccurrenceIncludingSlices];
                v24 = [v19 localUID];
                if (v23)
                {
                  [v43 addObject:v24];
                }
                else
                {
                  [v42 addObject:v24];

                  uint64_t v25 = [v19 currentUserGeneralizedParticipantRole];
                  uint64_t v26 = v44;
                  if (v25 == 1) {
                    uint64_t v26 = v44 + 1;
                  }
                  uint64_t v44 = v26;
                }
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v45 objects:v53 count:16];
          }
          while (v16);
        }

        uint64_t v9 = v35;
        v4 = v36;
        uint64_t v6 = v38;
        uint64_t v10 = v40;
        if ((v41 & 1) == 0) {
          goto LABEL_24;
        }
      }
      else
      {
        ++v8;
        int v27 = [v11 isFirstOccurrenceIncludingSlices];
        v28 = [v11 localUID];
        if (v27)
        {
          [v43 addObject:v28];

          if ((v7 & 1) == 0) {
            goto LABEL_24;
          }
        }
        else
        {
          [v42 addObject:v28];

          uint64_t v29 = [v11 currentUserGeneralizedParticipantRole];
          uint64_t v30 = v44;
          if (v29 == 1) {
            uint64_t v30 = v44 + 1;
          }
          uint64_t v44 = v30;
          if ((v7 & 1) == 0)
          {
LABEL_24:
            int v7 = [a1 _allowSlicingEvent:v11] ^ 1;
            goto LABEL_29;
          }
        }
      }
      LOBYTE(v7) = 1;
LABEL_29:
      ++v10;
    }
    while (v10 != v6);
    uint64_t v6 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
  }
  while (v6);
LABEL_33:

  [(CUIKSpanDecisionInfo *)v4 setShouldRequestSpan:v8 > 0];
  int v31 = [v42 isSubsetOfSet:v43];
  if (v7)
  {
    uint64_t v32 = 0;
  }
  else
  {
    int v33 = v31;
    if ([(CUIKSpanDecisionInfo *)v4 shouldRequestSpan]) {
      uint64_t v32 = (v44 == 0) & ~v33;
    }
    else {
      uint64_t v32 = 0;
    }
  }
  [(CUIKSpanDecisionInfo *)v4 setProposeFuture:v32];
  [(CUIKSpanDecisionInfo *)v4 setRecurringEventCount:v8];

  return v4;
}

+ (BOOL)_allowSlicingEvent:(id)a3
{
  id v3 = a3;
  v4 = [v3 calendar];
  uint64_t v5 = [v4 type];

  if (v5 == 4) {
    goto LABEL_2;
  }
  int v7 = [v3 calendar];
  uint64_t v8 = [v7 source];
  uint64_t v9 = [v8 sourceType];

  if (v9 != 1)
  {
    LOBYTE(v6) = 1;
    goto LABEL_7;
  }
  if ([v3 hasAttendees])
  {
LABEL_2:
    LOBYTE(v6) = 0;
  }
  else
  {
    uint64_t v10 = [v3 masterEvent];
    int v6 = [v10 hasAttendees] ^ 1;
  }
LABEL_7:

  return v6;
}

- (BOOL)shouldRequestSpan
{
  return self->_shouldRequestSpan;
}

- (void)setShouldRequestSpan:(BOOL)a3
{
  self->_shouldRequestSpan = a3;
}

- (BOOL)proposeFuture
{
  return self->_proposeFuture;
}

- (void)setProposeFuture:(BOOL)a3
{
  self->_proposeFuture = a3;
}

- (int64_t)recurringEventCount
{
  return self->_recurringEventCount;
}

- (void)setRecurringEventCount:(int64_t)a3
{
  self->_recurringEventCount = a3;
}

@end