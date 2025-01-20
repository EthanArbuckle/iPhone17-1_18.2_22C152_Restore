@interface SGM2ContactCreated
- (BOOL)hasApp;
- (BOOL)hasKey;
- (BOOL)hasWasSuggestedContact;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)wasSuggestedContact;
- (NSString)key;
- (id)appAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsApp:(id)a3;
- (int)app;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApp:(int)a3;
- (void)setHasApp:(BOOL)a3;
- (void)setHasWasSuggestedContact:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setWasSuggestedContact:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGM2ContactCreated

- (void).cxx_destruct
{
}

- (BOOL)wasSuggestedContact
{
  return self->_wasSuggestedContact;
}

- (void)setKey:(id)a3
{
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 2))
  {
    id v6 = v4;
    -[SGM2ContactCreated setKey:](self, "setKey:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 2) != 0)
  {
    self->_wasSuggestedContact = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 28);
  }
  if (v5)
  {
    self->_app = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_wasSuggestedContact;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_app;
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_16;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) != 0)
    {
      if (self->_wasSuggestedContact)
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
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_app != *((_DWORD *)v4 + 2)) {
      goto LABEL_16;
    }
    BOOL v6 = 1;
  }
LABEL_17:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 24) = self->_wasSuggestedContact;
    *(unsigned char *)(v5 + 28) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 8) = self->_app;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_key)
  {
    id v6 = v4;
    objc_msgSend(v4, "setKey:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 24) = self->_wasSuggestedContact;
    *((unsigned char *)v4 + 28) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v4 + 2) = self->_app;
    *((unsigned char *)v4 + 28) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_key)
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
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SGM2ContactCreatedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v7 = [NSNumber numberWithBool:self->_wasSuggestedContact];
    [v4 setObject:v7 forKey:@"wasSuggestedContact"];

    char has = (char)self->_has;
  }
  if (has)
  {
    uint64_t app = self->_app;
    if (app >= 0xC)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_app);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E65B5298[app];
    }
    [v4 setObject:v9 forKey:@"app"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SGM2ContactCreated;
  id v4 = [(SGM2ContactCreated *)&v8 description];
  uint64_t v5 = [(SGM2ContactCreated *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsApp:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGMContactDetailUsedAppMessages"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SGMContactDetailUsedAppPhone"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SGMContactDetailUsedAppMail"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SGMContactDetailUsedAppCalendar"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SGMContactDetailUsedAppOther"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SGMContactDetailUsedAppFaceTime"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SGMContactDetailUsedAppAddressBook"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SGMContactDetailUsedAppSpringBoard"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SGMContactDetailUsedAppHome"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"SGMContactDetailUsedAppMaps"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SGMContactDetailUsedAppFitness"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"SGMContactDetailUsedAppReminders"])
  {
    int v4 = 11;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)appAsString:(int)a3
{
  if (a3 >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E65B5298[a3];
  }
  return v3;
}

- (BOOL)hasApp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasApp:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setApp:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t app = a3;
}

- (int)app
{
  if (*(unsigned char *)&self->_has) {
    return self->_app;
  }
  else {
    return 0;
  }
}

- (BOOL)hasWasSuggestedContact
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasWasSuggestedContact:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setWasSuggestedContact:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_wasSuggestedContact = a3;
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (NSString)key
{
  if (self->_key) {
    return self->_key;
  }
  else {
    return (NSString *)@"ContactCreated";
  }
}

@end