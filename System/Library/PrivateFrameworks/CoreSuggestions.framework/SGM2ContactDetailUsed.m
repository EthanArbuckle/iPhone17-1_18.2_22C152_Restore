@interface SGM2ContactDetailUsed
- (BOOL)hasApp;
- (BOOL)hasKey;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)key;
- (id)appAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsApp:(id)a3;
- (int)StringAsType:(id)a3;
- (int)app;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApp:(int)a3;
- (void)setHasApp:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGM2ContactDetailUsed

- (void).cxx_destruct
{
}

- (void)setKey:(id)a3
{
}

- (void)mergeFrom:(id)a3
{
  v4 = (int *)a3;
  if (*((void *)v4 + 2))
  {
    v6 = v4;
    -[SGM2ContactDetailUsed setKey:](self, "setKey:");
    v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 28);
  if (v5)
  {
    self->_app = v4[2];
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 28);
  }
  if ((v5 & 2) != 0)
  {
    self->_type = v4[6];
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_app;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_type;
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_app != *((_DWORD *)v4 + 2)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_13:
    BOOL v6 = 0;
    goto LABEL_14;
  }
  BOOL v6 = (*((unsigned char *)v4 + 28) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_type != *((_DWORD *)v4 + 6)) {
      goto LABEL_13;
    }
    BOOL v6 = 1;
  }
LABEL_14:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 8) = self->_app;
    *(unsigned char *)(v5 + 28) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_type;
    *(unsigned char *)(v5 + 28) |= 2u;
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
  if (has)
  {
    *((_DWORD *)v4 + 2) = self->_app;
    *((unsigned char *)v4 + 28) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_type;
    *((unsigned char *)v4 + 28) |= 2u;
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
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SGM2ContactDetailUsedReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (has)
  {
    uint64_t app = self->_app;
    if (app >= 0xC)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_app);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E5B8FA90[app];
    }
    [v4 setObject:v8 forKey:@"app"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t type = self->_type;
    if (type >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E5B8FAF0[type];
    }
    [v4 setObject:v10 forKey:@"type"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SGM2ContactDetailUsed;
  id v4 = [(SGM2ContactDetailUsed *)&v8 description];
  uint64_t v5 = [(SGM2ContactDetailUsed *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGMContactDetailTypeEmail"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SGMContactDetailTypePhone"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SGMContactDetailTypeAddress"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SGMContactDetailTypeOther"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SGMContactDetailTypeBirthday"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5B8FAF0[a3];
  }

  return v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uint64_t type = a3;
}

- (int)type
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
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
    id v3 = off_1E5B8FA90[a3];
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
    return (NSString *)@"ContactDetailUsed";
  }
}

@end