@interface CDBiCalFixUps
+ (BOOL)_fixEndDateForEvent:(id)a3 withOriginalEvent:(id)a4 detachments:(id)a5;
+ (BOOL)fixEndDates:(id)a3;
+ (double)_durationForEvent:(id)a3;
@end

@implementation CDBiCalFixUps

+ (BOOL)fixEndDates:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v21 = a3;
  obuint64_t j = [v21 componentKeys];
  uint64_t v22 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  int v4 = 0;
  if (v22)
  {
    uint64_t v20 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        v7 = [v21 componentForKey:v6];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v8 = v7;
        }
        else {
          v8 = 0;
        }
        id v9 = v8;
        v10 = [v21 componentOccurrencesForKey:v6];
        v11 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_5];
        v12 = [v10 filteredArrayUsingPredicate:v11];

        if (v9) {
          v4 |= [a1 _fixEndDateForEvent:v9 withOriginalEvent:v9 detachments:v12];
        }
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v24;
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v24 != v16) {
                objc_enumerationMutation(v13);
              }
              v4 |= [a1 _fixEndDateForEvent:*(void *)(*((void *)&v23 + 1) + 8 * j) withOriginalEvent:v9 detachments:v13];
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v15);
        }
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v22);
  }

  return v4 & 1;
}

uint64_t __29__CDBiCalFixUps_fixEndDates___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (BOOL)_fixEndDateForEvent:(id)a3 withOriginalEvent:(id)a4 detachments:(id)a5
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 dtend];
  if (v11)
  {
    v12 = [v8 dtstart];
    if (!v12 || ([a1 _durationForEvent:v8], v13 >= 0.0))
    {
      BOOL v16 = 0;
LABEL_49:

      goto LABEL_50;
    }
    id v61 = v10;
    id v62 = v9;
    v64 = v12;
    if (v8 == v9 || !v9)
    {
      id v17 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      id v18 = v10;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v69 objects:v86 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v70;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v70 != v21) {
              objc_enumerationMutation(v18);
            }
            [a1 _durationForEvent:*(void *)(*((void *)&v69 + 1) + 8 * i)];
            if (v23 >= 0.0)
            {
              long long v24 = objc_msgSend(NSNumber, "numberWithDouble:");
              [v17 addObject:v24];
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v69 objects:v86 count:16];
        }
        while (v20);
      }

      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id v25 = v17;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v65 objects:v85 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        unint64_t v28 = 0;
        uint64_t v29 = *(void *)v66;
        double v15 = 3600.0;
        do
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(void *)v66 != v29) {
              objc_enumerationMutation(v25);
            }
            v31 = *(void **)(*((void *)&v65 + 1) + 8 * j);
            [v31 doubleValue];
            double v33 = v32;
            unint64_t v34 = [v25 countForObject:v31];
            if (v34 > v28)
            {
              unint64_t v28 = v34;
              double v15 = v33;
            }
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v65 objects:v85 count:16];
        }
        while (v27);
      }
      else
      {
        double v15 = 3600.0;
      }

      id v10 = v61;
      v12 = v64;
    }
    else
    {
      [a1 _durationForEvent:v9];
      double v15 = v14;
    }
    v35 = [v12 tzid];

    if (v35)
    {
      v36 = (void *)MEMORY[0x1E4F1CAF0];
      v37 = [v12 tzid];
      uint64_t v38 = [v36 timeZoneWithName:v37];
    }
    else
    {
      uint64_t v38 = 0;
    }
    v39 = [v11 tzid];

    v60 = (void *)v38;
    if (v39)
    {
      v40 = (void *)MEMORY[0x1E4F1CAF0];
      v41 = [v11 tzid];
      uint64_t v42 = [v40 timeZoneWithName:v41];

      v63 = (void *)v42;
      if (v38 && v42)
      {
        id v43 = [MEMORY[0x1E4F1C9A8] CalGregorianCalendarForTimeZone:v38];
        v44 = [MEMORY[0x1E4F1C9A8] CalGregorianCalendarForTimeZone:v42];
LABEL_39:
        v47 = [v12 components];
        v59 = v43;
        v48 = [v43 dateFromComponents:v47];

        v58 = v48;
        v57 = [v48 dateByAddingTimeInterval:v15];
        v49 = objc_msgSend(v44, "components:fromDate:", 252);
        v50 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB7F28]), "initWithYear:month:day:hour:minute:second:timeZone:", objc_msgSend(v49, "year"), objc_msgSend(v49, "month"), objc_msgSend(v49, "day"), objc_msgSend(v49, "hour"), objc_msgSend(v49, "minute"), objc_msgSend(v49, "second"), v63);
        v51 = objc_msgSend(v8, "recurrence_id");
        v52 = (id)CDBLogHandle;
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          v53 = [v8 uid];
          v54 = &stru_1EFF6D0F0;
          if (v51) {
            v55 = @"/";
          }
          else {
            v55 = &stru_1EFF6D0F0;
          }
          if (v51)
          {
            v54 = [v51 description];
          }
          *(_DWORD *)buf = 138413570;
          v74 = v53;
          __int16 v75 = 2114;
          v76 = v55;
          __int16 v77 = 2114;
          v78 = v54;
          __int16 v79 = 2114;
          v80 = v11;
          __int16 v81 = 2114;
          v82 = v64;
          __int16 v83 = 2114;
          v84 = v50;
          _os_log_impl(&dword_1A8E81000, v52, OS_LOG_TYPE_ERROR, "End date for component %@%{public}@%{public}@ is invalid; DTEND:%{public}@ is before DTSTART:%{public}@. Set"
            "ting DTEND to %{public}@ instead.",
            buf,
            0x3Eu);
          if (v51) {

          }
          id v10 = v61;
        }

        [v8 setDtend:v50];
        BOOL v16 = 1;
        id v9 = v62;
        v12 = v64;
        goto LABEL_49;
      }
    }
    else
    {
      v63 = 0;
    }
    v45 = (void *)MEMORY[0x1E4F1C9A8];
    v46 = (void *)CalCopyTimeZone();
    id v43 = [v45 CalGregorianCalendarForTimeZone:v46];

    v44 = v43;
    goto LABEL_39;
  }
  BOOL v16 = 0;
LABEL_50:

  return v16;
}

+ (double)_durationForEvent:(id)a3
{
  id v3 = a3;
  int v4 = [v3 dtend];
  if (v4)
  {
    v5 = [v3 dtstart];

    uint64_t v6 = [v5 tzid];

    if (v6)
    {
      v7 = (void *)MEMORY[0x1E4F1CAF0];
      id v8 = [v5 tzid];
      uint64_t v6 = [v7 timeZoneWithName:v8];
    }
    id v9 = [v4 tzid];

    if (v9
      && (id v10 = (void *)MEMORY[0x1E4F1CAF0],
          [v4 tzid],
          v11 = objc_claimAutoreleasedReturnValue(),
          [v10 timeZoneWithName:v11],
          id v9 = objc_claimAutoreleasedReturnValue(),
          v11,
          v6)
      && v9)
    {
      id v12 = [MEMORY[0x1E4F1C9A8] CalGregorianCalendarForTimeZone:v6];
      double v13 = [MEMORY[0x1E4F1C9A8] CalGregorianCalendarForTimeZone:v9];
    }
    else
    {
      double v14 = (void *)MEMORY[0x1E4F1C9A8];
      double v15 = (void *)CalCopyTimeZone();
      id v12 = [v14 CalGregorianCalendarForTimeZone:v15];

      double v13 = v12;
    }
    BOOL v16 = [v5 components];
    id v17 = [v12 dateFromComponents:v16];

    id v18 = [v4 components];
    uint64_t v19 = [v13 dateFromComponents:v18];

    [v19 timeIntervalSinceDate:v17];
    double v21 = v20;
  }
  else
  {
    v5 = [v3 duration];

    [v5 timeInterval];
    double v21 = v22;
  }

  return v21;
}

@end