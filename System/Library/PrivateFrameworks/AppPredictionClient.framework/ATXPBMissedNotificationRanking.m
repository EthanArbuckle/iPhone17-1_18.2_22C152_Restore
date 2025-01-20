@interface ATXPBMissedNotificationRanking
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
- (NSMutableArray)rankedGroups;
- (NSString)modeId;
- (NSString)rankerId;
- (NSString)uuid;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)initFromJSON:(id)a3;
- (id)jsonRepresentation;
- (id)rankedGroupsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)rankedGroupsCount;
- (void)addRankedGroups:(id)a3;
- (void)clearRankedGroups;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDigestTimeline:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setModeId:(id)a3;
- (void)setRankedGroups:(id)a3;
- (void)setRankerId:(id)a3;
- (void)setSharedEngagementTracker:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBMissedNotificationRanking

- (id)initFromJSON:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(ATXPBMissedNotificationRanking *)self init];
  if (v5)
  {
    id v6 = v4;
    v7 = [v6 objectForKeyedSubscript:@"timestamp"];
    [v7 doubleValue];
    -[ATXPBMissedNotificationRanking setTimestamp:](v5, "setTimestamp:");

    v8 = [v6 objectForKeyedSubscript:@"uuid"];
    v9 = +[ATXJSONHelper unwrapObject:v8];
    [(ATXPBMissedNotificationRanking *)v5 setUuid:v9];

    v10 = [v6 objectForKeyedSubscript:@"rankerId"];
    v11 = +[ATXJSONHelper unwrapObject:v10];
    [(ATXPBMissedNotificationRanking *)v5 setRankerId:v11];

    v12 = [v6 objectForKeyedSubscript:@"modeId"];
    v13 = +[ATXJSONHelper unwrapObject:v12];
    [(ATXPBMissedNotificationRanking *)v5 setModeId:v13];

    v14 = [v6 objectForKeyedSubscript:@"sharedDigestEngagementTracker"];
    v15 = +[ATXJSONHelper unwrapObject:v14];

    if (v15)
    {
      v16 = [ATXPBSharedDigestEngagementTrackingMetrics alloc];
      v17 = [v6 objectForKeyedSubscript:@"sharedDigestEngagementTracker"];
      v18 = +[ATXJSONHelper unwrapObject:v17];
      id v19 = [(ATXPBSharedDigestEngagementTrackingMetrics *)v16 initFromJSON:v18];
      [(ATXPBMissedNotificationRanking *)v5 setSharedEngagementTracker:v19];
    }
    v20 = [v6 objectForKeyedSubscript:@"digestTimeline"];
    v21 = +[ATXJSONHelper unwrapObject:v20];

    if (v21)
    {
      v22 = [ATXPBDigestTimeline alloc];
      v23 = [v6 objectForKeyedSubscript:@"digestTimeline"];
      v24 = +[ATXJSONHelper unwrapObject:v23];
      id v25 = [(ATXPBDigestTimeline *)v22 initFromJSON:v24];
      [(ATXPBMissedNotificationRanking *)v5 setDigestTimeline:v25];
    }
    v26 = [v6 objectForKeyedSubscript:@"rankedGroups"];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v34;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v34 != v29) {
            objc_enumerationMutation(v26);
          }
          id v31 = [[ATXPBUserNotificationDigestNotificationGroup alloc] initFromJSON:*(void *)(*((void *)&v33 + 1) + 8 * v30)];
          [(ATXPBMissedNotificationRanking *)v5 addRankedGroups:v31];

          ++v30;
        }
        while (v28 != v30);
        uint64_t v28 = [v26 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v28);
    }
  }
  return v5;
}

- (id)jsonRepresentation
{
  v19[7] = *MEMORY[0x1E4F143B8];
  v18[0] = @"timestamp";
  v17 = [NSNumber numberWithDouble:self->_timestamp];
  v16 = +[ATXJSONHelper wrapObject:v17];
  v19[0] = v16;
  v18[1] = @"uuid";
  v15 = +[ATXJSONHelper wrapObject:self->_uuid];
  v19[1] = v15;
  v18[2] = @"rankerId";
  v14 = +[ATXJSONHelper wrapObject:self->_rankerId];
  v19[2] = v14;
  v18[3] = @"modeId";
  v3 = +[ATXJSONHelper wrapObject:self->_modeId];
  v19[3] = v3;
  v18[4] = @"sharedDigestEngagementTracker";
  id v4 = [(ATXPBMissedNotificationRanking *)self sharedEngagementTracker];
  v5 = [v4 jsonRepresentation];
  id v6 = +[ATXJSONHelper wrapObject:v5];
  v19[4] = v6;
  v18[5] = @"digestTimeline";
  v7 = [(ATXPBMissedNotificationRanking *)self digestTimeline];
  v8 = [v7 jsonRepresentation];
  v9 = +[ATXJSONHelper wrapObject:v8];
  v19[5] = v9;
  v18[6] = @"rankedGroups";
  v10 = [(NSMutableArray *)self->_rankedGroups _pas_mappedArrayWithTransform:&__block_literal_global_10];
  v11 = +[ATXJSONHelper wrapObject:v10];
  v19[6] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:7];

  return v12;
}

uint64_t __58__ATXPBMissedNotificationRanking_JSON__jsonRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 jsonRepresentation];
}

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
    id v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
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
  v8.super_class = (Class)ATXPBMissedNotificationRanking;
  id v4 = [(ATXPBMissedNotificationRanking *)&v8 description];
  v5 = [(ATXPBMissedNotificationRanking *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
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
  if ([(NSMutableArray *)self->_rankedGroups count])
  {
    objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_rankedGroups, "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v9 = self->_rankedGroups;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "dictionaryRepresentation", (void)v20);
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKey:@"rankedGroups"];
  }
  sharedEngagementTracker = self->_sharedEngagementTracker;
  if (sharedEngagementTracker)
  {
    v16 = [(ATXPBSharedDigestEngagementTrackingMetrics *)sharedEngagementTracker dictionaryRepresentation];
    [v3 setObject:v16 forKey:@"sharedEngagementTracker"];
  }
  digestTimeline = self->_digestTimeline;
  if (digestTimeline)
  {
    v18 = [(ATXPBDigestTimeline *)digestTimeline dictionaryRepresentation];
    [v3 setObject:v18 forKey:@"digestTimeline"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBMissedNotificationRankingReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_rankedGroups;
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
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = *(void *)&self->_timestamp;
    *((unsigned char *)v4 + 64) |= 1u;
  }
  id v10 = v4;
  if ([(ATXPBMissedNotificationRanking *)self rankedGroupsCount])
  {
    [v10 clearRankedGroups];
    unint64_t v5 = [(ATXPBMissedNotificationRanking *)self rankedGroupsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(ATXPBMissedNotificationRanking *)self rankedGroupsAtIndex:i];
        [v10 addRankedGroups:v8];
      }
    }
  }
  if (self->_uuid) {
    objc_msgSend(v10, "setUuid:");
  }
  uint64_t v9 = v10;
  if (self->_rankerId)
  {
    objc_msgSend(v10, "setRankerId:");
    uint64_t v9 = v10;
  }
  if (self->_modeId)
  {
    objc_msgSend(v10, "setModeId:");
    uint64_t v9 = v10;
  }
  if (self->_sharedEngagementTracker)
  {
    objc_msgSend(v10, "setSharedEngagementTracker:");
    uint64_t v9 = v10;
  }
  if (self->_digestTimeline)
  {
    objc_msgSend(v10, "setDigestTimeline:");
    uint64_t v9 = v10;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v7 = self->_rankedGroups;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v11), "copyWithZone:", a3, (void)v24);
        [v6 addRankedGroups:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v9);
  }

  uint64_t v13 = [(NSString *)self->_uuid copyWithZone:a3];
  v14 = (void *)v6[7];
  v6[7] = v13;

  uint64_t v15 = [(NSString *)self->_rankerId copyWithZone:a3];
  v16 = (void *)v6[5];
  v6[5] = v15;

  uint64_t v17 = [(NSString *)self->_modeId copyWithZone:a3];
  v18 = (void *)v6[3];
  v6[3] = v17;

  id v19 = [(ATXPBSharedDigestEngagementTrackingMetrics *)self->_sharedEngagementTracker copyWithZone:a3];
  long long v20 = (void *)v6[6];
  v6[6] = v19;

  id v21 = [(ATXPBDigestTimeline *)self->_digestTimeline copyWithZone:a3];
  long long v22 = (void *)v6[2];
  v6[2] = v21;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_timestamp != *((double *)v4 + 1)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_19:
    char v11 = 0;
    goto LABEL_20;
  }
  rankedGroups = self->_rankedGroups;
  if ((unint64_t)rankedGroups | *((void *)v4 + 4)
    && !-[NSMutableArray isEqual:](rankedGroups, "isEqual:"))
  {
    goto LABEL_19;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](uuid, "isEqual:")) {
      goto LABEL_19;
    }
  }
  rankerId = self->_rankerId;
  if ((unint64_t)rankerId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](rankerId, "isEqual:")) {
      goto LABEL_19;
    }
  }
  modeId = self->_modeId;
  if ((unint64_t)modeId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](modeId, "isEqual:")) {
      goto LABEL_19;
    }
  }
  sharedEngagementTracker = self->_sharedEngagementTracker;
  if ((unint64_t)sharedEngagementTracker | *((void *)v4 + 6))
  {
    if (!-[ATXPBSharedDigestEngagementTrackingMetrics isEqual:](sharedEngagementTracker, "isEqual:")) {
      goto LABEL_19;
    }
  }
  digestTimeline = self->_digestTimeline;
  if ((unint64_t)digestTimeline | *((void *)v4 + 2)) {
    char v11 = -[ATXPBDigestTimeline isEqual:](digestTimeline, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_20:

  return v11;
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
  uint64_t v8 = [(NSMutableArray *)self->_rankedGroups hash] ^ v3;
  NSUInteger v9 = [(NSString *)self->_uuid hash];
  NSUInteger v10 = v8 ^ v9 ^ [(NSString *)self->_rankerId hash];
  NSUInteger v11 = [(NSString *)self->_modeId hash];
  unint64_t v12 = v11 ^ [(ATXPBSharedDigestEngagementTrackingMetrics *)self->_sharedEngagementTracker hash];
  return v10 ^ v12 ^ [(ATXPBDigestTimeline *)self->_digestTimeline hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = v4;
  if (*((unsigned char *)v4 + 64))
  {
    self->_double timestamp = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = *((id *)v4 + 4);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        -[ATXPBMissedNotificationRanking addRankedGroups:](self, "addRankedGroups:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  if (v5[7]) {
    -[ATXPBMissedNotificationRanking setUuid:](self, "setUuid:");
  }
  if (v5[5]) {
    -[ATXPBMissedNotificationRanking setRankerId:](self, "setRankerId:");
  }
  if (v5[3]) {
    -[ATXPBMissedNotificationRanking setModeId:](self, "setModeId:");
  }
  sharedEngagementTracker = self->_sharedEngagementTracker;
  uint64_t v12 = v5[6];
  if (sharedEngagementTracker)
  {
    if (v12) {
      -[ATXPBSharedDigestEngagementTrackingMetrics mergeFrom:](sharedEngagementTracker, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[ATXPBMissedNotificationRanking setSharedEngagementTracker:](self, "setSharedEngagementTracker:");
  }
  digestTimeline = self->_digestTimeline;
  uint64_t v14 = v5[2];
  if (digestTimeline)
  {
    if (v14) {
      -[ATXPBDigestTimeline mergeFrom:](digestTimeline, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[ATXPBMissedNotificationRanking setDigestTimeline:](self, "setDigestTimeline:");
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

- (NSMutableArray)rankedGroups
{
  return self->_rankedGroups;
}

- (void)setRankedGroups:(id)a3
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

  objc_storeStrong((id *)&self->_digestTimeline, 0);
}

@end