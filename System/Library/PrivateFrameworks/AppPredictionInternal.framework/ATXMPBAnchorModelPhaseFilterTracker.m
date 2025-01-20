@interface ATXMPBAnchorModelPhaseFilterTracker
- (BOOL)hasAbGroup;
- (BOOL)hasAnchorType;
- (BOOL)hasNumEndingCandidates;
- (BOOL)hasNumStartingCandidates;
- (BOOL)hasPhaseDescription;
- (BOOL)hasPhaseType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)abGroup;
- (NSString)anchorType;
- (NSString)phaseType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)phaseDescriptionAsString:(int)a3;
- (int)StringAsPhaseDescription:(id)a3;
- (int)phaseDescription;
- (unint64_t)hash;
- (unsigned)numEndingCandidates;
- (unsigned)numStartingCandidates;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbGroup:(id)a3;
- (void)setAnchorType:(id)a3;
- (void)setHasNumEndingCandidates:(BOOL)a3;
- (void)setHasNumStartingCandidates:(BOOL)a3;
- (void)setHasPhaseDescription:(BOOL)a3;
- (void)setNumEndingCandidates:(unsigned int)a3;
- (void)setNumStartingCandidates:(unsigned int)a3;
- (void)setPhaseDescription:(int)a3;
- (void)setPhaseType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXMPBAnchorModelPhaseFilterTracker

- (int)phaseDescription
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_phaseDescription;
  }
  else {
    return 1;
  }
}

- (void)setPhaseDescription:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_phaseDescription = a3;
}

- (void)setHasPhaseDescription:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPhaseDescription
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)phaseDescriptionAsString:(int)a3
{
  if (a3 == 1)
  {
    v4 = @"First";
  }
  else if (a3 == 2)
  {
    v4 = @"Second";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsPhaseDescription:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"First"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"Second"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (BOOL)hasPhaseType
{
  return self->_phaseType != 0;
}

- (void)setNumStartingCandidates:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_numStartingCandidates = a3;
}

- (void)setHasNumStartingCandidates:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumStartingCandidates
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setNumEndingCandidates:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_numEndingCandidates = a3;
}

- (void)setHasNumEndingCandidates:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNumEndingCandidates
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasAnchorType
{
  return self->_anchorType != 0;
}

- (BOOL)hasAbGroup
{
  return self->_abGroup != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXMPBAnchorModelPhaseFilterTracker;
  int v4 = [(ATXMPBAnchorModelPhaseFilterTracker *)&v8 description];
  v5 = [(ATXMPBAnchorModelPhaseFilterTracker *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    int phaseDescription = self->_phaseDescription;
    if (phaseDescription == 1)
    {
      v5 = @"First";
    }
    else if (phaseDescription == 2)
    {
      v5 = @"Second";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_phaseDescription);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v5 forKey:@"phaseDescription"];
  }
  phaseType = self->_phaseType;
  if (phaseType) {
    [v3 setObject:phaseType forKey:@"phaseType"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithUnsignedInt:self->_numStartingCandidates];
    [v3 setObject:v8 forKey:@"numStartingCandidates"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v9 = [NSNumber numberWithUnsignedInt:self->_numEndingCandidates];
    [v3 setObject:v9 forKey:@"numEndingCandidates"];
  }
  anchorType = self->_anchorType;
  if (anchorType) {
    [v3 setObject:anchorType forKey:@"anchorType"];
  }
  abGroup = self->_abGroup;
  if (abGroup) {
    [v3 setObject:abGroup forKey:@"abGroup"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXMPBAnchorModelPhaseFilterTrackerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_phaseType)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
  if (self->_anchorType)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_abGroup)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[8] = self->_phaseDescription;
    *((unsigned char *)v4 + 48) |= 4u;
  }
  id v6 = v4;
  if (self->_phaseType)
  {
    objc_msgSend(v4, "setPhaseType:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[7] = self->_numStartingCandidates;
    *((unsigned char *)v4 + 48) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[6] = self->_numEndingCandidates;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  if (self->_anchorType)
  {
    objc_msgSend(v6, "setAnchorType:");
    id v4 = v6;
  }
  if (self->_abGroup)
  {
    objc_msgSend(v6, "setAbGroup:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_phaseDescription;
    *(unsigned char *)(v5 + 48) |= 4u;
  }
  uint64_t v7 = [(NSString *)self->_phaseType copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v7;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 28) = self->_numStartingCandidates;
    *(unsigned char *)(v6 + 48) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v6 + 24) = self->_numEndingCandidates;
    *(unsigned char *)(v6 + 48) |= 1u;
  }
  uint64_t v10 = [(NSString *)self->_anchorType copyWithZone:a3];
  v11 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v10;

  uint64_t v12 = [(NSString *)self->_abGroup copyWithZone:a3];
  v13 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v12;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0 || self->_phaseDescription != *((_DWORD *)v4 + 8)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
    goto LABEL_24;
  }
  phaseType = self->_phaseType;
  if ((unint64_t)phaseType | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](phaseType, "isEqual:"))
    {
LABEL_24:
      char v9 = 0;
      goto LABEL_25;
    }
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_numStartingCandidates != *((_DWORD *)v4 + 7)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_24;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_numEndingCandidates != *((_DWORD *)v4 + 6)) {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_24;
  }
  anchorType = self->_anchorType;
  if ((unint64_t)anchorType | *((void *)v4 + 2) && !-[NSString isEqual:](anchorType, "isEqual:")) {
    goto LABEL_24;
  }
  abGroup = self->_abGroup;
  if ((unint64_t)abGroup | *((void *)v4 + 1)) {
    char v9 = -[NSString isEqual:](abGroup, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_25:

  return v9;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v3 = 2654435761 * self->_phaseDescription;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_phaseType hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_numStartingCandidates;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v6 = 0;
    goto LABEL_9;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_numEndingCandidates;
LABEL_9:
  NSUInteger v7 = v4 ^ v3 ^ v5 ^ v6 ^ [(NSString *)self->_anchorType hash];
  return v7 ^ [(NSString *)self->_abGroup hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if ((v4[12] & 4) != 0)
  {
    self->_int phaseDescription = v4[8];
    *(unsigned char *)&self->_has |= 4u;
  }
  uint64_t v6 = v4;
  if (*((void *)v4 + 5))
  {
    -[ATXMPBAnchorModelPhaseFilterTracker setPhaseType:](self, "setPhaseType:");
    NSUInteger v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 2) != 0)
  {
    self->_numStartingCandidates = v4[7];
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 48);
  }
  if (v5)
  {
    self->_numEndingCandidates = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    -[ATXMPBAnchorModelPhaseFilterTracker setAnchorType:](self, "setAnchorType:");
    NSUInteger v4 = v6;
  }
  if (*((void *)v4 + 1))
  {
    -[ATXMPBAnchorModelPhaseFilterTracker setAbGroup:](self, "setAbGroup:");
    NSUInteger v4 = v6;
  }
}

- (NSString)phaseType
{
  return self->_phaseType;
}

- (void)setPhaseType:(id)a3
{
}

- (unsigned)numStartingCandidates
{
  return self->_numStartingCandidates;
}

- (unsigned)numEndingCandidates
{
  return self->_numEndingCandidates;
}

- (NSString)anchorType
{
  return self->_anchorType;
}

- (void)setAnchorType:(id)a3
{
}

- (NSString)abGroup
{
  return self->_abGroup;
}

- (void)setAbGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phaseType, 0);
  objc_storeStrong((id *)&self->_anchorType, 0);
  objc_storeStrong((id *)&self->_abGroup, 0);
}

@end