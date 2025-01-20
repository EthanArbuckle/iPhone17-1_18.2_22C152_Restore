@interface UmtsChannelInfo
- (BOOL)hasEcio;
- (BOOL)hasRscp;
- (BOOL)hasRxagc;
- (BOOL)hasUlIf;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)ecio;
- (int)rscp;
- (int)rxagc;
- (int)ulIf;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEcio:(int)a3;
- (void)setHasEcio:(BOOL)a3;
- (void)setHasRscp:(BOOL)a3;
- (void)setHasRxagc:(BOOL)a3;
- (void)setHasUlIf:(BOOL)a3;
- (void)setRscp:(int)a3;
- (void)setRxagc:(int)a3;
- (void)setUlIf:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation UmtsChannelInfo

- (void)setRscp:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_rscp = a3;
}

- (void)setHasRscp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRscp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRxagc:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_rxagc = a3;
}

- (void)setHasRxagc:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRxagc
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setEcio:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_ecio = a3;
}

- (void)setHasEcio:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEcio
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setUlIf:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_ulIf = a3;
}

- (void)setHasUlIf:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasUlIf
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)UmtsChannelInfo;
  char v3 = [(UmtsChannelInfo *)&v7 description];
  v4 = [(UmtsChannelInfo *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_super v7 = +[NSNumber numberWithInt:self->_rscp];
    [v3 setObject:v7 forKey:@"rscp"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v8 = +[NSNumber numberWithInt:self->_rxagc];
  [v3 setObject:v8 forKey:@"rxagc"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v9 = +[NSNumber numberWithInt:self->_ecio];
  [v3 setObject:v9 forKey:@"ecio"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    v5 = +[NSNumber numberWithInt:self->_ulIf];
    [v3 setObject:v5 forKey:@"ul_if"];
  }
LABEL_6:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10004B9FC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteSint32Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteSint32Field();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteSint32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteSint32Field();
LABEL_6:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[3] = self->_rscp;
    *((unsigned char *)v4 + 24) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[4] = self->_rxagc;
  *((unsigned char *)v4 + 24) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v4[2] = self->_ecio;
  *((unsigned char *)v4 + 24) |= 1u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    v4[5] = self->_ulIf;
    *((unsigned char *)v4 + 24) |= 8u;
  }
LABEL_6:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_rscp;
    *((unsigned char *)result + 24) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_rxagc;
  *((unsigned char *)result + 24) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 2) = self->_ecio;
  *((unsigned char *)result + 24) |= 1u;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    return result;
  }
LABEL_5:
  *((_DWORD *)result + 5) = self->_ulIf;
  *((unsigned char *)result + 24) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_rscp != *((_DWORD *)v4 + 3)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
LABEL_21:
    BOOL v5 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 4) == 0 || self->_rxagc != *((_DWORD *)v4 + 4)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) != 0)
  {
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_ecio != *((_DWORD *)v4 + 2)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_21;
  }
  BOOL v5 = (*((unsigned char *)v4 + 24) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 8) == 0 || self->_ulIf != *((_DWORD *)v4 + 5)) {
      goto LABEL_21;
    }
    BOOL v5 = 1;
  }
LABEL_22:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_rscp;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_rxagc;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_ecio;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_ulIf;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 2) != 0)
  {
    self->_rscp = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 24);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_rxagc = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_ecio = *((_DWORD *)v4 + 2);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 24) & 8) != 0)
  {
LABEL_5:
    self->_ulIf = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_6:
}

- (int)rscp
{
  return self->_rscp;
}

- (int)rxagc
{
  return self->_rxagc;
}

- (int)ecio
{
  return self->_ecio;
}

- (int)ulIf
{
  return self->_ulIf;
}

@end