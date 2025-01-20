@interface EKAutocompleteSearchResult
+ (id)_copyAlarmsForAutocompleteFromResult:(id)a3;
- (BOOL)allDay;
- (BOOL)approximateTime;
- (BOOL)isDifferentEnoughFromInitialEvent:(id)a3 consideringTimeProperties:(BOOL)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReminder;
- (CGColor)calendarColor;
- (EKAutocompleteSearchResult)initWithSource:(unint64_t)a3;
- (EKCalendar)calendar;
- (EKStructuredLocation)clientLocation;
- (EKStructuredLocation)preferredLocation;
- (EKStructuredLocation)structuredLocation;
- (EKStructuredLocation)travelStartLocation;
- (EKSuggestedEventInfo)suggestionInfo;
- (NSArray)alarms;
- (NSArray)attendees;
- (NSArray)pasteboardResults;
- (NSData)localStructuredData;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)descriptionForDebugging;
- (NSString)displayLocation;
- (NSString)displayLocationWithoutPrediction;
- (NSString)foundInBundleID;
- (NSString)notes;
- (NSString)title;
- (NSTimeZone)timeZone;
- (NSURL)URL;
- (double)travelTime;
- (id)_attendeesForSuggestedEventFromAttendees:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)eventRepresentingSelf;
- (int64_t)availability;
- (int64_t)privacyLevel;
- (unint64_t)hash;
- (unint64_t)source;
- (void)dealloc;
- (void)setAlarms:(id)a3;
- (void)setAllDay:(BOOL)a3;
- (void)setApproximateTime:(BOOL)a3;
- (void)setAttendees:(id)a3;
- (void)setAvailability:(int64_t)a3;
- (void)setCalendar:(id)a3;
- (void)setCalendarColor:(CGColor *)a3;
- (void)setClientLocation:(id)a3;
- (void)setDisplayLocation:(id)a3;
- (void)setDisplayLocationWithoutPrediction:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setFoundInBundleID:(id)a3;
- (void)setLocalStructuredData:(id)a3;
- (void)setNotes:(id)a3;
- (void)setPasteboardResults:(id)a3;
- (void)setPrivacyLevel:(int64_t)a3;
- (void)setStartDate:(id)a3;
- (void)setStructuredLocation:(id)a3;
- (void)setSuggestionInfo:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTravelStartLocation:(id)a3;
- (void)setTravelTime:(double)a3;
- (void)setURL:(id)a3;
- (void)updateEventFromSelf:(id)a3 updateTimeProperties:(BOOL)a4 updateTravelTimeProperties:(BOOL)a5 updateMode:(unint64_t)a6 overrideCalendar:(id)a7;
- (void)updateSelfFromEvent:(id)a3;
@end

@implementation EKAutocompleteSearchResult

- (EKAutocompleteSearchResult)initWithSource:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)EKAutocompleteSearchResult;
  result = [(EKAutocompleteSearchResult *)&v5 init];
  if (result) {
    result->_source = a3;
  }
  return result;
}

- (void)dealloc
{
  CGColorRelease(self->_calendarColor);
  v3.receiver = self;
  v3.super_class = (Class)EKAutocompleteSearchResult;
  [(EKAutocompleteSearchResult *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(EKAutocompleteSearchResult *)self title];
    v7 = [v5 title];
    if (CalEqualObjects()
      && (int v8 = -[EKAutocompleteSearchResult allDay](self, "allDay"), v8 == [v5 allDay]))
    {
      v10 = [(EKAutocompleteSearchResult *)self calendar];
      v11 = [v5 calendar];
      if (CalEqualObjects())
      {
        v12 = [(EKAutocompleteSearchResult *)self startDate];
        v13 = [v5 startDate];
        if (CalEqualObjects())
        {
          v16 = [(EKAutocompleteSearchResult *)self endDate];
          v14 = [v5 endDate];
          char v9 = CalEqualObjects();
        }
        else
        {
          char v9 = 0;
        }
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v2 = [(EKAutocompleteSearchResult *)self title];
  objc_super v3 = [v2 trimWhiteSpace];
  id v4 = [v3 lowercaseString];
  unint64_t v5 = [v4 hash];

  return v5;
}

- (NSString)descriptionForDebugging
{
  id v3 = objc_alloc(MEMORY[0x1E4F576E8]);
  v29.receiver = self;
  v29.super_class = (Class)EKAutocompleteSearchResult;
  id v4 = [(EKAutocompleteSearchResult *)&v29 description];
  unint64_t v5 = (void *)[v3 initWithSuperclassDescription:v4];

  unint64_t v6 = [(EKAutocompleteSearchResult *)self source];
  unint64_t v7 = [(EKAutocompleteSearchResult *)self source] - 1;
  if (v7 > 3) {
    int v8 = @"Historical";
  }
  else {
    int v8 = off_1E5B97218[v7];
  }
  [v5 setKey:@"source" withEnumNumericalValue:v6 andStringValue:v8];
  char v9 = [(EKAutocompleteSearchResult *)self title];
  [v5 setKey:@"title" withString:v9];

  v10 = [(EKAutocompleteSearchResult *)self startDate];
  [v5 setKey:@"startDate" withDate:v10];

  v11 = [(EKAutocompleteSearchResult *)self endDate];
  [v5 setKey:@"endDate" withDate:v11];

  v12 = [(EKAutocompleteSearchResult *)self timeZone];
  [v5 setKey:@"timeZone" withObject:v12];

  objc_msgSend(v5, "setKey:withBoolean:", @"allDay", -[EKAutocompleteSearchResult allDay](self, "allDay"));
  v13 = [(EKAutocompleteSearchResult *)self clientLocation];
  [v5 setKey:@"clientLocation" withObject:v13];

  v14 = [(EKAutocompleteSearchResult *)self structuredLocation];
  [v5 setKey:@"structuredLocation" withObject:v14];

  v15 = [(EKAutocompleteSearchResult *)self alarms];
  [v5 setKey:@"alarms" withArray:v15];

  v16 = [(EKAutocompleteSearchResult *)self attendees];
  [v5 setKey:@"attendees" withArray:v16];

  v17 = [(EKAutocompleteSearchResult *)self URL];
  [v5 setKey:@"URL" withObject:v17];

  v18 = [(EKAutocompleteSearchResult *)self notes];
  [v5 setKey:@"notes" withString:v18];

  v19 = [(EKAutocompleteSearchResult *)self calendar];
  [v5 setKey:@"calendar" withObject:v19];

  [(EKAutocompleteSearchResult *)self travelTime];
  objc_msgSend(v5, "setKey:withTimeInterval:", @"travelTime");
  v20 = [(EKAutocompleteSearchResult *)self travelStartLocation];
  [v5 setKey:@"travelStartLocation" withObject:v20];

  v21 = [(EKAutocompleteSearchResult *)self suggestionInfo];
  [v5 setKey:@"suggestionInfo" withObject:v21];

  objc_msgSend(v5, "setKey:withEnumNumericalValue:andStringValue:", @"privacyLevel", -[EKAutocompleteSearchResult privacyLevel](self, "privacyLevel"), 0);
  objc_msgSend(v5, "setKey:withEnumNumericalValue:andStringValue:", @"availability", -[EKAutocompleteSearchResult availability](self, "availability"), 0);
  v22 = [(EKAutocompleteSearchResult *)self localStructuredData];
  [v5 setKey:@"localStructuredData" withObject:v22];

  objc_msgSend(v5, "setKey:withCGColor:", @"calendarColor", -[EKAutocompleteSearchResult calendarColor](self, "calendarColor"));
  v23 = [(EKAutocompleteSearchResult *)self foundInBundleID];
  [v5 setKey:@"foundInBundleID" withString:v23];

  v24 = [(EKAutocompleteSearchResult *)self displayLocation];
  [v5 setKey:@"displayLocation" withString:v24];

  v25 = [(EKAutocompleteSearchResult *)self displayLocationWithoutPrediction];
  [v5 setKey:@"displayLocationWithoutPrediction" withString:v25];

  v26 = [(EKAutocompleteSearchResult *)self pasteboardResults];
  [v5 setKey:@"pasteboardResults" withArray:v26];

  v27 = [v5 build];

  return (NSString *)v27;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[EKAutocompleteSearchResult alloc] initWithSource:[(EKAutocompleteSearchResult *)self source]];
  unint64_t v5 = [(EKAutocompleteSearchResult *)self title];
  [(EKAutocompleteSearchResult *)v4 setTitle:v5];

  unint64_t v6 = [(EKAutocompleteSearchResult *)self startDate];
  [(EKAutocompleteSearchResult *)v4 setStartDate:v6];

  unint64_t v7 = [(EKAutocompleteSearchResult *)self endDate];
  [(EKAutocompleteSearchResult *)v4 setEndDate:v7];

  int v8 = [(EKAutocompleteSearchResult *)self timeZone];
  [(EKAutocompleteSearchResult *)v4 setTimeZone:v8];

  [(EKAutocompleteSearchResult *)v4 setAllDay:[(EKAutocompleteSearchResult *)self allDay]];
  char v9 = [(EKAutocompleteSearchResult *)self clientLocation];
  [(EKAutocompleteSearchResult *)v4 setClientLocation:v9];

  v10 = [(EKAutocompleteSearchResult *)self structuredLocation];
  [(EKAutocompleteSearchResult *)v4 setStructuredLocation:v10];

  v11 = [(EKAutocompleteSearchResult *)self alarms];
  [(EKAutocompleteSearchResult *)v4 setAlarms:v11];

  v12 = [(EKAutocompleteSearchResult *)self attendees];
  [(EKAutocompleteSearchResult *)v4 setAttendees:v12];

  v13 = [(EKAutocompleteSearchResult *)self URL];
  [(EKAutocompleteSearchResult *)v4 setURL:v13];

  v14 = [(EKAutocompleteSearchResult *)self notes];
  [(EKAutocompleteSearchResult *)v4 setNotes:v14];

  v15 = [(EKAutocompleteSearchResult *)self calendar];
  [(EKAutocompleteSearchResult *)v4 setCalendar:v15];

  [(EKAutocompleteSearchResult *)self travelTime];
  -[EKAutocompleteSearchResult setTravelTime:](v4, "setTravelTime:");
  v16 = [(EKAutocompleteSearchResult *)self travelStartLocation];
  [(EKAutocompleteSearchResult *)v4 setTravelStartLocation:v16];

  v17 = [(EKAutocompleteSearchResult *)self suggestionInfo];
  [(EKAutocompleteSearchResult *)v4 setSuggestionInfo:v17];

  [(EKAutocompleteSearchResult *)v4 setPrivacyLevel:[(EKAutocompleteSearchResult *)self privacyLevel]];
  [(EKAutocompleteSearchResult *)v4 setAvailability:[(EKAutocompleteSearchResult *)self availability]];
  v18 = [(EKAutocompleteSearchResult *)self localStructuredData];
  [(EKAutocompleteSearchResult *)v4 setLocalStructuredData:v18];

  [(EKAutocompleteSearchResult *)v4 setCalendarColor:[(EKAutocompleteSearchResult *)self calendarColor]];
  v19 = [(EKAutocompleteSearchResult *)self foundInBundleID];
  [(EKAutocompleteSearchResult *)v4 setFoundInBundleID:v19];

  v20 = [(EKAutocompleteSearchResult *)self displayLocation];
  [(EKAutocompleteSearchResult *)v4 setDisplayLocation:v20];

  v21 = [(EKAutocompleteSearchResult *)self displayLocationWithoutPrediction];
  [(EKAutocompleteSearchResult *)v4 setDisplayLocationWithoutPrediction:v21];

  v22 = [(EKAutocompleteSearchResult *)self pasteboardResults];
  [(EKAutocompleteSearchResult *)v4 setPasteboardResults:v22];

  return v4;
}

- (void)setCalendarColor:(CGColor *)a3
{
  calendarColor = self->_calendarColor;
  if (calendarColor != a3)
  {
    CGColorRelease(calendarColor);
    self->_calendarColor = CGColorRetain(a3);
  }
}

- (id)_attendeesForSuggestedEventFromAttendees:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isCurrentUser", (void)v17) & 1) == 0)
        {
          v11 = [v10 name];
          v12 = [v10 URL];
          v13 = +[EKAttendee attendeeWithName:v11 url:v12];

          objc_msgSend(v13, "setParticipantType:", objc_msgSend(v10, "participantType"));
          v14 = [v10 emailAddress];
          [v13 setEmailAddress:v14];

          v15 = [v10 phoneNumber];
          [v13 setPhoneNumber:v15];

          [v4 addObject:v13];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void)setAttendees:(id)a3
{
  id v4 = [(EKAutocompleteSearchResult *)self _attendeesForSuggestedEventFromAttendees:a3];
  attendees = self->_attendees;
  self->_attendees = v4;

  MEMORY[0x1F41817F8](v4, attendees);
}

- (EKStructuredLocation)preferredLocation
{
  id v3 = [(EKAutocompleteSearchResult *)self clientLocation];
  id v4 = [(EKAutocompleteSearchResult *)self structuredLocation];
  id v5 = +[EKCalendarItem preferredLocationWithClientLocation:v3 structuredLocation:v4];

  return (EKStructuredLocation *)v5;
}

- (void)updateSelfFromEvent:(id)a3
{
  id v35 = a3;
  id v4 = [(EKAutocompleteSearchResult *)self title];

  if (!v4)
  {
    id v5 = [v35 title];
    [(EKAutocompleteSearchResult *)self setTitle:v5];
  }
  uint64_t v6 = [(EKAutocompleteSearchResult *)self startDate];

  if (!v6)
  {
    uint64_t v7 = [v35 startDate];
    [(EKAutocompleteSearchResult *)self setStartDate:v7];
  }
  uint64_t v8 = [(EKAutocompleteSearchResult *)self endDate];

  if (!v8)
  {
    char v9 = [v35 endDateUnadjustedForLegacyClients];
    [(EKAutocompleteSearchResult *)self setEndDate:v9];
  }
  v10 = [(EKAutocompleteSearchResult *)self timeZone];

  if (!v10)
  {
    v11 = [v35 timeZone];
    [(EKAutocompleteSearchResult *)self setTimeZone:v11];
  }
  v12 = [(EKAutocompleteSearchResult *)self clientLocation];
  if (v12) {
    goto LABEL_12;
  }
  v12 = [(EKAutocompleteSearchResult *)self structuredLocation];
  if (v12) {
    goto LABEL_12;
  }
  v12 = [(EKAutocompleteSearchResult *)self displayLocation];
  if (v12) {
    goto LABEL_12;
  }
  v31 = [(EKAutocompleteSearchResult *)self displayLocationWithoutPrediction];

  if (!v31)
  {
    v32 = [v35 clientLocation];
    [(EKAutocompleteSearchResult *)self setClientLocation:v32];

    v33 = [v35 structuredLocation];
    [(EKAutocompleteSearchResult *)self setStructuredLocation:v33];

    v34 = [v35 location];
    [(EKAutocompleteSearchResult *)self setDisplayLocation:v34];

    v12 = [v35 locationWithoutPrediction];
    [(EKAutocompleteSearchResult *)self setDisplayLocationWithoutPrediction:v12];
LABEL_12:
  }
  v13 = [(EKAutocompleteSearchResult *)self alarms];
  uint64_t v14 = [v13 count];

  if (!v14)
  {
    v15 = [v35 alarms];
    [(EKAutocompleteSearchResult *)self setAlarms:v15];
  }
  v16 = [(EKAutocompleteSearchResult *)self attendees];
  uint64_t v17 = [v16 count];

  if (!v17)
  {
    long long v18 = [v35 attendeesNotIncludingOrganizer];
    [(EKAutocompleteSearchResult *)self setAttendees:v18];
  }
  long long v19 = [(EKAutocompleteSearchResult *)self URL];
  if (!v19)
  {
    if ([v35 isBirthday]) {
      goto LABEL_21;
    }
    long long v19 = [v35 URL];
    [(EKAutocompleteSearchResult *)self setURL:v19];
  }

LABEL_21:
  long long v20 = [(EKAutocompleteSearchResult *)self notes];

  if (!v20)
  {
    v21 = [v35 notes];
    [(EKAutocompleteSearchResult *)self setNotes:v21];
  }
  uint64_t v22 = [(EKAutocompleteSearchResult *)self calendar];

  if (!v22)
  {
    v23 = [v35 calendar];
    [(EKAutocompleteSearchResult *)self setCalendar:v23];
  }
  if (![(EKAutocompleteSearchResult *)self calendarColor])
  {
    v24 = [v35 calendar];
    -[EKAutocompleteSearchResult setCalendarColor:](self, "setCalendarColor:", [v24 CGColor]);
  }
  v25 = [(EKAutocompleteSearchResult *)self suggestionInfo];

  if (!v25)
  {
    v26 = [v35 suggestionInfo];
    [(EKAutocompleteSearchResult *)self setSuggestionInfo:v26];
  }
  v27 = [(EKAutocompleteSearchResult *)self foundInBundleID];
  if (v27) {
    goto LABEL_30;
  }
  v30 = [v35 suggestionInfo];

  if (v30)
  {
    v27 = [v35 localCustomObjectForKey:@"SuggestionsOriginBundleId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(EKAutocompleteSearchResult *)self setFoundInBundleID:v27];
    }
LABEL_30:
  }
  -[EKAutocompleteSearchResult setPrivacyLevel:](self, "setPrivacyLevel:", [v35 privacyLevel]);
  -[EKAutocompleteSearchResult setAvailability:](self, "setAvailability:", [v35 availability]);
  v28 = [(EKAutocompleteSearchResult *)self localStructuredData];

  if (!v28)
  {
    objc_super v29 = [v35 localStructuredData];
    [(EKAutocompleteSearchResult *)self setLocalStructuredData:v29];
  }
}

- (void)updateEventFromSelf:(id)a3 updateTimeProperties:(BOOL)a4 updateTravelTimeProperties:(BOOL)a5 updateMode:(unint64_t)a6 overrideCalendar:(id)a7
{
  BOOL v8 = a5;
  BOOL v9 = a4;
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a7;
  v13 = [(EKAutocompleteSearchResult *)self title];
  [v11 setTitle:v13];

  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [(EKAutocompleteSearchResult *)self calendar];
  }
  id v15 = v14;
  if ([v11 canMoveToCalendar:v14 error:0]) {
    [v11 setCalendar:v15];
  }
  v66 = v15;
  if (v9)
  {
    v16 = [(EKAutocompleteSearchResult *)self timeZone];
    [v11 setTimeZone:v16];

    if ([v11 changingAllDayPropertyIsAllowed]) {
      objc_msgSend(v11, "setAllDay:", -[EKAutocompleteSearchResult allDay](self, "allDay"));
    }
    uint64_t v17 = [(EKAutocompleteSearchResult *)self startDate];
    [v11 setStartDate:v17];

    long long v18 = [(EKAutocompleteSearchResult *)self endDate];
    [v11 setEndDateUnadjustedForLegacyClients:v18];
  }
  v69 = v11;
  if (v8)
  {
    [(EKAutocompleteSearchResult *)self travelTime];
    objc_msgSend(v11, "setTravelTime:");
    long long v19 = [(EKAutocompleteSearchResult *)self travelStartLocation];
    long long v20 = [v19 duplicate];
    [v11 setTravelStartLocation:v20];
  }
  v21 = [(EKAutocompleteSearchResult *)self structuredLocation];
  if (v21)
  {

    unint64_t v22 = a6;
  }
  else
  {
    v23 = [(EKAutocompleteSearchResult *)self clientLocation];

    unint64_t v22 = a6;
    if (!v23) {
      goto LABEL_20;
    }
  }
  if (!v22) {
    goto LABEL_18;
  }
  v24 = [v11 structuredLocation];
  if (v24)
  {
LABEL_19:

    goto LABEL_20;
  }
  v25 = [v11 clientLocation];

  if (!v25)
  {
LABEL_18:
    v26 = [(EKAutocompleteSearchResult *)self structuredLocation];
    v27 = [v26 duplicate];
    [v11 setStructuredLocation:v27];

    v24 = [(EKAutocompleteSearchResult *)self clientLocation];
    v28 = [v24 duplicate];
    [v11 setClientLocation:v28];

    goto LABEL_19;
  }
LABEL_20:
  objc_super v29 = [(EKAutocompleteSearchResult *)self notes];
  uint64_t v30 = [v29 length];

  if (v30)
  {
    if (!v22
      || ([v11 notes],
          v31 = objc_claimAutoreleasedReturnValue(),
          uint64_t v32 = [v31 length],
          v31,
          !v32))
    {
      v33 = [(EKAutocompleteSearchResult *)self notes];
      [v11 setNotes:v33];
    }
  }
  v34 = [(EKAutocompleteSearchResult *)self URL];

  if (v34)
  {
    if (!v22 || ([v11 URL], id v35 = objc_claimAutoreleasedReturnValue(), v35, !v35))
    {
      v36 = [(EKAutocompleteSearchResult *)self URL];
      [v11 setURL:v36];
    }
  }
  v37 = [(EKAutocompleteSearchResult *)self attendees];
  uint64_t v38 = [v37 count];

  if (v38)
  {
    if (!v22)
    {
      v53 = [(EKAutocompleteSearchResult *)self attendees];
      v52 = v11;
      [v11 setAttendees:v53];

LABEL_46:
      objc_msgSend(v52, "setPrivacyLevel:", -[EKAutocompleteSearchResult privacyLevel](self, "privacyLevel"));
      goto LABEL_47;
    }
    id v65 = v12;
    v39 = v11;
    v40 = [v11 attendees];
    v68 = [v40 valueForKey:@"URL"];

    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    v64 = self;
    v41 = [(EKAutocompleteSearchResult *)self attendees];
    uint64_t v42 = [v41 countByEnumeratingWithState:&v74 objects:v79 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v75;
      do
      {
        for (uint64_t i = 0; i != v43; ++i)
        {
          if (*(void *)v75 != v44) {
            objc_enumerationMutation(v41);
          }
          v46 = *(void **)(*((void *)&v74 + 1) + 8 * i);
          v47 = [v46 URL];
          v48 = [v39 calendar];
          v49 = [v48 ownerIdentityAddress];
          if ([v47 isEqual:v49])
          {

            v39 = v69;
          }
          else
          {
            v50 = [v46 URL];
            char v51 = [v68 containsObject:v50];

            v39 = v69;
            if ((v51 & 1) == 0) {
              [v69 addAttendee:v46];
            }
          }
        }
        uint64_t v43 = [v41 countByEnumeratingWithState:&v74 objects:v79 count:16];
      }
      while (v43);
    }

    self = v64;
    id v12 = v65;
    unint64_t v22 = a6;
  }
  v52 = v69;
  if (!v22 || ([v69 isPrivacySet] & 1) == 0) {
    goto LABEL_46;
  }
LABEL_47:
  objc_msgSend(v52, "setAvailability:", -[EKAutocompleteSearchResult availability](self, "availability"));
  if (v22)
  {
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    v54 = [(EKAutocompleteSearchResult *)self alarms];
    uint64_t v55 = [v54 countByEnumeratingWithState:&v70 objects:v78 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      uint64_t v57 = *(void *)v71;
      do
      {
        for (uint64_t j = 0; j != v56; ++j)
        {
          if (*(void *)v71 != v57) {
            objc_enumerationMutation(v54);
          }
          v59 = *(void **)(*((void *)&v70 + 1) + 8 * j);
          if (([v59 isDefaultAlarm] & 1) == 0)
          {
            v60 = [v59 duplicate];
            [v52 addAlarm:v60];
          }
        }
        uint64_t v56 = [v54 countByEnumeratingWithState:&v70 objects:v78 count:16];
      }
      while (v56);
    }
    goto LABEL_62;
  }
  if (![(EKAutocompleteSearchResult *)self source]
    || [(EKAutocompleteSearchResult *)self source] == 3
    || [(EKAutocompleteSearchResult *)self source] == 4)
  {
    v54 = (void *)[(id)objc_opt_class() _copyAlarmsForAutocompleteFromResult:self];
    [v52 setAlarms:v54];
LABEL_62:
  }
  v61 = [(EKAutocompleteSearchResult *)self suggestionInfo];
  v62 = [v61 duplicate];
  [v52 setSuggestionInfo:v62];

  v63 = [(EKAutocompleteSearchResult *)self localStructuredData];
  [v52 setLocalStructuredData:v63];
}

- (id)eventRepresentingSelf
{
  id v3 = [(EKAutocompleteSearchResult *)self calendar];
  id v4 = [v3 eventStore];
  id v5 = +[EKEvent eventWithEventStore:v4];

  uint64_t v6 = [(EKAutocompleteSearchResult *)self calendar];
  [v5 setCalendar:v6];

  [(EKAutocompleteSearchResult *)self updateEventFromSelf:v5 updateTimeProperties:1 updateTravelTimeProperties:0 updateMode:0 overrideCalendar:0];

  return v5;
}

+ (id)_copyAlarmsForAutocompleteFromResult:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v5 = [v3 alarms];
  uint64_t v6 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = objc_msgSend(v3, "alarms", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (([v12 isDefaultAlarm] & 1) == 0)
        {
          v13 = [v12 duplicate];
          [v6 addObject:v13];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v6;
}

- (BOOL)isDifferentEnoughFromInitialEvent:(id)a3 consideringTimeProperties:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = [(EKAutocompleteSearchResult *)self clientLocation];
  uint64_t v8 = [v6 clientLocation];
  if (!CalEqualObjects()) {
    goto LABEL_27;
  }
  uint64_t v9 = [(EKAutocompleteSearchResult *)self structuredLocation];
  uint64_t v10 = [v6 structuredLocation];
  if (CalEqualObjects())
  {
    id v11 = [(EKAutocompleteSearchResult *)self notes];
    id v12 = [v6 notes];
    if (CalEqualObjects())
    {
      uint64_t v13 = [(EKAutocompleteSearchResult *)self calendar];
      v39 = [v6 calendar];
      v40 = (void *)v13;
      if (CalEqualObjects())
      {
        v36 = v11;
        uint64_t v14 = [(EKAutocompleteSearchResult *)self attendees];
        v37 = [v6 attendees];
        uint64_t v38 = (void *)v14;
        if (CalEqualObjects())
        {
          uint64_t v15 = [(EKAutocompleteSearchResult *)self URL];
          v34 = [v6 URL];
          id v35 = (void *)v15;
          if (CalEqualObjects()
            && (int64_t v16 = [(EKAutocompleteSearchResult *)self privacyLevel],
                v16 == [v6 privacyLevel])
            && (int64_t v17 = [(EKAutocompleteSearchResult *)self availability],
                v17 == [v6 availability]))
          {
            uint64_t v18 = [(EKAutocompleteSearchResult *)self suggestionInfo];
            uint64_t v32 = [v6 suggestionInfo];
            v33 = (void *)v18;
            if (CalEqualObjects())
            {
              uint64_t v19 = [(EKAutocompleteSearchResult *)self localStructuredData];
              uint64_t v30 = [v6 localStructuredData];
              v31 = (void *)v19;
              id v11 = v36;
              if (CalEqualObjects())
              {
                objc_super v29 = [(EKAutocompleteSearchResult *)self alarms];
                v28 = [v6 alarms];
                int v20 = CalEqualObjects();
              }
              else
              {
                int v20 = 0;
              }
            }
            else
            {
              int v20 = 0;
              id v11 = v36;
            }
          }
          else
          {
            int v20 = 0;
            id v11 = v36;
          }
        }
        else
        {
          int v20 = 0;
          id v11 = v36;
        }
      }
      else
      {
        int v20 = 0;
      }
    }
    else
    {
      int v20 = 0;
    }
  }
  else
  {
    int v20 = 0;
  }

  LOBYTE(v21) = !a4 & v20;
  if (a4 && v20)
  {
    uint64_t v7 = [(EKAutocompleteSearchResult *)self startDate];
    uint64_t v8 = [v6 startDate];
    if (CalEqualObjects())
    {
      unint64_t v22 = [(EKAutocompleteSearchResult *)self endDate];
      v23 = [v6 endDateUnadjustedForLegacyClients];
      if (CalEqualObjects())
      {
        v24 = [(EKAutocompleteSearchResult *)self timeZone];
        v25 = [v6 timeZone];
        if (CalEqualObjects())
        {
          BOOL v26 = [(EKAutocompleteSearchResult *)self allDay];
          int v21 = v26 ^ [v6 isAllDay] ^ 1;
        }
        else
        {
          LOBYTE(v21) = 0;
        }
      }
      else
      {
        LOBYTE(v21) = 0;
      }

      goto LABEL_28;
    }
LABEL_27:
    LOBYTE(v21) = 0;
LABEL_28:
  }
  return v21 ^ 1;
}

- (BOOL)isReminder
{
  v2 = [(EKCalendar *)self->_calendar source];
  BOOL v3 = [v2 sourceType] == 6;

  return v3;
}

- (unint64_t)source
{
  return self->_source;
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

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
}

- (BOOL)allDay
{
  return self->_allDay;
}

- (void)setAllDay:(BOOL)a3
{
  self->_allDay = a3;
}

- (EKStructuredLocation)structuredLocation
{
  return self->_structuredLocation;
}

- (void)setStructuredLocation:(id)a3
{
}

- (EKStructuredLocation)clientLocation
{
  return self->_clientLocation;
}

- (void)setClientLocation:(id)a3
{
}

- (NSArray)alarms
{
  return self->_alarms;
}

- (void)setAlarms:(id)a3
{
}

- (NSArray)attendees
{
  return self->_attendees;
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

- (EKCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
}

- (double)travelTime
{
  return self->_travelTime;
}

- (void)setTravelTime:(double)a3
{
  self->_travelTime = a3;
}

- (EKStructuredLocation)travelStartLocation
{
  return self->_travelStartLocation;
}

- (void)setTravelStartLocation:(id)a3
{
}

- (EKSuggestedEventInfo)suggestionInfo
{
  return self->_suggestionInfo;
}

- (void)setSuggestionInfo:(id)a3
{
}

- (int64_t)privacyLevel
{
  return self->_privacyLevel;
}

- (void)setPrivacyLevel:(int64_t)a3
{
  self->_privacyLevel = a3;
}

- (int64_t)availability
{
  return self->_availability;
}

- (void)setAvailability:(int64_t)a3
{
  self->_availability = a3;
}

- (NSData)localStructuredData
{
  return self->_localStructuredData;
}

- (void)setLocalStructuredData:(id)a3
{
}

- (CGColor)calendarColor
{
  return self->_calendarColor;
}

- (NSString)foundInBundleID
{
  return self->_foundInBundleID;
}

- (void)setFoundInBundleID:(id)a3
{
}

- (NSString)displayLocation
{
  return self->_displayLocation;
}

- (void)setDisplayLocation:(id)a3
{
}

- (NSString)displayLocationWithoutPrediction
{
  return self->_displayLocationWithoutPrediction;
}

- (void)setDisplayLocationWithoutPrediction:(id)a3
{
}

- (NSArray)pasteboardResults
{
  return self->_pasteboardResults;
}

- (void)setPasteboardResults:(id)a3
{
}

- (BOOL)approximateTime
{
  return self->_approximateTime;
}

- (void)setApproximateTime:(BOOL)a3
{
  self->_approximateTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pasteboardResults, 0);
  objc_storeStrong((id *)&self->_displayLocationWithoutPrediction, 0);
  objc_storeStrong((id *)&self->_displayLocation, 0);
  objc_storeStrong((id *)&self->_foundInBundleID, 0);
  objc_storeStrong((id *)&self->_localStructuredData, 0);
  objc_storeStrong((id *)&self->_suggestionInfo, 0);
  objc_storeStrong((id *)&self->_travelStartLocation, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_attendees, 0);
  objc_storeStrong((id *)&self->_alarms, 0);
  objc_storeStrong((id *)&self->_clientLocation, 0);
  objc_storeStrong((id *)&self->_structuredLocation, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end