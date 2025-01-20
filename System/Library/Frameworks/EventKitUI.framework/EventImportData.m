@interface EventImportData
+ (BOOL)isSessionManaged:(id)a3;
+ (BOOL)itemContainsCalendarICSData:(id)a3;
+ (id)_extractEventDataFromEventICSData:(id)a3;
+ (id)_extractEventDataFromMapKitItemData:(id)a3;
+ (id)_extractEventDataFromReminderICSData:(id)a3;
+ (id)_extractEventDataFromSpotlightIdentifier:(id)a3;
+ (id)_extractEventDataFromURL:(id)a3;
+ (id)_extractEventDataFromUTF8StringData:(id)a3;
+ (id)acceptedTypeIdentifiers;
+ (id)eventImportDataFromData:(id)a3 forType:(id)a4;
+ (void)extractEventImportDataFromDropSession:(id)a3 completionBlock:(id)a4;
- (BOOL)prefersManagedCalendar;
- (EKStructuredLocation)structuredLocation;
- (EventImportData)init;
- (NSData)icsData;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)notes;
- (NSString)title;
- (NSString)uniqueId;
- (NSURL)URL;
- (int)requestedAction;
- (void)setEndDate:(id)a3;
- (void)setIcsData:(id)a3;
- (void)setNotes:(id)a3;
- (void)setPrefersManagedCalendar:(BOOL)a3;
- (void)setRequestedAction:(int)a3;
- (void)setStartDate:(id)a3;
- (void)setStructuredLocation:(id)a3;
- (void)setTitle:(id)a3;
- (void)setURL:(id)a3;
- (void)setUniqueId:(id)a3;
@end

@implementation EventImportData

+ (id)acceptedTypeIdentifiers
{
  v6[7] = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend((id)*MEMORY[0x1E4F444F8], "identifier", @"com.apple.calendar.spotlight.identifier", @"com.apple.calendar.ics", @"com.apple.ical.ics", @"com.apple.reminders.ics", @"com.apple.mapkit.map-item");
  v6[5] = v2;
  v3 = [(id)*MEMORY[0x1E4F44510] identifier];
  v6[6] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:7];

  return v4;
}

- (EventImportData)init
{
  v3.receiver = self;
  v3.super_class = (Class)EventImportData;
  result = [(EventImportData *)&v3 init];
  if (result) {
    result->_requestedAction = 0;
  }
  return result;
}

+ (void)extractEventImportDataFromDropSession:(id)a3 completionBlock:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  v32 = [a1 acceptedTypeIdentifiers];
  id v28 = a1;
  char v27 = [a1 isSessionManaged:v6];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v8 = [v6 items];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (!v9)
  {

LABEL_26:
    v7[2](v7, 0);
    goto LABEL_27;
  }
  uint64_t v10 = v9;
  v29 = v7;
  id v25 = v6;
  char v11 = 0;
  uint64_t v12 = *(void *)v43;
  v26 = v34;
  uint64_t v30 = *(void *)v43;
  v31 = v8;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v43 != v12) {
        objc_enumerationMutation(v8);
      }
      if (v11)
      {
        char v11 = 1;
      }
      else
      {
        v14 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v15 = v32;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v38 objects:v46 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v39;
          while (2)
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v39 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void *)(*((void *)&v38 + 1) + 8 * j);
              v21 = objc_msgSend(v14, "itemProvider", v25, v26);
              int v22 = [v21 hasItemConformingToTypeIdentifier:v20];

              if (v22)
              {
                v23 = [v14 itemProvider];
                v33[0] = MEMORY[0x1E4F143A8];
                v33[1] = 3221225472;
                v34[0] = __73__EventImportData_extractEventImportDataFromDropSession_completionBlock___block_invoke;
                v34[1] = &unk_1E608A920;
                id v36 = v28;
                v34[2] = v20;
                char v37 = v27;
                id v35 = v29;
                id v24 = (id)[v23 loadDataRepresentationForTypeIdentifier:v20 completionHandler:v33];

                char v11 = 1;
                goto LABEL_18;
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v38 objects:v46 count:16];
            if (v17) {
              continue;
            }
            break;
          }
          char v11 = 0;
LABEL_18:
          uint64_t v12 = v30;
          v8 = v31;
        }
        else
        {
          char v11 = 0;
        }
      }
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v42 objects:v47 count:16];
  }
  while (v10);

  id v6 = v25;
  v7 = (void (**)(id, void))v29;
  if ((v11 & 1) == 0) {
    goto LABEL_26;
  }
LABEL_27:
}

void __73__EventImportData_extractEventImportDataFromDropSession_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    objc_super v3 = [*(id *)(a1 + 48) eventImportDataFromData:a2 forType:*(void *)(a1 + 32)];
  }
  else
  {
    objc_super v3 = 0;
  }
  id v4 = v3;
  [v3 setPrefersManagedCalendar:*(unsigned __int8 *)(a1 + 56)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (BOOL)isSessionManaged:(id)a3
{
  id v3 = a3;
  if ([v3 conformsToProtocol:&unk_1F0DA0F40])
  {
    id v4 = v3;
    BOOL v5 = [v4 _dataOwner] == 2 || objc_msgSend(v4, "_dataOwner") == 3;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (BOOL)itemContainsCalendarICSData:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"com.apple.calendar.ics", @"com.apple.ical.ics", 0);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v9 = [v3 itemProvider];
        LOBYTE(v8) = [v9 hasItemConformingToTypeIdentifier:v8];

        if (v8)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

+ (id)eventImportDataFromData:(id)a3 forType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:@"com.apple.calendar.spotlight.identifier"])
  {
    uint64_t v8 = [a1 _extractEventDataFromSpotlightIdentifier:v6];
LABEL_6:
    uint64_t v9 = (void *)v8;
    goto LABEL_7;
  }
  if (([v7 isEqualToString:@"com.apple.calendar.ics"] & 1) != 0
    || [v7 isEqualToString:@"com.apple.ical.ics"])
  {
    uint64_t v8 = [a1 _extractEventDataFromEventICSData:v6];
    goto LABEL_6;
  }
  if ([v7 isEqualToString:@"com.apple.reminders.ics"])
  {
    uint64_t v8 = [a1 _extractEventDataFromReminderICSData:v6];
    goto LABEL_6;
  }
  long long v11 = [(id)*MEMORY[0x1E4F444F8] identifier];
  int v12 = [v7 isEqualToString:v11];

  if (v12)
  {
    uint64_t v8 = [a1 _extractEventDataFromURL:v6];
    goto LABEL_6;
  }
  long long v13 = [(id)*MEMORY[0x1E4F44510] identifier];
  int v14 = [v7 isEqualToString:v13];

  if (v14)
  {
    uint64_t v8 = [a1 _extractEventDataFromUTF8StringData:v6];
    goto LABEL_6;
  }
  if ([v7 isEqualToString:@"com.apple.mapkit.map-item"])
  {
    uint64_t v8 = [a1 _extractEventDataFromMapKitItemData:v6];
    goto LABEL_6;
  }
  uint64_t v9 = 0;
LABEL_7:

  return v9;
}

+ (id)_extractEventDataFromSpotlightIdentifier:(id)a3
{
  id v3 = (objc_class *)NSString;
  id v4 = a3;
  uint64_t v5 = (void *)[[v3 alloc] initWithData:v4 encoding:4];

  id v6 = [v5 componentsSeparatedByString:@"."];
  id v7 = [v6 firstObject];
  id v8 = objc_alloc_init(MEMORY[0x1E4F25550]);
  uint64_t v9 = [v8 calendarItemWithIdentifier:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = v10;
  if (v11)
  {
    id v12 = v9;
    if ((unint64_t)[v6 count] >= 2)
    {
      id v12 = v9;
      if ([v11 hasRecurrenceRules])
      {
        long long v13 = [v6 objectAtIndex:1];
        [v13 doubleValue];
        id v12 = v9;
        if (v14 > 1.0)
        {
          id v15 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
          uint64_t v16 = [v11 uniqueId];
          uint64_t v17 = [v8 eventWithUniqueId:v16 occurrenceDate:v15];

          id v12 = v9;
          if (v17)
          {
            id v12 = v17;
          }
        }
      }
    }
    id v11 = (id)objc_opt_new();
    uint64_t v18 = [v12 uniqueId];
    [v11 setUniqueId:v18];

    v19 = [v12 startDate];
    [v11 setStartDate:v19];

    [v11 setRequestedAction:2];
  }
  else
  {
    id v12 = 0;
  }

  return v11;
}

+ (id)_extractEventDataFromEventICSData:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  [v4 setIcsData:v3];

  [v4 setRequestedAction:1];

  return v4;
}

+ (id)_extractEventDataFromUTF8StringData:(id)a3
{
  id v3 = (objc_class *)NSString;
  id v4 = a3;
  uint64_t v5 = (void *)[[v3 alloc] initWithData:v4 encoding:4];

  id v6 = objc_opt_new();
  [v6 setTitle:v5];
  [v6 setRequestedAction:0];

  return v6;
}

+ (id)_extractEventDataFromReminderICSData:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F25550]) initWithEKOptions:48];
  uint64_t v5 = [v4 defaultCalendarForNewReminders];
  id v6 = [v4 importICSData:v3 intoCalendar:v5 options:0xFFFFFFFF80000000];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v6;
  id v8 = (void *)[v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v18 != v9) {
        objc_enumerationMutation(v7);
      }
      id v11 = *(void **)(*((void *)&v17 + 1) + 8 * v10);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      if (v8 == (void *)++v10)
      {
        id v8 = (void *)[v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v12 = v11;

    if (v12)
    {
      id v8 = objc_opt_new();
      long long v13 = objc_msgSend(v12, "title", (void)v17);
      [v8 setTitle:v13];

      double v14 = [v12 notes];
      [v8 setNotes:v14];

      id v15 = [v12 dueDate];
      [v8 setStartDate:v15];

      [v8 setRequestedAction:0];
      goto LABEL_12;
    }
    id v8 = 0;
  }
  else
  {
LABEL_9:
    id v12 = v7;
LABEL_12:
  }

  return v8;
}

+ (id)_extractEventDataFromURL:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = (void *)*MEMORY[0x1E4F444F8];
  id v5 = a3;
  id v6 = [v4 identifier];
  uint64_t v12 = 0;
  id v7 = [v3 objectWithItemProviderData:v5 typeIdentifier:v6 error:&v12];

  if (v7)
  {
    id v8 = objc_opt_new();
    uint64_t v9 = [v7 _title];
    if (!v9)
    {
      uint64_t v9 = [v7 resourceSpecifier];
      if ([v9 hasPrefix:@"//"])
      {
        uint64_t v10 = objc_msgSend(v9, "stringByReplacingCharactersInRange:withString:", 0, 2, &stru_1F0CC2140);

        uint64_t v9 = (void *)v10;
      }
    }
    [v8 setTitle:v9];
    [v8 setURL:v7];
    [v8 setRequestedAction:0];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)_extractEventDataFromMapKitItemData:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v11 = 0;
  id v4 = [(id)EKWeakLinkClass() objectWithItemProviderData:v3 typeIdentifier:@"com.apple.mapkit.map-item" error:&v11];

  id v5 = v11;
  if (v4)
  {
    id v6 = objc_opt_new();
    id v7 = [v4 name];
    [v6 setTitle:v7];

    id v8 = [MEMORY[0x1E4F25630] locationWithMapItem:v4];
    [v6 setStructuredLocation:v8];

    [v6 setRequestedAction:0];
  }
  else
  {
    uint64_t v9 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v5;
      _os_log_impl(&dword_1B3F4C000, v9, OS_LOG_TYPE_ERROR, "Unable to import mapkit data from drop. Error: %@", buf, 0xCu);
    }
    id v6 = 0;
  }

  return v6;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (NSString)notes
{
  return self->_notes;
}

- (void)setNotes:(id)a3
{
}

- (NSData)icsData
{
  return self->_icsData;
}

- (void)setIcsData:(id)a3
{
}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (void)setUniqueId:(id)a3
{
}

- (EKStructuredLocation)structuredLocation
{
  return self->_structuredLocation;
}

- (void)setStructuredLocation:(id)a3
{
}

- (int)requestedAction
{
  return self->_requestedAction;
}

- (void)setRequestedAction:(int)a3
{
  self->_requestedAction = a3;
}

- (BOOL)prefersManagedCalendar
{
  return self->_prefersManagedCalendar;
}

- (void)setPrefersManagedCalendar:(BOOL)a3
{
  self->_prefersManagedCalendar = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_structuredLocation, 0);
  objc_storeStrong((id *)&self->_uniqueId, 0);
  objc_storeStrong((id *)&self->_icsData, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end