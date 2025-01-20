@interface EKUIEventNotificationRepresentation
+ (BOOL)_invitationNotificationHasResourceChanges:(id)a3 changesString:(id *)a4;
+ (id)_fromLocalizedString;
+ (id)_invitationUpdatedTitleLocalizedString;
+ (id)_whenLocalizedString;
+ (id)_whereLocalizedString;
+ (id)defaultEventNotificationRepresentationWithTitle:(id)a3 message:(id)a4 notes:(id)a5;
+ (id)invitationNotificationRepresentationWithNotification:(id)a3 event:(id)a4 date:(id)a5 endDate:(id)a6 timeZone:(id)a7;
+ (id)previewForNotes:(id)a3;
+ (id)resourceChangeNotificationWithNotification:(id)a3 message:(id)a4 date:(id)a5 endDate:(id)a6 timeZone:(id)a7;
+ (id)responseNotificationWithTitle:(id)a3 message:(id)a4;
+ (id)timeToLeaveNotificationRepresentationWithHypothesisMessage:(id)a3 event:(id)a4 date:(id)a5 displayTimeZone:(id)a6;
+ (id)upcomingEventNotificationRepresentationWithEvent:(id)a3 date:(id)a4 displayTimeZone:(id)a5;
- (BOOL)isAllDay;
- (EKUIEventNotificationRepresentation)initWithDictionary:(id)a3;
- (EKUITextAndHeaderItem)subtitleItem;
- (EKUITextAndHeaderItem)titleItem;
- (NSArray)potentialConflictDates;
- (NSArray)supplementaryItems;
- (NSDate)date;
- (NSDate)endDate;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)organizerContactDictionary;
- (NSDictionary)userActivityUserInfo;
- (NSString)externalURLString;
- (NSString)notes;
- (NSString)sourceIdentifier;
- (id)description;
- (id)dictionaryRepresentationsOfSupplementaryItems;
- (unint64_t)type;
- (void)_setOwnerForContactDictionary:(id)a3;
- (void)setAllDay:(BOOL)a3;
- (void)setDate:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setExternalURLString:(id)a3;
- (void)setNotes:(id)a3;
- (void)setOrganizerForContactDictionary:(id)a3;
- (void)setPotentialConflictDates:(id)a3;
- (void)setSourceIdentifier:(id)a3;
- (void)setSubtitleItem:(id)a3;
- (void)setSupplementaryItems:(id)a3;
- (void)setTitleItem:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)setUserActivityUserInfo:(id)a3;
- (void)updateUpcomingEventNotificationWithHypothesisMessage:(id)a3;
@end

@implementation EKUIEventNotificationRepresentation

+ (id)defaultEventNotificationRepresentationWithTitle:(id)a3 message:(id)a4 notes:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)a1);
  [v11 setType:0];
  v12 = EventKitUIBundle();
  v13 = [v12 localizedStringForKey:@"Unknown title" value:@"Title" table:0];
  v14 = +[EKUITextAndHeaderItem itemWithText:v10 andHeader:v13];

  [v11 setTitleItem:v14];
  v15 = +[EKUITextAndHeaderItem itemWithText:v9 andHeader:&stru_1F0CC2140];

  [v11 setSubtitleItem:v15];
  v16 = [(id)objc_opt_class() previewForNotes:v8];

  [v11 setNotes:v16];

  return v11;
}

+ (id)upcomingEventNotificationRepresentationWithEvent:(id)a3 date:(id)a4 displayTimeZone:(id)a5
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v81 = a5;
  id v10 = objc_alloc_init((Class)a1);
  [v10 setType:1];
  objc_msgSend(v10, "setAllDay:", objc_msgSend(v8, "isAllDay"));
  id v80 = v9;
  [v10 setDate:v9];
  id v11 = objc_opt_class();
  v12 = [v8 notes];
  v13 = [v11 previewForNotes:v12];
  [v10 setNotes:v13];

  v14 = [v8 title];
  v15 = EventKitUIBundle();
  v16 = [v15 localizedStringForKey:@"Title" value:&stru_1F0CC2140 table:0];
  uint64_t v17 = +[EKUITextAndHeaderItem itemWithText:v14 andHeader:v16];

  v79 = (void *)v17;
  [v10 setTitleItem:v17];
  v18 = (void *)MEMORY[0x1E4F57BA0];
  v19 = [v8 location];
  v20 = [v8 locationWithoutPrediction];
  v21 = [v8 preferredLocation];
  v22 = [v18 locationStringForLocation:v19 locationWithoutPrediction:v20 preferredLocation:v21 conferenceURL:0 conferenceURLIsBroadcast:0 options:96];
  v23 = [v22 string];

  if ([v23 length])
  {
    v24 = [(id)objc_opt_class() _whereLocalizedString];
    v25 = +[EKUITextAndHeaderItem itemWithText:v23 andHeader:v24];

    [v10 setSubtitleItem:v25];
  }
  v78 = v23;
  v26 = [MEMORY[0x1E4F1CA48] array];
  v27 = +[EKStringFactory sharedInstance];
  v28 = [v8 startDate];
  v29 = [v8 endDateUnadjustedForLegacyClients];
  uint64_t v30 = objc_msgSend(v27, "dateStringForEventInvitationWithStartDate:endDate:timeZone:allDay:", v28, v29, v81, objc_msgSend(v8, "isAllDay"));

  v31 = v26;
  v32 = [(id)objc_opt_class() _whenLocalizedString];
  v77 = (void *)v30;
  v33 = +[EKUITextAndHeaderItem itemWithText:v30 andHeader:v32];
  [v26 addObject:v33];

  v34 = [v8 organizer];
  v35 = v34;
  if (v34 && ([v34 isCurrentUser] & 1) == 0)
  {
    CUIKDisplayStringForNotificationIdentity();
    v37 = v36 = v35;
    [(id)objc_opt_class() _fromLocalizedString];
    v39 = v38 = v31;
    v40 = +[EKUITextAndHeaderItem itemWithText:v37 andHeader:v39];
    [v38 addObject:v40];

    v31 = v38;
    v35 = v36;
  }
  v41 = [v8 attendees];
  v42 = v41;
  v43 = v80;
  if (v41 && [v41 count])
  {
    id v73 = v10;
    id v74 = v8;
    v72 = v42;
    v75 = [v8 sortEKParticipantsIgnoringNonHumans:v42];
    v44 = objc_opt_new();
    v45 = v35;
    v46 = objc_opt_new();
    v82 = objc_opt_new();
    v76 = v45;
    if (v45 && [v45 isCurrentUser])
    {
      v71 = v31;
      long long v87 = 0u;
      long long v88 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      id v47 = v75;
      uint64_t v48 = [v47 countByEnumeratingWithState:&v85 objects:v89 count:16];
      if (v48)
      {
        uint64_t v49 = v48;
        uint64_t v50 = *(void *)v86;
        do
        {
          for (uint64_t i = 0; i != v49; ++i)
          {
            if (*(void *)v86 != v50) {
              objc_enumerationMutation(v47);
            }
            v52 = *(void **)(*((void *)&v85 + 1) + 8 * i);
            v53 = [v52 name];
            v54 = v53;
            if (v53)
            {
              id v55 = v53;
            }
            else
            {
              v56 = [v52 URL];
              id v55 = [v56 resourceSpecifier];
            }
            uint64_t v57 = [v52 participantStatus];
            v58 = v44;
            if (v57 == 3
              || (uint64_t v59 = [v52 participantStatus], v58 = v46, v59 == 4)
              || (uint64_t v60 = [v52 participantStatus], v58 = v82, !v60)
              || (uint64_t v61 = [v52 participantStatus], v58 = v82, !v61))
            {
              [v58 addObject:v55];
            }
          }
          uint64_t v49 = [v47 countByEnumeratingWithState:&v85 objects:v89 count:16];
        }
        while (v49);
      }

      v31 = v71;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __109__EKUIEventNotificationRepresentation_upcomingEventNotificationRepresentationWithEvent_date_displayTimeZone___block_invoke;
    aBlock[3] = &unk_1E6087CC8;
    id v84 = v31;
    v62 = (void (**)(void *, void *, void *))_Block_copy(aBlock);
    v63 = EventKitUIBundle();
    v64 = [v63 localizedStringForKey:@"Declined" value:&stru_1F0CC2140 table:0];
    v62[2](v62, v44, v64);

    v65 = EventKitUIBundle();
    v66 = [v65 localizedStringForKey:@"No Reply" value:&stru_1F0CC2140 table:0];
    v62[2](v62, v82, v66);

    v67 = EventKitUIBundle();
    v68 = [v67 localizedStringForKey:@"Maybe" value:&stru_1F0CC2140 table:0];
    v62[2](v62, v46, v68);

    id v10 = v73;
    id v8 = v74;
    v43 = v80;
    v35 = v76;
    v42 = v72;
  }
  if ([v31 count])
  {
    v69 = (void *)[v31 copy];
    [v10 setSupplementaryItems:v69];
  }

  return v10;
}

void __109__EKUIEventNotificationRepresentation_upcomingEventNotificationRepresentationWithEvent_date_displayTimeZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  if ((unint64_t)[v13 count] < 3)
  {
    if (![v13 count]) {
      goto LABEL_6;
    }
    id v9 = [v13 componentsJoinedByString:@"\n"];
    id v11 = +[EKUITextAndHeaderItem itemWithText:v9 andHeader:v5];
    objc_msgSend(v11, "setLines:", objc_msgSend(v13, "count"));
    v12 = *(void **)(a1 + 32);
  }
  else
  {
    v6 = NSString;
    v7 = EventKitUIBundle();
    id v8 = [v7 localizedStringForKey:@"%d invitees" value:&stru_1F0CC2140 table:0];
    id v9 = objc_msgSend(v6, "localizedStringWithFormat:", v8, objc_msgSend(v13, "count"));

    id v10 = *(void **)(a1 + 32);
    id v11 = +[EKUITextAndHeaderItem itemWithText:v9 andHeader:v5];
    v12 = v10;
  }
  [v12 addObject:v11];

LABEL_6:
}

+ (id)invitationNotificationRepresentationWithNotification:(id)a3 event:(id)a4 date:(id)a5 endDate:(id)a6 timeZone:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v62 = a6;
  id v60 = a7;
  id v15 = objc_alloc_init((Class)a1);
  id v16 = v12;
  [v15 setType:2];
  uint64_t v17 = objc_opt_new();
  v18 = [v16 title];
  [v17 setText:v18];

  v19 = objc_opt_new();
  if ([v16 type] == 2)
  {
    v20 = EventKitUIBundle();
    v21 = [v20 localizedStringForKey:@"Canceled" value:&stru_1F0CC2140 table:0];
    [v17 setHeader:v21];

    v22 = EventKitUIBundle();
    v23 = [v22 localizedStringForKey:@"Canceled by" value:&stru_1F0CC2140 table:0];
    [v19 setHeader:v23];

    uint64_t v24 = CUIKDisplayStringForNotificationIdentity();
LABEL_5:
    v28 = (void *)v24;
    [v19 setText:v24];

    goto LABEL_10;
  }
  uint64_t v25 = [v16 type];
  v26 = objc_opt_class();
  if (v25 == 3)
  {
    v27 = [v26 _invitationUpdatedTitleLocalizedString];
    [v17 setHeader:v27];

    uint64_t v24 = CUIKMessageStringForEventInvitationNotification();
    goto LABEL_5;
  }
  id v63 = 0;
  int v29 = [v26 _invitationNotificationHasResourceChanges:v16 changesString:&v63];
  id v30 = v63;
  if (v29)
  {
    v31 = [(id)objc_opt_class() _invitationUpdatedTitleLocalizedString];
    [v17 setHeader:v31];

    [v19 setText:v30];
  }
  else
  {
    v32 = EventKitUIBundle();
    v33 = [v32 localizedStringForKey:@"Invitation" value:&stru_1F0CC2140 table:0];
    [v17 setHeader:v33];

    v34 = [(id)objc_opt_class() _fromLocalizedString];
    [v19 setHeader:v34];

    v35 = CUIKDisplayStringForNotificationIdentity();
    [v19 setText:v35];
  }
LABEL_10:
  [v15 setDate:v14];
  if (([v13 isAllDay] & 1) == 0)
  {
    v36 = [v13 endDateUnadjustedForLegacyClients];

    if (v36)
    {
      [v15 setEndDate:v62];
      v37 = [v13 potentialConflictOccurrenceDatesInTimePeriod:0];
      [v15 setPotentialConflictDates:v37];

      v38 = [v13 calendar];
      v39 = [v38 source];
      v40 = [v39 sourceIdentifier];
      [v15 setSourceIdentifier:v40];

      v41 = [v13 externalURL];
      v42 = [v41 absoluteString];
      [v15 setExternalURLString:v42];
    }
  }
  uint64_t v61 = v13;
  [v15 setTitleItem:v17];
  [v15 setSubtitleItem:v19];
  v43 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  v44 = objc_opt_new();
  v45 = [(id)objc_opt_class() _whenLocalizedString];
  [v44 setHeader:v45];

  v46 = +[EKStringFactory sharedInstance];
  id v47 = v14;
  uint64_t v48 = objc_msgSend(v46, "dateStringForEventInvitationWithStartDate:endDate:timeZone:allDay:", v14, v62, v60, objc_msgSend(v16, "isAllDay"));

  [v44 setText:v48];
  [v43 addObject:v44];
  uint64_t v49 = [v16 location];
  uint64_t v50 = [v49 length];

  if (v50)
  {
    v51 = objc_opt_new();
    v52 = [(id)objc_opt_class() _whereLocalizedString];
    [v51 setHeader:v52];

    v53 = [v16 location];
    [v51 setText:v53];

    [v43 addObject:v51];
  }
  v54 = (void *)[v43 copy];
  [v15 setSupplementaryItems:v54];

  id v55 = [v16 owner];

  if (v55)
  {
    v56 = [v16 owner];
    char v57 = [v56 isCurrentUser];

    if ((v57 & 1) == 0)
    {
      v58 = [v16 owner];
      [v15 _setOwnerForContactDictionary:v58];
    }
  }

  return v15;
}

+ (id)_invitationUpdatedTitleLocalizedString
{
  v2 = EventKitUIBundle();
  v3 = [v2 localizedStringForKey:@"Updates" value:&stru_1F0CC2140 table:0];

  return v3;
}

+ (id)_whenLocalizedString
{
  v2 = EventKitUIBundle();
  v3 = [v2 localizedStringForKey:@"When" value:&stru_1F0CC2140 table:0];

  return v3;
}

+ (id)_whereLocalizedString
{
  v2 = EventKitUIBundle();
  v3 = [v2 localizedStringForKey:@"Where" value:&stru_1F0CC2140 table:0];

  return v3;
}

+ (id)_fromLocalizedString
{
  v2 = EventKitUIBundle();
  v3 = [v2 localizedStringForKey:@"From" value:&stru_1F0CC2140 table:0];

  return v3;
}

+ (BOOL)_invitationNotificationHasResourceChanges:(id)a3 changesString:(id *)a4
{
  id v5 = a3;
  if ([v5 timeChanged] & 1) != 0 || (objc_msgSend(v5, "dateChanged"))
  {
    int v6 = 1;
    if (!a4) {
      goto LABEL_20;
    }
  }
  else
  {
    int v6 = [v5 locationChanged];
    if (!a4) {
      goto LABEL_20;
    }
  }
  if (!v6) {
    goto LABEL_20;
  }
  v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  if (([v5 timeChanged] & 1) != 0 || objc_msgSend(v5, "dateChanged"))
  {
    if ([v5 timeChanged])
    {
      id v8 = EventKitUIBundle();
      id v9 = v8;
      id v10 = @"Time changed";
      goto LABEL_13;
    }
    if ([v5 dateChanged])
    {
      id v8 = EventKitUIBundle();
      id v9 = v8;
      id v10 = @"Date changed";
LABEL_13:
      id v11 = [v8 localizedStringForKey:v10 value:&stru_1F0CC2140 table:0];

      if (v11)
      {
        [v7 addObject:v11];
      }
    }
  }
  if ([v5 locationChanged])
  {
    if ([v5 locationChanged])
    {
      id v12 = EventKitUIBundle();
      id v13 = [v12 localizedStringForKey:@"Location changed" value:&stru_1F0CC2140 table:0];

      if (v13)
      {
        [v7 addObject:v13];
      }
    }
  }
  *a4 = [v7 componentsJoinedByString:@"\n"];

LABEL_20:
  return v6;
}

+ (id)responseNotificationWithTitle:(id)a3 message:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)a1);
  [v8 setType:3];
  id v9 = EventKitUIBundle();
  id v10 = [v9 localizedStringForKey:@"Shared Calendar" value:&stru_1F0CC2140 table:0];
  id v11 = +[EKUITextAndHeaderItem itemWithText:v7 andHeader:v10];

  [v8 setTitleItem:v11];
  id v12 = +[EKUITextAndHeaderItem itemWithText:v6 andHeader:&stru_1F0CC2140];

  [v8 setSubtitleItem:v12];

  return v8;
}

+ (id)resourceChangeNotificationWithNotification:(id)a3 message:(id)a4 date:(id)a5 endDate:(id)a6 timeZone:(id)a7
{
  id v12 = a3;
  id v35 = a5;
  id v13 = a6;
  id v36 = a7;
  id v14 = a4;
  id v15 = objc_alloc_init((Class)a1);
  [v15 setType:4];
  id v16 = v12;
  uint64_t v17 = objc_opt_new();
  v18 = EventKitUIBundle();
  v19 = [v18 localizedStringForKey:@"Shared Event" value:&stru_1F0CC2140 table:0];
  [v17 setHeader:v19];

  v20 = [v16 title];
  [v17 setText:v20];

  [v15 setTitleItem:v17];
  v21 = v35;
  v22 = +[EKUITextAndHeaderItem itemWithText:v14 andHeader:&stru_1F0CC2140];

  [v15 setSubtitleItem:v22];
  v23 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  if ([v16 changeType] != 3)
  {
    uint64_t v24 = objc_opt_new();
    uint64_t v25 = [(id)objc_opt_class() _whenLocalizedString];
    [v24 setHeader:v25];

    v26 = +[EKStringFactory sharedInstance];
    v27 = objc_msgSend(v26, "dateStringForEventInvitationWithStartDate:endDate:timeZone:allDay:", v35, v13, v36, objc_msgSend(v16, "allDay"));
    [v24 setText:v27];

    [v23 addObject:v24];
  }
  v28 = objc_msgSend(v16, "location", v35);
  uint64_t v29 = [v28 length];

  if (v29)
  {
    id v30 = objc_opt_new();
    v31 = [(id)objc_opt_class() _whereLocalizedString];
    [v30 setHeader:v31];

    v32 = [v16 location];
    [v30 setText:v32];

    [v23 addObject:v30];
  }
  v33 = (void *)[v23 copy];
  [v15 setSupplementaryItems:v33];

  [v15 setDate:v21];
  [v15 setEndDate:v13];

  return v15;
}

+ (id)timeToLeaveNotificationRepresentationWithHypothesisMessage:(id)a3 event:(id)a4 date:(id)a5 displayTimeZone:(id)a6
{
  id v10 = a3;
  id v11 = [a1 upcomingEventNotificationRepresentationWithEvent:a4 date:a5 displayTimeZone:a6];
  [v11 updateUpcomingEventNotificationWithHypothesisMessage:v10];

  return v11;
}

- (void)updateUpcomingEventNotificationWithHypothesisMessage:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [(EKUIEventNotificationRepresentation *)self setType:5];
    id v8 = +[EKUITextAndHeaderItem itemWithText:v4 andHeader:&stru_1F0CC2140];

    [(EKUIEventNotificationRepresentation *)self setSubtitleItem:v8];
    id v5 = [(EKUIEventNotificationRepresentation *)self titleItem];
    id v6 = EventKitUIBundle();
    id v7 = [v6 localizedStringForKey:@"Time to Leave Watch notification header" value:@"Time to Leave" table:0];
    [v5 setHeader:v7];
  }
}

- (EKUIEventNotificationRepresentation)initWithDictionary:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v54.receiver = self;
  v54.super_class = (Class)EKUIEventNotificationRepresentation;
  id v6 = [(EKUIEventNotificationRepresentation *)&v54 init];
  if (v6)
  {
    id v7 = [v5 objectForKeyedSubscript:@"type"];
    if (!v7)
    {
      v46 = [MEMORY[0x1E4F28B00] currentHandler];
      id v47 = (objc_class *)objc_opt_class();
      uint64_t v48 = NSStringFromClass(v47);
      [v46 handleFailureInMethod:a2, v6, @"EKUIEventNotificationRepresentation.m", 340, @"%@ must have a EKUIEventNotificationRepresentationType", v48 object file lineNumber description];
    }
    v6->_type = [v7 integerValue];
    id v8 = [EKUITextAndHeaderItem alloc];
    id v9 = [v5 objectForKeyedSubscript:@"title"];
    uint64_t v10 = [(EKUITextAndHeaderItem *)v8 initWithDictionary:v9];
    titleItem = v6->_titleItem;
    v6->_titleItem = (EKUITextAndHeaderItem *)v10;

    id v12 = [EKUITextAndHeaderItem alloc];
    id v13 = [v5 objectForKeyedSubscript:@"subtitle"];
    uint64_t v14 = [(EKUITextAndHeaderItem *)v12 initWithDictionary:v13];
    subtitleItem = v6->_subtitleItem;
    v6->_subtitleItem = (EKUITextAndHeaderItem *)v14;

    uint64_t v16 = [v5 objectForKeyedSubscript:@"userActivity"];
    userActivityUserInfo = v6->_userActivityUserInfo;
    v6->_userActivityUserInfo = (NSDictionary *)v16;

    uint64_t v18 = [v5 objectForKeyedSubscript:@"date"];
    date = v6->_date;
    v6->_date = (NSDate *)v18;

    uint64_t v20 = [v5 objectForKeyedSubscript:@"endDate"];
    endDate = v6->_endDate;
    v6->_endDate = (NSDate *)v20;

    v22 = [v5 objectForKeyedSubscript:@"allDay"];
    v6->_allDay = [v22 BOOLValue];

    uint64_t v23 = [v5 objectForKeyedSubscript:@"organizer"];
    organizerContactDictionary = v6->_organizerContactDictionary;
    v6->_organizerContactDictionary = (NSDictionary *)v23;

    uint64_t v25 = [v5 objectForKeyedSubscript:@"sourceIdentifier"];
    sourceIdentifier = v6->_sourceIdentifier;
    v6->_sourceIdentifier = (NSString *)v25;

    uint64_t v27 = [v5 objectForKeyedSubscript:@"externalURL"];
    externalURLString = v6->_externalURLString;
    v6->_externalURLString = (NSString *)v27;

    uint64_t v29 = [v5 objectForKeyedSubscript:@"potentialConflictDates"];
    potentialConflictDates = v6->_potentialConflictDates;
    v6->_potentialConflictDates = (NSArray *)v29;

    uint64_t v31 = [v5 objectForKeyedSubscript:@"notes"];
    notes = v6->_notes;
    v6->_notes = (NSString *)v31;

    supplementaryItems = v6->_supplementaryItems;
    v6->_supplementaryItems = 0;

    v34 = [v5 objectForKeyedSubscript:@"supplementary"];
    id v35 = v34;
    if (v34)
    {
      uint64_t v49 = v7;
      id v36 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v34, "count"));
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v37 = v35;
      uint64_t v38 = [v37 countByEnumeratingWithState:&v50 objects:v55 count:16];
      if (v38)
      {
        uint64_t v39 = v38;
        uint64_t v40 = *(void *)v51;
        do
        {
          for (uint64_t i = 0; i != v39; ++i)
          {
            if (*(void *)v51 != v40) {
              objc_enumerationMutation(v37);
            }
            v42 = [[EKUITextAndHeaderItem alloc] initWithDictionary:*(void *)(*((void *)&v50 + 1) + 8 * i)];
            [v36 addObject:v42];
          }
          uint64_t v39 = [v37 countByEnumeratingWithState:&v50 objects:v55 count:16];
        }
        while (v39);
      }

      uint64_t v43 = [v36 copy];
      v44 = v6->_supplementaryItems;
      v6->_supplementaryItems = (NSArray *)v43;

      id v7 = v49;
    }
  }
  return v6;
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [NSNumber numberWithUnsignedInteger:self->_type];
  [v3 setObject:v4 forKeyedSubscript:@"type"];

  titleItem = self->_titleItem;
  if (titleItem)
  {
    id v6 = [(EKUITextAndHeaderItem *)titleItem dictionaryRepresentation];
    [v3 setObject:v6 forKeyedSubscript:@"title"];
  }
  subtitleItem = self->_subtitleItem;
  if (subtitleItem)
  {
    id v8 = [(EKUITextAndHeaderItem *)subtitleItem dictionaryRepresentation];
    [v3 setObject:v8 forKeyedSubscript:@"subtitle"];
  }
  if (self->_supplementaryItems)
  {
    id v9 = [(EKUIEventNotificationRepresentation *)self dictionaryRepresentationsOfSupplementaryItems];
    [v3 setObject:v9 forKeyedSubscript:@"supplementary"];
  }
  userActivityUserInfo = self->_userActivityUserInfo;
  if (userActivityUserInfo) {
    [v3 setObject:userActivityUserInfo forKeyedSubscript:@"userActivity"];
  }
  date = self->_date;
  if (date) {
    [v3 setObject:date forKeyedSubscript:@"date"];
  }
  endDate = self->_endDate;
  if (endDate) {
    [v3 setObject:endDate forKeyedSubscript:@"endDate"];
  }
  organizerContactDictionary = self->_organizerContactDictionary;
  if (organizerContactDictionary) {
    [v3 setObject:organizerContactDictionary forKeyedSubscript:@"organizer"];
  }
  sourceIdentifier = self->_sourceIdentifier;
  if (sourceIdentifier) {
    [v3 setObject:sourceIdentifier forKeyedSubscript:@"sourceIdentifier"];
  }
  externalURLString = self->_externalURLString;
  if (externalURLString) {
    [v3 setObject:externalURLString forKeyedSubscript:@"externalURL"];
  }
  potentialConflictDates = self->_potentialConflictDates;
  if (potentialConflictDates)
  {
    uint64_t v17 = (void *)[(NSArray *)potentialConflictDates copy];
    [v3 setObject:v17 forKeyedSubscript:@"potentialConflictDates"];
  }
  notes = self->_notes;
  if (notes) {
    [v3 setObject:notes forKeyedSubscript:@"notes"];
  }
  v19 = [NSNumber numberWithBool:self->_allDay];
  [v3 setObject:v19 forKeyedSubscript:@"allDay"];

  uint64_t v20 = (void *)[v3 copy];

  return (NSDictionary *)v20;
}

- (id)dictionaryRepresentationsOfSupplementaryItems
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  supplementaryItems = self->_supplementaryItems;
  if (supplementaryItems)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](supplementaryItems, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = self->_supplementaryItems;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "dictionaryRepresentation", (void)v13);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    id v11 = (void *)[v4 copy];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)setOrganizerForContactDictionary:(id)a3
{
  id v12 = a3;
  if (v12)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [v12 name];
    uint64_t v6 = [v5 length];

    if (v6)
    {
      uint64_t v7 = [v12 name];
      [v4 setObject:v7 forKeyedSubscript:@"displayName"];
    }
    uint64_t v8 = [v12 URL];
    id v9 = [v8 resourceSpecifier];

    if ([v9 length]) {
      [v4 setObject:v9 forKeyedSubscript:@"rawAddress"];
    }
  }
  else
  {
    id v4 = 0;
  }
  uint64_t v10 = (NSDictionary *)[v4 copy];
  organizerContactDictionary = self->_organizerContactDictionary;
  self->_organizerContactDictionary = v10;
}

- (void)_setOwnerForContactDictionary:(id)a3
{
  id v12 = a3;
  if (v12)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [v12 name];
    uint64_t v6 = [v5 length];

    if (v6)
    {
      uint64_t v7 = [v12 name];
      [v4 setObject:v7 forKeyedSubscript:@"displayName"];
    }
    uint64_t v8 = [v12 URL];
    id v9 = [v8 resourceSpecifier];

    if ([v9 length]) {
      [v4 setObject:v9 forKeyedSubscript:@"rawAddress"];
    }
  }
  else
  {
    id v4 = 0;
  }
  uint64_t v10 = (NSDictionary *)[v4 copy];
  organizerContactDictionary = self->_organizerContactDictionary;
  self->_organizerContactDictionary = v10;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)EKUIEventNotificationRepresentation;
  v3 = [(EKUIEventNotificationRepresentation *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@"%@ title: %@ subtitle: %@ numSupplementaryItems %lu", v3, self->_titleItem, self->_subtitleItem, -[NSArray count](self->_supplementaryItems, "count")];

  return v4;
}

+ (id)previewForNotes:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 length] <= 0x1F4)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [v3 substringToIndex:500];
  }
  id v5 = v4;

  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (EKUITextAndHeaderItem)titleItem
{
  return self->_titleItem;
}

- (void)setTitleItem:(id)a3
{
}

- (EKUITextAndHeaderItem)subtitleItem
{
  return self->_subtitleItem;
}

- (void)setSubtitleItem:(id)a3
{
}

- (NSArray)supplementaryItems
{
  return self->_supplementaryItems;
}

- (void)setSupplementaryItems:(id)a3
{
}

- (NSDictionary)userActivityUserInfo
{
  return self->_userActivityUserInfo;
}

- (void)setUserActivityUserInfo:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (BOOL)isAllDay
{
  return self->_allDay;
}

- (void)setAllDay:(BOOL)a3
{
  self->_allDay = a3;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)setSourceIdentifier:(id)a3
{
}

- (NSString)externalURLString
{
  return self->_externalURLString;
}

- (void)setExternalURLString:(id)a3
{
}

- (NSArray)potentialConflictDates
{
  return self->_potentialConflictDates;
}

- (void)setPotentialConflictDates:(id)a3
{
}

- (NSString)notes
{
  return self->_notes;
}

- (void)setNotes:(id)a3
{
}

- (NSDictionary)organizerContactDictionary
{
  return self->_organizerContactDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_organizerContactDictionary, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_potentialConflictDates, 0);
  objc_storeStrong((id *)&self->_externalURLString, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_userActivityUserInfo, 0);
  objc_storeStrong((id *)&self->_supplementaryItems, 0);
  objc_storeStrong((id *)&self->_subtitleItem, 0);

  objc_storeStrong((id *)&self->_titleItem, 0);
}

@end