@interface ATXPBBlendingSessionERMEvent
+ (Class)blendingUpdateUUIDType;
- (BOOL)hasConsumerSubType;
- (BOOL)hasEngagementType;
- (BOOL)hasExecutableId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)blendingUpdateUUIDs;
- (NSString)consumerSubType;
- (NSString)executableId;
- (id)blendingUpdateUUIDAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)engagementTypeAsString:(int)a3;
- (int)StringAsEngagementType:(id)a3;
- (int)engagementType;
- (unint64_t)blendingUpdateUUIDsCount;
- (unint64_t)hash;
- (void)addBlendingUpdateUUID:(id)a3;
- (void)clearBlendingUpdateUUIDs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBlendingUpdateUUIDs:(id)a3;
- (void)setConsumerSubType:(id)a3;
- (void)setEngagementType:(int)a3;
- (void)setExecutableId:(id)a3;
- (void)setHasEngagementType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBBlendingSessionERMEvent

- (BOOL)hasExecutableId
{
  return self->_executableId != 0;
}

- (int)engagementType
{
  if (*(unsigned char *)&self->_has) {
    return self->_engagementType;
  }
  else {
    return 0;
  }
}

- (void)setEngagementType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_engagementType = a3;
}

- (void)setHasEngagementType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEngagementType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)engagementTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E68B4068[a3];
  }
  return v3;
}

- (int)StringAsEngagementType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Engaged"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Rejected"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"NotShown"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"InferredEngagement"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"InferredRejected"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasConsumerSubType
{
  return self->_consumerSubType != 0;
}

- (void)clearBlendingUpdateUUIDs
{
}

- (void)addBlendingUpdateUUID:(id)a3
{
  id v4 = a3;
  blendingUpdateUUIDs = self->_blendingUpdateUUIDs;
  id v8 = v4;
  if (!blendingUpdateUUIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_blendingUpdateUUIDs;
    self->_blendingUpdateUUIDs = v6;

    id v4 = v8;
    blendingUpdateUUIDs = self->_blendingUpdateUUIDs;
  }
  [(NSMutableArray *)blendingUpdateUUIDs addObject:v4];
}

- (unint64_t)blendingUpdateUUIDsCount
{
  return [(NSMutableArray *)self->_blendingUpdateUUIDs count];
}

- (id)blendingUpdateUUIDAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_blendingUpdateUUIDs objectAtIndex:a3];
}

+ (Class)blendingUpdateUUIDType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBBlendingSessionERMEvent;
  id v4 = [(ATXPBBlendingSessionERMEvent *)&v8 description];
  v5 = [(ATXPBBlendingSessionERMEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  executableId = self->_executableId;
  if (executableId) {
    [v3 setObject:executableId forKey:@"executableId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t engagementType = self->_engagementType;
    if (engagementType >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_engagementType);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E68B4068[engagementType];
    }
    [v4 setObject:v7 forKey:@"engagementType"];
  }
  consumerSubType = self->_consumerSubType;
  if (consumerSubType) {
    [v4 setObject:consumerSubType forKey:@"consumerSubType"];
  }
  blendingUpdateUUIDs = self->_blendingUpdateUUIDs;
  if (blendingUpdateUUIDs) {
    [v4 setObject:blendingUpdateUUIDs forKey:@"blendingUpdateUUID"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBBlendingSessionERMEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_executableId) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_consumerSubType) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_blendingUpdateUUIDs;
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
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_executableId)
  {
    objc_msgSend(v4, "setExecutableId:");
    id v4 = v9;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 6) = self->_engagementType;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  if (self->_consumerSubType) {
    objc_msgSend(v9, "setConsumerSubType:");
  }
  if ([(ATXPBBlendingSessionERMEvent *)self blendingUpdateUUIDsCount])
  {
    [v9 clearBlendingUpdateUUIDs];
    unint64_t v5 = [(ATXPBBlendingSessionERMEvent *)self blendingUpdateUUIDsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(ATXPBBlendingSessionERMEvent *)self blendingUpdateUUIDAtIndex:i];
        [v9 addBlendingUpdateUUID:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_executableId copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_engagementType;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_consumerSubType copyWithZone:a3];
  id v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v10 = self->_blendingUpdateUUIDs;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v14), "copyWithZone:", a3, (void)v17);
        [(id)v5 addBlendingUpdateUUID:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  executableId = self->_executableId;
  if ((unint64_t)executableId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](executableId, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_engagementType != *((_DWORD *)v4 + 6)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  consumerSubType = self->_consumerSubType;
  if ((unint64_t)consumerSubType | *((void *)v4 + 2)
    && !-[NSString isEqual:](consumerSubType, "isEqual:"))
  {
    goto LABEL_13;
  }
  blendingUpdateUUIDs = self->_blendingUpdateUUIDs;
  if ((unint64_t)blendingUpdateUUIDs | *((void *)v4 + 1)) {
    char v8 = -[NSMutableArray isEqual:](blendingUpdateUUIDs, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_executableId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_engagementType;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = v4 ^ v3;
  NSUInteger v6 = [(NSString *)self->_consumerSubType hash];
  return v5 ^ v6 ^ [(NSMutableArray *)self->_blendingUpdateUUIDs hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 4)) {
    -[ATXPBBlendingSessionERMEvent setExecutableId:](self, "setExecutableId:");
  }
  if (*((unsigned char *)v4 + 40))
  {
    self->_uint64_t engagementType = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2)) {
    -[ATXPBBlendingSessionERMEvent setConsumerSubType:](self, "setConsumerSubType:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 1);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[ATXPBBlendingSessionERMEvent addBlendingUpdateUUID:](self, "addBlendingUpdateUUID:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)executableId
{
  return self->_executableId;
}

- (void)setExecutableId:(id)a3
{
}

- (NSString)consumerSubType
{
  return self->_consumerSubType;
}

- (void)setConsumerSubType:(id)a3
{
}

- (NSMutableArray)blendingUpdateUUIDs
{
  return self->_blendingUpdateUUIDs;
}

- (void)setBlendingUpdateUUIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executableId, 0);
  objc_storeStrong((id *)&self->_consumerSubType, 0);
  objc_storeStrong((id *)&self->_blendingUpdateUUIDs, 0);
}

@end