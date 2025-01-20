@interface SGM2ContactDetailExtraction
- (BOOL)hasDetail;
- (BOOL)hasExtractionModelVersion;
- (BOOL)hasExtractionSignatureSource;
- (BOOL)hasFoundInSenderCNContact;
- (BOOL)hasIsUnlikelyPhone;
- (BOOL)hasKey;
- (BOOL)hasOutcome;
- (BOOL)hasSignature;
- (BOOL)hasSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUnlikelyPhone;
- (BOOL)readFrom:(id)a3;
- (BOOL)signature;
- (NSString)key;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)detailAsString:(int)a3;
- (id)dictionaryRepresentation;
- (id)extractionSignatureSourceAsString:(int)a3;
- (id)foundInSenderCNContactAsString:(int)a3;
- (id)outcomeAsString:(int)a3;
- (id)sourceAsString:(int)a3;
- (int)StringAsDetail:(id)a3;
- (int)StringAsExtractionSignatureSource:(id)a3;
- (int)StringAsFoundInSenderCNContact:(id)a3;
- (int)StringAsOutcome:(id)a3;
- (int)StringAsSource:(id)a3;
- (int)detail;
- (int)extractionSignatureSource;
- (int)foundInSenderCNContact;
- (int)outcome;
- (int)source;
- (unint64_t)hash;
- (unsigned)extractionModelVersion;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDetail:(int)a3;
- (void)setExtractionModelVersion:(unsigned int)a3;
- (void)setExtractionSignatureSource:(int)a3;
- (void)setFoundInSenderCNContact:(int)a3;
- (void)setHasDetail:(BOOL)a3;
- (void)setHasExtractionModelVersion:(BOOL)a3;
- (void)setHasExtractionSignatureSource:(BOOL)a3;
- (void)setHasFoundInSenderCNContact:(BOOL)a3;
- (void)setHasIsUnlikelyPhone:(BOOL)a3;
- (void)setHasOutcome:(BOOL)a3;
- (void)setHasSignature:(BOOL)a3;
- (void)setHasSource:(BOOL)a3;
- (void)setIsUnlikelyPhone:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setOutcome:(int)a3;
- (void)setSignature:(BOOL)a3;
- (void)setSource:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SGM2ContactDetailExtraction

- (void).cxx_destruct
{
}

- (BOOL)isUnlikelyPhone
{
  return self->_isUnlikelyPhone;
}

- (unsigned)extractionModelVersion
{
  return self->_extractionModelVersion;
}

- (BOOL)signature
{
  return self->_signature;
}

- (void)setKey:(id)a3
{
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 3))
  {
    id v6 = v4;
    -[SGM2ContactDetailExtraction setKey:](self, "setKey:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 0x20) != 0)
  {
    self->_source = *((_DWORD *)v4 + 9);
    *(unsigned char *)&self->_has |= 0x20u;
    char v5 = *((unsigned char *)v4 + 44);
    if ((v5 & 0x80) == 0)
    {
LABEL_5:
      if ((v5 & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 0x80) == 0)
  {
    goto LABEL_5;
  }
  self->_signature = *((unsigned char *)v4 + 41);
  *(unsigned char *)&self->_has |= 0x80u;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 1) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_detail = *((_DWORD *)v4 + 2);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_outcome = *((_DWORD *)v4 + 8);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_foundInSenderCNContact = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 2) == 0)
  {
LABEL_9:
    if ((v5 & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_extractionModelVersion = *((_DWORD *)v4 + 3);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 0x40) == 0)
  {
LABEL_10:
    if ((v5 & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_21:
  self->_isUnlikelyPhone = *((unsigned char *)v4 + 40);
  *(unsigned char *)&self->_has |= 0x40u;
  if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
LABEL_11:
    self->_extractionSignatureSource = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_12:
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    uint64_t v4 = 2654435761 * self->_source;
    if ((*(unsigned char *)&self->_has & 0x80) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_signature;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 0x80) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_detail;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    uint64_t v7 = 2654435761 * self->_outcome;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_6:
    uint64_t v8 = 2654435761 * self->_foundInSenderCNContact;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_7:
    uint64_t v9 = 2654435761 * self->_extractionModelVersion;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_8;
    }
LABEL_16:
    uint64_t v10 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_9;
    }
LABEL_17:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
LABEL_15:
  uint64_t v9 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) == 0) {
    goto LABEL_16;
  }
LABEL_8:
  uint64_t v10 = 2654435761 * self->_isUnlikelyPhone;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_17;
  }
LABEL_9:
  uint64_t v11 = 2654435761 * self->_extractionSignatureSource;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_49;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_49;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 0x20) == 0 || self->_source != *((_DWORD *)v4 + 9)) {
      goto LABEL_49;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 0x20) != 0)
  {
    goto LABEL_49;
  }
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 0x80) == 0) {
      goto LABEL_49;
    }
    if (self->_signature)
    {
      if (!*((unsigned char *)v4 + 41)) {
        goto LABEL_49;
      }
    }
    else if (*((unsigned char *)v4 + 41))
    {
      goto LABEL_49;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 0x80) != 0)
  {
    goto LABEL_49;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_detail != *((_DWORD *)v4 + 2)) {
      goto LABEL_49;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_49;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 0x10) == 0 || self->_outcome != *((_DWORD *)v4 + 8)) {
      goto LABEL_49;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 0x10) != 0)
  {
    goto LABEL_49;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 8) == 0 || self->_foundInSenderCNContact != *((_DWORD *)v4 + 5)) {
      goto LABEL_49;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 8) != 0)
  {
    goto LABEL_49;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_extractionModelVersion != *((_DWORD *)v4 + 3)) {
      goto LABEL_49;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_49;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 0x40) != 0)
    {
      if (self->_isUnlikelyPhone)
      {
        if (!*((unsigned char *)v4 + 40)) {
          goto LABEL_49;
        }
        goto LABEL_45;
      }
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_45;
      }
    }
LABEL_49:
    BOOL v6 = 0;
    goto LABEL_50;
  }
  if ((*((unsigned char *)v4 + 44) & 0x40) != 0) {
    goto LABEL_49;
  }
LABEL_45:
  BOOL v6 = (*((unsigned char *)v4 + 44) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0 || self->_extractionSignatureSource != *((_DWORD *)v4 + 4)) {
      goto LABEL_49;
    }
    BOOL v6 = 1;
  }
LABEL_50:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 36) = self->_source;
    *(unsigned char *)(v5 + 44) |= 0x20u;
    char has = (char)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x80) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v5 + 41) = self->_signature;
  *(unsigned char *)(v5 + 44) |= 0x80u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *(_DWORD *)(v5 + 8) = self->_detail;
  *(unsigned char *)(v5 + 44) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *(_DWORD *)(v5 + 32) = self->_outcome;
  *(unsigned char *)(v5 + 44) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  *(_DWORD *)(v5 + 20) = self->_foundInSenderCNContact;
  *(unsigned char *)(v5 + 44) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
LABEL_17:
    *(unsigned char *)(v5 + 40) = self->_isUnlikelyPhone;
    *(unsigned char *)(v5 + 44) |= 0x40u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return (id)v5;
    }
    goto LABEL_9;
  }
LABEL_16:
  *(_DWORD *)(v5 + 12) = self->_extractionModelVersion;
  *(unsigned char *)(v5 + 44) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x40) != 0) {
    goto LABEL_17;
  }
LABEL_8:
  if ((has & 4) != 0)
  {
LABEL_9:
    *(_DWORD *)(v5 + 16) = self->_extractionSignatureSource;
    *(unsigned char *)(v5 + 44) |= 4u;
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
  if ((has & 0x20) != 0)
  {
    *((_DWORD *)v4 + 9) = self->_source;
    *((unsigned char *)v4 + 44) |= 0x20u;
    char has = (char)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x80) == 0)
  {
    goto LABEL_5;
  }
  *((unsigned char *)v4 + 41) = self->_signature;
  *((unsigned char *)v4 + 44) |= 0x80u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)v4 + 2) = self->_detail;
  *((unsigned char *)v4 + 44) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)v4 + 8) = self->_outcome;
  *((unsigned char *)v4 + 44) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)v4 + 5) = self->_foundInSenderCNContact;
  *((unsigned char *)v4 + 44) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)v4 + 3) = self->_extractionModelVersion;
  *((unsigned char *)v4 + 44) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_21:
  *((unsigned char *)v4 + 40) = self->_isUnlikelyPhone;
  *((unsigned char *)v4 + 44) |= 0x40u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_11:
    *((_DWORD *)v4 + 4) = self->_extractionSignatureSource;
    *((unsigned char *)v4 + 44) |= 4u;
  }
LABEL_12:
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
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 0x80) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x80) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_21:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_11:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_12:
}

- (BOOL)readFrom:(id)a3
{
  return SGM2ContactDetailExtractionReadFrom((uint64_t)self, (uint64_t)a3);
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
  if ((has & 0x20) != 0)
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
    if ((has & 0x80) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x80) == 0)
  {
    goto LABEL_5;
  }
  uint64_t v9 = [NSNumber numberWithBool:self->_signature];
  [v4 setObject:v9 forKey:@"signature"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_19:
  uint64_t detail = self->_detail;
  if (detail >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_detail);
    uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v11 = off_1E65B5490[detail];
  }
  [v4 setObject:v11 forKey:@"detail"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_23:
  uint64_t outcome = self->_outcome;
  if (outcome >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_outcome);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = off_1E65B54B8[outcome];
  }
  [v4 setObject:v13 forKey:@"outcome"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_31;
  }
LABEL_27:
  uint64_t foundInSenderCNContact = self->_foundInSenderCNContact;
  if (foundInSenderCNContact >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_foundInSenderCNContact);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = off_1E65B54E0[foundInSenderCNContact];
  }
  [v4 setObject:v15 forKey:@"foundInSenderCNContact"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
LABEL_32:
    v17 = [NSNumber numberWithBool:self->_isUnlikelyPhone];
    [v4 setObject:v17 forKey:@"isUnlikelyPhone"];

    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_37;
    }
LABEL_33:
    uint64_t extractionSignatureSource = self->_extractionSignatureSource;
    if (extractionSignatureSource >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_extractionSignatureSource);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = off_1E65B54F8[extractionSignatureSource];
    }
    [v4 setObject:v19 forKey:@"extractionSignatureSource"];

    goto LABEL_37;
  }
LABEL_31:
  v16 = [NSNumber numberWithUnsignedInt:self->_extractionModelVersion];
  [v4 setObject:v16 forKey:@"extractionModelVersion"];

  char has = (char)self->_has;
  if ((has & 0x40) != 0) {
    goto LABEL_32;
  }
LABEL_10:
  if ((has & 4) != 0) {
    goto LABEL_33;
  }
LABEL_37:
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SGM2ContactDetailExtraction;
  id v4 = [(SGM2ContactDetailExtraction *)&v8 description];
  uint64_t v5 = [(SGM2ContactDetailExtraction *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsExtractionSignatureSource:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGMContactDetailExtractionSignatureSourceHMM"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SGMContactDetailExtractionSignatureSourceDataDetectors"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SGMContactDetailExtractionSignatureSourceNoSignatureSource"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)extractionSignatureSourceAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E65B54F8[a3];
  }
  return v3;
}

- (BOOL)hasExtractionSignatureSource
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasExtractionSignatureSource:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setExtractionSignatureSource:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_uint64_t extractionSignatureSource = a3;
}

- (int)extractionSignatureSource
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_extractionSignatureSource;
  }
  else {
    return 0;
  }
}

- (BOOL)hasIsUnlikelyPhone
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setHasIsUnlikelyPhone:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (void)setIsUnlikelyPhone:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_isUnlikelyPhone = a3;
}

- (BOOL)hasExtractionModelVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasExtractionModelVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setExtractionModelVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_extractionModelVersion = a3;
}

- (int)StringAsFoundInSenderCNContact:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGMContactDetailOwnerNotFound"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SGMContactDetailOwnerSender"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SGMContactDetailOwnerNotSender"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)foundInSenderCNContactAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E65B54E0[a3];
  }
  return v3;
}

- (BOOL)hasFoundInSenderCNContact
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasFoundInSenderCNContact:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setFoundInSenderCNContact:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_uint64_t foundInSenderCNContact = a3;
}

- (int)foundInSenderCNContact
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_foundInSenderCNContact;
  }
  else {
    return 0;
  }
}

- (int)StringAsOutcome:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"SGMContactDetailExtractionOutcomeExtracted"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SGMContactDetailExtractionOutcomeIgnoredSuspectedBulkMail"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SGMContactDetailExtractionOutcomeIgnoredQuotedRegion"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SGMContactDetailExtractionOutcomeIgnoredPattern"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SGMContactDetailExtractionOutcomeIgnored"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)outcomeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E65B54B8[a3];
  }
  return v3;
}

- (BOOL)hasOutcome
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasOutcome:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setOutcome:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_uint64_t outcome = a3;
}

- (int)outcome
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_outcome;
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
    id v3 = off_1E65B5490[a3];
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

- (BOOL)hasSignature
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setHasSignature:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (void)setSignature:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_signature = a3;
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
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasSource:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (void)setSource:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_int source = a3;
}

- (int)source
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
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
    return (NSString *)@"ContactDetailExtraction";
  }
}

@end