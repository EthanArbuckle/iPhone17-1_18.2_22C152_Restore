@interface QLIcalParser
+ (id)parseICSDate:(id)a3 calendar:(id)a4 isEndDate:(BOOL)a5;
- (BOOL)fullDay;
- (BOOL)isDone;
- (BOOL)isTodo;
- (NSDateComponents)dueDate;
- (NSDateComponents)endDate;
- (NSDateComponents)startDate;
- (NSString)summary;
- (QLIcalParser)initWithURL:(id)a3;
- (int)status;
- (void)setDueDate:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setFullDay:(BOOL)a3;
- (void)setIsTodo:(BOOL)a3;
- (void)setStartDate:(id)a3;
- (void)setStatus:(int)a3;
- (void)setSummary:(id)a3;
@end

@implementation QLIcalParser

+ (id)parseICSDate:(id)a3 calendar:(id)a4 isEndDate:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  if (v7)
  {
    v8 = [a4 systemCalendarForDate:v7 options:0];
    unsigned __int8 v9 = [v7 hasTimeComponent];
    v10 = [v7 components];
    v11 = v10;
    if ((v9 & 1) != 0 || !v5)
    {
      [v10 setCalendar:v8];
    }
    else
    {
      v12 = [v8 dateFromComponents:v10];

      v13 = [v8 dateByAddingUnit:16 value:-1 toDate:v12 options:0];
      v11 = [v8 components:1048604 fromDate:v13];
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (QLIcalParser)initWithURL:(id)a3
{
  id v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)QLIcalParser;
  BOOL v5 = [(QLIcalParser *)&v58 init];
  if (!v5) {
    goto LABEL_42;
  }
  v6 = (QLIcalParser *)[objc_alloc((Class)ICSDocument) initWithContentsOfURL:v4 options:0 error:0];
  id v7 = v6;
  if (v6)
  {
    v8 = [(QLIcalParser *)v6 calendar];
    if (v8)
    {
      unsigned __int8 v9 = v8;
      v42 = v7;
      v43 = v5;
      id v44 = v4;
      [v8 componentKeys];
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      id v10 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
      if (v10)
      {
        id v11 = v10;
        int isKindOfClass = 0;
        id v13 = 0;
        uint64_t v14 = *(void *)v55;
        uint64_t v45 = *(void *)v55;
        v46 = v9;
        while (2)
        {
          v15 = 0;
          id v47 = v11;
          do
          {
            if (*(void *)v55 != v14) {
              objc_enumerationMutation(obj);
            }
            uint64_t v16 = *(void *)(*((void *)&v54 + 1) + 8 * (void)v15);
            v17 = [v9 componentForKey:v16];
            if (v17)
            {
              objc_opt_class();
              int isKindOfClass = objc_opt_isKindOfClass();
              if (isKindOfClass & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
              {
                if (v13)
                {

                  goto LABEL_35;
                }
                id v13 = v17;
              }
              else
              {
                int isKindOfClass = 0;
              }
            }
            else
            {
              int v49 = isKindOfClass;
              v18 = [v9 componentOccurrencesForKey:v16];
              long long v50 = 0u;
              long long v51 = 0u;
              long long v52 = 0u;
              long long v53 = 0u;
              id v19 = v18;
              id v20 = [v19 countByEnumeratingWithState:&v50 objects:v59 count:16];
              if (v20)
              {
                id v21 = v20;
                uint64_t v22 = *(void *)v51;
                while (2)
                {
                  for (i = 0; i != v21; i = (char *)i + 1)
                  {
                    if (*(void *)v51 != v22) {
                      objc_enumerationMutation(v19);
                    }
                    v24 = *(void **)(*((void *)&v50 + 1) + 8 * i);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0) {
                        continue;
                      }
                    }
                    if (v13)
                    {

                      id v13 = 0;
                      goto LABEL_27;
                    }
                    id v13 = v24;
                  }
                  id v21 = [v19 countByEnumeratingWithState:&v50 objects:v59 count:16];
                  if (v21) {
                    continue;
                  }
                  break;
                }
              }
LABEL_27:

              uint64_t v14 = v45;
              unsigned __int8 v9 = v46;
              int isKindOfClass = v49;
              id v11 = v47;
            }

            v15 = (char *)v15 + 1;
          }
          while (v15 != v11);
          id v11 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
      else
      {
        LOBYTE(isKindOfClass) = 0;
LABEL_35:
        id v13 = 0;
      }

      BOOL v5 = v43;
      v43->_isTodo = isKindOfClass & 1;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v25 = v13;
        v43->_isDone = [v25 status] == 4;
        v26 = [v25 due];
        uint64_t v27 = +[QLIcalParser parseICSDate:v26 calendar:v9 isEndDate:0];
        dueDate = v43->_dueDate;
        v43->_dueDate = (NSDateComponents *)v27;

        uint64_t v29 = [v25 summary];
        summary = v43->_summary;
        v43->_summary = (NSString *)v29;
        id v4 = v44;
        v31 = v42;
      }
      else
      {
        objc_opt_class();
        id v4 = v44;
        v31 = v42;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_41:

LABEL_42:
          id v7 = v5;
          goto LABEL_43;
        }
        id v32 = v13;
        v33 = [v32 dtend];
        uint64_t v34 = +[QLIcalParser parseICSDate:v33 calendar:v9 isEndDate:1];
        endDate = v43->_endDate;
        v43->_endDate = (NSDateComponents *)v34;

        v36 = [v32 dtstart];
        uint64_t v37 = +[QLIcalParser parseICSDate:v36 calendar:v9 isEndDate:0];
        startDate = v43->_startDate;
        v43->_startDate = (NSDateComponents *)v37;

        uint64_t v39 = [v32 summary];
        v40 = v43->_summary;
        v43->_summary = (NSString *)v39;

        summary = [v32 dtstart];
        v43->_fullDay = [summary hasTimeComponent] ^ 1;
      }

      goto LABEL_41;
    }

    id v7 = 0;
  }
LABEL_43:

  return v7;
}

- (BOOL)isTodo
{
  return self->_isTodo;
}

- (void)setIsTodo:(BOOL)a3
{
  self->_isTodo = a3;
}

- (BOOL)isDone
{
  return self->_isDone;
}

- (BOOL)fullDay
{
  return self->_fullDay;
}

- (void)setFullDay:(BOOL)a3
{
  self->_fullDay = a3;
}

- (NSDateComponents)dueDate
{
  return self->_dueDate;
}

- (void)setDueDate:(id)a3
{
}

- (NSDateComponents)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDateComponents)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);

  objc_storeStrong((id *)&self->_dueDate, 0);
}

@end