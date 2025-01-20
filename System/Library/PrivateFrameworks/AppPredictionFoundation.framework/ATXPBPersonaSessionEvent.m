@interface ATXPBPersonaSessionEvent
- (BOOL)hasPersonaUID;
- (BOOL)hasStarting;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)starting;
- (NSString)personaUID;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasStarting:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setPersonaUID:(id)a3;
- (void)setStarting:(BOOL)a3;
- (void)setTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBPersonaSessionEvent

- (BOOL)hasPersonaUID
{
  return self->_personaUID != 0;
}

- (void)setStarting:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_starting = a3;
}

- (void)setHasStarting:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStarting
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTimestamp:(double)a3
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

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBPersonaSessionEvent;
  v4 = [(ATXPBPersonaSessionEvent *)&v8 description];
  v5 = [(ATXPBPersonaSessionEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  personaUID = self->_personaUID;
  if (personaUID) {
    [v3 setObject:personaUID forKey:@"personaUID"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v7 = [NSNumber numberWithBool:self->_starting];
    [v4 setObject:v7 forKey:@"starting"];

    char has = (char)self->_has;
  }
  if (has)
  {
    objc_super v8 = [NSNumber numberWithDouble:self->_timestamp];
    [v4 setObject:v8 forKey:@"timestamp"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBPersonaSessionEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_personaUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_personaUID)
  {
    id v6 = v4;
    objc_msgSend(v4, "setPersonaUID:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 24) = self->_starting;
    *((unsigned char *)v4 + 28) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_timestamp;
    *((unsigned char *)v4 + 28) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_personaUID copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 24) = self->_starting;
    *(unsigned char *)(v5 + 28) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(double *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  personaUID = self->_personaUID;
  if ((unint64_t)personaUID | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](personaUID, "isEqual:")) {
      goto LABEL_16;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) != 0)
    {
      if (self->_starting)
      {
        if (!*((unsigned char *)v4 + 24)) {
          goto LABEL_16;
        }
        goto LABEL_12;
      }
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_12;
      }
    }
LABEL_16:
    BOOL v6 = 0;
    goto LABEL_17;
  }
  if ((*((unsigned char *)v4 + 28) & 2) != 0) {
    goto LABEL_16;
  }
LABEL_12:
  BOOL v6 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_timestamp != *((double *)v4 + 1)) {
      goto LABEL_16;
    }
    BOOL v6 = 1;
  }
LABEL_17:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_personaUID hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_starting;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    return v4 ^ v3 ^ v9;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double timestamp = self->_timestamp;
  double v6 = -timestamp;
  if (timestamp >= 0.0) {
    double v6 = self->_timestamp;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
  return v4 ^ v3 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 2))
  {
    id v6 = v4;
    -[ATXPBPersonaSessionEvent setPersonaUID:](self, "setPersonaUID:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 2) != 0)
  {
    self->_starting = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 28);
  }
  if (v5)
  {
    self->_double timestamp = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)personaUID
{
  return self->_personaUID;
}

- (void)setPersonaUID:(id)a3
{
}

- (BOOL)starting
{
  return self->_starting;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
}

@end