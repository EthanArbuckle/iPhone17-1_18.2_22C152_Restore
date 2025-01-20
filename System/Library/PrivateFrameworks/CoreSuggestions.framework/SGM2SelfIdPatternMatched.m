@interface SGM2SelfIdPatternMatched
- (BOOL)hasKey;
- (BOOL)hasMessageIndex;
- (BOOL)hasNameClass;
- (BOOL)hasNameTokens;
- (BOOL)hasPatternHash;
- (BOOL)hasPatternType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)key;
- (NSString)patternHash;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)nameClassAsString:(int)a3;
- (id)patternTypeAsString:(int)a3;
- (int)StringAsNameClass:(id)a3;
- (int)StringAsPatternType:(id)a3;
- (int)nameClass;
- (int)patternType;
- (unint64_t)hash;
- (unsigned)messageIndex;
- (unsigned)nameTokens;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMessageIndex:(BOOL)a3;
- (void)setHasNameClass:(BOOL)a3;
- (void)setHasNameTokens:(BOOL)a3;
- (void)setHasPatternType:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setMessageIndex:(unsigned int)a3;
- (void)setNameClass:(int)a3;
- (void)setNameTokens:(unsigned int)a3;
- (void)setPatternHash:(id)a3;
- (void)setPatternType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGM2SelfIdPatternMatched

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_patternHash, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

- (unsigned)messageIndex
{
  return self->_messageIndex;
}

- (unsigned)nameTokens
{
  return self->_nameTokens;
}

- (void)setPatternHash:(id)a3
{
}

- (NSString)patternHash
{
  return self->_patternHash;
}

- (void)setKey:(id)a3
{
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 1))
  {
    -[SGM2SelfIdPatternMatched setKey:](self, "setKey:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 44) & 8) != 0)
  {
    self->_patternType = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 8u;
  }
  if (*((void *)v4 + 4))
  {
    -[SGM2SelfIdPatternMatched setPatternHash:](self, "setPatternHash:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 4) != 0)
  {
    self->_nameTokens = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 44);
    if ((v5 & 2) == 0)
    {
LABEL_9:
      if ((v5 & 1) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) == 0)
  {
    goto LABEL_9;
  }
  self->_nameClass = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 44))
  {
LABEL_10:
    self->_messageIndex = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_11:
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v4 = 2654435761 * self->_patternType;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_patternHash hash];
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v7 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  uint64_t v6 = 2654435761 * self->_nameTokens;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v7 = 2654435761 * self->_nameClass;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v8 = 2654435761 * self->_messageIndex;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_26;
    }
  }
  char has = (char)self->_has;
  char v7 = *((unsigned char *)v4 + 44);
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 8) == 0 || self->_patternType != *((_DWORD *)v4 + 10)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 8) != 0)
  {
    goto LABEL_26;
  }
  patternHash = self->_patternHash;
  if ((unint64_t)patternHash | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](patternHash, "isEqual:"))
    {
LABEL_26:
      BOOL v9 = 0;
      goto LABEL_27;
    }
    char has = (char)self->_has;
    char v7 = *((unsigned char *)v4 + 44);
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_nameTokens != *((_DWORD *)v4 + 6)) {
      goto LABEL_26;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_26;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_nameClass != *((_DWORD *)v4 + 5)) {
      goto LABEL_26;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_26;
  }
  BOOL v9 = (v7 & 1) == 0;
  if (has)
  {
    if ((v7 & 1) == 0 || self->_messageIndex != *((_DWORD *)v4 + 4)) {
      goto LABEL_26;
    }
    BOOL v9 = 1;
  }
LABEL_27:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  char v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_patternType;
    *(unsigned char *)(v5 + 44) |= 8u;
  }
  uint64_t v8 = [(NSString *)self->_patternHash copyWithZone:a3];
  BOOL v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_5;
    }
LABEL_9:
    *(_DWORD *)(v5 + 20) = self->_nameClass;
    *(unsigned char *)(v5 + 44) |= 2u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return (id)v5;
    }
    goto LABEL_6;
  }
  *(_DWORD *)(v5 + 24) = self->_nameTokens;
  *(unsigned char *)(v5 + 44) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_9;
  }
LABEL_5:
  if (has)
  {
LABEL_6:
    *(_DWORD *)(v5 + 16) = self->_messageIndex;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_key)
  {
    objc_msgSend(v4, "setKey:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_patternType;
    *((unsigned char *)v4 + 44) |= 8u;
  }
  if (self->_patternHash)
  {
    objc_msgSend(v6, "setPatternHash:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_nameTokens;
    *((unsigned char *)v4 + 44) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 1) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v4 + 5) = self->_nameClass;
  *((unsigned char *)v4 + 44) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_10:
    *((_DWORD *)v4 + 4) = self->_messageIndex;
    *((unsigned char *)v4 + 44) |= 1u;
  }
LABEL_11:
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
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_patternHash)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 1) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_10:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_11:
}

- (BOOL)readFrom:(id)a3
{
  return SGM2SelfIdPatternMatchedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    int patternType = self->_patternType;
    if (patternType)
    {
      if (patternType == 1)
      {
        char v7 = @"SGMSIPatternTypeSelfIdRequest";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_patternType);
        char v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      char v7 = @"SGMSIPatternTypeSelfId";
    }
    [v4 setObject:v7 forKey:@"patternType"];
  }
  patternHash = self->_patternHash;
  if (patternHash) {
    [v4 setObject:patternHash forKey:@"patternHash"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v12 = [NSNumber numberWithUnsignedInt:self->_nameTokens];
    [v4 setObject:v12 forKey:@"nameTokens"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_14:
      if ((has & 1) == 0) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_14;
  }
  uint64_t nameClass = self->_nameClass;
  if (nameClass >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_nameClass);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = off_1E5B8E038[nameClass];
  }
  [v4 setObject:v14 forKey:@"nameClass"];

  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_16;
  }
LABEL_15:
  v10 = [NSNumber numberWithUnsignedInt:self->_messageIndex];
  [v4 setObject:v10 forKey:@"messageIndex"];

LABEL_16:

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SGM2SelfIdPatternMatched;
  id v4 = [(SGM2SelfIdPatternMatched *)&v8 description];
  uint64_t v5 = [(SGM2SelfIdPatternMatched *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasMessageIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasMessageIndex:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setMessageIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_messageIndex = a3;
}

- (int)StringAsNameClass:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGMSINameClassificationName"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SGMSINameClassificationNotName"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SGMSINameClassificationMaybeName"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)nameClassAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5B8E038[a3];
  }

  return v3;
}

- (BOOL)hasNameClass
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasNameClass:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setNameClass:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uint64_t nameClass = a3;
}

- (int)nameClass
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_nameClass;
  }
  else {
    return 0;
  }
}

- (BOOL)hasNameTokens
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasNameTokens:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setNameTokens:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_nameTokens = a3;
}

- (BOOL)hasPatternHash
{
  return self->_patternHash != 0;
}

- (int)StringAsPatternType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGMSIPatternTypeSelfId"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"SGMSIPatternTypeSelfIdRequest"];
  }

  return v4;
}

- (id)patternTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"SGMSIPatternTypeSelfIdRequest";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"SGMSIPatternTypeSelfId";
  }
  return v4;
}

- (BOOL)hasPatternType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasPatternType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setPatternType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int patternType = a3;
}

- (int)patternType
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_patternType;
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
    return (NSString *)@"SelfIdPatternMatched";
  }
}

@end