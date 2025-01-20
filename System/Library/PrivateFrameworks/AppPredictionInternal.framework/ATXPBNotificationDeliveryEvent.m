@interface ATXPBNotificationDeliveryEvent
+ (Class)suggestionUUIDType;
- (BOOL)hasDeliveryUI;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)suggestionUUIDs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deliveryUIAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)suggestionUUIDAtIndex:(unint64_t)a3;
- (int)StringAsDeliveryUI:(id)a3;
- (int)deliveryUI;
- (unint64_t)hash;
- (unint64_t)suggestionUUIDsCount;
- (void)addSuggestionUUID:(id)a3;
- (void)clearSuggestionUUIDs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeliveryUI:(int)a3;
- (void)setHasDeliveryUI:(BOOL)a3;
- (void)setSuggestionUUIDs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBNotificationDeliveryEvent

- (int)deliveryUI
{
  if (*(unsigned char *)&self->_has) {
    return self->_deliveryUI;
  }
  else {
    return 0;
  }
}

- (void)setDeliveryUI:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_deliveryUI = a3;
}

- (void)setHasDeliveryUI:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDeliveryUI
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)deliveryUIAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E68B5B98[a3];
  }
  return v3;
}

- (int)StringAsDeliveryUI:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Digest"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MissedNotificationBundle"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"NotificationCenter"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Banner"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LockScreen"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Other"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"PriorityNotification"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"Total"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearSuggestionUUIDs
{
}

- (void)addSuggestionUUID:(id)a3
{
  id v4 = a3;
  suggestionUUIDs = self->_suggestionUUIDs;
  id v8 = v4;
  if (!suggestionUUIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_suggestionUUIDs;
    self->_suggestionUUIDs = v6;

    id v4 = v8;
    suggestionUUIDs = self->_suggestionUUIDs;
  }
  [(NSMutableArray *)suggestionUUIDs addObject:v4];
}

- (unint64_t)suggestionUUIDsCount
{
  return [(NSMutableArray *)self->_suggestionUUIDs count];
}

- (id)suggestionUUIDAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_suggestionUUIDs objectAtIndex:a3];
}

+ (Class)suggestionUUIDType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBNotificationDeliveryEvent;
  id v4 = [(ATXPBNotificationDeliveryEvent *)&v8 description];
  v5 = [(ATXPBNotificationDeliveryEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t deliveryUI = self->_deliveryUI;
    if (deliveryUI >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_deliveryUI);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E68B5B98[deliveryUI];
    }
    [v3 setObject:v5 forKey:@"deliveryUI"];
  }
  suggestionUUIDs = self->_suggestionUUIDs;
  if (suggestionUUIDs) {
    [v3 setObject:suggestionUUIDs forKey:@"suggestionUUID"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBNotificationDeliveryEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_suggestionUUIDs;
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
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = self->_deliveryUI;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  id v9 = v4;
  if ([(ATXPBNotificationDeliveryEvent *)self suggestionUUIDsCount])
  {
    [v9 clearSuggestionUUIDs];
    unint64_t v5 = [(ATXPBNotificationDeliveryEvent *)self suggestionUUIDsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(ATXPBNotificationDeliveryEvent *)self suggestionUUIDAtIndex:i];
        [v9 addSuggestionUUID:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_deliveryUI;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = self->_suggestionUUIDs;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "copyWithZone:", a3, (void)v14);
        [v6 addSuggestionUUID:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_deliveryUI != *((_DWORD *)v4 + 2)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  suggestionUUIDs = self->_suggestionUUIDs;
  if ((unint64_t)suggestionUUIDs | *((void *)v4 + 2)) {
    char v6 = -[NSMutableArray isEqual:](suggestionUUIDs, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_deliveryUI;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSMutableArray *)self->_suggestionUUIDs hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (*((unsigned char *)v4 + 24))
  {
    self->_uint64_t deliveryUI = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 2);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[ATXPBNotificationDeliveryEvent addSuggestionUUID:](self, "addSuggestionUUID:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (NSMutableArray)suggestionUUIDs
{
  return self->_suggestionUUIDs;
}

- (void)setSuggestionUUIDs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end