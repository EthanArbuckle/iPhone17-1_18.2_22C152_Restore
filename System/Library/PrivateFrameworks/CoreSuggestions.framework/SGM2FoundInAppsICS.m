@interface SGM2FoundInAppsICS
- (BOOL)hasDatetime;
- (BOOL)hasKey;
- (BOOL)hasTimezone;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)key;
- (id)copyWithZone:(_NSZone *)a3;
- (id)datetimeAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)timezoneAsString:(int)a3;
- (int)StringAsDatetime:(id)a3;
- (int)StringAsTimezone:(id)a3;
- (int)datetime;
- (int)timezone;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDatetime:(int)a3;
- (void)setHasDatetime:(BOOL)a3;
- (void)setHasTimezone:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setTimezone:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGM2FoundInAppsICS

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
    -[SGM2FoundInAppsICS setKey:](self, "setKey:");
    v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 2) != 0)
  {
    self->_timezone = v4[6];
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 28);
  }
  if (v5)
  {
    self->_datetime = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_timezone;
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
  uint64_t v5 = 2654435761 * self->_datetime;
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
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_timezone != *((_DWORD *)v4 + 6)) {
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
LABEL_13:
    BOOL v6 = 0;
    goto LABEL_14;
  }
  BOOL v6 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_datetime != *((_DWORD *)v4 + 2)) {
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
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_timezone;
    *(unsigned char *)(v5 + 28) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 8) = self->_datetime;
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
    *((_DWORD *)v4 + 6) = self->_timezone;
    *((unsigned char *)v4 + 28) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v4 + 2) = self->_datetime;
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
    PBDataWriterWriteInt32Field();
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
  return SGM2FoundInAppsICSReadFrom((uint64_t)self, (uint64_t)a3);
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
    uint64_t timezone = self->_timezone;
    if (timezone >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_timezone);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E5B90060[timezone];
    }
    [v4 setObject:v8 forKey:@"timezone"];

    char has = (char)self->_has;
  }
  if (has)
  {
    int datetime = self->_datetime;
    if (datetime)
    {
      if (datetime == 1)
      {
        v10 = @"SGMFoundInAppsDatetimeTypeEnd";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_datetime);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v10 = @"SGMFoundInAppsDatetimeTypeStart";
    }
    [v4 setObject:v10 forKey:@"datetime"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SGM2FoundInAppsICS;
  id v4 = [(SGM2FoundInAppsICS *)&v8 description];
  uint64_t v5 = [(SGM2FoundInAppsICS *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsDatetime:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGMFoundInAppsDatetimeTypeStart"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"SGMFoundInAppsDatetimeTypeEnd"];
  }

  return v4;
}

- (id)datetimeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"SGMFoundInAppsDatetimeTypeEnd";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"SGMFoundInAppsDatetimeTypeStart";
  }
  return v4;
}

- (BOOL)hasDatetime
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasDatetime:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setDatetime:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int datetime = a3;
}

- (int)datetime
{
  if (*(unsigned char *)&self->_has) {
    return self->_datetime;
  }
  else {
    return 0;
  }
}

- (int)StringAsTimezone:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGMFoundInAppsICSTZValueNull"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SGMFoundInAppsICSTZValueValid"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SGMFoundInAppsICSTZValueInvalid"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)timezoneAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5B90060[a3];
  }

  return v3;
}

- (BOOL)hasTimezone
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasTimezone:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setTimezone:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uint64_t timezone = a3;
}

- (int)timezone
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_timezone;
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
    return (NSString *)@"FoundInAppsICS";
  }
}

@end