@interface CUIKUserActivityCalendarEvent
- (CUIKUserActivityCalendarEvent)initWithDictionary:(id)a3;
- (CUIKUserActivityCalendarEvent)initWithEvent:(id)a3 view:(unint64_t)a4;
- (CUIKUserActivityCalendarEvent)initWithEvent:(id)a3 view:(unint64_t)a4 forceLocal:(BOOL)a5;
- (NSString)title;
- (id)dictionary;
- (id)eventFromStore:(id)a3;
- (unint64_t)view;
- (void)updateActivity:(id)a3;
@end

@implementation CUIKUserActivityCalendarEvent

- (CUIKUserActivityCalendarEvent)initWithEvent:(id)a3 view:(unint64_t)a4 forceLocal:(BOOL)a5
{
  id v9 = a3;
  v10 = v9;
  if (a5)
  {
    v11 = 0;
  }
  else
  {
    v5 = [v9 calendar];
    v11 = [v5 source];
  }
  v33.receiver = self;
  v33.super_class = (Class)CUIKUserActivityCalendarEvent;
  v12 = [(CUIKUserActivityWithSource *)&v33 initWithSource:v11 type:4098];
  if (!a5)
  {
  }
  if (v12)
  {
    uint64_t v13 = [v10 title];
    title = v12->_title;
    v12->_title = (NSString *)v13;

    uint64_t v15 = [v10 startDate];
    startDate = v12->_startDate;
    v12->_startDate = (NSDate *)v15;

    uint64_t v17 = [v10 endDateUnadjustedForLegacyClients];
    endDate = v12->_endDate;
    v12->_endDate = (NSDate *)v17;

    uint64_t v19 = [v10 location];
    location = v12->_location;
    v12->_location = (NSString *)v19;

    v12->_view = a4;
    if (!v12->_title
      || !v12->_startDate
      || -[CUIKUserActivityWithSource _supportsConsistentExternalIDAcrossDevices](v12, "_supportsConsistentExternalIDAcrossDevices")&& ([v10 uniqueId], uint64_t v21 = objc_claimAutoreleasedReturnValue(), externalID = v12->_externalID, v12->_externalID = (NSString *)v21, externalID, !v12->_externalID))
    {
      v31 = 0;
      goto LABEL_14;
    }
    v23 = NSString;
    v24 = [v10 UUID];
    v25 = [v10 startDate];
    [v25 timeIntervalSinceReferenceDate];
    uint64_t v27 = [v23 stringWithFormat:@"%@.%f", v24, v26];
    relatedUniqueIdentifier = v12->_relatedUniqueIdentifier;
    v12->_relatedUniqueIdentifier = (NSString *)v27;

    [(CUIKUserActivity *)v12 setActivityTitle:v12->_title];
    v29 = CUIKBundle();
    v30 = [v29 localizedStringForKey:@"Calendar Event" value:&stru_1F187C430 table:0];
    [(CUIKUserActivity *)v12 setActivitySubtitle:v30];
  }
  v31 = v12;
LABEL_14:

  return v31;
}

- (CUIKUserActivityCalendarEvent)initWithEvent:(id)a3 view:(unint64_t)a4
{
  return [(CUIKUserActivityCalendarEvent *)self initWithEvent:a3 view:a4 forceLocal:0];
}

- (CUIKUserActivityCalendarEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CUIKUserActivityCalendarEvent;
  v5 = [(CUIKUserActivityWithSource *)&v23 initWithDictionary:v4];
  if (!v5) {
    goto LABEL_11;
  }
  char v22 = 0;
  uint64_t v6 = [(id)objc_opt_class() _stringFromDictionary:v4 key:@"com.apple.calendarUIKit.userActivity.title" error:&v22];
  title = v5->_title;
  v5->_title = (NSString *)v6;

  if (v22) {
    goto LABEL_5;
  }
  [(id)objc_opt_class() _doubleFromDictionary:v4 key:@"com.apple.calendarUIKit.userActivity.date" error:&v22];
  if (v22) {
    goto LABEL_5;
  }
  uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:v8];
  startDate = v5->_startDate;
  v5->_startDate = (NSDate *)v9;

  [(id)objc_opt_class() _doubleFromDictionary:v4 key:@"com.apple.calendarUIKit.userActivity.endDate" error:&v22];
  if (v22) {
    goto LABEL_5;
  }
  uint64_t v13 = [objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:v11];
  endDate = v5->_endDate;
  v5->_endDate = (NSDate *)v13;

  uint64_t v15 = [(id)objc_opt_class() _stringFromDictionary:v4 key:@"com.apple.calendarUIKit.userActivity.location" error:0];
  location = v5->_location;
  v5->_location = (NSString *)v15;

  uint64_t v17 = [(id)objc_opt_class() _unsignedIntegerFromDictionary:v4 key:@"com.apple.calendarUIKit.userActivity.view" error:&v22];
  unint64_t v18 = v22 ? 0 : v17;
  v5->_view = v18;
  if (-[CUIKUserActivityWithSource _supportsConsistentExternalIDAcrossDevices](v5, "_supportsConsistentExternalIDAcrossDevices")&& ([(id)objc_opt_class() _stringFromDictionary:v4 key:@"com.apple.calendarUIKit.userActivity.externalID" error:&v22], uint64_t v19 = objc_claimAutoreleasedReturnValue(), externalID = v5->_externalID, v5->_externalID = (NSString *)v19, externalID, v22))
  {
LABEL_5:
    v12 = 0;
  }
  else
  {
LABEL_11:
    v12 = v5;
  }

  return v12;
}

- (id)dictionary
{
  v18[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v16.receiver = self;
  v16.super_class = (Class)CUIKUserActivityCalendarEvent;
  id v4 = [(CUIKUserActivityWithSource *)&v16 dictionary];
  v5 = (void *)[v3 initWithDictionary:v4];

  v17[0] = @"com.apple.calendarUIKit.userActivity.date";
  uint64_t v6 = NSNumber;
  [(NSDate *)self->_startDate timeIntervalSinceReferenceDate];
  v7 = objc_msgSend(v6, "numberWithDouble:");
  v18[0] = v7;
  v17[1] = @"com.apple.calendarUIKit.userActivity.endDate";
  double v8 = NSNumber;
  [(NSDate *)self->_endDate timeIntervalSinceReferenceDate];
  uint64_t v9 = objc_msgSend(v8, "numberWithDouble:");
  v18[1] = v9;
  v17[2] = @"com.apple.calendarUIKit.userActivity.view";
  v10 = [NSNumber numberWithUnsignedInteger:self->_view];
  v17[3] = @"com.apple.calendarUIKit.userActivity.title";
  title = self->_title;
  v18[2] = v10;
  v18[3] = title;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];
  [v5 addEntriesFromDictionary:v12];

  location = self->_location;
  if (location) {
    [v5 setObject:location forKeyedSubscript:@"com.apple.calendarUIKit.userActivity.location"];
  }
  externalID = self->_externalID;
  if (externalID) {
    [v5 setObject:externalID forKeyedSubscript:@"com.apple.calendarUIKit.userActivity.externalID"];
  }

  return v5;
}

- (id)eventFromStore:(id)a3
{
  id v4 = a3;
  if ([(CUIKUserActivityWithSource *)self _supportsConsistentExternalIDAcrossDevices])
  {
    v5 = [v4 allEventsWithUniqueId:self->_externalID occurrenceDate:self->_startDate];
    if ([v5 count] == 1)
    {
      id v6 = [v5 firstObject];
      goto LABEL_13;
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  if (![v5 count])
  {
    startDate = self->_startDate;
    double v8 = [(NSDate *)startDate dateByAddingTimeInterval:1.0];
    uint64_t v9 = [v4 predicateForEventsWithStartDate:startDate endDate:v8 calendars:0];

    uint64_t v10 = [v4 eventsMatchingPredicate:v9];

    v5 = (void *)v10;
  }
  double v11 = objc_opt_new();
  v12 = self->_title;
  uint64_t v13 = self->_startDate;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __48__CUIKUserActivityCalendarEvent_eventFromStore___block_invoke;
  v27[3] = &unk_1E63696F0;
  v14 = v13;
  v28 = v14;
  uint64_t v15 = v12;
  v29 = v15;
  id v16 = v11;
  id v30 = v16;
  [v5 enumerateObjectsUsingBlock:v27];
  if ([v16 count])
  {
    if ([v16 count] == 1)
    {
      id v6 = [v16 firstObject];
    }
    else
    {
      uint64_t v21 = 0;
      char v22 = &v21;
      uint64_t v23 = 0x3032000000;
      v24 = __Block_byref_object_copy__0;
      v25 = __Block_byref_object_dispose__0;
      id v26 = 0;
      v19[0] = 0;
      v19[1] = v19;
      v19[2] = 0x2020000000;
      char v20 = 0;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __48__CUIKUserActivityCalendarEvent_eventFromStore___block_invoke_92;
      v18[3] = &unk_1E6369718;
      v18[4] = self;
      void v18[5] = &v21;
      v18[6] = v19;
      [v16 enumerateObjectsUsingBlock:v18];
      id v6 = (id)v22[5];
      _Block_object_dispose(v19, 8);
      _Block_object_dispose(&v21, 8);
    }
  }
  else
  {
    id v6 = 0;
  }

LABEL_13:

  return v6;
}

void __48__CUIKUserActivityCalendarEvent_eventFromStore___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 startDate];
  if ([v3 isEqualToDate:*(void *)(a1 + 32)])
  {
    id v4 = [v7 title];
    int v5 = [v4 isEqualToString:*(void *)(a1 + 40)];

    id v6 = v7;
    if (!v5) {
      goto LABEL_6;
    }
    [*(id *)(a1 + 48) addObject:v7];
  }
  else
  {
  }
  id v6 = v7;
LABEL_6:
}

void __48__CUIKUserActivityCalendarEvent_eventFromStore___block_invoke_92(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  double v8 = (void *)a1[4];
  id v18 = v7;
  uint64_t v9 = [v7 calendar];
  uint64_t v10 = [v9 source];
  uint64_t v11 = [v8 isMatchForSource:v10];

  if (v11 == 2)
  {
    uint64_t v15 = *(void *)(a1[6] + 8);
    uint64_t v16 = *(void *)(a1[5] + 8);
    uint64_t v17 = *(void **)(v16 + 40);
    if (*(unsigned char *)(v15 + 24))
    {
      if (v17)
      {
        *(void *)(v16 + 40) = 0;
      }
    }
    else if (!v17)
    {
      *(unsigned char *)(v15 + 24) = 1;
      goto LABEL_6;
    }
  }
  else
  {
    if (v11 != 1) {
      goto LABEL_13;
    }
    uint64_t v12 = *(void *)(a1[5] + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    uint64_t v14 = *(void *)(a1[6] + 8);
    if (!v13 || *(unsigned char *)(v14 + 24))
    {
      *(unsigned char *)(v14 + 24) = 0;
LABEL_6:
      objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
      goto LABEL_13;
    }
    *(void *)(v12 + 40) = 0;

    *a4 = 1;
  }
LABEL_13:
}

- (void)updateActivity:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CUIKUserActivityCalendarEvent;
  [(CUIKUserActivity *)&v13 updateActivity:v4];
  int v5 = [v4 contentAttributeSet];
  id v6 = (void *)[v5 copy];

  if (!v6)
  {
    id v7 = objc_alloc((Class)EKWeakLinkClass());
    double v8 = [v4 activityType];
    id v6 = (void *)[v7 initWithItemContentType:v8];
  }
  [v6 setStartDate:self->_startDate];
  [v6 setEndDate:self->_endDate];
  [v6 setNamedLocation:self->_location];
  [v6 setRelatedUniqueIdentifier:self->_relatedUniqueIdentifier];
  [v4 setContentAttributeSet:v6];
  if ([(CUIKUserActivityWithSource *)self _supportsConsistentExternalIDAcrossDevices])
  {
    externalID = self->_externalID;
    if (externalID)
    {
      uint64_t v10 = NSString;
      [(NSDate *)self->_startDate timeIntervalSinceReferenceDate];
      uint64_t v12 = [v10 stringWithFormat:@"%@.%f", externalID, v11];
      [v4 setPersistentIdentifier:v12];
    }
  }
}

- (NSString)title
{
  return self->_title;
}

- (unint64_t)view
{
  return self->_view;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_externalID, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end