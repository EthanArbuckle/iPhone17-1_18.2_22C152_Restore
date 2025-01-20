@interface CALNTriggeredEventNotificationInfo
- (BOOL)allowsLocationAlerts;
- (BOOL)conferenceURLIsBroadcast;
- (BOOL)eventHasAlarms;
- (BOOL)forceDisplayOfNewTravelAdvisoryHypotheses;
- (BOOL)hasSuggestedLocation;
- (BOOL)isAllDay;
- (BOOL)isTimeSensitive;
- (BOOL)travelAdvisoryDisabled;
- (CALNTriggeredEventNotificationInfo)initWithTitle:(id)a3 location:(id)a4 locationWithoutPrediction:(id)a5 startDate:(id)a6 endDate:(id)a7 isAllDay:(BOOL)a8 isTimeSensitive:(BOOL)a9 eventID:(id)a10 eventOccurrenceID:(id)a11 eventObjectID:(id)a12 calendarIdentifier:(id)a13 eventRepresentationDictionary:(id)a14 legacyIdentifier:(id)a15 preferredLocation:(id)a16 conferenceURL:(id)a17 conferenceURLIsBroadcast:(BOOL)a18 mailtoURL:(id)a19 hasSuggestedLocation:(BOOL)a20 eventHasAlarms:(BOOL)a21 allowsLocationAlerts:(BOOL)a22 forceDisplayOfNewTravelAdvisoryHypotheses:(BOOL)a23 travelAdvisoryDisabled:(BOOL)a24;
- (EKStructuredLocation)preferredLocation;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDictionary)eventRepresentationDictionary;
- (NSString)calendarIdentifier;
- (NSString)eventID;
- (NSString)eventObjectID;
- (NSString)eventOccurrenceID;
- (NSString)legacyIdentifier;
- (NSString)location;
- (NSString)locationWithoutPrediction;
- (NSString)title;
- (NSURL)conferenceURL;
- (NSURL)mailtoURL;
- (id)description;
@end

@implementation CALNTriggeredEventNotificationInfo

- (CALNTriggeredEventNotificationInfo)initWithTitle:(id)a3 location:(id)a4 locationWithoutPrediction:(id)a5 startDate:(id)a6 endDate:(id)a7 isAllDay:(BOOL)a8 isTimeSensitive:(BOOL)a9 eventID:(id)a10 eventOccurrenceID:(id)a11 eventObjectID:(id)a12 calendarIdentifier:(id)a13 eventRepresentationDictionary:(id)a14 legacyIdentifier:(id)a15 preferredLocation:(id)a16 conferenceURL:(id)a17 conferenceURLIsBroadcast:(BOOL)a18 mailtoURL:(id)a19 hasSuggestedLocation:(BOOL)a20 eventHasAlarms:(BOOL)a21 allowsLocationAlerts:(BOOL)a22 forceDisplayOfNewTravelAdvisoryHypotheses:(BOOL)a23 travelAdvisoryDisabled:(BOOL)a24
{
  id v68 = a3;
  id v67 = a4;
  id v66 = a5;
  id v71 = a6;
  id v70 = a7;
  id v69 = a10;
  id v28 = a11;
  id v29 = a12;
  id v30 = a13;
  id v31 = a14;
  id v32 = a15;
  id v33 = a16;
  id v34 = a17;
  id v35 = a19;
  v72.receiver = self;
  v72.super_class = (Class)CALNTriggeredEventNotificationInfo;
  v36 = [(CALNTriggeredEventNotificationInfo *)&v72 init];
  if (v36)
  {
    uint64_t v37 = [v68 copy];
    title = v36->_title;
    v36->_title = (NSString *)v37;

    uint64_t v39 = [v67 copy];
    location = v36->_location;
    v36->_location = (NSString *)v39;

    uint64_t v41 = [v66 copy];
    locationWithoutPrediction = v36->_locationWithoutPrediction;
    v36->_locationWithoutPrediction = (NSString *)v41;

    uint64_t v43 = [v71 copy];
    startDate = v36->_startDate;
    v36->_startDate = (NSDate *)v43;

    uint64_t v45 = [v70 copy];
    endDate = v36->_endDate;
    v36->_endDate = (NSDate *)v45;

    v36->_isAllDay = a8;
    v36->_isTimeSensitive = a9;
    uint64_t v47 = [v69 copy];
    eventID = v36->_eventID;
    v36->_eventID = (NSString *)v47;

    uint64_t v49 = [v28 copy];
    eventOccurrenceID = v36->_eventOccurrenceID;
    v36->_eventOccurrenceID = (NSString *)v49;

    uint64_t v51 = [v29 copy];
    eventObjectID = v36->_eventObjectID;
    v36->_eventObjectID = (NSString *)v51;

    uint64_t v53 = [v30 copy];
    calendarIdentifier = v36->_calendarIdentifier;
    v36->_calendarIdentifier = (NSString *)v53;

    uint64_t v55 = [v31 copy];
    eventRepresentationDictionary = v36->_eventRepresentationDictionary;
    v36->_eventRepresentationDictionary = (NSDictionary *)v55;

    uint64_t v57 = [v32 copy];
    legacyIdentifier = v36->_legacyIdentifier;
    v36->_legacyIdentifier = (NSString *)v57;

    objc_storeStrong((id *)&v36->_preferredLocation, a16);
    uint64_t v59 = [v34 copy];
    conferenceURL = v36->_conferenceURL;
    v36->_conferenceURL = (NSURL *)v59;

    v36->_conferenceURLIsBroadcast = a18;
    uint64_t v61 = [v35 copy];
    mailtoURL = v36->_mailtoURL;
    v36->_mailtoURL = (NSURL *)v61;

    v36->_hasSuggestedLocation = a20;
    v36->_eventHasAlarms = a21;
    v36->_allowsLocationAlerts = a22;
    v36->_forceDisplayOfNewTravelAdvisoryHypotheses = a23;
    v36->_travelAdvisoryDisabled = a24;
  }

  return v36;
}

- (id)description
{
  v26 = NSString;
  uint64_t v25 = objc_opt_class();
  id v28 = [(CALNTriggeredEventNotificationInfo *)self title];
  v27 = [(CALNTriggeredEventNotificationInfo *)self location];
  v24 = [(CALNTriggeredEventNotificationInfo *)self startDate];
  v23 = [(CALNTriggeredEventNotificationInfo *)self endDate];
  v3 = @"YES";
  if ([(CALNTriggeredEventNotificationInfo *)self isAllDay]) {
    v4 = @"YES";
  }
  else {
    v4 = @"NO";
  }
  v22 = v4;
  v21 = [(CALNTriggeredEventNotificationInfo *)self eventID];
  v20 = [(CALNTriggeredEventNotificationInfo *)self eventOccurrenceID];
  v19 = [(CALNTriggeredEventNotificationInfo *)self calendarIdentifier];
  v5 = [(CALNTriggeredEventNotificationInfo *)self eventRepresentationDictionary];
  v6 = [(CALNTriggeredEventNotificationInfo *)self legacyIdentifier];
  v18 = [(CALNTriggeredEventNotificationInfo *)self preferredLocation];
  v17 = [(CALNTriggeredEventNotificationInfo *)self conferenceURL];
  if ([(CALNTriggeredEventNotificationInfo *)self conferenceURLIsBroadcast]) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  v16 = v7;
  v8 = [(CALNTriggeredEventNotificationInfo *)self mailtoURL];
  if ([(CALNTriggeredEventNotificationInfo *)self hasSuggestedLocation]) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  if ([(CALNTriggeredEventNotificationInfo *)self eventHasAlarms]) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  if ([(CALNTriggeredEventNotificationInfo *)self allowsLocationAlerts]) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  if ([(CALNTriggeredEventNotificationInfo *)self forceDisplayOfNewTravelAdvisoryHypotheses])
  {
    v12 = @"YES";
  }
  else
  {
    v12 = @"NO";
  }
  if (![(CALNTriggeredEventNotificationInfo *)self travelAdvisoryDisabled]) {
    v3 = @"NO";
  }
  v13 = [(CALNTriggeredEventNotificationInfo *)self locationWithoutPrediction];
  objc_msgSend(v26, "stringWithFormat:", @"<%@: %p>(title = %@, location = %@, startDate = %@, endDate = %@, isAllDay = %@, eventID = %@, eventOccurrenceID = %@, calendarIdentifier = %@, eventRepresentationDictionary = %@, legacyIdentifier = %@, preferredLocation = %@, conferenceURLIsBroadcast = %@, conferenceURLIsBroadcast = %@, mailtoURL = %@, hasSuggestedLocation = %@, eventHasAlarms = %@, allowsLocationAlerts = %@, forceDisplayOfNewTravelAdvisoryHypotheses = %@, travelAdvisoryDisabled = %@, locationWithoutPrediction = %@)", v25, self, v28, v27, v24, v23, v22, v21, v20, v19, v5, v6, v18, v17, v16, v8,
    v9,
    v10,
    v11,
    v12,
    v3,
  v14 = v13);

  return v14;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)location
{
  return self->_location;
}

- (NSString)locationWithoutPrediction
{
  return self->_locationWithoutPrediction;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (BOOL)isAllDay
{
  return self->_isAllDay;
}

- (BOOL)isTimeSensitive
{
  return self->_isTimeSensitive;
}

- (NSString)eventID
{
  return self->_eventID;
}

- (NSString)eventOccurrenceID
{
  return self->_eventOccurrenceID;
}

- (NSString)eventObjectID
{
  return self->_eventObjectID;
}

- (NSString)calendarIdentifier
{
  return self->_calendarIdentifier;
}

- (NSDictionary)eventRepresentationDictionary
{
  return self->_eventRepresentationDictionary;
}

- (NSString)legacyIdentifier
{
  return self->_legacyIdentifier;
}

- (EKStructuredLocation)preferredLocation
{
  return self->_preferredLocation;
}

- (NSURL)conferenceURL
{
  return self->_conferenceURL;
}

- (BOOL)conferenceURLIsBroadcast
{
  return self->_conferenceURLIsBroadcast;
}

- (NSURL)mailtoURL
{
  return self->_mailtoURL;
}

- (BOOL)hasSuggestedLocation
{
  return self->_hasSuggestedLocation;
}

- (BOOL)eventHasAlarms
{
  return self->_eventHasAlarms;
}

- (BOOL)allowsLocationAlerts
{
  return self->_allowsLocationAlerts;
}

- (BOOL)forceDisplayOfNewTravelAdvisoryHypotheses
{
  return self->_forceDisplayOfNewTravelAdvisoryHypotheses;
}

- (BOOL)travelAdvisoryDisabled
{
  return self->_travelAdvisoryDisabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mailtoURL, 0);
  objc_storeStrong((id *)&self->_conferenceURL, 0);
  objc_storeStrong((id *)&self->_preferredLocation, 0);
  objc_storeStrong((id *)&self->_legacyIdentifier, 0);
  objc_storeStrong((id *)&self->_eventRepresentationDictionary, 0);
  objc_storeStrong((id *)&self->_calendarIdentifier, 0);
  objc_storeStrong((id *)&self->_eventObjectID, 0);
  objc_storeStrong((id *)&self->_eventOccurrenceID, 0);
  objc_storeStrong((id *)&self->_eventID, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_locationWithoutPrediction, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end