@interface ATXPBSpotlightEvent
- (BOOL)hasActionBlendingCacheId;
- (BOOL)hasActionConsumerSubType;
- (BOOL)hasAppBlendingCacheId;
- (BOOL)hasAppConsumerSubType;
- (BOOL)hasMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (__CFString)eventTypeAsString:(__CFString *)a1;
- (double)date;
- (id)actionSuggestionIdsAtIndex:(id *)a1;
- (id)appSuggestionIdsAtIndex:(id *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)StringAsEventType:(uint64_t)a1;
- (uint64_t)actionBlendingCacheId;
- (uint64_t)actionConsumerSubType;
- (uint64_t)actionSuggestionIds;
- (uint64_t)actionSuggestionIdsCount;
- (uint64_t)addActionSuggestionIds:(uint64_t)a1;
- (uint64_t)addAppSuggestionIds:(uint64_t)a1;
- (uint64_t)appBlendingCacheId;
- (uint64_t)appConsumerSubType;
- (uint64_t)appSuggestionIds;
- (uint64_t)appSuggestionIdsCount;
- (uint64_t)clearActionSuggestionIds;
- (uint64_t)clearAppSuggestionIds;
- (uint64_t)eventType;
- (uint64_t)hasDate;
- (uint64_t)hasEventType;
- (uint64_t)metadata;
- (uint64_t)setDate:(uint64_t)result;
- (uint64_t)setEventType:(uint64_t)result;
- (uint64_t)setHasDate:(uint64_t)result;
- (uint64_t)setHasEventType:(uint64_t)result;
- (unint64_t)hash;
- (void)copyTo:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)setActionBlendingCacheId:(uint64_t)a1;
- (void)setActionConsumerSubType:(uint64_t)a1;
- (void)setActionSuggestionIds:(uint64_t)a1;
- (void)setAppBlendingCacheId:(uint64_t)a1;
- (void)setAppConsumerSubType:(uint64_t)a1;
- (void)setAppSuggestionIds:(uint64_t)a1;
- (void)setMetadata:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBSpotlightEvent

- (uint64_t)setDate:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 80) |= 1u;
    *(double *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)setHasDate:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 80) = *(unsigned char *)(result + 80) & 0xFE | a2;
  }
  return result;
}

- (uint64_t)hasDate
{
  if (result) {
    return *(unsigned char *)(result + 80) & 1;
  }
  return result;
}

- (uint64_t)eventType
{
  if (result)
  {
    if ((*(unsigned char *)(result + 80) & 2) != 0) {
      return *(unsigned int *)(result + 64);
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
    *(unsigned char *)(result + 80) |= 2u;
    *(_DWORD *)(result + 64) = a2;
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
    *(unsigned char *)(result + 80) = *(unsigned char *)(result + 80) & 0xFD | v2;
  }
  return result;
}

- (uint64_t)hasEventType
{
  if (result) {
    return (*(unsigned __int8 *)(result + 80) >> 1) & 1;
  }
  return result;
}

- (__CFString)eventTypeAsString:(__CFString *)a1
{
  if (a1)
  {
    if ((a2 - 1) >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a2);
      a1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = off_1E5D096F8[(int)a2 - 1];
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
    if ([v5 isEqualToString:@"ViewAppeared"])
    {
      uint64_t v6 = 1;
    }
    else if ([v5 isEqualToString:@"ViewDisappeared"])
    {
      uint64_t v6 = 2;
    }
    else if ([v5 isEqualToString:@"SuggestionsAppeared"])
    {
      uint64_t v6 = 3;
    }
    else if ([v5 isEqualToString:@"SuggestionTapped"])
    {
      uint64_t v6 = 4;
    }
    else if ([v5 isEqualToString:@"SuggestionDismissed"])
    {
      uint64_t v6 = 5;
    }
    else if ([v5 isEqualToString:@"ContextMenuDismissOnce"])
    {
      uint64_t v6 = 6;
    }
    else if ([v5 isEqualToString:@"ContextMenuNeverShowAgain"])
    {
      uint64_t v6 = 7;
    }
    else if ([v5 isEqualToString:@"SearchResultTapped"])
    {
      uint64_t v6 = 8;
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

- (BOOL)hasAppConsumerSubType
{
  if (result) {
    return *(void *)(result + 48) != 0;
  }
  return result;
}

- (BOOL)hasActionConsumerSubType
{
  if (result) {
    return *(void *)(result + 24) != 0;
  }
  return result;
}

- (BOOL)hasAppBlendingCacheId
{
  if (result) {
    return *(void *)(result + 40) != 0;
  }
  return result;
}

- (BOOL)hasActionBlendingCacheId
{
  if (result) {
    return *(void *)(result + 16) != 0;
  }
  return result;
}

- (uint64_t)clearAppSuggestionIds
{
  if (result) {
    return [*(id *)(result + 56) removeAllObjects];
  }
  return result;
}

- (uint64_t)addAppSuggestionIds:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = *(void **)(a1 + 56);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v6;

      id v5 = *(void **)(a1 + 56);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

- (uint64_t)appSuggestionIdsCount
{
  if (result) {
    return [*(id *)(result + 56) count];
  }
  return result;
}

- (id)appSuggestionIdsAtIndex:(id *)a1
{
  if (a1)
  {
    a1 = [a1[7] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)clearActionSuggestionIds
{
  if (result) {
    return [*(id *)(result + 32) removeAllObjects];
  }
  return result;
}

- (uint64_t)addActionSuggestionIds:(uint64_t)a1
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

- (uint64_t)actionSuggestionIdsCount
{
  if (result) {
    return [*(id *)(result + 32) count];
  }
  return result;
}

- (id)actionSuggestionIdsAtIndex:(id *)a1
{
  if (a1)
  {
    a1 = [a1[4] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (BOOL)hasMetadata
{
  if (result) {
    return *(void *)(result + 72) != 0;
  }
  return result;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBSpotlightEvent;
  id v4 = [(ATXPBSpotlightEvent *)&v8 description];
  id v5 = [(ATXPBSpotlightEvent *)self dictionaryRepresentation];
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
    if (v6 >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_eventType);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E5D096F8[v6];
    }
    [v3 setObject:v7 forKey:@"eventType"];
  }
  appConsumerSubType = self->_appConsumerSubType;
  if (appConsumerSubType) {
    [v3 setObject:appConsumerSubType forKey:@"appConsumerSubType"];
  }
  actionConsumerSubType = self->_actionConsumerSubType;
  if (actionConsumerSubType) {
    [v3 setObject:actionConsumerSubType forKey:@"actionConsumerSubType"];
  }
  appBlendingCacheId = self->_appBlendingCacheId;
  if (appBlendingCacheId) {
    [v3 setObject:appBlendingCacheId forKey:@"appBlendingCacheId"];
  }
  actionBlendingCacheId = self->_actionBlendingCacheId;
  if (actionBlendingCacheId) {
    [v3 setObject:actionBlendingCacheId forKey:@"actionBlendingCacheId"];
  }
  appSuggestionIds = self->_appSuggestionIds;
  if (appSuggestionIds) {
    [v3 setObject:appSuggestionIds forKey:@"appSuggestionIds"];
  }
  actionSuggestionIds = self->_actionSuggestionIds;
  if (actionSuggestionIds) {
    [v3 setObject:actionSuggestionIds forKey:@"actionSuggestionIds"];
  }
  metadata = self->_metadata;
  if (metadata)
  {
    v15 = [(ATXPBSpotlightEventMetadata *)metadata dictionaryRepresentation];
    [v3 setObject:v15 forKey:@"metadata"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBSpotlightEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
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
  if (self->_appConsumerSubType) {
    PBDataWriterWriteStringField();
  }
  if (self->_actionConsumerSubType) {
    PBDataWriterWriteStringField();
  }
  if (self->_appBlendingCacheId) {
    PBDataWriterWriteStringField();
  }
  if (self->_actionBlendingCacheId) {
    PBDataWriterWriteStringField();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  unsigned int v6 = self->_appSuggestionIds;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
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
        PBDataWriterWriteStringField();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v11 = self->_actionSuggestionIds;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
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
        PBDataWriterWriteStringField();
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }

  if (self->_metadata) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    char v4 = *(unsigned char *)(a1 + 80);
    if (v4)
    {
      v3[1] = *(id *)(a1 + 8);
      *((unsigned char *)v3 + 80) |= 1u;
      char v4 = *(unsigned char *)(a1 + 80);
    }
    if ((v4 & 2) != 0)
    {
      *((_DWORD *)v3 + 16) = *(_DWORD *)(a1 + 64);
      *((unsigned char *)v3 + 80) |= 2u;
    }
    id v5 = *(void **)(a1 + 48);
    long long v18 = v3;
    if (v5) {
      -[ATXPBSpotlightEvent setAppConsumerSubType:]((uint64_t)v3, v5);
    }
    unsigned int v6 = *(void **)(a1 + 24);
    if (v6) {
      -[ATXPBSpotlightEvent setActionConsumerSubType:]((uint64_t)v18, v6);
    }
    uint64_t v7 = *(void **)(a1 + 40);
    if (v7) {
      -[ATXPBSpotlightEvent setAppBlendingCacheId:]((uint64_t)v18, v7);
    }
    uint64_t v8 = *(void **)(a1 + 16);
    if (v8) {
      -[ATXPBSpotlightEvent setActionBlendingCacheId:]((uint64_t)v18, v8);
    }
    if ([*(id *)(a1 + 56) count])
    {
      if (v18) {
        [v18[7] removeAllObjects];
      }
      uint64_t v9 = [*(id *)(a1 + 56) count];
      if (v9)
      {
        uint64_t v10 = v9;
        for (uint64_t i = 0; i != v10; ++i)
        {
          uint64_t v12 = [*(id *)(a1 + 56) objectAtIndex:i];
          -[ATXPBSpotlightEvent addAppSuggestionIds:]((uint64_t)v18, v12);
        }
      }
    }
    if ([*(id *)(a1 + 32) count])
    {
      if (v18) {
        [v18[4] removeAllObjects];
      }
      uint64_t v13 = [*(id *)(a1 + 32) count];
      if (v13)
      {
        uint64_t v14 = v13;
        for (uint64_t j = 0; j != v14; ++j)
        {
          long long v16 = [*(id *)(a1 + 32) objectAtIndex:j];
          -[ATXPBSpotlightEvent addActionSuggestionIds:]((uint64_t)v18, v16);
        }
      }
    }
    long long v17 = *(void **)(a1 + 72);
    id v3 = v18;
    if (v17)
    {
      -[ATXPBSpotlightEvent setMetadata:]((uint64_t)v18, v17);
      id v3 = v18;
    }
  }
}

- (void)setAppConsumerSubType:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (void)setActionConsumerSubType:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)setAppBlendingCacheId:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (void)setActionBlendingCacheId:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (void)setMetadata:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 72), a2);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unsigned int v6 = (void *)v5;
  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 8) = self->_date;
    *(unsigned char *)(v5 + 80) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_eventType;
    *(unsigned char *)(v5 + 80) |= 2u;
  }
  uint64_t v8 = [(NSString *)self->_appConsumerSubType copyWithZone:a3];
  uint64_t v9 = (void *)v6[6];
  v6[6] = v8;

  uint64_t v10 = [(NSString *)self->_actionConsumerSubType copyWithZone:a3];
  v11 = (void *)v6[3];
  v6[3] = v10;

  uint64_t v12 = [(NSString *)self->_appBlendingCacheId copyWithZone:a3];
  uint64_t v13 = (void *)v6[5];
  v6[5] = v12;

  uint64_t v14 = [(NSString *)self->_actionBlendingCacheId copyWithZone:a3];
  v15 = (void *)v6[2];
  v6[2] = v14;

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v16 = self->_appSuggestionIds;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v36 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = (void *)[*(id *)(*((void *)&v35 + 1) + 8 * i) copyWithZone:a3];
        -[ATXPBSpotlightEvent addAppSuggestionIds:]((uint64_t)v6, v21);
      }
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v18);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v22 = self->_actionSuggestionIds;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v32 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * j), "copyWithZone:", a3, (void)v31);
        -[ATXPBSpotlightEvent addActionSuggestionIds:]((uint64_t)v6, v27);
      }
      uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v24);
  }

  id v28 = [(ATXPBSpotlightEventMetadata *)self->_metadata copyWithZone:a3];
  v29 = (void *)v6[9];
  v6[9] = v28;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0 || self->_date != *((double *)v4 + 1)) {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 80))
  {
LABEL_26:
    char v12 = 0;
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 2) == 0 || self->_eventType != *((_DWORD *)v4 + 16)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 2) != 0)
  {
    goto LABEL_26;
  }
  appConsumerSubType = self->_appConsumerSubType;
  if ((unint64_t)appConsumerSubType | *((void *)v4 + 6)
    && !-[NSString isEqual:](appConsumerSubType, "isEqual:"))
  {
    goto LABEL_26;
  }
  actionConsumerSubType = self->_actionConsumerSubType;
  if ((unint64_t)actionConsumerSubType | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](actionConsumerSubType, "isEqual:")) {
      goto LABEL_26;
    }
  }
  appBlendingCacheId = self->_appBlendingCacheId;
  if ((unint64_t)appBlendingCacheId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](appBlendingCacheId, "isEqual:")) {
      goto LABEL_26;
    }
  }
  actionBlendingCacheId = self->_actionBlendingCacheId;
  if ((unint64_t)actionBlendingCacheId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](actionBlendingCacheId, "isEqual:")) {
      goto LABEL_26;
    }
  }
  appSuggestionIds = self->_appSuggestionIds;
  if ((unint64_t)appSuggestionIds | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](appSuggestionIds, "isEqual:")) {
      goto LABEL_26;
    }
  }
  actionSuggestionIds = self->_actionSuggestionIds;
  if ((unint64_t)actionSuggestionIds | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](actionSuggestionIds, "isEqual:")) {
      goto LABEL_26;
    }
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((void *)v4 + 9)) {
    char v12 = -[ATXPBSpotlightEventMetadata isEqual:](metadata, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_27:

  return v12;
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
  NSUInteger v10 = v9 ^ v4 ^ [(NSString *)self->_appConsumerSubType hash];
  NSUInteger v11 = [(NSString *)self->_actionConsumerSubType hash];
  NSUInteger v12 = v10 ^ v11 ^ [(NSString *)self->_appBlendingCacheId hash];
  NSUInteger v13 = [(NSString *)self->_actionBlendingCacheId hash];
  uint64_t v14 = v13 ^ [(NSMutableArray *)self->_appSuggestionIds hash];
  uint64_t v15 = v12 ^ v14 ^ [(NSMutableArray *)self->_actionSuggestionIds hash];
  return v15 ^ [(ATXPBSpotlightEventMetadata *)self->_metadata hash];
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    char v5 = v3[80];
    if (v5)
    {
      *(void *)(a1 + 8) = *((void *)v3 + 1);
      *(unsigned char *)(a1 + 80) |= 1u;
      char v5 = v3[80];
    }
    if ((v5 & 2) != 0)
    {
      *(_DWORD *)(a1 + 64) = *((_DWORD *)v3 + 16);
      *(unsigned char *)(a1 + 80) |= 2u;
    }
    double v6 = (void *)*((void *)v3 + 6);
    if (v6) {
      objc_storeStrong((id *)(a1 + 48), v6);
    }
    long double v7 = (void *)*((void *)v4 + 3);
    if (v7) {
      objc_storeStrong((id *)(a1 + 24), v7);
    }
    double v8 = (void *)*((void *)v4 + 5);
    if (v8) {
      objc_storeStrong((id *)(a1 + 40), v8);
    }
    uint64_t v9 = (void *)*((void *)v4 + 2);
    if (v9) {
      objc_storeStrong((id *)(a1 + 16), v9);
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v10 = *((id *)v4 + 7);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v10);
          }
          -[ATXPBSpotlightEvent addAppSuggestionIds:](a1, *(void **)(*((void *)&v25 + 1) + 8 * i));
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v12);
    }

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v15 = *((id *)v4 + 4);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v22 != v18) {
            objc_enumerationMutation(v15);
          }
          -[ATXPBSpotlightEvent addActionSuggestionIds:](a1, *(void **)(*((void *)&v21 + 1) + 8 * j));
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v17);
    }

    long long v20 = (void *)*((void *)v4 + 9);
    if (*(void *)(a1 + 72))
    {
      if (v20) {
        -[ATXPBSpotlightEventMetadata mergeFrom:](*(void *)(a1 + 72), v20);
      }
    }
    else if (v20)
    {
      objc_storeStrong((id *)(a1 + 72), v20);
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

- (uint64_t)appConsumerSubType
{
  if (result) {
    return *(void *)(result + 48);
  }
  return result;
}

- (uint64_t)actionConsumerSubType
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (uint64_t)appBlendingCacheId
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

- (uint64_t)actionBlendingCacheId
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (uint64_t)appSuggestionIds
{
  if (result) {
    return *(void *)(result + 56);
  }
  return result;
}

- (void)setAppSuggestionIds:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (uint64_t)actionSuggestionIds
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

- (void)setActionSuggestionIds:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (uint64_t)metadata
{
  if (result) {
    return *(void *)(result + 72);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_appSuggestionIds, 0);
  objc_storeStrong((id *)&self->_appConsumerSubType, 0);
  objc_storeStrong((id *)&self->_appBlendingCacheId, 0);
  objc_storeStrong((id *)&self->_actionSuggestionIds, 0);
  objc_storeStrong((id *)&self->_actionConsumerSubType, 0);

  objc_storeStrong((id *)&self->_actionBlendingCacheId, 0);
}

@end