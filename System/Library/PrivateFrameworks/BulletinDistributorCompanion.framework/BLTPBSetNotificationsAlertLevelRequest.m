@interface BLTPBSetNotificationsAlertLevelRequest
- (BOOL)hasLevel;
- (BOOL)hasMirror;
- (BOOL)hasSectionID;
- (BOOL)isEqual:(id)a3;
- (BOOL)mirror;
- (BOOL)readFrom:(id)a3;
- (NSString)sectionID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)levelAsString:(int)a3;
- (int)StringAsLevel:(id)a3;
- (int)level;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasLevel:(BOOL)a3;
- (void)setHasMirror:(BOOL)a3;
- (void)setLevel:(int)a3;
- (void)setMirror:(BOOL)a3;
- (void)setSectionID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BLTPBSetNotificationsAlertLevelRequest

- (int)level
{
  if (*(unsigned char *)&self->_has) {
    return self->_level;
  }
  else {
    return 0;
  }
}

- (void)setLevel:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_level = a3;
}

- (void)setHasLevel:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLevel
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)levelAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_2646847B8[a3];
  }
  return v3;
}

- (int)StringAsLevel:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Off"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NotificationCenter"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"All"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"NonCritical"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasSectionID
{
  return self->_sectionID != 0;
}

- (void)setMirror:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_mirror = a3;
}

- (void)setHasMirror:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMirror
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BLTPBSetNotificationsAlertLevelRequest;
  int v4 = [(BLTPBSetNotificationsAlertLevelRequest *)&v8 description];
  v5 = [(BLTPBSetNotificationsAlertLevelRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t level = self->_level;
    if (level >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_level);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_2646847B8[level];
    }
    [v3 setObject:v5 forKey:@"level"];
  }
  sectionID = self->_sectionID;
  if (sectionID) {
    [v3 setObject:sectionID forKey:@"sectionID"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v7 = [NSNumber numberWithBool:self->_mirror];
    [v3 setObject:v7 forKey:@"mirror"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBSetNotificationsAlertLevelRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_sectionID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = self->_level;
    *((unsigned char *)v4 + 28) |= 1u;
  }
  if (self->_sectionID)
  {
    id v5 = v4;
    objc_msgSend(v4, "setSectionID:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((unsigned char *)v4 + 24) = self->_mirror;
    *((unsigned char *)v4 + 28) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_level;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_sectionID copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v7;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v6 + 24) = self->_mirror;
    *(unsigned char *)(v6 + 28) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_level != *((_DWORD *)v4 + 2)) {
      goto LABEL_12;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_12;
  }
  sectionID = self->_sectionID;
  if ((unint64_t)sectionID | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](sectionID, "isEqual:")) {
      goto LABEL_12;
    }
    char has = (char)self->_has;
  }
  BOOL v7 = (*((unsigned char *)v4 + 28) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) != 0)
    {
      if (self->_mirror)
      {
        if (!*((unsigned char *)v4 + 24)) {
          goto LABEL_12;
        }
      }
      else if (*((unsigned char *)v4 + 24))
      {
        goto LABEL_12;
      }
      BOOL v7 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v7 = 0;
  }
LABEL_13:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_level;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_sectionID hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_mirror;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((unsigned char *)v4 + 28))
  {
    self->_uint64_t level = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    id v5 = v4;
    -[BLTPBSetNotificationsAlertLevelRequest setSectionID:](self, "setSectionID:");
    id v4 = v5;
  }
  if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    self->_mirror = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void)setSectionID:(id)a3
{
}

- (BOOL)mirror
{
  return self->_mirror;
}

- (void).cxx_destruct
{
}

@end