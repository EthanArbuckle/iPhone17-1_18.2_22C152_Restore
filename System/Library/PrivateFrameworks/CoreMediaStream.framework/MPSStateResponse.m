@interface MPSStateResponse
- (BOOL)hasIcplAction;
- (BOOL)hasMpsAction;
- (BOOL)hasRetryAfterSeconds;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)icplActionAsString:(int)a3;
- (id)mpsActionAsString:(int)a3;
- (int)StringAsIcplAction:(id)a3;
- (int)StringAsMpsAction:(id)a3;
- (int)icplAction;
- (int)mpsAction;
- (int64_t)retryAfterSeconds;
- (int64_t)version;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIcplAction:(BOOL)a3;
- (void)setHasMpsAction:(BOOL)a3;
- (void)setHasRetryAfterSeconds:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setIcplAction:(int)a3;
- (void)setMpsAction:(int)a3;
- (void)setRetryAfterSeconds:(int64_t)a3;
- (void)setVersion:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation MPSStateResponse

- (int64_t)version
{
  return self->_version;
}

- (int64_t)retryAfterSeconds
{
  return self->_retryAfterSeconds;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 32);
  if (v5)
  {
    self->_retryAfterSeconds = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 32);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_mpsAction = *((_DWORD *)v4 + 7);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_icplAction = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_5:
    self->_version = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_6:
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_retryAfterSeconds;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_mpsAction;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
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
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_icplAction;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_version;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_retryAfterSeconds != *((void *)v4 + 1)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_21:
    BOOL v5 = 0;
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 8) == 0 || self->_mpsAction != *((_DWORD *)v4 + 7)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 8) != 0)
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_icplAction != *((_DWORD *)v4 + 6)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_21;
  }
  BOOL v5 = (*((unsigned char *)v4 + 32) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_version != *((void *)v4 + 2)) {
      goto LABEL_21;
    }
    BOOL v5 = 1;
  }
LABEL_22:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_retryAfterSeconds;
    *((unsigned char *)result + 32) |= 1u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 7) = self->_mpsAction;
  *((unsigned char *)result + 32) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 6) = self->_icplAction;
  *((unsigned char *)result + 32) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_5:
  *((void *)result + 2) = self->_version;
  *((unsigned char *)result + 32) |= 2u;
  return result;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_retryAfterSeconds;
    *((unsigned char *)v4 + 32) |= 1u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 7) = self->_mpsAction;
  *((unsigned char *)v4 + 32) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  *((_DWORD *)v4 + 6) = self->_icplAction;
  *((unsigned char *)v4 + 32) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_5:
    v4[2] = self->_version;
    *((unsigned char *)v4 + 32) |= 2u;
  }
LABEL_6:
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_5:
  }
    PBDataWriterWriteInt64Field();
LABEL_6:
}

- (BOOL)readFrom:(id)a3
{
  return MPSStateResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v7 = [NSNumber numberWithLongLong:self->_retryAfterSeconds];
    [v3 setObject:v7 forKey:@"retryAfterSeconds"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  uint64_t mpsAction = self->_mpsAction;
  if (mpsAction >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_mpsAction);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E6C3BAF8[mpsAction];
  }
  [v3 setObject:v9 forKey:@"mpsAction"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_14:
  uint64_t icplAction = self->_icplAction;
  if (icplAction >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_icplAction);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = off_1E6C3BB10[icplAction];
  }
  [v3 setObject:v11 forKey:@"icplAction"];

  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_5:
  id v5 = [NSNumber numberWithLongLong:self->_version];
  [v3 setObject:v5 forKey:@"version"];

LABEL_6:
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MPSStateResponse;
  id v4 = [(MPSStateResponse *)&v8 description];
  id v5 = [(MPSStateResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_version = a3;
}

- (int)StringAsIcplAction:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NoICPLAct"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PromptToEnableICPL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AutomaticEnableICPL"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)icplActionAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E6C3BB10[a3];
  }
  return v3;
}

- (BOOL)hasIcplAction
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasIcplAction:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setIcplAction:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_uint64_t icplAction = a3;
}

- (int)icplAction
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_icplAction;
  }
  else {
    return 0;
  }
}

- (int)StringAsMpsAction:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NoMPSAct"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PromptToDisableMPS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"AutomaticDisableMPS"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)mpsActionAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E6C3BAF8[a3];
  }
  return v3;
}

- (BOOL)hasMpsAction
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasMpsAction:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setMpsAction:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_uint64_t mpsAction = a3;
}

- (int)mpsAction
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_mpsAction;
  }
  else {
    return 0;
  }
}

- (BOOL)hasRetryAfterSeconds
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasRetryAfterSeconds:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setRetryAfterSeconds:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_retryAfterSeconds = a3;
}

@end