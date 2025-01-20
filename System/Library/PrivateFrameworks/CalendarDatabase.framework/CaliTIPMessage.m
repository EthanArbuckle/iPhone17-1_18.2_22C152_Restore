@interface CaliTIPMessage
- (BOOL)iMIPImported;
- (CalDAVScheduleChangesProperty)scheduleChanges;
- (CaliTIPMessage)initWithData:(id)a3 document:(id)a4 filename:(id)a5 scheduleChanges:(id)a6;
- (CaliTIPMessage)initWithData:(id)a3 filename:(id)a4;
- (CaliTIPMessage)initWithData:(id)a3 filename:(id)a4 scheduleChanges:(id)a5;
- (ICSCalendar)calendar;
- (ICSDocument)document;
- (ICSEvent)event;
- (ICSEvent)masterEvent;
- (NSArray)allOccurrences;
- (NSArray)occurrences;
- (NSData)data;
- (NSString)filename;
- (id)description;
- (int64_t)compare:(id)a3;
- (void)setData:(id)a3;
- (void)setDocument:(id)a3;
- (void)setEvent:(id)a3;
- (void)setFilename:(id)a3;
- (void)setIMIPImported:(BOOL)a3;
- (void)setScheduleChanges:(id)a3;
@end

@implementation CaliTIPMessage

- (CaliTIPMessage)initWithData:(id)a3 filename:(id)a4
{
  return [(CaliTIPMessage *)self initWithData:a3 filename:a4 scheduleChanges:0];
}

- (CaliTIPMessage)initWithData:(id)a3 filename:(id)a4 scheduleChanges:(id)a5
{
  return [(CaliTIPMessage *)self initWithData:a3 document:0 filename:a4 scheduleChanges:a5];
}

- (CaliTIPMessage)initWithData:(id)a3 document:(id)a4 filename:(id)a5 scheduleChanges:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CaliTIPMessage;
  v14 = [(CaliTIPMessage *)&v17 init];
  v15 = v14;
  if (v14)
  {
    [(CaliTIPMessage *)v14 setData:v10];
    objc_storeStrong((id *)&v15->_document, a4);
    [(CaliTIPMessage *)v15 setFilename:v12];
    [(CaliTIPMessage *)v15 setScheduleChanges:v13];
  }

  return v15;
}

- (ICSDocument)document
{
  document = self->_document;
  if (!document)
  {
    v4 = (ICSDocument *)[objc_alloc(MEMORY[0x1E4FB7F48]) initWithData:self->_data options:0 error:0];
    v5 = self->_document;
    self->_document = v4;

    document = self->_document;
  }
  return document;
}

- (ICSCalendar)calendar
{
  v2 = [(CaliTIPMessage *)self document];
  v3 = [v2 calendar];

  return (ICSCalendar *)v3;
}

- (ICSEvent)event
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  event = self->_event;
  if (event)
  {
LABEL_2:
    v3 = event;
    goto LABEL_27;
  }
  v5 = [(CaliTIPMessage *)self calendar];
  v6 = [v5 componentKeys];
  if ([v6 count])
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v40;
      v33 = v6;
      v34 = v7;
      uint64_t v31 = *(void *)v40;
      while (2)
      {
        uint64_t v11 = 0;
        uint64_t v32 = v9;
        do
        {
          if (*(void *)v40 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v39 + 1) + 8 * v11);
          id v13 = [v5 componentForKey:v12];
          if (v13)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              uint64_t v28 = objc_opt_class();
              uint64_t v29 = objc_opt_class();
              NSLog(&cfstr_ComponentNotSu.isa, v28, v29);
LABEL_24:

              v6 = v33;
              goto LABEL_26;
            }
          }
          v14 = [v5 componentOccurrencesForKey:v12];
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          id v15 = v14;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v43 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v36;
            while (2)
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v36 != v18) {
                  objc_enumerationMutation(v15);
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  uint64_t v21 = objc_opt_class();
                  uint64_t v22 = objc_opt_class();
                  NSLog(&cfstr_ComponentNotSu.isa, v21, v22);

                  id v7 = v34;
                  goto LABEL_24;
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v35 objects:v43 count:16];
              if (v17) {
                continue;
              }
              break;
            }
          }

          ++v11;
          uint64_t v10 = v31;
          id v7 = v34;
        }
        while (v11 != v32);
        uint64_t v9 = [v34 countByEnumeratingWithState:&v39 objects:v44 count:16];
        v6 = v33;
        if (v9) {
          continue;
        }
        break;
      }
    }

    if ((unint64_t)[v7 count] < 2)
    {
      v24 = [v7 objectAtIndexedSubscript:0];
      v25 = [v5 componentForKey:v24];
      if (!v25)
      {
        v26 = [v5 componentOccurrencesForKey:v24];
        if ([v26 count])
        {
          v25 = [v26 objectAtIndexedSubscript:0];
        }
        else
        {
          v25 = 0;
        }
      }
      v27 = self->_event;
      self->_event = v25;

      event = self->_event;
      goto LABEL_2;
    }
    uint64_t v20 = objc_opt_class();
    NSLog(&cfstr_MoreThanOneEve.isa, v20, [v7 count]);
  }
  else
  {
    uint64_t v30 = objc_opt_class();
    NSLog(&cfstr_ItipMessageCon.isa, v30);
  }
LABEL_26:

  v3 = 0;
LABEL_27:
  return v3;
}

- (ICSEvent)masterEvent
{
  v3 = [(CaliTIPMessage *)self event];
  v4 = objc_msgSend(v3, "recurrence_id");

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(CaliTIPMessage *)self event];
  }
  return (ICSEvent *)v5;
}

- (NSArray)allOccurrences
{
  v3 = [(CaliTIPMessage *)self event];
  v4 = [MEMORY[0x1E4F1CA48] array];
  if (v3)
  {
    v5 = objc_msgSend(v3, "recurrence_id");

    if (!v5) {
      [v4 addObject:v3];
    }
    v6 = [(CaliTIPMessage *)self calendar];
    id v7 = [v3 uid];
    uint64_t v8 = [v6 componentOccurrencesForKey:v7];
    [v4 addObjectsFromArray:v8];
  }
  return (NSArray *)v4;
}

- (NSArray)occurrences
{
  v3 = [(CaliTIPMessage *)self event];
  v4 = objc_msgSend(v3, "recurrence_id");

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v6 = [(CaliTIPMessage *)self calendar];
    id v7 = [v3 uid];
    v5 = [v6 componentOccurrencesForKey:v7];
  }
  return (NSArray *)v5;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  v5 = [(CaliTIPMessage *)self event];
  v6 = [v4 event];

  unint64_t v7 = [v5 sequence];
  if (v7 >= [v6 sequence])
  {
    unint64_t v9 = [v5 sequence];
    if (v9 <= [v6 sequence])
    {
      uint64_t v10 = [v5 dtstamp];
      uint64_t v11 = [v10 value];
      uint64_t v12 = [v6 dtstamp];
      id v13 = [v12 value];
      int64_t v8 = [v11 compare:v13];
    }
    else
    {
      int64_t v8 = 1;
    }
  }
  else
  {
    int64_t v8 = -1;
  }

  return v8;
}

- (id)description
{
  v3 = [(CaliTIPMessage *)self calendar];
  id v4 = [(CaliTIPMessage *)self event];
  v14 = NSString;
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(MEMORY[0x1E4FB7F00], "ICSStringFromMethod:", objc_msgSend(v3, "method"));
  unint64_t v7 = [v4 uid];
  uint64_t v8 = [v4 sequence];
  unint64_t v9 = [v4 dtstamp];
  uint64_t v10 = [v9 value];
  uint64_t v11 = [v4 summary];
  uint64_t v12 = [v14 stringWithFormat:@"%@ <%p> { %@ %@ %ld %@ \"%@\"}", v5, self, v6, v7, v8, v10, v11];

  return v12;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (CalDAVScheduleChangesProperty)scheduleChanges
{
  return self->_scheduleChanges;
}

- (void)setScheduleChanges:(id)a3
{
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
}

- (void)setDocument:(id)a3
{
}

- (void)setEvent:(id)a3
{
}

- (BOOL)iMIPImported
{
  return self->_iMIPImported;
}

- (void)setIMIPImported:(BOOL)a3
{
  self->_iMIPImported = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_document, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_scheduleChanges, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end