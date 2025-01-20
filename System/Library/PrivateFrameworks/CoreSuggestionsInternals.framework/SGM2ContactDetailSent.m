@interface SGM2ContactDetailSent
- (BOOL)hasDetail;
- (BOOL)hasFoundIn;
- (BOOL)hasHasName;
- (BOOL)hasKey;
- (BOOL)hasName;
- (BOOL)hasSource;
- (BOOL)hasTokens;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)key;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)detailAsString:(int)a3;
- (id)dictionaryRepresentation;
- (id)foundInAsString:(int)a3;
- (id)sourceAsString:(int)a3;
- (id)tokensAsString:(int)a3;
- (int)StringAsDetail:(id)a3;
- (int)StringAsFoundIn:(id)a3;
- (int)StringAsSource:(id)a3;
- (int)StringAsTokens:(id)a3;
- (int)detail;
- (int)foundIn;
- (int)source;
- (int)tokens;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDetail:(int)a3;
- (void)setFoundIn:(int)a3;
- (void)setHasDetail:(BOOL)a3;
- (void)setHasFoundIn:(BOOL)a3;
- (void)setHasHasName:(BOOL)a3;
- (void)setHasName:(BOOL)a3;
- (void)setHasSource:(BOOL)a3;
- (void)setHasTokens:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setSource:(int)a3;
- (void)setTokens:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGM2ContactDetailSent

- (void).cxx_destruct
{
}

- (BOOL)hasName
{
  return self->_hasName;
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
    -[SGM2ContactDetailSent setKey:](self, "setKey:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 4) != 0)
  {
    self->_source = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 36);
    if ((v5 & 1) == 0)
    {
LABEL_5:
      if ((v5 & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 1) == 0)
  {
    goto LABEL_5;
  }
  self->_detail = *((_DWORD *)v4 + 2);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_foundIn = *((_DWORD *)v4 + 3);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_15:
  self->_hasName = *((unsigned char *)v4 + 32);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)v4 + 36) & 8) != 0)
  {
LABEL_8:
    self->_tokens = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_9:
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v4 = 2654435761 * self->_source;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_detail;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_foundIn;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_9:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v7 = 2654435761 * self->_hasName;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v8 = 2654435761 * self->_tokens;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_31;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_source != *((_DWORD *)v4 + 6)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    goto LABEL_31;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_detail != *((_DWORD *)v4 + 2)) {
      goto LABEL_31;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_foundIn != *((_DWORD *)v4 + 3)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 0x10) != 0)
    {
      if (self->_hasName)
      {
        if (!*((unsigned char *)v4 + 32)) {
          goto LABEL_31;
        }
        goto LABEL_27;
      }
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_27;
      }
    }
LABEL_31:
    BOOL v6 = 0;
    goto LABEL_32;
  }
  if ((*((unsigned char *)v4 + 36) & 0x10) != 0) {
    goto LABEL_31;
  }
LABEL_27:
  BOOL v6 = (*((unsigned char *)v4 + 36) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 8) == 0 || self->_tokens != *((_DWORD *)v4 + 7)) {
      goto LABEL_31;
    }
    BOOL v6 = 1;
  }
LABEL_32:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_source;
    *(unsigned char *)(v5 + 36) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 8) = self->_detail;
  *(unsigned char *)(v5 + 36) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    *(unsigned char *)(v5 + 32) = self->_hasName;
    *(unsigned char *)(v5 + 36) |= 0x10u;
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      return (id)v5;
    }
    goto LABEL_6;
  }
LABEL_10:
  *(_DWORD *)(v5 + 12) = self->_foundIn;
  *(unsigned char *)(v5 + 36) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_11;
  }
LABEL_5:
  if ((has & 8) != 0)
  {
LABEL_6:
    *(_DWORD *)(v5 + 28) = self->_tokens;
    *(unsigned char *)(v5 + 36) |= 8u;
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
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_source;
    *((unsigned char *)v4 + 36) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 2) = self->_detail;
  *((unsigned char *)v4 + 36) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)v4 + 3) = self->_foundIn;
  *((unsigned char *)v4 + 36) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_15:
  *((unsigned char *)v4 + 32) = self->_hasName;
  *((unsigned char *)v4 + 36) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_8:
    *((_DWORD *)v4 + 7) = self->_tokens;
    *((unsigned char *)v4 + 36) |= 8u;
  }
LABEL_9:
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
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_15:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_8:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_9:
}

- (BOOL)readFrom:(id)a3
{
  return SGM2ContactDetailSentReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((has & 4) != 0)
  {
    int source = self->_source;
    if (source)
    {
      if (source == 1)
      {
        uint64_t v8 = @"SGMDocumentTypeMessage";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_source);
        uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      uint64_t v8 = @"SGMDocumentTypeEmail";
    }
    [v4 setObject:v8 forKey:@"source"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  uint64_t detail = self->_detail;
  if (detail >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_detail);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = off_1E65B5510[detail];
  }
  [v4 setObject:v10 forKey:@"detail"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
LABEL_23:
    v13 = [NSNumber numberWithBool:self->_hasName];
    [v4 setObject:v13 forKey:@"hasName"];

    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_28;
    }
LABEL_24:
    uint64_t tokens = self->_tokens;
    if (tokens >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_tokens);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_1E65B5558[tokens];
    }
    [v4 setObject:v15 forKey:@"tokens"];

    goto LABEL_28;
  }
LABEL_19:
  uint64_t foundIn = self->_foundIn;
  if (foundIn >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_foundIn);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = off_1E65B5538[foundIn];
  }
  [v4 setObject:v12 forKey:@"foundIn"];

  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_23;
  }
LABEL_7:
  if ((has & 8) != 0) {
    goto LABEL_24;
  }
LABEL_28:
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SGM2ContactDetailSent;
  id v4 = [(SGM2ContactDetailSent *)&v8 description];
  uint64_t v5 = [(SGM2ContactDetailSent *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsTokens:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGMLowCount0"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SGMLowCount1"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SGMLowCount2"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SGMLowCount3to4"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SGMLowCount5orMore"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)tokensAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E65B5558[a3];
  }
  return v3;
}

- (BOOL)hasTokens
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasTokens:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setTokens:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_uint64_t tokens = a3;
}

- (int)tokens
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_tokens;
  }
  else {
    return 0;
  }
}

- (BOOL)hasHasName
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasHasName:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setHasName:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_hasName = a3;
}

- (int)StringAsFoundIn:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGMContactDetailFoundInNotFound"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SGMContactDetailFoundInSenderCNContact"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SGMContactDetailFoundInOtherCNContact"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SGMContactDetailFoundInSuggestions"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)foundInAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E65B5538[a3];
  }
  return v3;
}

- (BOOL)hasFoundIn
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasFoundIn:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setFoundIn:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uint64_t foundIn = a3;
}

- (int)foundIn
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_foundIn;
  }
  else {
    return 0;
  }
}

- (int)StringAsDetail:(id)a3
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

- (id)detailAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E65B5510[a3];
  }
  return v3;
}

- (BOOL)hasDetail
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasDetail:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setDetail:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t detail = a3;
}

- (int)detail
{
  if (*(unsigned char *)&self->_has) {
    return self->_detail;
  }
  else {
    return 0;
  }
}

- (int)StringAsSource:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGMDocumentTypeEmail"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"SGMDocumentTypeMessage"];
  }

  return v4;
}

- (id)sourceAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"SGMDocumentTypeMessage";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"SGMDocumentTypeEmail";
  }
  return v4;
}

- (BOOL)hasSource
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasSource:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setSource:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int source = a3;
}

- (int)source
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
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
    return (NSString *)@"ContactDetailSent";
  }
}

@end