@interface CalDAVCalendarQueryTask
- (BOOL)syncEvents;
- (BOOL)syncTodos;
- (NSDateComponents)eventFilterEndDate;
- (NSDateComponents)eventFilterStartDate;
- (id)_icsDateStringForNSDateComponents:(id)a3;
- (id)description;
- (id)httpMethod;
- (id)requestBody;
- (void)_appendComponentFiltersToXMLData:(id)a3;
- (void)_appendTimeRangeFilterToXMLData:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (void)setEventFilterEndDate:(id)a3;
- (void)setEventFilterStartDate:(id)a3;
- (void)setSyncEvents:(BOOL)a3;
- (void)setSyncTodos:(BOOL)a3;
@end

@implementation CalDAVCalendarQueryTask

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  id v4 = objc_alloc(MEMORY[0x263EFF8F0]);
  v5 = (void *)[v4 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  v6 = [MEMORY[0x263EFFA18] timeZoneWithName:@"UTC"];
  [v5 setTimeZone:v6];

  v23.receiver = self;
  v23.super_class = (Class)CalDAVCalendarQueryTask;
  v7 = [(CoreDAVPropertyFindBaseTask *)&v23 description];
  [v3 appendFormat:@"%@", v7];

  if ([(CalDAVCalendarQueryTask *)self syncEvents]) {
    v8 = @" Events";
  }
  else {
    v8 = &stru_26C4CD4C0;
  }
  BOOL v9 = [(CalDAVCalendarQueryTask *)self syncTodos];
  v10 = @" Todos";
  if (!v9) {
    v10 = &stru_26C4CD4C0;
  }
  [v3 appendFormat:@"\n  Syncing:%@%@", v8, v10];
  v11 = [(CalDAVCalendarQueryTask *)self eventFilterStartDate];
  if (v11)
  {
  }
  else
  {
    v12 = [(CalDAVCalendarQueryTask *)self eventFilterEndDate];

    if (!v12) {
      goto LABEL_22;
    }
  }
  v13 = [(CalDAVCalendarQueryTask *)self eventFilterStartDate];
  if (v13)
  {
    v14 = [(CalDAVCalendarQueryTask *)self eventFilterStartDate];
    v15 = [v5 dateFromComponents:v14];
  }
  else
  {
    v15 = 0;
  }

  uint64_t v16 = [(CalDAVCalendarQueryTask *)self eventFilterEndDate];
  if (v16)
  {
    v17 = (void *)v16;
    v18 = [(CalDAVCalendarQueryTask *)self eventFilterEndDate];
    v19 = [v5 dateFromComponents:v18];

    if (v15 && v19)
    {
      v20 = [MEMORY[0x263F08790] localizedStringFromDate:v15 dateStyle:1 timeStyle:1];
      v21 = [MEMORY[0x263F08790] localizedStringFromDate:v19 dateStyle:1 timeStyle:1];
      [v3 appendFormat:@"\n Event filter Start: (%@), End: (%@)", v20, v21];

LABEL_20:
      goto LABEL_21;
    }
    if (!v15)
    {
      if (!v19) {
        goto LABEL_21;
      }
      v20 = [MEMORY[0x263F08790] localizedStringFromDate:v19 dateStyle:1 timeStyle:1];
      [v3 appendFormat:@"\n Event filter End: (%@)", v20];
      goto LABEL_20;
    }
LABEL_19:
    v20 = [MEMORY[0x263F08790] localizedStringFromDate:v15 dateStyle:1 timeStyle:1];
    [v3 appendFormat:@"\n Event filter Start: (%@)", v20];
    goto LABEL_20;
  }
  if (v15)
  {
    v19 = 0;
    goto LABEL_19;
  }
LABEL_21:

LABEL_22:
  return v3;
}

- (id)httpMethod
{
  return @"REPORT";
}

- (id)_icsDateStringForNSDateComponents:(id)a3
{
  if (a3)
  {
    id v3 = (objc_class *)MEMORY[0x263F886D0];
    id v4 = a3;
    id v5 = [v3 alloc];
    uint64_t v6 = [v4 year];
    uint64_t v7 = [v4 month];
    uint64_t v8 = [v4 day];
    BOOL v9 = [v4 hour] != 0x7FFFFFFFFFFFFFFFLL;
    BOOL v10 = [v4 minute] != 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v11 = [v4 second];

    v12 = (void *)[v5 initWithYear:v6 month:v7 day:v8 hour:v9 minute:v10 second:v11 != 0x7FFFFFFFFFFFFFFFLL];
    v13 = [v12 icsString];
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (void)_appendTimeRangeFilterToXMLData:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v16 = a3;
  id v8 = a5;
  BOOL v9 = [(CalDAVCalendarQueryTask *)self _icsDateStringForNSDateComponents:a4];
  BOOL v10 = [(CalDAVCalendarQueryTask *)self _icsDateStringForNSDateComponents:v8];

  if (v9 && v10)
  {
    uint64_t v11 = *MEMORY[0x263F34F50];
    uint64_t v12 = *MEMORY[0x263F34CD8];
    v14 = v10;
    uint64_t v15 = 0;
    v13 = @"end";
LABEL_6:
    objc_msgSend(v16, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", v11, v12, 0, @"start", v9, v13, v14, v15);
    goto LABEL_7;
  }
  if (v9)
  {
    uint64_t v11 = *MEMORY[0x263F34F50];
    uint64_t v12 = *MEMORY[0x263F34CD8];
    v13 = 0;
    goto LABEL_6;
  }
  if (v10) {
    objc_msgSend(v16, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", *MEMORY[0x263F34F50], *MEMORY[0x263F34CD8], 0, @"end", v10, 0, v14, v15);
  }
LABEL_7:
}

- (void)_appendComponentFiltersToXMLData:(id)a3
{
  id v11 = a3;
  id v4 = objc_alloc(MEMORY[0x263EFF9A0]);
  uint64_t v5 = *MEMORY[0x263F34EC0];
  uint64_t v6 = objc_msgSend(v4, "initWithObjectsAndKeys:", @"VCALENDAR", *MEMORY[0x263F34EC0], 0);
  if ([(CalDAVCalendarQueryTask *)self syncEvents]
    && [(CalDAVCalendarQueryTask *)self syncTodos])
  {
    [v6 setValue:*MEMORY[0x263F34DB8] forKey:*MEMORY[0x263F34DE8]];
  }
  uint64_t v7 = *MEMORY[0x263F34E00];
  uint64_t v8 = *MEMORY[0x263F34CD8];
  [v11 startElement:*MEMORY[0x263F34E00] inNamespace:*MEMORY[0x263F34CD8] withAttributes:v6];
  if ([(CalDAVCalendarQueryTask *)self syncEvents])
  {
    objc_msgSend(v11, "startElement:inNamespace:withAttributeNamesAndValues:", v7, v8, v5, @"VEVENT", 0);
    BOOL v9 = [(CalDAVCalendarQueryTask *)self eventFilterStartDate];
    BOOL v10 = [(CalDAVCalendarQueryTask *)self eventFilterEndDate];
    [(CalDAVCalendarQueryTask *)self _appendTimeRangeFilterToXMLData:v11 startDate:v9 endDate:v10];

    [v11 endElement:v7 inNamespace:v8];
  }
  [v11 endElement:v7 inNamespace:v8];
}

- (id)requestBody
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(CoreDAVPropertyFindBaseTask *)self propertiesToFind];
  if (v3
    && (id v4 = (void *)v3,
        [(CoreDAVPropertyFindBaseTask *)self propertiesToFind],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v4,
        v6))
  {
    id v7 = objc_alloc_init(MEMORY[0x263F34BB8]);
    uint64_t v8 = *MEMORY[0x263F34CD8];
    uint64_t v22 = *MEMORY[0x263F34CA0];
    objc_msgSend(v7, "startElement:inNamespace:withAttributeNamesAndValues:");
    uint64_t v9 = *MEMORY[0x263F34E10];
    uint64_t v21 = *MEMORY[0x263F34EE0];
    objc_msgSend(v7, "startElement:inNamespace:withAttributeNamesAndValues:");
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    BOOL v10 = [(CoreDAVPropertyFindBaseTask *)self propertiesToFind];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          id v16 = [v15 name];
          v17 = [v15 nameSpace];
          [v7 appendElement:v16 inNamespace:v17 withStringContent:0 withAttributeNamesAndValues:0];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v12);
    }

    [v7 endElement:v21 inNamespace:v9];
    uint64_t v18 = *MEMORY[0x263F34E28];
    [v7 startElement:*MEMORY[0x263F34E28] inNamespace:v8 withAttributeNamesAndValues:0];
    [(CalDAVCalendarQueryTask *)self _appendComponentFiltersToXMLData:v7];
    [v7 endElement:v18 inNamespace:v8];
    [v7 endElement:v22 inNamespace:v8];
    v19 = [v7 data];
  }
  else
  {
    v19 = 0;
  }
  return v19;
}

- (BOOL)syncEvents
{
  return self->_syncEvents;
}

- (void)setSyncEvents:(BOOL)a3
{
  self->_syncEvents = a3;
}

- (BOOL)syncTodos
{
  return self->_syncTodos;
}

- (void)setSyncTodos:(BOOL)a3
{
  self->_syncTodos = a3;
}

- (NSDateComponents)eventFilterStartDate
{
  return self->_eventFilterStartDate;
}

- (void)setEventFilterStartDate:(id)a3
{
}

- (NSDateComponents)eventFilterEndDate
{
  return self->_eventFilterEndDate;
}

- (void)setEventFilterEndDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventFilterEndDate, 0);
  objc_storeStrong((id *)&self->_eventFilterStartDate, 0);
}

@end