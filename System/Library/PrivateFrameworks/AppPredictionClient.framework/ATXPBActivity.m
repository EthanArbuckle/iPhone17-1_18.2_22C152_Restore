@interface ATXPBActivity
- (BOOL)hasModeUUID;
- (BOOL)hasOriginAnchorType;
- (BOOL)hasOriginBundleId;
- (BOOL)hasSuggestionUUID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldSuggestTriggers;
- (__CFString)typeAsString:(__CFString *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)serializedTriggersAtIndex:(id *)a1;
- (uint64_t)StringAsType:(uint64_t)a1;
- (uint64_t)addSerializedTriggers:(uint64_t)a1;
- (uint64_t)clearSerializedTriggers;
- (uint64_t)hasOrigin;
- (uint64_t)hasShouldSuggestTriggers;
- (uint64_t)hasType;
- (uint64_t)hasUiLocation;
- (uint64_t)modeUUID;
- (uint64_t)origin;
- (uint64_t)originAnchorType;
- (uint64_t)originBundleId;
- (uint64_t)serializedTriggers;
- (uint64_t)serializedTriggersCount;
- (uint64_t)setHasOrigin:(uint64_t)result;
- (uint64_t)setHasShouldSuggestTriggers:(uint64_t)result;
- (uint64_t)setHasType:(uint64_t)result;
- (uint64_t)setHasUiLocation:(uint64_t)result;
- (uint64_t)setOrigin:(uint64_t)result;
- (uint64_t)setShouldSuggestTriggers:(uint64_t)result;
- (uint64_t)setType:(uint64_t)result;
- (uint64_t)setUiLocation:(uint64_t)result;
- (uint64_t)suggestionUUID;
- (uint64_t)type;
- (uint64_t)uiLocation;
- (unint64_t)hash;
- (void)copyTo:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)setModeUUID:(uint64_t)a1;
- (void)setOriginAnchorType:(uint64_t)a1;
- (void)setOriginBundleId:(uint64_t)a1;
- (void)setSerializedTriggers:(uint64_t)a1;
- (void)setSuggestionUUID:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBActivity

- (uint64_t)setUiLocation:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 72) |= 2u;
    *(void *)(result + 16) = a2;
  }
  return result;
}

- (uint64_t)setHasUiLocation:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 2;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 72) = *(unsigned char *)(result + 72) & 0xFD | v2;
  }
  return result;
}

- (uint64_t)hasUiLocation
{
  if (result) {
    return (*(unsigned __int8 *)(result + 72) >> 1) & 1;
  }
  return result;
}

- (uint64_t)type
{
  if (result)
  {
    if ((*(unsigned char *)(result + 72) & 4) != 0) {
      return *(unsigned int *)(result + 64);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (uint64_t)setType:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 72) |= 4u;
    *(_DWORD *)(result + 64) = a2;
  }
  return result;
}

- (uint64_t)setHasType:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 4;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 72) = *(unsigned char *)(result + 72) & 0xFB | v2;
  }
  return result;
}

- (uint64_t)hasType
{
  if (result) {
    return (*(unsigned __int8 *)(result + 72) >> 2) & 1;
  }
  return result;
}

- (__CFString)typeAsString:(__CFString *)a1
{
  if (a1)
  {
    if (a2 >= 0xE)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a2);
      a1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = off_1E5D0A5B8[(int)a2];
    }
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)StringAsType:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    id v5 = v3;
    if ([v5 isEqualToString:@"Custom"])
    {
      uint64_t v6 = 0;
    }
    else if ([v5 isEqualToString:@"Home"])
    {
      uint64_t v6 = 1;
    }
    else if ([v5 isEqualToString:@"Working"])
    {
      uint64_t v6 = 2;
    }
    else if ([v5 isEqualToString:@"Exercising"])
    {
      uint64_t v6 = 3;
    }
    else if ([v5 isEqualToString:@"Driving"])
    {
      uint64_t v6 = 4;
    }
    else if ([v5 isEqualToString:@"Bedtime"])
    {
      uint64_t v6 = 5;
    }
    else if ([v5 isEqualToString:@"Gaming"])
    {
      uint64_t v6 = 6;
    }
    else if ([v5 isEqualToString:@"Reading"])
    {
      uint64_t v6 = 7;
    }
    else if ([v5 isEqualToString:@"Traveling"])
    {
      uint64_t v6 = 8;
    }
    else if ([v5 isEqualToString:@"Learning"])
    {
      uint64_t v6 = 9;
    }
    else if ([v5 isEqualToString:@"Streaming"])
    {
      uint64_t v6 = 10;
    }
    else if ([v5 isEqualToString:@"ScreenSharing"])
    {
      uint64_t v6 = 11;
    }
    else if ([v5 isEqualToString:@"ClassicDND"])
    {
      uint64_t v6 = 12;
    }
    else if ([v5 isEqualToString:@"ScreenRecording"])
    {
      uint64_t v6 = 13;
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)hasModeUUID
{
  if (result) {
    return *(void *)(result + 24) != 0;
  }
  return result;
}

- (BOOL)hasSuggestionUUID
{
  if (result) {
    return *(void *)(result + 56) != 0;
  }
  return result;
}

- (uint64_t)setOrigin:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 72) |= 1u;
    *(void *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)setHasOrigin:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 72) = *(unsigned char *)(result + 72) & 0xFE | a2;
  }
  return result;
}

- (uint64_t)hasOrigin
{
  if (result) {
    return *(unsigned char *)(result + 72) & 1;
  }
  return result;
}

- (BOOL)hasOriginBundleId
{
  if (result) {
    return *(void *)(result + 40) != 0;
  }
  return result;
}

- (BOOL)hasOriginAnchorType
{
  if (result) {
    return *(void *)(result + 32) != 0;
  }
  return result;
}

- (uint64_t)clearSerializedTriggers
{
  if (result) {
    return [*(id *)(result + 48) removeAllObjects];
  }
  return result;
}

- (uint64_t)addSerializedTriggers:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = *(void **)(a1 + 48);
    id v9 = v4;
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v7 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v6;

      id v5 = *(void **)(a1 + 48);
    }
    id v3 = (id)[v5 addObject:v9];
    id v4 = v9;
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

- (uint64_t)serializedTriggersCount
{
  if (result) {
    return [*(id *)(result + 48) count];
  }
  return result;
}

- (id)serializedTriggersAtIndex:(id *)a1
{
  if (a1)
  {
    a1 = [a1[6] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)setShouldSuggestTriggers:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 72) |= 8u;
    *(unsigned char *)(result + 68) = a2;
  }
  return result;
}

- (uint64_t)setHasShouldSuggestTriggers:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 8;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 72) = *(unsigned char *)(result + 72) & 0xF7 | v2;
  }
  return result;
}

- (uint64_t)hasShouldSuggestTriggers
{
  if (result) {
    return (*(unsigned __int8 *)(result + 72) >> 3) & 1;
  }
  return result;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBActivity;
  id v4 = [(ATXPBActivity *)&v8 description];
  id v5 = [(ATXPBActivity *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    id v5 = [NSNumber numberWithUnsignedLongLong:self->_uiLocation];
    [v3 setObject:v5 forKey:@"uiLocation"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    uint64_t type = self->_type;
    if (type >= 0xE)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E5D0A5B8[type];
    }
    [v3 setObject:v7 forKey:@"type"];
  }
  modeUUID = self->_modeUUID;
  if (modeUUID) {
    [v3 setObject:modeUUID forKey:@"modeUUID"];
  }
  suggestionUUID = self->_suggestionUUID;
  if (suggestionUUID) {
    [v3 setObject:suggestionUUID forKey:@"suggestionUUID"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v10 = [NSNumber numberWithUnsignedLongLong:self->_origin];
    [v3 setObject:v10 forKey:@"origin"];
  }
  originBundleId = self->_originBundleId;
  if (originBundleId) {
    [v3 setObject:originBundleId forKey:@"originBundleId"];
  }
  originAnchorType = self->_originAnchorType;
  if (originAnchorType) {
    [v3 setObject:originAnchorType forKey:@"originAnchorType"];
  }
  serializedTriggers = self->_serializedTriggers;
  if (serializedTriggers) {
    [v3 setObject:serializedTriggers forKey:@"serializedTriggers"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v14 = [NSNumber numberWithBool:self->_shouldSuggestTriggers];
    [v3 setObject:v14 forKey:@"shouldSuggestTriggers"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBActivityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_modeUUID) {
    PBDataWriterWriteStringField();
  }
  if (self->_suggestionUUID) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_originBundleId) {
    PBDataWriterWriteStringField();
  }
  if (self->_originAnchorType) {
    PBDataWriterWriteStringField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = self->_serializedTriggers;
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
        PBDataWriterWriteDataField();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    char v4 = *(unsigned char *)(a1 + 72);
    if ((v4 & 2) != 0)
    {
      v3[2] = *(id *)(a1 + 16);
      *((unsigned char *)v3 + 72) |= 2u;
      char v4 = *(unsigned char *)(a1 + 72);
    }
    if ((v4 & 4) != 0)
    {
      *((_DWORD *)v3 + 16) = *(_DWORD *)(a1 + 64);
      *((unsigned char *)v3 + 72) |= 4u;
    }
    id v5 = *(void **)(a1 + 24);
    long long v13 = v3;
    if (v5)
    {
      -[ATXPBActivity setModeUUID:]((uint64_t)v3, v5);
      id v3 = v13;
    }
    id v6 = *(void **)(a1 + 56);
    if (v6)
    {
      -[ATXPBActivity setSuggestionUUID:]((uint64_t)v13, v6);
      id v3 = v13;
    }
    if (*(unsigned char *)(a1 + 72))
    {
      v3[1] = *(id *)(a1 + 8);
      *((unsigned char *)v3 + 72) |= 1u;
    }
    uint64_t v7 = *(void **)(a1 + 40);
    if (v7) {
      -[ATXPBActivity setOriginBundleId:]((uint64_t)v13, v7);
    }
    uint64_t v8 = *(void **)(a1 + 32);
    if (v8) {
      -[ATXPBActivity setOriginAnchorType:]((uint64_t)v13, v8);
    }
    if ([*(id *)(a1 + 48) count])
    {
      if (v13) {
        [v13[6] removeAllObjects];
      }
      uint64_t v9 = [*(id *)(a1 + 48) count];
      if (v9)
      {
        uint64_t v10 = v9;
        for (uint64_t i = 0; i != v10; ++i)
        {
          long long v12 = [*(id *)(a1 + 48) objectAtIndex:i];
          -[ATXPBActivity addSerializedTriggers:]((uint64_t)v13, v12);
        }
      }
    }
    id v3 = v13;
    if ((*(unsigned char *)(a1 + 72) & 8) != 0)
    {
      *((unsigned char *)v13 + 68) = *(unsigned char *)(a1 + 68);
      *((unsigned char *)v13 + 72) |= 8u;
    }
  }
}

- (void)setModeUUID:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)setSuggestionUUID:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (void)setOriginBundleId:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (void)setOriginAnchorType:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_uiLocation;
    *(unsigned char *)(v5 + 72) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_type;
    *(unsigned char *)(v5 + 72) |= 4u;
  }
  uint64_t v8 = [(NSString *)self->_modeUUID copyWithZone:a3];
  uint64_t v9 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_suggestionUUID copyWithZone:a3];
  long long v11 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v6 + 8) = self->_origin;
    *(unsigned char *)(v6 + 72) |= 1u;
  }
  uint64_t v12 = [(NSString *)self->_originBundleId copyWithZone:a3];
  long long v13 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v12;

  uint64_t v14 = [(NSString *)self->_originAnchorType copyWithZone:a3];
  v15 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v14;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v16 = self->_serializedTriggers;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "copyWithZone:", a3, (void)v23);
        -[ATXPBActivity addSerializedTriggers:](v6, v21);
      }
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v18);
  }

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(unsigned char *)(v6 + 68) = self->_shouldSuggestTriggers;
    *(unsigned char *)(v6 + 72) |= 8u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 2) == 0 || self->_uiLocation != *((void *)v4 + 2)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 2) != 0)
  {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 4) == 0 || self->_type != *((_DWORD *)v4 + 16)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 4) != 0)
  {
    goto LABEL_29;
  }
  modeUUID = self->_modeUUID;
  if ((unint64_t)modeUUID | *((void *)v4 + 3) && !-[NSString isEqual:](modeUUID, "isEqual:")) {
    goto LABEL_29;
  }
  suggestionUUID = self->_suggestionUUID;
  if ((unint64_t)suggestionUUID | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](suggestionUUID, "isEqual:")) {
      goto LABEL_29;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_origin != *((void *)v4 + 1)) {
      goto LABEL_29;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
    goto LABEL_29;
  }
  originBundleId = self->_originBundleId;
  if ((unint64_t)originBundleId | *((void *)v4 + 5)
    && !-[NSString isEqual:](originBundleId, "isEqual:"))
  {
    goto LABEL_29;
  }
  originAnchorType = self->_originAnchorType;
  if ((unint64_t)originAnchorType | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](originAnchorType, "isEqual:")) {
      goto LABEL_29;
    }
  }
  serializedTriggers = self->_serializedTriggers;
  if ((unint64_t)serializedTriggers | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](serializedTriggers, "isEqual:")) {
      goto LABEL_29;
    }
  }
  BOOL v10 = (*((unsigned char *)v4 + 72) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 8) == 0)
    {
LABEL_29:
      BOOL v10 = 0;
      goto LABEL_30;
    }
    if (self->_shouldSuggestTriggers)
    {
      if (!*((unsigned char *)v4 + 68)) {
        goto LABEL_29;
      }
    }
    else if (*((unsigned char *)v4 + 68))
    {
      goto LABEL_29;
    }
    BOOL v10 = 1;
  }
LABEL_30:

  return v10;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unint64_t v3 = 2654435761u * self->_uiLocation;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_type;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_modeUUID hash];
  NSUInteger v6 = [(NSString *)self->_suggestionUUID hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v7 = 2654435761u * self->_origin;
  }
  else {
    unint64_t v7 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_originBundleId hash];
  NSUInteger v9 = [(NSString *)self->_originAnchorType hash];
  uint64_t v10 = [(NSMutableArray *)self->_serializedTriggers hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v11 = 2654435761 * self->_shouldSuggestTriggers;
  }
  else {
    uint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = a2;
  id v4 = v3;
  if (a1)
  {
    char v5 = v3[72];
    if ((v5 & 2) != 0)
    {
      *(void *)(a1 + 16) = *((void *)v3 + 2);
      *(unsigned char *)(a1 + 72) |= 2u;
      char v5 = v3[72];
    }
    if ((v5 & 4) != 0)
    {
      *(_DWORD *)(a1 + 64) = *((_DWORD *)v3 + 16);
      *(unsigned char *)(a1 + 72) |= 4u;
    }
    NSUInteger v6 = (void *)*((void *)v3 + 3);
    if (v6) {
      objc_storeStrong((id *)(a1 + 24), v6);
    }
    unint64_t v7 = (void *)*((void *)v4 + 7);
    if (v7) {
      objc_storeStrong((id *)(a1 + 56), v7);
    }
    if (*((unsigned char *)v4 + 72))
    {
      *(void *)(a1 + 8) = *((void *)v4 + 1);
      *(unsigned char *)(a1 + 72) |= 1u;
    }
    NSUInteger v8 = (void *)*((void *)v4 + 5);
    if (v8) {
      objc_storeStrong((id *)(a1 + 40), v8);
    }
    NSUInteger v9 = (void *)*((void *)v4 + 4);
    if (v9) {
      objc_storeStrong((id *)(a1 + 32), v9);
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v10 = *((id *)v4 + 6);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          -[ATXPBActivity addSerializedTriggers:](a1, *(void **)(*((void *)&v15 + 1) + 8 * i));
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v12);
    }

    if ((*((unsigned char *)v4 + 72) & 8) != 0)
    {
      *(unsigned char *)(a1 + 68) = *((unsigned char *)v4 + 68);
      *(unsigned char *)(a1 + 72) |= 8u;
    }
  }
}

- (uint64_t)uiLocation
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (uint64_t)modeUUID
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (uint64_t)suggestionUUID
{
  if (result) {
    return *(void *)(result + 56);
  }
  return result;
}

- (uint64_t)origin
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (uint64_t)originBundleId
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

- (uint64_t)originAnchorType
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

- (uint64_t)serializedTriggers
{
  if (result) {
    return *(void *)(result + 48);
  }
  return result;
}

- (void)setSerializedTriggers:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (BOOL)shouldSuggestTriggers
{
  if (result) {
    return *(unsigned char *)(result + 68) != 0;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionUUID, 0);
  objc_storeStrong((id *)&self->_serializedTriggers, 0);
  objc_storeStrong((id *)&self->_originBundleId, 0);
  objc_storeStrong((id *)&self->_originAnchorType, 0);

  objc_storeStrong((id *)&self->_modeUUID, 0);
}

@end