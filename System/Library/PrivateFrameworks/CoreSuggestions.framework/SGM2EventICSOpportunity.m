@interface SGM2EventICSOpportunity
- (BOOL)accountSetup;
- (BOOL)hasAccountSetup;
- (BOOL)hasKey;
- (BOOL)hasRecipient;
- (BOOL)hasSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)key;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)recipientAsString:(int)a3;
- (id)sourceAsString:(int)a3;
- (int)StringAsRecipient:(id)a3;
- (int)StringAsSource:(id)a3;
- (int)recipient;
- (int)source;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccountSetup:(BOOL)a3;
- (void)setHasAccountSetup:(BOOL)a3;
- (void)setHasRecipient:(BOOL)a3;
- (void)setHasSource:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setRecipient:(int)a3;
- (void)setSource:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGM2EventICSOpportunity

- (void).cxx_destruct
{
}

- (BOOL)accountSetup
{
  return self->_accountSetup;
}

- (void)setKey:(id)a3
{
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 1))
  {
    id v6 = v4;
    -[SGM2EventICSOpportunity setKey:](self, "setKey:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 2) != 0)
  {
    self->_source = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 28);
    if ((v5 & 1) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 1) == 0)
  {
    goto LABEL_5;
  }
  self->_recipient = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
LABEL_6:
    self->_accountSetup = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_7:
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v4 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v4 = 2654435761 * self->_source;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_recipient;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_accountSetup;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_16;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_source != *((_DWORD *)v4 + 5)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_16;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_recipient != *((_DWORD *)v4 + 4)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_16;
  }
  BOOL v6 = (*((unsigned char *)v4 + 28) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0)
    {
LABEL_16:
      BOOL v6 = 0;
      goto LABEL_17;
    }
    if (self->_accountSetup)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_16;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
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
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(v5 + 16) = self->_recipient;
    *(unsigned char *)(v5 + 28) |= 1u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return (id)v5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 20) = self->_source;
  *(unsigned char *)(v5 + 28) |= 2u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(unsigned char *)(v5 + 24) = self->_accountSetup;
    *(unsigned char *)(v5 + 28) |= 4u;
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
    *((_DWORD *)v4 + 5) = self->_source;
    *((unsigned char *)v4 + 28) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 4) = self->_recipient;
  *((unsigned char *)v4 + 28) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_6:
    *((unsigned char *)v4 + 24) = self->_accountSetup;
    *((unsigned char *)v4 + 28) |= 4u;
  }
LABEL_7:
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
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_6:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_7:
}

- (BOOL)readFrom:(id)a3
{
  return SGM2EventICSOpportunityReadFrom((uint64_t)self, (uint64_t)a3);
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
    uint64_t source = self->_source;
    if (source >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_source);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E5B8E050[source];
    }
    [v4 setObject:v10 forKey:@"source"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  uint64_t recipient = self->_recipient;
  if (recipient >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_recipient);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = off_1E5B8E050[recipient];
  }
  [v4 setObject:v12 forKey:@"recipient"];

  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_6:
  v7 = [NSNumber numberWithBool:self->_accountSetup];
  [v4 setObject:v7 forKey:@"accountSetup"];

LABEL_7:

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SGM2EventICSOpportunity;
  id v4 = [(SGM2EventICSOpportunity *)&v8 description];
  uint64_t v5 = [(SGM2EventICSOpportunity *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasAccountSetup
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasAccountSetup:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setAccountSetup:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_accountSetup = a3;
}

- (int)StringAsRecipient:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGMEventICSSourceTypeiCloud"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SGMEventICSSourceTypeGoogle"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SGMEventICSSourceTypeYahoo"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SGMEventICSSourceTypeOffice"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SGMEventICSSourceTypeOther"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)recipientAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5B8E050[a3];
  }

  return v3;
}

- (BOOL)hasRecipient
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasRecipient:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setRecipient:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t recipient = a3;
}

- (int)recipient
{
  if (*(unsigned char *)&self->_has) {
    return self->_recipient;
  }
  else {
    return 0;
  }
}

- (int)StringAsSource:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGMEventICSSourceTypeiCloud"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SGMEventICSSourceTypeGoogle"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SGMEventICSSourceTypeYahoo"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SGMEventICSSourceTypeOffice"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SGMEventICSSourceTypeOther"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)sourceAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5B8E050[a3];
  }

  return v3;
}

- (BOOL)hasSource
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasSource:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setSource:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uint64_t source = a3;
}

- (int)source
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_source;
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
    return (NSString *)@"ICSOpportunity";
  }
}

@end