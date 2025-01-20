@interface CESRUserCorrectionsProfileEntry
- (BOOL)hasAlternativesCorrectionsCount;
- (BOOL)hasCorrectedText;
- (BOOL)hasPronunciationData;
- (BOOL)hasSpellingCorrectionsCount;
- (BOOL)hasTap2editCorrectionsCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CESRCorrectionPronunciation)pronunciationData;
- (NSString)correctedText;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)alternativesCorrectionsCount;
- (unsigned)spellingCorrectionsCount;
- (unsigned)tap2editCorrectionsCount;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlternativesCorrectionsCount:(unsigned int)a3;
- (void)setCorrectedText:(id)a3;
- (void)setHasAlternativesCorrectionsCount:(BOOL)a3;
- (void)setHasSpellingCorrectionsCount:(BOOL)a3;
- (void)setHasTap2editCorrectionsCount:(BOOL)a3;
- (void)setPronunciationData:(id)a3;
- (void)setSpellingCorrectionsCount:(unsigned int)a3;
- (void)setTap2editCorrectionsCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CESRUserCorrectionsProfileEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pronunciationData, 0);

  objc_storeStrong((id *)&self->_correctedText, 0);
}

- (unsigned)alternativesCorrectionsCount
{
  return self->_alternativesCorrectionsCount;
}

- (unsigned)tap2editCorrectionsCount
{
  return self->_tap2editCorrectionsCount;
}

- (unsigned)spellingCorrectionsCount
{
  return self->_spellingCorrectionsCount;
}

- (void)setPronunciationData:(id)a3
{
}

- (CESRCorrectionPronunciation)pronunciationData
{
  return self->_pronunciationData;
}

- (void)setCorrectedText:(id)a3
{
}

- (NSString)correctedText
{
  return self->_correctedText;
}

- (void)mergeFrom:(id)a3
{
  v4 = (unsigned int *)a3;
  v8 = v4;
  if (*((void *)v4 + 2))
  {
    -[CESRUserCorrectionsProfileEntry setCorrectedText:](self, "setCorrectedText:");
    v4 = v8;
  }
  pronunciationData = self->_pronunciationData;
  uint64_t v6 = *((void *)v4 + 3);
  if (pronunciationData)
  {
    if (!v6) {
      goto LABEL_9;
    }
    pronunciationData = (CESRCorrectionPronunciation *)-[CESRCorrectionPronunciation mergeFrom:](pronunciationData, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    pronunciationData = (CESRCorrectionPronunciation *)-[CESRUserCorrectionsProfileEntry setPronunciationData:](self, "setPronunciationData:");
  }
  v4 = v8;
LABEL_9:
  char v7 = *((unsigned char *)v4 + 40);
  if ((v7 & 2) != 0)
  {
    self->_spellingCorrectionsCount = v4[8];
    *(unsigned char *)&self->_has |= 2u;
    char v7 = *((unsigned char *)v4 + 40);
    if ((v7 & 4) == 0)
    {
LABEL_11:
      if ((v7 & 1) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((v4[10] & 4) == 0)
  {
    goto LABEL_11;
  }
  self->_tap2editCorrectionsCount = v4[9];
  *(unsigned char *)&self->_has |= 4u;
  if (v4[10])
  {
LABEL_12:
    self->_alternativesCorrectionsCount = v4[2];
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_13:

  MEMORY[0x1F41817F8](pronunciationData, v4);
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_correctedText hash];
  unint64_t v4 = [(CESRCorrectionPronunciation *)self->_pronunciationData hash];
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v6 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  uint64_t v5 = 2654435761 * self->_spellingCorrectionsCount;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_tap2editCorrectionsCount;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v7 = 2654435761 * self->_alternativesCorrectionsCount;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  correctedText = self->_correctedText;
  if ((unint64_t)correctedText | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](correctedText, "isEqual:")) {
      goto LABEL_20;
    }
  }
  pronunciationData = self->_pronunciationData;
  if ((unint64_t)pronunciationData | *((void *)v4 + 3))
  {
    if (!-[CESRCorrectionPronunciation isEqual:](pronunciationData, "isEqual:")) {
      goto LABEL_20;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_spellingCorrectionsCount != *((_DWORD *)v4 + 8)) {
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
LABEL_20:
    BOOL v7 = 0;
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_tap2editCorrectionsCount != *((_DWORD *)v4 + 9)) {
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
    goto LABEL_20;
  }
  BOOL v7 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_alternativesCorrectionsCount != *((_DWORD *)v4 + 2)) {
      goto LABEL_20;
    }
    BOOL v7 = 1;
  }
LABEL_21:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_correctedText copyWithZone:a3];
  BOOL v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  id v8 = [(CESRCorrectionPronunciation *)self->_pronunciationData copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(v5 + 36) = self->_tap2editCorrectionsCount;
    *(unsigned char *)(v5 + 40) |= 4u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return (id)v5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 32) = self->_spellingCorrectionsCount;
  *(unsigned char *)(v5 + 40) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (has)
  {
LABEL_4:
    *(_DWORD *)(v5 + 8) = self->_alternativesCorrectionsCount;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_correctedText)
  {
    objc_msgSend(v4, "setCorrectedText:");
    id v4 = v6;
  }
  if (self->_pronunciationData)
  {
    objc_msgSend(v6, "setPronunciationData:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_spellingCorrectionsCount;
    *((unsigned char *)v4 + 40) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v4 + 9) = self->_tap2editCorrectionsCount;
  *((unsigned char *)v4 + 40) |= 4u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_8:
    *((_DWORD *)v4 + 2) = self->_alternativesCorrectionsCount;
    *((unsigned char *)v4 + 40) |= 1u;
  }
LABEL_9:
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_correctedText)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_pronunciationData)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_8:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_9:
}

- (BOOL)readFrom:(id)a3
{
  return CESRUserCorrectionsProfileEntryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  correctedText = self->_correctedText;
  if (correctedText) {
    [v3 setObject:correctedText forKey:@"corrected_text"];
  }
  pronunciationData = self->_pronunciationData;
  if (pronunciationData)
  {
    BOOL v7 = [(CESRCorrectionPronunciation *)pronunciationData dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"pronunciation_data"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v11 = [NSNumber numberWithUnsignedInt:self->_spellingCorrectionsCount];
    [v4 setObject:v11 forKey:@"spelling_corrections_count"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  v12 = [NSNumber numberWithUnsignedInt:self->_tap2editCorrectionsCount];
  [v4 setObject:v12 forKey:@"tap2edit_corrections_count"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_8:
    v9 = [NSNumber numberWithUnsignedInt:self->_alternativesCorrectionsCount];
    [v4 setObject:v9 forKey:@"alternatives_corrections_count"];
  }
LABEL_9:

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CESRUserCorrectionsProfileEntry;
  id v4 = [(CESRUserCorrectionsProfileEntry *)&v8 description];
  uint64_t v5 = [(CESRUserCorrectionsProfileEntry *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasAlternativesCorrectionsCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasAlternativesCorrectionsCount:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setAlternativesCorrectionsCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_alternativesCorrectionsCount = a3;
}

- (BOOL)hasTap2editCorrectionsCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasTap2editCorrectionsCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setTap2editCorrectionsCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_tap2editCorrectionsCount = a3;
}

- (BOOL)hasSpellingCorrectionsCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasSpellingCorrectionsCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setSpellingCorrectionsCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_spellingCorrectionsCount = a3;
}

- (BOOL)hasPronunciationData
{
  return self->_pronunciationData != 0;
}

- (BOOL)hasCorrectedText
{
  return self->_correctedText != 0;
}

@end