@interface CalDAVFreeBusyLookupTask
+ (id)_freeBusyDocumentWithOrganizer:(id)a3 attendees:(id)a4 start:(id)a5 end:(id)a6 maskedUID:(id)a7 extendedFreeBusy:(BOOL)a8 prodID:(id)a9;
+ (id)_icsDate:(id)a3 calendar:(id)a4;
- (CalDAVFreeBusyLookupTask)initWithOrganizer:(id)a3 originator:(id)a4 attendees:(id)a5 start:(id)a6 end:(id)a7 outboxURL:(id)a8 maskedUID:(id)a9;
- (CalDAVFreeBusyLookupTask)initWithOrganizer:(id)a3 originator:(id)a4 attendees:(id)a5 start:(id)a6 end:(id)a7 outboxURL:(id)a8 maskedUID:(id)a9 extendedFreeBusy:(BOOL)a10 prodID:(id)a11;
- (NSString)maskedUID;
- (void)setMaskedUID:(id)a3;
@end

@implementation CalDAVFreeBusyLookupTask

- (CalDAVFreeBusyLookupTask)initWithOrganizer:(id)a3 originator:(id)a4 attendees:(id)a5 start:(id)a6 end:(id)a7 outboxURL:(id)a8 maskedUID:(id)a9
{
  LOBYTE(v10) = 1;
  return [(CalDAVFreeBusyLookupTask *)self initWithOrganizer:a3 originator:a4 attendees:a5 start:a6 end:a7 outboxURL:a8 maskedUID:a9 extendedFreeBusy:v10 prodID:0];
}

- (CalDAVFreeBusyLookupTask)initWithOrganizer:(id)a3 originator:(id)a4 attendees:(id)a5 start:(id)a6 end:(id)a7 outboxURL:(id)a8 maskedUID:(id)a9 extendedFreeBusy:(BOOL)a10 prodID:(id)a11
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a5;
  id v19 = a4;
  v20 = +[CalDAVFreeBusyLookupTask _freeBusyDocumentWithOrganizer:a3 attendees:v18 start:a6 end:a7 maskedUID:v16 extendedFreeBusy:a10 prodID:a11];
  v21 = [v20 ICSDataWithOptions:0];
  v26.receiver = self;
  v26.super_class = (Class)CalDAVFreeBusyLookupTask;
  v22 = [(CalDAVScheduleTask *)&v26 initWithOriginator:v19 attendees:v18 outboxURL:v17 payload:v21];

  if (v22) {
    [(CalDAVFreeBusyLookupTask *)v22 setMaskedUID:v16];
  }

  return v22;
}

+ (id)_freeBusyDocumentWithOrganizer:(id)a3 attendees:(id)a4 start:(id)a5 end:(id)a6 maskedUID:(id)a7 extendedFreeBusy:(BOOL)a8 prodID:(id)a9
{
  BOOL v36 = a8;
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v38 = a7;
  id v18 = a9;
  id v19 = objc_alloc(MEMORY[0x263EFF8F0]);
  v20 = (void *)[v19 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  v21 = [MEMORY[0x263EFF910] date];
  v37 = [a1 _icsDate:v21 calendar:v20];

  v40 = v16;
  v43 = [a1 _icsDate:v16 calendar:v20];
  v39 = v17;
  v42 = [a1 _icsDate:v17 calendar:v20];
  v41 = v14;
  v22 = (void *)[objc_alloc(MEMORY[0x263F88728]) initWithEmailAddress:v14];
  v23 = [MEMORY[0x263EFF980] array];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v24 = v15;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v45 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = (void *)[objc_alloc(MEMORY[0x263F88728]) initWithEmailAddress:*(void *)(*((void *)&v44 + 1) + 8 * i)];
        [v23 addObject:v29];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v26);
  }

  id v30 = objc_alloc_init(MEMORY[0x263F88700]);
  [v30 setAttendee:v23];
  [v30 setDtend:v42];
  [v30 setDtstamp:v37];
  [v30 setDtstart:v43];
  [v30 setOrganizer:v22];
  v31 = [MEMORY[0x263F886C0] makeUID];
  [v30 setUid:v31];

  objc_msgSend(v30, "setX_calendarserver_mask_uid:", v38);
  if (v36) {
    objc_msgSend(v30, "setX_calendarserver_extended_freebusy:", @"T");
  }
  id v32 = objc_alloc_init(MEMORY[0x263F886B0]);
  [v32 setMethod:2];
  v33 = [MEMORY[0x263EFF8C0] arrayWithObject:v30];
  [v32 setComponents:v33 options:0];

  if (v18 && [v18 length]) {
    [v32 setProdid:v18];
  }
  v34 = (void *)[objc_alloc(MEMORY[0x263F886E8]) initWithCalendar:v32];

  return v34;
}

+ (id)_icsDate:(id)a3 calendar:(id)a4
{
  v5 = (void *)MEMORY[0x263EFFA18];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 timeZoneWithName:@"UTC"];
  [v6 setTimeZone:v8];
  v9 = [v6 components:252 fromDate:v7];

  uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x263F886C8]), "initWithYear:month:day:hour:minute:second:timeZone:", objc_msgSend(v9, "year"), objc_msgSend(v9, "month"), objc_msgSend(v9, "day"), objc_msgSend(v9, "hour"), objc_msgSend(v9, "minute"), objc_msgSend(v9, "second"), v8);
  return v10;
}

- (NSString)maskedUID
{
  return self->_maskedUID;
}

- (void)setMaskedUID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end