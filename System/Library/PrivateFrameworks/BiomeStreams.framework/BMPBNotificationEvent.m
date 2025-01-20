@interface BMPBNotificationEvent
+ (Class)contactIDsType;
- (BOOL)hasAbsoluteTimestamp;
- (BOOL)hasBadge;
- (BOOL)hasBody;
- (BOOL)hasBundleID;
- (BOOL)hasCategoryID;
- (BOOL)hasDeviceID;
- (BOOL)hasIsGroupMessage;
- (BOOL)hasNotificationID;
- (BOOL)hasSectionID;
- (BOOL)hasSubtitle;
- (BOOL)hasThreadID;
- (BOOL)hasTitle;
- (BOOL)hasUniqueID;
- (BOOL)hasUsageType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGroupMessage;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)contactIDs;
- (NSString)body;
- (NSString)bundleID;
- (NSString)categoryID;
- (NSString)deviceID;
- (NSString)notificationID;
- (NSString)sectionID;
- (NSString)subtitle;
- (NSString)threadID;
- (NSString)title;
- (NSString)uniqueID;
- (double)absoluteTimestamp;
- (id)contactIDsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)usageTypeAsString:(int)a3;
- (int)StringAsUsageType:(id)a3;
- (int)usageType;
- (unint64_t)badge;
- (unint64_t)contactIDsCount;
- (unint64_t)hash;
- (void)addContactIDs:(id)a3;
- (void)clearContactIDs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbsoluteTimestamp:(double)a3;
- (void)setBadge:(unint64_t)a3;
- (void)setBody:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setCategoryID:(id)a3;
- (void)setContactIDs:(id)a3;
- (void)setDeviceID:(id)a3;
- (void)setHasAbsoluteTimestamp:(BOOL)a3;
- (void)setHasBadge:(BOOL)a3;
- (void)setHasIsGroupMessage:(BOOL)a3;
- (void)setHasUsageType:(BOOL)a3;
- (void)setIsGroupMessage:(BOOL)a3;
- (void)setNotificationID:(id)a3;
- (void)setSectionID:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setThreadID:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUniqueID:(id)a3;
- (void)setUsageType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBNotificationEvent

- (BOOL)hasUniqueID
{
  return self->_uniqueID != 0;
}

- (void)setAbsoluteTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_absoluteTimestamp = a3;
}

- (void)setHasAbsoluteTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAbsoluteTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)usageType
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_usageType;
  }
  else {
    return 0;
  }
}

- (void)setUsageType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_usageType = a3;
}

- (void)setHasUsageType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasUsageType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)usageTypeAsString:(int)a3
{
  if (a3 >= 0x15)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E55D8080[a3];
  }

  return v3;
}

- (int)StringAsUsageType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Receive"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"DefaultAction"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SuppAction"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Clear"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ClearAll"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"IndirectClear"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"Hidden"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"Orb"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"Dismiss"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"AppLaunch"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"Expired"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"TapCoalesce"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"Deduped"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"DevActivated"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"DevUnlocked"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"Pulldown"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"ReceivedAndDeliveredActively"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"ReceivedAndDeliveredPassively"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"Modified"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"TapExpand"])
  {
    int v4 = 20;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (BOOL)hasNotificationID
{
  return self->_notificationID != 0;
}

- (BOOL)hasDeviceID
{
  return self->_deviceID != 0;
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
  *(unsigned char *)&self->_has |= 2u;
  self->_badge = a3;
}

- (void)setHasBadge:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBadge
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
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

- (void)setIsGroupMessage:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_isGroupMessage = a3;
}

- (void)setHasIsGroupMessage:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsGroupMessage
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBNotificationEvent;
  id v4 = [(BMPBNotificationEvent *)&v8 description];
  v5 = [(BMPBNotificationEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  uniqueID = self->_uniqueID;
  if (uniqueID) {
    [v3 setObject:uniqueID forKey:@"uniqueID"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v7 = [NSNumber numberWithDouble:self->_absoluteTimestamp];
    [v4 setObject:v7 forKey:@"absoluteTimestamp"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    uint64_t usageType = self->_usageType;
    if (usageType >= 0x15)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_usageType);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E55D8080[usageType];
    }
    [v4 setObject:v9 forKey:@"usageType"];
  }
  bundleID = self->_bundleID;
  if (bundleID) {
    [v4 setObject:bundleID forKey:@"bundleID"];
  }
  notificationID = self->_notificationID;
  if (notificationID) {
    [v4 setObject:notificationID forKey:@"notificationID"];
  }
  deviceID = self->_deviceID;
  if (deviceID) {
    [v4 setObject:deviceID forKey:@"deviceID"];
  }
  title = self->_title;
  if (title) {
    [v4 setObject:title forKey:@"title"];
  }
  subtitle = self->_subtitle;
  if (subtitle) {
    [v4 setObject:subtitle forKey:@"subtitle"];
  }
  body = self->_body;
  if (body) {
    [v4 setObject:body forKey:@"body"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v16 = [NSNumber numberWithUnsignedLongLong:self->_badge];
    [v4 setObject:v16 forKey:@"badge"];
  }
  threadID = self->_threadID;
  if (threadID) {
    [v4 setObject:threadID forKey:@"threadID"];
  }
  categoryID = self->_categoryID;
  if (categoryID) {
    [v4 setObject:categoryID forKey:@"categoryID"];
  }
  sectionID = self->_sectionID;
  if (sectionID) {
    [v4 setObject:sectionID forKey:@"sectionID"];
  }
  contactIDs = self->_contactIDs;
  if (contactIDs) {
    [v4 setObject:contactIDs forKey:@"contactIDs"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v21 = [NSNumber numberWithBool:self->_isGroupMessage];
    [v4 setObject:v21 forKey:@"isGroupMessage"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBNotificationEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_uniqueID) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_bundleID) {
    PBDataWriterWriteStringField();
  }
  if (self->_notificationID) {
    PBDataWriterWriteStringField();
  }
  if (self->_deviceID) {
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
  if (self->_threadID) {
    PBDataWriterWriteStringField();
  }
  if (self->_categoryID) {
    PBDataWriterWriteStringField();
  }
  if (self->_sectionID) {
    PBDataWriterWriteStringField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_contactIDs;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  v10 = v4;
  if (self->_uniqueID)
  {
    objc_msgSend(v4, "setUniqueID:");
    id v4 = v10;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_absoluteTimestamp;
    v4[120] |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 28) = self->_usageType;
    v4[120] |= 4u;
  }
  if (self->_bundleID)
  {
    objc_msgSend(v10, "setBundleID:");
    id v4 = v10;
  }
  if (self->_notificationID)
  {
    objc_msgSend(v10, "setNotificationID:");
    id v4 = v10;
  }
  if (self->_deviceID)
  {
    objc_msgSend(v10, "setDeviceID:");
    id v4 = v10;
  }
  if (self->_title)
  {
    objc_msgSend(v10, "setTitle:");
    id v4 = v10;
  }
  if (self->_subtitle)
  {
    objc_msgSend(v10, "setSubtitle:");
    id v4 = v10;
  }
  if (self->_body)
  {
    objc_msgSend(v10, "setBody:");
    id v4 = v10;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_badge;
    v4[120] |= 2u;
  }
  if (self->_threadID) {
    objc_msgSend(v10, "setThreadID:");
  }
  if (self->_categoryID) {
    objc_msgSend(v10, "setCategoryID:");
  }
  if (self->_sectionID) {
    objc_msgSend(v10, "setSectionID:");
  }
  if ([(BMPBNotificationEvent *)self contactIDsCount])
  {
    [v10 clearContactIDs];
    unint64_t v6 = [(BMPBNotificationEvent *)self contactIDsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(BMPBNotificationEvent *)self contactIDsAtIndex:i];
        [v10 addContactIDs:v9];
      }
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v10[116] = self->_isGroupMessage;
    v10[120] |= 8u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_uniqueID copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v6;

  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 8) = self->_absoluteTimestamp;
    *(unsigned char *)(v5 + 120) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 112) = self->_usageType;
    *(unsigned char *)(v5 + 120) |= 4u;
  }
  uint64_t v9 = [(NSString *)self->_bundleID copyWithZone:a3];
  v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  uint64_t v11 = [(NSString *)self->_notificationID copyWithZone:a3];
  long long v12 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v11;

  uint64_t v13 = [(NSString *)self->_deviceID copyWithZone:a3];
  long long v14 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v13;

  uint64_t v15 = [(NSString *)self->_title copyWithZone:a3];
  uint64_t v16 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v15;

  uint64_t v17 = [(NSString *)self->_subtitle copyWithZone:a3];
  v18 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v17;

  uint64_t v19 = [(NSString *)self->_body copyWithZone:a3];
  v20 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v19;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_badge;
    *(unsigned char *)(v5 + 120) |= 2u;
  }
  uint64_t v21 = [(NSString *)self->_threadID copyWithZone:a3];
  v22 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v21;

  uint64_t v23 = [(NSString *)self->_categoryID copyWithZone:a3];
  v24 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v23;

  uint64_t v25 = [(NSString *)self->_sectionID copyWithZone:a3];
  v26 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v25;

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v27 = self->_contactIDs;
  uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v35 != v30) {
          objc_enumerationMutation(v27);
        }
        v32 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * i), "copyWithZone:", a3, (void)v34);
        [(id)v5 addContactIDs:v32];
      }
      uint64_t v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v29);
  }

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(unsigned char *)(v5 + 116) = self->_isGroupMessage;
    *(unsigned char *)(v5 + 120) |= 8u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_41;
  }
  uniqueID = self->_uniqueID;
  if ((unint64_t)uniqueID | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](uniqueID, "isEqual:")) {
      goto LABEL_41;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 120) & 1) == 0 || self->_absoluteTimestamp != *((double *)v4 + 1)) {
      goto LABEL_41;
    }
  }
  else if (*((unsigned char *)v4 + 120))
  {
    goto LABEL_41;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 120) & 4) == 0 || self->_usageType != *((_DWORD *)v4 + 28)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 120) & 4) != 0)
  {
    goto LABEL_41;
  }
  bundleID = self->_bundleID;
  if ((unint64_t)bundleID | *((void *)v4 + 4) && !-[NSString isEqual:](bundleID, "isEqual:")) {
    goto LABEL_41;
  }
  notificationID = self->_notificationID;
  if ((unint64_t)notificationID | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](notificationID, "isEqual:")) {
      goto LABEL_41;
    }
  }
  deviceID = self->_deviceID;
  if ((unint64_t)deviceID | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](deviceID, "isEqual:")) {
      goto LABEL_41;
    }
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](title, "isEqual:")) {
      goto LABEL_41;
    }
  }
  subtitle = self->_subtitle;
  if ((unint64_t)subtitle | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](subtitle, "isEqual:")) {
      goto LABEL_41;
    }
  }
  body = self->_body;
  if ((unint64_t)body | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](body, "isEqual:")) {
      goto LABEL_41;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 120) & 2) == 0 || self->_badge != *((void *)v4 + 2)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 120) & 2) != 0)
  {
    goto LABEL_41;
  }
  threadID = self->_threadID;
  if ((unint64_t)threadID | *((void *)v4 + 11) && !-[NSString isEqual:](threadID, "isEqual:")) {
    goto LABEL_41;
  }
  categoryID = self->_categoryID;
  if ((unint64_t)categoryID | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](categoryID, "isEqual:")) {
      goto LABEL_41;
    }
  }
  sectionID = self->_sectionID;
  if ((unint64_t)sectionID | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](sectionID, "isEqual:")) {
      goto LABEL_41;
    }
  }
  contactIDs = self->_contactIDs;
  if ((unint64_t)contactIDs | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](contactIDs, "isEqual:")) {
      goto LABEL_41;
    }
  }
  BOOL v16 = (*((unsigned char *)v4 + 120) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 120) & 8) == 0)
    {
LABEL_41:
      BOOL v16 = 0;
      goto LABEL_42;
    }
    if (self->_isGroupMessage)
    {
      if (!*((unsigned char *)v4 + 116)) {
        goto LABEL_41;
      }
    }
    else if (*((unsigned char *)v4 + 116))
    {
      goto LABEL_41;
    }
    BOOL v16 = 1;
  }
LABEL_42:

  return v16;
}

- (unint64_t)hash
{
  NSUInteger v24 = [(NSString *)self->_uniqueID hash];
  char has = (char)self->_has;
  if (has)
  {
    double absoluteTimestamp = self->_absoluteTimestamp;
    double v6 = -absoluteTimestamp;
    if (absoluteTimestamp >= 0.0) {
      double v6 = self->_absoluteTimestamp;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  unint64_t v23 = v4;
  if ((has & 4) != 0) {
    uint64_t v22 = 2654435761 * self->_usageType;
  }
  else {
    uint64_t v22 = 0;
  }
  NSUInteger v21 = [(NSString *)self->_bundleID hash];
  NSUInteger v20 = [(NSString *)self->_notificationID hash];
  NSUInteger v19 = [(NSString *)self->_deviceID hash];
  NSUInteger v9 = [(NSString *)self->_title hash];
  NSUInteger v10 = [(NSString *)self->_subtitle hash];
  NSUInteger v11 = [(NSString *)self->_body hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    unint64_t v12 = 2654435761u * self->_badge;
  }
  else {
    unint64_t v12 = 0;
  }
  NSUInteger v13 = [(NSString *)self->_threadID hash];
  NSUInteger v14 = [(NSString *)self->_categoryID hash];
  NSUInteger v15 = [(NSString *)self->_sectionID hash];
  uint64_t v16 = [(NSMutableArray *)self->_contactIDs hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v17 = 2654435761 * self->_isGroupMessage;
  }
  else {
    uint64_t v17 = 0;
  }
  return v23 ^ v24 ^ v22 ^ v21 ^ v20 ^ v19 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 13)) {
    -[BMPBNotificationEvent setUniqueID:](self, "setUniqueID:");
  }
  char v5 = *((unsigned char *)v4 + 120);
  if (v5)
  {
    self->_double absoluteTimestamp = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 120);
  }
  if ((v5 & 4) != 0)
  {
    self->_uint64_t usageType = *((_DWORD *)v4 + 28);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 4)) {
    -[BMPBNotificationEvent setBundleID:](self, "setBundleID:");
  }
  if (*((void *)v4 + 8)) {
    -[BMPBNotificationEvent setNotificationID:](self, "setNotificationID:");
  }
  if (*((void *)v4 + 7)) {
    -[BMPBNotificationEvent setDeviceID:](self, "setDeviceID:");
  }
  if (*((void *)v4 + 12)) {
    -[BMPBNotificationEvent setTitle:](self, "setTitle:");
  }
  if (*((void *)v4 + 10)) {
    -[BMPBNotificationEvent setSubtitle:](self, "setSubtitle:");
  }
  if (*((void *)v4 + 3)) {
    -[BMPBNotificationEvent setBody:](self, "setBody:");
  }
  if ((*((unsigned char *)v4 + 120) & 2) != 0)
  {
    self->_badge = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 11)) {
    -[BMPBNotificationEvent setThreadID:](self, "setThreadID:");
  }
  if (*((void *)v4 + 5)) {
    -[BMPBNotificationEvent setCategoryID:](self, "setCategoryID:");
  }
  if (*((void *)v4 + 9)) {
    -[BMPBNotificationEvent setSectionID:](self, "setSectionID:");
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 6);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[BMPBNotificationEvent addContactIDs:](self, "addContactIDs:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if ((*((unsigned char *)v4 + 120) & 8) != 0)
  {
    self->_isGroupMessage = *((unsigned char *)v4 + 116);
    *(unsigned char *)&self->_has |= 8u;
  }
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)notificationID
{
  return self->_notificationID;
}

- (void)setNotificationID:(id)a3
{
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
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

- (BOOL)isGroupMessage
{
  return self->_isGroupMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_threadID, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
  objc_storeStrong((id *)&self->_notificationID, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_contactIDs, 0);
  objc_storeStrong((id *)&self->_categoryID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_body, 0);
}

@end