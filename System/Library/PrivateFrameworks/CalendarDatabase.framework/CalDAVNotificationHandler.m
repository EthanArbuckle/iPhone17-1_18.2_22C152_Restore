@interface CalDAVNotificationHandler
+ (id)_changedAttributesFromCalendarChanges:(id)a3;
+ (int)_inviteStatusFromString:(id)a3;
+ (void)_copyCalendarForReplyItem:(id)a3 inDatabase:(CalDatabase *)a4 store:(void *)a5 calendarHomeURL:(id)a6;
+ (void)_copyNotificationWithExternalID:(id)a3 inCalendar:(void *)a4 withDatabase:(CalDatabase *)a5 recordIDMap:(id)a6;
+ (void)_copyNotificationWithUniqueIdentifier:(id)a3 inCalendar:(void *)a4 orStore:(void *)a5 withDatabase:(CalDatabase *)a6 recordIDMap:(id)a7;
+ (void)_createNotificationWithInviteStatus:(int)a3 inDatabase:(CalDatabase *)a4;
+ (void)_createResourceChange:(id)a3 withType:(unsigned int)a4 forNotification:(void *)a5 withRecurrenceID:(id)a6 database:(CalDatabase *)a7 store:(void *)a8 calendarHomeURL:(id)a9;
+ (void)_handleInviteNotification:(id)a3 withUid:(id)a4 serverURL:(id)a5 syncKey:(id)a6 database:(CalDatabase *)a7 store:(void *)a8 calendarHomeURL:(id)a9 notificationCalendar:(void *)a10 notificationCalendarURL:(id)a11 recordIDMap:(id)a12;
+ (void)_handleInviteReply:(id)a3 withUid:(id)a4 serverURL:(id)a5 syncKey:(id)a6 owningNotification:(id)a7 database:(CalDatabase *)a8 store:(void *)a9 calendarHomeURL:(id)a10 notificationCalendar:(void *)a11 notificationCalendarURL:(id)a12 contactsProvider:(id)a13 recordIDMap:(id)a14;
+ (void)_handleResourceChanged:(id)a3 withUid:(id)a4 serverURL:(id)a5 syncKey:(id)a6 database:(CalDatabase *)a7 store:(void *)a8 calendarHomeURL:(id)a9 notificationCalendar:(void *)a10 notificationCalendarURL:(id)a11 recordIDMap:(id)a12;
+ (void)processNotificationWithData:(id)a3 serverURL:(id)a4 syncKey:(id)a5 database:(CalDatabase *)a6 notificationCalendar:(void *)a7 store:(void *)a8 calendarHomeURL:(id)a9 notificationCalendarURL:(id)a10 contactsProvider:(id)a11 recordIDMap:(id)a12;
+ (void)setURL:(id)a3 forResourceWithUUID:(id)a4 withDatabase:(CalDatabase *)a5 notificationCalendar:(void *)a6 notificationCalendarURL:(id)a7 recordIDMap:(id)a8;
@end

@implementation CalDAVNotificationHandler

+ (void)processNotificationWithData:(id)a3 serverURL:(id)a4 syncKey:(id)a5 database:(CalDatabase *)a6 notificationCalendar:(void *)a7 store:(void *)a8 calendarHomeURL:(id)a9 notificationCalendarURL:(id)a10 contactsProvider:(id)a11 recordIDMap:(id)a12
{
  id v46 = a4;
  id v14 = a5;
  id v15 = a9;
  id v16 = a10;
  id v43 = a11;
  id v17 = a12;
  v18 = (objc_class *)MEMORY[0x1E4F5B348];
  id v19 = a3;
  id v20 = [v18 alloc];
  v21 = (void *)[v20 initWithRootElementNameSpace:*MEMORY[0x1E4F5B358] name:*MEMORY[0x1E4F56830] parseClass:objc_opt_class() baseURL:v15];
  [v21 processData:v19 forTask:0];

  [v21 processData:0 forTask:0];
  v22 = [v21 rootElement];
  v23 = [v46 lastPathComponent];
  v24 = [v22 content];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v26 = [v22 content];
  v27 = v26;
  v44 = v17;
  v45 = v16;
  if (isKindOfClass)
  {
    v28 = [v26 uid];
    uint64_t v29 = [v28 payloadAsString];

    id v37 = v16;
    id v38 = v17;
    v30 = a7;
    id v36 = v15;
    v31 = v15;
    id v32 = a1;
    v33 = a6;
    objc_msgSend(a1, "_handleInviteNotification:withUid:serverURL:syncKey:database:store:calendarHomeURL:notificationCalendar:notificationCalendarURL:recordIDMap:", v27, v29, v46, v14, v36, a7, v37, v38);
    v23 = (void *)v29;
LABEL_7:

    goto LABEL_8;
  }
  v31 = v15;
  id v32 = a1;
  v33 = a6;
  objc_opt_class();
  char v34 = objc_opt_isKindOfClass();

  v27 = [v22 content];
  if (v34)
  {
    v30 = a7;
    [a1 _handleInviteReply:v27 withUid:v23 serverURL:v46 syncKey:v14 owningNotification:v22 database:a6 store:a8 calendarHomeURL:v31 notificationCalendar:a7 notificationCalendarURL:v45 contactsProvider:v43 recordIDMap:v44];
    goto LABEL_7;
  }
  objc_opt_class();
  char v35 = objc_opt_isKindOfClass();

  if (v35)
  {
    v27 = [v22 content];
    v30 = a7;
    [a1 _handleResourceChanged:v27 withUid:v23 serverURL:v46 syncKey:v14 database:a6 store:a8 calendarHomeURL:v31 notificationCalendar:a7 notificationCalendarURL:v45 recordIDMap:v44];
    goto LABEL_7;
  }
  v30 = a7;
LABEL_8:
  [v32 setURL:v46 forResourceWithUUID:v23 withDatabase:v33 notificationCalendar:v30 notificationCalendarURL:v45 recordIDMap:v44];
}

+ (int)_inviteStatusFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4F56828]])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F56820]])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F56810]])
  {
    int v4 = 2;
  }
  else
  {
    [v3 isEqualToString:*MEMORY[0x1E4F56818]];
    int v4 = 3;
  }

  return v4;
}

+ (void)_createNotificationWithInviteStatus:(int)a3 inDatabase:(CalDatabase *)a4
{
  if ((a3 - 1) < 3) {
    return (void *)CalDatabaseCreateInviteReplyNotification((os_unfair_lock_s *)a4);
  }
  if (!a3) {
    return (void *)CalDatabaseCreateNotification((os_unfair_lock_s *)a4);
  }
  return result;
}

+ (void)_handleInviteNotification:(id)a3 withUid:(id)a4 serverURL:(id)a5 syncKey:(id)a6 database:(CalDatabase *)a7 store:(void *)a8 calendarHomeURL:(id)a9 notificationCalendar:(void *)a10 notificationCalendarURL:(id)a11 recordIDMap:(id)a12
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v65 = a4;
  id v64 = a6;
  id v18 = a12;
  id v19 = a11;
  id v20 = a9;
  id v21 = a5;
  v22 = [v17 inviteStatus];
  uint64_t v23 = [v22 name];

  v62 = (void *)v23;
  uint64_t v24 = [a1 _inviteStatusFromString:v23];
  v25 = objc_msgSend(v21, "calDAV_leastInfoStringRepresentationRelativeToParentURL:", v19);

  v63 = v18;
  v26 = (const void *)[a1 _copyNotificationWithExternalID:v25 inCalendar:a10 withDatabase:a7 recordIDMap:v18];
  if (!v26)
  {
    v26 = (const void *)[a1 _createNotificationWithInviteStatus:v24 inDatabase:a7];
    CalNotificationSetOwner((uint64_t)v26, a10);
    CalNotificationSetExternalID((uint64_t)v26);
    CalNotificationSetExternalModTag((uint64_t)v26);
    CalNotificationSetUUID((uint64_t)v26);
    v27 = CalEntityCopyRecordID(v26);
    if (v27) {
      [v18 setUniqueIdentifier:v65 forRecordID:v27];
    }
  }
  v28 = [v17 hostURL];
  uint64_t v29 = [v28 href];
  v30 = [v29 payloadAsFullURL];

  v31 = objc_msgSend(v30, "calDAV_leastInfoStringRepresentationRelativeToParentURL:", v20);

  id v32 = [v31 appendSlashIfNeeded];

  if (v30)
  {
    Calendar = (void *)CalDatabaseCopyCalendarWithExternalIDInStore(a7, v32, (uint64_t)a8);
    if (v24) {
      goto LABEL_6;
    }
LABEL_13:
    if (!Calendar)
    {
      Calendar = (void *)CalDatabaseCreateCalendar((os_unfair_lock_s *)a7);
      CalStoreAddCalendar((uint64_t)a8, Calendar);
      CalCalendarSetExternalID((uint64_t)Calendar);
      CalNotificationSetHostURL((uint64_t)v26, (const __CFURL *)v30);
      CalCalendarSetNeedsNotification((uint64_t)Calendar);
    }
    CalCalendarSetIsSharingInvitation((uint64_t)Calendar);
    CalCalendarSetSharingStatus((uint64_t)Calendar);
    CalCalendarSetHidden((uint64_t)Calendar);
    CalCalendarSetImmutable((uint64_t)Calendar);
    CalCalendarSetReadOnly((uint64_t)Calendar);
    CalCalendarSetSharingInvitationResponse((uint64_t)Calendar);
    v41 = [v17 organizer];
    v42 = [v41 commonName];
    uint64_t v43 = [v42 payloadAsString];

    v44 = [v17 organizer];
    v45 = [v44 href];
    id v46 = [v45 payloadAsFullURL];

    v61 = (void *)v43;
    CalCalendarSetSharedOwnerName((uint64_t)Calendar);
    [v46 absoluteString];
    CalCalendarSetSharedOwnerAddress((uint64_t)Calendar);
    v47 = [v17 summary];
    [v47 payloadAsString];
    CalCalendarSetTitle((uint64_t)Calendar);

    v48 = [v17 uid];
    [v48 payloadAsString];
    CalCalendarSetExternalIdentificationTag((uint64_t)Calendar);

    v49 = [v17 supportedCalendarComponentSet];
    v50 = [v49 componentsAsString];

    if ([v50 length])
    {
      int v51 = [MEMORY[0x1E4F56808] allowedCalendars:v50 contains:@"VEVENT"];
      int v52 = [MEMORY[0x1E4F56808] allowedCalendars:v50 contains:@"VTODO"];
      if ((v52 & (v51 ^ 1)) != 0) {
        int v53 = 3;
      }
      else {
        int v53 = 0;
      }
      if (v51) {
        int v54 = 2;
      }
      else {
        int v54 = 0;
      }
      if (v52) {
        unsigned int v55 = v53;
      }
      else {
        unsigned int v55 = v54;
      }
      int CanContainEntityType = CalCalendarCanContainEntityType((uint64_t)Calendar, 3);
      int v57 = CalCalendarCanContainEntityType((uint64_t)Calendar, 2);
      if ((CanContainEntityType & (v57 ^ 1)) != 0) {
        int v58 = 3;
      }
      else {
        int v58 = 0;
      }
      if (v57) {
        int v59 = 2;
      }
      else {
        int v59 = 0;
      }
      if (!CanContainEntityType) {
        int v58 = v59;
      }
      if (v58 != v55) {
        CalCalendarSetCanContainEntityType((uint64_t)Calendar, v55);
      }
    }

    v40 = v62;
    if (Calendar) {
      goto LABEL_36;
    }
    goto LABEL_37;
  }
  Calendar = 0;
  if (!v24) {
    goto LABEL_13;
  }
LABEL_6:
  if (v24 == 1)
  {
    CalInviteReplyNotificationSetHostURL((uint64_t)v26, (const __CFURL *)v30);
    char v34 = [v17 summary];
    char v35 = [v34 payloadAsString];

    CalInviteReplyNotificationSetSummary(v26, v35);
    CalInviteReplyNotificationSetStatus((uint64_t)v26);
    id v36 = [MEMORY[0x1E4F1C9C8] date];
    [v36 timeIntervalSinceReferenceDate];
    double v38 = v37;

    CalInviteReplyNotificationSetCreationDate(v26, v38);
  }
  v39 = CDBLogHandle;
  v40 = v62;
  if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v67 = v24;
    __int16 v68 = 2112;
    v69 = v30;
    _os_log_impl(&dword_1A8E81000, v39, OS_LOG_TYPE_INFO, "Got an invitation response of %d for calendar %@, so we're going to remove it", buf, 0x12u);
  }
  if (Calendar)
  {
    CalRemoveCalendar(Calendar);
LABEL_36:
    CFRelease(Calendar);
  }
LABEL_37:
  if (v26) {
    CFRelease(v26);
  }
}

+ (void)_handleInviteReply:(id)a3 withUid:(id)a4 serverURL:(id)a5 syncKey:(id)a6 owningNotification:(id)a7 database:(CalDatabase *)a8 store:(void *)a9 calendarHomeURL:(id)a10 notificationCalendar:(void *)a11 notificationCalendarURL:(id)a12 contactsProvider:(id)a13 recordIDMap:(id)a14
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v90 = a4;
  id v20 = a5;
  id v92 = a6;
  id v21 = a7;
  id v22 = a10;
  id v23 = a12;
  id v89 = a13;
  id v24 = a14;
  v25 = CDBLogHandle;
  if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v95 = v19;
    _os_log_impl(&dword_1A8E81000, v25, OS_LOG_TYPE_INFO, "Handling invite reply notification %@", buf, 0xCu);
  }
  uint64_t v26 = objc_msgSend(v20, "calDAV_leastInfoStringRepresentationRelativeToParentURL:", v23);
  uint64_t v27 = objc_msgSend(a1, "_copyNotificationWithExternalID:inCalendar:withDatabase:recordIDMap:");
  v91 = v21;
  v88 = v23;
  if (v27)
  {
    InviteReplyNotification = (const void *)v27;
    id v84 = v22;
    v93 = 0;
    uint64_t v29 = (void *)v26;
    id v30 = v90;
    goto LABEL_9;
  }
  uint64_t v31 = [a1 _copyCalendarForReplyItem:v19 inDatabase:a8 store:a9 calendarHomeURL:v22];
  if (v31)
  {
    id v32 = (const void *)v31;
    InviteReplyNotification = CalDatabaseCreateInviteReplyNotification((os_unfair_lock_s *)a8);
    CalNotificationSetOwner((uint64_t)InviteReplyNotification, a11);
    uint64_t v29 = (void *)v26;
    CalNotificationSetExternalID((uint64_t)InviteReplyNotification);
    CalNotificationSetExternalModTag((uint64_t)InviteReplyNotification);
    id v30 = v90;
    CalNotificationSetUUID((uint64_t)InviteReplyNotification);
    CalInviteReplyNotificationSetInviteReplyCalendar((uint64_t)InviteReplyNotification, v32);
    v93 = (void *)CalCalendarCopyTitle((uint64_t)v32);
    v33 = CalEntityCopyRecordID(InviteReplyNotification);
    if (v33) {
      [v24 setUniqueIdentifier:v90 forRecordID:v33];
    }
    id v84 = v22;
    CFRelease(v32);
    id v21 = v91;
LABEL_9:
    char v34 = [v21 dtstamp];
    char v35 = [v34 payloadAsString];
    id v36 = v21;
    uint64_t v37 = [v35 length];

    if (v37)
    {
      double v38 = (void *)MEMORY[0x1E4FB7F40];
      v39 = [v36 dtstamp];
      v40 = [v39 payloadAsString];
      v41 = [v38 dateFromICSString:v40];

      v42 = (void *)[objc_alloc(MEMORY[0x1E4FB7F28]) initWithValue:v41];
      double v43 = CalDateFromICSDateAsUTC(v42);
      CalInviteReplyNotificationSetCreationDate(InviteReplyNotification, v43);
    }
    v44 = [v19 inviteStatus];
    v45 = [v44 name];

    id v85 = v20;
    id v87 = v24;
    if ([v45 isEqualToString:*MEMORY[0x1E4F56810]])
    {
      id v46 = v30;
    }
    else
    {
      id v46 = v30;
      if (([v45 isEqualToString:*MEMORY[0x1E4F56818]] & 1) == 0) {
        [v45 isEqualToString:*MEMORY[0x1E4F56820]];
      }
    }
    CalInviteReplyNotificationSetStatus((uint64_t)InviteReplyNotification);
    v47 = [v19 hostURL];
    v48 = [v47 href];
    CFURLRef v49 = [v48 payloadAsFullURL];

    CalInviteReplyNotificationSetHostURL((uint64_t)InviteReplyNotification, v49);
    v50 = [v19 inReplyTo];
    int v51 = [v50 payloadAsString];

    CalInviteReplyNotificationSetInReplyTo((uint64_t)InviteReplyNotification);
    int v52 = [v19 summary];
    uint64_t v53 = [v52 payloadAsString];
    int v54 = (void *)v53;
    unsigned int v55 = v93;
    if (v53) {
      unsigned int v55 = (void *)v53;
    }
    id v56 = v55;

    CalInviteReplyNotificationSetSummary(InviteReplyNotification, v56);
    uint64_t v57 = [v19 firstName];
    if (v57
      && (int v58 = (void *)v57,
          [v19 lastName],
          int v59 = objc_claimAutoreleasedReturnValue(),
          v59,
          v58,
          v59))
    {
      v60 = (void *)CDBLogHandle;
      if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
      {
        v61 = v60;
        v62 = [v19 firstName];
        v63 = [v19 lastName];
        *(_DWORD *)buf = 138412546;
        id v95 = v62;
        __int16 v96 = 2112;
        v97 = v63;
        _os_log_impl(&dword_1A8E81000, v61, OS_LOG_TYPE_INFO, "Invite reply has firstName: %@, lastName: %@", buf, 0x16u);
      }
      id v64 = [v19 firstName];
      CalInviteReplyNotificationSetShareeFirstName((uint64_t)InviteReplyNotification);

      id v65 = [v19 lastName];
      CalInviteReplyNotificationSetShareeLastName((uint64_t)InviteReplyNotification);
      v66 = v46;
    }
    else
    {
      int v67 = [v19 acceptedURL];

      v66 = v46;
      id v24 = v87;
      if (v67)
      {
LABEL_39:
        v82 = [v19 acceptedURL];

        if (v82)
        {
          CFURLRef v83 = [v19 acceptedURL];
          CalInviteReplyNotificationSetShareeAddress((uint64_t)InviteReplyNotification, v83);
        }
        CFRelease(InviteReplyNotification);

        id v22 = v84;
        id v20 = v85;
        goto LABEL_42;
      }
      __int16 v68 = [v19 href];
      id v65 = [v68 payloadAsFullURL];

      v69 = CDBLogHandle;
      if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v95 = v65;
        _os_log_impl(&dword_1A8E81000, v69, OS_LOG_TYPE_INFO, "Invite reply has no names. Using the provided address of %@", buf, 0xCu);
      }
      uint64_t v70 = [v65 absoluteString];
      if (([v70 hasMailto] & 1) != 0 || objc_msgSend(v70, "hasTel"))
      {
        CalInviteReplyNotificationSetShareeAddress((uint64_t)InviteReplyNotification, (const __CFURL *)v65);
        if ([v70 hasMailto])
        {
          v71 = [v70 stringRemovingMailto];
          v72 = CDBLogHandle;
          if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v95 = v71;
            _os_log_impl(&dword_1A8E81000, v72, OS_LOG_TYPE_INFO, "This looks like a mailto address. Search the addressbook for a contact with the address %@", buf, 0xCu);
          }
          uint64_t v73 = [v89 fullNameForFirstContactMatchingEmailAddress:v71];
        }
        else
        {
          v71 = [v70 stringRemovingTel];
          v80 = CDBLogHandle;
          if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v95 = v71;
            _os_log_impl(&dword_1A8E81000, v80, OS_LOG_TYPE_INFO, "This looks like a telephone number. Search the addressbook for a contact with the phone number %@", buf, 0xCu);
          }
          uint64_t v73 = [v89 fullNameForFirstContactMatchingPhoneNumber:v71];
        }
        v81 = (void *)v73;

        CalInviteReplyNotificationSetShareeDisplayName((uint64_t)InviteReplyNotification);
        v66 = v90;
      }
    }
    id v24 = v87;
    goto LABEL_39;
  }
  v74 = (void *)CDBLogHandle;
  uint64_t v29 = (void *)v26;
  v66 = v90;
  if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_INFO))
  {
    v75 = v74;
    [v19 hostURL];
    v77 = id v76 = v22;
    v78 = [v77 href];
    v79 = [v78 payloadAsOriginalURL];
    *(_DWORD *)buf = 138412290;
    id v95 = v79;
    _os_log_impl(&dword_1A8E81000, v75, OS_LOG_TYPE_INFO, "Ignoring invite reply notification for an unknown calendar: %@", buf, 0xCu);

    id v22 = v76;
  }
LABEL_42:
}

+ (void)_copyCalendarForReplyItem:(id)a3 inDatabase:(CalDatabase *)a4 store:(void *)a5 calendarHomeURL:(id)a6
{
  if (!a5) {
    return 0;
  }
  id v9 = a6;
  v10 = [a3 hostURL];
  v11 = [v10 href];
  v12 = [v11 payloadAsFullURL];

  v13 = objc_msgSend(v12, "calDAV_leastInfoStringRepresentationRelativeToParentURL:", v9);

  id v14 = [v13 appendSlashIfNeeded];

  CFTypeRef v15 = CalDatabaseCopyCalendarWithExternalIDInStore(a4, v14, (uint64_t)a5);
  return (void *)v15;
}

+ (void)_handleResourceChanged:(id)a3 withUid:(id)a4 serverURL:(id)a5 syncKey:(id)a6 database:(CalDatabase *)a7 store:(void *)a8 calendarHomeURL:(id)a9 notificationCalendar:(void *)a10 notificationCalendarURL:(id)a11 recordIDMap:(id)a12
{
  uint64_t v136 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a6;
  id v97 = a9;
  id v20 = a1;
  id v21 = a12;
  uint64_t v22 = objc_msgSend(a5, "calDAV_leastInfoStringRepresentationRelativeToParentURL:", a11);
  uint64_t v23 = [a1 _copyNotificationWithExternalID:v22 inCalendar:a10 withDatabase:a7 recordIDMap:v21];
  CFURLRef v83 = v19;
  id v84 = v18;
  v81 = (void *)v22;
  if (v23)
  {
    id v24 = (const void *)v23;
    CalResourceChangeNotificationRemoveAllChanges(v23);
  }
  else
  {
    id v24 = CalDatabaseCreateResourceChangeNotification((os_unfair_lock_s *)a7);
    CalNotificationSetOwner((uint64_t)v24, a10);
    CalNotificationSetExternalID((uint64_t)v24);
    CalNotificationSetExternalModTag((uint64_t)v24);
    CalNotificationSetUUID((uint64_t)v24);
    v25 = CalEntityCopyRecordID(v24);
    if (v25) {
      [v21 setUniqueIdentifier:v18 forRecordID:v25];
    }
  }
  id v26 = objc_alloc(MEMORY[0x1E4FB7F28]);
  uint64_t v27 = [v17 dtstamp];
  v28 = (void *)[v26 initWithValue:v27];

  v80 = v28;
  double v29 = CalDateFromICSDateAsUTC(v28);
  v94 = v24;
  CalResourceChangeNotificationSetLastModifiedDate(v24, v29);
  long long v127 = 0u;
  long long v128 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  id v30 = [v17 created];
  uint64_t v31 = [v30 countByEnumeratingWithState:&v125 objects:v135 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v126;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v126 != v33) {
          objc_enumerationMutation(v30);
        }
        char v35 = (const void *)[a1 _createResourceChange:*(void *)(*((void *)&v125 + 1) + 8 * i) withType:1 forNotification:v24 withRecurrenceID:0 database:a7 store:a8 calendarHomeURL:v97];
        if (v35) {
          CFRelease(v35);
        }
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v125 objects:v135 count:16];
    }
    while (v32);
  }
  v82 = v21;

  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  id v85 = v17;
  obuint64_t j = [v17 updated];
  id v36 = v24;
  uint64_t v88 = [obj countByEnumeratingWithState:&v121 objects:v134 count:16];
  if (v88)
  {
    uint64_t v87 = *(void *)v122;
    v91 = a7;
    do
    {
      uint64_t v37 = 0;
      do
      {
        if (*(void *)v122 != v87) {
          objc_enumerationMutation(obj);
        }
        uint64_t v89 = v37;
        double v38 = *(void **)(*((void *)&v121 + 1) + 8 * v37);
        v39 = [v38 calendarChanges];
        v40 = [v20 _changedAttributesFromCalendarChanges:v39];

        if ([v40 count])
        {
          long long v119 = 0u;
          long long v120 = 0u;
          long long v117 = 0u;
          long long v118 = 0u;
          id v90 = [v40 allKeys];
          uint64_t v98 = [v90 countByEnumeratingWithState:&v117 objects:v133 count:16];
          if (!v98) {
            goto LABEL_46;
          }
          uint64_t v95 = *(void *)v118;
          id v92 = v38;
          v93 = v40;
          while (1)
          {
            uint64_t v41 = 0;
            do
            {
              if (*(void *)v118 != v95) {
                objc_enumerationMutation(v90);
              }
              uint64_t v100 = v41;
              uint64_t v42 = *(void *)(*((void *)&v117 + 1) + 8 * v41);
              v99 = (const void *)[v20 _createResourceChange:v38 withType:2 forNotification:v36 withRecurrenceID:v42 database:a7 store:a8 calendarHomeURL:v97];
              if (v99)
              {
                double v43 = [v40 objectForKeyedSubscript:v42];
                long long v113 = 0u;
                long long v114 = 0u;
                long long v115 = 0u;
                long long v116 = 0u;
                uint64_t v44 = [v43 countByEnumeratingWithState:&v113 objects:v132 count:16];
                if (!v44) {
                  goto LABEL_43;
                }
                uint64_t v45 = v44;
                int v46 = 0;
                uint64_t v47 = *(void *)v114;
                while (1)
                {
                  for (uint64_t j = 0; j != v45; ++j)
                  {
                    if (*(void *)v114 != v47) {
                      objc_enumerationMutation(v43);
                    }
                    CFURLRef v49 = *(void **)(*((void *)&v113 + 1) + 8 * j);
                    if (![v49 caseInsensitiveCompare:@"dtstart"])
                    {
LABEL_38:
                      v46 |= 1u;
                      continue;
                    }
                    if ([v49 caseInsensitiveCompare:@"TimeChanged"])
                    {
                      if (![v49 caseInsensitiveCompare:@"DateChanged"]) {
                        goto LABEL_38;
                      }
                      if ([v49 caseInsensitiveCompare:@"summary"])
                      {
                        if (![v49 caseInsensitiveCompare:@"location"]
                          || ![v49 caseInsensitiveCompare:@"x-apple-structured-location"])
                        {
                          v46 |= 8u;
                        }
                      }
                      else
                      {
                        v46 |= 4u;
                      }
                    }
                    else
                    {
                      v46 |= 2u;
                    }
                  }
                  uint64_t v45 = [v43 countByEnumeratingWithState:&v113 objects:v132 count:16];
                  if (!v45)
                  {
LABEL_43:
                    CalResourceChangeSetChangedProperties((uint64_t)v99);
                    CFRelease(v99);

                    a7 = v91;
                    double v38 = v92;
                    id v20 = a1;
                    id v36 = v24;
                    v40 = v93;
                    break;
                  }
                }
              }
              uint64_t v41 = v100 + 1;
            }
            while (v100 + 1 != v98);
            uint64_t v98 = [v90 countByEnumeratingWithState:&v117 objects:v133 count:16];
            if (!v98)
            {
LABEL_46:

              goto LABEL_49;
            }
          }
        }
        v50 = (const void *)[v20 _createResourceChange:v38 withType:2 forNotification:v36 withRecurrenceID:0 database:a7 store:a8 calendarHomeURL:v97];
        if (v50) {
          CFRelease(v50);
        }
LABEL_49:

        uint64_t v37 = v89 + 1;
      }
      while (v89 + 1 != v88);
      uint64_t v88 = [obj countByEnumeratingWithState:&v121 objects:v134 count:16];
    }
    while (v88);
  }

  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  int v51 = [v85 deleted];
  uint64_t v52 = [v51 countByEnumeratingWithState:&v109 objects:v131 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v110;
    do
    {
      for (uint64_t k = 0; k != v53; ++k)
      {
        if (*(void *)v110 != v54) {
          objc_enumerationMutation(v51);
        }
        id v56 = *(void **)(*((void *)&v109 + 1) + 8 * k);
        uint64_t v57 = [a1 _createResourceChange:v56 withType:3 forNotification:v36 withRecurrenceID:0 database:a7 store:a8 calendarHomeURL:v97];
        if (v57)
        {
          int v58 = (const void *)v57;
          int v59 = [v56 summary];
          v60 = v59;
          if (v59)
          {
            id v61 = v59;
          }
          else
          {
            id v61 = [v56 displayName];
          }
          v62 = v61;

          CalResourceChangeSetDeletedSummary((uint64_t)v58);
          CFRelease(v58);
        }
        id v36 = v94;
      }
      uint64_t v53 = [v51 countByEnumeratingWithState:&v109 objects:v131 count:16];
    }
    while (v53);
  }

  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  v63 = [v85 collectionChanges];
  uint64_t v64 = [v63 countByEnumeratingWithState:&v105 objects:v130 count:16];
  if (v64)
  {
    uint64_t v65 = v64;
    uint64_t v66 = *(void *)v106;
    do
    {
      for (uint64_t m = 0; m != v65; ++m)
      {
        if (*(void *)v106 != v66) {
          objc_enumerationMutation(v63);
        }
        __int16 v68 = *(void **)(*((void *)&v105 + 1) + 8 * m);
        uint64_t v69 = [a1 _createResourceChange:v68 withType:4 forNotification:v94 withRecurrenceID:0 database:a7 store:a8 calendarHomeURL:v97];
        if (v69)
        {
          uint64_t v70 = (const void *)v69;
          if ([v68 created])
          {
            [v68 created];
            CalResourceChangeSetCreateCount((uint64_t)v70);
          }
          if ([v68 updated])
          {
            [v68 updated];
            CalResourceChangeSetUpdateCount((uint64_t)v70);
          }
          if ([v68 deleted])
          {
            [v68 deleted];
            CalResourceChangeSetDeleteCount((uint64_t)v70);
          }
          CFRelease(v70);
        }
      }
      uint64_t v65 = [v63 countByEnumeratingWithState:&v105 objects:v130 count:16];
    }
    while (v65);
  }

  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  v71 = [v85 collectionUpdates];
  uint64_t v72 = [v71 countByEnumeratingWithState:&v101 objects:v129 count:16];
  uint64_t v73 = v94;
  if (v72)
  {
    uint64_t v74 = v72;
    uint64_t v75 = *(void *)v102;
    do
    {
      for (uint64_t n = 0; n != v74; ++n)
      {
        if (*(void *)v102 != v75) {
          objc_enumerationMutation(v71);
        }
        v77 = *(void **)(*((void *)&v101 + 1) + 8 * n);
        uint64_t v78 = [a1 _createResourceChange:v77 withType:5 forNotification:v73 withRecurrenceID:0 database:a7 store:a8 calendarHomeURL:v97];
        if (v78)
        {
          v79 = (const void *)v78;
          if ([v77 state] != 2) {
            [v77 state];
          }
          CalResourceChangeSetPublicStatus((uint64_t)v79);
          CFRelease(v79);
        }
        uint64_t v73 = v94;
      }
      uint64_t v74 = [v71 countByEnumeratingWithState:&v101 objects:v129 count:16];
    }
    while (v74);
  }

  CFRelease(v73);
}

+ (void)_createResourceChange:(id)a3 withType:(unsigned int)a4 forNotification:(void *)a5 withRecurrenceID:(id)a6 database:(CalDatabase *)a7 store:(void *)a8 calendarHomeURL:(id)a9
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a9;
  id v17 = (void *)CalDatabaseCreateResourceChangeOfType((os_unfair_lock_s *)a7);
  CalResourceChangeNotificationAddChange((uint64_t)a5, v17);
  id v18 = [v14 href];
  id v19 = [v18 payloadAsFullURL];

  id v20 = [v19 pathExtension];
  int v21 = [v20 isEqualToString:@"ics"];

  if (v21)
  {
    uint64_t v22 = [v19 URLByDeletingLastPathComponent];
    objc_msgSend(v22, "calDAV_leastInfoStringRepresentationRelativeToParentURL:", v16);
    id v61 = a7;
    unsigned int v23 = a4;
    id v24 = a8;
    v25 = v17;
    id v26 = v19;
    id v27 = v14;
    id v28 = v16;
    v30 = id v29 = v15;
    uint64_t v31 = [v30 appendSlashIfNeeded];

    id v15 = v29;
    id v16 = v28;
    id v14 = v27;
    id v19 = v26;
    id v17 = v25;
    a8 = v24;
    a4 = v23;
    a7 = v61;
  }
  else
  {
    uint64_t v22 = objc_msgSend(v19, "calDAV_leastInfoStringRepresentationRelativeToParentURL:", v16);
    uint64_t v31 = [v22 appendSlashIfNeeded];
  }

  CFTypeRef v32 = CalDatabaseCopyCalendarWithExternalIDInStore(a7, v31, (uint64_t)a8);
  if (v32)
  {
    uint64_t v33 = v32;
    CalResourceChangeSetCalendar((uint64_t)v17, v32);
    CFRelease(v33);
  }
  if (a4 - 1 <= 1)
  {
    objc_msgSend(v19, "calDAV_leastInfoStringRepresentationRelativeToParentURL:", v16);
    char v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFTypeRef v35 = CalDatabaseCopyCalendarItemWithExternalIDInCalendarOrStore((os_unfair_lock_s *)a7, -1, v34, 0, (uint64_t)a8);
    id v62 = v15;
    if (v15)
    {
      if (([v15 isEqualToString:@"master"] & 1) == 0)
      {
        CFMutableArrayRef v53 = CalEventCopyDetachedEvents((uint64_t)v35);
        if ([(__CFArray *)v53 count])
        {
          id v54 = objc_alloc(MEMORY[0x1E4FB7F28]);
          unsigned int v55 = [MEMORY[0x1E4FB7F40] dateFromICSString:v15];
          id v56 = (CalDatabase *)[v54 initWithValue:v55];

          id v61 = v56;
          double v57 = CalDateFromICSDateAsUTC(v56);
          if ([(__CFArray *)v53 count])
          {
            uint64_t v58 = 0;
            while (1)
            {
              id v36 = -[__CFArray objectAtIndexedSubscript:](v53, "objectAtIndexedSubscript:", v58, v61);

              if (CalEventGetOriginalStartDate((uint64_t)v36) == v57) {
                break;
              }
              if (++v58 >= (unint64_t)[(__CFArray *)v53 count]) {
                goto LABEL_36;
              }
            }
            if (v36)
            {
              CFRetain(v36);
              id v15 = v36;
            }
            else
            {
              id v15 = 0;
            }
          }
          else
          {
LABEL_36:
            id v15 = 0;
            id v36 = (void *)v35;
          }
        }
        else
        {
          id v15 = 0;
          id v36 = (void *)v35;
        }

        if (!v36) {
          goto LABEL_12;
        }
        goto LABEL_11;
      }
      id v15 = 0;
    }
    id v36 = (void *)v35;
    if (!v35)
    {
LABEL_12:
      if (v35) {
        CFRelease(v35);
      }
      if (v15) {
        CFRelease(v15);
      }

      id v15 = v62;
      goto LABEL_17;
    }
LABEL_11:
    CalResourceChangeSetCalendarItem((uint64_t)v17, v36);
    goto LABEL_12;
  }
LABEL_17:
  uint64_t v37 = objc_msgSend(v14, "changedBy", v61);
  double v38 = v37;
  if (!v37) {
    goto LABEL_30;
  }
  v39 = [v37 displayName];
  if (v39)
  {
    CalResourceChangeSetChangedByDisplayName((uint64_t)v17);
  }
  else
  {
    v40 = [v38 firstName];
    CalResourceChangeSetChangedByFirstName((uint64_t)v17);

    uint64_t v41 = [v38 lastName];
    CalResourceChangeSetChangedByLastName((uint64_t)v17);
  }
  uint64_t v42 = [v38 emailAddress];

  if (v42)
  {
    double v43 = [v38 emailAddress];
    CFStringRef v44 = (const __CFString *)[v43 stringAddingMailto];
  }
  else
  {
    uint64_t v45 = [v38 phoneNumber];

    if (!v45)
    {
      int v59 = [v38 address];

      if (v59)
      {
        CFURLRef v60 = [v38 address];
        CalResourceChangeSetChangedByAddress((uint64_t)v17, v60);
      }
      goto LABEL_27;
    }
    double v43 = [v38 phoneNumber];
    CFStringRef v44 = (const __CFString *)[v43 stringAddingTel];
  }
  CFURLRef v46 = CFURLCreateWithString(0, v44, 0);

  CalResourceChangeSetChangedByAddress((uint64_t)v17, v46);
  if (v46) {
    CFRelease(v46);
  }
LABEL_27:
  id v47 = objc_alloc(MEMORY[0x1E4FB7F28]);
  v48 = [v38 dtstamp];
  CFURLRef v49 = (void *)[v47 initWithValue:v48];

  double v50 = CalDateFromICSDateAsUTC(v49);
  CFDateRef v51 = CFDateCreate(0, v50);
  CalResourceChangeSetTimestamp((uint64_t)v17);
  if (v51) {
    CFRelease(v51);
  }

LABEL_30:
  return v17;
}

+ (id)_changedAttributesFromCalendarChanges:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v42 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  obuint64_t j = v3;
  uint64_t v37 = [obj countByEnumeratingWithState:&v53 objects:v59 count:16];
  if (v37)
  {
    uint64_t v36 = *(void *)v54;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v54 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v38 = v4;
        v5 = *(void **)(*((void *)&v53 + 1) + 8 * v4);
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v39 = [v5 recurrences];
        uint64_t v41 = [v39 countByEnumeratingWithState:&v49 objects:v58 count:16];
        if (v41)
        {
          uint64_t v40 = *(void *)v50;
          do
          {
            uint64_t v6 = 0;
            do
            {
              if (*(void *)v50 != v40) {
                objc_enumerationMutation(v39);
              }
              uint64_t v44 = v6;
              v7 = *(void **)(*((void *)&v49 + 1) + 8 * v6);
              v8 = [v7 recurrenceID];
              if (v8)
              {
                id v9 = [v7 recurrenceID];
                v10 = [v9 payloadAsString];
              }
              else
              {
                v10 = @"master";
              }

              v11 = [v42 objectForKeyedSubscript:v10];
              if (!v11)
              {
                v11 = objc_opt_new();
                [v42 setObject:v11 forKeyedSubscript:v10];
              }
              double v43 = v10;
              long long v47 = 0u;
              long long v48 = 0u;
              long long v45 = 0u;
              long long v46 = 0u;
              v12 = [v7 changes];
              v13 = [v12 changedProperties];

              uint64_t v14 = [v13 countByEnumeratingWithState:&v45 objects:v57 count:16];
              if (v14)
              {
                uint64_t v15 = v14;
                uint64_t v16 = *(void *)v46;
                do
                {
                  uint64_t v17 = 0;
                  do
                  {
                    if (*(void *)v46 != v16) {
                      objc_enumerationMutation(v13);
                    }
                    id v18 = *(void **)(*((void *)&v45 + 1) + 8 * v17);
                    id v19 = [v18 nameAttribute];

                    if (v19)
                    {
                      id v20 = [v18 nameAttribute];
                      uint64_t v21 = [v20 caseInsensitiveCompare:@"dtstart"];

                      if (v21) {
                        goto LABEL_23;
                      }
                      uint64_t v23 = [v18 typeAttribute];
                      if (v23
                        && (id v24 = (void *)v23,
                            [v18 typeAttribute],
                            v25 = objc_claimAutoreleasedReturnValue(),
                            uint64_t v26 = [v25 caseInsensitiveCompare:@"time"],
                            v25,
                            v24,
                            !v26))
                      {
                        uint64_t v31 = v11;
                        CFTypeRef v32 = @"TimeChanged";
                      }
                      else
                      {
                        uint64_t v27 = [v18 typeAttribute];
                        if (!v27
                          || (id v28 = (void *)v27,
                              [v18 typeAttribute],
                              id v29 = objc_claimAutoreleasedReturnValue(),
                              uint64_t v30 = [v29 caseInsensitiveCompare:@"date"],
                              v29,
                              v28,
                              v30))
                        {
LABEL_23:
                          uint64_t v22 = [v18 nameAttribute];
                          [v11 addObject:v22];

                          goto LABEL_24;
                        }
                        uint64_t v31 = v11;
                        CFTypeRef v32 = @"DateChanged";
                      }
                      [v31 addObject:v32];
                    }
LABEL_24:
                    ++v17;
                  }
                  while (v15 != v17);
                  uint64_t v33 = [v13 countByEnumeratingWithState:&v45 objects:v57 count:16];
                  uint64_t v15 = v33;
                }
                while (v33);
              }

              uint64_t v6 = v44 + 1;
            }
            while (v44 + 1 != v41);
            uint64_t v41 = [v39 countByEnumeratingWithState:&v49 objects:v58 count:16];
          }
          while (v41);
        }

        uint64_t v4 = v38 + 1;
      }
      while (v38 + 1 != v37);
      uint64_t v37 = [obj countByEnumeratingWithState:&v53 objects:v59 count:16];
    }
    while (v37);
  }

  return v42;
}

+ (void)_copyNotificationWithUniqueIdentifier:(id)a3 inCalendar:(void *)a4 orStore:(void *)a5 withDatabase:(CalDatabase *)a6 recordIDMap:(id)a7
{
  v11 = (__CFString *)a3;
  id v12 = a7;
  v13 = (const void *)[v12 recordIDForUniqueIdentifier:v11];
  if (!v13 || (uint64_t v14 = (void *)CalDatabaseCopyEntityWithRecordID((uint64_t)a6, v13)) == 0)
  {
    CFTypeRef v15 = CalDatabaseCopyNotificationWithUniqueIdentifierInCalendarOrStore((os_unfair_lock_s *)a6, -1, v11, (uint64_t)a4, (uint64_t)a5);
    uint64_t v14 = (void *)v15;
    if (v15)
    {
      uint64_t v16 = CalEntityCopyRecordID(v15);
      if (v16)
      {
        uint64_t v17 = v16;
        [v12 setUniqueIdentifier:v11 forRecordID:v16];
        CFRelease(v17);
      }
    }
  }

  return v14;
}

+ (void)_copyNotificationWithExternalID:(id)a3 inCalendar:(void *)a4 withDatabase:(CalDatabase *)a5 recordIDMap:(id)a6
{
  id v9 = (__CFString *)a3;
  v10 = (const void *)[a6 recordIDForExternalIdentifier:v9];
  if (v10)
  {
    v11 = (void *)CalDatabaseCopyEntityWithRecordID((uint64_t)a5, v10);
    if (!a4) {
      goto LABEL_7;
    }
  }
  else
  {
    v11 = 0;
    if (!a4) {
      goto LABEL_7;
    }
  }
  if (!v11) {
    v11 = (void *)CalDatabaseCopyNotificationWithExternalIDInCalendarOrStore((os_unfair_lock_s *)a5, -1, v9, (uint64_t)a4, 0);
  }
LABEL_7:

  return v11;
}

+ (void)setURL:(id)a3 forResourceWithUUID:(id)a4 withDatabase:(CalDatabase *)a5 notificationCalendar:(void *)a6 notificationCalendarURL:(id)a7 recordIDMap:(id)a8
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a8;
  if (v14)
  {
    uint64_t v18 = [a1 _copyNotificationWithUniqueIdentifier:v15 inCalendar:a6 orStore:0 withDatabase:a5 recordIDMap:v17];
    if (v18)
    {
      id v19 = (const void *)v18;
      id v20 = objc_msgSend(v14, "calDAV_leastInfoStringRepresentationRelativeToParentURL:", v16);
      CalNotificationSetExternalID((uint64_t)v19);
      uint64_t v21 = CalEntityCopyRecordID(v19);
      if (v21)
      {
        uint64_t v22 = v21;
        [v17 setExternalIdentifier:v20 forRecordID:v21];
        CFRelease(v22);
      }
      CFRelease(v19);
    }
    else
    {
      uint64_t v23 = CDBLogHandle;
      if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 138412290;
        id v25 = v15;
        _os_log_impl(&dword_1A8E81000, v23, OS_LOG_TYPE_DEFAULT, "Couldn't set url for the event %@ because it doesn't exist in our database", (uint8_t *)&v24, 0xCu);
      }
    }
  }
}

@end