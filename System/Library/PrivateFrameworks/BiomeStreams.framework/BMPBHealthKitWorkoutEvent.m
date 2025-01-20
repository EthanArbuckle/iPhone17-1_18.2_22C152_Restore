@interface BMPBHealthKitWorkoutEvent
- (BOOL)hasActivityType;
- (BOOL)hasActivityUUID;
- (BOOL)hasEventType;
- (BOOL)hasIsFirstPartyDonation;
- (BOOL)hasIsIndoor;
- (BOOL)hasIsUpdate;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFirstPartyDonation;
- (BOOL)isIndoor;
- (BOOL)isUpdate;
- (BOOL)readFrom:(id)a3;
- (NSString)activityType;
- (NSString)activityUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)eventTypeAsString:(int)a3;
- (int)StringAsEventType:(id)a3;
- (int)eventType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivityType:(id)a3;
- (void)setActivityUUID:(id)a3;
- (void)setEventType:(int)a3;
- (void)setHasEventType:(BOOL)a3;
- (void)setHasIsFirstPartyDonation:(BOOL)a3;
- (void)setHasIsIndoor:(BOOL)a3;
- (void)setHasIsUpdate:(BOOL)a3;
- (void)setIsFirstPartyDonation:(BOOL)a3;
- (void)setIsIndoor:(BOOL)a3;
- (void)setIsUpdate:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBHealthKitWorkoutEvent

- (void)setIsFirstPartyDonation:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isFirstPartyDonation = a3;
}

- (void)setHasIsFirstPartyDonation:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsFirstPartyDonation
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsIndoor:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_isIndoor = a3;
}

- (void)setHasIsIndoor:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsIndoor
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasActivityType
{
  return self->_activityType != 0;
}

- (int)eventType
{
  if (*(unsigned char *)&self->_has) {
    return self->_eventType;
  }
  else {
    return 0;
  }
}

- (void)setEventType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_eventType = a3;
}

- (void)setHasEventType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEventType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)eventTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E55D7798[a3];
  }

  return v3;
}

- (int)StringAsEventType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Start"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Stop"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Resume"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Pause"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasActivityUUID
{
  return self->_activityUUID != 0;
}

- (void)setIsUpdate:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_isUpdate = a3;
}

- (void)setHasIsUpdate:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsUpdate
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBHealthKitWorkoutEvent;
  int v4 = [(BMPBHealthKitWorkoutEvent *)&v8 description];
  v5 = [(BMPBHealthKitWorkoutEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = [NSNumber numberWithBool:self->_isFirstPartyDonation];
    [v3 setObject:v5 forKey:@"isFirstPartyDonation"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v6 = [NSNumber numberWithBool:self->_isIndoor];
    [v3 setObject:v6 forKey:@"isIndoor"];
  }
  activityType = self->_activityType;
  if (activityType) {
    [v3 setObject:activityType forKey:@"activityType"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t eventType = self->_eventType;
    if (eventType >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_eventType);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E55D7798[eventType];
    }
    [v3 setObject:v9 forKey:@"eventType"];
  }
  activityUUID = self->_activityUUID;
  if (activityUUID) {
    [v3 setObject:activityUUID forKey:@"activityUUID"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v11 = [NSNumber numberWithBool:self->_isUpdate];
    [v3 setObject:v11 forKey:@"isUpdate"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBHealthKitWorkoutEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_activityType) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_activityUUID) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[28] = self->_isFirstPartyDonation;
    v4[32] |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v4[29] = self->_isIndoor;
    v4[32] |= 4u;
  }
  v6 = v4;
  if (self->_activityType)
  {
    objc_msgSend(v4, "setActivityType:");
    int v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 6) = self->_eventType;
    v4[32] |= 1u;
  }
  if (self->_activityUUID)
  {
    objc_msgSend(v6, "setActivityUUID:");
    int v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v4[30] = self->_isUpdate;
    v4[32] |= 8u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (unsigned char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5[28] = self->_isFirstPartyDonation;
    v5[32] |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v5[29] = self->_isIndoor;
    v5[32] |= 4u;
  }
  uint64_t v8 = [(NSString *)self->_activityType copyWithZone:a3];
  v9 = (void *)*((void *)v6 + 1);
  *((void *)v6 + 1) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v6 + 6) = self->_eventType;
    v6[32] |= 1u;
  }
  uint64_t v10 = [(NSString *)self->_activityUUID copyWithZone:a3];
  v11 = (void *)*((void *)v6 + 2);
  *((void *)v6 + 2) = v10;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v6[30] = self->_isUpdate;
    v6[32] |= 8u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0) {
      goto LABEL_31;
    }
    if (self->_isFirstPartyDonation)
    {
      if (!*((unsigned char *)v4 + 28)) {
        goto LABEL_31;
      }
    }
    else if (*((unsigned char *)v4 + 28))
    {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0) {
      goto LABEL_31;
    }
    if (self->_isIndoor)
    {
      if (!*((unsigned char *)v4 + 29)) {
        goto LABEL_31;
      }
    }
    else if (*((unsigned char *)v4 + 29))
    {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_31;
  }
  activityType = self->_activityType;
  if ((unint64_t)activityType | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](activityType, "isEqual:")) {
      goto LABEL_31;
    }
    char has = (char)self->_has;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_eventType != *((_DWORD *)v4 + 6)) {
      goto LABEL_31;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_31;
  }
  activityUUID = self->_activityUUID;
  if ((unint64_t)activityUUID | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](activityUUID, "isEqual:")) {
      goto LABEL_31;
    }
    char has = (char)self->_has;
  }
  BOOL v8 = (*((unsigned char *)v4 + 32) & 8) == 0;
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 8) != 0)
    {
      if (self->_isUpdate)
      {
        if (!*((unsigned char *)v4 + 30)) {
          goto LABEL_31;
        }
      }
      else if (*((unsigned char *)v4 + 30))
      {
        goto LABEL_31;
      }
      BOOL v8 = 1;
      goto LABEL_32;
    }
LABEL_31:
    BOOL v8 = 0;
  }
LABEL_32:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_isFirstPartyDonation;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_isIndoor;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_activityType hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_eventType;
  }
  else {
    uint64_t v6 = 0;
  }
  NSUInteger v7 = [(NSString *)self->_activityUUID hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v8 = 2654435761 * self->_isUpdate;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v5 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 2) != 0)
  {
    self->_isFirstPartyDonation = *((unsigned char *)v4 + 28);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 32);
  }
  if ((v5 & 4) != 0)
  {
    self->_isIndoor = *((unsigned char *)v4 + 29);
    *(unsigned char *)&self->_has |= 4u;
  }
  id v6 = v4;
  if (*((void *)v4 + 1))
  {
    -[BMPBHealthKitWorkoutEvent setActivityType:](self, "setActivityType:");
    id v4 = v6;
  }
  if (*((unsigned char *)v4 + 32))
  {
    self->_uint64_t eventType = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    -[BMPBHealthKitWorkoutEvent setActivityUUID:](self, "setActivityUUID:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 32) & 8) != 0)
  {
    self->_isUpdate = *((unsigned char *)v4 + 30);
    *(unsigned char *)&self->_has |= 8u;
  }
}

- (BOOL)isFirstPartyDonation
{
  return self->_isFirstPartyDonation;
}

- (BOOL)isIndoor
{
  return self->_isIndoor;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(id)a3
{
}

- (NSString)activityUUID
{
  return self->_activityUUID;
}

- (void)setActivityUUID:(id)a3
{
}

- (BOOL)isUpdate
{
  return self->_isUpdate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityUUID, 0);

  objc_storeStrong((id *)&self->_activityType, 0);
}

@end