@interface CALNCalendarResourceChangedNotificationInfo
- (BOOL)allDay;
- (BOOL)isDelegate;
- (CALNCalendarResourceChangedNotificationInfo)initWithSourceClientIdentifier:(id)a3 calendarNotification:(id)a4 changeType:(unsigned int)a5 date:(id)a6 allDay:(BOOL)a7 timeZone:(id)a8 expirationDate:(id)a9 launchURL:(id)a10 isDelegate:(BOOL)a11 sourceTitle:(id)a12 sourceIdentifier:(id)a13;
- (EKCalendarResourceChangeNotification)calendarNotification;
- (NSDate)date;
- (NSDate)expirationDate;
- (NSString)sourceClientIdentifier;
- (NSString)sourceIdentifier;
- (NSString)sourceTitle;
- (NSTimeZone)timeZone;
- (NSURL)launchURL;
- (id)description;
- (unsigned)changeType;
@end

@implementation CALNCalendarResourceChangedNotificationInfo

- (CALNCalendarResourceChangedNotificationInfo)initWithSourceClientIdentifier:(id)a3 calendarNotification:(id)a4 changeType:(unsigned int)a5 date:(id)a6 allDay:(BOOL)a7 timeZone:(id)a8 expirationDate:(id)a9 launchURL:(id)a10 isDelegate:(BOOL)a11 sourceTitle:(id)a12 sourceIdentifier:(id)a13
{
  id v42 = a3;
  id v41 = a4;
  id v18 = a6;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = a12;
  id v23 = a13;
  v43.receiver = self;
  v43.super_class = (Class)CALNCalendarResourceChangedNotificationInfo;
  v24 = [(CALNCalendarResourceChangedNotificationInfo *)&v43 init];
  if (v24)
  {
    uint64_t v25 = [v42 copy];
    sourceClientIdentifier = v24->_sourceClientIdentifier;
    v24->_sourceClientIdentifier = (NSString *)v25;

    objc_storeStrong((id *)&v24->_calendarNotification, a4);
    v24->_changeType = a5;
    uint64_t v27 = [v18 copy];
    date = v24->_date;
    v24->_date = (NSDate *)v27;

    v24->_allDay = a7;
    uint64_t v29 = [v19 copy];
    timeZone = v24->_timeZone;
    v24->_timeZone = (NSTimeZone *)v29;

    uint64_t v31 = [v20 copy];
    expirationDate = v24->_expirationDate;
    v24->_expirationDate = (NSDate *)v31;

    uint64_t v33 = [v21 copy];
    launchURL = v24->_launchURL;
    v24->_launchURL = (NSURL *)v33;

    v24->_isDelegate = a11;
    uint64_t v35 = [v22 copy];
    sourceTitle = v24->_sourceTitle;
    v24->_sourceTitle = (NSString *)v35;

    uint64_t v37 = [v23 copy];
    sourceIdentifier = v24->_sourceIdentifier;
    v24->_sourceIdentifier = (NSString *)v37;
  }
  return v24;
}

- (id)description
{
  v17 = NSString;
  uint64_t v16 = objc_opt_class();
  v15 = [(CALNCalendarResourceChangedNotificationInfo *)self sourceClientIdentifier];
  v14 = [(CALNCalendarResourceChangedNotificationInfo *)self calendarNotification];
  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CALNCalendarResourceChangedNotificationInfo changeType](self, "changeType"));
  v12 = [(CALNCalendarResourceChangedNotificationInfo *)self date];
  v3 = objc_msgSend(NSNumber, "numberWithBool:", -[CALNCalendarResourceChangedNotificationInfo allDay](self, "allDay"));
  v4 = [(CALNCalendarResourceChangedNotificationInfo *)self timeZone];
  v5 = [(CALNCalendarResourceChangedNotificationInfo *)self expirationDate];
  v6 = [(CALNCalendarResourceChangedNotificationInfo *)self launchURL];
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[CALNCalendarResourceChangedNotificationInfo isDelegate](self, "isDelegate"));
  v8 = [(CALNCalendarResourceChangedNotificationInfo *)self sourceTitle];
  v9 = [(CALNCalendarResourceChangedNotificationInfo *)self sourceIdentifier];
  v10 = [v17 stringWithFormat:@"<%@: %p>(sourceClientIdentifier = %@, calendarNotification = %@, changeType = %@, date = %@, allDay = %@, timeZone = %@, expirationDate = %@, launchURL = %@, isDelegate = %@, sourceTitle = %@, sourceIdentifier = %@)", v16, self, v15, v14, v13, v12, v3, v4, v5, v6, v7, v8, v9];

  return v10;
}

- (NSString)sourceClientIdentifier
{
  return self->_sourceClientIdentifier;
}

- (EKCalendarResourceChangeNotification)calendarNotification
{
  return self->_calendarNotification;
}

- (unsigned)changeType
{
  return self->_changeType;
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)allDay
{
  return self->_allDay;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSURL)launchURL
{
  return self->_launchURL;
}

- (BOOL)isDelegate
{
  return self->_isDelegate;
}

- (NSString)sourceTitle
{
  return self->_sourceTitle;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceTitle, 0);
  objc_storeStrong((id *)&self->_launchURL, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_calendarNotification, 0);
  objc_storeStrong((id *)&self->_sourceClientIdentifier, 0);
}

@end