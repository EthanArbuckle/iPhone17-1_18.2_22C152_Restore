@interface CalDAVPostCalendarItemRecurrenceSplitTask
- (BOOL)isAllDay;
- (BOOL)isFloating;
- (CalDAVPostCalendarItemRecurrenceSplitTask)initWithResourceURL:(id)a3 recurrenceDate:(id)a4 floating:(BOOL)a5 allday:(BOOL)a6;
- (CoreDAVResponseItem)createdResponseItem;
- (CoreDAVResponseItem)updatedResponseItem;
- (NSDate)recurrenceDate;
- (NSString)previousETag;
- (NSString)previousScheduleTag;
- (NSString)uidForCreatedSeries;
- (NSURL)postURLWithQuery;
- (NSURL)resourceURL;
- (id)_dataForItem:(id)a3;
- (id)_documentForItem:(id)a3;
- (id)_etagForItem:(id)a3;
- (id)_recurrenceDateString;
- (id)_scheduleTagForItem:(id)a3;
- (id)additionalHeaderValues;
- (id)createdETag;
- (id)createdICSData;
- (id)createdICSDocument;
- (id)createdScheduleTag;
- (id)createdURL;
- (id)description;
- (id)httpMethod;
- (id)requestBody;
- (id)updatedETag;
- (id)updatedICSDocument;
- (id)updatedScheduleTag;
- (id)urlWithQuery;
- (void)_updateBothResponseItems;
- (void)setCreatedResponseItem:(id)a3;
- (void)setIsAllDay:(BOOL)a3;
- (void)setIsFloating:(BOOL)a3;
- (void)setPostURLWithQuery:(id)a3;
- (void)setPreviousETag:(id)a3;
- (void)setPreviousScheduleTag:(id)a3;
- (void)setRecurrenceDate:(id)a3;
- (void)setResourceURL:(id)a3;
- (void)setUidForCreatedSeries:(id)a3;
- (void)setUpdatedResponseItem:(id)a3;
@end

@implementation CalDAVPostCalendarItemRecurrenceSplitTask

- (CalDAVPostCalendarItemRecurrenceSplitTask)initWithResourceURL:(id)a3 recurrenceDate:(id)a4 floating:(BOOL)a5 allday:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CalDAVPostCalendarItemRecurrenceSplitTask;
  v12 = [(CoreDAVPropertyFindBaseTask *)&v15 initWithPropertiesToFind:0 atURL:0];
  v13 = v12;
  if (v12)
  {
    [(CalDAVPostCalendarItemRecurrenceSplitTask *)v12 setResourceURL:v10];
    [(CalDAVPostCalendarItemRecurrenceSplitTask *)v13 setRecurrenceDate:v11];
    [(CalDAVPostCalendarItemRecurrenceSplitTask *)v13 setIsFloating:v7];
    [(CalDAVPostCalendarItemRecurrenceSplitTask *)v13 setIsAllDay:v6];
  }

  return v13;
}

- (id)_recurrenceDateString
{
  v3 = [MEMORY[0x263EFF8F0] calendarWithIdentifier:*MEMORY[0x263EFF3F8]];
  v4 = [MEMORY[0x263EFFA18] timeZoneWithName:@"UTC"];
  v5 = [(CalDAVPostCalendarItemRecurrenceSplitTask *)self recurrenceDate];

  if (v5)
  {
    BOOL v6 = [(CalDAVPostCalendarItemRecurrenceSplitTask *)self recurrenceDate];
    BOOL v7 = [v3 componentsInTimeZone:v4 fromDate:v6];

    if ([(CalDAVPostCalendarItemRecurrenceSplitTask *)self isAllDay])
    {
      v8 = objc_msgSend(objc_alloc(MEMORY[0x263F886E0]), "initWithYear:month:day:", objc_msgSend(v7, "year"), objc_msgSend(v7, "month"), objc_msgSend(v7, "day"));
    }
    else
    {
      if ([(CalDAVPostCalendarItemRecurrenceSplitTask *)self isFloating]) {
        id v10 = (objc_class *)MEMORY[0x263F886D8];
      }
      else {
        id v10 = (objc_class *)MEMORY[0x263F886D0];
      }
      v8 = objc_msgSend([v10 alloc], "initWithYear:month:day:hour:minute:second:", objc_msgSend(v7, "year"), objc_msgSend(v7, "month"), objc_msgSend(v7, "day"), objc_msgSend(v7, "hour"), objc_msgSend(v7, "minute"), objc_msgSend(v7, "second"));
    }
    id v11 = v8;
    v9 = [v8 icsString];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)urlWithQuery
{
  v21[3] = *MEMORY[0x263EF8340];
  postURLWithQuery = self->_postURLWithQuery;
  if (!postURLWithQuery)
  {
    v4 = (void *)MEMORY[0x263F08BA0];
    v5 = [(CalDAVPostCalendarItemRecurrenceSplitTask *)self resourceURL];
    BOOL v6 = [v4 componentsWithURL:v5 resolvingAgainstBaseURL:0];

    BOOL v7 = [MEMORY[0x263F08BD0] queryItemWithName:@"action" value:@"split"];
    v8 = (void *)MEMORY[0x263F08BD0];
    v9 = [(CalDAVPostCalendarItemRecurrenceSplitTask *)self _recurrenceDateString];
    id v10 = [v8 queryItemWithName:@"rid" value:v9];

    id v11 = [(CalDAVPostCalendarItemRecurrenceSplitTask *)self uidForCreatedSeries];
    uint64_t v12 = [v11 length];

    if (v12)
    {
      v13 = (void *)MEMORY[0x263F08BD0];
      v14 = [(CalDAVPostCalendarItemRecurrenceSplitTask *)self uidForCreatedSeries];
      objc_super v15 = [v13 queryItemWithName:@"uid" value:v14];

      v21[0] = v7;
      v21[1] = v10;
      v21[2] = v15;
      v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:3];
      [v6 setQueryItems:v16];
    }
    else
    {
      v20[0] = v7;
      v20[1] = v10;
      objc_super v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:2];
      [v6 setQueryItems:v15];
    }

    v17 = [v6 URL];
    v18 = self->_postURLWithQuery;
    self->_postURLWithQuery = v17;

    postURLWithQuery = self->_postURLWithQuery;
  }
  return postURLWithQuery;
}

- (id)httpMethod
{
  return @"POST";
}

- (id)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)CalDAVPostCalendarItemRecurrenceSplitTask;
  v4 = [(CoreDAVPropertyFindBaseTask *)&v10 description];
  v5 = [(CalDAVPostCalendarItemRecurrenceSplitTask *)self recurrenceDate];
  BOOL v6 = [(CalDAVPostCalendarItemRecurrenceSplitTask *)self previousScheduleTag];
  BOOL v7 = [(CalDAVPostCalendarItemRecurrenceSplitTask *)self previousETag];
  v8 = [v3 stringWithFormat:@"[%@], recurrenceDate: [%@], previousScheduleTag: [%@], previousETag: [%@]", v4, v5, v6, v7];

  return v8;
}

- (id)additionalHeaderValues
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [(CalDAVPostCalendarItemRecurrenceSplitTask *)self previousScheduleTag];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    BOOL v6 = [(CalDAVPostCalendarItemRecurrenceSplitTask *)self previousScheduleTag];
    BOOL v7 = CalDAVHTTPHeader_IfScheduleTagMatch;
  }
  else
  {
    v8 = [(CalDAVPostCalendarItemRecurrenceSplitTask *)self previousETag];
    uint64_t v9 = [v8 length];

    if (!v9) {
      goto LABEL_6;
    }
    BOOL v6 = [(CalDAVPostCalendarItemRecurrenceSplitTask *)self previousETag];
    BOOL v7 = (__CFString **)MEMORY[0x263F34A68];
  }
  [v3 setObject:v6 forKeyedSubscript:*v7];

LABEL_6:
  [v3 setObject:@"return=representation" forKeyedSubscript:*MEMORY[0x263F34A80]];
  return v3;
}

- (void)_updateBothResponseItems
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v3 = [(CalDAVPostCalendarItemRecurrenceSplitTask *)self resourceURL];
  v4 = [v3 path];
  uint64_t v5 = [v4 lastPathComponent];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  BOOL v6 = [(CoreDAVPropertyFindBaseTask *)self multiStatus];
  BOOL v7 = [v6 responses];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v13 = [v12 firstHref];
        v14 = [v13 payloadAsString];
        objc_super v15 = [v14 lastPathComponent];

        int v16 = [v15 isEqualToString:v5];
        v17 = &OBJC_IVAR___CalDAVPostCalendarItemRecurrenceSplitTask__createdResponseItem;
        if (v16) {
          v17 = &OBJC_IVAR___CalDAVPostCalendarItemRecurrenceSplitTask__updatedResponseItem;
        }
        objc_storeStrong((id *)((char *)&self->super.super.super.isa + *v17), v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }
}

- (CoreDAVResponseItem)createdResponseItem
{
  createdResponseItem = self->_createdResponseItem;
  if (!createdResponseItem)
  {
    [(CalDAVPostCalendarItemRecurrenceSplitTask *)self _updateBothResponseItems];
    createdResponseItem = self->_createdResponseItem;
  }
  return createdResponseItem;
}

- (CoreDAVResponseItem)updatedResponseItem
{
  updatedResponseItem = self->_updatedResponseItem;
  if (!updatedResponseItem)
  {
    [(CalDAVPostCalendarItemRecurrenceSplitTask *)self _updateBothResponseItems];
    updatedResponseItem = self->_updatedResponseItem;
  }
  return updatedResponseItem;
}

- (id)_etagForItem:(id)a3
{
  v3 = [a3 successfulPropertiesToValues];
  v4 = [v3 CDVObjectForKeyWithNameSpace:*MEMORY[0x263F34E10] andName:*MEMORY[0x263F34E38]];
  uint64_t v5 = [v4 payloadAsString];

  return v5;
}

- (id)_scheduleTagForItem:(id)a3
{
  v3 = [a3 successfulPropertiesToValues];
  v4 = [v3 CDVObjectForKeyWithNameSpace:*MEMORY[0x263F34CD8] andName:@"schedule-tag"];
  uint64_t v5 = [v4 payloadAsString];

  return v5;
}

- (id)_dataForItem:(id)a3
{
  v3 = [a3 successfulPropertiesToValues];
  v4 = [v3 CDVObjectForKeyWithNameSpace:*MEMORY[0x263F34CD8] andName:@"calendar-data"];
  uint64_t v5 = [v4 payload];

  return v5;
}

- (id)_documentForItem:(id)a3
{
  v3 = [(CalDAVPostCalendarItemRecurrenceSplitTask *)self _dataForItem:a3];
  if (v3) {
    v4 = (void *)[objc_alloc(MEMORY[0x263F886E8]) initWithData:v3 options:0 error:0];
  }
  else {
    v4 = 0;
  }

  return v4;
}

- (id)updatedETag
{
  v3 = [(CalDAVPostCalendarItemRecurrenceSplitTask *)self responseHeaders];
  v4 = [v3 objectForKeyedSubscript:*MEMORY[0x263F34A60]];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    BOOL v6 = [(CalDAVPostCalendarItemRecurrenceSplitTask *)self updatedResponseItem];
    id v5 = [(CalDAVPostCalendarItemRecurrenceSplitTask *)self _etagForItem:v6];
  }
  return v5;
}

- (id)updatedScheduleTag
{
  v3 = [(CalDAVPostCalendarItemRecurrenceSplitTask *)self responseHeaders];
  v4 = [v3 objectForKeyedSubscript:@"Schedule-Tag"];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    BOOL v6 = [(CalDAVPostCalendarItemRecurrenceSplitTask *)self updatedResponseItem];
    id v5 = [(CalDAVPostCalendarItemRecurrenceSplitTask *)self _scheduleTagForItem:v6];
  }
  return v5;
}

- (id)updatedICSDocument
{
  v3 = [(CalDAVPostCalendarItemRecurrenceSplitTask *)self updatedResponseItem];
  v4 = [(CalDAVPostCalendarItemRecurrenceSplitTask *)self _documentForItem:v3];

  return v4;
}

- (id)createdURL
{
  v2 = [(CalDAVPostCalendarItemRecurrenceSplitTask *)self createdResponseItem];
  v3 = [v2 firstHref];
  v4 = [v3 payloadAsFullURL];

  return v4;
}

- (id)createdETag
{
  v3 = [(CalDAVPostCalendarItemRecurrenceSplitTask *)self createdResponseItem];
  v4 = [(CalDAVPostCalendarItemRecurrenceSplitTask *)self _etagForItem:v3];

  return v4;
}

- (id)createdScheduleTag
{
  v3 = [(CalDAVPostCalendarItemRecurrenceSplitTask *)self createdResponseItem];
  v4 = [(CalDAVPostCalendarItemRecurrenceSplitTask *)self _scheduleTagForItem:v3];

  return v4;
}

- (id)createdICSDocument
{
  v3 = [(CalDAVPostCalendarItemRecurrenceSplitTask *)self createdResponseItem];
  v4 = [(CalDAVPostCalendarItemRecurrenceSplitTask *)self _documentForItem:v3];

  return v4;
}

- (id)createdICSData
{
  v3 = [(CalDAVPostCalendarItemRecurrenceSplitTask *)self createdResponseItem];
  v4 = [(CalDAVPostCalendarItemRecurrenceSplitTask *)self _dataForItem:v3];

  return v4;
}

- (id)requestBody
{
  return 0;
}

- (NSURL)resourceURL
{
  return self->_resourceURL;
}

- (void)setResourceURL:(id)a3
{
}

- (NSDate)recurrenceDate
{
  return self->_recurrenceDate;
}

- (void)setRecurrenceDate:(id)a3
{
}

- (NSString)uidForCreatedSeries
{
  return self->_uidForCreatedSeries;
}

- (void)setUidForCreatedSeries:(id)a3
{
}

- (NSString)previousScheduleTag
{
  return self->_previousScheduleTag;
}

- (void)setPreviousScheduleTag:(id)a3
{
}

- (NSString)previousETag
{
  return self->_previousETag;
}

- (void)setPreviousETag:(id)a3
{
}

- (BOOL)isFloating
{
  return self->_isFloating;
}

- (void)setIsFloating:(BOOL)a3
{
  self->_isFloating = a3;
}

- (BOOL)isAllDay
{
  return self->_isAllDay;
}

- (void)setIsAllDay:(BOOL)a3
{
  self->_isAllDay = a3;
}

- (NSURL)postURLWithQuery
{
  return self->_postURLWithQuery;
}

- (void)setPostURLWithQuery:(id)a3
{
}

- (void)setUpdatedResponseItem:(id)a3
{
}

- (void)setCreatedResponseItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_createdResponseItem, 0);
  objc_storeStrong((id *)&self->_updatedResponseItem, 0);
  objc_storeStrong((id *)&self->_postURLWithQuery, 0);
  objc_storeStrong((id *)&self->_previousETag, 0);
  objc_storeStrong((id *)&self->_previousScheduleTag, 0);
  objc_storeStrong((id *)&self->_uidForCreatedSeries, 0);
  objc_storeStrong((id *)&self->_recurrenceDate, 0);
  objc_storeStrong((id *)&self->_resourceURL, 0);
}

@end