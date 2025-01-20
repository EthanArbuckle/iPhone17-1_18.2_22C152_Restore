@interface BMPBGroupActivitySessionEvent
+ (Class)memberHandlesType;
+ (Class)participantHandlesType;
- (BOOL)hasActivityId;
- (BOOL)hasActivitySessionId;
- (BOOL)hasExperienceType;
- (BOOL)hasIsActive;
- (BOOL)hasMessagesChatGuid;
- (BOOL)hasSourceBundleId;
- (BOOL)isActive;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)memberHandles;
- (NSMutableArray)participantHandles;
- (NSString)activityId;
- (NSString)activitySessionId;
- (NSString)experienceType;
- (NSString)messagesChatGuid;
- (NSString)sourceBundleId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)memberHandlesAtIndex:(unint64_t)a3;
- (id)participantHandlesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)memberHandlesCount;
- (unint64_t)participantHandlesCount;
- (void)addMemberHandles:(id)a3;
- (void)addParticipantHandles:(id)a3;
- (void)clearMemberHandles;
- (void)clearParticipantHandles;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivityId:(id)a3;
- (void)setActivitySessionId:(id)a3;
- (void)setExperienceType:(id)a3;
- (void)setHasIsActive:(BOOL)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setMemberHandles:(id)a3;
- (void)setMessagesChatGuid:(id)a3;
- (void)setParticipantHandles:(id)a3;
- (void)setSourceBundleId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBGroupActivitySessionEvent

- (void)setIsActive:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isActive = a3;
}

- (void)setHasIsActive:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsActive
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasSourceBundleId
{
  return self->_sourceBundleId != 0;
}

- (BOOL)hasActivitySessionId
{
  return self->_activitySessionId != 0;
}

- (BOOL)hasActivityId
{
  return self->_activityId != 0;
}

- (BOOL)hasMessagesChatGuid
{
  return self->_messagesChatGuid != 0;
}

- (BOOL)hasExperienceType
{
  return self->_experienceType != 0;
}

- (void)clearParticipantHandles
{
}

- (void)addParticipantHandles:(id)a3
{
  id v4 = a3;
  participantHandles = self->_participantHandles;
  id v8 = v4;
  if (!participantHandles)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_participantHandles;
    self->_participantHandles = v6;

    id v4 = v8;
    participantHandles = self->_participantHandles;
  }
  [(NSMutableArray *)participantHandles addObject:v4];
}

- (unint64_t)participantHandlesCount
{
  return [(NSMutableArray *)self->_participantHandles count];
}

- (id)participantHandlesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_participantHandles objectAtIndex:a3];
}

+ (Class)participantHandlesType
{
  return (Class)objc_opt_class();
}

- (void)clearMemberHandles
{
}

- (void)addMemberHandles:(id)a3
{
  id v4 = a3;
  memberHandles = self->_memberHandles;
  id v8 = v4;
  if (!memberHandles)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_memberHandles;
    self->_memberHandles = v6;

    id v4 = v8;
    memberHandles = self->_memberHandles;
  }
  [(NSMutableArray *)memberHandles addObject:v4];
}

- (unint64_t)memberHandlesCount
{
  return [(NSMutableArray *)self->_memberHandles count];
}

- (id)memberHandlesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_memberHandles objectAtIndex:a3];
}

+ (Class)memberHandlesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBGroupActivitySessionEvent;
  id v4 = [(BMPBGroupActivitySessionEvent *)&v8 description];
  v5 = [(BMPBGroupActivitySessionEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithBool:self->_isActive];
    [v3 setObject:v4 forKey:@"isActive"];
  }
  sourceBundleId = self->_sourceBundleId;
  if (sourceBundleId) {
    [v3 setObject:sourceBundleId forKey:@"sourceBundleId"];
  }
  activitySessionId = self->_activitySessionId;
  if (activitySessionId) {
    [v3 setObject:activitySessionId forKey:@"activitySessionId"];
  }
  activityId = self->_activityId;
  if (activityId) {
    [v3 setObject:activityId forKey:@"activityId"];
  }
  messagesChatGuid = self->_messagesChatGuid;
  if (messagesChatGuid) {
    [v3 setObject:messagesChatGuid forKey:@"messagesChatGuid"];
  }
  experienceType = self->_experienceType;
  if (experienceType) {
    [v3 setObject:experienceType forKey:@"experienceType"];
  }
  participantHandles = self->_participantHandles;
  if (participantHandles) {
    [v3 setObject:participantHandles forKey:@"participantHandles"];
  }
  memberHandles = self->_memberHandles;
  if (memberHandles) {
    [v3 setObject:memberHandles forKey:@"memberHandles"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBGroupActivitySessionEventReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_sourceBundleId) {
    PBDataWriterWriteStringField();
  }
  if (self->_activitySessionId) {
    PBDataWriterWriteStringField();
  }
  if (self->_activityId) {
    PBDataWriterWriteStringField();
  }
  if (self->_messagesChatGuid) {
    PBDataWriterWriteStringField();
  }
  if (self->_experienceType) {
    PBDataWriterWriteStringField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_participantHandles;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_memberHandles;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[64] = self->_isActive;
    v4[68] |= 1u;
  }
  id v13 = v4;
  if (self->_sourceBundleId) {
    objc_msgSend(v4, "setSourceBundleId:");
  }
  if (self->_activitySessionId) {
    objc_msgSend(v13, "setActivitySessionId:");
  }
  if (self->_activityId) {
    objc_msgSend(v13, "setActivityId:");
  }
  if (self->_messagesChatGuid) {
    objc_msgSend(v13, "setMessagesChatGuid:");
  }
  if (self->_experienceType) {
    objc_msgSend(v13, "setExperienceType:");
  }
  if ([(BMPBGroupActivitySessionEvent *)self participantHandlesCount])
  {
    [v13 clearParticipantHandles];
    unint64_t v5 = [(BMPBGroupActivitySessionEvent *)self participantHandlesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(BMPBGroupActivitySessionEvent *)self participantHandlesAtIndex:i];
        [v13 addParticipantHandles:v8];
      }
    }
  }
  if ([(BMPBGroupActivitySessionEvent *)self memberHandlesCount])
  {
    [v13 clearMemberHandles];
    unint64_t v9 = [(BMPBGroupActivitySessionEvent *)self memberHandlesCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(BMPBGroupActivitySessionEvent *)self memberHandlesAtIndex:j];
        [v13 addMemberHandles:v12];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 64) = self->_isActive;
    *(unsigned char *)(v5 + 68) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_sourceBundleId copyWithZone:a3];
  uint64_t v8 = (void *)v6[7];
  v6[7] = v7;

  uint64_t v9 = [(NSString *)self->_activitySessionId copyWithZone:a3];
  unint64_t v10 = (void *)v6[2];
  v6[2] = v9;

  uint64_t v11 = [(NSString *)self->_activityId copyWithZone:a3];
  uint64_t v12 = (void *)v6[1];
  v6[1] = v11;

  uint64_t v13 = [(NSString *)self->_messagesChatGuid copyWithZone:a3];
  uint64_t v14 = (void *)v6[5];
  v6[5] = v13;

  uint64_t v15 = [(NSString *)self->_experienceType copyWithZone:a3];
  long long v16 = (void *)v6[3];
  v6[3] = v15;

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v17 = self->_participantHandles;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v35;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v35 != v20) {
          objc_enumerationMutation(v17);
        }
        long long v22 = (void *)[*(id *)(*((void *)&v34 + 1) + 8 * v21) copyWithZone:a3];
        [v6 addParticipantHandles:v22];

        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v19);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v23 = self->_memberHandles;
  uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v31;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v31 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * v27), "copyWithZone:", a3, (void)v30);
        [v6 addMemberHandles:v28];

        ++v27;
      }
      while (v25 != v27);
      uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v25);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 68))
    {
      if (self->_isActive)
      {
        if (!*((unsigned char *)v4 + 64)) {
          goto LABEL_24;
        }
        goto LABEL_10;
      }
      if (!*((unsigned char *)v4 + 64)) {
        goto LABEL_10;
      }
    }
LABEL_24:
    char v12 = 0;
    goto LABEL_25;
  }
  if (*((unsigned char *)v4 + 68)) {
    goto LABEL_24;
  }
LABEL_10:
  sourceBundleId = self->_sourceBundleId;
  if ((unint64_t)sourceBundleId | *((void *)v4 + 7)
    && !-[NSString isEqual:](sourceBundleId, "isEqual:"))
  {
    goto LABEL_24;
  }
  activitySessionId = self->_activitySessionId;
  if ((unint64_t)activitySessionId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](activitySessionId, "isEqual:")) {
      goto LABEL_24;
    }
  }
  activityId = self->_activityId;
  if ((unint64_t)activityId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](activityId, "isEqual:")) {
      goto LABEL_24;
    }
  }
  messagesChatGuid = self->_messagesChatGuid;
  if ((unint64_t)messagesChatGuid | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](messagesChatGuid, "isEqual:")) {
      goto LABEL_24;
    }
  }
  experienceType = self->_experienceType;
  if ((unint64_t)experienceType | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](experienceType, "isEqual:")) {
      goto LABEL_24;
    }
  }
  participantHandles = self->_participantHandles;
  if ((unint64_t)participantHandles | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](participantHandles, "isEqual:")) {
      goto LABEL_24;
    }
  }
  memberHandles = self->_memberHandles;
  if ((unint64_t)memberHandles | *((void *)v4 + 4)) {
    char v12 = -[NSMutableArray isEqual:](memberHandles, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_25:

  return v12;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_isActive;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_sourceBundleId hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_activitySessionId hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_activityId hash];
  NSUInteger v7 = [(NSString *)self->_messagesChatGuid hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_experienceType hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSMutableArray *)self->_participantHandles hash];
  return v9 ^ [(NSMutableArray *)self->_memberHandles hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  NSUInteger v4 = a3;
  id v5 = v4;
  if (v4[68])
  {
    self->_isActive = v4[64];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 7)) {
    -[BMPBGroupActivitySessionEvent setSourceBundleId:](self, "setSourceBundleId:");
  }
  if (*((void *)v5 + 2)) {
    -[BMPBGroupActivitySessionEvent setActivitySessionId:](self, "setActivitySessionId:");
  }
  if (*((void *)v5 + 1)) {
    -[BMPBGroupActivitySessionEvent setActivityId:](self, "setActivityId:");
  }
  if (*((void *)v5 + 5)) {
    -[BMPBGroupActivitySessionEvent setMessagesChatGuid:](self, "setMessagesChatGuid:");
  }
  if (*((void *)v5 + 3)) {
    -[BMPBGroupActivitySessionEvent setExperienceType:](self, "setExperienceType:");
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = *((id *)v5 + 6);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        [(BMPBGroupActivitySessionEvent *)self addParticipantHandles:*(void *)(*((void *)&v20 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = *((id *)v5 + 4);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        -[BMPBGroupActivitySessionEvent addMemberHandles:](self, "addMemberHandles:", *(void *)(*((void *)&v16 + 1) + 8 * j), (void)v16);
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (NSString)sourceBundleId
{
  return self->_sourceBundleId;
}

- (void)setSourceBundleId:(id)a3
{
}

- (NSString)activitySessionId
{
  return self->_activitySessionId;
}

- (void)setActivitySessionId:(id)a3
{
}

- (NSString)activityId
{
  return self->_activityId;
}

- (void)setActivityId:(id)a3
{
}

- (NSString)messagesChatGuid
{
  return self->_messagesChatGuid;
}

- (void)setMessagesChatGuid:(id)a3
{
}

- (NSString)experienceType
{
  return self->_experienceType;
}

- (void)setExperienceType:(id)a3
{
}

- (NSMutableArray)participantHandles
{
  return self->_participantHandles;
}

- (void)setParticipantHandles:(id)a3
{
}

- (NSMutableArray)memberHandles
{
  return self->_memberHandles;
}

- (void)setMemberHandles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceBundleId, 0);
  objc_storeStrong((id *)&self->_participantHandles, 0);
  objc_storeStrong((id *)&self->_messagesChatGuid, 0);
  objc_storeStrong((id *)&self->_memberHandles, 0);
  objc_storeStrong((id *)&self->_experienceType, 0);
  objc_storeStrong((id *)&self->_activitySessionId, 0);

  objc_storeStrong((id *)&self->_activityId, 0);
}

@end