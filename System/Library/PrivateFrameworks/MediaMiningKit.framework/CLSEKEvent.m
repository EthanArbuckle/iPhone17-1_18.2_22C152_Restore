@interface CLSEKEvent
- (BOOL)hasAttendees;
- (BOOL)hasRecurrenceRules;
- (BOOL)isAllDay;
- (BOOL)isBirthday;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSuggestedAndAccepted;
- (BOOL)organizedByMe;
- (CLLocation)geoLocation;
- (CLLocationCoordinate2D)coordinate;
- (CLSEKCalendar)calendar;
- (CLSEKEvent)initWithCoder:(id)a3;
- (CLSEKEvent)initWithEKEvent:(id)a3;
- (CLSEKParticipant)selfAttendee;
- (NSArray)attendees;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)calendarItemIdentifier;
- (NSString)title;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLSEKEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarItemIdentifier, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_selfAttendee, 0);
  objc_storeStrong((id *)&self->_attendees, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (CLLocationCoordinate2D)coordinate
{
  objc_copyStruct(v4, &self->_coordinate, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (BOOL)isSuggestedAndAccepted
{
  return self->_isSuggestedAndAccepted;
}

- (BOOL)hasRecurrenceRules
{
  return self->_hasRecurrenceRules;
}

- (NSString)calendarItemIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (CLSEKCalendar)calendar
{
  return (CLSEKCalendar *)objc_getProperty(self, a2, 56, 1);
}

- (CLSEKParticipant)selfAttendee
{
  return (CLSEKParticipant *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)organizedByMe
{
  return self->_organizedByMe;
}

- (NSArray)attendees
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)hasAttendees
{
  return self->_hasAttendees;
}

- (BOOL)isAllDay
{
  return self->_allDay;
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)isBirthday
{
  return self->_isBirthday;
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)description
{
  double v3 = NSString;
  v4 = [(CLSEKEvent *)self title];
  v5 = [(CLSEKEvent *)self attendees];
  uint64_t v6 = [v5 count];
  v7 = [(CLSEKEvent *)self startDate];
  v8 = [v3 stringWithFormat:@"CLSEKEvent title: %@, number of participants: %zu, start date: %@", v4, v6, v7];

  return v8;
}

- (CLLocation)geoLocation
{
  if (CLLocationCoordinate2DIsValid(self->_coordinate)) {
    double v3 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithLatitude:self->_coordinate.latitude longitude:self->_coordinate.longitude];
  }
  else {
    double v3 = 0;
  }
  return (CLLocation *)v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CLSEKEvent *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = [(CLSEKEvent *)self hash];
      BOOL v6 = v5 == [(CLSEKEvent *)v4 hash];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_calendarItemIdentifier hash];
}

- (void)encodeWithCoder:(id)a3
{
  calendarItemIdentifier = self->_calendarItemIdentifier;
  id v5 = a3;
  [v5 encodeObject:calendarItemIdentifier forKey:@"calendarItemIdentifier"];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeBool:self->_isBirthday forKey:@"isBirthday"];
  [v5 encodeObject:self->_startDate forKey:@"startDate"];
  [v5 encodeObject:self->_endDate forKey:@"endDate"];
  [v5 encodeBool:self->_allDay forKey:@"allDay"];
  [v5 encodeBool:self->_hasAttendees forKey:@"hasAttendees"];
  [v5 encodeObject:self->_attendees forKey:@"attendees"];
  [v5 encodeBool:self->_organizedByMe forKey:@"organizedByMe"];
  [v5 encodeObject:self->_selfAttendee forKey:@"selfAttendee"];
  [v5 encodeObject:self->_calendar forKey:@"calendar"];
  [v5 encodeBool:self->_isSuggestedAndAccepted forKey:@"isSuggestedAndAccepted"];
  [v5 encodeBool:self->_hasRecurrenceRules forKey:@"hasRecurrenceRules"];
  [v5 encodeDouble:@"latitude" forKey:self->_coordinate.latitude];
  [v5 encodeDouble:@"longitude" forKey:self->_coordinate.longitude];
}

- (CLSEKEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CLSEKEvent;
  id v5 = [(CLSEKEvent *)&v27 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"calendarItemIdentifier"];
    calendarItemIdentifier = v5->_calendarItemIdentifier;
    v5->_calendarItemIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v8;

    v5->_isBirthday = [v4 decodeBoolForKey:@"isBirthday"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v12;

    v5->_allDay = [v4 decodeBoolForKey:@"allDay"];
    v5->_hasAttendees = [v4 decodeBoolForKey:@"hasAttendees"];
    v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"attendees"];
    attendees = v5->_attendees;
    v5->_attendees = (NSArray *)v17;

    v5->_organizedByMe = [v4 decodeBoolForKey:@"organizedByMe"];
    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selfAttendee"];
    selfAttendee = v5->_selfAttendee;
    v5->_selfAttendee = (CLSEKParticipant *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"calendar"];
    calendar = v5->_calendar;
    v5->_calendar = (CLSEKCalendar *)v21;

    v5->_isSuggestedAndAccepted = [v4 decodeBoolForKey:@"isSuggestedAndAccepted"];
    v5->_hasRecurrenceRules = [v4 decodeBoolForKey:@"hasRecurrenceRules"];
    [v4 decodeDoubleForKey:@"latitude"];
    CLLocationDegrees v24 = v23;
    [v4 decodeDoubleForKey:@"longitude"];
    v5->_coordinate = CLLocationCoordinate2DMake(v24, v25);
  }

  return v5;
}

- (CLSEKEvent)initWithEKEvent:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)CLSEKEvent;
  id v5 = [(CLSEKEvent *)&v45 init];
  if (v5)
  {
    uint64_t v6 = [v4 calendarItemIdentifier];
    v7 = (void *)*((void *)v5 + 8);
    *((void *)v5 + 8) = v6;

    uint64_t v8 = [v4 title];
    v9 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v8;

    v5[8] = [v4 isBirthday];
    uint64_t v10 = [v4 startDate];
    v11 = (void *)*((void *)v5 + 3);
    *((void *)v5 + 3) = v10;

    uint64_t v12 = [v4 endDate];
    v13 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v12;

    v5[9] = [v4 isAllDay];
    v5[10] = [v4 hasAttendees];
    id v14 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v15 = [v4 attendees];
    v16 = objc_msgSend(v14, "initWithCapacity:", objc_msgSend(v15, "count"));

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v17 = objc_msgSend(v4, "attendees", 0);
    uint64_t v18 = [v17 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v42;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v42 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v41 + 1) + 8 * v21);
          double v23 = (void *)MEMORY[0x1D2602300]();
          CLLocationDegrees v24 = [[CLSEKParticipant alloc] initWithEKParticipant:v22];
          if (v24) {
            [v16 addObject:v24];
          }

          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v19);
    }

    CLLocationDegrees v25 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v16;
    id v26 = v16;

    objc_super v27 = [v4 structuredLocationWithoutPrediction];
    v28 = [v27 geoLocation];

    if (v28)
    {
      [v28 coordinate];
      *((void *)v5 + 9) = v29;
      *((void *)v5 + 10) = v30;
    }
    else
    {
      *(_OWORD *)(v5 + 72) = *MEMORY[0x1E4F1E750];
    }
    v5[11] = [v4 isSelfOrganized];
    v31 = [CLSEKParticipant alloc];
    v32 = [v4 selfAttendee];
    uint64_t v33 = [(CLSEKParticipant *)v31 initWithEKParticipant:v32];
    v34 = (void *)*((void *)v5 + 6);
    *((void *)v5 + 6) = v33;

    v35 = [CLSEKCalendar alloc];
    v36 = [v4 calendar];
    uint64_t v37 = [(CLSEKCalendar *)v35 initWithEKCalendar:v36];
    v38 = (void *)*((void *)v5 + 7);
    *((void *)v5 + 7) = v37;

    v39 = [v4 suggestionInfo];
    v5[13] = v39 != 0;

    v5[12] = [v4 hasRecurrenceRules];
  }

  return (CLSEKEvent *)v5;
}

@end