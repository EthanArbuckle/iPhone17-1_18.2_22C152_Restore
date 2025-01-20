@interface EKCalendarEventInvitationNotification
- (BOOL)acknowledgeWithEventStore:(id)a3 error:(id *)a4;
- (BOOL)attendeeReplyChanged;
- (BOOL)couldBeJunk;
- (BOOL)dateChanged;
- (BOOL)expanded;
- (BOOL)hasRecurrenceRules;
- (BOOL)isAllDay;
- (BOOL)isForReReply;
- (BOOL)isInvitation;
- (BOOL)isLocationDecline;
- (BOOL)isProposedNewTime;
- (BOOL)locationChanged;
- (BOOL)needsReply;
- (BOOL)proposedStartDateIsInFutureForAttendee:(id)a3;
- (BOOL)recurrenceChanged;
- (BOOL)timeChanged;
- (BOOL)titleChanged;
- (BOOL)videoConferenceChanged;
- (EKCalendarEventInvitationNotification)initWithEvent:(id)a3;
- (EKCalendarEventInvitationNotificationAttendee)expandedProposedTimeAttendee;
- (EKCalendarEventInvitationNotificationAttendee)owner;
- (EKRecurrenceRule)recurrenceRule;
- (NSArray)attendees;
- (NSDate)endDate;
- (NSDate)participationStatusModifiedDate;
- (NSDate)startDate;
- (NSDate)startDateForNextOccurrence;
- (NSString)invitedBy;
- (NSString)location;
- (NSTimeZone)timeZone;
- (id)copyWithZone:(_NSZone *)a3;
- (id)eventFromEventStore:(id)a3;
- (id)nearestProposedTime;
- (int64_t)participationStatus;
- (int64_t)status;
- (void)setAllDay:(BOOL)a3;
- (void)setAttendeeReplyChanged:(BOOL)a3;
- (void)setAttendees:(id)a3;
- (void)setDateChanged:(BOOL)a3;
- (void)setEndDate:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setExpandedProposedTimeAttendee:(id)a3;
- (void)setIsForReReply:(BOOL)a3;
- (void)setIsLocationDecline:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setLocationChanged:(BOOL)a3;
- (void)setOwner:(id)a3;
- (void)setParticipationStatus:(int64_t)a3;
- (void)setParticipationStatusModifiedDate:(id)a3;
- (void)setRecurrenceChanged:(BOOL)a3;
- (void)setRecurrenceRule:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setStartDateForNextOccurrence:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setTimeChanged:(BOOL)a3;
- (void)setTimeZone:(id)a3;
- (void)setTitleChanged:(BOOL)a3;
- (void)setVideoConferenceChanged:(BOOL)a3;
@end

@implementation EKCalendarEventInvitationNotification

- (EKCalendarEventInvitationNotification)initWithEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 status];
  if (v5 == 3)
  {
    int v6 = 0;
    uint64_t v7 = 2;
  }
  else if ([v4 attendeeReplyChanged])
  {
    int v6 = 1;
    uint64_t v7 = 3;
  }
  else if (([v4 dateChanged] & 1) != 0 {
         || ([v4 timeChanged] & 1) != 0
  }
         || ([v4 titleChanged] & 1) != 0
         || ([v4 locationChanged] & 1) != 0
         || ([v4 videoConferenceChanged] & 1) != 0)
  {
    int v6 = 0;
    uint64_t v7 = 1;
  }
  else
  {
    int v6 = 0;
    uint64_t v7 = [v4 recurrenceChanged];
  }
  v71.receiver = self;
  v71.super_class = (Class)EKCalendarEventInvitationNotification;
  v8 = [(EKCalendarNotification *)&v71 initWithType:v7];
  if (v8)
  {
    v9 = [v4 title];
    [(EKCalendarNotification *)v8 setTitle:v9];

    v10 = [v4 locationWithoutPrediction];
    [(EKCalendarEventInvitationNotification *)v8 setLocation:v10];

    v11 = [v4 organizer];
    v12 = [v11 name];
    [(EKCalendarNotification *)v8 setName:v12];

    v13 = [v4 selfAttendee];
    v14 = [v13 name];
    [(EKCalendarNotification *)v8 setRecipientName:v14];

    v15 = [v4 organizer];
    v16 = [v15 firstName];
    [(EKCalendarNotification *)v8 setFirstName:v16];

    v17 = [v4 organizer];
    v18 = [v17 lastName];
    [(EKCalendarNotification *)v8 setLastName:v18];

    v19 = [v4 organizer];
    v20 = [v19 emailAddress];
    [(EKCalendarNotification *)v8 setEmailAddress:v20];

    v21 = [v4 organizer];
    v22 = [v21 phoneNumber];
    [(EKCalendarNotification *)v8 setPhoneNumber:v22];

    -[EKCalendarNotification setHiddenFromNotificationCenter:](v8, "setHiddenFromNotificationCenter:", [v4 invitationStatus] == 1);
    v23 = [v4 calendar];
    -[EKCalendarNotification setDotColor:](v8, "setDotColor:", [v23 CGColor]);

    -[EKCalendarNotification setAlerted:](v8, "setAlerted:", [v4 invitationStatus] != 3);
    v24 = [v4 calendar];
    v25 = [v24 source];
    [(EKCalendarNotification *)v8 setSource:v25];

    v26 = [v4 objectID];
    [(EKCalendarNotification *)v8 setObjectID:v26];

    v27 = [v4 externalURL];
    [(EKCalendarNotification *)v8 setURL:v27];

    -[EKCalendarEventInvitationNotification setStatus:](v8, "setStatus:", [v4 status]);
    v28 = [v4 startDate];
    [(EKCalendarEventInvitationNotification *)v8 setStartDate:v28];

    v29 = [MEMORY[0x1E4F1C9C8] CalSimulatedDateForNow];
    v30 = [v4 earliestOccurrenceEndingAfter:v29 excludeSignificantDetachments:1 excludeCanceledDetachments:v5 != 3 excludeDeclinedDetachments:1];
    v31 = [v30 startDate];
    [(EKCalendarEventInvitationNotification *)v8 setStartDateForNextOccurrence:v31];

    v32 = [v4 endDateUnadjustedForLegacyClients];
    [(EKCalendarEventInvitationNotification *)v8 setEndDate:v32];

    -[EKCalendarEventInvitationNotification setAllDay:](v8, "setAllDay:", [v4 isAllDay]);
    v33 = [v4 timeZone];
    [(EKCalendarEventInvitationNotification *)v8 setTimeZone:v33];

    v34 = [v4 recurrenceRules];
    v35 = [v34 firstObject];
    [(EKCalendarEventInvitationNotification *)v8 setRecurrenceRule:v35];

    v36 = [v4 participationStatusModifiedDate];
    [(EKCalendarEventInvitationNotification *)v8 setParticipationStatusModifiedDate:v36];

    -[EKCalendarEventInvitationNotification setParticipationStatus:](v8, "setParticipationStatus:", [v4 participationStatus]);
    -[EKCalendarEventInvitationNotification setTimeChanged:](v8, "setTimeChanged:", [v4 timeChanged]);
    -[EKCalendarEventInvitationNotification setDateChanged:](v8, "setDateChanged:", [v4 dateChanged]);
    -[EKCalendarEventInvitationNotification setTitleChanged:](v8, "setTitleChanged:", [v4 titleChanged]);
    -[EKCalendarEventInvitationNotification setLocationChanged:](v8, "setLocationChanged:", [v4 locationChanged]);
    -[EKCalendarEventInvitationNotification setVideoConferenceChanged:](v8, "setVideoConferenceChanged:", [v4 videoConferenceChanged]);
    -[EKCalendarEventInvitationNotification setRecurrenceChanged:](v8, "setRecurrenceChanged:", [v4 recurrenceChanged]);
    -[EKCalendarEventInvitationNotification setAttendeeReplyChanged:](v8, "setAttendeeReplyChanged:", [v4 attendeeReplyChanged]);
    [(EKCalendarNotification *)v8 setEvent:v4];
    v37 = [v4 calendar];
    [(EKCalendarNotification *)v8 setCalendar:v37];

    v38 = [v4 selfAttendee];
    v39 = [v38 inviterNameString];
    uint64_t v40 = [v39 length];

    if (v40)
    {
      v41 = [v4 selfAttendee];
      uint64_t v42 = [v41 inviterNameString];
      invitedBy = v8->_invitedBy;
      v8->_invitedBy = (NSString *)v42;
    }
    if (v6)
    {
      v44 = objc_opt_new();
      v45 = [v4 attendees];
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __55__EKCalendarEventInvitationNotification_initWithEvent___block_invoke;
      v68[3] = &unk_1E5B97C68;
      id v69 = v4;
      id v46 = v44;
      id v70 = v46;
      [v45 enumerateObjectsUsingBlock:v68];

      objc_storeStrong((id *)&v8->_attendees, v44);
      uint64_t v62 = 0;
      v63 = &v62;
      uint64_t v64 = 0x3032000000;
      v65 = __Block_byref_object_copy__9;
      v66 = __Block_byref_object_dispose__9;
      id v67 = 0;
      attendees = v8->_attendees;
      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = __55__EKCalendarEventInvitationNotification_initWithEvent___block_invoke_10;
      v61[3] = &unk_1E5B97C90;
      v61[4] = &v62;
      [(NSArray *)attendees enumerateObjectsUsingBlock:v61];
      v48 = (void *)v63[5];
      if (v48)
      {
        v49 = [v48 name];
        [(EKCalendarNotification *)v8 setName:v49];

        v50 = [(id)v63[5] firstName];
        [(EKCalendarNotification *)v8 setFirstName:v50];

        v51 = [(id)v63[5] lastName];
        [(EKCalendarNotification *)v8 setLastName:v51];

        v52 = [(id)v63[5] emailAddress];
        [(EKCalendarNotification *)v8 setEmailAddress:v52];

        v53 = [(id)v63[5] phoneNumber];
        [(EKCalendarNotification *)v8 setPhoneNumber:v53];

        BOOL v54 = [(id)v63[5] participantType] == 2 && objc_msgSend((id)v63[5], "participantStatus") == 3;
        [(EKCalendarEventInvitationNotification *)v8 setIsLocationDecline:v54];
      }
      _Block_object_dispose(&v62, 8);
    }
    v55 = [v4 organizer];

    if (v55)
    {
      v56 = [EKCalendarEventInvitationNotificationAttendee alloc];
      v57 = [v4 organizer];
      uint64_t v58 = [(EKCalendarEventInvitationNotificationAttendee *)v56 initWithParticipant:v57 forEvent:v4];
      owner = v8->_owner;
      v8->_owner = (EKCalendarEventInvitationNotificationAttendee *)v58;
    }
  }

  return v8;
}

- (void)setVideoConferenceChanged:(BOOL)a3
{
  self->_attendeeReplyChanged = a3;
}

- (void)setTitleChanged:(BOOL)a3
{
  self->_videoConferenceChanged = a3;
}

- (void)setTimeZone:(id)a3
{
}

- (void)setTimeChanged:(BOOL)a3
{
  self->_titleChanged = a3;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (void)setStartDateForNextOccurrence:(id)a3
{
}

- (void)setStartDate:(id)a3
{
}

- (void)setRecurrenceRule:(id)a3
{
}

- (void)setRecurrenceChanged:(BOOL)a3
{
  self->_isLocationDecline = a3;
}

- (void)setParticipationStatusModifiedDate:(id)a3
{
}

- (void)setParticipationStatus:(int64_t)a3
{
  self->_participationStatus = a3;
}

- (void)setLocationChanged:(BOOL)a3
{
  self->_recurrenceChanged = a3;
}

- (void)setLocation:(id)a3
{
}

- (void)setEndDate:(id)a3
{
}

- (void)setDateChanged:(BOOL)a3
{
  self->_locationChanged = a3;
}

- (void)setAttendeeReplyChanged:(BOOL)a3
{
  self->_expanded = a3;
}

- (void)setAllDay:(BOOL)a3
{
  self->_dateChanged = a3;
}

void __55__EKCalendarEventInvitationNotification_initWithEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[EKCalendarEventInvitationNotificationAttendee alloc] initWithParticipant:v3 forEvent:*(void *)(a1 + 32)];

  [*(id *)(a1 + 40) addObject:v4];
}

void __55__EKCalendarEventInvitationNotification_initWithEvent___block_invoke_10(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  if [v10 proposedStartDateDeclined] && (objc_msgSend(v10, "isCurrentUser")) {
    goto LABEL_13;
  }
  if ([v10 statusChanged] && objc_msgSend(v10, "participantStatus") == 3)
  {
LABEL_12:
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
LABEL_13:
    *a4 = 1;
    goto LABEL_14;
  }
  if ([v10 proposedStartDateChanged])
  {
    uint64_t v7 = [v10 proposedStartDate];
    if (v7)
    {

      goto LABEL_12;
    }
    if (([v10 commentChanged] & 1) == 0) {
      goto LABEL_14;
    }
LABEL_11:
    v8 = [v10 comment];
    uint64_t v9 = [v8 length];

    if (!v9) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  if ([v10 commentChanged]) {
    goto LABEL_11;
  }
LABEL_14:
}

- (id)eventFromEventStore:(id)a3
{
  return (id)[a3 publicObjectWithObjectID:self->super._objectID];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [EKCalendarEventInvitationNotification alloc];
  uint64_t v5 = [(EKCalendarNotification *)self event];
  int v6 = [(EKCalendarEventInvitationNotification *)v4 initWithEvent:v5];

  return v6;
}

- (BOOL)hasRecurrenceRules
{
  v2 = [(EKCalendarEventInvitationNotification *)self recurrenceRule];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isInvitation
{
  return 1;
}

- (BOOL)needsReply
{
  v2 = [(EKCalendarNotification *)self event];
  if ([v2 isSelfOrganizedInvitation])
  {
    BOOL v3 = 0;
  }
  else
  {
    id v4 = [v2 selfAttendee];
    BOOL v3 = ([v4 rsvpRequested] & 1) != 0
      || [v4 participantStatus] == 1
      || [v4 participantStatus] == 0;
  }
  return v3;
}

- (BOOL)isProposedNewTime
{
  if ([(EKCalendarEventInvitationNotification *)self expanded])
  {
    BOOL v3 = [(EKCalendarEventInvitationNotification *)self expandedProposedTimeAttendee];
    id v4 = [v3 proposedStartDate];
    BOOL v5 = v4 != 0;
  }
  else
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2020000000;
    uint64_t v16 = 0;
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x2020000000;
    char v12 = 0;
    int v6 = [(EKCalendarEventInvitationNotification *)self attendees];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__EKCalendarEventInvitationNotification_isProposedNewTime__block_invoke;
    v8[3] = &unk_1E5B97CB8;
    v8[4] = &v13;
    v8[5] = &v9;
    [v6 enumerateObjectsUsingBlock:v8];

    if (*((unsigned char *)v10 + 24)) {
      BOOL v5 = 0;
    }
    else {
      BOOL v5 = v14[3] > 0;
    }
    _Block_object_dispose(&v9, 8);
    _Block_object_dispose(&v13, 8);
  }
  return v5;
}

void __58__EKCalendarEventInvitationNotification_isProposedNewTime__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 proposedStartDateChanged])
  {
    int v6 = [v7 proposedStartDate];

    if (v6)
    {
      ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      if ([v7 proposedStartDateDeclined])
      {
        if ([v7 isCurrentUser])
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
          *a4 = 1;
        }
      }
    }
  }
}

- (id)nearestProposedTime
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([(EKCalendarEventInvitationNotification *)self expanded])
  {
    BOOL v3 = [(EKCalendarEventInvitationNotification *)self expandedProposedTimeAttendee];
    id v4 = [v3 proposedStartDate];
  }
  else
  {
    BOOL v3 = [MEMORY[0x1E4F1C9C8] CalSimulatedDateForNow];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    BOOL v5 = [(EKCalendarEventInvitationNotification *)self attendees];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      id v4 = 0;
      uint64_t v8 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if ([v10 proposedStartDateChanged])
          {
            uint64_t v11 = [v10 proposedStartDate];
            if (v11)
            {
              char v12 = (void *)v11;
              uint64_t v13 = [v10 proposedStartDate];
              int v14 = [v13 isAfterDate:v3];

              if (v14)
              {
                if (([v10 proposedStartDateDeclined] & 1) == 0)
                {
                  if (!v4
                    || ([v10 proposedStartDate],
                        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
                        int v16 = [v15 isBeforeDate:v4],
                        v15,
                        v16))
                  {
                    uint64_t v17 = [v10 proposedStartDate];

                    id v4 = (void *)v17;
                  }
                }
              }
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v7);
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

- (BOOL)proposedStartDateIsInFutureForAttendee:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x1E4F1C9C8];
  id v4 = a3;
  BOOL v5 = [v3 now];
  uint64_t v6 = [v4 proposedStartDate];

  LOBYTE(v4) = [v6 isAfterDate:v5];
  return (char)v4;
}

- (BOOL)acknowledgeWithEventStore:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(EKCalendarEventInvitationNotification *)self eventFromEventStore:v6];
  if (v7)
  {
    if ([(EKCalendarNotification *)self type] == 3)
    {
      [v7 dismissAttendeeRepliedNotification];
    }
    else
    {
      [v7 setInvitationStatus:0];
      [v7 setIsAlerted:1];
    }
    id v13 = 0;
    char v9 = [v6 saveEvent:v7 span:2 commit:1 error:&v13];
    id v10 = v13;
    if (v9) {
      goto LABEL_12;
    }
    uint64_t v11 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    {
      -[EKCalendarEventInvitationNotification acknowledgeWithEventStore:error:](v11, self, (uint64_t)v10);
      if (!a4) {
        goto LABEL_12;
      }
    }
    else if (!a4)
    {
LABEL_12:

      goto LABEL_13;
    }
    *a4 = v10;
    goto LABEL_12;
  }
  uint64_t v8 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
    -[EKCalendarEventInvitationNotification acknowledgeWithEventStore:error:](v8, self);
  }
  char v9 = 1;
LABEL_13:

  return v9;
}

- (BOOL)couldBeJunk
{
  v2 = [(EKCalendarNotification *)self event];
  char v3 = [v2 couldBeJunk];

  return v3;
}

- (NSString)location
{
  return self->_location;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)startDateForNextOccurrence
{
  return self->_startDateForNextOccurrence;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSDate)participationStatusModifiedDate
{
  return self->_participationStatusModifiedDate;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (int64_t)participationStatus
{
  return self->_participationStatus;
}

- (int64_t)status
{
  return self->_status;
}

- (BOOL)isAllDay
{
  return self->_dateChanged;
}

- (EKRecurrenceRule)recurrenceRule
{
  return self->_recurrenceRule;
}

- (BOOL)timeChanged
{
  return self->_titleChanged;
}

- (BOOL)dateChanged
{
  return self->_locationChanged;
}

- (BOOL)titleChanged
{
  return self->_videoConferenceChanged;
}

- (BOOL)locationChanged
{
  return self->_recurrenceChanged;
}

- (BOOL)videoConferenceChanged
{
  return self->_attendeeReplyChanged;
}

- (BOOL)recurrenceChanged
{
  return self->_isLocationDecline;
}

- (BOOL)attendeeReplyChanged
{
  return self->_expanded;
}

- (NSArray)attendees
{
  return self->_attendees;
}

- (void)setAttendees:(id)a3
{
}

- (EKCalendarEventInvitationNotificationAttendee)owner
{
  return self->_owner;
}

- (void)setOwner:(id)a3
{
}

- (NSString)invitedBy
{
  return self->_invitedBy;
}

- (BOOL)isLocationDecline
{
  return self->_isForReReply;
}

- (void)setIsLocationDecline:(BOOL)a3
{
  self->_isForReReply = a3;
}

- (EKCalendarEventInvitationNotificationAttendee)expandedProposedTimeAttendee
{
  return self->_expandedProposedTimeAttendee;
}

- (void)setExpandedProposedTimeAttendee:(id)a3
{
}

- (BOOL)expanded
{
  return *(&self->_isForReReply + 1);
}

- (void)setExpanded:(BOOL)a3
{
  *(&self->_isForReReply + 1) = a3;
}

- (BOOL)isForReReply
{
  return *(&self->_isForReReply + 2);
}

- (void)setIsForReReply:(BOOL)a3
{
  *(&self->_isForReReply + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expandedProposedTimeAttendee, 0);
  objc_storeStrong((id *)&self->_invitedBy, 0);
  objc_storeStrong((id *)&self->_owner, 0);
  objc_storeStrong((id *)&self->_attendees, 0);
  objc_storeStrong((id *)&self->_recurrenceRule, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_participationStatusModifiedDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDateForNextOccurrence, 0);
  objc_storeStrong((id *)&self->_startDate, 0);

  objc_storeStrong((id *)&self->_location, 0);
}

- (void)acknowledgeWithEventStore:(void *)a1 error:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  char v3 = a1;
  id v4 = [a2 objectID];
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_1A4E47000, v3, OS_LOG_TYPE_ERROR, "Failed to fetch event for attendee replied notification %{public}@ when attempting to acknowledge. Silently ignoring.", (uint8_t *)&v5, 0xCu);
}

- (void)acknowledgeWithEventStore:(uint64_t)a3 error:.cold.2(void *a1, void *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v5 = a1;
  id v6 = [a2 objectID];
  int v7 = 138543618;
  uint64_t v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a3;
  _os_log_error_impl(&dword_1A4E47000, v5, OS_LOG_TYPE_ERROR, "Failed to clear attendee replied notification %{public}@: %@", (uint8_t *)&v7, 0x16u);
}

@end