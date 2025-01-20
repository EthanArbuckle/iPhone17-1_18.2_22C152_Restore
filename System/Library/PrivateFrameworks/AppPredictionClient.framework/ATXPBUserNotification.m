@interface ATXPBUserNotification
+ (Class)contactIDsType;
+ (Class)rawIdentifiersType;
- (ATXPBSharedDigestEngagementTrackingMetrics)sharedEngagementTracker;
- (ATXPBUserNotificationDerivedData)derivedData;
- (BOOL)hasAppSpecifiedScore;
- (BOOL)hasAttachmentType;
- (BOOL)hasBadge;
- (BOOL)hasBody;
- (BOOL)hasBundleID;
- (BOOL)hasCategoryID;
- (BOOL)hasDerivedData;
- (BOOL)hasIsGroupMessage;
- (BOOL)hasIsMessage;
- (BOOL)hasIsNotificationSummaryEnabled;
- (BOOL)hasIsPartOfStack;
- (BOOL)hasIsPriorityNotificationEnabled;
- (BOOL)hasIsStackSummary;
- (BOOL)hasIsSummarized;
- (BOOL)hasNotificationID;
- (BOOL)hasNumberOfNotificationsInStack;
- (BOOL)hasPositionInStack;
- (BOOL)hasPriorityStatus;
- (BOOL)hasRecordTimestamp;
- (BOOL)hasSectionID;
- (BOOL)hasSharedEngagementTracker;
- (BOOL)hasSubtitle;
- (BOOL)hasSummary;
- (BOOL)hasSummaryStatus;
- (BOOL)hasThreadID;
- (BOOL)hasTimestamp;
- (BOOL)hasTitle;
- (BOOL)hasUrgency;
- (BOOL)hasUserInfo;
- (BOOL)hasUuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGroupMessage;
- (BOOL)isMessage;
- (BOOL)isNotificationSummaryEnabled;
- (BOOL)isPartOfStack;
- (BOOL)isPriorityNotificationEnabled;
- (BOOL)isStackSummary;
- (BOOL)isSummarized;
- (BOOL)readFrom:(id)a3;
- (NSData)userInfo;
- (NSMutableArray)contactIDs;
- (NSMutableArray)rawIdentifiers;
- (NSString)body;
- (NSString)bundleID;
- (NSString)categoryID;
- (NSString)notificationID;
- (NSString)sectionID;
- (NSString)subtitle;
- (NSString)summary;
- (NSString)threadID;
- (NSString)title;
- (NSString)uuid;
- (double)appSpecifiedScore;
- (double)recordTimestamp;
- (double)timestamp;
- (id)attachmentTypeAsString:(int)a3;
- (id)contactIDsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)initFromJSON:(id)a3;
- (id)jsonRepresentation;
- (id)priorityStatusAsString:(int)a3;
- (id)rawIdentifiersAtIndex:(unint64_t)a3;
- (id)summaryStatusAsString:(int)a3;
- (id)urgencyAsString:(int)a3;
- (int)StringAsAttachmentType:(id)a3;
- (int)StringAsPriorityStatus:(id)a3;
- (int)StringAsSummaryStatus:(id)a3;
- (int)StringAsUrgency:(id)a3;
- (int)attachmentType;
- (int)priorityStatus;
- (int)summaryStatus;
- (int)urgency;
- (unint64_t)badge;
- (unint64_t)contactIDsCount;
- (unint64_t)hash;
- (unint64_t)numberOfNotificationsInStack;
- (unint64_t)positionInStack;
- (unint64_t)rawIdentifiersCount;
- (void)addContactIDs:(id)a3;
- (void)addRawIdentifiers:(id)a3;
- (void)clearContactIDs;
- (void)clearRawIdentifiers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppSpecifiedScore:(double)a3;
- (void)setAttachmentType:(int)a3;
- (void)setBadge:(unint64_t)a3;
- (void)setBody:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setCategoryID:(id)a3;
- (void)setContactIDs:(id)a3;
- (void)setDerivedData:(id)a3;
- (void)setHasAppSpecifiedScore:(BOOL)a3;
- (void)setHasAttachmentType:(BOOL)a3;
- (void)setHasBadge:(BOOL)a3;
- (void)setHasIsGroupMessage:(BOOL)a3;
- (void)setHasIsMessage:(BOOL)a3;
- (void)setHasIsNotificationSummaryEnabled:(BOOL)a3;
- (void)setHasIsPartOfStack:(BOOL)a3;
- (void)setHasIsPriorityNotificationEnabled:(BOOL)a3;
- (void)setHasIsStackSummary:(BOOL)a3;
- (void)setHasIsSummarized:(BOOL)a3;
- (void)setHasNumberOfNotificationsInStack:(BOOL)a3;
- (void)setHasPositionInStack:(BOOL)a3;
- (void)setHasPriorityStatus:(BOOL)a3;
- (void)setHasRecordTimestamp:(BOOL)a3;
- (void)setHasSummaryStatus:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasUrgency:(BOOL)a3;
- (void)setIsGroupMessage:(BOOL)a3;
- (void)setIsMessage:(BOOL)a3;
- (void)setIsNotificationSummaryEnabled:(BOOL)a3;
- (void)setIsPartOfStack:(BOOL)a3;
- (void)setIsPriorityNotificationEnabled:(BOOL)a3;
- (void)setIsStackSummary:(BOOL)a3;
- (void)setIsSummarized:(BOOL)a3;
- (void)setNotificationID:(id)a3;
- (void)setNumberOfNotificationsInStack:(unint64_t)a3;
- (void)setPositionInStack:(unint64_t)a3;
- (void)setPriorityStatus:(int)a3;
- (void)setRawIdentifiers:(id)a3;
- (void)setRecordTimestamp:(double)a3;
- (void)setSectionID:(id)a3;
- (void)setSharedEngagementTracker:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSummary:(id)a3;
- (void)setSummaryStatus:(int)a3;
- (void)setThreadID:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setTitle:(id)a3;
- (void)setUrgency:(int)a3;
- (void)setUserInfo:(id)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBUserNotification

- (void)setTimestamp:(double)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6330A0739C3C333E6BA635B85BB12168)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasSubtitle
{
  return self->_subtitle != 0;
}

- (BOOL)hasBody
{
  return self->_body != 0;
}

- (void)setBadge:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_badge = a3;
}

- (void)setHasBadge:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6330A0739C3C333E6BA635B85BB12168)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasBadge
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasUserInfo
{
  return self->_userInfo != 0;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (BOOL)hasThreadID
{
  return self->_threadID != 0;
}

- (BOOL)hasCategoryID
{
  return self->_categoryID != 0;
}

- (BOOL)hasSectionID
{
  return self->_sectionID != 0;
}

- (void)clearContactIDs
{
}

- (void)addContactIDs:(id)a3
{
  id v4 = a3;
  contactIDs = self->_contactIDs;
  id v8 = v4;
  if (!contactIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_contactIDs;
    self->_contactIDs = v6;

    id v4 = v8;
    contactIDs = self->_contactIDs;
  }
  [(NSMutableArray *)contactIDs addObject:v4];
}

- (unint64_t)contactIDsCount
{
  return [(NSMutableArray *)self->_contactIDs count];
}

- (id)contactIDsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_contactIDs objectAtIndex:a3];
}

+ (Class)contactIDsType
{
  return (Class)objc_opt_class();
}

- (void)clearRawIdentifiers
{
}

- (void)addRawIdentifiers:(id)a3
{
  id v4 = a3;
  rawIdentifiers = self->_rawIdentifiers;
  id v8 = v4;
  if (!rawIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_rawIdentifiers;
    self->_rawIdentifiers = v6;

    id v4 = v8;
    rawIdentifiers = self->_rawIdentifiers;
  }
  [(NSMutableArray *)rawIdentifiers addObject:v4];
}

- (unint64_t)rawIdentifiersCount
{
  return [(NSMutableArray *)self->_rawIdentifiers count];
}

- (id)rawIdentifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_rawIdentifiers objectAtIndex:a3];
}

+ (Class)rawIdentifiersType
{
  return (Class)objc_opt_class();
}

- (void)setIsMessage:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_isMessage = a3;
}

- (void)setHasIsMessage:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6330A0739C3C333E6BA635B85BB12168)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasIsMessage
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setIsGroupMessage:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_isGroupMessage = a3;
}

- (void)setHasIsGroupMessage:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6330A0739C3C333E6BA635B85BB12168)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasIsGroupMessage
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (int)urgency
{
  if ((*((unsigned char *)&self->_has + 1) & 2) != 0) {
    return self->_urgency;
  }
  else {
    return 0;
  }
}

- (void)setUrgency:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_urgency = a3;
}

- (void)setHasUrgency:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6330A0739C3C333E6BA635B85BB12168)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasUrgency
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (id)urgencyAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E5D06E38[a3];
  }

  return v3;
}

- (int)StringAsUrgency:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Critical"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TimeSensitive"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Active"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Passive"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"None"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Priority"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"Total"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)attachmentType
{
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    return self->_attachmentType;
  }
  else {
    return 0;
  }
}

- (void)setAttachmentType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_attachmentType = a3;
}

- (void)setHasAttachmentType:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6330A0739C3C333E6BA635B85BB12168)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasAttachmentType
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (id)attachmentTypeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E5D06E70[a3];
  }

  return v3;
}

- (int)StringAsAttachmentType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Image"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Audio"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Video"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Other"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Total"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setAppSpecifiedScore:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_appSpecifiedScore = a3;
}

- (void)setHasAppSpecifiedScore:(BOOL)a3
{
  self->_has = ($6330A0739C3C333E6BA635B85BB12168)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasAppSpecifiedScore
{
  return *(_DWORD *)&self->_has & 1;
}

- (BOOL)hasDerivedData
{
  return self->_derivedData != 0;
}

- (BOOL)hasSharedEngagementTracker
{
  return self->_sharedEngagementTracker != 0;
}

- (BOOL)hasNotificationID
{
  return self->_notificationID != 0;
}

- (void)setRecordTimestamp:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_recordTimestamp = a3;
}

- (void)setHasRecordTimestamp:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6330A0739C3C333E6BA635B85BB12168)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasRecordTimestamp
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setIsSummarized:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_isSummarized = a3;
}

- (void)setHasIsSummarized:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6330A0739C3C333E6BA635B85BB12168)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasIsSummarized
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (BOOL)hasSummary
{
  return self->_summary != 0;
}

- (void)setIsPartOfStack:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_isPartOfStack = a3;
}

- (void)setHasIsPartOfStack:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6330A0739C3C333E6BA635B85BB12168)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasIsPartOfStack
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setIsStackSummary:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_isStackSummary = a3;
}

- (void)setHasIsStackSummary:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6330A0739C3C333E6BA635B85BB12168)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasIsStackSummary
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setPositionInStack:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_positionInStack = a3;
}

- (void)setHasPositionInStack:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6330A0739C3C333E6BA635B85BB12168)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasPositionInStack
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setNumberOfNotificationsInStack:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_numberOfNotificationsInStack = a3;
}

- (void)setHasNumberOfNotificationsInStack:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6330A0739C3C333E6BA635B85BB12168)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasNumberOfNotificationsInStack
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (int)priorityStatus
{
  if ((*(unsigned char *)&self->_has & 0x80) != 0) {
    return self->_priorityStatus;
  }
  else {
    return 0;
  }
}

- (void)setPriorityStatus:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_priorityStatus = a3;
}

- (void)setHasPriorityStatus:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6330A0739C3C333E6BA635B85BB12168)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasPriorityStatus
{
  return *(unsigned char *)&self->_has >> 7;
}

- (id)priorityStatusAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E5D06EA0[a3];
  }

  return v3;
}

- (int)StringAsPriorityStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"IsPriority"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"IsNotPriority"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"InferenceTimedOut"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Error"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Ineligible"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"Total"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)summaryStatus
{
  if (*((unsigned char *)&self->_has + 1)) {
    return self->_summaryStatus;
  }
  else {
    return 0;
  }
}

- (void)setSummaryStatus:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_summaryStatus = a3;
}

- (void)setHasSummaryStatus:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6330A0739C3C333E6BA635B85BB12168)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasSummaryStatus
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (id)summaryStatusAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E5D06ED8[a3];
  }

  return v3;
}

- (int)StringAsSummaryStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Summarized"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"InferenceTimedOut"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Error"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Ineligible"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Total"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setIsPriorityNotificationEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_isPriorityNotificationEnabled = a3;
}

- (void)setHasIsPriorityNotificationEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6330A0739C3C333E6BA635B85BB12168)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasIsPriorityNotificationEnabled
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setIsNotificationSummaryEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_isNotificationSummaryEnabled = a3;
}

- (void)setHasIsNotificationSummaryEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($6330A0739C3C333E6BA635B85BB12168)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasIsNotificationSummaryEnabled
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBUserNotification;
  int v4 = [(ATXPBUserNotification *)&v8 description];
  v5 = [(ATXPBUserNotification *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  int v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    int v4 = [NSNumber numberWithDouble:self->_timestamp];
    [v3 setObject:v4 forKey:@"timestamp"];
  }
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  title = self->_title;
  if (title) {
    [v3 setObject:title forKey:@"title"];
  }
  subtitle = self->_subtitle;
  if (subtitle) {
    [v3 setObject:subtitle forKey:@"subtitle"];
  }
  body = self->_body;
  if (body) {
    [v3 setObject:body forKey:@"body"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v9 = [NSNumber numberWithUnsignedLongLong:self->_badge];
    [v3 setObject:v9 forKey:@"badge"];
  }
  userInfo = self->_userInfo;
  if (userInfo) {
    [v3 setObject:userInfo forKey:@"userInfo"];
  }
  bundleID = self->_bundleID;
  if (bundleID) {
    [v3 setObject:bundleID forKey:@"bundleID"];
  }
  threadID = self->_threadID;
  if (threadID) {
    [v3 setObject:threadID forKey:@"threadID"];
  }
  categoryID = self->_categoryID;
  if (categoryID) {
    [v3 setObject:categoryID forKey:@"categoryID"];
  }
  sectionID = self->_sectionID;
  if (sectionID) {
    [v3 setObject:sectionID forKey:@"sectionID"];
  }
  contactIDs = self->_contactIDs;
  if (contactIDs) {
    [v3 setObject:contactIDs forKey:@"contactIDs"];
  }
  rawIdentifiers = self->_rawIdentifiers;
  if (rawIdentifiers) {
    [v3 setObject:rawIdentifiers forKey:@"rawIdentifiers"];
  }
  $6330A0739C3C333E6BA635B85BB12168 has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    v32 = [NSNumber numberWithBool:self->_isMessage];
    [v3 setObject:v32 forKey:@"isMessage"];

    $6330A0739C3C333E6BA635B85BB12168 has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_29:
      if ((*(_WORD *)&has & 0x200) == 0) {
        goto LABEL_30;
      }
      goto LABEL_57;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_29;
  }
  v33 = [NSNumber numberWithBool:self->_isGroupMessage];
  [v3 setObject:v33 forKey:@"isGroupMessage"];

  $6330A0739C3C333E6BA635B85BB12168 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_30:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_31;
    }
    goto LABEL_67;
  }
LABEL_57:
  uint64_t urgency = self->_urgency;
  if (urgency >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_urgency);
    v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v35 = off_1E5D06E38[urgency];
  }
  [v3 setObject:v35 forKey:@"urgency"];

  $6330A0739C3C333E6BA635B85BB12168 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_31:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
LABEL_67:
  uint64_t attachmentType = self->_attachmentType;
  if (attachmentType >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_attachmentType);
    v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v43 = off_1E5D06E70[attachmentType];
  }
  [v3 setObject:v43 forKey:@"attachmentType"];

  if (*(_DWORD *)&self->_has)
  {
LABEL_32:
    v18 = [NSNumber numberWithDouble:self->_appSpecifiedScore];
    [v3 setObject:v18 forKey:@"appSpecifiedScore"];
  }
LABEL_33:
  derivedData = self->_derivedData;
  if (derivedData)
  {
    v20 = [(ATXPBUserNotificationDerivedData *)derivedData dictionaryRepresentation];
    [v3 setObject:v20 forKey:@"derivedData"];
  }
  sharedEngagementTracker = self->_sharedEngagementTracker;
  if (sharedEngagementTracker)
  {
    v22 = [(ATXPBSharedDigestEngagementTrackingMetrics *)sharedEngagementTracker dictionaryRepresentation];
    [v3 setObject:v22 forKey:@"sharedEngagementTracker"];
  }
  notificationID = self->_notificationID;
  if (notificationID) {
    [v3 setObject:notificationID forKey:@"notificationID"];
  }
  $6330A0739C3C333E6BA635B85BB12168 v24 = self->_has;
  if ((*(unsigned char *)&v24 & 0x10) != 0)
  {
    v25 = [NSNumber numberWithDouble:self->_recordTimestamp];
    [v3 setObject:v25 forKey:@"recordTimestamp"];

    $6330A0739C3C333E6BA635B85BB12168 v24 = self->_has;
  }
  if ((*(_DWORD *)&v24 & 0x10000) != 0)
  {
    v26 = [NSNumber numberWithBool:self->_isSummarized];
    [v3 setObject:v26 forKey:@"isSummarized"];
  }
  summary = self->_summary;
  if (summary) {
    [v3 setObject:summary forKey:@"summary"];
  }
  $6330A0739C3C333E6BA635B85BB12168 v28 = self->_has;
  if ((*(_WORD *)&v28 & 0x2000) != 0)
  {
    v36 = [NSNumber numberWithBool:self->_isPartOfStack];
    [v3 setObject:v36 forKey:@"isPartOfStack"];

    $6330A0739C3C333E6BA635B85BB12168 v28 = self->_has;
    if ((*(_WORD *)&v28 & 0x8000) == 0)
    {
LABEL_47:
      if ((*(unsigned char *)&v28 & 8) == 0) {
        goto LABEL_48;
      }
      goto LABEL_61;
    }
  }
  else if ((*(_WORD *)&v28 & 0x8000) == 0)
  {
    goto LABEL_47;
  }
  v37 = [NSNumber numberWithBool:self->_isStackSummary];
  [v3 setObject:v37 forKey:@"isStackSummary"];

  $6330A0739C3C333E6BA635B85BB12168 v28 = self->_has;
  if ((*(unsigned char *)&v28 & 8) == 0)
  {
LABEL_48:
    if ((*(unsigned char *)&v28 & 4) == 0) {
      goto LABEL_49;
    }
    goto LABEL_62;
  }
LABEL_61:
  v38 = [NSNumber numberWithUnsignedLongLong:self->_positionInStack];
  [v3 setObject:v38 forKey:@"positionInStack"];

  $6330A0739C3C333E6BA635B85BB12168 v28 = self->_has;
  if ((*(unsigned char *)&v28 & 4) == 0)
  {
LABEL_49:
    if ((*(unsigned char *)&v28 & 0x80) == 0) {
      goto LABEL_50;
    }
    goto LABEL_63;
  }
LABEL_62:
  v39 = [NSNumber numberWithUnsignedLongLong:self->_numberOfNotificationsInStack];
  [v3 setObject:v39 forKey:@"numberOfNotificationsInStack"];

  $6330A0739C3C333E6BA635B85BB12168 v28 = self->_has;
  if ((*(unsigned char *)&v28 & 0x80) == 0)
  {
LABEL_50:
    if ((*(_WORD *)&v28 & 0x100) == 0) {
      goto LABEL_51;
    }
    goto LABEL_71;
  }
LABEL_63:
  uint64_t priorityStatus = self->_priorityStatus;
  if (priorityStatus >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_priorityStatus);
    v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v41 = off_1E5D06EA0[priorityStatus];
  }
  [v3 setObject:v41 forKey:@"priorityStatus"];

  $6330A0739C3C333E6BA635B85BB12168 v28 = self->_has;
  if ((*(_WORD *)&v28 & 0x100) == 0)
  {
LABEL_51:
    if ((*(_WORD *)&v28 & 0x4000) == 0) {
      goto LABEL_52;
    }
LABEL_78:
    v46 = [NSNumber numberWithBool:self->_isPriorityNotificationEnabled];
    [v3 setObject:v46 forKey:@"isPriorityNotificationEnabled"];

    if ((*(_DWORD *)&self->_has & 0x1000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_53;
  }
LABEL_71:
  uint64_t summaryStatus = self->_summaryStatus;
  if (summaryStatus >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_summaryStatus);
    v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v45 = off_1E5D06ED8[summaryStatus];
  }
  [v3 setObject:v45 forKey:@"summaryStatus"];

  $6330A0739C3C333E6BA635B85BB12168 v28 = self->_has;
  if ((*(_WORD *)&v28 & 0x4000) != 0) {
    goto LABEL_78;
  }
LABEL_52:
  if ((*(_WORD *)&v28 & 0x1000) != 0)
  {
LABEL_53:
    v29 = [NSNumber numberWithBool:self->_isNotificationSummaryEnabled];
    [v3 setObject:v29 forKey:@"isNotificationSummaryEnabled"];
  }
LABEL_54:
  id v30 = v3;

  return v30;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBUserNotificationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_uuid) {
    PBDataWriterWriteStringField();
  }
  if (self->_title) {
    PBDataWriterWriteStringField();
  }
  if (self->_subtitle) {
    PBDataWriterWriteStringField();
  }
  if (self->_body) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_userInfo) {
    PBDataWriterWriteDataField();
  }
  if (self->_bundleID) {
    PBDataWriterWriteStringField();
  }
  if (self->_derivedData) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_threadID) {
    PBDataWriterWriteStringField();
  }
  if (self->_categoryID) {
    PBDataWriterWriteStringField();
  }
  if (self->_sectionID) {
    PBDataWriterWriteStringField();
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v5 = self->_contactIDs;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v7);
  }

  $6330A0739C3C333E6BA635B85BB12168 has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    $6330A0739C3C333E6BA635B85BB12168 has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_34:
      if ((*(_WORD *)&has & 0x800) == 0) {
        goto LABEL_35;
      }
      goto LABEL_68;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_34;
  }
  PBDataWriterWriteInt32Field();
  $6330A0739C3C333E6BA635B85BB12168 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_35:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
LABEL_68:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x40) != 0) {
LABEL_36:
  }
    PBDataWriterWriteInt32Field();
LABEL_37:
  if (self->_sharedEngagementTracker) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v11 = self->_rawIdentifiers;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteStringField();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v13);
  }

  if (self->_notificationID) {
    PBDataWriterWriteStringField();
  }
  $6330A0739C3C333E6BA635B85BB12168 v16 = self->_has;
  if ((*(unsigned char *)&v16 & 0x10) != 0)
  {
    PBDataWriterWriteDoubleField();
    $6330A0739C3C333E6BA635B85BB12168 v16 = self->_has;
  }
  if ((*(_DWORD *)&v16 & 0x10000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_summary) {
    PBDataWriterWriteStringField();
  }
  $6330A0739C3C333E6BA635B85BB12168 v17 = self->_has;
  if ((*(_WORD *)&v17 & 0x2000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $6330A0739C3C333E6BA635B85BB12168 v17 = self->_has;
    if ((*(_WORD *)&v17 & 0x8000) == 0)
    {
LABEL_58:
      if ((*(unsigned char *)&v17 & 8) == 0) {
        goto LABEL_59;
      }
      goto LABEL_72;
    }
  }
  else if ((*(_WORD *)&v17 & 0x8000) == 0)
  {
    goto LABEL_58;
  }
  PBDataWriterWriteBOOLField();
  $6330A0739C3C333E6BA635B85BB12168 v17 = self->_has;
  if ((*(unsigned char *)&v17 & 8) == 0)
  {
LABEL_59:
    if ((*(unsigned char *)&v17 & 4) == 0) {
      goto LABEL_60;
    }
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteUint64Field();
  $6330A0739C3C333E6BA635B85BB12168 v17 = self->_has;
  if ((*(unsigned char *)&v17 & 4) == 0)
  {
LABEL_60:
    if ((*(unsigned char *)&v17 & 0x80) == 0) {
      goto LABEL_61;
    }
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteUint64Field();
  $6330A0739C3C333E6BA635B85BB12168 v17 = self->_has;
  if ((*(unsigned char *)&v17 & 0x80) == 0)
  {
LABEL_61:
    if ((*(_WORD *)&v17 & 0x100) == 0) {
      goto LABEL_62;
    }
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteInt32Field();
  $6330A0739C3C333E6BA635B85BB12168 v17 = self->_has;
  if ((*(_WORD *)&v17 & 0x100) == 0)
  {
LABEL_62:
    if ((*(_WORD *)&v17 & 0x4000) == 0) {
      goto LABEL_63;
    }
LABEL_76:
    PBDataWriterWriteBOOLField();
    if ((*(_DWORD *)&self->_has & 0x1000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_64;
  }
LABEL_75:
  PBDataWriterWriteInt32Field();
  $6330A0739C3C333E6BA635B85BB12168 v17 = self->_has;
  if ((*(_WORD *)&v17 & 0x4000) != 0) {
    goto LABEL_76;
  }
LABEL_63:
  if ((*(_WORD *)&v17 & 0x1000) != 0) {
LABEL_64:
  }
    PBDataWriterWriteBOOLField();
LABEL_65:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    v4[6] = *(void *)&self->_timestamp;
    *((_DWORD *)v4 + 54) |= 0x20u;
  }
  long long v18 = v4;
  if (self->_uuid)
  {
    objc_msgSend(v4, "setUuid:");
    id v4 = v18;
  }
  if (self->_title)
  {
    objc_msgSend(v18, "setTitle:");
    id v4 = v18;
  }
  if (self->_subtitle)
  {
    objc_msgSend(v18, "setSubtitle:");
    id v4 = v18;
  }
  if (self->_body)
  {
    objc_msgSend(v18, "setBody:");
    id v4 = v18;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[2] = self->_badge;
    *((_DWORD *)v4 + 54) |= 2u;
  }
  if (self->_userInfo) {
    objc_msgSend(v18, "setUserInfo:");
  }
  if (self->_bundleID) {
    objc_msgSend(v18, "setBundleID:");
  }
  if (self->_derivedData) {
    objc_msgSend(v18, "setDerivedData:");
  }
  if (self->_threadID) {
    objc_msgSend(v18, "setThreadID:");
  }
  if (self->_categoryID) {
    objc_msgSend(v18, "setCategoryID:");
  }
  if (self->_sectionID) {
    objc_msgSend(v18, "setSectionID:");
  }
  if ([(ATXPBUserNotification *)self contactIDsCount])
  {
    [v18 clearContactIDs];
    unint64_t v5 = [(ATXPBUserNotification *)self contactIDsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(ATXPBUserNotification *)self contactIDsAtIndex:i];
        [v18 addContactIDs:v8];
      }
    }
  }
  $6330A0739C3C333E6BA635B85BB12168 has = self->_has;
  v10 = v18;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    *((unsigned char *)v18 + 208) = self->_isGroupMessage;
    *((_DWORD *)v18 + 54) |= 0x400u;
    $6330A0739C3C333E6BA635B85BB12168 has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_31:
      if ((*(_WORD *)&has & 0x800) == 0) {
        goto LABEL_32;
      }
      goto LABEL_64;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_31;
  }
  *((_DWORD *)v18 + 46) = self->_urgency;
  *((_DWORD *)v18 + 54) |= 0x200u;
  $6330A0739C3C333E6BA635B85BB12168 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_32:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
LABEL_64:
  *((unsigned char *)v18 + 209) = self->_isMessage;
  *((_DWORD *)v18 + 54) |= 0x800u;
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_33:
    *((_DWORD *)v18 + 14) = self->_attachmentType;
    *((_DWORD *)v18 + 54) |= 0x40u;
  }
LABEL_34:
  if (self->_sharedEngagementTracker)
  {
    objc_msgSend(v18, "setSharedEngagementTracker:");
    v10 = v18;
  }
  if (*(unsigned char *)&self->_has)
  {
    v10[1] = *(void *)&self->_appSpecifiedScore;
    *((_DWORD *)v10 + 54) |= 1u;
  }
  if ([(ATXPBUserNotification *)self rawIdentifiersCount])
  {
    [v18 clearRawIdentifiers];
    unint64_t v11 = [(ATXPBUserNotification *)self rawIdentifiersCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t j = 0; j != v12; ++j)
      {
        uint64_t v14 = [(ATXPBUserNotification *)self rawIdentifiersAtIndex:j];
        [v18 addRawIdentifiers:v14];
      }
    }
  }
  if (self->_notificationID) {
    objc_msgSend(v18, "setNotificationID:");
  }
  $6330A0739C3C333E6BA635B85BB12168 v15 = self->_has;
  $6330A0739C3C333E6BA635B85BB12168 v16 = v18;
  if ((*(unsigned char *)&v15 & 0x10) != 0)
  {
    v18[5] = *(void *)&self->_recordTimestamp;
    *((_DWORD *)v18 + 54) |= 0x10u;
    $6330A0739C3C333E6BA635B85BB12168 v15 = self->_has;
  }
  if ((*(_DWORD *)&v15 & 0x10000) != 0)
  {
    *((unsigned char *)v18 + 214) = self->_isSummarized;
    *((_DWORD *)v18 + 54) |= 0x10000u;
  }
  if (self->_summary)
  {
    objc_msgSend(v18, "setSummary:");
    $6330A0739C3C333E6BA635B85BB12168 v16 = v18;
  }
  $6330A0739C3C333E6BA635B85BB12168 v17 = self->_has;
  if ((*(_WORD *)&v17 & 0x2000) != 0)
  {
    v16[211] = self->_isPartOfStack;
    *((_DWORD *)v16 + 54) |= 0x2000u;
    $6330A0739C3C333E6BA635B85BB12168 v17 = self->_has;
    if ((*(_WORD *)&v17 & 0x8000) == 0)
    {
LABEL_52:
      if ((*(unsigned char *)&v17 & 8) == 0) {
        goto LABEL_53;
      }
      goto LABEL_68;
    }
  }
  else if ((*(_WORD *)&v17 & 0x8000) == 0)
  {
    goto LABEL_52;
  }
  v16[213] = self->_isStackSummary;
  *((_DWORD *)v16 + 54) |= 0x8000u;
  $6330A0739C3C333E6BA635B85BB12168 v17 = self->_has;
  if ((*(unsigned char *)&v17 & 8) == 0)
  {
LABEL_53:
    if ((*(unsigned char *)&v17 & 4) == 0) {
      goto LABEL_54;
    }
    goto LABEL_69;
  }
LABEL_68:
  *((void *)v16 + 4) = self->_positionInStack;
  *((_DWORD *)v16 + 54) |= 8u;
  $6330A0739C3C333E6BA635B85BB12168 v17 = self->_has;
  if ((*(unsigned char *)&v17 & 4) == 0)
  {
LABEL_54:
    if ((*(unsigned char *)&v17 & 0x80) == 0) {
      goto LABEL_55;
    }
    goto LABEL_70;
  }
LABEL_69:
  *((void *)v16 + 3) = self->_numberOfNotificationsInStack;
  *((_DWORD *)v16 + 54) |= 4u;
  $6330A0739C3C333E6BA635B85BB12168 v17 = self->_has;
  if ((*(unsigned char *)&v17 & 0x80) == 0)
  {
LABEL_55:
    if ((*(_WORD *)&v17 & 0x100) == 0) {
      goto LABEL_56;
    }
    goto LABEL_71;
  }
LABEL_70:
  *((_DWORD *)v16 + 28) = self->_priorityStatus;
  *((_DWORD *)v16 + 54) |= 0x80u;
  $6330A0739C3C333E6BA635B85BB12168 v17 = self->_has;
  if ((*(_WORD *)&v17 & 0x100) == 0)
  {
LABEL_56:
    if ((*(_WORD *)&v17 & 0x4000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_72;
  }
LABEL_71:
  *((_DWORD *)v16 + 40) = self->_summaryStatus;
  *((_DWORD *)v16 + 54) |= 0x100u;
  $6330A0739C3C333E6BA635B85BB12168 v17 = self->_has;
  if ((*(_WORD *)&v17 & 0x4000) == 0)
  {
LABEL_57:
    if ((*(_WORD *)&v17 & 0x1000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_58;
  }
LABEL_72:
  v16[212] = self->_isPriorityNotificationEnabled;
  *((_DWORD *)v16 + 54) |= 0x4000u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_58:
    v16[210] = self->_isNotificationSummaryEnabled;
    *((_DWORD *)v16 + 54) |= 0x1000u;
  }
LABEL_59:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *(double *)(v5 + 48) = self->_timestamp;
    *(_DWORD *)(v5 + 216) |= 0x20u;
  }
  uint64_t v7 = [(NSString *)self->_uuid copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 200);
  *(void *)(v6 + 200) = v7;

  uint64_t v9 = [(NSString *)self->_title copyWithZone:a3];
  v10 = *(void **)(v6 + 176);
  *(void *)(v6 + 176) = v9;

  uint64_t v11 = [(NSString *)self->_subtitle copyWithZone:a3];
  unint64_t v12 = *(void **)(v6 + 144);
  *(void *)(v6 + 144) = v11;

  uint64_t v13 = [(NSString *)self->_body copyWithZone:a3];
  uint64_t v14 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v13;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v6 + 16) = self->_badge;
    *(_DWORD *)(v6 + 216) |= 2u;
  }
  uint64_t v15 = [(NSData *)self->_userInfo copyWithZone:a3];
  $6330A0739C3C333E6BA635B85BB12168 v16 = *(void **)(v6 + 192);
  *(void *)(v6 + 192) = v15;

  uint64_t v17 = [(NSString *)self->_bundleID copyWithZone:a3];
  long long v18 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v17;

  id v19 = [(ATXPBUserNotificationDerivedData *)self->_derivedData copyWithZone:a3];
  long long v20 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v19;

  uint64_t v21 = [(NSString *)self->_threadID copyWithZone:a3];
  long long v22 = *(void **)(v6 + 168);
  *(void *)(v6 + 168) = v21;

  uint64_t v23 = [(NSString *)self->_categoryID copyWithZone:a3];
  long long v24 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v23;

  uint64_t v25 = [(NSString *)self->_sectionID copyWithZone:a3];
  v26 = *(void **)(v6 + 128);
  *(void *)(v6 + 128) = v25;

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v27 = self->_contactIDs;
  uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v54;
    do
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v54 != v30) {
          objc_enumerationMutation(v27);
        }
        v32 = (void *)[*(id *)(*((void *)&v53 + 1) + 8 * v31) copyWithZone:a3];
        [(id)v6 addContactIDs:v32];

        ++v31;
      }
      while (v29 != v31);
      uint64_t v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v53 objects:v58 count:16];
    }
    while (v29);
  }

  $6330A0739C3C333E6BA635B85BB12168 has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    *(unsigned char *)(v6 + 208) = self->_isGroupMessage;
    *(_DWORD *)(v6 + 216) |= 0x400u;
    $6330A0739C3C333E6BA635B85BB12168 has = self->_has;
    if ((*(_WORD *)&has & 0x200) == 0)
    {
LABEL_14:
      if ((*(_WORD *)&has & 0x800) == 0) {
        goto LABEL_15;
      }
      goto LABEL_42;
    }
  }
  else if ((*(_WORD *)&has & 0x200) == 0)
  {
    goto LABEL_14;
  }
  *(_DWORD *)(v6 + 184) = self->_urgency;
  *(_DWORD *)(v6 + 216) |= 0x200u;
  $6330A0739C3C333E6BA635B85BB12168 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_42:
  *(unsigned char *)(v6 + 209) = self->_isMessage;
  *(_DWORD *)(v6 + 216) |= 0x800u;
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_16:
    *(_DWORD *)(v6 + 56) = self->_attachmentType;
    *(_DWORD *)(v6 + 216) |= 0x40u;
  }
LABEL_17:
  id v34 = [(ATXPBSharedDigestEngagementTrackingMetrics *)self->_sharedEngagementTracker copyWithZone:a3];
  v35 = *(void **)(v6 + 136);
  *(void *)(v6 + 136) = v34;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v6 + 8) = self->_appSpecifiedScore;
    *(_DWORD *)(v6 + 216) |= 1u;
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v36 = self->_rawIdentifiers;
  uint64_t v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v50;
    do
    {
      uint64_t v40 = 0;
      do
      {
        if (*(void *)v50 != v39) {
          objc_enumerationMutation(v36);
        }
        v41 = objc_msgSend(*(id *)(*((void *)&v49 + 1) + 8 * v40), "copyWithZone:", a3, (void)v49);
        [(id)v6 addRawIdentifiers:v41];

        ++v40;
      }
      while (v38 != v40);
      uint64_t v38 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v49 objects:v57 count:16];
    }
    while (v38);
  }

  uint64_t v42 = [(NSString *)self->_notificationID copyWithZone:a3];
  v43 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = v42;

  $6330A0739C3C333E6BA635B85BB12168 v44 = self->_has;
  if ((*(unsigned char *)&v44 & 0x10) != 0)
  {
    *(double *)(v6 + 40) = self->_recordTimestamp;
    *(_DWORD *)(v6 + 216) |= 0x10u;
    $6330A0739C3C333E6BA635B85BB12168 v44 = self->_has;
  }
  if ((*(_DWORD *)&v44 & 0x10000) != 0)
  {
    *(unsigned char *)(v6 + 214) = self->_isSummarized;
    *(_DWORD *)(v6 + 216) |= 0x10000u;
  }
  uint64_t v45 = -[NSString copyWithZone:](self->_summary, "copyWithZone:", a3, (void)v49);
  v46 = *(void **)(v6 + 152);
  *(void *)(v6 + 152) = v45;

  $6330A0739C3C333E6BA635B85BB12168 v47 = self->_has;
  if ((*(_WORD *)&v47 & 0x2000) != 0)
  {
    *(unsigned char *)(v6 + 211) = self->_isPartOfStack;
    *(_DWORD *)(v6 + 216) |= 0x2000u;
    $6330A0739C3C333E6BA635B85BB12168 v47 = self->_has;
    if ((*(_WORD *)&v47 & 0x8000) == 0)
    {
LABEL_32:
      if ((*(unsigned char *)&v47 & 8) == 0) {
        goto LABEL_33;
      }
      goto LABEL_46;
    }
  }
  else if ((*(_WORD *)&v47 & 0x8000) == 0)
  {
    goto LABEL_32;
  }
  *(unsigned char *)(v6 + 213) = self->_isStackSummary;
  *(_DWORD *)(v6 + 216) |= 0x8000u;
  $6330A0739C3C333E6BA635B85BB12168 v47 = self->_has;
  if ((*(unsigned char *)&v47 & 8) == 0)
  {
LABEL_33:
    if ((*(unsigned char *)&v47 & 4) == 0) {
      goto LABEL_34;
    }
    goto LABEL_47;
  }
LABEL_46:
  *(void *)(v6 + 32) = self->_positionInStack;
  *(_DWORD *)(v6 + 216) |= 8u;
  $6330A0739C3C333E6BA635B85BB12168 v47 = self->_has;
  if ((*(unsigned char *)&v47 & 4) == 0)
  {
LABEL_34:
    if ((*(unsigned char *)&v47 & 0x80) == 0) {
      goto LABEL_35;
    }
    goto LABEL_48;
  }
LABEL_47:
  *(void *)(v6 + 24) = self->_numberOfNotificationsInStack;
  *(_DWORD *)(v6 + 216) |= 4u;
  $6330A0739C3C333E6BA635B85BB12168 v47 = self->_has;
  if ((*(unsigned char *)&v47 & 0x80) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v47 & 0x100) == 0) {
      goto LABEL_36;
    }
    goto LABEL_49;
  }
LABEL_48:
  *(_DWORD *)(v6 + 112) = self->_priorityStatus;
  *(_DWORD *)(v6 + 216) |= 0x80u;
  $6330A0739C3C333E6BA635B85BB12168 v47 = self->_has;
  if ((*(_WORD *)&v47 & 0x100) == 0)
  {
LABEL_36:
    if ((*(_WORD *)&v47 & 0x4000) == 0) {
      goto LABEL_37;
    }
LABEL_50:
    *(unsigned char *)(v6 + 212) = self->_isPriorityNotificationEnabled;
    *(_DWORD *)(v6 + 216) |= 0x4000u;
    if ((*(_DWORD *)&self->_has & 0x1000) == 0) {
      return (id)v6;
    }
    goto LABEL_38;
  }
LABEL_49:
  *(_DWORD *)(v6 + 160) = self->_summaryStatus;
  *(_DWORD *)(v6 + 216) |= 0x100u;
  $6330A0739C3C333E6BA635B85BB12168 v47 = self->_has;
  if ((*(_WORD *)&v47 & 0x4000) != 0) {
    goto LABEL_50;
  }
LABEL_37:
  if ((*(_WORD *)&v47 & 0x1000) != 0)
  {
LABEL_38:
    *(unsigned char *)(v6 + 210) = self->_isNotificationSummaryEnabled;
    *(_DWORD *)(v6 + 216) |= 0x1000u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_135;
  }
  int v5 = *((_DWORD *)v4 + 54);
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((v5 & 0x20) == 0 || self->_timestamp != *((double *)v4 + 6)) {
      goto LABEL_135;
    }
  }
  else if ((v5 & 0x20) != 0)
  {
    goto LABEL_135;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 25) && !-[NSString isEqual:](uuid, "isEqual:")) {
    goto LABEL_135;
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 22))
  {
    if (!-[NSString isEqual:](title, "isEqual:")) {
      goto LABEL_135;
    }
  }
  subtitle = self->_subtitle;
  if ((unint64_t)subtitle | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](subtitle, "isEqual:")) {
      goto LABEL_135;
    }
  }
  body = self->_body;
  if ((unint64_t)body | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](body, "isEqual:")) {
      goto LABEL_135;
    }
  }
  int v10 = *((_DWORD *)v4 + 54);
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_badge != *((void *)v4 + 2)) {
      goto LABEL_135;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_135;
  }
  userInfo = self->_userInfo;
  if ((unint64_t)userInfo | *((void *)v4 + 24) && !-[NSData isEqual:](userInfo, "isEqual:")) {
    goto LABEL_135;
  }
  bundleID = self->_bundleID;
  if ((unint64_t)bundleID | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](bundleID, "isEqual:")) {
      goto LABEL_135;
    }
  }
  derivedData = self->_derivedData;
  if ((unint64_t)derivedData | *((void *)v4 + 12))
  {
    if (!-[ATXPBUserNotificationDerivedData isEqual:](derivedData, "isEqual:")) {
      goto LABEL_135;
    }
  }
  threadID = self->_threadID;
  if ((unint64_t)threadID | *((void *)v4 + 21))
  {
    if (!-[NSString isEqual:](threadID, "isEqual:")) {
      goto LABEL_135;
    }
  }
  categoryID = self->_categoryID;
  if ((unint64_t)categoryID | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](categoryID, "isEqual:")) {
      goto LABEL_135;
    }
  }
  sectionID = self->_sectionID;
  if ((unint64_t)sectionID | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](sectionID, "isEqual:")) {
      goto LABEL_135;
    }
  }
  contactIDs = self->_contactIDs;
  if ((unint64_t)contactIDs | *((void *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](contactIDs, "isEqual:")) {
      goto LABEL_135;
    }
  }
  $6330A0739C3C333E6BA635B85BB12168 has = self->_has;
  int v19 = *((_DWORD *)v4 + 54);
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v19 & 0x400) == 0) {
      goto LABEL_135;
    }
    if (self->_isGroupMessage)
    {
      if (!*((unsigned char *)v4 + 208)) {
        goto LABEL_135;
      }
    }
    else if (*((unsigned char *)v4 + 208))
    {
      goto LABEL_135;
    }
  }
  else if ((v19 & 0x400) != 0)
  {
    goto LABEL_135;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v19 & 0x200) == 0 || self->_urgency != *((_DWORD *)v4 + 46)) {
      goto LABEL_135;
    }
  }
  else if ((v19 & 0x200) != 0)
  {
    goto LABEL_135;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v19 & 0x800) == 0) {
      goto LABEL_135;
    }
    if (self->_isMessage)
    {
      if (!*((unsigned char *)v4 + 209)) {
        goto LABEL_135;
      }
    }
    else if (*((unsigned char *)v4 + 209))
    {
      goto LABEL_135;
    }
  }
  else if ((v19 & 0x800) != 0)
  {
    goto LABEL_135;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v19 & 0x40) == 0 || self->_attachmentType != *((_DWORD *)v4 + 14)) {
      goto LABEL_135;
    }
  }
  else if ((v19 & 0x40) != 0)
  {
    goto LABEL_135;
  }
  sharedEngagementTracker = self->_sharedEngagementTracker;
  if ((unint64_t)sharedEngagementTracker | *((void *)v4 + 17))
  {
    if (!-[ATXPBSharedDigestEngagementTrackingMetrics isEqual:](sharedEngagementTracker, "isEqual:")) {
      goto LABEL_135;
    }
    $6330A0739C3C333E6BA635B85BB12168 has = self->_has;
  }
  int v21 = *((_DWORD *)v4 + 54);
  if (*(unsigned char *)&has)
  {
    if ((v21 & 1) == 0 || self->_appSpecifiedScore != *((double *)v4 + 1)) {
      goto LABEL_135;
    }
  }
  else if (v21)
  {
    goto LABEL_135;
  }
  rawIdentifiers = self->_rawIdentifiers;
  if ((unint64_t)rawIdentifiers | *((void *)v4 + 15)
    && !-[NSMutableArray isEqual:](rawIdentifiers, "isEqual:"))
  {
    goto LABEL_135;
  }
  notificationID = self->_notificationID;
  if ((unint64_t)notificationID | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](notificationID, "isEqual:")) {
      goto LABEL_135;
    }
  }
  $6330A0739C3C333E6BA635B85BB12168 v24 = self->_has;
  int v25 = *((_DWORD *)v4 + 54);
  if ((*(unsigned char *)&v24 & 0x10) != 0)
  {
    if ((v25 & 0x10) == 0 || self->_recordTimestamp != *((double *)v4 + 5)) {
      goto LABEL_135;
    }
  }
  else if ((v25 & 0x10) != 0)
  {
    goto LABEL_135;
  }
  if ((*(_DWORD *)&v24 & 0x10000) != 0)
  {
    if ((v25 & 0x10000) == 0) {
      goto LABEL_135;
    }
    if (self->_isSummarized)
    {
      if (!*((unsigned char *)v4 + 214)) {
        goto LABEL_135;
      }
    }
    else if (*((unsigned char *)v4 + 214))
    {
      goto LABEL_135;
    }
  }
  else if ((v25 & 0x10000) != 0)
  {
    goto LABEL_135;
  }
  summary = self->_summary;
  if ((unint64_t)summary | *((void *)v4 + 19))
  {
    if (!-[NSString isEqual:](summary, "isEqual:")) {
      goto LABEL_135;
    }
    $6330A0739C3C333E6BA635B85BB12168 v24 = self->_has;
  }
  int v27 = *((_DWORD *)v4 + 54);
  if ((*(_WORD *)&v24 & 0x2000) != 0)
  {
    if ((v27 & 0x2000) == 0) {
      goto LABEL_135;
    }
    if (self->_isPartOfStack)
    {
      if (!*((unsigned char *)v4 + 211)) {
        goto LABEL_135;
      }
    }
    else if (*((unsigned char *)v4 + 211))
    {
      goto LABEL_135;
    }
  }
  else if ((v27 & 0x2000) != 0)
  {
    goto LABEL_135;
  }
  if ((*(_WORD *)&v24 & 0x8000) != 0)
  {
    if ((v27 & 0x8000) == 0) {
      goto LABEL_135;
    }
    if (self->_isStackSummary)
    {
      if (!*((unsigned char *)v4 + 213)) {
        goto LABEL_135;
      }
    }
    else if (*((unsigned char *)v4 + 213))
    {
      goto LABEL_135;
    }
  }
  else if ((v27 & 0x8000) != 0)
  {
    goto LABEL_135;
  }
  if ((*(unsigned char *)&v24 & 8) != 0)
  {
    if ((v27 & 8) == 0 || self->_positionInStack != *((void *)v4 + 4)) {
      goto LABEL_135;
    }
  }
  else if ((v27 & 8) != 0)
  {
    goto LABEL_135;
  }
  if ((*(unsigned char *)&v24 & 4) != 0)
  {
    if ((v27 & 4) == 0 || self->_numberOfNotificationsInStack != *((void *)v4 + 3)) {
      goto LABEL_135;
    }
  }
  else if ((v27 & 4) != 0)
  {
    goto LABEL_135;
  }
  if ((*(unsigned char *)&v24 & 0x80) != 0)
  {
    if ((v27 & 0x80) == 0 || self->_priorityStatus != *((_DWORD *)v4 + 28)) {
      goto LABEL_135;
    }
  }
  else if ((v27 & 0x80) != 0)
  {
    goto LABEL_135;
  }
  if ((*(_WORD *)&v24 & 0x100) != 0)
  {
    if ((v27 & 0x100) == 0 || self->_summaryStatus != *((_DWORD *)v4 + 40)) {
      goto LABEL_135;
    }
  }
  else if ((v27 & 0x100) != 0)
  {
    goto LABEL_135;
  }
  if ((*(_WORD *)&v24 & 0x4000) != 0)
  {
    if ((v27 & 0x4000) == 0) {
      goto LABEL_135;
    }
    if (self->_isPriorityNotificationEnabled)
    {
      if (!*((unsigned char *)v4 + 212)) {
        goto LABEL_135;
      }
    }
    else if (*((unsigned char *)v4 + 212))
    {
      goto LABEL_135;
    }
  }
  else if ((v27 & 0x4000) != 0)
  {
    goto LABEL_135;
  }
  if ((*(_WORD *)&v24 & 0x1000) != 0)
  {
    if ((v27 & 0x1000) != 0)
    {
      if (self->_isNotificationSummaryEnabled)
      {
        if (!*((unsigned char *)v4 + 210)) {
          goto LABEL_135;
        }
      }
      else if (*((unsigned char *)v4 + 210))
      {
        goto LABEL_135;
      }
      BOOL v28 = 1;
      goto LABEL_136;
    }
LABEL_135:
    BOOL v28 = 0;
    goto LABEL_136;
  }
  BOOL v28 = (*((_DWORD *)v4 + 54) & 0x1000) == 0;
LABEL_136:

  return v28;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    double timestamp = self->_timestamp;
    double v4 = -timestamp;
    if (timestamp >= 0.0) {
      double v4 = self->_timestamp;
    }
    long double v5 = floor(v4 + 0.5);
    double v6 = (v4 - v5) * 1.84467441e19;
    double v7 = fmod(v5, 1.84467441e19);
    unint64_t v8 = 2654435761u * (unint64_t)v7;
    unint64_t v9 = v8 + (unint64_t)v6;
    if (v6 <= 0.0) {
      unint64_t v9 = 2654435761u * (unint64_t)v7;
    }
    unint64_t v10 = v8 - (unint64_t)fabs(v6);
    if (v6 >= 0.0) {
      unint64_t v10 = v9;
    }
    unint64_t v55 = v10;
  }
  else
  {
    unint64_t v55 = 0;
  }
  NSUInteger v54 = [(NSString *)self->_uuid hash];
  NSUInteger v53 = [(NSString *)self->_title hash];
  NSUInteger v52 = [(NSString *)self->_subtitle hash];
  NSUInteger v51 = [(NSString *)self->_body hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    unint64_t v50 = 2654435761u * self->_badge;
  }
  else {
    unint64_t v50 = 0;
  }
  uint64_t v49 = [(NSData *)self->_userInfo hash];
  NSUInteger v48 = [(NSString *)self->_bundleID hash];
  unint64_t v47 = [(ATXPBUserNotificationDerivedData *)self->_derivedData hash];
  NSUInteger v46 = [(NSString *)self->_threadID hash];
  NSUInteger v45 = [(NSString *)self->_categoryID hash];
  NSUInteger v44 = [(NSString *)self->_sectionID hash];
  uint64_t v43 = [(NSMutableArray *)self->_contactIDs hash];
  $6330A0739C3C333E6BA635B85BB12168 has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    uint64_t v42 = 2654435761 * self->_isGroupMessage;
    if ((*(_WORD *)&has & 0x200) != 0)
    {
LABEL_15:
      uint64_t v41 = 2654435761 * self->_urgency;
      if ((*(_WORD *)&has & 0x800) != 0) {
        goto LABEL_16;
      }
LABEL_20:
      uint64_t v39 = 0;
      if ((*(unsigned char *)&has & 0x40) != 0) {
        goto LABEL_17;
      }
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v42 = 0;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_15;
    }
  }
  uint64_t v41 = 0;
  if ((*(_WORD *)&has & 0x800) == 0) {
    goto LABEL_20;
  }
LABEL_16:
  uint64_t v39 = 2654435761 * self->_isMessage;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_17:
    uint64_t v12 = 2654435761 * self->_attachmentType;
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v12 = 0;
LABEL_22:
  unint64_t v13 = [(ATXPBSharedDigestEngagementTrackingMetrics *)self->_sharedEngagementTracker hash];
  if (*(unsigned char *)&self->_has)
  {
    double appSpecifiedScore = self->_appSpecifiedScore;
    double v16 = -appSpecifiedScore;
    if (appSpecifiedScore >= 0.0) {
      double v16 = self->_appSpecifiedScore;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  uint64_t v19 = [(NSMutableArray *)self->_rawIdentifiers hash];
  NSUInteger v20 = [(NSString *)self->_notificationID hash];
  $6330A0739C3C333E6BA635B85BB12168 v21 = self->_has;
  if ((*(unsigned char *)&v21 & 0x10) != 0)
  {
    double recordTimestamp = self->_recordTimestamp;
    double v24 = -recordTimestamp;
    if (recordTimestamp >= 0.0) {
      double v24 = self->_recordTimestamp;
    }
    long double v25 = floor(v24 + 0.5);
    double v26 = (v24 - v25) * 1.84467441e19;
    unint64_t v22 = 2654435761u * (unint64_t)fmod(v25, 1.84467441e19);
    if (v26 >= 0.0)
    {
      if (v26 > 0.0) {
        v22 += (unint64_t)v26;
      }
    }
    else
    {
      v22 -= (unint64_t)fabs(v26);
    }
  }
  else
  {
    unint64_t v22 = 0;
  }
  if ((*(_DWORD *)&v21 & 0x10000) != 0) {
    uint64_t v27 = 2654435761 * self->_isSummarized;
  }
  else {
    uint64_t v27 = 0;
  }
  NSUInteger v28 = [(NSString *)self->_summary hash];
  $6330A0739C3C333E6BA635B85BB12168 v29 = self->_has;
  if ((*(_WORD *)&v29 & 0x2000) != 0)
  {
    uint64_t v30 = 2654435761 * self->_isPartOfStack;
    if ((*(_WORD *)&v29 & 0x8000) != 0)
    {
LABEL_43:
      uint64_t v31 = 2654435761 * self->_isStackSummary;
      if ((*(unsigned char *)&v29 & 8) != 0) {
        goto LABEL_44;
      }
      goto LABEL_52;
    }
  }
  else
  {
    uint64_t v30 = 0;
    if ((*(_WORD *)&v29 & 0x8000) != 0) {
      goto LABEL_43;
    }
  }
  uint64_t v31 = 0;
  if ((*(unsigned char *)&v29 & 8) != 0)
  {
LABEL_44:
    unint64_t v32 = 2654435761u * self->_positionInStack;
    if ((*(unsigned char *)&v29 & 4) != 0) {
      goto LABEL_45;
    }
    goto LABEL_53;
  }
LABEL_52:
  unint64_t v32 = 0;
  if ((*(unsigned char *)&v29 & 4) != 0)
  {
LABEL_45:
    unint64_t v33 = 2654435761u * self->_numberOfNotificationsInStack;
    if ((*(unsigned char *)&v29 & 0x80) != 0) {
      goto LABEL_46;
    }
    goto LABEL_54;
  }
LABEL_53:
  unint64_t v33 = 0;
  if ((*(unsigned char *)&v29 & 0x80) != 0)
  {
LABEL_46:
    uint64_t v34 = 2654435761 * self->_priorityStatus;
    if ((*(_WORD *)&v29 & 0x100) != 0) {
      goto LABEL_47;
    }
    goto LABEL_55;
  }
LABEL_54:
  uint64_t v34 = 0;
  if ((*(_WORD *)&v29 & 0x100) != 0)
  {
LABEL_47:
    uint64_t v35 = 2654435761 * self->_summaryStatus;
    if ((*(_WORD *)&v29 & 0x4000) != 0) {
      goto LABEL_48;
    }
LABEL_56:
    uint64_t v36 = 0;
    if ((*(_WORD *)&v29 & 0x1000) != 0) {
      goto LABEL_49;
    }
LABEL_57:
    uint64_t v37 = 0;
    return v54 ^ v55 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v12 ^ v13 ^ v14 ^ v19 ^ v20 ^ v22 ^ v27 ^ v28 ^ v30 ^ v31 ^ v32 ^ v33 ^ v34 ^ v35 ^ v36 ^ v37;
  }
LABEL_55:
  uint64_t v35 = 0;
  if ((*(_WORD *)&v29 & 0x4000) == 0) {
    goto LABEL_56;
  }
LABEL_48:
  uint64_t v36 = 2654435761 * self->_isPriorityNotificationEnabled;
  if ((*(_WORD *)&v29 & 0x1000) == 0) {
    goto LABEL_57;
  }
LABEL_49:
  uint64_t v37 = 2654435761 * self->_isNotificationSummaryEnabled;
  return v54 ^ v55 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v12 ^ v13 ^ v14 ^ v19 ^ v20 ^ v22 ^ v27 ^ v28 ^ v30 ^ v31 ^ v32 ^ v33 ^ v34 ^ v35 ^ v36 ^ v37;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  double v4 = (double *)a3;
  long double v5 = v4;
  if (((_BYTE)v4[27] & 0x20) != 0)
  {
    self->_double timestamp = v4[6];
    *(_DWORD *)&self->_has |= 0x20u;
  }
  if (*((void *)v4 + 25)) {
    -[ATXPBUserNotification setUuid:](self, "setUuid:");
  }
  if (*((void *)v5 + 22)) {
    -[ATXPBUserNotification setTitle:](self, "setTitle:");
  }
  if (*((void *)v5 + 18)) {
    -[ATXPBUserNotification setSubtitle:](self, "setSubtitle:");
  }
  if (*((void *)v5 + 8)) {
    -[ATXPBUserNotification setBody:](self, "setBody:");
  }
  if (((_BYTE)v5[27] & 2) != 0)
  {
    self->_badge = (unint64_t)v5[2];
    *(_DWORD *)&self->_has |= 2u;
  }
  if (*((void *)v5 + 24)) {
    -[ATXPBUserNotification setUserInfo:](self, "setUserInfo:");
  }
  if (*((void *)v5 + 9)) {
    -[ATXPBUserNotification setBundleID:](self, "setBundleID:");
  }
  derivedData = self->_derivedData;
  uint64_t v7 = *((void *)v5 + 12);
  if (derivedData)
  {
    if (v7) {
      -[ATXPBUserNotificationDerivedData mergeFrom:](derivedData, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[ATXPBUserNotification setDerivedData:](self, "setDerivedData:");
  }
  if (*((void *)v5 + 21)) {
    -[ATXPBUserNotification setThreadID:](self, "setThreadID:");
  }
  if (*((void *)v5 + 10)) {
    -[ATXPBUserNotification setCategoryID:](self, "setCategoryID:");
  }
  if (*((void *)v5 + 16)) {
    -[ATXPBUserNotification setSectionID:](self, "setSectionID:");
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = *((id *)v5 + 11);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        [(ATXPBUserNotification *)self addContactIDs:*(void *)(*((void *)&v27 + 1) + 8 * i)];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v10);
  }

  int v13 = *((_DWORD *)v5 + 54);
  if ((v13 & 0x400) != 0)
  {
    self->_isGroupMessage = *((unsigned char *)v5 + 208);
    *(_DWORD *)&self->_has |= 0x400u;
    int v13 = *((_DWORD *)v5 + 54);
    if ((v13 & 0x200) == 0)
    {
LABEL_37:
      if ((v13 & 0x800) == 0) {
        goto LABEL_38;
      }
      goto LABEL_45;
    }
  }
  else if ((v13 & 0x200) == 0)
  {
    goto LABEL_37;
  }
  self->_uint64_t urgency = *((_DWORD *)v5 + 46);
  *(_DWORD *)&self->_has |= 0x200u;
  int v13 = *((_DWORD *)v5 + 54);
  if ((v13 & 0x800) == 0)
  {
LABEL_38:
    if ((v13 & 0x40) == 0) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
LABEL_45:
  self->_isMessage = *((unsigned char *)v5 + 209);
  *(_DWORD *)&self->_has |= 0x800u;
  if ((v5[27] & 0x40) != 0)
  {
LABEL_39:
    self->_uint64_t attachmentType = *((_DWORD *)v5 + 14);
    *(_DWORD *)&self->_has |= 0x40u;
  }
LABEL_40:
  sharedEngagementTracker = self->_sharedEngagementTracker;
  uint64_t v15 = *((void *)v5 + 17);
  if (sharedEngagementTracker)
  {
    if (v15) {
      -[ATXPBSharedDigestEngagementTrackingMetrics mergeFrom:](sharedEngagementTracker, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[ATXPBUserNotification setSharedEngagementTracker:](self, "setSharedEngagementTracker:");
  }
  if ((_BYTE)v5[27])
  {
    self->_double appSpecifiedScore = v5[1];
    *(_DWORD *)&self->_has |= 1u;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v16 = *((id *)v5 + 15);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        -[ATXPBUserNotification addRawIdentifiers:](self, "addRawIdentifiers:", *(void *)(*((void *)&v23 + 1) + 8 * j), (void)v23);
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v18);
  }

  if (*((void *)v5 + 13)) {
    -[ATXPBUserNotification setNotificationID:](self, "setNotificationID:");
  }
  int v21 = *((_DWORD *)v5 + 54);
  if ((v21 & 0x10) != 0)
  {
    self->_double recordTimestamp = v5[5];
    *(_DWORD *)&self->_has |= 0x10u;
    int v21 = *((_DWORD *)v5 + 54);
  }
  if ((v21 & 0x10000) != 0)
  {
    self->_isSummarized = *((unsigned char *)v5 + 214);
    *(_DWORD *)&self->_has |= 0x10000u;
  }
  if (*((void *)v5 + 19)) {
    -[ATXPBUserNotification setSummary:](self, "setSummary:");
  }
  int v22 = *((_DWORD *)v5 + 54);
  if ((v22 & 0x2000) != 0)
  {
    self->_isPartOfStack = *((unsigned char *)v5 + 211);
    *(_DWORD *)&self->_has |= 0x2000u;
    int v22 = *((_DWORD *)v5 + 54);
    if ((v22 & 0x8000) == 0)
    {
LABEL_68:
      if ((v22 & 8) == 0) {
        goto LABEL_69;
      }
      goto LABEL_78;
    }
  }
  else if ((v22 & 0x8000) == 0)
  {
    goto LABEL_68;
  }
  self->_isStackSummary = *((unsigned char *)v5 + 213);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v22 = *((_DWORD *)v5 + 54);
  if ((v22 & 8) == 0)
  {
LABEL_69:
    if ((v22 & 4) == 0) {
      goto LABEL_70;
    }
    goto LABEL_79;
  }
LABEL_78:
  self->_positionInStack = (unint64_t)v5[4];
  *(_DWORD *)&self->_has |= 8u;
  int v22 = *((_DWORD *)v5 + 54);
  if ((v22 & 4) == 0)
  {
LABEL_70:
    if ((v22 & 0x80) == 0) {
      goto LABEL_71;
    }
    goto LABEL_80;
  }
LABEL_79:
  self->_numberOfNotificationsInStack = (unint64_t)v5[3];
  *(_DWORD *)&self->_has |= 4u;
  int v22 = *((_DWORD *)v5 + 54);
  if ((v22 & 0x80) == 0)
  {
LABEL_71:
    if ((v22 & 0x100) == 0) {
      goto LABEL_72;
    }
    goto LABEL_81;
  }
LABEL_80:
  self->_uint64_t priorityStatus = *((_DWORD *)v5 + 28);
  *(_DWORD *)&self->_has |= 0x80u;
  int v22 = *((_DWORD *)v5 + 54);
  if ((v22 & 0x100) == 0)
  {
LABEL_72:
    if ((v22 & 0x4000) == 0) {
      goto LABEL_73;
    }
LABEL_82:
    self->_isPriorityNotificationEnabled = *((unsigned char *)v5 + 212);
    *(_DWORD *)&self->_has |= 0x4000u;
    if ((v5[27] & 0x1000) == 0) {
      goto LABEL_75;
    }
    goto LABEL_74;
  }
LABEL_81:
  self->_uint64_t summaryStatus = *((_DWORD *)v5 + 40);
  *(_DWORD *)&self->_has |= 0x100u;
  int v22 = *((_DWORD *)v5 + 54);
  if ((v22 & 0x4000) != 0) {
    goto LABEL_82;
  }
LABEL_73:
  if ((v22 & 0x1000) != 0)
  {
LABEL_74:
    self->_isNotificationSummaryEnabled = *((unsigned char *)v5 + 210);
    *(_DWORD *)&self->_has |= 0x1000u;
  }
LABEL_75:
}

- (double)timestamp
{
  return self->_timestamp;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (unint64_t)badge
{
  return self->_badge;
}

- (NSData)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)threadID
{
  return self->_threadID;
}

- (void)setThreadID:(id)a3
{
}

- (NSString)categoryID
{
  return self->_categoryID;
}

- (void)setCategoryID:(id)a3
{
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void)setSectionID:(id)a3
{
}

- (NSMutableArray)contactIDs
{
  return self->_contactIDs;
}

- (void)setContactIDs:(id)a3
{
}

- (NSMutableArray)rawIdentifiers
{
  return self->_rawIdentifiers;
}

- (void)setRawIdentifiers:(id)a3
{
}

- (BOOL)isMessage
{
  return self->_isMessage;
}

- (BOOL)isGroupMessage
{
  return self->_isGroupMessage;
}

- (double)appSpecifiedScore
{
  return self->_appSpecifiedScore;
}

- (ATXPBUserNotificationDerivedData)derivedData
{
  return self->_derivedData;
}

- (void)setDerivedData:(id)a3
{
}

- (ATXPBSharedDigestEngagementTrackingMetrics)sharedEngagementTracker
{
  return self->_sharedEngagementTracker;
}

- (void)setSharedEngagementTracker:(id)a3
{
}

- (NSString)notificationID
{
  return self->_notificationID;
}

- (void)setNotificationID:(id)a3
{
}

- (double)recordTimestamp
{
  return self->_recordTimestamp;
}

- (BOOL)isSummarized
{
  return self->_isSummarized;
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
}

- (BOOL)isPartOfStack
{
  return self->_isPartOfStack;
}

- (BOOL)isStackSummary
{
  return self->_isStackSummary;
}

- (unint64_t)positionInStack
{
  return self->_positionInStack;
}

- (unint64_t)numberOfNotificationsInStack
{
  return self->_numberOfNotificationsInStack;
}

- (BOOL)isPriorityNotificationEnabled
{
  return self->_isPriorityNotificationEnabled;
}

- (BOOL)isNotificationSummaryEnabled
{
  return self->_isNotificationSummaryEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_threadID, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_sharedEngagementTracker, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
  objc_storeStrong((id *)&self->_rawIdentifiers, 0);
  objc_storeStrong((id *)&self->_notificationID, 0);
  objc_storeStrong((id *)&self->_derivedData, 0);
  objc_storeStrong((id *)&self->_contactIDs, 0);
  objc_storeStrong((id *)&self->_categoryID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_body, 0);
}

- (id)initFromJSON:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long double v5 = [(ATXPBUserNotification *)self init];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v4;
      uint64_t v7 = [v6 objectForKeyedSubscript:@"timestamp"];
      [v7 doubleValue];
      -[ATXPBUserNotification setTimestamp:](v5, "setTimestamp:");

      id v8 = [v6 objectForKeyedSubscript:@"uuid"];
      [(ATXPBUserNotification *)v5 setUuid:v8];

      uint64_t v9 = [v6 objectForKeyedSubscript:@"title"];
      uint64_t v10 = +[ATXJSONHelper unwrapObject:v9];
      [(ATXPBUserNotification *)v5 setTitle:v10];

      uint64_t v11 = [v6 objectForKeyedSubscript:@"subtitle"];
      uint64_t v12 = +[ATXJSONHelper unwrapObject:v11];
      [(ATXPBUserNotification *)v5 setSubtitle:v12];

      int v13 = [v6 objectForKeyedSubscript:@"body"];
      unint64_t v14 = +[ATXJSONHelper unwrapObject:v13];
      [(ATXPBUserNotification *)v5 setBody:v14];

      uint64_t v15 = [v6 objectForKeyedSubscript:@"badge"];
      -[ATXPBUserNotification setBadge:](v5, "setBadge:", [v15 unsignedIntValue]);

      id v16 = [v6 objectForKeyedSubscript:@"userInfo"];
      uint64_t v17 = +[ATXJSONHelper unwrapData:v16];
      [(ATXPBUserNotification *)v5 setUserInfo:v17];

      uint64_t v18 = [v6 objectForKeyedSubscript:@"bundleID"];
      uint64_t v19 = +[ATXJSONHelper unwrapObject:v18];
      [(ATXPBUserNotification *)v5 setBundleID:v19];

      NSUInteger v20 = [v6 objectForKeyedSubscript:@"threadID"];
      int v21 = +[ATXJSONHelper unwrapObject:v20];
      [(ATXPBUserNotification *)v5 setThreadID:v21];

      int v22 = [v6 objectForKeyedSubscript:@"categoryID"];
      long long v23 = +[ATXJSONHelper unwrapObject:v22];
      [(ATXPBUserNotification *)v5 setCategoryID:v23];

      long long v24 = [v6 objectForKeyedSubscript:@"contactIDs"];

      if (v24)
      {
        long long v25 = [v6 objectForKeyedSubscript:@"contactIDs"];
        long long v26 = +[ATXJSONHelper unwrapObject:v25];

        if (v26)
        {
          long long v68 = 0u;
          long long v69 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          long long v27 = [v6 objectForKeyedSubscript:@"contactIDs"];
          uint64_t v28 = [v27 countByEnumeratingWithState:&v66 objects:v71 count:16];
          if (v28)
          {
            uint64_t v29 = v28;
            uint64_t v30 = *(void *)v67;
            do
            {
              for (uint64_t i = 0; i != v29; ++i)
              {
                if (*(void *)v67 != v30) {
                  objc_enumerationMutation(v27);
                }
                [(ATXPBUserNotification *)v5 addContactIDs:*(void *)(*((void *)&v66 + 1) + 8 * i)];
              }
              uint64_t v29 = [v27 countByEnumeratingWithState:&v66 objects:v71 count:16];
            }
            while (v29);
          }
        }
      }
      unint64_t v32 = [v6 objectForKeyedSubscript:@"rawIdentifiers"];

      if (v32)
      {
        uint64_t v33 = [v6 objectForKeyedSubscript:@"rawIdentifiers"];
        uint64_t v34 = +[ATXJSONHelper unwrapObject:v33];

        if (v34)
        {
          long long v64 = 0u;
          long long v65 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          id v35 = v34;
          uint64_t v36 = [v35 countByEnumeratingWithState:&v62 objects:v70 count:16];
          if (v36)
          {
            uint64_t v37 = v36;
            uint64_t v38 = *(void *)v63;
            do
            {
              for (uint64_t j = 0; j != v37; ++j)
              {
                if (*(void *)v63 != v38) {
                  objc_enumerationMutation(v35);
                }
                -[ATXPBUserNotification addRawIdentifiers:](v5, "addRawIdentifiers:", *(void *)(*((void *)&v62 + 1) + 8 * j), (void)v62);
              }
              uint64_t v37 = [v35 countByEnumeratingWithState:&v62 objects:v70 count:16];
            }
            while (v37);
          }
        }
      }
      uint64_t v40 = objc_msgSend(v6, "objectForKeyedSubscript:", @"isMessage", (void)v62);
      -[ATXPBUserNotification setIsMessage:](v5, "setIsMessage:", [v40 BOOLValue]);

      uint64_t v41 = [v6 objectForKeyedSubscript:@"isGroupMessage"];
      -[ATXPBUserNotification setIsGroupMessage:](v5, "setIsGroupMessage:", [v41 BOOLValue]);

      uint64_t v42 = [v6 objectForKeyedSubscript:@"urgency"];
      if (v42)
      {
        id v43 = [v6 objectForKeyedSubscript:@"urgency"];
        if ([v43 isEqualToString:@"Critical"])
        {
          uint64_t v44 = 0;
        }
        else if ([v43 isEqualToString:@"TimeSensitive"])
        {
          uint64_t v44 = 1;
        }
        else if ([v43 isEqualToString:@"Active"])
        {
          uint64_t v44 = 2;
        }
        else if ([v43 isEqualToString:@"Passive"])
        {
          uint64_t v44 = 3;
        }
        else if ([v43 isEqualToString:@"None"])
        {
          uint64_t v44 = 4;
        }
        else if ([v43 isEqualToString:@"Priority"])
        {
          uint64_t v44 = 5;
        }
        else if ([v43 isEqualToString:@"Total"])
        {
          uint64_t v44 = 6;
        }
        else
        {
          uint64_t v44 = 0;
        }

        [(ATXPBUserNotification *)v5 setUrgency:v44];
      }
      else
      {
        [(ATXPBUserNotification *)v5 setUrgency:4];
      }

      NSUInteger v45 = [v6 objectForKeyedSubscript:@"attachmentType"];
      if (v45)
      {
        id v46 = [v6 objectForKeyedSubscript:@"attachmentType"];
        if ([v46 isEqualToString:@"None"])
        {
          uint64_t v47 = 0;
        }
        else if ([v46 isEqualToString:@"Image"])
        {
          uint64_t v47 = 1;
        }
        else if ([v46 isEqualToString:@"Audio"])
        {
          uint64_t v47 = 2;
        }
        else if ([v46 isEqualToString:@"Video"])
        {
          uint64_t v47 = 3;
        }
        else if ([v46 isEqualToString:@"Other"])
        {
          uint64_t v47 = 4;
        }
        else if ([v46 isEqualToString:@"Total"])
        {
          uint64_t v47 = 5;
        }
        else
        {
          uint64_t v47 = 0;
        }

        [(ATXPBUserNotification *)v5 setAttachmentType:v47];
      }
      else
      {
        [(ATXPBUserNotification *)v5 setAttachmentType:0];
      }

      NSUInteger v48 = [v6 objectForKeyedSubscript:@"appSpecifiedScore"];
      [v48 doubleValue];
      -[ATXPBUserNotification setAppSpecifiedScore:](v5, "setAppSpecifiedScore:");

      uint64_t v49 = [v6 objectForKeyedSubscript:@"derivedData"];
      unint64_t v50 = +[ATXJSONHelper unwrapObject:v49];

      if (v50)
      {
        NSUInteger v51 = [ATXPBUserNotificationDerivedData alloc];
        NSUInteger v52 = [v6 objectForKeyedSubscript:@"derivedData"];
        NSUInteger v53 = +[ATXJSONHelper unwrapObject:v52];
        id v54 = [(ATXPBUserNotificationDerivedData *)v51 initFromJSON:v53];
        [(ATXPBUserNotification *)v5 setDerivedData:v54];
      }
      unint64_t v55 = [v6 objectForKeyedSubscript:@"sharedDigestEngagementTracker"];
      long long v56 = +[ATXJSONHelper unwrapObject:v55];

      if (v56)
      {
        v57 = [ATXPBSharedDigestEngagementTrackingMetrics alloc];
        v58 = [v6 objectForKeyedSubscript:@"sharedDigestEngagementTracker"];
        uint64_t v59 = +[ATXJSONHelper unwrapObject:v58];
        id v60 = [(ATXPBSharedDigestEngagementTrackingMetrics *)v57 initFromJSON:v59];
        [(ATXPBUserNotification *)v5 setSharedEngagementTracker:v60];
      }
    }
  }

  return v5;
}

- (id)jsonRepresentation
{
  v39[19] = *MEMORY[0x1E4F143B8];
  v38[0] = @"timestamp";
  uint64_t v37 = [NSNumber numberWithDouble:self->_timestamp];
  uint64_t v36 = +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:");
  v39[0] = v36;
  v38[1] = @"uuid";
  id v35 = +[ATXJSONHelper wrapObject:self->_uuid];
  v39[1] = v35;
  v38[2] = @"title";
  uint64_t v34 = +[ATXJSONHelper wrapObject:self->_title];
  v39[2] = v34;
  v38[3] = @"subtitle";
  uint64_t v33 = +[ATXJSONHelper wrapObject:self->_subtitle];
  v39[3] = v33;
  v38[4] = @"body";
  unint64_t v32 = +[ATXJSONHelper wrapObject:self->_body];
  v39[4] = v32;
  v38[5] = @"badge";
  uint64_t v31 = [NSNumber numberWithUnsignedInteger:self->_badge];
  uint64_t v30 = +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:");
  v39[5] = v30;
  v38[6] = @"userInfo";
  uint64_t v29 = +[ATXJSONHelper wrapObject:self->_userInfo];
  v39[6] = v29;
  v38[7] = @"bundleID";
  uint64_t v28 = +[ATXJSONHelper wrapObject:self->_bundleID];
  v39[7] = v28;
  v38[8] = @"threadID";
  long long v27 = +[ATXJSONHelper wrapObject:self->_threadID];
  v39[8] = v27;
  v38[9] = @"categoryID";
  long long v26 = +[ATXJSONHelper wrapObject:self->_categoryID];
  v39[9] = v26;
  v38[10] = @"contactIDs";
  long long v25 = +[ATXJSONHelper wrapObject:self->_contactIDs];
  v39[10] = v25;
  v38[11] = @"rawIdentifiers";
  long long v24 = +[ATXJSONHelper wrapObject:self->_rawIdentifiers];
  v39[11] = v24;
  v38[12] = @"isMessage";
  long long v23 = [NSNumber numberWithBool:self->_isMessage];
  int v22 = +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:");
  v39[12] = v22;
  v38[13] = @"isGroupMessage";
  int v21 = [NSNumber numberWithBool:self->_isGroupMessage];
  NSUInteger v20 = +[ATXJSONHelper wrapObject:](ATXJSONHelper, "wrapObject:");
  v39[13] = v20;
  v38[14] = @"urgency";
  uint64_t urgency = self->_urgency;
  if (urgency >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_urgency);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = off_1E5D0A2F8[urgency];
  }
  uint64_t v19 = v4;
  long double v5 = +[ATXJSONHelper wrapObject:v4];
  v39[14] = v5;
  v38[15] = @"attachmentType";
  uint64_t attachmentType = self->_attachmentType;
  if (attachmentType >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_attachmentType);
    uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v7 = off_1E5D0A330[attachmentType];
  }
  id v8 = +[ATXJSONHelper wrapObject:v7];
  v39[15] = v8;
  v38[16] = @"appSpecifiedScore";
  uint64_t v9 = NSNumber;
  [(ATXPBUserNotification *)self appSpecifiedScore];
  uint64_t v10 = objc_msgSend(v9, "numberWithDouble:");
  uint64_t v11 = +[ATXJSONHelper wrapObject:v10];
  v39[16] = v11;
  v38[17] = @"derivedData";
  uint64_t v12 = [(ATXPBUserNotificationDerivedData *)self->_derivedData jsonRepresentation];
  int v13 = +[ATXJSONHelper wrapObject:v12];
  v39[17] = v13;
  v38[18] = @"sharedDigestEngagementTracker";
  unint64_t v14 = [(ATXPBUserNotification *)self sharedEngagementTracker];
  uint64_t v15 = [v14 jsonRepresentation];
  id v16 = +[ATXJSONHelper wrapObject:v15];
  v39[18] = v16;
  id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:19];

  return v18;
}

@end