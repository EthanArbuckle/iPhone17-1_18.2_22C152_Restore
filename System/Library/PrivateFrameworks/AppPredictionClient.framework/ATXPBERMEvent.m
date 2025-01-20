@interface ATXPBERMEvent
+ (uint64_t)clientModelIdType;
- (BOOL)hasExecutable;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (__CFString)eventTypeAsString:(__CFString *)a1;
- (__CFString)executableTypeAsString:(__CFString *)a1;
- (double)dateEngaged;
- (double)eventDate;
- (id)clientModelIdAtIndex:(id *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)StringAsEventType:(uint64_t)a1;
- (uint64_t)StringAsExecutableType:(uint64_t)a1;
- (uint64_t)addClientModelId:(uint64_t)a1;
- (uint64_t)clearClientModelIds;
- (uint64_t)clientModelIds;
- (uint64_t)clientModelIdsCount;
- (uint64_t)engagementType;
- (uint64_t)eventType;
- (uint64_t)executable;
- (uint64_t)executableType;
- (uint64_t)hasDateEngaged;
- (uint64_t)hasEngagementType;
- (uint64_t)hasEventDate;
- (uint64_t)hasEventType;
- (uint64_t)hasExecutableType;
- (uint64_t)setDateEngaged:(uint64_t)result;
- (uint64_t)setEngagementType:(uint64_t)result;
- (uint64_t)setEventDate:(uint64_t)result;
- (uint64_t)setEventType:(uint64_t)result;
- (uint64_t)setExecutableType:(uint64_t)result;
- (uint64_t)setHasDateEngaged:(uint64_t)result;
- (uint64_t)setHasEngagementType:(uint64_t)result;
- (uint64_t)setHasEventDate:(uint64_t)result;
- (uint64_t)setHasEventType:(uint64_t)result;
- (uint64_t)setHasExecutableType:(uint64_t)result;
- (unint64_t)hash;
- (void)copyTo:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)setClientModelIds:(uint64_t)a1;
- (void)setExecutable:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBERMEvent

- (uint64_t)setEventDate:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 60) |= 4u;
    *(double *)(result + 24) = a2;
  }
  return result;
}

- (uint64_t)setHasEventDate:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 4;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 60) = *(unsigned char *)(result + 60) & 0xFB | v2;
  }
  return result;
}

- (uint64_t)hasEventDate
{
  if (result) {
    return (*(unsigned __int8 *)(result + 60) >> 2) & 1;
  }
  return result;
}

- (uint64_t)eventType
{
  if (result)
  {
    if ((*(unsigned char *)(result + 60) & 8) != 0) {
      return *(unsigned int *)(result + 40);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (uint64_t)setEventType:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 60) |= 8u;
    *(_DWORD *)(result + 40) = a2;
  }
  return result;
}

- (uint64_t)setHasEventType:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 8;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 60) = *(unsigned char *)(result + 60) & 0xF7 | v2;
  }
  return result;
}

- (uint64_t)hasEventType
{
  if (result) {
    return (*(unsigned __int8 *)(result + 60) >> 3) & 1;
  }
  return result;
}

- (__CFString)eventTypeAsString:(__CFString *)a1
{
  if (!a1)
  {
LABEL_11:
    return a1;
  }
  if (a2)
  {
    if (a2 == 1)
    {
      a1 = @"AddedEntry";
      return a1;
    }
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a2);
    a1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  a1 = @"Unknown";
  return a1;
}

- (uint64_t)StringAsEventType:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    if ([v3 isEqualToString:@"Unknown"]) {
      a1 = 0;
    }
    else {
      a1 = [v4 isEqualToString:@"AddedEntry"];
    }
  }

  return a1;
}

- (uint64_t)setDateEngaged:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 60) |= 1u;
    *(double *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)setHasDateEngaged:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 60) = *(unsigned char *)(result + 60) & 0xFE | a2;
  }
  return result;
}

- (uint64_t)hasDateEngaged
{
  if (result) {
    return *(unsigned char *)(result + 60) & 1;
  }
  return result;
}

- (uint64_t)setEngagementType:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 60) |= 2u;
    *(void *)(result + 16) = a2;
  }
  return result;
}

- (uint64_t)setHasEngagementType:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 2;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 60) = *(unsigned char *)(result + 60) & 0xFD | v2;
  }
  return result;
}

- (uint64_t)hasEngagementType
{
  if (result) {
    return (*(unsigned __int8 *)(result + 60) >> 1) & 1;
  }
  return result;
}

- (uint64_t)executableType
{
  if (result)
  {
    if ((*(unsigned char *)(result + 60) & 0x10) != 0) {
      return *(unsigned int *)(result + 56);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (uint64_t)setExecutableType:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 60) |= 0x10u;
    *(_DWORD *)(result + 56) = a2;
  }
  return result;
}

- (uint64_t)setHasExecutableType:(uint64_t)result
{
  if (result)
  {
    if (a2) {
      char v2 = 16;
    }
    else {
      char v2 = 0;
    }
    *(unsigned char *)(result + 60) = *(unsigned char *)(result + 60) & 0xEF | v2;
  }
  return result;
}

- (uint64_t)hasExecutableType
{
  if (result) {
    return (*(unsigned __int8 *)(result + 60) >> 4) & 1;
  }
  return result;
}

- (__CFString)executableTypeAsString:(__CFString *)a1
{
  if (a1)
  {
    if (a2 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", a2);
      a1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a1 = off_1E5D05F80[(int)a2];
    }
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)StringAsExecutableType:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    id v5 = v3;
    if ([v5 isEqualToString:@"unknown"])
    {
      uint64_t v6 = 0;
    }
    else if ([v5 isEqualToString:@"string"])
    {
      uint64_t v6 = 1;
    }
    else if ([v5 isEqualToString:@"action"])
    {
      uint64_t v6 = 2;
    }
    else if ([v5 isEqualToString:@"heroAppPrediction"])
    {
      uint64_t v6 = 3;
    }
    else if ([v5 isEqualToString:@"infoSuggestion"])
    {
      uint64_t v6 = 4;
    }
    else if ([v5 isEqualToString:@"linkAction"])
    {
      uint64_t v6 = 5;
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

- (BOOL)hasExecutable
{
  if (result) {
    return *(void *)(result + 48) != 0;
  }
  return result;
}

- (uint64_t)clearClientModelIds
{
  if (result) {
    return [*(id *)(result + 32) removeAllObjects];
  }
  return result;
}

- (uint64_t)addClientModelId:(uint64_t)a1
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

- (uint64_t)clientModelIdsCount
{
  if (result) {
    return [*(id *)(result + 32) count];
  }
  return result;
}

- (id)clientModelIdAtIndex:(id *)a1
{
  if (a1)
  {
    a1 = [a1[4] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

+ (uint64_t)clientModelIdType
{
  self;

  return objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBERMEvent;
  id v4 = [(ATXPBERMEvent *)&v8 description];
  id v5 = [(ATXPBERMEvent *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    id v5 = [NSNumber numberWithDouble:self->_eventDate];
    [v3 setObject:v5 forKey:@"eventDate"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  int eventType = self->_eventType;
  if (eventType)
  {
    if (eventType == 1)
    {
      v7 = @"AddedEntry";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_eventType);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = @"Unknown";
  }
  [v3 setObject:v7 forKey:@"eventType"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  objc_super v8 = [NSNumber numberWithDouble:self->_dateEngaged];
  [v3 setObject:v8 forKey:@"dateEngaged"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_20;
    }
    goto LABEL_16;
  }
LABEL_15:
  id v9 = [NSNumber numberWithUnsignedLongLong:self->_engagementType];
  [v3 setObject:v9 forKey:@"engagementType"];

  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_20;
  }
LABEL_16:
  uint64_t executableType = self->_executableType;
  if (executableType >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_executableType);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = off_1E5D05F80[executableType];
  }
  [v3 setObject:v11 forKey:@"executableType"];

LABEL_20:
  executable = self->_executable;
  if (executable) {
    [v3 setObject:executable forKey:@"executable"];
  }
  clientModelIds = self->_clientModelIds;
  if (clientModelIds) {
    [v3 setObject:clientModelIds forKey:@"clientModelId"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBERMEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_20:
  PBDataWriterWriteUint64Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_6:
  }
    PBDataWriterWriteInt32Field();
LABEL_7:
  if (self->_executable) {
    PBDataWriterWriteDataField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = self->_clientModelIds;
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
  v10 = a2;
  if (!a1) {
    goto LABEL_19;
  }
  char v3 = *(unsigned char *)(a1 + 60);
  if ((v3 & 4) != 0)
  {
    id v4 = v10;
    v10[3] = *(id *)(a1 + 24);
    *((unsigned char *)v10 + 60) |= 4u;
    char v3 = *(unsigned char *)(a1 + 60);
    if ((v3 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id v4 = v10;
  if ((*(unsigned char *)(a1 + 60) & 8) != 0)
  {
LABEL_6:
    *((_DWORD *)v4 + 10) = *(_DWORD *)(a1 + 40);
    *((unsigned char *)v4 + 60) |= 8u;
    char v3 = *(unsigned char *)(a1 + 60);
  }
LABEL_7:
  if ((v3 & 1) == 0)
  {
    if ((v3 & 2) == 0) {
      goto LABEL_9;
    }
LABEL_23:
    v4[2] = *(id *)(a1 + 16);
    *((unsigned char *)v4 + 60) |= 2u;
    if ((*(unsigned char *)(a1 + 60) & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  v4[1] = *(id *)(a1 + 8);
  *((unsigned char *)v4 + 60) |= 1u;
  char v3 = *(unsigned char *)(a1 + 60);
  if ((v3 & 2) != 0) {
    goto LABEL_23;
  }
LABEL_9:
  if ((v3 & 0x10) != 0)
  {
LABEL_10:
    *((_DWORD *)v4 + 14) = *(_DWORD *)(a1 + 56);
    *((unsigned char *)v4 + 60) |= 0x10u;
  }
LABEL_11:
  id v5 = *(void **)(a1 + 48);
  if (v5) {
    -[ATXPBERMEvent setExecutable:]((uint64_t)v10, v5);
  }
  if ([*(id *)(a1 + 32) count])
  {
    if (v10) {
      [v10[4] removeAllObjects];
    }
    uint64_t v6 = [*(id *)(a1 + 32) count];
    if (v6)
    {
      uint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [*(id *)(a1 + 32) objectAtIndex:i];
        -[ATXPBERMEvent addClientModelId:]((uint64_t)v10, v9);
      }
    }
  }
LABEL_19:
}

- (void)setExecutable:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(double *)(v5 + 24) = self->_eventDate;
    *(unsigned char *)(v5 + 60) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 40) = self->_eventType;
  *(unsigned char *)(v5 + 60) |= 8u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  *(double *)(v5 + 8) = self->_dateEngaged;
  *(unsigned char *)(v5 + 60) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_18:
  *(void *)(v5 + 16) = self->_engagementType;
  *(unsigned char *)(v5 + 60) |= 2u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    *(_DWORD *)(v5 + 56) = self->_executableType;
    *(unsigned char *)(v5 + 60) |= 0x10u;
  }
LABEL_7:
  uint64_t v8 = [(NSData *)self->_executable copyWithZone:a3];
  uint64_t v9 = (void *)v6[6];
  v6[6] = v8;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v10 = self->_clientModelIds;
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
        -[ATXPBERMEvent addClientModelId:]((uint64_t)v6, v15);
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
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 4) == 0 || self->_eventDate != *((double *)v4 + 3)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 4) != 0)
  {
LABEL_31:
    char v7 = 0;
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 8) == 0 || self->_eventType != *((_DWORD *)v4 + 10)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 8) != 0)
  {
    goto LABEL_31;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_dateEngaged != *((double *)v4 + 1)) {
      goto LABEL_31;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_engagementType != *((void *)v4 + 2)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 0x10) == 0 || self->_executableType != *((_DWORD *)v4 + 14)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 0x10) != 0)
  {
    goto LABEL_31;
  }
  executable = self->_executable;
  if ((unint64_t)executable | *((void *)v4 + 6) && !-[NSData isEqual:](executable, "isEqual:")) {
    goto LABEL_31;
  }
  clientModelIds = self->_clientModelIds;
  if ((unint64_t)clientModelIds | *((void *)v4 + 4)) {
    char v7 = -[NSMutableArray isEqual:](clientModelIds, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_32:

  return v7;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    double eventDate = self->_eventDate;
    double v6 = -eventDate;
    if (eventDate >= 0.0) {
      double v6 = self->_eventDate;
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
  if ((has & 8) != 0)
  {
    uint64_t v9 = 2654435761 * self->_eventType;
    if (has) {
      goto LABEL_11;
    }
LABEL_16:
    unint64_t v14 = 0;
    goto LABEL_19;
  }
  uint64_t v9 = 0;
  if ((has & 1) == 0) {
    goto LABEL_16;
  }
LABEL_11:
  double dateEngaged = self->_dateEngaged;
  double v11 = -dateEngaged;
  if (dateEngaged >= 0.0) {
    double v11 = self->_dateEngaged;
  }
  long double v12 = floor(v11 + 0.5);
  double v13 = (v11 - v12) * 1.84467441e19;
  unint64_t v14 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
  if (v13 >= 0.0)
  {
    if (v13 > 0.0) {
      v14 += (unint64_t)v13;
    }
  }
  else
  {
    v14 -= (unint64_t)fabs(v13);
  }
LABEL_19:
  if ((has & 2) != 0)
  {
    unint64_t v15 = 2654435761u * self->_engagementType;
    if ((has & 0x10) != 0) {
      goto LABEL_21;
    }
LABEL_23:
    uint64_t v16 = 0;
    goto LABEL_24;
  }
  unint64_t v15 = 0;
  if ((has & 0x10) == 0) {
    goto LABEL_23;
  }
LABEL_21:
  uint64_t v16 = 2654435761 * self->_executableType;
LABEL_24:
  uint64_t v17 = v9 ^ v4 ^ v14 ^ v15 ^ v16 ^ [(NSData *)self->_executable hash];
  return v17 ^ [(NSMutableArray *)self->_clientModelIds hash];
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v3 = a2;
  unint64_t v4 = v3;
  if (!a1) {
    goto LABEL_18;
  }
  char v5 = *((unsigned char *)v3 + 60);
  if ((v5 & 4) != 0)
  {
    *(void *)(a1 + 24) = v3[3];
    *(unsigned char *)(a1 + 60) |= 4u;
    char v5 = *((unsigned char *)v3 + 60);
    if ((v5 & 8) == 0)
    {
LABEL_4:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v3 + 60) & 8) == 0)
  {
    goto LABEL_4;
  }
  *(_DWORD *)(a1 + 40) = *((_DWORD *)v3 + 10);
  *(unsigned char *)(a1 + 60) |= 8u;
  char v5 = *((unsigned char *)v3 + 60);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0) {
      goto LABEL_6;
    }
LABEL_22:
    *(void *)(a1 + 16) = v3[2];
    *(unsigned char *)(a1 + 60) |= 2u;
    if ((*((unsigned char *)v3 + 60) & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_21:
  *(void *)(a1 + 8) = v3[1];
  *(unsigned char *)(a1 + 60) |= 1u;
  char v5 = *((unsigned char *)v3 + 60);
  if ((v5 & 2) != 0) {
    goto LABEL_22;
  }
LABEL_6:
  if ((v5 & 0x10) != 0)
  {
LABEL_7:
    *(_DWORD *)(a1 + 56) = *((_DWORD *)v3 + 14);
    *(unsigned char *)(a1 + 60) |= 0x10u;
  }
LABEL_8:
  id v6 = v3[6];
  if (v6) {
    objc_storeStrong((id *)(a1 + 48), v6);
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
        -[ATXPBERMEvent addClientModelId:](a1, *(void **)(*((void *)&v12 + 1) + 8 * i));
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

LABEL_18:
}

- (double)eventDate
{
  if (a1) {
    return *(double *)(a1 + 24);
  }
  else {
    return 0.0;
  }
}

- (double)dateEngaged
{
  if (a1) {
    return *(double *)(a1 + 8);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)engagementType
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (uint64_t)executable
{
  if (result) {
    return *(void *)(result + 48);
  }
  return result;
}

- (uint64_t)clientModelIds
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

- (void)setClientModelIds:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executable, 0);

  objc_storeStrong((id *)&self->_clientModelIds, 0);
}

@end