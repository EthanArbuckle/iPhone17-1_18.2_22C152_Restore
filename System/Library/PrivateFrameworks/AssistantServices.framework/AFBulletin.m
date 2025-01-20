@interface AFBulletin
+ (BOOL)supportsSecureCoding;
+ (id)_createAssistantActionsForBulletin:(id)a3;
+ (id)internalIDForBBBulletinID:(id)a3;
- (AFBulletin)initWithCoder:(id)a3;
- (BBBulletin)bbBulletin;
- (BOOL)availableOnLockScreen;
- (BOOL)isAllDay;
- (BOOL)isHighlight;
- (BOOL)isRead;
- (BOOL)previewRestricted;
- (BOOL)supportsSpokenNotification;
- (NSArray)actionsStore;
- (NSArray)intentIDs;
- (NSDate)date;
- (NSDate)endDate;
- (NSDate)recencyDate;
- (NSDictionary)actionsByIdentifier;
- (NSString)bulletinID;
- (NSString)displayName;
- (NSString)internalID;
- (NSString)message;
- (NSString)modalAlertContentMessage;
- (NSString)publisherBulletinID;
- (NSString)recordID;
- (NSString)sectionID;
- (NSString)subtitle;
- (NSString)summary;
- (NSString)threadID;
- (NSString)timeZone;
- (NSString)title;
- (UNNotificationRequest)notificationRequest;
- (id)_displayNameForBulletin:(id)a3;
- (id)actionForIdentifier:(id)a3;
- (id)actions;
- (int64_t)announcementType;
- (int64_t)sectionSubtype;
- (unint64_t)feed;
- (void)encodeWithCoder:(id)a3;
- (void)setActionsByIdentifier:(id)a3;
- (void)setActionsStore:(id)a3;
- (void)setAnnouncementType:(int64_t)a3;
- (void)setAvailableOnLockScreen:(BOOL)a3;
- (void)setBulletin:(id)a3;
- (void)setBulletin:(id)a3 forFeed:(unint64_t)a4;
- (void)setDisplayName:(id)a3;
- (void)setIsHighlight:(BOOL)a3;
- (void)setNotification:(id)a3 fromSourceApp:(id)a4;
- (void)setNotificationRequest:(id)a3;
- (void)setRead:(BOOL)a3;
- (void)setSummary:(id)a3;
- (void)setSupportsSpokenNotification:(BOOL)a3;
- (void)wasRemovedFromFeed:(unint64_t)a3;
@end

@implementation AFBulletin

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionsByIdentifier, 0);
  objc_storeStrong((id *)&self->_actionsStore, 0);
  objc_storeStrong((id *)&self->_internalID, 0);
  objc_storeStrong((id *)&self->_threadID, 0);
  objc_storeStrong((id *)&self->_publisherBulletinID, 0);
  objc_storeStrong((id *)&self->_intentIDs, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
  objc_storeStrong((id *)&self->_recencyDate, 0);
  objc_storeStrong((id *)&self->_modalAlertContentMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_bulletinID, 0);
  objc_storeStrong((id *)&self->_bbBulletin, 0);
  objc_storeStrong((id *)&self->_notificationRequest, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

- (unint64_t)feed
{
  return self->_feed;
}

- (void)setActionsByIdentifier:(id)a3
{
}

- (NSDictionary)actionsByIdentifier
{
  return self->_actionsByIdentifier;
}

- (void)setActionsStore:(id)a3
{
}

- (NSArray)actionsStore
{
  return self->_actionsStore;
}

- (NSString)internalID
{
  return self->_internalID;
}

- (NSString)threadID
{
  return self->_threadID;
}

- (BOOL)previewRestricted
{
  return self->_previewRestricted;
}

- (NSString)publisherBulletinID
{
  return self->_publisherBulletinID;
}

- (NSArray)intentIDs
{
  return self->_intentIDs;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)timeZone
{
  return self->_timeZone;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (int64_t)sectionSubtype
{
  return self->_sectionSubtype;
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (NSDate)recencyDate
{
  return self->_recencyDate;
}

- (NSString)modalAlertContentMessage
{
  return self->_modalAlertContentMessage;
}

- (NSString)message
{
  return self->_message;
}

- (BOOL)isAllDay
{
  return self->_allDay;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)recordID
{
  return self->_recordID;
}

- (NSString)bulletinID
{
  return self->_bulletinID;
}

- (BBBulletin)bbBulletin
{
  return self->_bbBulletin;
}

- (void)setIsHighlight:(BOOL)a3
{
  self->_isHighlight = a3;
}

- (BOOL)isHighlight
{
  return self->_isHighlight;
}

- (void)setRead:(BOOL)a3
{
  self->_read = a3;
}

- (BOOL)isRead
{
  return self->_read;
}

- (void)setNotificationRequest:(id)a3
{
}

- (UNNotificationRequest)notificationRequest
{
  return self->_notificationRequest;
}

- (void)setSummary:(id)a3
{
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setAnnouncementType:(int64_t)a3
{
  self->_announcementType = a3;
}

- (int64_t)announcementType
{
  return self->_announcementType;
}

- (void)setSupportsSpokenNotification:(BOOL)a3
{
  self->_supportsSpokenNotification = a3;
}

- (BOOL)supportsSpokenNotification
{
  return self->_supportsSpokenNotification;
}

- (void)setAvailableOnLockScreen:(BOOL)a3
{
  self->_availableOnLockScreen = a3;
}

- (BOOL)availableOnLockScreen
{
  return self->_availableOnLockScreen;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)encodeWithCoder:(id)a3
{
  bulletinID = self->_bulletinID;
  id v5 = a3;
  [v5 encodeObject:bulletinID forKey:@"_bulletinID"];
  [v5 encodeObject:self->_recordID forKey:@"_recordID"];
  [v5 encodeObject:self->_sectionID forKey:@"_sectionID"];
  [v5 encodeInteger:self->_sectionSubtype forKey:@"_sectionSubtype"];
  [v5 encodeObject:self->_date forKey:@"_date"];
  [v5 encodeBool:self->_allDay forKey:@"_allDay"];
  [v5 encodeObject:self->_endDate forKey:@"_endDate"];
  [v5 encodeObject:self->_recencyDate forKey:@"_recencyDate"];
  [v5 encodeObject:self->_timeZone forKey:@"_timeZone"];
  [v5 encodeObject:self->_title forKey:@"_title"];
  [v5 encodeObject:self->_message forKey:@"_message"];
  [v5 encodeObject:self->_displayName forKey:@"_displayName"];
  [v5 encodeObject:self->_subtitle forKey:@"_subtitle"];
  [v5 encodeObject:self->_publisherBulletinID forKey:@"_publisherBulletinID"];
  [v5 encodeObject:self->_intentIDs forKey:@"_intentIDs"];
  [v5 encodeBool:self->_availableOnLockScreen forKey:@"_availableOnLockScreen"];
  [v5 encodeBool:self->_supportsSpokenNotification forKey:@"_supportsSpokenNotification"];
  [v5 encodeObject:self->_internalID forKey:@"_internalID"];
  [v5 encodeBool:self->_previewRestricted forKey:@"_previewRestricted"];
  [v5 encodeObject:self->_threadID forKey:@"_threadID"];
  id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:self->_feed];
  [v5 encodeObject:v6 forKey:@"_feed"];
}

- (AFBulletin)initWithCoder:(id)a3
{
  v42[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)AFBulletin;
  id v5 = [(AFBulletin *)&v41 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bulletinID"];
    bulletinID = v5->_bulletinID;
    v5->_bulletinID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_recordID"];
    recordID = v5->_recordID;
    v5->_recordID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_sectionID"];
    sectionID = v5->_sectionID;
    v5->_sectionID = (NSString *)v10;

    v5->_sectionSubtype = [v4 decodeIntegerForKey:@"_sectionSubtype"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_date"];
    date = v5->_date;
    v5->_date = (NSDate *)v12;

    v5->_allDay = [v4 decodeBoolForKey:@"_allDay"];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_endDate"];
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_recencyDate"];
    recencyDate = v5->_recencyDate;
    v5->_recencyDate = (NSDate *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_timeZone"];
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_title"];
    title = v5->_title;
    v5->_title = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_message"];
    message = v5->_message;
    v5->_message = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_subtitle"];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_publisherBulletinID"];
    publisherBulletinID = v5->_publisherBulletinID;
    v5->_publisherBulletinID = (NSString *)v28;

    v30 = (void *)MEMORY[0x1E4F1CAD0];
    v42[0] = objc_opt_class();
    v42[1] = objc_opt_class();
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
    v32 = [v30 setWithArray:v31];
    uint64_t v33 = [v4 decodeObjectOfClasses:v32 forKey:@"_intentIDs"];
    intentIDs = v5->_intentIDs;
    v5->_intentIDs = (NSArray *)v33;

    v5->_availableOnLockScreen = [v4 decodeBoolForKey:@"_availableOnLockScreen"];
    v5->_supportsSpokenNotification = [v4 decodeBoolForKey:@"_supportsSpokenNotification"];
    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_internalID"];
    internalID = v5->_internalID;
    v5->_internalID = (NSString *)v35;

    v5->_previewRestricted = [v4 decodeBoolForKey:@"_previewRestricted"];
    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_threadID"];
    threadID = v5->_threadID;
    v5->_threadID = (NSString *)v37;

    v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_feed"];
    v5->_feed = [v39 unsignedIntegerValue];
  }
  return v5;
}

- (void)wasRemovedFromFeed:(unint64_t)a3
{
  self->_feed &= ~a3;
}

- (void)setNotification:(id)a3 fromSourceApp:(id)a4
{
  id v30 = a3;
  id v6 = a4;
  v7 = [v30 date];
  date = self->_date;
  self->_date = v7;

  v9 = [v30 date];
  recencyDate = self->_recencyDate;
  self->_recencyDate = v9;

  if (objc_opt_class())
  {
    v11 = [getLSApplicationProxyClass_34150() applicationProxyForIdentifier:v6];
    uint64_t v12 = [v11 localizedNameForContext:0];
    displayName = self->_displayName;
    self->_displayName = v12;

    uint64_t v14 = [v30 request];
    v15 = [v14 identifier];
    bulletinID = self->_bulletinID;
    self->_bulletinID = v15;

    v17 = [v14 identifier];
    publisherBulletinID = self->_publisherBulletinID;
    self->_publisherBulletinID = v17;

    objc_storeStrong((id *)&self->_sectionID, a4);
    v19 = [v14 content];
    uint64_t v20 = [v19 title];
    title = self->_title;
    self->_title = v20;

    uint64_t v22 = [v19 subtitle];
    subtitle = self->_subtitle;
    self->_subtitle = v22;

    uint64_t v24 = [v19 body];
    message = self->_message;
    self->_message = v24;

    self->_allDay = [v19 shouldHideTime];
    uint64_t v26 = [v19 threadIdentifier];
    threadID = self->_threadID;
    self->_threadID = v26;

    self->_supportsSpokenNotification = ([v14 destinations] & 0x10) != 0;
    uint64_t v28 = (NSString *)[[NSString alloc] initWithFormat:@"UN://%@", self->_bulletinID];
    internalID = self->_internalID;
    self->_internalID = v28;
  }
}

- (void)setBulletin:(id)a3 forFeed:(unint64_t)a4
{
  objc_storeStrong((id *)&self->_bbBulletin, a3);
  id v41 = a3;
  self->_feed = a4;
  v7 = [v41 bulletinID];
  bulletinID = self->_bulletinID;
  self->_bulletinID = v7;

  v9 = [v41 recordID];
  recordID = self->_recordID;
  self->_recordID = v9;

  v11 = [v41 sectionID];
  sectionID = self->_sectionID;
  self->_sectionID = v11;

  self->_sectionSubtype = [v41 sectionSubtype];
  v13 = [v41 date];
  date = self->_date;
  self->_date = v13;

  self->_allDay = [v41 dateIsAllDay];
  v15 = [v41 endDate];
  endDate = self->_endDate;
  self->_endDate = v15;

  v17 = [v41 recencyDate];
  recencyDate = self->_recencyDate;
  self->_recencyDate = v17;

  v19 = [v41 timeZone];
  uint64_t v20 = [v19 name];
  timeZone = self->_timeZone;
  self->_timeZone = v20;

  uint64_t v22 = [v41 title];
  title = self->_title;
  self->_title = v22;

  uint64_t v24 = [v41 message];
  message = self->_message;
  self->_message = v24;

  uint64_t v26 = [v41 modalAlertContent];
  v27 = [v26 message];
  modalAlertContentMessage = self->_modalAlertContentMessage;
  self->_modalAlertContentMessage = v27;

  v29 = [v41 subtitle];
  subtitle = self->_subtitle;
  self->_subtitle = v29;

  v31 = [v41 publisherBulletinID];
  publisherBulletinID = self->_publisherBulletinID;
  self->_publisherBulletinID = v31;

  uint64_t v33 = [v41 intentIDs];
  intentIDs = self->_intentIDs;
  self->_intentIDs = v33;

  self->_previewRestricted = ([v41 contentPreviewSetting] & 0xFFFFFFFFFFFFFFFELL) == 2;
  uint64_t v35 = [v41 threadID];
  threadID = self->_threadID;
  self->_threadID = v35;

  uint64_t v37 = [(AFBulletin *)self _displayNameForBulletin:v41];
  displayName = self->_displayName;
  self->_displayName = v37;

  v39 = [(id)objc_opt_class() internalIDForBBBulletinID:self->_bulletinID];
  internalID = self->_internalID;
  self->_internalID = v39;
}

- (id)actionForIdentifier:(id)a3
{
  id v4 = a3;
  actionsByIdentifier = self->_actionsByIdentifier;
  if (!actionsByIdentifier)
  {
    id v6 = [(AFBulletin *)self actions];
    actionsByIdentifier = self->_actionsByIdentifier;
  }
  v7 = [(NSDictionary *)actionsByIdentifier objectForKey:v4];

  return v7;
}

- (id)actions
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  actionsStore = self->_actionsStore;
  if (!actionsStore)
  {
    if (self->_bbBulletin)
    {
      id v4 = +[AFBulletin _createAssistantActionsForBulletin:](AFBulletin, "_createAssistantActionsForBulletin:");
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v6 = v4;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v19 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            uint64_t v12 = objc_msgSend(v11, "bbActionID", (void)v18);
            if (v12) {
              [v5 setObject:v11 forKey:v12];
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v8);
      }

      v13 = (NSDictionary *)[v5 copy];
      actionsByIdentifier = self->_actionsByIdentifier;
      self->_actionsByIdentifier = v13;

      v15 = (NSArray *)[v6 copy];
      uint64_t v16 = self->_actionsStore;
      self->_actionsStore = v15;

      actionsStore = self->_actionsStore;
    }
    else
    {
      actionsStore = 0;
    }
  }
  return actionsStore;
}

- (void)setBulletin:(id)a3
{
}

- (id)_displayNameForBulletin:(id)a3
{
  id v3 = a3;
  id v4 = [v3 sectionID];
  if ([v4 isEqualToString:@"com.apple.cmas"])
  {

LABEL_4:
    uint64_t v7 = [v3 title];
    goto LABEL_5;
  }
  id v5 = [v3 sectionID];
  int v6 = [v5 isEqualToString:@"com.apple.ReplayKitNotifications"];

  if (v6) {
    goto LABEL_4;
  }
  uint64_t v7 = [v3 sectionDisplayName];
  if (![v7 length])
  {
    uint64_t v9 = [v3 sectionID];
    uint64_t v10 = [getLSApplicationProxyClass_34150() applicationProxyForIdentifier:v9];
    uint64_t v11 = [v10 localizedName];

    uint64_t v7 = (void *)v11;
  }
LABEL_5:

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)internalIDForBBBulletinID:(id)a3
{
  id v3 = (objc_class *)NSString;
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithFormat:@"BB://%@", v4];

  return v5;
}

+ (id)_createAssistantActionsForBulletin:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = [v3 defaultAction];

  if (v5)
  {
    int v6 = [AFBulletinAction alloc];
    uint64_t v7 = [v3 defaultAction];
    uint64_t v8 = [(AFBulletinAction *)v6 initWithBulletinAction:v7];

    [v4 addObject:v8];
  }
  uint64_t v9 = [v3 dismissAction];

  if (v9)
  {
    uint64_t v10 = [AFBulletinAction alloc];
    uint64_t v11 = [v3 dismissAction];
    uint64_t v12 = [(AFBulletinAction *)v10 initWithBulletinAction:v11];

    [(AFBulletinAction *)v12 addTitleVariant:@"Dismiss"];
    [v4 addObject:v12];
  }
  v13 = [v3 snoozeAction];

  if (v13)
  {
    uint64_t v14 = [AFBulletinAction alloc];
    v15 = [v3 dismissAction];
    uint64_t v16 = [(AFBulletinAction *)v14 initWithBulletinAction:v15];

    [(AFBulletinAction *)v16 addTitleVariant:@"Snooze"];
    [v4 addObject:v16];
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v17 = objc_msgSend(v3, "supplementaryActions", 0);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v25 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = [[AFBulletinAction alloc] initWithBulletinAction:*(void *)(*((void *)&v24 + 1) + 8 * i)];
        [v4 addObject:v22];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v19);
  }

  return v4;
}

@end