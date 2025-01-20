@interface CellularNrRrcState
- (BOOL)hasDeployment;
- (BOOL)hasNumSubs;
- (BOOL)hasPlmn;
- (BOOL)hasPsPref;
- (BOOL)hasState;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)plmn;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deploymentAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsDeployment:(id)a3;
- (int)deployment;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)numSubs;
- (unsigned)psPref;
- (unsigned)state;
- (unsigned)subsId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeployment:(int)a3;
- (void)setHasDeployment:(BOOL)a3;
- (void)setHasNumSubs:(BOOL)a3;
- (void)setHasPsPref:(BOOL)a3;
- (void)setHasState:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setNumSubs:(unsigned int)a3;
- (void)setPlmn:(id)a3;
- (void)setPsPref:(unsigned int)a3;
- (void)setState:(unsigned int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation CellularNrRrcState

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

- (void)setState:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_state = a3;
}

- (void)setHasState:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasState
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (int)deployment
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_deployment;
  }
  else {
    return 0;
  }
}

- (void)setDeployment:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_deployment = a3;
}

- (void)setHasDeployment:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDeployment
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)deploymentAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"DEPLOYMENT_NSA";
    }
    else
    {
      v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
    }
  }
  else
  {
    v4 = @"DEPLOYMENT_SA";
  }
  return v4;
}

- (int)StringAsDeployment:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DEPLOYMENT_SA"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"DEPLOYMENT_NSA"];
  }

  return v4;
}

- (void)setSubsId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSubsId
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setNumSubs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_numSubs = a3;
}

- (void)setHasNumSubs:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumSubs
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPsPref:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_psPref = a3;
}

- (void)setHasPsPref:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPsPref
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasPlmn
{
  return self->_plmn != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CellularNrRrcState;
  char v3 = [(CellularNrRrcState *)&v7 description];
  int v4 = [(CellularNrRrcState *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v8 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v8 forKey:@"timestamp"];

    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  v9 = +[NSNumber numberWithUnsignedInt:self->_state];
  [v3 setObject:v9 forKey:@"state"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_15:
  int deployment = self->_deployment;
  if (deployment)
  {
    if (deployment == 1)
    {
      v11 = @"DEPLOYMENT_NSA";
    }
    else
    {
      v11 = +[NSString stringWithFormat:@"(unknown: %i)", self->_deployment];
    }
  }
  else
  {
    v11 = @"DEPLOYMENT_SA";
  }
  [v3 setObject:v11 forKey:@"deployment"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  v12 = +[NSNumber numberWithUnsignedInt:self->_subsId];
  [v3 setObject:v12 forKey:@"subs_id"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_22:
  v13 = +[NSNumber numberWithUnsignedInt:self->_numSubs];
  [v3 setObject:v13 forKey:@"num_subs"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    v5 = +[NSNumber numberWithUnsignedInt:self->_psPref];
    [v3 setObject:v5 forKey:@"ps_pref"];
  }
LABEL_8:
  plmn = self->_plmn;
  if (plmn) {
    [v3 setObject:plmn forKey:@"plmn"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10007E698((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_6:
  }
    PBDataWriterWriteUint32Field();
LABEL_7:
  if (self->_plmn) {
    PBDataWriterWriteDataField();
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 44) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 9) = self->_state;
  *((unsigned char *)v4 + 44) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)v4 + 4) = self->_deployment;
  *((unsigned char *)v4 + 44) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_17:
  *((_DWORD *)v4 + 5) = self->_numSubs;
  *((unsigned char *)v4 + 44) |= 4u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_6:
    *((_DWORD *)v4 + 8) = self->_psPref;
    *((unsigned char *)v4 + 44) |= 8u;
  }
LABEL_7:
  if (self->_plmn)
  {
    v6 = v4;
    [v4 setPlmn:];
    int v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_subsId;
    *((unsigned char *)v4 + 44) |= 0x20u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    v5[1] = self->_timestamp;
    *((unsigned char *)v5 + 44) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 9) = self->_state;
  *((unsigned char *)v5 + 44) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)v5 + 4) = self->_deployment;
  *((unsigned char *)v5 + 44) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  *((_DWORD *)v5 + 5) = self->_numSubs;
  *((unsigned char *)v5 + 44) |= 4u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_6:
    *((_DWORD *)v5 + 8) = self->_psPref;
    *((unsigned char *)v5 + 44) |= 8u;
  }
LABEL_7:
  id v8 = [(NSData *)self->_plmn copyWithZone:a3];
  v9 = (void *)v6[3];
  v6[3] = v8;

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *((_DWORD *)v6 + 10) = self->_subsId;
    *((unsigned char *)v6 + 44) |= 0x20u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_34;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_34;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 0x10) == 0 || self->_state != *((_DWORD *)v4 + 9)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 0x10) != 0)
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_deployment != *((_DWORD *)v4 + 4)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0 || self->_numSubs != *((_DWORD *)v4 + 5)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
    goto LABEL_34;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 8) == 0 || self->_psPref != *((_DWORD *)v4 + 8)) {
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 8) != 0)
  {
    goto LABEL_34;
  }
  plmn = self->_plmn;
  if ((unint64_t)plmn | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](plmn, "isEqual:"))
    {
LABEL_34:
      BOOL v7 = 0;
      goto LABEL_35;
    }
    char has = (char)self->_has;
  }
  BOOL v7 = (*((unsigned char *)v4 + 44) & 0x20) == 0;
  if ((has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 0x20) == 0 || self->_subsId != *((_DWORD *)v4 + 10)) {
      goto LABEL_34;
    }
    BOOL v7 = 1;
  }
LABEL_35:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_state;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_deployment;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v6 = 2654435761 * self->_numSubs;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_psPref;
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v7 = 0;
LABEL_12:
  unint64_t v8 = (unint64_t)[(NSData *)self->_plmn hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    uint64_t v9 = 2654435761 * self->_subsId;
  }
  else {
    uint64_t v9 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v9 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 44);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 44);
    if ((v5 & 0x10) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 0x10) == 0)
  {
    goto LABEL_3;
  }
  self->_state = *((_DWORD *)v4 + 9);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_int deployment = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_17:
  self->_numSubs = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 44) & 8) != 0)
  {
LABEL_6:
    self->_psPref = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_7:
  if (*((void *)v4 + 3))
  {
    id v6 = v4;
    -[CellularNrRrcState setPlmn:](self, "setPlmn:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 44) & 0x20) != 0)
  {
    self->_subsId = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 0x20u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)state
{
  return self->_state;
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (unsigned)numSubs
{
  return self->_numSubs;
}

- (unsigned)psPref
{
  return self->_psPref;
}

- (NSData)plmn
{
  return self->_plmn;
}

- (void)setPlmn:(id)a3
{
}

- (void).cxx_destruct
{
}

@end