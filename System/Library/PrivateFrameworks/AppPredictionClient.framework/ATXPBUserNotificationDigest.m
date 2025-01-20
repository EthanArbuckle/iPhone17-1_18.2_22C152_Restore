@interface ATXPBUserNotificationDigest
+ (Class)appDigestsType;
+ (Class)highlightedGroupsType;
+ (Class)messageGroupsType;
+ (Class)rankedGroupsType;
- (ATXPBDigestTimeline)digestTimeline;
- (ATXPBSharedDigestEngagementTrackingMetrics)sharedEngagementTracker;
- (BOOL)hasDigestTimeline;
- (BOOL)hasModeId;
- (BOOL)hasRankerId;
- (BOOL)hasSharedEngagementTracker;
- (BOOL)hasTimestamp;
- (BOOL)hasUuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)appDigests;
- (NSMutableArray)highlightedGroups;
- (NSMutableArray)messageGroups;
- (NSMutableArray)rankedGroups;
- (NSString)modeId;
- (NSString)rankerId;
- (NSString)uuid;
- (double)timestamp;
- (id)appDigestsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)highlightedGroupsAtIndex:(unint64_t)a3;
- (id)initFromJSON:(id)a3;
- (id)jsonRepresentation;
- (id)messageGroupsAtIndex:(unint64_t)a3;
- (id)rankedGroupsAtIndex:(unint64_t)a3;
- (unint64_t)appDigestsCount;
- (unint64_t)hash;
- (unint64_t)highlightedGroupsCount;
- (unint64_t)messageGroupsCount;
- (unint64_t)rankedGroupsCount;
- (void)addAppDigests:(id)a3;
- (void)addHighlightedGroups:(id)a3;
- (void)addMessageGroups:(id)a3;
- (void)addRankedGroups:(id)a3;
- (void)clearAppDigests;
- (void)clearHighlightedGroups;
- (void)clearMessageGroups;
- (void)clearRankedGroups;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppDigests:(id)a3;
- (void)setDigestTimeline:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHighlightedGroups:(id)a3;
- (void)setMessageGroups:(id)a3;
- (void)setModeId:(id)a3;
- (void)setRankedGroups:(id)a3;
- (void)setRankerId:(id)a3;
- (void)setSharedEngagementTracker:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBUserNotificationDigest

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasRankerId
{
  return self->_rankerId != 0;
}

- (BOOL)hasModeId
{
  return self->_modeId != 0;
}

- (void)clearMessageGroups
{
}

- (void)addMessageGroups:(id)a3
{
  id v4 = a3;
  messageGroups = self->_messageGroups;
  id v8 = v4;
  if (!messageGroups)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_messageGroups;
    self->_messageGroups = v6;

    id v4 = v8;
    messageGroups = self->_messageGroups;
  }
  [(NSMutableArray *)messageGroups addObject:v4];
}

- (unint64_t)messageGroupsCount
{
  return [(NSMutableArray *)self->_messageGroups count];
}

- (id)messageGroupsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_messageGroups objectAtIndex:a3];
}

+ (Class)messageGroupsType
{
  return (Class)objc_opt_class();
}

- (void)clearHighlightedGroups
{
}

- (void)addHighlightedGroups:(id)a3
{
  id v4 = a3;
  highlightedGroups = self->_highlightedGroups;
  id v8 = v4;
  if (!highlightedGroups)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_highlightedGroups;
    self->_highlightedGroups = v6;

    id v4 = v8;
    highlightedGroups = self->_highlightedGroups;
  }
  [(NSMutableArray *)highlightedGroups addObject:v4];
}

- (unint64_t)highlightedGroupsCount
{
  return [(NSMutableArray *)self->_highlightedGroups count];
}

- (id)highlightedGroupsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_highlightedGroups objectAtIndex:a3];
}

+ (Class)highlightedGroupsType
{
  return (Class)objc_opt_class();
}

- (void)clearRankedGroups
{
}

- (void)addRankedGroups:(id)a3
{
  id v4 = a3;
  rankedGroups = self->_rankedGroups;
  id v8 = v4;
  if (!rankedGroups)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_rankedGroups;
    self->_rankedGroups = v6;

    id v4 = v8;
    rankedGroups = self->_rankedGroups;
  }
  [(NSMutableArray *)rankedGroups addObject:v4];
}

- (unint64_t)rankedGroupsCount
{
  return [(NSMutableArray *)self->_rankedGroups count];
}

- (id)rankedGroupsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_rankedGroups objectAtIndex:a3];
}

+ (Class)rankedGroupsType
{
  return (Class)objc_opt_class();
}

- (void)clearAppDigests
{
}

- (void)addAppDigests:(id)a3
{
  id v4 = a3;
  appDigests = self->_appDigests;
  id v8 = v4;
  if (!appDigests)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_appDigests;
    self->_appDigests = v6;

    id v4 = v8;
    appDigests = self->_appDigests;
  }
  [(NSMutableArray *)appDigests addObject:v4];
}

- (unint64_t)appDigestsCount
{
  return [(NSMutableArray *)self->_appDigests count];
}

- (id)appDigestsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_appDigests objectAtIndex:a3];
}

+ (Class)appDigestsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSharedEngagementTracker
{
  return self->_sharedEngagementTracker != 0;
}

- (BOOL)hasDigestTimeline
{
  return self->_digestTimeline != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBUserNotificationDigest;
  id v4 = [(ATXPBUserNotificationDigest *)&v8 description];
  v5 = [(ATXPBUserNotificationDigest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithDouble:self->_timestamp];
    [v3 setObject:v4 forKey:@"timestamp"];
  }
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  rankerId = self->_rankerId;
  if (rankerId) {
    [v3 setObject:rankerId forKey:@"rankerId"];
  }
  modeId = self->_modeId;
  if (modeId) {
    [v3 setObject:modeId forKey:@"modeId"];
  }
  if ([(NSMutableArray *)self->_messageGroups count])
  {
    objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_messageGroups, "count"));
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    v9 = self->_messageGroups;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v53 objects:v60 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v54 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v53 + 1) + 8 * i) dictionaryRepresentation];
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v53 objects:v60 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKey:@"messageGroups"];
  }
  if ([(NSMutableArray *)self->_highlightedGroups count])
  {
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_highlightedGroups, "count"));
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    v16 = self->_highlightedGroups;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v49 objects:v59 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v50;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v50 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [*(id *)(*((void *)&v49 + 1) + 8 * j) dictionaryRepresentation];
          [v15 addObject:v21];
        }
        uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v49 objects:v59 count:16];
      }
      while (v18);
    }

    [v3 setObject:v15 forKey:@"highlightedGroups"];
  }
  if ([(NSMutableArray *)self->_rankedGroups count])
  {
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_rankedGroups, "count"));
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v23 = self->_rankedGroups;
    uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v45 objects:v58 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v46;
      do
      {
        for (uint64_t k = 0; k != v25; ++k)
        {
          if (*(void *)v46 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = [*(id *)(*((void *)&v45 + 1) + 8 * k) dictionaryRepresentation];
          [v22 addObject:v28];
        }
        uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v45 objects:v58 count:16];
      }
      while (v25);
    }

    [v3 setObject:v22 forKey:@"rankedGroups"];
  }
  if ([(NSMutableArray *)self->_appDigests count])
  {
    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_appDigests, "count"));
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v30 = self->_appDigests;
    uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v41 objects:v57 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v42;
      do
      {
        for (uint64_t m = 0; m != v32; ++m)
        {
          if (*(void *)v42 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * m), "dictionaryRepresentation", (void)v41);
          [v29 addObject:v35];
        }
        uint64_t v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v41 objects:v57 count:16];
      }
      while (v32);
    }

    [v3 setObject:v29 forKey:@"appDigests"];
  }
  sharedEngagementTracker = self->_sharedEngagementTracker;
  if (sharedEngagementTracker)
  {
    v37 = [(ATXPBSharedDigestEngagementTrackingMetrics *)sharedEngagementTracker dictionaryRepresentation];
    [v3 setObject:v37 forKey:@"sharedEngagementTracker"];
  }
  digestTimeline = self->_digestTimeline;
  if (digestTimeline)
  {
    v39 = [(ATXPBDigestTimeline *)digestTimeline dictionaryRepresentation];
    [v3 setObject:v39 forKey:@"digestTimeline"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBUserNotificationDigestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v5 = self->_messageGroups;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v7);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v10 = self->_highlightedGroups;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v12);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v15 = self->_rankedGroups;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
    }
    while (v17);
  }

  if (self->_uuid) {
    PBDataWriterWriteStringField();
  }
  if (self->_rankerId) {
    PBDataWriterWriteStringField();
  }
  if (self->_modeId) {
    PBDataWriterWriteStringField();
  }
  if (self->_sharedEngagementTracker) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_digestTimeline) {
    PBDataWriterWriteSubmessage();
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v20 = self->_appDigests;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
    }
    while (v22);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = *(void *)&self->_timestamp;
    *((unsigned char *)v4 + 88) |= 1u;
  }
  id v21 = v4;
  if ([(ATXPBUserNotificationDigest *)self messageGroupsCount])
  {
    [v21 clearMessageGroups];
    unint64_t v5 = [(ATXPBUserNotificationDigest *)self messageGroupsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(ATXPBUserNotificationDigest *)self messageGroupsAtIndex:i];
        [v21 addMessageGroups:v8];
      }
    }
  }
  if ([(ATXPBUserNotificationDigest *)self highlightedGroupsCount])
  {
    [v21 clearHighlightedGroups];
    unint64_t v9 = [(ATXPBUserNotificationDigest *)self highlightedGroupsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(ATXPBUserNotificationDigest *)self highlightedGroupsAtIndex:j];
        [v21 addHighlightedGroups:v12];
      }
    }
  }
  if ([(ATXPBUserNotificationDigest *)self rankedGroupsCount])
  {
    [v21 clearRankedGroups];
    unint64_t v13 = [(ATXPBUserNotificationDigest *)self rankedGroupsCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        uint64_t v16 = [(ATXPBUserNotificationDigest *)self rankedGroupsAtIndex:k];
        [v21 addRankedGroups:v16];
      }
    }
  }
  if (self->_uuid) {
    objc_msgSend(v21, "setUuid:");
  }
  if (self->_rankerId) {
    objc_msgSend(v21, "setRankerId:");
  }
  if (self->_modeId) {
    objc_msgSend(v21, "setModeId:");
  }
  if (self->_sharedEngagementTracker) {
    objc_msgSend(v21, "setSharedEngagementTracker:");
  }
  if (self->_digestTimeline) {
    objc_msgSend(v21, "setDigestTimeline:");
  }
  if ([(ATXPBUserNotificationDigest *)self appDigestsCount])
  {
    [v21 clearAppDigests];
    unint64_t v17 = [(ATXPBUserNotificationDigest *)self appDigestsCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t m = 0; m != v18; ++m)
      {
        v20 = [(ATXPBUserNotificationDigest *)self appDigestsAtIndex:m];
        [v21 addAppDigests:v20];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 88) |= 1u;
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v7 = self->_messageGroups;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v54 objects:v61 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v55;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v55 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v54 + 1) + 8 * v11) copyWithZone:a3];
        [v6 addMessageGroups:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v54 objects:v61 count:16];
    }
    while (v9);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  unint64_t v13 = self->_highlightedGroups;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v50 objects:v60 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v51;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v51 != v16) {
          objc_enumerationMutation(v13);
        }
        unint64_t v18 = (void *)[*(id *)(*((void *)&v50 + 1) + 8 * v17) copyWithZone:a3];
        [v6 addHighlightedGroups:v18];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v50 objects:v60 count:16];
    }
    while (v15);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v19 = self->_rankedGroups;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v46 objects:v59 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v47;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v47 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = (void *)[*(id *)(*((void *)&v46 + 1) + 8 * v23) copyWithZone:a3];
        [v6 addRankedGroups:v24];

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v46 objects:v59 count:16];
    }
    while (v21);
  }

  uint64_t v25 = [(NSString *)self->_uuid copyWithZone:a3];
  long long v26 = (void *)v6[10];
  v6[10] = v25;

  uint64_t v27 = [(NSString *)self->_rankerId copyWithZone:a3];
  long long v28 = (void *)v6[8];
  v6[8] = v27;

  uint64_t v29 = [(NSString *)self->_modeId copyWithZone:a3];
  long long v30 = (void *)v6[6];
  v6[6] = v29;

  id v31 = [(ATXPBSharedDigestEngagementTrackingMetrics *)self->_sharedEngagementTracker copyWithZone:a3];
  long long v32 = (void *)v6[9];
  v6[9] = v31;

  id v33 = [(ATXPBDigestTimeline *)self->_digestTimeline copyWithZone:a3];
  long long v34 = (void *)v6[3];
  v6[3] = v33;

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v35 = self->_appDigests;
  uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v42 objects:v58 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v43;
    do
    {
      uint64_t v39 = 0;
      do
      {
        if (*(void *)v43 != v38) {
          objc_enumerationMutation(v35);
        }
        long long v40 = objc_msgSend(*(id *)(*((void *)&v42 + 1) + 8 * v39), "copyWithZone:", a3, (void)v42);
        [v6 addAppDigests:v40];

        ++v39;
      }
      while (v37 != v39);
      uint64_t v37 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v42 objects:v58 count:16];
    }
    while (v37);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 88) & 1) == 0 || self->_timestamp != *((double *)v4 + 1)) {
      goto LABEL_25;
    }
  }
  else if (*((unsigned char *)v4 + 88))
  {
LABEL_25:
    char v14 = 0;
    goto LABEL_26;
  }
  messageGroups = self->_messageGroups;
  if ((unint64_t)messageGroups | *((void *)v4 + 5)
    && !-[NSMutableArray isEqual:](messageGroups, "isEqual:"))
  {
    goto LABEL_25;
  }
  highlightedGroups = self->_highlightedGroups;
  if ((unint64_t)highlightedGroups | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](highlightedGroups, "isEqual:")) {
      goto LABEL_25;
    }
  }
  rankedGroups = self->_rankedGroups;
  if ((unint64_t)rankedGroups | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](rankedGroups, "isEqual:")) {
      goto LABEL_25;
    }
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](uuid, "isEqual:")) {
      goto LABEL_25;
    }
  }
  rankerId = self->_rankerId;
  if ((unint64_t)rankerId | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](rankerId, "isEqual:")) {
      goto LABEL_25;
    }
  }
  modeId = self->_modeId;
  if ((unint64_t)modeId | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](modeId, "isEqual:")) {
      goto LABEL_25;
    }
  }
  sharedEngagementTracker = self->_sharedEngagementTracker;
  if ((unint64_t)sharedEngagementTracker | *((void *)v4 + 9))
  {
    if (!-[ATXPBSharedDigestEngagementTrackingMetrics isEqual:](sharedEngagementTracker, "isEqual:")) {
      goto LABEL_25;
    }
  }
  digestTimeline = self->_digestTimeline;
  if ((unint64_t)digestTimeline | *((void *)v4 + 3))
  {
    if (!-[ATXPBDigestTimeline isEqual:](digestTimeline, "isEqual:")) {
      goto LABEL_25;
    }
  }
  appDigests = self->_appDigests;
  if ((unint64_t)appDigests | *((void *)v4 + 2)) {
    char v14 = -[NSMutableArray isEqual:](appDigests, "isEqual:");
  }
  else {
    char v14 = 1;
  }
LABEL_26:

  return v14;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    double timestamp = self->_timestamp;
    double v5 = -timestamp;
    if (timestamp >= 0.0) {
      double v5 = self->_timestamp;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  uint64_t v8 = [(NSMutableArray *)self->_messageGroups hash] ^ v3;
  uint64_t v9 = [(NSMutableArray *)self->_highlightedGroups hash];
  uint64_t v10 = v8 ^ v9 ^ [(NSMutableArray *)self->_rankedGroups hash];
  NSUInteger v11 = [(NSString *)self->_uuid hash];
  NSUInteger v12 = v11 ^ [(NSString *)self->_rankerId hash];
  NSUInteger v13 = v10 ^ v12 ^ [(NSString *)self->_modeId hash];
  unint64_t v14 = [(ATXPBSharedDigestEngagementTrackingMetrics *)self->_sharedEngagementTracker hash];
  unint64_t v15 = v14 ^ [(ATXPBDigestTimeline *)self->_digestTimeline hash];
  return v13 ^ v15 ^ [(NSMutableArray *)self->_appDigests hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = (id *)v4;
  if (*((unsigned char *)v4 + 88))
  {
    self->_double timestamp = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v6 = *((id *)v4 + 5);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v42 objects:v49 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v43 != v9) {
          objc_enumerationMutation(v6);
        }
        [(ATXPBUserNotificationDigest *)self addMessageGroups:*(void *)(*((void *)&v42 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v42 objects:v49 count:16];
    }
    while (v8);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v11 = v5[4];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v38 objects:v48 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v39 != v14) {
          objc_enumerationMutation(v11);
        }
        [(ATXPBUserNotificationDigest *)self addHighlightedGroups:*(void *)(*((void *)&v38 + 1) + 8 * j)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v38 objects:v48 count:16];
    }
    while (v13);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v16 = v5[7];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v47 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v35;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v35 != v19) {
          objc_enumerationMutation(v16);
        }
        [(ATXPBUserNotificationDigest *)self addRankedGroups:*(void *)(*((void *)&v34 + 1) + 8 * k)];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v34 objects:v47 count:16];
    }
    while (v18);
  }

  if (v5[10]) {
    -[ATXPBUserNotificationDigest setUuid:](self, "setUuid:");
  }
  if (v5[8]) {
    -[ATXPBUserNotificationDigest setRankerId:](self, "setRankerId:");
  }
  if (v5[6]) {
    -[ATXPBUserNotificationDigest setModeId:](self, "setModeId:");
  }
  sharedEngagementTracker = self->_sharedEngagementTracker;
  id v22 = v5[9];
  if (sharedEngagementTracker)
  {
    if (v22) {
      -[ATXPBSharedDigestEngagementTrackingMetrics mergeFrom:](sharedEngagementTracker, "mergeFrom:");
    }
  }
  else if (v22)
  {
    -[ATXPBUserNotificationDigest setSharedEngagementTracker:](self, "setSharedEngagementTracker:");
  }
  digestTimeline = self->_digestTimeline;
  id v24 = v5[3];
  if (digestTimeline)
  {
    if (v24) {
      -[ATXPBDigestTimeline mergeFrom:](digestTimeline, "mergeFrom:");
    }
  }
  else if (v24)
  {
    -[ATXPBUserNotificationDigest setDigestTimeline:](self, "setDigestTimeline:");
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v25 = v5[2];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v30 objects:v46 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v31;
    do
    {
      for (uint64_t m = 0; m != v27; ++m)
      {
        if (*(void *)v31 != v28) {
          objc_enumerationMutation(v25);
        }
        -[ATXPBUserNotificationDigest addAppDigests:](self, "addAppDigests:", *(void *)(*((void *)&v30 + 1) + 8 * m), (void)v30);
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v30 objects:v46 count:16];
    }
    while (v27);
  }
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

- (NSString)rankerId
{
  return self->_rankerId;
}

- (void)setRankerId:(id)a3
{
}

- (NSString)modeId
{
  return self->_modeId;
}

- (void)setModeId:(id)a3
{
}

- (NSMutableArray)messageGroups
{
  return self->_messageGroups;
}

- (void)setMessageGroups:(id)a3
{
}

- (NSMutableArray)highlightedGroups
{
  return self->_highlightedGroups;
}

- (void)setHighlightedGroups:(id)a3
{
}

- (NSMutableArray)rankedGroups
{
  return self->_rankedGroups;
}

- (void)setRankedGroups:(id)a3
{
}

- (NSMutableArray)appDigests
{
  return self->_appDigests;
}

- (void)setAppDigests:(id)a3
{
}

- (ATXPBSharedDigestEngagementTrackingMetrics)sharedEngagementTracker
{
  return self->_sharedEngagementTracker;
}

- (void)setSharedEngagementTracker:(id)a3
{
}

- (ATXPBDigestTimeline)digestTimeline
{
  return self->_digestTimeline;
}

- (void)setDigestTimeline:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_sharedEngagementTracker, 0);
  objc_storeStrong((id *)&self->_rankerId, 0);
  objc_storeStrong((id *)&self->_rankedGroups, 0);
  objc_storeStrong((id *)&self->_modeId, 0);
  objc_storeStrong((id *)&self->_messageGroups, 0);
  objc_storeStrong((id *)&self->_highlightedGroups, 0);
  objc_storeStrong((id *)&self->_digestTimeline, 0);

  objc_storeStrong((id *)&self->_appDigests, 0);
}

- (id)initFromJSON:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(ATXPBUserNotificationDigest *)self init];
  if (v5)
  {
    id v6 = v4;
    uint64_t v7 = [v6 objectForKeyedSubscript:@"timestamp"];
    [v7 doubleValue];
    -[ATXPBUserNotificationDigest setTimestamp:](v5, "setTimestamp:");

    uint64_t v8 = [v6 objectForKeyedSubscript:@"uuid"];
    uint64_t v9 = +[ATXJSONHelper unwrapObject:v8];
    [(ATXPBUserNotificationDigest *)v5 setUuid:v9];

    uint64_t v10 = [v6 objectForKeyedSubscript:@"rankerId"];
    id v11 = +[ATXJSONHelper unwrapObject:v10];
    [(ATXPBUserNotificationDigest *)v5 setRankerId:v11];

    uint64_t v12 = [v6 objectForKeyedSubscript:@"modeId"];
    uint64_t v13 = +[ATXJSONHelper unwrapObject:v12];
    [(ATXPBUserNotificationDigest *)v5 setModeId:v13];

    uint64_t v14 = [v6 objectForKeyedSubscript:@"sharedDigestEngagementTracker"];
    unint64_t v15 = +[ATXJSONHelper unwrapObject:v14];

    if (v15)
    {
      id v16 = [ATXPBSharedDigestEngagementTrackingMetrics alloc];
      uint64_t v17 = [v6 objectForKeyedSubscript:@"sharedDigestEngagementTracker"];
      uint64_t v18 = +[ATXJSONHelper unwrapObject:v17];
      id v19 = [(ATXPBSharedDigestEngagementTrackingMetrics *)v16 initFromJSON:v18];
      [(ATXPBUserNotificationDigest *)v5 setSharedEngagementTracker:v19];
    }
    id v52 = v4;
    uint64_t v20 = [v6 objectForKeyedSubscript:@"digestTimeline"];
    uint64_t v21 = +[ATXJSONHelper unwrapObject:v20];

    if (v21)
    {
      id v22 = [ATXPBDigestTimeline alloc];
      uint64_t v23 = [v6 objectForKeyedSubscript:@"digestTimeline"];
      id v24 = +[ATXJSONHelper unwrapObject:v23];
      id v25 = [(ATXPBDigestTimeline *)v22 initFromJSON:v24];
      [(ATXPBUserNotificationDigest *)v5 setDigestTimeline:v25];
    }
    uint64_t v26 = [v6 objectForKeyedSubscript:@"messageGroups"];
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v65 objects:v72 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v66;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v66 != v29) {
            objc_enumerationMutation(v26);
          }
          id v31 = [[ATXPBUserNotificationDigestNotificationGroup alloc] initFromJSON:*(void *)(*((void *)&v65 + 1) + 8 * v30)];
          [(ATXPBUserNotificationDigest *)v5 addMessageGroups:v31];

          ++v30;
        }
        while (v28 != v30);
        uint64_t v28 = [v26 countByEnumeratingWithState:&v65 objects:v72 count:16];
      }
      while (v28);
    }
    long long v32 = [v6 objectForKeyedSubscript:@"highlightedGroups"];
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v61 objects:v71 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v62;
      do
      {
        uint64_t v36 = 0;
        do
        {
          if (*(void *)v62 != v35) {
            objc_enumerationMutation(v32);
          }
          id v37 = [[ATXPBUserNotificationDigestNotificationGroup alloc] initFromJSON:*(void *)(*((void *)&v61 + 1) + 8 * v36)];
          [(ATXPBUserNotificationDigest *)v5 addHighlightedGroups:v37];

          ++v36;
        }
        while (v34 != v36);
        uint64_t v34 = [v32 countByEnumeratingWithState:&v61 objects:v71 count:16];
      }
      while (v34);
    }
    long long v38 = [v6 objectForKeyedSubscript:@"rankedGroups"];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    uint64_t v39 = [v38 countByEnumeratingWithState:&v57 objects:v70 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v58;
      do
      {
        uint64_t v42 = 0;
        do
        {
          if (*(void *)v58 != v41) {
            objc_enumerationMutation(v38);
          }
          id v43 = [[ATXPBUserNotificationDigestNotificationGroup alloc] initFromJSON:*(void *)(*((void *)&v57 + 1) + 8 * v42)];
          [(ATXPBUserNotificationDigest *)v5 addRankedGroups:v43];

          ++v42;
        }
        while (v40 != v42);
        uint64_t v40 = [v38 countByEnumeratingWithState:&v57 objects:v70 count:16];
      }
      while (v40);
    }
    long long v44 = objc_msgSend(v6, "objectForKeyedSubscript:", @"appDigests", v6);
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    uint64_t v45 = [v44 countByEnumeratingWithState:&v53 objects:v69 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v54;
      do
      {
        uint64_t v48 = 0;
        do
        {
          if (*(void *)v54 != v47) {
            objc_enumerationMutation(v44);
          }
          id v49 = [[ATXPBUserNotificationAppDigest alloc] initFromJSON:*(void *)(*((void *)&v53 + 1) + 8 * v48)];
          [(ATXPBUserNotificationDigest *)v5 addAppDigests:v49];

          ++v48;
        }
        while (v46 != v48);
        uint64_t v46 = [v44 countByEnumeratingWithState:&v53 objects:v69 count:16];
      }
      while (v46);
    }

    id v4 = v52;
  }

  return v5;
}

- (id)jsonRepresentation
{
  v25[10] = *MEMORY[0x1E4F143B8];
  v24[0] = @"timestamp";
  uint64_t v23 = [NSNumber numberWithDouble:self->_timestamp];
  id v22 = +[ATXJSONHelper wrapObject:v23];
  v25[0] = v22;
  v24[1] = @"uuid";
  uint64_t v21 = +[ATXJSONHelper wrapObject:self->_uuid];
  v25[1] = v21;
  v24[2] = @"rankerId";
  uint64_t v20 = +[ATXJSONHelper wrapObject:self->_rankerId];
  v25[2] = v20;
  v24[3] = @"modeId";
  id v19 = +[ATXJSONHelper wrapObject:self->_modeId];
  v25[3] = v19;
  v24[4] = @"sharedDigestEngagementTracker";
  uint64_t v18 = [(ATXPBUserNotificationDigest *)self sharedEngagementTracker];
  uint64_t v17 = [v18 jsonRepresentation];
  id v16 = +[ATXJSONHelper wrapObject:v17];
  v25[4] = v16;
  v24[5] = @"digestTimeline";
  unint64_t v15 = [(ATXPBUserNotificationDigest *)self digestTimeline];
  uint64_t v14 = [v15 jsonRepresentation];
  unint64_t v3 = +[ATXJSONHelper wrapObject:v14];
  v25[5] = v3;
  v24[6] = @"messageGroups";
  id v4 = [(NSMutableArray *)self->_messageGroups _pas_mappedArrayWithTransform:&__block_literal_global_84];
  double v5 = +[ATXJSONHelper wrapObject:v4];
  v25[6] = v5;
  v24[7] = @"highlightedGroups";
  id v6 = [(NSMutableArray *)self->_highlightedGroups _pas_mappedArrayWithTransform:&__block_literal_global_35_1];
  uint64_t v7 = +[ATXJSONHelper wrapObject:v6];
  v25[7] = v7;
  v24[8] = @"rankedGroups";
  uint64_t v8 = [(NSMutableArray *)self->_rankedGroups _pas_mappedArrayWithTransform:&__block_literal_global_37_1];
  uint64_t v9 = +[ATXJSONHelper wrapObject:v8];
  v25[8] = v9;
  v24[9] = @"appDigests";
  uint64_t v10 = [(NSMutableArray *)self->_appDigests _pas_mappedArrayWithTransform:&__block_literal_global_40_2];
  id v11 = +[ATXJSONHelper wrapObject:v10];
  v25[9] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:10];

  return v12;
}

uint64_t __55__ATXPBUserNotificationDigest_JSON__jsonRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 jsonRepresentation];
}

uint64_t __55__ATXPBUserNotificationDigest_JSON__jsonRepresentation__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 jsonRepresentation];
}

uint64_t __55__ATXPBUserNotificationDigest_JSON__jsonRepresentation__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 jsonRepresentation];
}

uint64_t __55__ATXPBUserNotificationDigest_JSON__jsonRepresentation__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 jsonRepresentation];
}

@end