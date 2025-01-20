@interface CALNTriggeredEventNotificationSourceNotificationInfo
- (BOOL)allowsLocationAlerts;
- (BOOL)conferenceURLIsBroadcast;
- (BOOL)eventHasAlarms;
- (BOOL)forceDisplayOfNewTravelAdvisoryHypotheses;
- (BOOL)hasSuggestedLocation;
- (BOOL)isAllDay;
- (BOOL)isLocationEvent;
- (BOOL)isOffsetFromTravelTimeStart;
- (BOOL)isTimeSensitive;
- (BOOL)travelAdvisoryDisabled;
- (CALNTriggeredEventNotificationSourceNotificationInfo)initWithTitle:(id)a3 location:(id)a4 locationWithoutPrediction:(id)a5 preferredLocation:(id)a6 startDate:(id)a7 endDate:(id)a8 isAllDay:(BOOL)a9 isTimeSensitive:(BOOL)a10 launchURL:(id)a11 isLocationEvent:(BOOL)a12 eventID:(id)a13 eventObjectID:(id)a14 calendarIdentifier:(id)a15 eventRepresentationDictionary:(id)a16 legacyIdentifier:(id)a17 mapItemURL:(id)a18 conferenceURL:(id)a19 conferenceURLIsBroadcast:(BOOL)a20 mailtoURL:(id)a21 hasSuggestedLocation:(BOOL)a22 eventHasAlarms:(BOOL)a23 alarmID:(id)a24 isOffsetFromTravelTimeStart:(BOOL)a25 lastFireTimeOfAlertOffsetFromTravelTime:(id)a26 allowsLocationAlerts:(BOOL)a27 hypothesis:(id)a28 travelAdvisoryTimelinessPeriod:(unint64_t)a29 forceDisplayOfNewTravelAdvisoryHypotheses:(BOOL)a30 travelAdvisoryDisabled:(BOOL)a31;
- (EKStructuredLocation)preferredLocation;
- (EKTravelEngineHypothesis)hypothesis;
- (NSDate)endDate;
- (NSDate)lastFireTimeOfAlertOffsetFromTravelTime;
- (NSDate)startDate;
- (NSDictionary)eventRepresentationDictionary;
- (NSString)alarmID;
- (NSString)calendarIdentifier;
- (NSString)eventID;
- (NSString)eventObjectID;
- (NSString)legacyIdentifier;
- (NSString)location;
- (NSString)locationWithoutPrediction;
- (NSString)title;
- (NSURL)conferenceURL;
- (NSURL)launchURL;
- (NSURL)mailtoURL;
- (NSURL)mapItemURL;
- (id)description;
- (unint64_t)travelAdvisoryTimelinessPeriod;
@end

@implementation CALNTriggeredEventNotificationSourceNotificationInfo

- (CALNTriggeredEventNotificationSourceNotificationInfo)initWithTitle:(id)a3 location:(id)a4 locationWithoutPrediction:(id)a5 preferredLocation:(id)a6 startDate:(id)a7 endDate:(id)a8 isAllDay:(BOOL)a9 isTimeSensitive:(BOOL)a10 launchURL:(id)a11 isLocationEvent:(BOOL)a12 eventID:(id)a13 eventObjectID:(id)a14 calendarIdentifier:(id)a15 eventRepresentationDictionary:(id)a16 legacyIdentifier:(id)a17 mapItemURL:(id)a18 conferenceURL:(id)a19 conferenceURLIsBroadcast:(BOOL)a20 mailtoURL:(id)a21 hasSuggestedLocation:(BOOL)a22 eventHasAlarms:(BOOL)a23 alarmID:(id)a24 isOffsetFromTravelTimeStart:(BOOL)a25 lastFireTimeOfAlertOffsetFromTravelTime:(id)a26 allowsLocationAlerts:(BOOL)a27 hypothesis:(id)a28 travelAdvisoryTimelinessPeriod:(unint64_t)a29 forceDisplayOfNewTravelAdvisoryHypotheses:(BOOL)a30 travelAdvisoryDisabled:(BOOL)a31
{
  id v91 = a3;
  id v90 = a4;
  id v89 = a5;
  id obj = a6;
  id v36 = a6;
  id v88 = a7;
  id v87 = a8;
  id v37 = a11;
  id v38 = a13;
  id v39 = a14;
  id v40 = a15;
  id v41 = a16;
  id v42 = a17;
  id v43 = a18;
  id v44 = a19;
  id v86 = a21;
  id v85 = a24;
  id v84 = a26;
  id v83 = a28;
  v92.receiver = self;
  v92.super_class = (Class)CALNTriggeredEventNotificationSourceNotificationInfo;
  v45 = [(CALNTriggeredEventNotificationSourceNotificationInfo *)&v92 init];
  if (v45)
  {
    uint64_t v46 = [v91 copy];
    title = v45->_title;
    v45->_title = (NSString *)v46;

    uint64_t v48 = [v90 copy];
    location = v45->_location;
    v45->_location = (NSString *)v48;

    uint64_t v50 = [v89 copy];
    locationWithoutPrediction = v45->_locationWithoutPrediction;
    v45->_locationWithoutPrediction = (NSString *)v50;

    objc_storeStrong((id *)&v45->_preferredLocation, obj);
    uint64_t v52 = [v88 copy];
    startDate = v45->_startDate;
    v45->_startDate = (NSDate *)v52;

    uint64_t v54 = [v87 copy];
    endDate = v45->_endDate;
    v45->_endDate = (NSDate *)v54;

    v45->_isAllDay = a9;
    v45->_isTimeSensitive = a10;
    uint64_t v56 = [v37 copy];
    launchURL = v45->_launchURL;
    v45->_launchURL = (NSURL *)v56;

    v45->_isLocationEvent = a12;
    uint64_t v58 = [v38 copy];
    eventID = v45->_eventID;
    v45->_eventID = (NSString *)v58;

    uint64_t v60 = [v39 copy];
    eventObjectID = v45->_eventObjectID;
    v45->_eventObjectID = (NSString *)v60;

    uint64_t v62 = [v40 copy];
    calendarIdentifier = v45->_calendarIdentifier;
    v45->_calendarIdentifier = (NSString *)v62;

    uint64_t v64 = [v41 copy];
    eventRepresentationDictionary = v45->_eventRepresentationDictionary;
    v45->_eventRepresentationDictionary = (NSDictionary *)v64;

    uint64_t v66 = [v42 copy];
    legacyIdentifier = v45->_legacyIdentifier;
    v45->_legacyIdentifier = (NSString *)v66;

    uint64_t v68 = [v43 copy];
    mapItemURL = v45->_mapItemURL;
    v45->_mapItemURL = (NSURL *)v68;

    uint64_t v70 = [v44 copy];
    conferenceURL = v45->_conferenceURL;
    v45->_conferenceURL = (NSURL *)v70;

    v45->_conferenceURLIsBroadcast = a20;
    uint64_t v72 = [v86 copy];
    mailtoURL = v45->_mailtoURL;
    v45->_mailtoURL = (NSURL *)v72;

    v45->_hasSuggestedLocation = a22;
    v45->_eventHasAlarms = a23;
    uint64_t v74 = [v85 copy];
    alarmID = v45->_alarmID;
    v45->_alarmID = (NSString *)v74;

    v45->_isOffsetFromTravelTimeStart = a25;
    uint64_t v76 = [v84 copy];
    lastFireTimeOfAlertOffsetFromTravelTime = v45->_lastFireTimeOfAlertOffsetFromTravelTime;
    v45->_lastFireTimeOfAlertOffsetFromTravelTime = (NSDate *)v76;

    v45->_allowsLocationAlerts = a27;
    uint64_t v78 = [v83 copy];
    hypothesis = v45->_hypothesis;
    v45->_hypothesis = (EKTravelEngineHypothesis *)v78;

    v45->_travelAdvisoryTimelinessPeriod = a29;
    v45->_forceDisplayOfNewTravelAdvisoryHypotheses = a30;
    v45->_travelAdvisoryDisabled = a31;
  }

  return v45;
}

- (id)description
{
  v34 = NSString;
  uint64_t v33 = objc_opt_class();
  id v39 = [(CALNTriggeredEventNotificationSourceNotificationInfo *)self title];
  id v38 = [(CALNTriggeredEventNotificationSourceNotificationInfo *)self location];
  id v37 = [(CALNTriggeredEventNotificationSourceNotificationInfo *)self startDate];
  v32 = [(CALNTriggeredEventNotificationSourceNotificationInfo *)self endDate];
  if ([(CALNTriggeredEventNotificationSourceNotificationInfo *)self isAllDay]) {
    v3 = @"YES";
  }
  else {
    v3 = @"NO";
  }
  v31 = v3;
  v30 = [(CALNTriggeredEventNotificationSourceNotificationInfo *)self launchURL];
  if ([(CALNTriggeredEventNotificationSourceNotificationInfo *)self isLocationEvent]) {
    v4 = @"YES";
  }
  else {
    v4 = @"NO";
  }
  v29 = v4;
  id v36 = [(CALNTriggeredEventNotificationSourceNotificationInfo *)self eventID];
  v28 = [(CALNTriggeredEventNotificationSourceNotificationInfo *)self calendarIdentifier];
  v35 = [(CALNTriggeredEventNotificationSourceNotificationInfo *)self eventRepresentationDictionary];
  v27 = [(CALNTriggeredEventNotificationSourceNotificationInfo *)self legacyIdentifier];
  v26 = [(CALNTriggeredEventNotificationSourceNotificationInfo *)self mapItemURL];
  v25 = [(CALNTriggeredEventNotificationSourceNotificationInfo *)self conferenceURL];
  if ([(CALNTriggeredEventNotificationSourceNotificationInfo *)self conferenceURLIsBroadcast])
  {
    v5 = @"YES";
  }
  else
  {
    v5 = @"NO";
  }
  v24 = v5;
  v23 = [(CALNTriggeredEventNotificationSourceNotificationInfo *)self mailtoURL];
  if ([(CALNTriggeredEventNotificationSourceNotificationInfo *)self hasSuggestedLocation]) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  v22 = v6;
  if ([(CALNTriggeredEventNotificationSourceNotificationInfo *)self eventHasAlarms]) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  v21 = v7;
  v8 = [(CALNTriggeredEventNotificationSourceNotificationInfo *)self alarmID];
  if ([(CALNTriggeredEventNotificationSourceNotificationInfo *)self isOffsetFromTravelTimeStart])
  {
    v9 = @"YES";
  }
  else
  {
    v9 = @"NO";
  }
  v20 = v9;
  v10 = [(CALNTriggeredEventNotificationSourceNotificationInfo *)self lastFireTimeOfAlertOffsetFromTravelTime];
  if ([(CALNTriggeredEventNotificationSourceNotificationInfo *)self allowsLocationAlerts]) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  v12 = [(CALNTriggeredEventNotificationSourceNotificationInfo *)self hypothesis];
  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CALNTriggeredEventNotificationSourceNotificationInfo travelAdvisoryTimelinessPeriod](self, "travelAdvisoryTimelinessPeriod"));
  if ([(CALNTriggeredEventNotificationSourceNotificationInfo *)self forceDisplayOfNewTravelAdvisoryHypotheses])
  {
    v14 = @"YES";
  }
  else
  {
    v14 = @"NO";
  }
  if ([(CALNTriggeredEventNotificationSourceNotificationInfo *)self travelAdvisoryDisabled]) {
    v15 = @"YES";
  }
  else {
    v15 = @"NO";
  }
  v16 = [(CALNTriggeredEventNotificationSourceNotificationInfo *)self locationWithoutPrediction];
  v17 = [(CALNTriggeredEventNotificationSourceNotificationInfo *)self preferredLocation];
  objc_msgSend(v34, "stringWithFormat:", @"<%@: %p>(title = %@, location = %@, startDate = %@, endDate = %@, isAllDay = %@, launchURL = %@, isLocationEvent = %@, eventID = %@, calendarIdentifier = %@, eventRepresentationDictionary = %@, legacyIdentifier = %@, mapItemURL = %@, conferenceURL = %@, conferenceURLIsBroadcast = %@, mailtoURL = %@, hasSuggestedLocation = %@, eventHasAlarms = %@, alarmID = %@, isOffsetFromTravelTimeStart = %@, lastFireTimeOfAlertOffsetFromTravelTime = %@, allowsLocationAlerts = %@, hypothesis = %@, travelAdvisoryTimelinessPeriod = %@, forceDisplayOfNewTravelAdvisoryHypotheses = %@, travelAdvisoryDisabled = %@, locationWithoutPrediction = %@, preferredLocation = %@)", v33, self, v39, v38, v37, v32, v31, v30, v29, v36, v28, v35, v27, v26, v25, v24,
    v23,
    v22,
    v21,
    v8,
    v20,
    v10,
    v11,
    v12,
    v13,
    v14,
    v15,
    v16,
  v18 = v17);

  return v18;
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

- (EKStructuredLocation)preferredLocation
{
  return self->_preferredLocation;
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

- (NSURL)launchURL
{
  return self->_launchURL;
}

- (BOOL)isLocationEvent
{
  return self->_isLocationEvent;
}

- (NSString)eventID
{
  return self->_eventID;
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

- (NSURL)mapItemURL
{
  return self->_mapItemURL;
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

- (NSString)alarmID
{
  return self->_alarmID;
}

- (BOOL)isOffsetFromTravelTimeStart
{
  return self->_isOffsetFromTravelTimeStart;
}

- (NSDate)lastFireTimeOfAlertOffsetFromTravelTime
{
  return self->_lastFireTimeOfAlertOffsetFromTravelTime;
}

- (BOOL)allowsLocationAlerts
{
  return self->_allowsLocationAlerts;
}

- (EKTravelEngineHypothesis)hypothesis
{
  return self->_hypothesis;
}

- (unint64_t)travelAdvisoryTimelinessPeriod
{
  return self->_travelAdvisoryTimelinessPeriod;
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
  objc_storeStrong((id *)&self->_hypothesis, 0);
  objc_storeStrong((id *)&self->_lastFireTimeOfAlertOffsetFromTravelTime, 0);
  objc_storeStrong((id *)&self->_alarmID, 0);
  objc_storeStrong((id *)&self->_mailtoURL, 0);
  objc_storeStrong((id *)&self->_conferenceURL, 0);
  objc_storeStrong((id *)&self->_mapItemURL, 0);
  objc_storeStrong((id *)&self->_legacyIdentifier, 0);
  objc_storeStrong((id *)&self->_eventRepresentationDictionary, 0);
  objc_storeStrong((id *)&self->_calendarIdentifier, 0);
  objc_storeStrong((id *)&self->_eventObjectID, 0);
  objc_storeStrong((id *)&self->_eventID, 0);
  objc_storeStrong((id *)&self->_launchURL, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_preferredLocation, 0);
  objc_storeStrong((id *)&self->_locationWithoutPrediction, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end