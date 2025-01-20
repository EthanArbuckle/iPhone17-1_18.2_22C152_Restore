@interface ATXPBAppDirectoryEvent
- (BOOL)hasBlendingCacheId;
- (BOOL)hasBundleId;
- (BOOL)hasMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)date;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)engagedSuggestionIdsAtIndex:(id *)a1;
- (id)shownSuggestionIdsAtIndex:(id *)a1;
- (uint64_t)addEngagedSuggestionIds:(uint64_t)a1;
- (uint64_t)addShownSuggestionIds:(uint64_t)a1;
- (uint64_t)blendingCacheId;
- (uint64_t)bundleId;
- (uint64_t)bundleIndex;
- (uint64_t)categoryID;
- (uint64_t)categoryIndex;
- (uint64_t)clearEngagedSuggestionIds;
- (uint64_t)clearShownSuggestionIds;
- (uint64_t)engagedSuggestionIds;
- (uint64_t)engagedSuggestionIdsCount;
- (uint64_t)eventType;
- (uint64_t)hasBundleIndex;
- (uint64_t)hasCategoryID;
- (uint64_t)hasCategoryIndex;
- (uint64_t)hasDate;
- (uint64_t)hasEventType;
- (uint64_t)hasSearchQueryLength;
- (uint64_t)hasSearchTab;
- (uint64_t)metadata;
- (uint64_t)searchQueryLength;
- (uint64_t)searchTab;
- (uint64_t)setBundleIndex:(uint64_t)result;
- (uint64_t)setCategoryID:(uint64_t)result;
- (uint64_t)setCategoryIndex:(uint64_t)result;
- (uint64_t)setDate:(uint64_t)result;
- (uint64_t)setEventType:(uint64_t)result;
- (uint64_t)setHasBundleIndex:(uint64_t)result;
- (uint64_t)setHasCategoryID:(uint64_t)result;
- (uint64_t)setHasCategoryIndex:(uint64_t)result;
- (uint64_t)setHasDate:(uint64_t)result;
- (uint64_t)setHasEventType:(uint64_t)result;
- (uint64_t)setHasSearchQueryLength:(uint64_t)result;
- (uint64_t)setHasSearchTab:(uint64_t)result;
- (uint64_t)setSearchQueryLength:(uint64_t)result;
- (uint64_t)setSearchTab:(uint64_t)result;
- (uint64_t)shownSuggestionIds;
- (uint64_t)shownSuggestionIdsCount;
- (unint64_t)hash;
- (void)copyTo:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)setBlendingCacheId:(uint64_t)a1;
- (void)setBundleId:(uint64_t)a1;
- (void)setEngagedSuggestionIds:(uint64_t)a1;
- (void)setMetadata:(uint64_t)a1;
- (void)setShownSuggestionIds:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBAppDirectoryEvent

- (uint64_t)setDate:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 104) |= 8u;
    *(double *)(result + 32) = a2;
  }
  return result;
}

- (uint64_t)setHasDate:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 8;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 104) = *(unsigned char *)(result + 104) & 0xF7 | v2;
  }
  return result;
}

- (uint64_t)hasDate
{
  if (result) {
    return (*(unsigned __int8 *)(result + 104) >> 3) & 1;
  }
  return result;
}

- (uint64_t)setEventType:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 104) |= 0x10u;
    *(void *)(result + 40) = a2;
  }
  return result;
}

- (uint64_t)setHasEventType:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 16;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 104) = *(unsigned char *)(result + 104) & 0xEF | v2;
  }
  return result;
}

- (uint64_t)hasEventType
{
  if (result) {
    return (*(unsigned __int8 *)(result + 104) >> 4) & 1;
  }
  return result;
}

- (uint64_t)setCategoryID:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 104) |= 2u;
    *(void *)(result + 16) = a2;
  }
  return result;
}

- (uint64_t)setHasCategoryID:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 2;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 104) = *(unsigned char *)(result + 104) & 0xFD | v2;
  }
  return result;
}

- (uint64_t)hasCategoryID
{
  if (result) {
    return (*(unsigned __int8 *)(result + 104) >> 1) & 1;
  }
  return result;
}

- (uint64_t)setCategoryIndex:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 104) |= 4u;
    *(void *)(result + 24) = a2;
  }
  return result;
}

- (uint64_t)setHasCategoryIndex:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 4;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 104) = *(unsigned char *)(result + 104) & 0xFB | v2;
  }
  return result;
}

- (uint64_t)hasCategoryIndex
{
  if (result) {
    return (*(unsigned __int8 *)(result + 104) >> 2) & 1;
  }
  return result;
}

- (BOOL)hasBundleId
{
  if (result) {
    return *(void *)(result + 72) != 0;
  }
  return result;
}

- (uint64_t)setBundleIndex:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 104) |= 1u;
    *(void *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)setHasBundleIndex:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 104) = *(unsigned char *)(result + 104) & 0xFE | a2;
  }
  return result;
}

- (uint64_t)hasBundleIndex
{
  if (result) {
    return *(unsigned char *)(result + 104) & 1;
  }
  return result;
}

- (uint64_t)setSearchQueryLength:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 104) |= 0x20u;
    *(void *)(result + 48) = a2;
  }
  return result;
}

- (uint64_t)setHasSearchQueryLength:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 32;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 104) = *(unsigned char *)(result + 104) & 0xDF | v2;
  }
  return result;
}

- (uint64_t)hasSearchQueryLength
{
  if (result) {
    return (*(unsigned __int8 *)(result + 104) >> 5) & 1;
  }
  return result;
}

- (uint64_t)setSearchTab:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 104) |= 0x40u;
    *(void *)(result + 56) = a2;
  }
  return result;
}

- (uint64_t)setHasSearchTab:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 64;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 104) = *(unsigned char *)(result + 104) & 0xBF | v2;
  }
  return result;
}

- (uint64_t)hasSearchTab
{
  if (result) {
    return (*(unsigned __int8 *)(result + 104) >> 6) & 1;
  }
  return result;
}

- (BOOL)hasBlendingCacheId
{
  if (result) {
    return *(void *)(result + 64) != 0;
  }
  return result;
}

- (uint64_t)clearShownSuggestionIds
{
  if (result) {
    return [*(id *)(result + 96) removeAllObjects];
  }
  return result;
}

- (uint64_t)addShownSuggestionIds:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 96);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = *(void **)(a1 + 96);
      *(void *)(a1 + 96) = v6;

      v5 = *(void **)(a1 + 96);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

- (uint64_t)shownSuggestionIdsCount
{
  if (result) {
    return [*(id *)(result + 96) count];
  }
  return result;
}

- (id)shownSuggestionIdsAtIndex:(id *)a1
{
  if (a1)
  {
    a1 = [a1[12] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)clearEngagedSuggestionIds
{
  if (result) {
    return [*(id *)(result + 80) removeAllObjects];
  }
  return result;
}

- (uint64_t)addEngagedSuggestionIds:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 80);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = v6;

      v5 = *(void **)(a1 + 80);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

- (uint64_t)engagedSuggestionIdsCount
{
  if (result) {
    return [*(id *)(result + 80) count];
  }
  return result;
}

- (id)engagedSuggestionIdsAtIndex:(id *)a1
{
  if (a1)
  {
    a1 = [a1[10] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (BOOL)hasMetadata
{
  if (result) {
    return *(void *)(result + 88) != 0;
  }
  return result;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBAppDirectoryEvent;
  id v4 = [(ATXPBAppDirectoryEvent *)&v8 description];
  v5 = [(ATXPBAppDirectoryEvent *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v15 = [NSNumber numberWithDouble:self->_date];
    [v3 setObject:v15 forKey:@"date"];

    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v16 = [NSNumber numberWithUnsignedLongLong:self->_eventType];
  [v3 setObject:v16 forKey:@"eventType"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_25:
  v17 = [NSNumber numberWithUnsignedLongLong:self->_categoryID];
  [v3 setObject:v17 forKey:@"categoryID"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    v5 = [NSNumber numberWithUnsignedLongLong:self->_categoryIndex];
    [v3 setObject:v5 forKey:@"categoryIndex"];
  }
LABEL_6:
  bundleId = self->_bundleId;
  if (bundleId) {
    [v3 setObject:bundleId forKey:@"bundleId"];
  }
  char v7 = (char)self->_has;
  if (v7)
  {
    v18 = [NSNumber numberWithUnsignedLongLong:self->_bundleIndex];
    [v3 setObject:v18 forKey:@"bundleIndex"];

    char v7 = (char)self->_has;
    if ((v7 & 0x20) == 0)
    {
LABEL_10:
      if ((v7 & 0x40) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_10;
  }
  v19 = [NSNumber numberWithUnsignedLongLong:self->_searchQueryLength];
  [v3 setObject:v19 forKey:@"searchQueryLength"];

  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_11:
    objc_super v8 = [NSNumber numberWithUnsignedLongLong:self->_searchTab];
    [v3 setObject:v8 forKey:@"searchTab"];
  }
LABEL_12:
  blendingCacheId = self->_blendingCacheId;
  if (blendingCacheId) {
    [v3 setObject:blendingCacheId forKey:@"blendingCacheId"];
  }
  shownSuggestionIds = self->_shownSuggestionIds;
  if (shownSuggestionIds) {
    [v3 setObject:shownSuggestionIds forKey:@"shownSuggestionIds"];
  }
  engagedSuggestionIds = self->_engagedSuggestionIds;
  if (engagedSuggestionIds) {
    [v3 setObject:engagedSuggestionIds forKey:@"engagedSuggestionIds"];
  }
  metadata = self->_metadata;
  if (metadata)
  {
    v13 = [(ATXPBAppDirectoryEventMetadata *)metadata dictionaryRepresentation];
    [v3 setObject:v13 forKey:@"metadata"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBAppDirectoryEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_33;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_33:
  PBDataWriterWriteUint64Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_5:
  }
    PBDataWriterWriteUint64Field();
LABEL_6:
  if (self->_bundleId) {
    PBDataWriterWriteStringField();
  }
  char v6 = (char)self->_has;
  if (v6)
  {
    PBDataWriterWriteUint64Field();
    char v6 = (char)self->_has;
    if ((v6 & 0x20) == 0)
    {
LABEL_10:
      if ((v6 & 0x40) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_10;
  }
  PBDataWriterWriteUint64Field();
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
LABEL_11:
  }
    PBDataWriterWriteUint64Field();
LABEL_12:
  if (self->_blendingCacheId) {
    PBDataWriterWriteStringField();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  char v7 = self->_shownSuggestionIds;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v12 = self->_engagedSuggestionIds;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }

  if (self->_metadata) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(uint64_t)a1
{
  id v3 = a2;
  if (!a1) {
    goto LABEL_29;
  }
  char v4 = *(unsigned char *)(a1 + 104);
  if ((v4 & 8) != 0)
  {
    v3[4] = *(id *)(a1 + 32);
    *((unsigned char *)v3 + 104) |= 8u;
    char v4 = *(unsigned char *)(a1 + 104);
    if ((v4 & 0x10) == 0)
    {
LABEL_4:
      if ((v4 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_34;
    }
  }
  else if ((*(unsigned char *)(a1 + 104) & 0x10) == 0)
  {
    goto LABEL_4;
  }
  v3[5] = *(id *)(a1 + 40);
  *((unsigned char *)v3 + 104) |= 0x10u;
  char v4 = *(unsigned char *)(a1 + 104);
  if ((v4 & 2) == 0)
  {
LABEL_5:
    if ((v4 & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_34:
  v3[2] = *(id *)(a1 + 16);
  *((unsigned char *)v3 + 104) |= 2u;
  if ((*(unsigned char *)(a1 + 104) & 4) != 0)
  {
LABEL_6:
    v3[3] = *(id *)(a1 + 24);
    *((unsigned char *)v3 + 104) |= 4u;
  }
LABEL_7:
  v5 = *(void **)(a1 + 72);
  long long v17 = v3;
  if (v5)
  {
    -[ATXPBAppDirectoryEvent setBundleId:]((uint64_t)v3, v5);
    id v3 = v17;
  }
  char v6 = *(unsigned char *)(a1 + 104);
  if ((v6 & 1) == 0)
  {
    if ((*(unsigned char *)(a1 + 104) & 0x20) == 0) {
      goto LABEL_11;
    }
LABEL_37:
    v3[6] = *(id *)(a1 + 48);
    *((unsigned char *)v3 + 104) |= 0x20u;
    if ((*(unsigned char *)(a1 + 104) & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  v3[1] = *(id *)(a1 + 8);
  *((unsigned char *)v3 + 104) |= 1u;
  char v6 = *(unsigned char *)(a1 + 104);
  if ((v6 & 0x20) != 0) {
    goto LABEL_37;
  }
LABEL_11:
  if ((v6 & 0x40) != 0)
  {
LABEL_12:
    v3[7] = *(id *)(a1 + 56);
    *((unsigned char *)v3 + 104) |= 0x40u;
  }
LABEL_13:
  char v7 = *(void **)(a1 + 64);
  if (v7) {
    -[ATXPBAppDirectoryEvent setBlendingCacheId:]((uint64_t)v17, v7);
  }
  if ([*(id *)(a1 + 96) count])
  {
    if (v17) {
      [v17[12] removeAllObjects];
    }
    uint64_t v8 = [*(id *)(a1 + 96) count];
    if (v8)
    {
      uint64_t v9 = v8;
      for (uint64_t i = 0; i != v9; ++i)
      {
        v11 = -[ATXPBAppDirectoryEvent shownSuggestionIdsAtIndex:]((id *)a1, i);
        -[ATXPBAppDirectoryEvent addShownSuggestionIds:]((uint64_t)v17, v11);
      }
    }
  }
  if ([*(id *)(a1 + 80) count])
  {
    if (v17) {
      [v17[10] removeAllObjects];
    }
    uint64_t v12 = [*(id *)(a1 + 80) count];
    if (v12)
    {
      uint64_t v13 = v12;
      for (uint64_t j = 0; j != v13; ++j)
      {
        uint64_t v15 = -[ATXPBAppDirectoryEvent engagedSuggestionIdsAtIndex:]((id *)a1, j);
        -[ATXPBAppDirectoryEvent addEngagedSuggestionIds:]((uint64_t)v17, v15);
      }
    }
  }
  v16 = *(void **)(a1 + 88);
  id v3 = v17;
  if (v16)
  {
    -[ATXPBAppDirectoryEvent setMetadata:]((uint64_t)v17, v16);
    id v3 = v17;
  }
LABEL_29:
}

- (void)setBundleId:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 72), a2);
  }
}

- (void)setBlendingCacheId:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

- (void)setMetadata:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 88), a2);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(double *)(v5 + 32) = self->_date;
    *(unsigned char *)(v5 + 104) |= 8u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_27;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 40) = self->_eventType;
  *(unsigned char *)(v5 + 104) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_27:
  *(void *)(v5 + 16) = self->_categoryID;
  *(unsigned char *)(v5 + 104) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    *(void *)(v5 + 24) = self->_categoryIndex;
    *(unsigned char *)(v5 + 104) |= 4u;
  }
LABEL_6:
  uint64_t v8 = [(NSString *)self->_bundleId copyWithZone:a3];
  uint64_t v9 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v8;

  char v10 = (char)self->_has;
  if (v10)
  {
    *(void *)(v6 + 8) = self->_bundleIndex;
    *(unsigned char *)(v6 + 104) |= 1u;
    char v10 = (char)self->_has;
    if ((v10 & 0x20) == 0)
    {
LABEL_8:
      if ((v10 & 0x40) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_8;
  }
  *(void *)(v6 + 48) = self->_searchQueryLength;
  *(unsigned char *)(v6 + 104) |= 0x20u;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_9:
    *(void *)(v6 + 56) = self->_searchTab;
    *(unsigned char *)(v6 + 104) |= 0x40u;
  }
LABEL_10:
  uint64_t v11 = [(NSString *)self->_blendingCacheId copyWithZone:a3];
  uint64_t v12 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v11;

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v13 = self->_shownSuggestionIds;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = (void *)[*(id *)(*((void *)&v32 + 1) + 8 * i) copyWithZone:a3];
        -[ATXPBAppDirectoryEvent addShownSuggestionIds:](v6, v18);
      }
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v15);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v19 = self->_engagedSuggestionIds;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(v19);
        }
        long long v24 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * j), "copyWithZone:", a3, (void)v28);
        -[ATXPBAppDirectoryEvent addEngagedSuggestionIds:](v6, v24);
      }
      uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v21);
  }

  id v25 = [(ATXPBAppDirectoryEventMetadata *)self->_metadata copyWithZone:a3];
  v26 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v25;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_48;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 104) & 8) == 0 || self->_date != *((double *)v4 + 4)) {
      goto LABEL_48;
    }
  }
  else if ((*((unsigned char *)v4 + 104) & 8) != 0)
  {
    goto LABEL_48;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 104) & 0x10) == 0 || self->_eventType != *((void *)v4 + 5)) {
      goto LABEL_48;
    }
  }
  else if ((*((unsigned char *)v4 + 104) & 0x10) != 0)
  {
    goto LABEL_48;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 104) & 2) == 0 || self->_categoryID != *((void *)v4 + 2)) {
      goto LABEL_48;
    }
  }
  else if ((*((unsigned char *)v4 + 104) & 2) != 0)
  {
    goto LABEL_48;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 104) & 4) == 0 || self->_categoryIndex != *((void *)v4 + 3)) {
      goto LABEL_48;
    }
  }
  else if ((*((unsigned char *)v4 + 104) & 4) != 0)
  {
    goto LABEL_48;
  }
  bundleId = self->_bundleId;
  if ((unint64_t)bundleId | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](bundleId, "isEqual:"))
    {
LABEL_48:
      char v11 = 0;
      goto LABEL_49;
    }
    char has = (char)self->_has;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 104) & 1) == 0 || self->_bundleIndex != *((void *)v4 + 1)) {
      goto LABEL_48;
    }
  }
  else if (*((unsigned char *)v4 + 104))
  {
    goto LABEL_48;
  }
  if ((has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 104) & 0x20) == 0 || self->_searchQueryLength != *((void *)v4 + 6)) {
      goto LABEL_48;
    }
  }
  else if ((*((unsigned char *)v4 + 104) & 0x20) != 0)
  {
    goto LABEL_48;
  }
  if ((has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 104) & 0x40) == 0 || self->_searchTab != *((void *)v4 + 7)) {
      goto LABEL_48;
    }
  }
  else if ((*((unsigned char *)v4 + 104) & 0x40) != 0)
  {
    goto LABEL_48;
  }
  blendingCacheId = self->_blendingCacheId;
  if ((unint64_t)blendingCacheId | *((void *)v4 + 8)
    && !-[NSString isEqual:](blendingCacheId, "isEqual:"))
  {
    goto LABEL_48;
  }
  shownSuggestionIds = self->_shownSuggestionIds;
  if ((unint64_t)shownSuggestionIds | *((void *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](shownSuggestionIds, "isEqual:")) {
      goto LABEL_48;
    }
  }
  engagedSuggestionIds = self->_engagedSuggestionIds;
  if ((unint64_t)engagedSuggestionIds | *((void *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](engagedSuggestionIds, "isEqual:")) {
      goto LABEL_48;
    }
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((void *)v4 + 11)) {
    char v11 = -[ATXPBAppDirectoryEventMetadata isEqual:](metadata, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_49:

  return v11;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 8) != 0)
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
  if ((has & 0x10) == 0)
  {
    unint64_t v9 = 0;
    if ((has & 2) != 0) {
      goto LABEL_11;
    }
LABEL_14:
    unint64_t v10 = 0;
    if ((has & 4) != 0) {
      goto LABEL_12;
    }
    goto LABEL_15;
  }
  unint64_t v9 = 2654435761u * self->_eventType;
  if ((has & 2) == 0) {
    goto LABEL_14;
  }
LABEL_11:
  unint64_t v10 = 2654435761u * self->_categoryID;
  if ((has & 4) != 0)
  {
LABEL_12:
    unint64_t v11 = 2654435761u * self->_categoryIndex;
    goto LABEL_16;
  }
LABEL_15:
  unint64_t v11 = 0;
LABEL_16:
  NSUInteger v12 = [(NSString *)self->_bundleId hash];
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    unint64_t v13 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_18;
    }
LABEL_21:
    unint64_t v14 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_19;
    }
LABEL_22:
    unint64_t v15 = 0;
    goto LABEL_23;
  }
  unint64_t v13 = 2654435761u * self->_bundleIndex;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_21;
  }
LABEL_18:
  unint64_t v14 = 2654435761u * self->_searchQueryLength;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_22;
  }
LABEL_19:
  unint64_t v15 = 2654435761u * self->_searchTab;
LABEL_23:
  unint64_t v16 = v9 ^ v4 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v12;
  NSUInteger v17 = [(NSString *)self->_blendingCacheId hash];
  uint64_t v18 = v16 ^ v17 ^ [(NSMutableArray *)self->_shownSuggestionIds hash];
  uint64_t v19 = [(NSMutableArray *)self->_engagedSuggestionIds hash];
  return v18 ^ v19 ^ [(ATXPBAppDirectoryEventMetadata *)self->_metadata hash];
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (!a1) {
    goto LABEL_41;
  }
  char v5 = v3[104];
  if ((v5 & 8) != 0)
  {
    *(void *)(a1 + 32) = *((void *)v3 + 4);
    *(unsigned char *)(a1 + 104) |= 8u;
    char v5 = v3[104];
    if ((v5 & 0x10) == 0)
    {
LABEL_4:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_34;
    }
  }
  else if ((v3[104] & 0x10) == 0)
  {
    goto LABEL_4;
  }
  *(void *)(a1 + 40) = *((void *)v3 + 5);
  *(unsigned char *)(a1 + 104) |= 0x10u;
  char v5 = v3[104];
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_34:
  *(void *)(a1 + 16) = *((void *)v3 + 2);
  *(unsigned char *)(a1 + 104) |= 2u;
  if ((v3[104] & 4) != 0)
  {
LABEL_6:
    *(void *)(a1 + 24) = *((void *)v3 + 3);
    *(unsigned char *)(a1 + 104) |= 4u;
  }
LABEL_7:
  double v6 = (void *)*((void *)v3 + 9);
  if (v6) {
    -[ATXPBAppDirectoryEvent setBundleId:](a1, v6);
  }
  char v7 = *((unsigned char *)v4 + 104);
  if ((v7 & 1) == 0)
  {
    if ((*((unsigned char *)v4 + 104) & 0x20) == 0) {
      goto LABEL_11;
    }
LABEL_37:
    *(void *)(a1 + 48) = *((void *)v4 + 6);
    *(unsigned char *)(a1 + 104) |= 0x20u;
    if ((*((unsigned char *)v4 + 104) & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  *(void *)(a1 + 8) = *((void *)v4 + 1);
  *(unsigned char *)(a1 + 104) |= 1u;
  char v7 = *((unsigned char *)v4 + 104);
  if ((v7 & 0x20) != 0) {
    goto LABEL_37;
  }
LABEL_11:
  if ((v7 & 0x40) != 0)
  {
LABEL_12:
    *(void *)(a1 + 56) = *((void *)v4 + 7);
    *(unsigned char *)(a1 + 104) |= 0x40u;
  }
LABEL_13:
  double v8 = (void *)*((void *)v4 + 8);
  if (v8) {
    -[ATXPBAppDirectoryEvent setBlendingCacheId:](a1, v8);
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = *((id *)v4 + 12);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        -[ATXPBAppDirectoryEvent addShownSuggestionIds:](a1, *(void **)(*((void *)&v25 + 1) + 8 * i));
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v11);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v14 = *((id *)v4 + 10);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        -[ATXPBAppDirectoryEvent addEngagedSuggestionIds:](a1, *(void **)(*((void *)&v21 + 1) + 8 * j));
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }

  uint64_t v19 = *(unsigned char **)(a1 + 88);
  uint64_t v20 = (void *)*((void *)v4 + 11);
  if (v19)
  {
    if (v20) {
      -[ATXPBAppDirectoryEventMetadata mergeFrom:](v19, v20);
    }
  }
  else if (v20)
  {
    -[ATXPBAppDirectoryEvent setMetadata:](a1, v20);
  }
LABEL_41:
}

- (double)date
{
  if (a1) {
    return *(double *)(a1 + 32);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)eventType
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

- (uint64_t)categoryID
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (uint64_t)categoryIndex
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (uint64_t)bundleId
{
  if (result) {
    return *(void *)(result + 72);
  }
  return result;
}

- (uint64_t)bundleIndex
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (uint64_t)searchQueryLength
{
  if (result) {
    return *(void *)(result + 48);
  }
  return result;
}

- (uint64_t)searchTab
{
  if (result) {
    return *(void *)(result + 56);
  }
  return result;
}

- (uint64_t)blendingCacheId
{
  if (result) {
    return *(void *)(result + 64);
  }
  return result;
}

- (uint64_t)shownSuggestionIds
{
  if (result) {
    return *(void *)(result + 96);
  }
  return result;
}

- (void)setShownSuggestionIds:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 96), a2);
  }
}

- (uint64_t)engagedSuggestionIds
{
  if (result) {
    return *(void *)(result + 80);
  }
  return result;
}

- (void)setEngagedSuggestionIds:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 80), a2);
  }
}

- (uint64_t)metadata
{
  if (result) {
    return *(void *)(result + 88);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shownSuggestionIds, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_engagedSuggestionIds, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);

  objc_storeStrong((id *)&self->_blendingCacheId, 0);
}

@end