@interface PDDPStateChangesIOS134MACOS10154MessageDomainState
- (BOOL)hasDomain;
- (BOOL)hasFlags;
- (BOOL)hasNote;
- (BOOL)hasState;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)note;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)domainAsString:(int)a3;
- (int)StringAsDomain:(id)a3;
- (int)domain;
- (int)state;
- (unint64_t)flags;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDomain:(int)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setHasDomain:(BOOL)a3;
- (void)setHasFlags:(BOOL)a3;
- (void)setHasState:(BOOL)a3;
- (void)setNote:(id)a3;
- (void)setState:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPStateChangesIOS134MACOS10154MessageDomainState

- (int)domain
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_domain;
  }
  else {
    return 0;
  }
}

- (void)setDomain:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_domain = a3;
}

- (void)setHasDomain:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDomain
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)domainAsString:(int)a3
{
  if (a3 >= 6)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = off_1001F4FF8[a3];
  }

  return v3;
}

- (int)StringAsDomain:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_DOMAIN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ACTIVITY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PERSONAL"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PROGRESS"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MESSAGE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"HANDOUT"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setState:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_state = a3;
}

- (void)setHasState:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasState
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setFlags:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_flags = a3;
}

- (void)setHasFlags:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFlags
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasNote
{
  return self->_note != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPStateChangesIOS134MACOS10154MessageDomainState;
  char v3 = [(PDDPStateChangesIOS134MACOS10154MessageDomainState *)&v7 description];
  int v4 = [(PDDPStateChangesIOS134MACOS10154MessageDomainState *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t domain = self->_domain;
    if (domain >= 6)
    {
      v6 = +[NSString stringWithFormat:@"(unknown: %i)", self->_domain];
    }
    else
    {
      v6 = off_1001F4FF8[domain];
    }
    [v3 setObject:v6 forKey:@"domain"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_super v7 = +[NSNumber numberWithInt:self->_state];
    [v3 setObject:v7 forKey:@"state"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v8 = +[NSNumber numberWithUnsignedLongLong:self->_flags];
    [v3 setObject:v8 forKey:@"flags"];
  }
  note = self->_note;
  if (note) {
    [v3 setObject:note forKey:@"note"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100108588((uint64_t)self, (uint64_t)a3);
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
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
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
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
LABEL_5:
  if (self->_note)
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
    v4[4] = self->_domain;
    *((unsigned char *)v4 + 36) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[8] = self->_state;
  *((unsigned char *)v4 + 36) |= 4u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    *((void *)v4 + 1) = self->_flags;
    *((unsigned char *)v4 + 36) |= 1u;
  }
LABEL_5:
  if (self->_note)
  {
    id v6 = v4;
    objc_msgSend(v4, "setNote:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *((_DWORD *)v5 + 8) = self->_state;
    *((unsigned char *)v5 + 36) |= 4u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *((_DWORD *)v5 + 4) = self->_domain;
  *((unsigned char *)v5 + 36) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (has)
  {
LABEL_4:
    v5[1] = self->_flags;
    *((unsigned char *)v5 + 36) |= 1u;
  }
LABEL_5:
  id v8 = [(NSString *)self->_note copyWithZone:a3];
  v9 = (void *)v6[3];
  v6[3] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_domain != *((_DWORD *)v4 + 4)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
LABEL_19:
    unsigned __int8 v6 = 0;
    goto LABEL_20;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_state != *((_DWORD *)v4 + 8)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_flags != *((void *)v4 + 1)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_19;
  }
  note = self->_note;
  if ((unint64_t)note | *((void *)v4 + 3)) {
    unsigned __int8 v6 = -[NSString isEqual:](note, "isEqual:");
  }
  else {
    unsigned __int8 v6 = 1;
  }
LABEL_20:

  return v6;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_7:
    unint64_t v4 = 0;
    return v3 ^ v2 ^ v4 ^ [(NSString *)self->_note hash];
  }
  uint64_t v2 = 2654435761 * self->_domain;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_state;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  unint64_t v4 = 2654435761u * self->_flags;
  return v3 ^ v2 ^ v4 ^ [(NSString *)self->_note hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 2) != 0)
  {
    self->_uint64_t domain = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 36);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_state = *((_DWORD *)v4 + 8);
  *(unsigned char *)&self->_has |= 4u;
  if (*((unsigned char *)v4 + 36))
  {
LABEL_4:
    self->_flags = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_5:
  if (*((void *)v4 + 3))
  {
    id v6 = v4;
    -[PDDPStateChangesIOS134MACOS10154MessageDomainState setNote:](self, "setNote:");
    id v4 = v6;
  }
}

- (int)state
{
  return self->_state;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (NSString)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
}

- (void).cxx_destruct
{
}

@end