@interface ATXPredictionUpdateCountPBPredictionUpdateCountTracker
- (BOOL)hasAbGroup;
- (BOOL)hasClientType;
- (BOOL)hasTriggerType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)abGroup;
- (id)clientTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)triggerTypeAsString:(int)a3;
- (int)StringAsClientType:(id)a3;
- (int)StringAsTriggerType:(id)a3;
- (int)clientType;
- (int)triggerType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbGroup:(id)a3;
- (void)setClientType:(int)a3;
- (void)setHasClientType:(BOOL)a3;
- (void)setHasTriggerType:(BOOL)a3;
- (void)setTriggerType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPredictionUpdateCountPBPredictionUpdateCountTracker

- (int)triggerType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_triggerType;
  }
  else {
    return 0;
  }
}

- (void)setTriggerType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_triggerType = a3;
}

- (void)setHasTriggerType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTriggerType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)triggerTypeAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E68B4DF8[a3];
  }
  return v3;
}

- (int)StringAsTriggerType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"TRIGGER_TYPE_CTS"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TRIGGER_TYPE_APPLAUNCH"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TRIGGER_TYPE_APPFEEDBACK"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TRIGGER_TYPE_ACTIONFEEDBACK"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"TRIGGER_TYPE_HEROAPP"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"TRIGGER_TYPE_MAGICALMOMENTS"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"TRIGGER_TYPE_OTHER"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"TRIGGER_TYPE_TOTAL"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)clientType
{
  if (*(unsigned char *)&self->_has) {
    return self->_clientType;
  }
  else {
    return 0;
  }
}

- (void)setClientType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_clientType = a3;
}

- (void)setHasClientType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasClientType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)clientTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"CLIENT_ACTION_PREDICTIONS";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"CLIENT_APP_PREDICTIONS";
  }
  return v4;
}

- (int)StringAsClientType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CLIENT_APP_PREDICTIONS"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"CLIENT_ACTION_PREDICTIONS"];
  }

  return v4;
}

- (BOOL)hasAbGroup
{
  return self->_abGroup != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPredictionUpdateCountPBPredictionUpdateCountTracker;
  int v4 = [(ATXPredictionUpdateCountPBPredictionUpdateCountTracker *)&v8 description];
  v5 = [(ATXPredictionUpdateCountPBPredictionUpdateCountTracker *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t triggerType = self->_triggerType;
    if (triggerType >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_triggerType);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E68B4DF8[triggerType];
    }
    [v3 setObject:v6 forKey:@"triggerType"];

    char has = (char)self->_has;
  }
  if (has)
  {
    int clientType = self->_clientType;
    if (clientType)
    {
      if (clientType == 1)
      {
        objc_super v8 = @"CLIENT_ACTION_PREDICTIONS";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_clientType);
        objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      objc_super v8 = @"CLIENT_APP_PREDICTIONS";
    }
    [v3 setObject:v8 forKey:@"clientType"];
  }
  abGroup = self->_abGroup;
  if (abGroup) {
    [v3 setObject:abGroup forKey:@"abGroup"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPredictionUpdateCountPBPredictionUpdateCountTrackerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_abGroup)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[5] = self->_triggerType;
    *((unsigned char *)v4 + 24) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[4] = self->_clientType;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  if (self->_abGroup)
  {
    id v6 = v4;
    objc_msgSend(v4, "setAbGroup:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_triggerType;
    *(unsigned char *)(v5 + 24) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 16) = self->_clientType;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_abGroup copyWithZone:a3];
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_triggerType != *((_DWORD *)v4 + 5)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
LABEL_14:
    char v6 = 0;
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_clientType != *((_DWORD *)v4 + 4)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_14;
  }
  abGroup = self->_abGroup;
  if ((unint64_t)abGroup | *((void *)v4 + 1)) {
    char v6 = -[NSString isEqual:](abGroup, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_triggerType;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(NSString *)self->_abGroup hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_clientType;
  return v3 ^ v2 ^ [(NSString *)self->_abGroup hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 2) != 0)
  {
    self->_uint64_t triggerType = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 24);
  }
  if (v5)
  {
    self->_int clientType = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    id v6 = v4;
    -[ATXPredictionUpdateCountPBPredictionUpdateCountTracker setAbGroup:](self, "setAbGroup:");
    id v4 = v6;
  }
}

- (NSString)abGroup
{
  return self->_abGroup;
}

- (void)setAbGroup:(id)a3
{
}

- (void).cxx_destruct
{
}

@end