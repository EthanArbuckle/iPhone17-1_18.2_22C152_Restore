@interface CUIKUserActivityNewEvent
- (BOOL)allDay;
- (CUIKUserActivityNewEvent)eventWithEventStore:(id)a3;
- (CUIKUserActivityNewEvent)initWithDictionary:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)location;
- (NSString)notes;
- (NSString)title;
- (NSTimeZone)timeZone;
- (NSURL)url;
- (id)dictionary;
- (void)setAllDay:(BOOL)a3;
- (void)setEndDate:(id)a3;
- (void)setLocation:(id)a3;
- (void)setNotes:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation CUIKUserActivityNewEvent

- (CUIKUserActivityNewEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)CUIKUserActivityNewEvent;
  v5 = [(CUIKUserActivity *)&v49 initWithDictionary:v4];
  if (!v5) {
    goto LABEL_17;
  }
  char v48 = 0;
  uint64_t v6 = [(id)objc_opt_class() _stringFromDictionary:v4 key:@"com.apple.calendarUIKit.userActivity.title" error:&v48];
  title = v5->_title;
  v5->_title = (NSString *)v6;

  if (!v48)
  {
    [(id)objc_opt_class() _doubleFromDictionary:v4 key:@"com.apple.calendarUIKit.userActivity.startDate" error:&v48];
    if (v48)
    {
      v8 = +[CUIKLogSubsystem continuity];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[CUIKUserActivityNewEvent initWithDictionary:](v8, v17, v18, v19, v20, v21, v22, v23);
      }
      goto LABEL_11;
    }
    uint64_t v24 = [objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:v16];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v24;

    [(id)objc_opt_class() _doubleFromDictionary:v4 key:@"com.apple.calendarUIKit.userActivity.endDate" error:&v48];
    if (v48)
    {
      v8 = +[CUIKLogSubsystem continuity];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[CUIKUserActivityNewEvent initWithDictionary:](v8, v27, v28, v29, v30, v31, v32, v33);
      }
      goto LABEL_11;
    }
    uint64_t v35 = [objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:v26];
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v35;

    v5->_allDay = [(id)objc_opt_class() _BOOLFromDictionary:v4 key:@"com.apple.calendarUIKit.userActivity.allDay" error:0];
    uint64_t v37 = [(id)objc_opt_class() _stringFromDictionary:v4 key:@"com.apple.calendarUIKit.userActivity.location" error:0];
    location = v5->_location;
    v5->_location = (NSString *)v37;

    uint64_t v39 = [(id)objc_opt_class() _stringFromDictionary:v4 key:@"com.apple.calendarUIKit.userActivity.notes" error:0];
    notes = v5->_notes;
    v5->_notes = (NSString *)v39;

    v41 = [(id)objc_opt_class() _stringFromDictionary:v4 key:@"com.apple.calendarUIKit.userActivity.timeZone" error:0];
    if (v41)
    {
      uint64_t v42 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:v41];
      timeZone = v5->_timeZone;
      v5->_timeZone = (NSTimeZone *)v42;
    }
    v44 = [(id)objc_opt_class() _stringFromDictionary:v4 key:@"com.apple.calendarUIKit.userActivity.url" error:0];
    if (v44)
    {
      uint64_t v45 = [MEMORY[0x1E4F1CB10] URLWithString:v44];
      url = v5->_url;
      v5->_url = (NSURL *)v45;
    }
LABEL_17:
    v34 = v5;
    goto LABEL_18;
  }
  v8 = +[CUIKLogSubsystem continuity];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[CUIKUserActivityNewEvent initWithDictionary:](v8, v9, v10, v11, v12, v13, v14, v15);
  }
LABEL_11:

  v34 = 0;
LABEL_18:

  return v34;
}

- (CUIKUserActivityNewEvent)eventWithEventStore:(id)a3
{
  id v4 = [MEMORY[0x1E4F25538] eventWithEventStore:a3];
  v5 = [(CUIKUserActivityNewEvent *)self startDate];
  [v4 setStartDate:v5];

  uint64_t v6 = [(CUIKUserActivityNewEvent *)self endDate];
  [v4 setEndDateUnadjustedForLegacyClients:v6];

  v7 = [(CUIKUserActivityNewEvent *)self timeZone];
  [v4 setTimeZone:v7];

  objc_msgSend(v4, "setAllDay:", -[CUIKUserActivityNewEvent allDay](self, "allDay"));
  v8 = [(CUIKUserActivityNewEvent *)self title];
  [v4 setTitle:v8];

  uint64_t v9 = [(CUIKUserActivityNewEvent *)self url];
  [v4 setURL:v9];

  uint64_t v10 = [(CUIKUserActivityNewEvent *)self notes];
  [v4 setNotes:v10];

  uint64_t v11 = [(CUIKUserActivityNewEvent *)self location];
  [v4 setLocation:v11];

  return (CUIKUserActivityNewEvent *)v4;
}

- (id)dictionary
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v15.receiver = self;
  v15.super_class = (Class)CUIKUserActivityNewEvent;
  id v4 = [(CUIKUserActivity *)&v15 dictionary];
  v5 = (void *)[v3 initWithDictionary:v4];

  uint64_t v6 = [(CUIKUserActivityNewEvent *)self startDate];
  [v5 setObject:v6 forKeyedSubscript:@"com.apple.calendarUIKit.userActivity.startDate"];

  v7 = [(CUIKUserActivityNewEvent *)self endDate];
  [v5 setObject:v7 forKeyedSubscript:@"com.apple.calendarUIKit.userActivity.endDate"];

  v8 = [(CUIKUserActivityNewEvent *)self timeZone];
  [v5 setObject:v8 forKeyedSubscript:@"com.apple.calendarUIKit.userActivity.timeZone"];

  uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[CUIKUserActivityNewEvent allDay](self, "allDay"));
  [v5 setObject:v9 forKeyedSubscript:@"com.apple.calendarUIKit.userActivity.allDay"];

  uint64_t v10 = [(CUIKUserActivityNewEvent *)self title];
  [v5 setObject:v10 forKeyedSubscript:@"com.apple.calendarUIKit.userActivity.title"];

  uint64_t v11 = [(CUIKUserActivityNewEvent *)self url];
  [v5 setObject:v11 forKeyedSubscript:@"com.apple.calendarUIKit.userActivity.url"];

  uint64_t v12 = [(CUIKUserActivityNewEvent *)self notes];
  [v5 setObject:v12 forKeyedSubscript:@"com.apple.calendarUIKit.userActivity.notes"];

  uint64_t v13 = [(CUIKUserActivityNewEvent *)self location];
  [v5 setObject:v13 forKeyedSubscript:@"com.apple.calendarUIKit.userActivity.location"];

  return v5;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setEndDate:(id)a3
{
}

- (NSTimeZone)timeZone
{
  return (NSTimeZone *)objc_getProperty(self, a2, 72, 1);
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

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTitle:(id)a3
{
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 88, 1);
}

- (void)setUrl:(id)a3
{
}

- (NSString)notes
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setNotes:(id)a3
{
}

- (NSString)location
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setLocation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

- (void)initWithDictionary:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDictionary:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDictionary:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end