@interface CalDAVContainer
+ (id)copyPropertyMappingsForParser;
- (BOOL)_isComponentSupportedForString:(id)a3;
- (BOOL)autoprovisioned;
- (BOOL)canBePublished;
- (BOOL)canBeShared;
- (BOOL)isCalendar;
- (BOOL)isEventContainer;
- (BOOL)isFamilyCalendar;
- (BOOL)isJournalContainer;
- (BOOL)isMarkedImmutableSharees;
- (BOOL)isMarkedUndeletable;
- (BOOL)isNotification;
- (BOOL)isPollContainer;
- (BOOL)isScheduleInbox;
- (BOOL)isScheduleOutbox;
- (BOOL)isScheduleTransparent;
- (BOOL)isShared;
- (BOOL)isSharedOwner;
- (BOOL)isSubscribed;
- (BOOL)isTaskContainer;
- (BOOL)overrideSupportsFreebusy;
- (BOOL)subscribedStripAlarms;
- (BOOL)subscribedStripAttachments;
- (BOOL)subscribedStripTodos;
- (BOOL)supportsFreebusy;
- (ICSDuration)subscribedRefreshRate;
- (NSSet)freeBusySet;
- (NSSet)sharees;
- (NSSet)supportedCalendarComponentSet;
- (NSString)alarms;
- (NSString)calendarColor;
- (NSString)calendarDescription;
- (NSString)calendarOrder;
- (NSString)ctag;
- (NSString)defaultAllDayAlarms;
- (NSString)defaultTimedAlarms;
- (NSString)languageCode;
- (NSString)locationCode;
- (NSString)supportedCalendarComponentSets;
- (NSString)symbolicColorName;
- (NSTimeZone)timeZone;
- (NSURL)prePublishURL;
- (NSURL)publishURL;
- (NSURL)scheduleDefaultCalendarURL;
- (NSURL)source;
- (id)description;
- (int64_t)maxAttendees;
- (void)_setTimeZoneFromProperties:(id)a3 onCalendar:(id)a4;
- (void)applyParsedProperties:(id)a3;
- (void)postProcessWithResponseHeaders:(id)a3;
- (void)setAlarms:(id)a3;
- (void)setAutoprovisioned:(BOOL)a3;
- (void)setCalendarColor:(id)a3;
- (void)setCalendarDescription:(id)a3;
- (void)setCalendarOrder:(id)a3;
- (void)setCanBePublished:(BOOL)a3;
- (void)setCanBeShared:(BOOL)a3;
- (void)setCtag:(id)a3;
- (void)setDefaultAllDayAlarms:(id)a3;
- (void)setDefaultTimedAlarms:(id)a3;
- (void)setFreeBusySet:(id)a3;
- (void)setIsMarkedImmutableSharees:(BOOL)a3;
- (void)setIsMarkedUndeletable:(BOOL)a3;
- (void)setIsScheduleTransparent:(BOOL)a3;
- (void)setLanguageCode:(id)a3;
- (void)setLocationCode:(id)a3;
- (void)setMaxAttendees:(int64_t)a3;
- (void)setOverrideSupportsFreebusy:(BOOL)a3;
- (void)setPrePublishURL:(id)a3;
- (void)setPublishURL:(id)a3;
- (void)setScheduleDefaultCalendarURL:(id)a3;
- (void)setSharees:(id)a3;
- (void)setSource:(id)a3;
- (void)setSubscribedRefreshRate:(id)a3;
- (void)setSubscribedStripAlarms:(BOOL)a3;
- (void)setSubscribedStripAttachments:(BOOL)a3;
- (void)setSubscribedStripTodos:(BOOL)a3;
- (void)setSupportedCalendarComponentSet:(id)a3;
- (void)setSupportedCalendarComponentSets:(id)a3;
- (void)setSymbolicColorName:(id)a3;
- (void)setTimeZone:(id)a3;
@end

@implementation CalDAVContainer

- (id)description
{
  v27.receiver = self;
  v27.super_class = (Class)CalDAVContainer;
  v3 = [(CoreDAVContainer *)&v27 description];
  v4 = (void *)MEMORY[0x263F089D8];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = [v4 stringWithFormat:@"%@ %p: ", v6, self];

  [v7 appendFormat:@" PARENT CLASS: %@", v3];
  objc_msgSend(v7, "appendFormat:", @"\n\tisCalendar: %d", -[CalDAVContainer isCalendar](self, "isCalendar"));
  objc_msgSend(v7, "appendFormat:", @" isScheduleInbox: %d", -[CalDAVContainer isScheduleInbox](self, "isScheduleInbox"));
  objc_msgSend(v7, "appendFormat:", @" isScheduleOutbox: %d", -[CalDAVContainer isScheduleOutbox](self, "isScheduleOutbox"));
  objc_msgSend(v7, "appendFormat:", @" isNotification: %d", -[CalDAVContainer isNotification](self, "isNotification"));
  objc_msgSend(v7, "appendFormat:", @" isSubscribed: %d", -[CalDAVContainer isSubscribed](self, "isSubscribed"));
  objc_msgSend(v7, "appendFormat:", @" isEventContainer: %d", -[CalDAVContainer isEventContainer](self, "isEventContainer"));
  objc_msgSend(v7, "appendFormat:", @" isTaskContainer: %d", -[CalDAVContainer isTaskContainer](self, "isTaskContainer"));
  objc_msgSend(v7, "appendFormat:", @" isSharedOwner: %d", -[CalDAVContainer isSharedOwner](self, "isSharedOwner"));
  objc_msgSend(v7, "appendFormat:", @" isShared: %d", -[CalDAVContainer isShared](self, "isShared"));
  objc_msgSend(v7, "appendFormat:", @"\n\tsupportsFreebusy: %d", -[CalDAVContainer supportsFreebusy](self, "supportsFreebusy"));
  objc_msgSend(v7, "appendFormat:", @"\n\tSchedule Transparent: %d", -[CalDAVContainer isScheduleTransparent](self, "isScheduleTransparent"));
  objc_msgSend(v7, "appendFormat:", @"\n\tCan Be Published: %d", -[CalDAVContainer canBePublished](self, "canBePublished"));
  objc_msgSend(v7, "appendFormat:", @"\n\tIs Family: %d", -[CalDAVContainer isFamilyCalendar](self, "isFamilyCalendar"));
  objc_msgSend(v7, "appendFormat:", @"\n\tIs Marked Undeletable: %d", -[CalDAVContainer isMarkedUndeletable](self, "isMarkedUndeletable"));
  objc_msgSend(v7, "appendFormat:", @"\n\tIs Marked Immutable Sharees: %d", -[CalDAVContainer isMarkedImmutableSharees](self, "isMarkedImmutableSharees"));
  v8 = [(CalDAVContainer *)self calendarDescription];
  [v7 appendFormat:@"\n\tCalendar Description: %@", v8];

  v9 = [(CalDAVContainer *)self ctag];
  [v7 appendFormat:@"\n\tctag: %@", v9];

  v10 = [(CalDAVContainer *)self calendarColor];
  [v7 appendFormat:@"\n\tCalendar Color: %@", v10];

  v11 = [(CalDAVContainer *)self calendarOrder];
  [v7 appendFormat:@"\n\tCalendar Order: %@", v11];

  objc_msgSend(v7, "appendFormat:", @"\n\tsubscribedStripAlarms: %d", -[CalDAVContainer subscribedStripAlarms](self, "subscribedStripAlarms"));
  objc_msgSend(v7, "appendFormat:", @" subscribedStripTodos: %d", -[CalDAVContainer subscribedStripTodos](self, "subscribedStripTodos"));
  objc_msgSend(v7, "appendFormat:", @" subscribedStripAttachments: %d", -[CalDAVContainer subscribedStripAttachments](self, "subscribedStripAttachments"));
  v12 = [(CalDAVContainer *)self subscribedRefreshRate];
  [v12 timeInterval];
  objc_msgSend(v7, "appendFormat:", @"\n\tRefresh Rate: %f", v13);

  v14 = [(CalDAVContainer *)self publishURL];
  [v7 appendFormat:@"\n\tPublish URL: %@", v14];

  v15 = [(CalDAVContainer *)self prePublishURL];
  [v7 appendFormat:@"\n\tPre publish URL: %@", v15];

  v16 = [(CalDAVContainer *)self timeZone];
  [v7 appendFormat:@"\n\tTime Zone: %@", v16];

  v17 = [(CalDAVContainer *)self source];
  [v7 appendFormat:@"\n\tSource : %@", v17];

  v18 = [(CalDAVContainer *)self freeBusySet];
  [v7 appendFormat:@"\n\tFree Busy Set: %@", v18];

  v19 = [(CalDAVContainer *)self scheduleDefaultCalendarURL];
  [v7 appendFormat:@"\n\tSchedule Default URL: %@", v19];

  v20 = [(CalDAVContainer *)self defaultTimedAlarms];
  [v7 appendFormat:@"\n\tDefault Timed Alarms: %@", v20];

  v21 = [(CalDAVContainer *)self defaultAllDayAlarms];
  [v7 appendFormat:@"\n\tDefault All-Day Alarms: %@", v21];

  v22 = [(CalDAVContainer *)self sharees];
  [v7 appendFormat:@"\n\tSharees: %@", v22];

  v23 = [(CalDAVContainer *)self supportedCalendarComponentSets];
  [v7 appendFormat:@"\n\tSupported Calendar Components Sets: %@", v23];

  v24 = [(CalDAVContainer *)self locationCode];
  [v7 appendFormat:@"\n\tLocation Code: %@", v24];

  v25 = [(CalDAVContainer *)self languageCode];
  [v7 appendFormat:@"\n\tLanguage Code: %@", v25];

  objc_msgSend(v7, "appendFormat:", @"\n\tAuto Provisioned: %d", -[CalDAVContainer autoprovisioned](self, "autoprovisioned"));
  objc_msgSend(v7, "appendFormat:", @"\n\tMax Attendees: %ld", -[CalDAVContainer maxAttendees](self, "maxAttendees"));

  return v7;
}

+ (id)copyPropertyMappingsForParser
{
  v2 = objc_opt_new();
  [v2 CDVAddItemParserMappingWithNameSpace:*MEMORY[0x263F34E10] name:*MEMORY[0x263F34EF8] parseClass:objc_opt_class()];
  uint64_t v3 = *MEMORY[0x263F34DA8];
  [v2 CDVAddItemParserMappingWithNameSpace:*MEMORY[0x263F34DA8] name:*MEMORY[0x263F34D48] parseClass:objc_opt_class()];
  uint64_t v4 = *MEMORY[0x263F34CD8];
  [v2 CDVAddItemParserMappingWithNameSpace:*MEMORY[0x263F34CD8] name:*MEMORY[0x263F34CF8] parseClass:objc_opt_class()];
  uint64_t v5 = *MEMORY[0x263F34F68];
  [v2 CDVAddItemParserMappingWithNameSpace:*MEMORY[0x263F34F68] name:*MEMORY[0x263F34CF0] parseClass:objc_opt_class()];
  [v2 CDVAddItemParserMappingWithNameSpace:v5 name:*MEMORY[0x263F34D08] parseClass:objc_opt_class()];
  [v2 CDVAddItemParserMappingWithNameSpace:v4 name:*MEMORY[0x263F34F40] parseClass:objc_opt_class()];
  [v2 CDVAddItemParserMappingWithNameSpace:v3 name:*MEMORY[0x263F34D80] parseClass:objc_opt_class()];
  [v2 CDVAddItemParserMappingWithNameSpace:v3 name:*MEMORY[0x263F34D88] parseClass:objc_opt_class()];
  [v2 CDVAddItemParserMappingWithNameSpace:v3 name:*MEMORY[0x263F34D90] parseClass:objc_opt_class()];
  [v2 CDVAddItemParserMappingWithNameSpace:v5 name:*MEMORY[0x263F34EF0] parseClass:objc_opt_class()];
  [v2 CDVAddItemParserMappingWithNameSpace:v3 name:*MEMORY[0x263F34D68] parseClass:objc_opt_class()];
  [v2 CDVAddItemParserMappingWithNameSpace:v3 name:@"pre-publish-url" parseClass:objc_opt_class()];
  [v2 CDVAddItemParserMappingWithNameSpace:v4 name:*MEMORY[0x263F34D00] parseClass:objc_opt_class()];
  [v2 CDVAddItemParserMappingWithNameSpace:v4 name:*MEMORY[0x263F34F10] parseClass:objc_opt_class()];
  [v2 CDVAddItemParserMappingWithNameSpace:v4 name:*MEMORY[0x263F34F18] parseClass:objc_opt_class()];
  [v2 CDVAddItemParserMappingWithNameSpace:v4 name:*MEMORY[0x263F34DB0] parseClass:objc_opt_class()];
  [v2 CDVAddItemParserMappingWithNameSpace:v3 name:*MEMORY[0x263F34D18] parseClass:objc_opt_class()];
  [v2 CDVAddItemParserMappingWithNameSpace:v3 name:*MEMORY[0x263F34D78] parseClass:objc_opt_class()];
  [v2 CDVAddItemParserMappingWithNameSpace:v4 name:@"supported-calendar-component-sets" parseClass:objc_opt_class()];
  [v2 CDVAddItemParserMappingWithNameSpace:v4 name:@"default-alarm-vevent-date" parseClass:objc_opt_class()];
  [v2 CDVAddItemParserMappingWithNameSpace:v4 name:@"default-alarm-vevent-datetime" parseClass:objc_opt_class()];
  [v2 CDVAddItemParserMappingWithNameSpace:v4 name:@"calendar-alarm" parseClass:objc_opt_class()];
  [v2 CDVAddItemParserMappingWithNameSpace:v5 name:@"language-code" parseClass:objc_opt_class()];
  [v2 CDVAddItemParserMappingWithNameSpace:v5 name:@"location-code" parseClass:objc_opt_class()];
  [v2 CDVAddItemParserMappingWithNameSpace:v5 name:@"autoprovisioned" parseClass:objc_opt_class()];
  [v2 CDVAddItemParserMappingWithNameSpace:v4 name:*MEMORY[0x263F34EA8] parseClass:objc_opt_class()];
  return v2;
}

- (void)applyParsedProperties:(id)a3
{
  id v4 = a3;
  v66.receiver = self;
  v66.super_class = (Class)CalDAVContainer;
  [(CoreDAVContainer *)&v66 applyParsedProperties:v4];
  uint64_t v5 = *MEMORY[0x263F34CD8];
  v6 = [v4 CDVObjectForKeyWithNameSpace:*MEMORY[0x263F34CD8] andName:*MEMORY[0x263F34CF8]];
  v7 = [v6 payloadAsString];
  [(CalDAVContainer *)self setCalendarDescription:v7];

  uint64_t v8 = *MEMORY[0x263F34DA8];
  v9 = [v4 CDVObjectForKeyWithNameSpace:*MEMORY[0x263F34DA8] andName:*MEMORY[0x263F34D48]];
  v10 = [v9 payloadAsString];
  [(CalDAVContainer *)self setCtag:v10];

  uint64_t v11 = *MEMORY[0x263F34F68];
  v12 = [v4 CDVObjectForKeyWithNameSpace:*MEMORY[0x263F34F68] andName:*MEMORY[0x263F34CF0]];
  uint64_t v13 = [v12 symbolicColorName];
  [(CalDAVContainer *)self setSymbolicColorName:v13];

  v14 = [v12 colorString];
  [(CalDAVContainer *)self setCalendarColor:v14];

  v15 = [v4 CDVObjectForKeyWithNameSpace:v11 andName:*MEMORY[0x263F34D08]];
  v16 = [v15 payloadAsString];
  [(CalDAVContainer *)self setCalendarOrder:v16];

  v17 = [v4 CDVObjectForKeyWithNameSpace:v5 andName:*MEMORY[0x263F34F40]];
  v18 = [v17 compNames];
  [(CalDAVContainer *)self setSupportedCalendarComponentSet:v18];

  v19 = [v4 CDVObjectForKeyWithNameSpace:v8 andName:*MEMORY[0x263F34D80]];
  [(CalDAVContainer *)self setSubscribedStripAlarms:v19 != 0];

  v20 = [v4 CDVObjectForKeyWithNameSpace:v8 andName:*MEMORY[0x263F34D88]];
  [(CalDAVContainer *)self setSubscribedStripAttachments:v20 != 0];

  v21 = [v4 CDVObjectForKeyWithNameSpace:v8 andName:*MEMORY[0x263F34D90]];
  [(CalDAVContainer *)self setSubscribedStripTodos:v21 != 0];

  v22 = [v4 CDVObjectForKeyWithNameSpace:v11 andName:*MEMORY[0x263F34EF0]];
  v23 = [v22 payloadAsString];

  if (v23)
  {
    v24 = [MEMORY[0x263F886F0] generateDurationFromICSString:v23];
    [(CalDAVContainer *)self setSubscribedRefreshRate:v24];
  }
  v25 = [v4 CDVObjectForKeyWithNameSpace:v8 andName:*MEMORY[0x263F34D68]];
  v26 = [v25 href];
  objc_super v27 = [v26 payloadAsFullURL];
  [(CalDAVContainer *)self setPublishURL:v27];

  v28 = [v4 CDVObjectForKeyWithNameSpace:v8 andName:@"pre-publish-url"];
  v29 = [v28 href];
  v30 = [v29 payloadAsFullURL];
  [(CalDAVContainer *)self setPrePublishURL:v30];

  v31 = [v4 CDVObjectForKeyWithNameSpace:v5 andName:*MEMORY[0x263F34D00]];
  v32 = [v31 hrefsAsOriginalURLs];
  [(CalDAVContainer *)self setFreeBusySet:v32];

  v33 = [v4 CDVObjectForKeyWithNameSpace:v5 andName:*MEMORY[0x263F34F18]];
  v34 = [v33 href];
  v35 = [v34 payloadAsFullURL];
  [(CalDAVContainer *)self setScheduleDefaultCalendarURL:v35];

  v36 = [v4 CDVObjectForKeyWithNameSpace:v5 andName:*MEMORY[0x263F34F10]];
  -[CalDAVContainer setIsScheduleTransparent:](self, "setIsScheduleTransparent:", [v36 isScheduleTransparent]);

  [(CalDAVContainer *)self _setTimeZoneFromProperties:v4 onCalendar:self];
  uint64_t v37 = *MEMORY[0x263F34D18];
  v38 = [v4 CDVObjectForKeyWithNameSpace:v8 andName:*MEMORY[0x263F34D18]];
  v39 = [v38 canBePublished];
  [(CalDAVContainer *)self setCanBePublished:v39 != 0];

  v40 = [v4 CDVObjectForKeyWithNameSpace:v8 andName:v37];
  v41 = [v40 canBeShared];
  [(CalDAVContainer *)self setCanBeShared:v41 != 0];

  v42 = [v4 CDVObjectForKeyWithNameSpace:v8 andName:v37];
  v43 = [v42 isMarkedImmutableSharees];
  [(CalDAVContainer *)self setIsMarkedImmutableSharees:v43 != 0];

  v44 = [v4 CDVObjectForKeyWithNameSpace:v8 andName:v37];
  v45 = [v44 isMarkedUndeletable];
  [(CalDAVContainer *)self setIsMarkedUndeletable:v45 != 0];

  v46 = [v4 CDVObjectForKeyWithNameSpace:v5 andName:*MEMORY[0x263F34EA8]];
  -[CalDAVContainer setMaxAttendees:](self, "setMaxAttendees:", [v46 payloadAsNSInteger]);

  LODWORD(v43) = [(CalDAVContainer *)self isSubscribed];
  v47 = [v4 CDVObjectForKeyWithNameSpace:v8 andName:*MEMORY[0x263F34D78]];
  v48 = [v47 href];
  v49 = v48;
  if (v43) {
    [v48 payloadAsOriginalURL];
  }
  else {
  v50 = [v48 payloadAsFullURL];
  }
  [(CalDAVContainer *)self setSource:v50];

  v51 = [v4 CDVObjectForKeyWithNameSpace:v5 andName:@"default-alarm-vevent-date"];
  v52 = [v51 payloadAsString];
  [(CalDAVContainer *)self setDefaultAllDayAlarms:v52];

  v53 = [v4 CDVObjectForKeyWithNameSpace:v5 andName:@"default-alarm-vevent-datetime"];
  v54 = [v53 payloadAsString];
  [(CalDAVContainer *)self setDefaultTimedAlarms:v54];

  v55 = [v4 CDVObjectForKeyWithNameSpace:v5 andName:@"calendar-alarm"];
  v56 = [v55 payloadAsString];
  [(CalDAVContainer *)self setAlarms:v56];

  v57 = [v4 CDVObjectForKeyWithNameSpace:v8 andName:@"invite"];
  v58 = [v57 users];
  [(CalDAVContainer *)self setSharees:v58];

  v59 = [v4 CDVObjectForKeyWithNameSpace:v5 andName:@"supported-calendar-component-sets"];
  v60 = [v59 componentsAsString];
  [(CalDAVContainer *)self setSupportedCalendarComponentSets:v60];

  v61 = [v4 CDVObjectForKeyWithNameSpace:v11 andName:@"language-code"];
  v62 = [v61 payloadAsString];
  [(CalDAVContainer *)self setLanguageCode:v62];

  v63 = [v4 CDVObjectForKeyWithNameSpace:v11 andName:@"location-code"];
  v64 = [v63 payloadAsString];
  [(CalDAVContainer *)self setLocationCode:v64];

  v65 = [v4 CDVObjectForKeyWithNameSpace:v11 andName:@"autoprovisioned"];
  [(CalDAVContainer *)self setAutoprovisioned:v65 != 0];
}

- (void)_setTimeZoneFromProperties:(id)a3 onCalendar:(id)a4
{
  id v5 = a4;
  v6 = [a3 CDVObjectForKeyWithNameSpace:*MEMORY[0x263F34CD8] andName:*MEMORY[0x263F34DB0]];
  v7 = [v6 payloadAsString];

  if (v7)
  {
    id v24 = 0;
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F886E8]) initWithICSString:v7 options:0 error:&v24];
    id v9 = v24;
    if (v9)
    {
      v10 = [MEMORY[0x263F34B30] sharedLogging];
      uint64_t v11 = [v10 logHandleForAccountInfoProvider:0];
      v12 = v11;
      if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_213CEC000, v12, OS_LOG_TYPE_DEBUG, "CalDAVCalendarInfoTaskGroup: Error trying to generate ICSDocument from calendar-timezone property", v23, 2u);
      }
    }
    else
    {
      uint64_t v13 = [v8 calendar];
      v10 = v13;
      if (!v13) {
        goto LABEL_11;
      }
      v14 = [v13 components];
      uint64_t v15 = [v14 count];

      if (v15 != 1) {
        goto LABEL_11;
      }
      v16 = [v10 components];
      v12 = [v16 objectAtIndex:0];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = (void *)MEMORY[0x263EFF8F0];
        v12 = v12;
        v18 = [v17 currentCalendar];
        v19 = [MEMORY[0x263EFF910] date];
        v20 = [v18 components:28 fromDate:v19];

        v21 = objc_msgSend(objc_alloc(MEMORY[0x263F886D8]), "initWithYear:month:day:", objc_msgSend(v20, "year") - 1, objc_msgSend(v20, "month"), objc_msgSend(v20, "day"));
        v22 = [v12 systemTimeZoneForDate:v21];

        [v5 setTimeZone:v22];
      }
    }

LABEL_11:
  }
}

- (void)postProcessWithResponseHeaders:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CalDAVContainer;
  [(CoreDAVContainer *)&v7 postProcessWithResponseHeaders:v4];
  if ([(CalDAVContainer *)self isScheduleOutbox])
  {
    BOOL v5 = [(CalDAVContainer *)self supportsFreebusy];
    if (v4)
    {
      if (!v5)
      {
        v6 = +[CalDAVServerVersion versionWithHTTPHeaders:v4];
        if ([v6 alwaysSupportsFreebusyOnOutbox]) {
          [(CalDAVContainer *)self setOverrideSupportsFreebusy:1];
        }
      }
    }
  }
}

- (BOOL)_isComponentSupportedForString:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CalDAVContainer *)self supportedCalendarComponentSet];

  if (v5)
  {
    v6 = [(CalDAVContainer *)self supportedCalendarComponentSet];
    char v7 = [v6 containsObject:v4];
  }
  else
  {
    char v7 = 1;
  }

  return v7;
}

- (BOOL)isCalendar
{
  uint64_t v3 = [(CoreDAVContainer *)self resourceType];
  if (v3)
  {
    id v4 = [(CoreDAVContainer *)self resourceType];
    BOOL v5 = [v4 calendar];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isScheduleInbox
{
  uint64_t v3 = [(CoreDAVContainer *)self resourceType];
  if (v3)
  {
    id v4 = [(CoreDAVContainer *)self resourceType];
    BOOL v5 = [v4 scheduleInbox];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isScheduleOutbox
{
  uint64_t v3 = [(CoreDAVContainer *)self resourceType];
  if (v3)
  {
    id v4 = [(CoreDAVContainer *)self resourceType];
    BOOL v5 = [v4 scheduleOutbox];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isNotification
{
  uint64_t v3 = [(CoreDAVContainer *)self resourceType];
  if (v3)
  {
    id v4 = [(CoreDAVContainer *)self resourceType];
    BOOL v5 = [v4 notification];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isSubscribed
{
  uint64_t v3 = [(CoreDAVContainer *)self resourceType];
  if (v3)
  {
    id v4 = [(CoreDAVContainer *)self resourceType];
    BOOL v5 = [v4 subscribed];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isSharedOwner
{
  uint64_t v3 = [(CoreDAVContainer *)self resourceType];
  if (v3)
  {
    id v4 = [(CoreDAVContainer *)self resourceType];
    BOOL v5 = [v4 sharedOwner];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isShared
{
  uint64_t v3 = [(CoreDAVContainer *)self resourceType];
  if (v3)
  {
    id v4 = [(CoreDAVContainer *)self resourceType];
    BOOL v5 = [v4 shared];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isFamilyCalendar
{
  uint64_t v3 = [(CoreDAVContainer *)self resourceType];
  if (v3)
  {
    id v4 = [(CoreDAVContainer *)self resourceType];
    BOOL v5 = [v4 isFamilyCalendar];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isEventContainer
{
  return [(CalDAVContainer *)self _isComponentSupportedForString:@"VEVENT"];
}

- (BOOL)isTaskContainer
{
  return [(CalDAVContainer *)self _isComponentSupportedForString:@"VTODO"];
}

- (BOOL)isJournalContainer
{
  return [(CalDAVContainer *)self _isComponentSupportedForString:@"VJOURNAL"];
}

- (BOOL)isPollContainer
{
  return [(CalDAVContainer *)self _isComponentSupportedForString:@"VPOLL"];
}

- (BOOL)supportsFreebusy
{
  if ([(CalDAVContainer *)self overrideSupportsFreebusy]) {
    return 1;
  }
  return [(CalDAVContainer *)self _isComponentSupportedForString:@"VFREEBUSY"];
}

- (NSString)calendarDescription
{
  return self->_calendarDescription;
}

- (void)setCalendarDescription:(id)a3
{
}

- (NSString)ctag
{
  return self->_ctag;
}

- (void)setCtag:(id)a3
{
}

- (NSString)calendarColor
{
  return self->_calendarColor;
}

- (void)setCalendarColor:(id)a3
{
}

- (NSString)symbolicColorName
{
  return self->_symbolicColorName;
}

- (void)setSymbolicColorName:(id)a3
{
}

- (NSString)calendarOrder
{
  return self->_calendarOrder;
}

- (void)setCalendarOrder:(id)a3
{
}

- (NSString)defaultTimedAlarms
{
  return self->_defaultTimedAlarms;
}

- (void)setDefaultTimedAlarms:(id)a3
{
}

- (NSString)defaultAllDayAlarms
{
  return self->_defaultAllDayAlarms;
}

- (void)setDefaultAllDayAlarms:(id)a3
{
}

- (NSSet)supportedCalendarComponentSet
{
  return self->_supportedCalendarComponentSet;
}

- (void)setSupportedCalendarComponentSet:(id)a3
{
}

- (BOOL)subscribedStripAlarms
{
  return self->_subscribedStripAlarms;
}

- (void)setSubscribedStripAlarms:(BOOL)a3
{
  self->_subscribedStripAlarms = a3;
}

- (BOOL)subscribedStripTodos
{
  return self->_subscribedStripTodos;
}

- (void)setSubscribedStripTodos:(BOOL)a3
{
  self->_subscribedStripTodos = a3;
}

- (BOOL)subscribedStripAttachments
{
  return self->_subscribedStripAttachments;
}

- (void)setSubscribedStripAttachments:(BOOL)a3
{
  self->_subscribedStripAttachments = a3;
}

- (ICSDuration)subscribedRefreshRate
{
  return self->_subscribedRefreshRate;
}

- (void)setSubscribedRefreshRate:(id)a3
{
}

- (NSURL)publishURL
{
  return self->_publishURL;
}

- (void)setPublishURL:(id)a3
{
}

- (NSURL)prePublishURL
{
  return self->_prePublishURL;
}

- (void)setPrePublishURL:(id)a3
{
}

- (BOOL)isScheduleTransparent
{
  return self->_isScheduleTransparent;
}

- (void)setIsScheduleTransparent:(BOOL)a3
{
  self->_isScheduleTransparent = a3;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
}

- (BOOL)canBePublished
{
  return self->_canBePublished;
}

- (void)setCanBePublished:(BOOL)a3
{
  self->_canBePublished = a3;
}

- (BOOL)canBeShared
{
  return self->_canBeShared;
}

- (void)setCanBeShared:(BOOL)a3
{
  self->_canBeShared = a3;
}

- (BOOL)isMarkedUndeletable
{
  return self->_isMarkedUndeletable;
}

- (void)setIsMarkedUndeletable:(BOOL)a3
{
  self->_isMarkedUndeletable = a3;
}

- (BOOL)isMarkedImmutableSharees
{
  return self->_isMarkedImmutableSharees;
}

- (void)setIsMarkedImmutableSharees:(BOOL)a3
{
  self->_isMarkedImmutableSharees = a3;
}

- (NSURL)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (NSSet)freeBusySet
{
  return self->_freeBusySet;
}

- (void)setFreeBusySet:(id)a3
{
}

- (NSURL)scheduleDefaultCalendarURL
{
  return self->_scheduleDefaultCalendarURL;
}

- (void)setScheduleDefaultCalendarURL:(id)a3
{
}

- (NSSet)sharees
{
  return self->_sharees;
}

- (void)setSharees:(id)a3
{
}

- (NSString)supportedCalendarComponentSets
{
  return self->_supportedCalendarComponentSets;
}

- (void)setSupportedCalendarComponentSets:(id)a3
{
}

- (NSString)locationCode
{
  return self->_locationCode;
}

- (void)setLocationCode:(id)a3
{
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
}

- (BOOL)autoprovisioned
{
  return self->_autoprovisioned;
}

- (void)setAutoprovisioned:(BOOL)a3
{
  self->_autoprovisioned = a3;
}

- (NSString)alarms
{
  return self->_alarms;
}

- (void)setAlarms:(id)a3
{
}

- (int64_t)maxAttendees
{
  return self->_maxAttendees;
}

- (void)setMaxAttendees:(int64_t)a3
{
  self->_maxAttendees = a3;
}

- (BOOL)overrideSupportsFreebusy
{
  return self->_overrideSupportsFreebusy;
}

- (void)setOverrideSupportsFreebusy:(BOOL)a3
{
  self->_overrideSupportsFreebusy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarms, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_locationCode, 0);
  objc_storeStrong((id *)&self->_supportedCalendarComponentSets, 0);
  objc_storeStrong((id *)&self->_sharees, 0);
  objc_storeStrong((id *)&self->_scheduleDefaultCalendarURL, 0);
  objc_storeStrong((id *)&self->_freeBusySet, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_prePublishURL, 0);
  objc_storeStrong((id *)&self->_publishURL, 0);
  objc_storeStrong((id *)&self->_subscribedRefreshRate, 0);
  objc_storeStrong((id *)&self->_supportedCalendarComponentSet, 0);
  objc_storeStrong((id *)&self->_defaultAllDayAlarms, 0);
  objc_storeStrong((id *)&self->_defaultTimedAlarms, 0);
  objc_storeStrong((id *)&self->_calendarOrder, 0);
  objc_storeStrong((id *)&self->_symbolicColorName, 0);
  objc_storeStrong((id *)&self->_calendarColor, 0);
  objc_storeStrong((id *)&self->_ctag, 0);
  objc_storeStrong((id *)&self->_calendarDescription, 0);
}

@end