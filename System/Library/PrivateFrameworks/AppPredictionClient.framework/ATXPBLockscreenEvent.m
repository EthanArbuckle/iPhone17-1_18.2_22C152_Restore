@interface ATXPBLockscreenEvent
- (BOOL)hasBlendingCacheId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (__CFString)eventTypeAsString:(__CFString *)a1;
- (double)date;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)suggestionIdsAtIndex:(id *)a1;
- (uint64_t)StringAsEventType:(uint64_t)a1;
- (uint64_t)addSuggestionIds:(uint64_t)a1;
- (uint64_t)blendingCacheId;
- (uint64_t)clearSuggestionIds;
- (uint64_t)eventType;
- (uint64_t)hasDate;
- (uint64_t)hasEventType;
- (uint64_t)setDate:(uint64_t)result;
- (uint64_t)setEventType:(uint64_t)result;
- (uint64_t)setHasDate:(uint64_t)result;
- (uint64_t)setHasEventType:(uint64_t)result;
- (uint64_t)suggestionIds;
- (uint64_t)suggestionIdsCount;
- (unint64_t)hash;
- (void)copyTo:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)setBlendingCacheId:(uint64_t)a1;
- (void)setSuggestionIds:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBLockscreenEvent

- (uint64_t)setDate:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 40) |= 1u;
    *(double *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)setHasDate:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 40) = *(unsigned char *)(result + 40) & 0xFE | a2;
  }
  return result;
}

- (uint64_t)hasDate
{
  if (result) {
    return *(unsigned char *)(result + 40) & 1;
  }
  return result;
}

- (uint64_t)eventType
{
  if (result)
  {
    if ((*(unsigned char *)(result + 40) & 2) != 0) {
      return *(unsigned int *)(result + 24);
    }
    else {
      return 1;
    }
  }
  return result;
}

- (uint64_t)setEventType:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 40) |= 2u;
    *(_DWORD *)(result + 24) = a2;
  }
  return result;
}

- (uint64_t)setHasEventType:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 2;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 40) = *(unsigned char *)(result + 40) & 0xFD | v2;
  }
  return result;
}

- (uint64_t)hasEventType
{
  if (result) {
    return (*(unsigned __int8 *)(result + 40) >> 1) & 1;
  }
  return result;
}

- (__CFString)eventTypeAsString:(__CFString *)a1
{
  if (a1)
  {
    if ((a2 - 1) >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a2);
      a1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = off_1E5D0AB30[(int)a2 - 1];
    }
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)StringAsEventType:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    id v5 = v3;
    if ([v5 isEqualToString:@"SuggestionsPushedToLockscreen"])
    {
      uint64_t v6 = 1;
    }
    else if ([v5 isEqualToString:@"SuggestionTappedByUser"])
    {
      uint64_t v6 = 2;
    }
    else if ([v5 isEqualToString:@"SuggestionClearedByUser"])
    {
      uint64_t v6 = 3;
    }
    else if ([v5 isEqualToString:@"SuggestionsRemovedFromLockscreen"])
    {
      uint64_t v6 = 4;
    }
    else
    {
      uint64_t v6 = 1;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)hasBlendingCacheId
{
  if (result) {
    return *(void *)(result + 16) != 0;
  }
  return result;
}

- (uint64_t)clearSuggestionIds
{
  if (result) {
    return [*(id *)(result + 32) removeAllObjects];
  }
  return result;
}

- (uint64_t)addSuggestionIds:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = *(void **)(a1 + 32);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v6;

      id v5 = *(void **)(a1 + 32);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

- (uint64_t)suggestionIdsCount
{
  if (result) {
    return [*(id *)(result + 32) count];
  }
  return result;
}

- (id)suggestionIdsAtIndex:(id *)a1
{
  if (a1)
  {
    a1 = [a1[4] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBLockscreenEvent;
  id v4 = [(ATXPBLockscreenEvent *)&v8 description];
  id v5 = [(ATXPBLockscreenEvent *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    id v5 = [NSNumber numberWithDouble:self->_date];
    [v3 setObject:v5 forKey:@"date"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    unsigned int v6 = self->_eventType - 1;
    if (v6 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_eventType);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E5D0AB30[v6];
    }
    [v3 setObject:v7 forKey:@"eventType"];
  }
  blendingCacheId = self->_blendingCacheId;
  if (blendingCacheId) {
    [v3 setObject:blendingCacheId forKey:@"blendingCacheId"];
  }
  suggestionIds = self->_suggestionIds;
  if (suggestionIds) {
    [v3 setObject:suggestionIds forKey:@"suggestionIds"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBLockscreenEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_blendingCacheId) {
    PBDataWriterWriteStringField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unsigned int v6 = self->_suggestionIds;
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
}

- (void)copyTo:(uint64_t)a1
{
  id v9 = a2;
  if (a1)
  {
    char v3 = *(unsigned char *)(a1 + 40);
    if (v3)
    {
      *((void *)v9 + 1) = *(void *)(a1 + 8);
      *((unsigned char *)v9 + 40) |= 1u;
      char v3 = *(unsigned char *)(a1 + 40);
    }
    if ((v3 & 2) != 0)
    {
      *((_DWORD *)v9 + 6) = *(_DWORD *)(a1 + 24);
      *((unsigned char *)v9 + 40) |= 2u;
    }
    id v4 = *(void **)(a1 + 16);
    if (v4) {
      -[ATXPBLockscreenEvent setBlendingCacheId:]((uint64_t)v9, v4);
    }
    if ([*(id *)(a1 + 32) count])
    {
      if (v9) {
        [*((id *)v9 + 4) removeAllObjects];
      }
      uint64_t v5 = [*(id *)(a1 + 32) count];
      if (v5)
      {
        uint64_t v6 = v5;
        for (uint64_t i = 0; i != v6; ++i)
        {
          uint64_t v8 = [*(id *)(a1 + 32) objectAtIndex:i];
          -[ATXPBLockscreenEvent addSuggestionIds:]((uint64_t)v9, v8);
        }
      }
    }
  }
}

- (void)setBlendingCacheId:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = (void *)v5;
  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 8) = self->_date;
    *(unsigned char *)(v5 + 40) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_eventType;
    *(unsigned char *)(v5 + 40) |= 2u;
  }
  uint64_t v8 = [(NSString *)self->_blendingCacheId copyWithZone:a3];
  id v9 = (void *)v6[2];
  v6[2] = v8;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v10 = self->_suggestionIds;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "copyWithZone:", a3, (void)v17);
        -[ATXPBLockscreenEvent addSuggestionIds:]((uint64_t)v6, v15);
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_date != *((double *)v4 + 1)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_16:
    char v7 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_eventType != *((_DWORD *)v4 + 6)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_16;
  }
  blendingCacheId = self->_blendingCacheId;
  if ((unint64_t)blendingCacheId | *((void *)v4 + 2)
    && !-[NSString isEqual:](blendingCacheId, "isEqual:"))
  {
    goto LABEL_16;
  }
  suggestionIds = self->_suggestionIds;
  if ((unint64_t)suggestionIds | *((void *)v4 + 4)) {
    char v7 = -[NSMutableArray isEqual:](suggestionIds, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has)
  {
    double date = self->_date;
    double v6 = -date;
    if (date >= 0.0) {
      double v6 = self->_date;
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
  if ((has & 2) != 0) {
    uint64_t v9 = 2654435761 * self->_eventType;
  }
  else {
    uint64_t v9 = 0;
  }
  NSUInteger v10 = v9 ^ v4 ^ [(NSString *)self->_blendingCacheId hash];
  return v10 ^ [(NSMutableArray *)self->_suggestionIds hash];
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v3 = a2;
  unint64_t v4 = v3;
  if (a1)
  {
    char v5 = *((unsigned char *)v3 + 40);
    if (v5)
    {
      *(void *)(a1 + 8) = v3[1];
      *(unsigned char *)(a1 + 40) |= 1u;
      char v5 = *((unsigned char *)v3 + 40);
    }
    if ((v5 & 2) != 0)
    {
      *(_DWORD *)(a1 + 24) = *((_DWORD *)v3 + 6);
      *(unsigned char *)(a1 + 40) |= 2u;
    }
    id v6 = v3[2];
    if (v6) {
      objc_storeStrong((id *)(a1 + 16), v6);
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v4[4];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          -[ATXPBLockscreenEvent addSuggestionIds:](a1, *(void **)(*((void *)&v12 + 1) + 8 * i));
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (double)date
{
  if (a1) {
    return *(double *)(a1 + 8);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)blendingCacheId
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (uint64_t)suggestionIds
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

- (void)setSuggestionIds:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionIds, 0);

  objc_storeStrong((id *)&self->_blendingCacheId, 0);
}

@end