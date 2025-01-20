@interface CellularNrSdmEndcRelease
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)hasTriggerCause;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)triggerCauseAsString:(int)a3;
- (int)StringAsTriggerCause:(id)a3;
- (int)triggerCause;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)subsId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTriggerCause:(BOOL)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTriggerCause:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularNrSdmEndcRelease

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)triggerCause
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_triggerCause;
  }
  else {
    return 0;
  }
}

- (void)setTriggerCause:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_triggerCause = a3;
}

- (void)setHasTriggerCause:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTriggerCause
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)triggerCauseAsString:(int)a3
{
  if (a3 >= 0xC)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_100287F78 + a3);
  }

  return v3;
}

- (int)StringAsTriggerCause:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_NONE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_AP_SLEEP"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_CELLULAR_DATA"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_WIFI_POOR"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_VOIP_CALL"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_COREMEDIA_STALL"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_SCREEN_STATUS"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_SYMPTOMS_RECOMM"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_UI_SWITCH"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_RLGS"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_PHS"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"SDM_TRIGGER_CAUSE_MAX"])
  {
    int v4 = 11;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setSubsId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSubsId
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularNrSdmEndcRelease;
  char v3 = [(CellularNrSdmEndcRelease *)&v7 description];
  int v4 = [(CellularNrSdmEndcRelease *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v7 forKey:@"timestamp"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  uint64_t triggerCause = self->_triggerCause;
  if (triggerCause >= 0xC)
  {
    v9 = +[NSString stringWithFormat:@"(unknown: %i)", self->_triggerCause];
  }
  else
  {
    v9 = *(&off_100287F78 + triggerCause);
  }
  [v3 setObject:v9 forKey:@"trigger_cause"];

  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  v5 = +[NSNumber numberWithUnsignedInt:self->_subsId];
  [v3 setObject:v5 forKey:@"subs_id"];

LABEL_5:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000EAFAC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_5:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 24) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 5) = self->_triggerCause;
  *((unsigned char *)v4 + 24) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    *((_DWORD *)v4 + 4) = self->_subsId;
    *((unsigned char *)v4 + 24) |= 2u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((unsigned char *)result + 24) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 5) = self->_triggerCause;
  *((unsigned char *)result + 24) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 4) = self->_subsId;
  *((unsigned char *)result + 24) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 4) == 0 || self->_triggerCause != *((_DWORD *)v4 + 5)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) != 0)
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 24) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_subsId != *((_DWORD *)v4 + 4)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  unint64_t v2 = 2654435761u * self->_timestamp;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_triggerCause;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_subsId;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 24);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 24);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t triggerCause = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
LABEL_4:
    self->_subsId = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)subsId
{
  return self->_subsId;
}

@end