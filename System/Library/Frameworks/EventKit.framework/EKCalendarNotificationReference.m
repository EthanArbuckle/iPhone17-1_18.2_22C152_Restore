@interface EKCalendarNotificationReference
- (EKCalendarNotification)notification;
- (EKCalendarNotificationReference)initWithType:(int)a3 objectID:(id)a4 date:(id)a5 eventStore:(id)a6;
- (EKCalendarNotificationReference)initWithType:(int)a3 objectID:(id)a4 eventStore:(id)a5;
- (EKEventStore)eventStore;
- (EKObjectID)objectID;
- (NSDate)date;
- (id)_notification;
- (id)description;
- (int)type;
- (int64_t)_notificationTypeForResourceChange:(id)a3 notificationType:(int)a4;
- (void)_notification;
@end

@implementation EKCalendarNotificationReference

- (EKCalendarNotificationReference)initWithType:(int)a3 objectID:(id)a4 date:(id)a5 eventStore:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)EKCalendarNotificationReference;
  v14 = [(EKCalendarNotificationReference *)&v18 init];
  v15 = v14;
  if (v14)
  {
    v14->_type = a3;
    objc_storeStrong((id *)&v14->_objectID, a4);
    objc_storeStrong((id *)&v15->_date, a5);
    objc_storeStrong((id *)&v15->_eventStore, a6);
    notification = v15->_notification;
    v15->_notification = 0;

    v15->_lock._os_unfair_lock_opaque = 0;
  }

  return v15;
}

- (EKCalendarNotification)notification
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [(EKCalendarNotificationReference *)self _notification];
  os_unfair_lock_unlock(p_lock);

  return (EKCalendarNotification *)v4;
}

- (id)_notification
{
  p_notification = (id *)&self->_notification;
  notification = self->_notification;
  if (notification)
  {
LABEL_47:
    id v12 = notification;
    goto LABEL_48;
  }
  p_objectID = (uint64_t *)&self->_objectID;
  uint64_t v6 = [(EKEventStore *)self->_eventStore registerFetchedObjectWithID:self->_objectID];
  if (v6)
  {
    v7 = (void *)v6;
    switch(self->_type)
    {
      case 0:
      case 1:
        v8 = [[EKEvent alloc] initWithPersistentObject:v6 occurrenceDate:self->_date];
        v9 = [[EKCalendarEventInvitationNotification alloc] initWithEvent:v8];
        id v10 = self->_notification;
        self->_notification = &v9->super;
        goto LABEL_41;
      case 2:
        v8 = [(EKObject *)[EKCalendar alloc] initWithPersistentObject:v6];
        v21 = [[EKCalendarSharedCalendarNotification alloc] initWithType:8];
        v22 = [(EKEvent *)v8 title];
        [(EKCalendarNotification *)v21 setTitle:v22];

        [(EKCalendarNotification *)v21 setHiddenFromNotificationCenter:[(EKEvent *)v8 invitationStatus] == 1];
        v23 = [(EKEvent *)v8 sharedOwnerName];
        [(EKCalendarNotification *)v21 setName:v23];

        v24 = [(EKEvent *)v8 sharedOwnerEmail];
        [(EKCalendarNotification *)v21 setEmailAddress:v24];

        v25 = [(EKEvent *)v8 sharedOwnerPhoneNumber];
        [(EKCalendarNotification *)v21 setPhoneNumber:v25];

        v26 = [(EKEvent *)v8 sharedOwnerURL];
        [(EKCalendarNotification *)v21 setURL:v26];

        [(EKCalendarNotification *)v21 setAlerted:[(EKEvent *)v8 invitationStatus] != 3];
        [(EKCalendarSharedCalendarNotification *)v21 setSharingInvitationResponse:[(EKEvent *)v8 sharingInvitationResponse]];
        [(EKCalendarNotification *)v21 setDotColor:0];
        v27 = [(EKObject *)v8 objectID];
        [(EKCalendarNotification *)v21 setObjectID:v27];

        v28 = [(EKEvent *)v8 externalURI];
        [(EKCalendarNotification *)v21 setURL:v28];

        [(EKCalendarSharedCalendarNotification *)v21 setAllowedEntityTypes:[(EKEvent *)v8 allowedEntityTypes]];
        v29 = [(EKEvent *)v8 source];
        [(EKCalendarNotification *)v21 setSource:v29];

        [(EKCalendarNotification *)v21 setCalendar:v8];
        goto LABEL_21;
      case 3:
        v8 = [(EKEventStore *)self->_eventStore publicObjectWithPersistentObject:v6];
        if ([(EKEvent *)v8 shareeStatus] == 3) {
          uint64_t v30 = 10;
        }
        else {
          uint64_t v30 = 9;
        }
        v21 = [[EKCalendarInviteReplyNotification alloc] initWithType:v30];
        v31 = [(EKEvent *)v8 calendarName];
        [(EKCalendarNotification *)v21 setTitle:v31];

        v32 = [(EKEvent *)v8 shareeDisplayName];
        [(EKCalendarNotification *)v21 setName:v32];

        v33 = [(EKEvent *)v8 shareeEmailAddress];
        [(EKCalendarNotification *)v21 setEmailAddress:v33];

        v34 = [(EKEvent *)v8 shareePhoneNumber];
        [(EKCalendarNotification *)v21 setPhoneNumber:v34];

        v35 = [(EKEvent *)v8 shareeURL];
        [(EKCalendarNotification *)v21 setURL:v35];

        [(EKCalendarNotification *)v21 setAlerted:[(EKEvent *)v8 alerted]];
        [(EKCalendarNotification *)v21 setHiddenFromNotificationCenter:0];
        [(EKCalendarSharedCalendarNotification *)v21 setStatus:[(EKEvent *)v8 shareeStatus]];
        v36 = [(EKEvent *)v8 inviteReplyCalendar];
        -[EKCalendarNotification setDotColor:](v21, "setDotColor:", [v36 CGColor]);

        v37 = [(EKObject *)v8 objectID];
        [(EKCalendarNotification *)v21 setObjectID:v37];

        v38 = [(EKObject *)v8 objectID];
        v39 = [v38 URIRepresentation];
        [(EKCalendarNotification *)v21 setURL:v39];

        v40 = +[EKInviteReplyNotification sourceForInviteReplyNotification:v8];
        [(EKCalendarNotification *)v21 setSource:v40];

        v41 = [(EKEvent *)v8 inviteReplyCalendar];
        [(EKCalendarNotification *)v21 setCalendar:v41];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v42 = [(EKEvent *)v8 inviteReplyCalendar];
          -[EKCalendarSharedCalendarNotification setAllowedEntityTypes:](v21, "setAllowedEntityTypes:", [v42 allowedEntityTypes]);
        }
        else
        {
          [(EKCalendarSharedCalendarNotification *)v21 setAllowedEntityTypes:1];
        }
LABEL_21:
        id v10 = *p_notification;
        id *p_notification = v21;
        goto LABEL_41;
      case 4:
      case 5:
        v8 = [(EKEventStore *)self->_eventStore publicObjectWithPersistentObject:v6];
        id v10 = [(EKEvent *)v8 calendarItem];
        uint64_t v13 = [(EKCalendarItem *)v8 calendar];
        int64_t v14 = [(EKCalendarNotificationReference *)self _notificationTypeForResourceChange:v8 notificationType:self->_type];
        v15 = off_1E5B961A8;
        if (self->_type != 5) {
          v15 = off_1E5B96198;
        }
        v16 = (void *)[objc_alloc(*v15) initWithType:v14];
        v75 = v7;
        if ([(EKEvent *)v8 changeType] == 3)
        {
          v17 = [(EKEvent *)v8 deletedTitle];
          objc_super v18 = v17;
          v19 = (void *)v13;
          if (v17)
          {
            id v20 = v17;
          }
          else
          {
            id v20 = [v10 title];
          }
          uint64_t v44 = (uint64_t)v20;

          uint64_t v43 = v44;
        }
        else
        {
          v19 = (void *)v13;
          uint64_t v43 = [v10 title];
        }
        int64_t v45 = v14 - 4;
        v79 = (void *)v43;
        if (!v43)
        {
          v46 = [(EKCalendarItem *)v8 calendar];
          v79 = [v46 title];
        }
        unint64_t v47 = v45 & 0xFFFFFFFFFFFFFFF5;
        CFPropertyListRef v48 = CFPreferencesCopyAppValue(@"CalendarsExcludedFromNotifications", (CFStringRef)*MEMORY[0x1E4F57900]);
        objc_opt_class();
        v77 = (void *)v48;
        if (objc_opt_isKindOfClass())
        {
          v78 = [MEMORY[0x1E4F1CAD0] setWithArray:v48];
        }
        else
        {
          v78 = 0;
        }
        v49 = v19;
        objc_msgSend(v16, "setTitle:", v79, v75);
        if (v47)
        {
          v50 = [(EKObject *)v8 objectID];
          v51 = [v50 URIRepresentation];
          [v16 setURL:v51];
        }
        else
        {
          v50 = [v10 externalURI];
          [v16 setURL:v50];
        }

        v52 = [(EKEvent *)v8 changedByDisplayName];
        [v16 setName:v52];

        v53 = [(EKEvent *)v8 emailAddress];
        [v16 setEmailAddress:v53];

        v54 = [(EKEvent *)v8 phoneNumber];
        [v16 setPhoneNumber:v54];

        v55 = [(EKCalendarItem *)v8 calendar];
        v56 = [v55 title];
        [v16 setCalendarName:v56];

        v57 = [v10 eventIdentifier];
        [v16 setEventID:v57];

        objc_msgSend(v16, "setAlerted:", -[EKEvent alerted](v8, "alerted"));
        v58 = [v19 calendarIdentifier];
        objc_msgSend(v16, "setHiddenFromNotificationCenter:", objc_msgSend(v78, "containsObject:", v58));

        if (v10)
        {
          v59 = [v10 calendar];
          objc_msgSend(v16, "setDotColor:", objc_msgSend(v59, "CGColor"));
        }
        else
        {
          objc_msgSend(v16, "setDotColor:", objc_msgSend(v19, "CGColor"));
        }
        v60 = [(EKObject *)v8 objectID];
        [v16 setObjectID:v60];

        v61 = [(EKCalendarItem *)v8 calendar];
        v62 = [v61 source];
        [v16 setSource:v62];

        [v16 setEvent:v10];
        v63 = [(EKCalendarItem *)v8 calendar];
        [v16 setCalendar:v63];

        objc_msgSend(v16, "setChangeType:", -[EKEvent changeType](v8, "changeType"));
        if ([(EKEvent *)v8 changeType] == 4)
        {
          v64 = [(EKEvent *)v8 createCount];
          [v16 setCreateCount:v64];

          v65 = [(EKEvent *)v8 updateCount];
          [v16 setUpdateCount:v65];

          v66 = [(EKEvent *)v8 deleteCount];
          [v16 setDeleteCount:v66];
        }
        else
        {
          objc_msgSend(v16, "setDateChanged:", -[EKEvent dateChanged](v8, "dateChanged"));
          objc_msgSend(v16, "setTimeChanged:", -[EKEvent timeChanged](v8, "timeChanged"));
          objc_msgSend(v16, "setLocationChanged:", -[EKEvent locationChanged](v8, "locationChanged"));
          objc_msgSend(v16, "setTitleChanged:", -[EKEvent titleChanged](v8, "titleChanged"));
          v67 = [v10 startDate];
          [v16 setStartDate:v67];

          v68 = [MEMORY[0x1E4F1C9C8] CalSimulatedDateForNow];
          v69 = [v10 earliestOccurrenceEndingAfter:v68 excludeSignificantDetachments:1 excludeCanceledDetachments:1 excludeDeclinedDetachments:1];
          v70 = [v69 startDate];
          [v16 setStartDateForNextOccurrence:v70];

          v49 = v19;
          v71 = [v10 endDateUnadjustedForLegacyClients];
          [v16 setEndDate:v71];

          objc_msgSend(v16, "setAllDay:", objc_msgSend(v10, "isAllDay"));
          v66 = [v10 locationWithoutPrediction];
          [v16 setLocation:v66];
        }
        v7 = v76;

        objc_storeStrong(p_notification, v16);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v16 updateSuggestedEventWithEventStore:self->_eventStore];
        }

LABEL_41:
        break;
      default:
        break;
    }
    if (![(EKEventStore *)self->_eventStore objectWithIDExists:self->_objectID])
    {
      v72 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG)) {
        [(EKCalendarNotificationReference *)p_objectID _notification];
      }
      id v73 = *p_notification;
      id *p_notification = 0;
    }
    notification = (EKCalendarNotification *)*p_notification;
    goto LABEL_47;
  }
  id v11 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR)) {
    -[EKCalendarNotificationReference _notification](v11);
  }
  id v12 = 0;
LABEL_48:

  return v12;
}

- (EKObjectID)objectID
{
  return self->_objectID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_objectID, 0);

  objc_storeStrong((id *)&self->_notification, 0);
}

- (EKCalendarNotificationReference)initWithType:(int)a3 objectID:(id)a4 eventStore:(id)a5
{
  return [(EKCalendarNotificationReference *)self initWithType:*(void *)&a3 objectID:a4 date:0 eventStore:a5];
}

- (int64_t)_notificationTypeForResourceChange:(id)a3 notificationType:(int)a4
{
  switch([a3 changeType])
  {
    case 1u:
      int64_t v5 = 12;
      if (a4 != 5) {
        int64_t v5 = -1;
      }
      BOOL v6 = a4 == 4;
      int64_t v7 = 4;
      goto LABEL_12;
    case 2u:
      int64_t v5 = 14;
      if (a4 != 5) {
        int64_t v5 = -1;
      }
      BOOL v6 = a4 == 4;
      int64_t v7 = 6;
      goto LABEL_12;
    case 3u:
      int64_t v5 = 13;
      if (a4 != 5) {
        int64_t v5 = -1;
      }
      BOOL v6 = a4 == 4;
      int64_t v7 = 5;
LABEL_12:
      if (v6) {
        int64_t result = v7;
      }
      else {
        int64_t result = v5;
      }
      break;
    case 4u:
      int64_t result = 7;
      break;
    case 5u:
      int64_t result = 11;
      break;
    default:
      int64_t result = -1;
      break;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t type = self->_type;
  uint64_t v6 = [(EKObjectID *)self->_objectID rowID];
  date = self->_date;
  v8 = [MEMORY[0x1E4F1CA20] currentLocale];
  v9 = [(NSDate *)date descriptionWithLocale:v8];
  id v10 = [v3 stringWithFormat:@"%@{type: %d, rowID: %d, date: %@}", v4, type, v6, v9];

  return v10;
}

- (int)type
{
  return self->_type;
}

- (EKEventStore)eventStore
{
  return self->_eventStore;
}

- (NSDate)date
{
  return self->_date;
}

- (void)_notification
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_debug_impl(&dword_1A4E47000, log, OS_LOG_TYPE_DEBUG, "After generating a notification, it was observed that its backing data was removed from the database.  Clearing the notification.  Object ID: [%@]  Generated notification: [%@]", (uint8_t *)&v5, 0x16u);
}

@end