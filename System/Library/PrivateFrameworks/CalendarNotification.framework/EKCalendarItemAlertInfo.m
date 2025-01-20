@interface EKCalendarItemAlertInfo
- (BOOL)acknowledged;
- (BOOL)allDay;
- (BOOL)hasDisplayedLeaveByMessage;
- (BOOL)hasDisplayedLeaveNowMessage;
- (BOOL)hasDisplayedRunningLateMessage;
- (BOOL)hasGeoLocationCoordinates;
- (BOOL)hasOrganizerThatIsNotCurrentUser;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOffsetFromTravelTimeStart;
- (BOOL)isOnSharedCalendar;
- (BOOL)isPseudoEvent;
- (BOOL)isPurelyATimeToLeaveAlert;
- (BOOL)isSuggestedLocation;
- (BOOL)refiring;
- (BOOL)tentative;
- (CLLocationCoordinate2D)geoLocationCoordinates;
- (EKCalendarItemAlertInfo)initWithTitle:(id)a3 location:(id)a4 date:(id)a5 endDate:(id)a6 timeZone:(id)a7 allDay:(BOOL)a8 tentative:(BOOL)a9 publisherBulletinID:(id)a10 entityID:(id)a11 appLink:(id)a12 proximity:(int64_t)a13 externalID:(id)a14 databaseID:(int)a15 acknowledged:(BOOL)a16 dismissalID:(id)a17 alarmID:(id)a18 isOffsetFromTravelTimeStart:(BOOL)a19 refiring:(BOOL)a20 pseudoEvent:(BOOL)a21;
- (EKTravelEngineHypothesis)latestHypothesis;
- (NSData)mapKitHandle;
- (NSDate)endDate;
- (NSDate)eventDate;
- (NSDate)fireDate;
- (NSDate)lastFireTimeOfAlertOffsetFromTravelTime;
- (NSDate)lastTimeBulletinAdded;
- (NSString)alarmID;
- (NSString)dismissalID;
- (NSString)externalID;
- (NSString)location;
- (NSString)locationAddress;
- (NSString)organizerEmailAddress;
- (NSString)publisherBulletinID;
- (NSString)recordID;
- (NSString)startLocationRouting;
- (NSString)title;
- (NSTimeZone)eventTimeZone;
- (NSURL)entityID;
- (NSUserActivity)appLink;
- (id)description;
- (int)databaseID;
- (int64_t)proximity;
- (int64_t)triggerType;
- (unint64_t)currentRouteHypothesizerNotificationType;
- (unint64_t)hash;
- (void)resetTimeToLeaveDisplayState;
- (void)setCurrentRouteHypothesizerNotificationType:(unint64_t)a3;
- (void)setFireDate:(id)a3;
- (void)setGeoLocationCoordinates:(CLLocationCoordinate2D)a3;
- (void)setHasDisplayedLeaveByMessage:(BOOL)a3;
- (void)setHasDisplayedLeaveNowMessage:(BOOL)a3;
- (void)setHasDisplayedRunningLateMessage:(BOOL)a3;
- (void)setHasGeoLocationCoordinates:(BOOL)a3;
- (void)setHasOrganizerThatIsNotCurrentUser:(BOOL)a3;
- (void)setIsOnSharedCalendar:(BOOL)a3;
- (void)setIsSuggestedLocation:(BOOL)a3;
- (void)setLastFireTimeOfAlertOffsetFromTravelTime:(id)a3;
- (void)setLastTimeBulletinAdded:(id)a3;
- (void)setLatestHypothesis:(id)a3;
- (void)setLocationAddress:(id)a3;
- (void)setMapKitHandle:(id)a3;
- (void)setOrganizerEmailAddress:(id)a3;
- (void)setStartLocationRouting:(id)a3;
- (void)setTriggerType:(int64_t)a3;
@end

@implementation EKCalendarItemAlertInfo

- (EKCalendarItemAlertInfo)initWithTitle:(id)a3 location:(id)a4 date:(id)a5 endDate:(id)a6 timeZone:(id)a7 allDay:(BOOL)a8 tentative:(BOOL)a9 publisherBulletinID:(id)a10 entityID:(id)a11 appLink:(id)a12 proximity:(int64_t)a13 externalID:(id)a14 databaseID:(int)a15 acknowledged:(BOOL)a16 dismissalID:(id)a17 alarmID:(id)a18 isOffsetFromTravelTimeStart:(BOOL)a19 refiring:(BOOL)a20 pseudoEvent:(BOOL)a21
{
  id v56 = a3;
  id v60 = a4;
  id v59 = a5;
  id v58 = a6;
  id v57 = a7;
  id v25 = a10;
  id v26 = a11;
  id v27 = a12;
  id v28 = a14;
  id v29 = a17;
  id v30 = a18;
  v61.receiver = self;
  v61.super_class = (Class)EKCalendarItemAlertInfo;
  v31 = [(EKCalendarItemAlertInfo *)&v61 init];
  v32 = v31;
  if (v31)
  {
    v31->_triggerType = 0;
    uint64_t v33 = [v56 copy];
    title = v32->_title;
    v32->_title = (NSString *)v33;

    uint64_t v35 = [v60 copy];
    location = v32->_location;
    v32->_location = (NSString *)v35;

    uint64_t v37 = [v59 copy];
    eventDate = v32->_eventDate;
    v32->_eventDate = (NSDate *)v37;

    uint64_t v39 = [v58 copy];
    endDate = v32->_endDate;
    v32->_endDate = (NSDate *)v39;

    uint64_t v41 = [v57 copy];
    eventTimeZone = v32->_eventTimeZone;
    v32->_eventTimeZone = (NSTimeZone *)v41;

    v32->_allDay = a8;
    v32->_tentative = a9;
    objc_storeStrong((id *)&v32->_appLink, a12);
    uint64_t v43 = [v26 copy];
    entityID = v32->_entityID;
    v32->_entityID = (NSURL *)v43;

    v32->_databaseID = a15;
    uint64_t v45 = [v25 copy];
    publisherBulletinID = v32->_publisherBulletinID;
    v32->_publisherBulletinID = (NSString *)v45;

    v32->_proximity = a13;
    uint64_t v47 = [v28 copy];
    externalID = v32->_externalID;
    v32->_externalID = (NSString *)v47;

    v32->_acknowledged = a16;
    uint64_t v49 = [v29 copy];
    dismissalID = v32->_dismissalID;
    v32->_dismissalID = (NSString *)v49;

    uint64_t v51 = [v30 copy];
    alarmID = v32->_alarmID;
    v32->_alarmID = (NSString *)v51;

    v32->_isOffsetFromTravelTimeStart = a19;
    v32->_refiring = a20;
    v32->_isPseudoEvent = a21;
  }

  return v32;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(EKCalendarItemAlertInfo *)self title];
  v6 = [(EKCalendarItemAlertInfo *)self eventDate];
  v7 = [(EKCalendarItemAlertInfo *)self eventTimeZone];
  v8 = [v3 stringWithFormat:@"%@ <%p> {title = %@ date = %@; timeZone = %@}", v4, self, v5, v6, v7];;

  return v8;
}

- (unint64_t)hash
{
  v3 = [(EKCalendarItemAlertInfo *)self recordID];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(NSDate *)self->_eventDate hash] ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v5 = [(EKCalendarItemAlertInfo *)self recordID];
    v6 = [v4 recordID];
    if ([v5 isEqual:v6])
    {
      eventDate = self->_eventDate;
      if (eventDate == (NSDate *)v4[8]) {
        char v8 = 1;
      }
      else {
        char v8 = -[NSDate isEqual:](eventDate, "isEqual:");
      }
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (NSString)recordID
{
  v3 = [(EKCalendarItemAlertInfo *)self publisherBulletinID];
  uint64_t v4 = v3;
  if (v3 && [v3 length])
  {
    id v5 = v4;
  }
  else
  {
    v6 = [(EKCalendarItemAlertInfo *)self entityID];
    id v5 = [v6 absoluteString];
  }
  return (NSString *)v5;
}

- (BOOL)isPurelyATimeToLeaveAlert
{
  v2 = [(EKCalendarItemAlertInfo *)self alarmID];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)resetTimeToLeaveDisplayState
{
  [(EKCalendarItemAlertInfo *)self setHasDisplayedLeaveByMessage:0];
  [(EKCalendarItemAlertInfo *)self setHasDisplayedLeaveNowMessage:0];
  [(EKCalendarItemAlertInfo *)self setHasDisplayedRunningLateMessage:0];
}

- (int64_t)triggerType
{
  return self->_triggerType;
}

- (void)setTriggerType:(int64_t)a3
{
  self->_triggerType = a3;
}

- (NSString)publisherBulletinID
{
  return self->_publisherBulletinID;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)location
{
  return self->_location;
}

- (NSDate)eventDate
{
  return self->_eventDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSTimeZone)eventTimeZone
{
  return self->_eventTimeZone;
}

- (NSUserActivity)appLink
{
  return self->_appLink;
}

- (NSURL)entityID
{
  return self->_entityID;
}

- (BOOL)allDay
{
  return self->_allDay;
}

- (BOOL)tentative
{
  return self->_tentative;
}

- (int64_t)proximity
{
  return self->_proximity;
}

- (NSString)externalID
{
  return self->_externalID;
}

- (int)databaseID
{
  return self->_databaseID;
}

- (BOOL)acknowledged
{
  return self->_acknowledged;
}

- (NSString)dismissalID
{
  return self->_dismissalID;
}

- (NSString)alarmID
{
  return self->_alarmID;
}

- (BOOL)refiring
{
  return self->_refiring;
}

- (BOOL)isOffsetFromTravelTimeStart
{
  return self->_isOffsetFromTravelTimeStart;
}

- (BOOL)isPseudoEvent
{
  return self->_isPseudoEvent;
}

- (NSData)mapKitHandle
{
  return self->_mapKitHandle;
}

- (void)setMapKitHandle:(id)a3
{
}

- (BOOL)hasGeoLocationCoordinates
{
  return self->_hasGeoLocationCoordinates;
}

- (void)setHasGeoLocationCoordinates:(BOOL)a3
{
  self->_hasGeoLocationCoordinates = a3;
}

- (CLLocationCoordinate2D)geoLocationCoordinates
{
  double latitude = self->_geoLocationCoordinates.latitude;
  double longitude = self->_geoLocationCoordinates.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setGeoLocationCoordinates:(CLLocationCoordinate2D)a3
{
  self->_geoLocationCoordinates = a3;
}

- (BOOL)hasOrganizerThatIsNotCurrentUser
{
  return self->_hasOrganizerThatIsNotCurrentUser;
}

- (void)setHasOrganizerThatIsNotCurrentUser:(BOOL)a3
{
  self->_hasOrganizerThatIsNotCurrentUser = a3;
}

- (NSString)organizerEmailAddress
{
  return self->_organizerEmailAddress;
}

- (void)setOrganizerEmailAddress:(id)a3
{
}

- (NSString)startLocationRouting
{
  return self->_startLocationRouting;
}

- (void)setStartLocationRouting:(id)a3
{
}

- (NSString)locationAddress
{
  return self->_locationAddress;
}

- (void)setLocationAddress:(id)a3
{
}

- (EKTravelEngineHypothesis)latestHypothesis
{
  return self->_latestHypothesis;
}

- (void)setLatestHypothesis:(id)a3
{
}

- (NSDate)lastFireTimeOfAlertOffsetFromTravelTime
{
  return self->_lastFireTimeOfAlertOffsetFromTravelTime;
}

- (void)setLastFireTimeOfAlertOffsetFromTravelTime:(id)a3
{
}

- (NSDate)lastTimeBulletinAdded
{
  return self->_lastTimeBulletinAdded;
}

- (void)setLastTimeBulletinAdded:(id)a3
{
}

- (BOOL)isSuggestedLocation
{
  return self->_isSuggestedLocation;
}

- (void)setIsSuggestedLocation:(BOOL)a3
{
  self->_isSuggestedLocation = a3;
}

- (BOOL)isOnSharedCalendar
{
  return self->_isOnSharedCalendar;
}

- (void)setIsOnSharedCalendar:(BOOL)a3
{
  self->_isOnSharedCalendar = a3;
}

- (BOOL)hasDisplayedLeaveByMessage
{
  return self->_hasDisplayedLeaveByMessage;
}

- (void)setHasDisplayedLeaveByMessage:(BOOL)a3
{
  self->_hasDisplayedLeaveByMessage = a3;
}

- (BOOL)hasDisplayedLeaveNowMessage
{
  return self->_hasDisplayedLeaveNowMessage;
}

- (void)setHasDisplayedLeaveNowMessage:(BOOL)a3
{
  self->_hasDisplayedLeaveNowMessage = a3;
}

- (BOOL)hasDisplayedRunningLateMessage
{
  return self->_hasDisplayedRunningLateMessage;
}

- (void)setHasDisplayedRunningLateMessage:(BOOL)a3
{
  self->_hasDisplayedRunningLateMessage = a3;
}

- (unint64_t)currentRouteHypothesizerNotificationType
{
  return self->_currentRouteHypothesizerNotificationType;
}

- (void)setCurrentRouteHypothesizerNotificationType:(unint64_t)a3
{
  self->_currentRouteHypothesizerNotificationType = a3;
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

- (void)setFireDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fireDate, 0);
  objc_storeStrong((id *)&self->_lastTimeBulletinAdded, 0);
  objc_storeStrong((id *)&self->_lastFireTimeOfAlertOffsetFromTravelTime, 0);
  objc_storeStrong((id *)&self->_latestHypothesis, 0);
  objc_storeStrong((id *)&self->_locationAddress, 0);
  objc_storeStrong((id *)&self->_startLocationRouting, 0);
  objc_storeStrong((id *)&self->_organizerEmailAddress, 0);
  objc_storeStrong((id *)&self->_mapKitHandle, 0);
  objc_storeStrong((id *)&self->_alarmID, 0);
  objc_storeStrong((id *)&self->_dismissalID, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_entityID, 0);
  objc_storeStrong((id *)&self->_appLink, 0);
  objc_storeStrong((id *)&self->_eventTimeZone, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_eventDate, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_publisherBulletinID, 0);
}

@end