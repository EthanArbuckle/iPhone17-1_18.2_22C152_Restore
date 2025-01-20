@interface EKSerializableEvent
+ (id)classesForKey;
+ (id)serializedProperties;
- (BOOL)isAllDay;
- (EKSerializableEvent)initWithEvent:(id)a3;
- (EKSerializableParticipant)selfAttendee;
- (EKSerializableStructuredLocation)structuredLocation;
- (NSArray)alarms;
- (NSArray)attachments;
- (NSArray)attendees;
- (NSArray)recurrenceRules;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSNumber)isNew;
- (NSString)calendarIdentifier;
- (NSString)location;
- (NSString)notes;
- (NSString)title;
- (NSTimeZone)timeZone;
- (NSURL)url;
- (double)travelTime;
- (id)createEventInEventStore:(id)a3;
- (void)_initAlarms:(id)a3;
- (void)_initAttachments:(id)a3;
- (void)_initAttendees:(id)a3 selfAttendee:(id)a4;
- (void)_initRecurrenceRule:(id)a3;
- (void)setAlarms:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setAttendees:(id)a3;
- (void)setCalendarIdentifier:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setIsAllDay:(BOOL)a3;
- (void)setIsNew:(id)a3;
- (void)setLocation:(id)a3;
- (void)setNotes:(id)a3;
- (void)setRecurrenceRules:(id)a3;
- (void)setSelfAttendee:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setStructuredLocation:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTravelTime:(double)a3;
- (void)setUrl:(id)a3;
@end

@implementation EKSerializableEvent

+ (id)serializedProperties
{
  v4[10] = *MEMORY[0x1E4F143B8];
  v4[0] = @"startDate";
  v4[1] = @"endDate";
  v4[2] = @"isAllDay";
  v4[3] = @"title";
  v4[4] = @"notes";
  v4[5] = @"URL";
  v4[6] = @"location";
  v4[7] = @"travelTime";
  v4[8] = @"calendar.calendarIdentifier";
  v4[9] = @"timeZone";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:10];

  return v2;
}

+ (id)classesForKey
{
  v39[17] = *MEMORY[0x1E4F143B8];
  v38[0] = @"startDate";
  uint64_t v37 = objc_opt_class();
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
  v39[0] = v20;
  v38[1] = @"endDate";
  uint64_t v36 = objc_opt_class();
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
  v39[1] = v19;
  v38[2] = @"isAllDay";
  uint64_t v35 = objc_opt_class();
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
  v39[2] = v18;
  v38[3] = @"title";
  uint64_t v34 = objc_opt_class();
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  v39[3] = v17;
  v38[4] = @"notes";
  uint64_t v33 = objc_opt_class();
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  v39[4] = v16;
  v38[5] = @"url";
  uint64_t v32 = objc_opt_class();
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  v39[5] = v15;
  v38[6] = @"travelTime";
  uint64_t v31 = objc_opt_class();
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  v39[6] = v14;
  v38[7] = @"location";
  uint64_t v30 = objc_opt_class();
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  v39[7] = v13;
  v38[8] = @"structuredLocation";
  v29[0] = objc_opt_class();
  v29[1] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  v39[8] = v2;
  v38[9] = @"attendees";
  v28[0] = objc_opt_class();
  v28[1] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  v39[9] = v3;
  v38[10] = @"selfAttendee";
  uint64_t v27 = objc_opt_class();
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  v39[10] = v4;
  v38[11] = @"attachments";
  v26[0] = objc_opt_class();
  v26[1] = objc_opt_class();
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  v39[11] = v5;
  v38[12] = @"alarms";
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  v39[12] = v6;
  v38[13] = @"recurrenceRules";
  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  v39[13] = v7;
  v38[14] = @"calendarIdentifier";
  uint64_t v23 = objc_opt_class();
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  v39[14] = v8;
  v38[15] = @"timeZone";
  uint64_t v22 = objc_opt_class();
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  v39[15] = v9;
  v38[16] = @"isNew";
  uint64_t v21 = objc_opt_class();
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  v39[16] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:17];

  return v11;
}

- (EKSerializableEvent)initWithEvent:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)EKSerializableEvent;
  v5 = [(EKSerializableEvent *)&v28 init];
  if (v5)
  {
    v6 = [v4 startDate];
    [(EKSerializableEvent *)v5 setStartDate:v6];

    v7 = [v4 endDateUnadjustedForLegacyClients];
    [(EKSerializableEvent *)v5 setEndDate:v7];

    -[EKSerializableEvent setIsAllDay:](v5, "setIsAllDay:", [v4 isAllDay]);
    v8 = [v4 title];
    [(EKSerializableEvent *)v5 setTitle:v8];

    v9 = [v4 notes];
    [(EKSerializableEvent *)v5 setNotes:v9];

    v10 = [v4 URL];
    [(EKSerializableEvent *)v5 setUrl:v10];

    [v4 travelTime];
    -[EKSerializableEvent setTravelTime:](v5, "setTravelTime:");
    v11 = [v4 location];
    [(EKSerializableEvent *)v5 setLocation:v11];

    v12 = [v4 timeZone];
    [(EKSerializableEvent *)v5 setTimeZone:v12];

    v13 = NSNumber;
    v14 = [v4 objectID];
    v15 = objc_msgSend(v13, "numberWithBool:", objc_msgSend(v14, "isTemporary"));
    [(EKSerializableEvent *)v5 setIsNew:v15];

    v16 = [v4 structuredLocation];

    if (v16)
    {
      v17 = [EKSerializableStructuredLocation alloc];
      v18 = [v4 structuredLocation];
      v19 = [(EKSerializableStructuredLocation *)v17 initWithStructuredLocation:v18];
      [(EKSerializableEvent *)v5 setStructuredLocation:v19];
    }
    v20 = [v4 calendar];
    uint64_t v21 = [v20 calendarIdentifier];
    [(EKSerializableEvent *)v5 setCalendarIdentifier:v21];

    uint64_t v22 = [v4 allAlarms];
    [(EKSerializableEvent *)v5 _initAlarms:v22];

    uint64_t v23 = [v4 attachments];
    [(EKSerializableEvent *)v5 _initAttachments:v23];

    v24 = [v4 attendees];
    v25 = [v4 selfAttendee];
    [(EKSerializableEvent *)v5 _initAttendees:v24 selfAttendee:v25];

    v26 = [v4 singleRecurrenceRule];
    [(EKSerializableEvent *)v5 _initRecurrenceRule:v26];
  }
  return v5;
}

- (void)_initAttendees:(id)a3 selfAttendee:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(id *)(*((void *)&v18 + 1) + 8 * v13);
        v15 = [EKSerializableParticipant alloc];
        v16 = -[EKSerializableParticipant initWithParticipant:](v15, "initWithParticipant:", v14, (void)v18);
        [v8 addObject:v16];
        if (v14 == v7) {
          [(EKSerializableEvent *)self setSelfAttendee:v16];
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  v17 = (void *)[v8 copy];
  [(EKSerializableEvent *)self setAttendees:v17];
}

- (void)_initAlarms:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
        uint64_t v12 = [EKSerializableAlarm alloc];
        uint64_t v13 = -[EKSerializableAlarm initWithAlarm:](v12, "initWithAlarm:", v11, (void)v15);
        [v5 addObject:v13];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  id v14 = (void *)[v5 copy];
  [(EKSerializableEvent *)self setAlarms:v14];
}

- (void)_initAttachments:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
        uint64_t v12 = [EKSerializableAttachment alloc];
        uint64_t v13 = -[EKSerializableAttachment initWithAttachment:](v12, "initWithAttachment:", v11, (void)v15);
        [v5 addObject:v13];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  id v14 = (void *)[v5 copy];
  [(EKSerializableEvent *)self setAttachments:v14];
}

- (void)_initRecurrenceRule:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [[EKSerializableRecurrenceRule alloc] initWithRecurrenceRule:v4];

  v7[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [(EKSerializableEvent *)self setRecurrenceRules:v6];
}

- (id)createEventInEventStore:(id)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[EKEvent eventWithEventStore:v4];
  id v6 = [(EKSerializableEvent *)self timeZone];
  [v5 setTimeZone:v6];

  uint64_t v7 = [(EKSerializableEvent *)self startDate];
  [v5 setStartDate:v7];

  objc_msgSend(v5, "setAllDay:", -[EKSerializableEvent isAllDay](self, "isAllDay"));
  uint64_t v8 = [(EKSerializableEvent *)self endDate];
  [v5 setEndDateUnadjustedForLegacyClients:v8];

  uint64_t v9 = [(EKSerializableEvent *)self title];
  [v5 setTitle:v9];

  uint64_t v10 = [(EKSerializableEvent *)self notes];
  [v5 setNotes:v10];

  uint64_t v11 = [(EKSerializableEvent *)self url];
  [v5 setURL:v11];

  [(EKSerializableEvent *)self travelTime];
  objc_msgSend(v5, "setTravelTime:");
  uint64_t v12 = [(EKSerializableEvent *)self location];
  [v5 setLocation:v12];

  uint64_t v13 = [(EKSerializableEvent *)self structuredLocation];
  id v14 = [v13 createStructuredLocation];
  [v5 setStructuredLocation:v14];

  long long v15 = [(EKSerializableEvent *)self calendarIdentifier];
  v51 = v4;
  uint64_t v16 = [v4 calendarWithIdentifier:v15];

  v52 = (void *)v16;
  [v5 setCalendar:v16];
  [v5 setAlarms:MEMORY[0x1E4F1CBF0]];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v17 = self;
  long long v18 = [(EKSerializableEvent *)self alarms];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v66 objects:v74 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v67 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        id v65 = 0;
        v24 = [v23 createAlarm:&v65];
        id v25 = v65;
        if (v24)
        {
          [v5 addAlarm:v24];
        }
        else
        {
          v26 = EKLogHandle;
          if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v73 = v25;
            _os_log_error_impl(&dword_1A4E47000, v26, OS_LOG_TYPE_ERROR, "Error creating alarm: [%@]", buf, 0xCu);
          }
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v66 objects:v74 count:16];
    }
    while (v20);
  }

  long long v64 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v61 = 0u;
  uint64_t v27 = [(EKSerializableEvent *)v17 attendees];
  uint64_t v28 = [v27 countByEnumeratingWithState:&v61 objects:v71 count:16];
  if (!v28)
  {
    v40 = 0;
    goto LABEL_29;
  }
  uint64_t v29 = v28;
  v53 = 0;
  uint64_t v30 = *(void *)v62;
  do
  {
    for (uint64_t j = 0; j != v29; ++j)
    {
      if (*(void *)v62 != v30) {
        objc_enumerationMutation(v27);
      }
      uint64_t v32 = *(void **)(*((void *)&v61 + 1) + 8 * j);
      id v60 = 0;
      uint64_t v33 = [v32 createAttendee:&v60];
      id v34 = v60;
      if (v33)
      {
        [v5 addAttendee:v33];
        uint64_t v35 = [(EKSerializableEvent *)v17 selfAttendee];

        if (v32 == v35)
        {
          uint64_t v36 = [v52 ownerIdentityOrganizer];
          char v37 = [v33 isEqualToParticipant:v36];

          if ((v37 & 1) == 0)
          {
            id v38 = v33;

            v53 = v38;
          }
          [v5 setSelfAttendee:v33];
        }
      }
      else
      {
        v39 = EKLogHandle;
        if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v73 = v34;
          _os_log_error_impl(&dword_1A4E47000, v39, OS_LOG_TYPE_ERROR, "Error creating attendee: [%@]", buf, 0xCu);
        }
      }
    }
    uint64_t v29 = [v27 countByEnumeratingWithState:&v61 objects:v71 count:16];
  }
  while (v29);

  v40 = v53;
  if (v53)
  {
    [v5 removeAttendee:v53];
    [v5 addOrganizerAndSelfAttendeeForNewInvitation];
    uint64_t v27 = [v5 selfAttendee];
    objc_msgSend(v27, "setParticipantStatus:", objc_msgSend(v53, "participantStatus"));
LABEL_29:
    v54 = v40;

    goto LABEL_31;
  }
  v54 = 0;
LABEL_31:
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  v41 = [(EKSerializableEvent *)v17 recurrenceRules];
  uint64_t v42 = [v41 countByEnumeratingWithState:&v56 objects:v70 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v57;
    do
    {
      for (uint64_t k = 0; k != v43; ++k)
      {
        if (*(void *)v57 != v44) {
          objc_enumerationMutation(v41);
        }
        v46 = *(void **)(*((void *)&v56 + 1) + 8 * k);
        id v55 = 0;
        v47 = [v46 createRecurrenceRule:&v55];
        id v48 = v55;
        if (v47)
        {
          [v5 addRecurrenceRule:v47];
        }
        else
        {
          v49 = EKLogHandle;
          if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v73 = v48;
            _os_log_error_impl(&dword_1A4E47000, v49, OS_LOG_TYPE_ERROR, "Error creating recurrence rule: [%@]", buf, 0xCu);
          }
        }
      }
      uint64_t v43 = [v41 countByEnumeratingWithState:&v56 objects:v70 count:16];
    }
    while (v43);
  }

  return v5;
}

- (NSNumber)isNew
{
  return self->_isNew;
}

- (void)setIsNew:(id)a3
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

- (BOOL)isAllDay
{
  return self->_isAllDay;
}

- (void)setIsAllDay:(BOOL)a3
{
  self->_isAllDay = a3;
}

- (double)travelTime
{
  return self->_travelTime;
}

- (void)setTravelTime:(double)a3
{
  self->_travelTime = a3;
}

- (NSArray)recurrenceRules
{
  return self->_recurrenceRules;
}

- (void)setRecurrenceRules:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)notes
{
  return self->_notes;
}

- (void)setNotes:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSString)calendarIdentifier
{
  return self->_calendarIdentifier;
}

- (void)setCalendarIdentifier:(id)a3
{
}

- (NSString)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (EKSerializableStructuredLocation)structuredLocation
{
  return self->_structuredLocation;
}

- (void)setStructuredLocation:(id)a3
{
}

- (NSArray)attendees
{
  return self->_attendees;
}

- (void)setAttendees:(id)a3
{
}

- (EKSerializableParticipant)selfAttendee
{
  return self->_selfAttendee;
}

- (void)setSelfAttendee:(id)a3
{
}

- (NSArray)alarms
{
  return self->_alarms;
}

- (void)setAlarms:(id)a3
{
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_alarms, 0);
  objc_storeStrong((id *)&self->_selfAttendee, 0);
  objc_storeStrong((id *)&self->_attendees, 0);
  objc_storeStrong((id *)&self->_structuredLocation, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_calendarIdentifier, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_recurrenceRules, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);

  objc_storeStrong((id *)&self->_isNew, 0);
}

@end