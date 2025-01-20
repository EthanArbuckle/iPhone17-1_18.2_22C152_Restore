@interface PDDPEntityMeta
- (BOOL)hasIsAdhocOriginated;
- (BOOL)hasIsEditable;
- (BOOL)hasSource;
- (BOOL)isAdhocOriginated;
- (BOOL)isEditable;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sourceAsString:(int)a3;
- (int)StringAsSource:(id)a3;
- (int)source;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsAdhocOriginated:(BOOL)a3;
- (void)setHasIsEditable:(BOOL)a3;
- (void)setHasSource:(BOOL)a3;
- (void)setIsAdhocOriginated:(BOOL)a3;
- (void)setIsEditable:(BOOL)a3;
- (void)setSource:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPEntityMeta

- (int)source
{
  if (*(unsigned char *)&self->_has) {
    return self->_source;
  }
  else {
    return 0;
  }
}

- (void)setSource:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_source = a3;
}

- (void)setHasSource:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSource
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)sourceAsString:(int)a3
{
  if (a3 >= 5)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v3 = *(&off_1001F3CA8 + a3);
  }

  return v3;
}

- (int)StringAsSource:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_SOURCE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SIS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SFTP"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MANUAL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SCIM"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setIsEditable:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_isEditable = a3;
}

- (void)setHasIsEditable:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsEditable
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsAdhocOriginated:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isAdhocOriginated = a3;
}

- (void)setHasIsAdhocOriginated:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsAdhocOriginated
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPEntityMeta;
  char v3 = [(PDDPEntityMeta *)&v7 description];
  int v4 = [(PDDPEntityMeta *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    uint64_t source = self->_source;
    if (source >= 5)
    {
      v6 = +[NSString stringWithFormat:@"(unknown: %i)", self->_source];
    }
    else
    {
      v6 = *(&off_1001F3CA8 + source);
    }
    [v3 setObject:v6 forKey:@"source"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    objc_super v7 = +[NSNumber numberWithBool:self->_isEditable];
    [v3 setObject:v7 forKey:@"is_editable"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v8 = +[NSNumber numberWithBool:self->_isAdhocOriginated];
    [v3 setObject:v8 forKey:@"is_adhoc_originated"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000A7408((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
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
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
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
    v4[2] = self->_source;
    *((unsigned char *)v4 + 16) |= 1u;
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
  *((unsigned char *)v4 + 13) = self->_isEditable;
  *((unsigned char *)v4 + 16) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    *((unsigned char *)v4 + 12) = self->_isAdhocOriginated;
    *((unsigned char *)v4 + 16) |= 2u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 2) = self->_source;
    *((unsigned char *)result + 16) |= 1u;
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
  *((unsigned char *)result + 13) = self->_isEditable;
  *((unsigned char *)result + 16) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_4:
  *((unsigned char *)result + 12) = self->_isAdhocOriginated;
  *((unsigned char *)result + 16) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_source != *((_DWORD *)v4 + 2)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 16))
  {
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 4) == 0) {
      goto LABEL_17;
    }
    if (self->_isEditable)
    {
      if (!*((unsigned char *)v4 + 13)) {
        goto LABEL_17;
      }
    }
    else if (*((unsigned char *)v4 + 13))
    {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 16) & 4) != 0)
  {
    goto LABEL_17;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) != 0)
    {
      if (self->_isAdhocOriginated)
      {
        if (!*((unsigned char *)v4 + 12)) {
          goto LABEL_17;
        }
      }
      else if (*((unsigned char *)v4 + 12))
      {
        goto LABEL_17;
      }
      BOOL v5 = 1;
      goto LABEL_18;
    }
LABEL_17:
    BOOL v5 = 0;
  }
LABEL_18:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v2 = 0;
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
  uint64_t v2 = 2654435761 * self->_source;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_isEditable;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_isAdhocOriginated;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 16);
  if (v5)
  {
    self->_uint64_t source = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 16);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 16) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_isEditable = *((unsigned char *)v4 + 13);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 16) & 2) != 0)
  {
LABEL_4:
    self->_isAdhocOriginated = *((unsigned char *)v4 + 12);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
}

- (BOOL)isEditable
{
  return self->_isEditable;
}

- (BOOL)isAdhocOriginated
{
  return self->_isAdhocOriginated;
}

@end