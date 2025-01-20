@interface ATXPBUserNotificationDigestNotificationGroup
+ (Class)rankedNotificationsType;
- (ATXPBSharedDigestEngagementTrackingMetrics)sharedEngagementTracker;
- (BOOL)hasGroupDescription;
- (BOOL)hasGroupId;
- (BOOL)hasPriority;
- (BOOL)hasRepresentativeNotificationUUID;
- (BOOL)hasSharedEngagementTracker;
- (BOOL)hasTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)rankedNotifications;
- (NSString)groupDescription;
- (NSString)groupId;
- (NSString)representativeNotificationUUID;
- (NSString)title;
- (double)priority;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)initFromJSON:(id)a3;
- (id)jsonRepresentation;
- (id)rankedNotificationsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)rankedNotificationsCount;
- (void)addRankedNotifications:(id)a3;
- (void)clearRankedNotifications;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setGroupDescription:(id)a3;
- (void)setGroupId:(id)a3;
- (void)setHasPriority:(BOOL)a3;
- (void)setPriority:(double)a3;
- (void)setRankedNotifications:(id)a3;
- (void)setRepresentativeNotificationUUID:(id)a3;
- (void)setSharedEngagementTracker:(id)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBUserNotificationDigestNotificationGroup

- (BOOL)hasGroupId
{
  return self->_groupId != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasGroupDescription
{
  return self->_groupDescription != 0;
}

- (void)setPriority:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_priority = a3;
}

- (void)setHasPriority:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPriority
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasRepresentativeNotificationUUID
{
  return self->_representativeNotificationUUID != 0;
}

- (void)clearRankedNotifications
{
}

- (void)addRankedNotifications:(id)a3
{
  id v4 = a3;
  rankedNotifications = self->_rankedNotifications;
  id v8 = v4;
  if (!rankedNotifications)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_rankedNotifications;
    self->_rankedNotifications = v6;

    id v4 = v8;
    rankedNotifications = self->_rankedNotifications;
  }
  [(NSMutableArray *)rankedNotifications addObject:v4];
}

- (unint64_t)rankedNotificationsCount
{
  return [(NSMutableArray *)self->_rankedNotifications count];
}

- (id)rankedNotificationsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_rankedNotifications objectAtIndex:a3];
}

+ (Class)rankedNotificationsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSharedEngagementTracker
{
  return self->_sharedEngagementTracker != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBUserNotificationDigestNotificationGroup;
  id v4 = [(ATXPBUserNotificationDigestNotificationGroup *)&v8 description];
  v5 = [(ATXPBUserNotificationDigestNotificationGroup *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  groupId = self->_groupId;
  if (groupId) {
    [v3 setObject:groupId forKey:@"groupId"];
  }
  title = self->_title;
  if (title) {
    [v4 setObject:title forKey:@"title"];
  }
  groupDescription = self->_groupDescription;
  if (groupDescription) {
    [v4 setObject:groupDescription forKey:@"groupDescription"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v8 = [NSNumber numberWithDouble:self->_priority];
    [v4 setObject:v8 forKey:@"priority"];
  }
  representativeNotificationUUID = self->_representativeNotificationUUID;
  if (representativeNotificationUUID) {
    [v4 setObject:representativeNotificationUUID forKey:@"representativeNotificationUUID"];
  }
  if ([(NSMutableArray *)self->_rankedNotifications count])
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_rankedNotifications, "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v11 = self->_rankedNotifications;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "dictionaryRepresentation", (void)v20);
          [v10 addObject:v16];
        }
        uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v13);
    }

    [v4 setObject:v10 forKey:@"rankedNotifications"];
  }
  sharedEngagementTracker = self->_sharedEngagementTracker;
  if (sharedEngagementTracker)
  {
    v18 = [(ATXPBSharedDigestEngagementTrackingMetrics *)sharedEngagementTracker dictionaryRepresentation];
    [v4 setObject:v18 forKey:@"sharedEngagementTracker"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBUserNotificationDigestNotificationGroupReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_groupId) {
    PBDataWriterWriteStringField();
  }
  if (self->_title) {
    PBDataWriterWriteStringField();
  }
  if (self->_groupDescription) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_representativeNotificationUUID) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_rankedNotifications;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_sharedEngagementTracker) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_groupId)
  {
    objc_msgSend(v4, "setGroupId:");
    id v4 = v9;
  }
  if (self->_title)
  {
    objc_msgSend(v9, "setTitle:");
    id v4 = v9;
  }
  if (self->_groupDescription)
  {
    objc_msgSend(v9, "setGroupDescription:");
    id v4 = v9;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_priority;
    *((unsigned char *)v4 + 64) |= 1u;
  }
  if (self->_representativeNotificationUUID) {
    objc_msgSend(v9, "setRepresentativeNotificationUUID:");
  }
  if ([(ATXPBUserNotificationDigestNotificationGroup *)self rankedNotificationsCount])
  {
    [v9 clearRankedNotifications];
    unint64_t v5 = [(ATXPBUserNotificationDigestNotificationGroup *)self rankedNotificationsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(ATXPBUserNotificationDigestNotificationGroup *)self rankedNotificationsAtIndex:i];
        [v9 addRankedNotifications:v8];
      }
    }
  }
  if (self->_sharedEngagementTracker) {
    objc_msgSend(v9, "setSharedEngagementTracker:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_groupId copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_title copyWithZone:a3];
  id v9 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v8;

  uint64_t v10 = [(NSString *)self->_groupDescription copyWithZone:a3];
  long long v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_priority;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  uint64_t v12 = [(NSString *)self->_representativeNotificationUUID copyWithZone:a3];
  long long v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v14 = self->_rankedNotifications;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v18), "copyWithZone:", a3, (void)v23);
        [(id)v5 addRankedNotifications:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v16);
  }

  id v20 = [(ATXPBSharedDigestEngagementTrackingMetrics *)self->_sharedEngagementTracker copyWithZone:a3];
  long long v21 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v20;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  groupId = self->_groupId;
  if ((unint64_t)groupId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](groupId, "isEqual:")) {
      goto LABEL_19;
    }
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](title, "isEqual:")) {
      goto LABEL_19;
    }
  }
  groupDescription = self->_groupDescription;
  if ((unint64_t)groupDescription | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](groupDescription, "isEqual:")) {
      goto LABEL_19;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_priority != *((double *)v4 + 1)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_19:
    char v11 = 0;
    goto LABEL_20;
  }
  representativeNotificationUUID = self->_representativeNotificationUUID;
  if ((unint64_t)representativeNotificationUUID | *((void *)v4 + 5)
    && !-[NSString isEqual:](representativeNotificationUUID, "isEqual:"))
  {
    goto LABEL_19;
  }
  rankedNotifications = self->_rankedNotifications;
  if ((unint64_t)rankedNotifications | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](rankedNotifications, "isEqual:")) {
      goto LABEL_19;
    }
  }
  sharedEngagementTracker = self->_sharedEngagementTracker;
  if ((unint64_t)sharedEngagementTracker | *((void *)v4 + 6)) {
    char v11 = -[ATXPBSharedDigestEngagementTrackingMetrics isEqual:](sharedEngagementTracker, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_groupId hash];
  NSUInteger v4 = [(NSString *)self->_title hash];
  NSUInteger v5 = [(NSString *)self->_groupDescription hash];
  if (*(unsigned char *)&self->_has)
  {
    double priority = self->_priority;
    double v8 = -priority;
    if (priority >= 0.0) {
      double v8 = self->_priority;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  NSUInteger v11 = v4 ^ v3 ^ v5 ^ v6;
  NSUInteger v12 = [(NSString *)self->_representativeNotificationUUID hash];
  uint64_t v13 = v12 ^ [(NSMutableArray *)self->_rankedNotifications hash];
  return v11 ^ v13 ^ [(ATXPBSharedDigestEngagementTrackingMetrics *)self->_sharedEngagementTracker hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 3)) {
    -[ATXPBUserNotificationDigestNotificationGroup setGroupId:](self, "setGroupId:");
  }
  if (*((void *)v4 + 7)) {
    -[ATXPBUserNotificationDigestNotificationGroup setTitle:](self, "setTitle:");
  }
  if (*((void *)v4 + 2)) {
    -[ATXPBUserNotificationDigestNotificationGroup setGroupDescription:](self, "setGroupDescription:");
  }
  if (*((unsigned char *)v4 + 64))
  {
    self->_double priority = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 5)) {
    -[ATXPBUserNotificationDigestNotificationGroup setRepresentativeNotificationUUID:](self, "setRepresentativeNotificationUUID:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *((id *)v4 + 4);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        -[ATXPBUserNotificationDigestNotificationGroup addRankedNotifications:](self, "addRankedNotifications:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  sharedEngagementTracker = self->_sharedEngagementTracker;
  uint64_t v11 = *((void *)v4 + 6);
  if (sharedEngagementTracker)
  {
    if (v11) {
      -[ATXPBSharedDigestEngagementTrackingMetrics mergeFrom:](sharedEngagementTracker, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[ATXPBUserNotificationDigestNotificationGroup setSharedEngagementTracker:](self, "setSharedEngagementTracker:");
  }
}

- (NSString)groupId
{
  return self->_groupId;
}

- (void)setGroupId:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)groupDescription
{
  return self->_groupDescription;
}

- (void)setGroupDescription:(id)a3
{
}

- (double)priority
{
  return self->_priority;
}

- (NSString)representativeNotificationUUID
{
  return self->_representativeNotificationUUID;
}

- (void)setRepresentativeNotificationUUID:(id)a3
{
}

- (NSMutableArray)rankedNotifications
{
  return self->_rankedNotifications;
}

- (void)setRankedNotifications:(id)a3
{
}

- (ATXPBSharedDigestEngagementTrackingMetrics)sharedEngagementTracker
{
  return self->_sharedEngagementTracker;
}

- (void)setSharedEngagementTracker:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_sharedEngagementTracker, 0);
  objc_storeStrong((id *)&self->_representativeNotificationUUID, 0);
  objc_storeStrong((id *)&self->_rankedNotifications, 0);
  objc_storeStrong((id *)&self->_groupId, 0);

  objc_storeStrong((id *)&self->_groupDescription, 0);
}

- (id)initFromJSON:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ATXPBUserNotificationDigestNotificationGroup *)self init];
  if (v5)
  {
    id v6 = v4;
    uint64_t v7 = [v6 objectForKeyedSubscript:@"groupID"];
    uint64_t v8 = +[ATXJSONHelper unwrapObject:v7];
    [(ATXPBUserNotificationDigestNotificationGroup *)v5 setGroupId:v8];

    long double v9 = [v6 objectForKeyedSubscript:@"title"];
    double v10 = +[ATXJSONHelper unwrapObject:v9];
    [(ATXPBUserNotificationDigestNotificationGroup *)v5 setTitle:v10];

    uint64_t v11 = [v6 objectForKeyedSubscript:@"groupDescription"];
    long long v12 = +[ATXJSONHelper unwrapObject:v11];
    [(ATXPBUserNotificationDigestNotificationGroup *)v5 setGroupDescription:v12];

    long long v13 = [v6 objectForKeyedSubscript:@"representativeNotificationUUID"];
    long long v14 = +[ATXJSONHelper unwrapObject:v13];
    [(ATXPBUserNotificationDigestNotificationGroup *)v5 setRepresentativeNotificationUUID:v14];

    long long v15 = [v6 objectForKeyedSubscript:@"priority"];
    [v15 doubleValue];
    -[ATXPBUserNotificationDigestNotificationGroup setPriority:](v5, "setPriority:");

    uint64_t v16 = [v6 objectForKeyedSubscript:@"sharedDigestEngagementTracker"];
    uint64_t v17 = +[ATXJSONHelper unwrapObject:v16];

    if (v17)
    {
      uint64_t v18 = [ATXPBSharedDigestEngagementTrackingMetrics alloc];
      v19 = [v6 objectForKeyedSubscript:@"sharedDigestEngagementTracker"];
      id v20 = +[ATXJSONHelper unwrapObject:v19];
      id v21 = [(ATXPBSharedDigestEngagementTrackingMetrics *)v18 initFromJSON:v20];
      [(ATXPBUserNotificationDigestNotificationGroup *)v5 setSharedEngagementTracker:v21];
    }
    long long v22 = [v6 objectForKeyedSubscript:@"rankedNotifications"];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v30;
      do
      {
        uint64_t v26 = 0;
        do
        {
          if (*(void *)v30 != v25) {
            objc_enumerationMutation(v22);
          }
          id v27 = [[ATXPBUserNotification alloc] initFromJSON:*(void *)(*((void *)&v29 + 1) + 8 * v26)];
          [(ATXPBUserNotificationDigestNotificationGroup *)v5 addRankedNotifications:v27];

          ++v26;
        }
        while (v24 != v26);
        uint64_t v24 = [v22 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v24);
    }
  }
  return v5;
}

- (id)jsonRepresentation
{
  v17[7] = *MEMORY[0x1E4F143B8];
  v16[0] = @"groupID";
  long long v15 = +[ATXJSONHelper wrapObject:self->_groupId];
  v17[0] = v15;
  v16[1] = @"title";
  long long v14 = +[ATXJSONHelper wrapObject:self->_title];
  v17[1] = v14;
  v16[2] = @"groupDescription";
  NSUInteger v3 = +[ATXJSONHelper wrapObject:self->_groupDescription];
  v17[2] = v3;
  v16[3] = @"priority";
  id v4 = [NSNumber numberWithDouble:self->_priority];
  id v5 = +[ATXJSONHelper wrapObject:v4];
  v17[3] = v5;
  v16[4] = @"representativeNotificationUUID";
  id v6 = +[ATXJSONHelper wrapObject:self->_representativeNotificationUUID];
  v17[4] = v6;
  v16[5] = @"rankedNotifications";
  uint64_t v7 = [(NSMutableArray *)self->_rankedNotifications _pas_mappedArrayWithTransform:&__block_literal_global_64];
  uint64_t v8 = +[ATXJSONHelper wrapObject:v7];
  v17[5] = v8;
  v16[6] = @"sharedDigestEngagementTracker";
  long double v9 = [(ATXPBUserNotificationDigestNotificationGroup *)self sharedEngagementTracker];
  double v10 = [v9 jsonRepresentation];
  uint64_t v11 = +[ATXJSONHelper wrapObject:v10];
  v17[6] = v11;
  long long v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:7];

  return v12;
}

uint64_t __72__ATXPBUserNotificationDigestNotificationGroup_JSON__jsonRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 jsonRepresentation];
}

@end