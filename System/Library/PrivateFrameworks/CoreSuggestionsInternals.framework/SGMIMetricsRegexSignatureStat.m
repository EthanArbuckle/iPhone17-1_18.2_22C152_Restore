@interface SGMIMetricsRegexSignatureStat
- (BOOL)hasBlockedWarningCount;
- (BOOL)hasEmailLanguage;
- (BOOL)hasIncomingMessage;
- (BOOL)hasNegativeEngagement;
- (BOOL)hasNoEngagement;
- (BOOL)hasPositiveEngagement;
- (BOOL)hasRegexLanguage;
- (BOOL)hasSignature;
- (BOOL)hasType;
- (BOOL)incomingMessage;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)signature;
- (NSString)emailLanguage;
- (NSString)regexLanguage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (unsigned)blockedWarningCount;
- (unsigned)negativeEngagement;
- (unsigned)noEngagement;
- (unsigned)positiveEngagement;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBlockedWarningCount:(unsigned int)a3;
- (void)setEmailLanguage:(id)a3;
- (void)setHasBlockedWarningCount:(BOOL)a3;
- (void)setHasIncomingMessage:(BOOL)a3;
- (void)setHasNegativeEngagement:(BOOL)a3;
- (void)setHasNoEngagement:(BOOL)a3;
- (void)setHasPositiveEngagement:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIncomingMessage:(BOOL)a3;
- (void)setNegativeEngagement:(unsigned int)a3;
- (void)setNoEngagement:(unsigned int)a3;
- (void)setPositiveEngagement:(unsigned int)a3;
- (void)setRegexLanguage:(id)a3;
- (void)setSignature:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGMIMetricsRegexSignatureStat

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_regexLanguage, 0);
  objc_storeStrong((id *)&self->_emailLanguage, 0);
}

- (unsigned)blockedWarningCount
{
  return self->_blockedWarningCount;
}

- (unsigned)positiveEngagement
{
  return self->_positiveEngagement;
}

- (unsigned)noEngagement
{
  return self->_noEngagement;
}

- (unsigned)negativeEngagement
{
  return self->_negativeEngagement;
}

- (void)setSignature:(id)a3
{
}

- (NSData)signature
{
  return self->_signature;
}

- (BOOL)incomingMessage
{
  return self->_incomingMessage;
}

- (void)setRegexLanguage:(id)a3
{
}

- (NSString)regexLanguage
{
  return self->_regexLanguage;
}

- (void)setEmailLanguage:(id)a3
{
}

- (NSString)emailLanguage
{
  return self->_emailLanguage;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (*((void *)v4 + 2))
  {
    -[SGMIMetricsRegexSignatureStat setEmailLanguage:](self, "setEmailLanguage:");
    id v4 = v7;
  }
  if (*((void *)v4 + 5))
  {
    -[SGMIMetricsRegexSignatureStat setRegexLanguage:](self, "setRegexLanguage:");
    id v4 = v7;
  }
  char v5 = *((unsigned char *)v4 + 64);
  if ((v5 & 0x10) != 0)
  {
    self->_type = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_has |= 0x10u;
    char v5 = *((unsigned char *)v4 + 64);
  }
  if ((v5 & 0x20) != 0)
  {
    self->_incomingMessage = *((unsigned char *)v4 + 60);
    *(unsigned char *)&self->_has |= 0x20u;
  }
  if (*((void *)v4 + 6))
  {
    -[SGMIMetricsRegexSignatureStat setSignature:](self, "setSignature:");
    id v4 = v7;
  }
  char v6 = *((unsigned char *)v4 + 64);
  if ((v6 & 2) != 0)
  {
    self->_negativeEngagement = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v4 + 64);
    if ((v6 & 4) == 0)
    {
LABEL_13:
      if ((v6 & 8) == 0) {
        goto LABEL_14;
      }
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 4) == 0)
  {
    goto LABEL_13;
  }
  self->_noEngagement = *((_DWORD *)v4 + 7);
  *(unsigned char *)&self->_has |= 4u;
  char v6 = *((unsigned char *)v4 + 64);
  if ((v6 & 8) == 0)
  {
LABEL_14:
    if ((v6 & 1) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_21:
  self->_positiveEngagement = *((_DWORD *)v4 + 8);
  *(unsigned char *)&self->_has |= 8u;
  if (*((unsigned char *)v4 + 64))
  {
LABEL_15:
    self->_blockedWarningCount = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_16:
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_emailLanguage hash];
  NSUInteger v4 = [(NSString *)self->_regexLanguage hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v5 = 2654435761 * self->_type;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
LABEL_3:
      uint64_t v6 = 2654435761 * self->_incomingMessage;
      goto LABEL_6;
    }
  }
  uint64_t v6 = 0;
LABEL_6:
  uint64_t v7 = [(NSData *)self->_signature hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v8 = 2654435761 * self->_negativeEngagement;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_8:
      uint64_t v9 = 2654435761 * self->_noEngagement;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_9;
      }
LABEL_13:
      uint64_t v10 = 0;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_10;
      }
LABEL_14:
      uint64_t v11 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_8;
    }
  }
  uint64_t v9 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_13;
  }
LABEL_9:
  uint64_t v10 = 2654435761 * self->_positiveEngagement;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_14;
  }
LABEL_10:
  uint64_t v11 = 2654435761 * self->_blockedWarningCount;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_41;
  }
  emailLanguage = self->_emailLanguage;
  if ((unint64_t)emailLanguage | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](emailLanguage, "isEqual:")) {
      goto LABEL_41;
    }
  }
  regexLanguage = self->_regexLanguage;
  if ((unint64_t)regexLanguage | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](regexLanguage, "isEqual:")) {
      goto LABEL_41;
    }
  }
  char has = (char)self->_has;
  char v8 = *((unsigned char *)v4 + 64);
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 0x10) == 0 || self->_type != *((_DWORD *)v4 + 14)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 0x10) != 0)
  {
    goto LABEL_41;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 0x20) == 0) {
      goto LABEL_41;
    }
    if (self->_incomingMessage)
    {
      if (!*((unsigned char *)v4 + 60)) {
        goto LABEL_41;
      }
    }
    else if (*((unsigned char *)v4 + 60))
    {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 0x20) != 0)
  {
    goto LABEL_41;
  }
  signature = self->_signature;
  if (!((unint64_t)signature | *((void *)v4 + 6))) {
    goto LABEL_22;
  }
  if (!-[NSData isEqual:](signature, "isEqual:"))
  {
LABEL_41:
    BOOL v10 = 0;
    goto LABEL_42;
  }
  char has = (char)self->_has;
  char v8 = *((unsigned char *)v4 + 64);
LABEL_22:
  if ((has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_negativeEngagement != *((_DWORD *)v4 + 6)) {
      goto LABEL_41;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_41;
  }
  if ((has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_noEngagement != *((_DWORD *)v4 + 7)) {
      goto LABEL_41;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_41;
  }
  if ((has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_positiveEngagement != *((_DWORD *)v4 + 8)) {
      goto LABEL_41;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_41;
  }
  BOOL v10 = (v8 & 1) == 0;
  if (has)
  {
    if ((v8 & 1) == 0 || self->_blockedWarningCount != *((_DWORD *)v4 + 2)) {
      goto LABEL_41;
    }
    BOOL v10 = 1;
  }
LABEL_42:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_emailLanguage copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_regexLanguage copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_type;
    *(unsigned char *)(v5 + 64) |= 0x10u;
    char has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    *(unsigned char *)(v5 + 60) = self->_incomingMessage;
    *(unsigned char *)(v5 + 64) |= 0x20u;
  }
  uint64_t v11 = [(NSData *)self->_signature copyWithZone:a3];
  v12 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v11;

  char v13 = (char)self->_has;
  if ((v13 & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_negativeEngagement;
    *(unsigned char *)(v5 + 64) |= 2u;
    char v13 = (char)self->_has;
    if ((v13 & 4) == 0)
    {
LABEL_7:
      if ((v13 & 8) == 0) {
        goto LABEL_8;
      }
LABEL_13:
      *(_DWORD *)(v5 + 32) = self->_positiveEngagement;
      *(unsigned char *)(v5 + 64) |= 8u;
      if ((*(unsigned char *)&self->_has & 1) == 0) {
        return (id)v5;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 28) = self->_noEngagement;
  *(unsigned char *)(v5 + 64) |= 4u;
  char v13 = (char)self->_has;
  if ((v13 & 8) != 0) {
    goto LABEL_13;
  }
LABEL_8:
  if (v13)
  {
LABEL_9:
    *(_DWORD *)(v5 + 8) = self->_blockedWarningCount;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_emailLanguage)
  {
    objc_msgSend(v4, "setEmailLanguage:");
    id v4 = v7;
  }
  if (self->_regexLanguage)
  {
    objc_msgSend(v7, "setRegexLanguage:");
    id v4 = v7;
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_type;
    *((unsigned char *)v4 + 64) |= 0x10u;
    char has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    *((unsigned char *)v4 + 60) = self->_incomingMessage;
    *((unsigned char *)v4 + 64) |= 0x20u;
  }
  if (self->_signature)
  {
    objc_msgSend(v7, "setSignature:");
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_negativeEngagement;
    *((unsigned char *)v4 + 64) |= 2u;
    char v6 = (char)self->_has;
    if ((v6 & 4) == 0)
    {
LABEL_13:
      if ((v6 & 8) == 0) {
        goto LABEL_14;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_13;
  }
  *((_DWORD *)v4 + 7) = self->_noEngagement;
  *((unsigned char *)v4 + 64) |= 4u;
  char v6 = (char)self->_has;
  if ((v6 & 8) == 0)
  {
LABEL_14:
    if ((v6 & 1) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_21:
  *((_DWORD *)v4 + 8) = self->_positiveEngagement;
  *((unsigned char *)v4 + 64) |= 8u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_15:
    *((_DWORD *)v4 + 2) = self->_blockedWarningCount;
    *((unsigned char *)v4 + 64) |= 1u;
  }
LABEL_16:
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_emailLanguage)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_regexLanguage)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
    char has = (char)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v7;
  }
  if (self->_signature)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v7;
    char v6 = (char)self->_has;
    if ((v6 & 4) == 0)
    {
LABEL_13:
      if ((v6 & 8) == 0) {
        goto LABEL_14;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  char v6 = (char)self->_has;
  if ((v6 & 8) == 0)
  {
LABEL_14:
    if ((v6 & 1) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  id v4 = v7;
  if (*(unsigned char *)&self->_has)
  {
LABEL_15:
    PBDataWriterWriteUint32Field();
    id v4 = v7;
  }
LABEL_16:
}

- (BOOL)readFrom:(id)a3
{
  return SGMIMetricsRegexSignatureStatReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  emailLanguage = self->_emailLanguage;
  if (emailLanguage) {
    [v3 setObject:emailLanguage forKey:@"emailLanguage"];
  }
  regexLanguage = self->_regexLanguage;
  if (regexLanguage) {
    [v4 setObject:regexLanguage forKey:@"regexLanguage"];
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    int type = self->_type;
    if (type <= 19)
    {
      if (type == 10)
      {
        uint64_t v9 = @"Attachment";
        goto LABEL_18;
      }
      if (type == 11)
      {
        uint64_t v9 = @"AttachmentLink";
        goto LABEL_18;
      }
    }
    else
    {
      switch(type)
      {
        case 20:
          uint64_t v9 = @"Recipient";
          goto LABEL_18;
        case 30:
          uint64_t v9 = @"FollowUpAsk";
          goto LABEL_18;
        case 31:
          uint64_t v9 = @"FollowUpQuestion";
LABEL_18:
          [v4 setObject:v9 forKey:@"type"];

          char has = (char)self->_has;
          goto LABEL_19;
      }
    }
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
    uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
LABEL_19:
  if ((has & 0x20) != 0)
  {
    BOOL v10 = [NSNumber numberWithBool:self->_incomingMessage];
    [v4 setObject:v10 forKey:@"incomingMessage"];
  }
  signature = self->_signature;
  if (signature) {
    [v4 setObject:signature forKey:@"signature"];
  }
  char v12 = (char)self->_has;
  if ((v12 & 2) != 0)
  {
    v15 = [NSNumber numberWithUnsignedInt:self->_negativeEngagement];
    [v4 setObject:v15 forKey:@"negativeEngagement"];

    char v12 = (char)self->_has;
    if ((v12 & 4) == 0)
    {
LABEL_25:
      if ((v12 & 8) == 0) {
        goto LABEL_26;
      }
      goto LABEL_33;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_25;
  }
  v16 = [NSNumber numberWithUnsignedInt:self->_noEngagement];
  [v4 setObject:v16 forKey:@"noEngagement"];

  char v12 = (char)self->_has;
  if ((v12 & 8) == 0)
  {
LABEL_26:
    if ((v12 & 1) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_33:
  v17 = [NSNumber numberWithUnsignedInt:self->_positiveEngagement];
  [v4 setObject:v17 forKey:@"positiveEngagement"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_27:
    char v13 = [NSNumber numberWithUnsignedInt:self->_blockedWarningCount];
    [v4 setObject:v13 forKey:@"blockedWarningCount"];
  }
LABEL_28:
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SGMIMetricsRegexSignatureStat;
  id v4 = [(SGMIMetricsRegexSignatureStat *)&v8 description];
  uint64_t v5 = [(SGMIMetricsRegexSignatureStat *)self dictionaryRepresentation];
  char v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasBlockedWarningCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasBlockedWarningCount:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setBlockedWarningCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_blockedWarningCount = a3;
}

- (BOOL)hasPositiveEngagement
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasPositiveEngagement:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setPositiveEngagement:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_positiveEngagement = a3;
}

- (BOOL)hasNoEngagement
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasNoEngagement:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setNoEngagement:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_noEngagement = a3;
}

- (BOOL)hasNegativeEngagement
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasNegativeEngagement:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setNegativeEngagement:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_negativeEngagement = a3;
}

- (BOOL)hasSignature
{
  return self->_signature != 0;
}

- (BOOL)hasIncomingMessage
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasIncomingMessage:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (void)setIncomingMessage:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_incomingMessage = a3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Attachment"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"AttachmentLink"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"Recipient"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"FollowUpAsk"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"FollowUpQuestion"])
  {
    int v4 = 31;
  }
  else
  {
    int v4 = 10;
  }

  return v4;
}

- (id)typeAsString:(int)a3
{
  if (a3 <= 19)
  {
    if (a3 == 10)
    {
      int v4 = @"Attachment";
    }
    else
    {
      if (a3 != 11)
      {
LABEL_22:
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
        int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        return v4;
      }
      int v4 = @"AttachmentLink";
    }
  }
  else
  {
    switch(a3)
    {
      case 20:
        int v4 = @"Recipient";
        break;
      case 30:
        int v4 = @"FollowUpAsk";
        break;
      case 31:
        int v4 = @"FollowUpQuestion";
        return v4;
      default:
        goto LABEL_22;
    }
  }
  return v4;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_int type = a3;
}

- (int)type
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_type;
  }
  else {
    return 10;
  }
}

- (BOOL)hasRegexLanguage
{
  return self->_regexLanguage != 0;
}

- (BOOL)hasEmailLanguage
{
  return self->_emailLanguage != 0;
}

@end