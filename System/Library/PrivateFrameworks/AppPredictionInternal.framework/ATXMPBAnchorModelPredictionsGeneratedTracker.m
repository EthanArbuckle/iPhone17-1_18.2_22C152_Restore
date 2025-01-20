@interface ATXMPBAnchorModelPredictionsGeneratedTracker
- (BOOL)hasAbGroup;
- (BOOL)hasAnchorType;
- (BOOL)hasCandidateType;
- (BOOL)hasExecutableObject;
- (BOOL)hasScore;
- (BOOL)hasSecondsAfterAnchorEnd;
- (BOOL)hasSecondsAfterAnchorStart;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)abGroup;
- (NSString)anchorType;
- (NSString)candidateType;
- (NSString)executableObject;
- (double)score;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)secondsAfterAnchorEnd;
- (int)secondsAfterAnchorStart;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAbGroup:(id)a3;
- (void)setAnchorType:(id)a3;
- (void)setCandidateType:(id)a3;
- (void)setExecutableObject:(id)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setHasSecondsAfterAnchorEnd:(BOOL)a3;
- (void)setHasSecondsAfterAnchorStart:(BOOL)a3;
- (void)setScore:(double)a3;
- (void)setSecondsAfterAnchorEnd:(int)a3;
- (void)setSecondsAfterAnchorStart:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXMPBAnchorModelPredictionsGeneratedTracker

- (BOOL)hasAnchorType
{
  return self->_anchorType != 0;
}

- (void)setScore:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_score = a3;
}

- (void)setHasScore:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasScore
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasCandidateType
{
  return self->_candidateType != 0;
}

- (void)setSecondsAfterAnchorStart:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_secondsAfterAnchorStart = a3;
}

- (void)setHasSecondsAfterAnchorStart:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSecondsAfterAnchorStart
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSecondsAfterAnchorEnd:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_secondsAfterAnchorEnd = a3;
}

- (void)setHasSecondsAfterAnchorEnd:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSecondsAfterAnchorEnd
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasAbGroup
{
  return self->_abGroup != 0;
}

- (BOOL)hasExecutableObject
{
  return self->_executableObject != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXMPBAnchorModelPredictionsGeneratedTracker;
  v4 = [(ATXMPBAnchorModelPredictionsGeneratedTracker *)&v8 description];
  v5 = [(ATXMPBAnchorModelPredictionsGeneratedTracker *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  anchorType = self->_anchorType;
  if (anchorType) {
    [v3 setObject:anchorType forKey:@"anchorType"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithDouble:self->_score];
    [v4 setObject:v6 forKey:@"score"];
  }
  candidateType = self->_candidateType;
  if (candidateType) {
    [v4 setObject:candidateType forKey:@"candidateType"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v9 = [NSNumber numberWithInt:self->_secondsAfterAnchorStart];
    [v4 setObject:v9 forKey:@"secondsAfterAnchorStart"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v10 = [NSNumber numberWithInt:self->_secondsAfterAnchorEnd];
    [v4 setObject:v10 forKey:@"secondsAfterAnchorEnd"];
  }
  abGroup = self->_abGroup;
  if (abGroup) {
    [v4 setObject:abGroup forKey:@"abGroup"];
  }
  executableObject = self->_executableObject;
  if (executableObject) {
    [v4 setObject:executableObject forKey:@"executableObject"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXMPBAnchorModelPredictionsGeneratedTrackerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_anchorType)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
  if (self->_candidateType)
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
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_abGroup)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_executableObject)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_anchorType)
  {
    objc_msgSend(v4, "setAnchorType:");
    id v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_score;
    *((unsigned char *)v4 + 56) |= 1u;
  }
  if (self->_candidateType)
  {
    objc_msgSend(v6, "setCandidateType:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 13) = self->_secondsAfterAnchorStart;
    *((unsigned char *)v4 + 56) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_secondsAfterAnchorEnd;
    *((unsigned char *)v4 + 56) |= 2u;
  }
  if (self->_abGroup)
  {
    objc_msgSend(v6, "setAbGroup:");
    id v4 = v6;
  }
  if (self->_executableObject)
  {
    objc_msgSend(v6, "setExecutableObject:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_anchorType copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_score;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_candidateType copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_secondsAfterAnchorStart;
    *(unsigned char *)(v5 + 56) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_secondsAfterAnchorEnd;
    *(unsigned char *)(v5 + 56) |= 2u;
  }
  uint64_t v11 = [(NSString *)self->_abGroup copyWithZone:a3];
  v12 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v11;

  uint64_t v13 = [(NSString *)self->_executableObject copyWithZone:a3];
  v14 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v13;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  anchorType = self->_anchorType;
  if ((unint64_t)anchorType | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](anchorType, "isEqual:")) {
      goto LABEL_26;
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_score != *((double *)v4 + 1)) {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
    goto LABEL_26;
  }
  candidateType = self->_candidateType;
  if ((unint64_t)candidateType | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](candidateType, "isEqual:"))
    {
LABEL_26:
      char v10 = 0;
      goto LABEL_27;
    }
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_secondsAfterAnchorStart != *((_DWORD *)v4 + 13)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
    goto LABEL_26;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_secondsAfterAnchorEnd != *((_DWORD *)v4 + 12)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
    goto LABEL_26;
  }
  abGroup = self->_abGroup;
  if ((unint64_t)abGroup | *((void *)v4 + 2) && !-[NSString isEqual:](abGroup, "isEqual:")) {
    goto LABEL_26;
  }
  executableObject = self->_executableObject;
  if ((unint64_t)executableObject | *((void *)v4 + 5)) {
    char v10 = -[NSString isEqual:](executableObject, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_27:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_anchorType hash];
  if (*(unsigned char *)&self->_has)
  {
    double score = self->_score;
    double v6 = -score;
    if (score >= 0.0) {
      double v6 = self->_score;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  NSUInteger v9 = [(NSString *)self->_candidateType hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v10 = 2654435761 * self->_secondsAfterAnchorStart;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_11;
    }
LABEL_13:
    uint64_t v11 = 0;
    goto LABEL_14;
  }
  uint64_t v10 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v11 = 2654435761 * self->_secondsAfterAnchorEnd;
LABEL_14:
  unint64_t v12 = v4 ^ v3 ^ v9 ^ v10;
  NSUInteger v13 = v11 ^ [(NSString *)self->_abGroup hash];
  return v12 ^ v13 ^ [(NSString *)self->_executableObject hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 3))
  {
    -[ATXMPBAnchorModelPredictionsGeneratedTracker setAnchorType:](self, "setAnchorType:");
    id v4 = v6;
  }
  if (*((unsigned char *)v4 + 56))
  {
    self->_double score = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 4))
  {
    -[ATXMPBAnchorModelPredictionsGeneratedTracker setCandidateType:](self, "setCandidateType:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 56);
  if ((v5 & 4) != 0)
  {
    self->_secondsAfterAnchorStart = *((_DWORD *)v4 + 13);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 56);
  }
  if ((v5 & 2) != 0)
  {
    self->_secondsAfterAnchorEnd = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 2))
  {
    -[ATXMPBAnchorModelPredictionsGeneratedTracker setAbGroup:](self, "setAbGroup:");
    id v4 = v6;
  }
  if (*((void *)v4 + 5))
  {
    -[ATXMPBAnchorModelPredictionsGeneratedTracker setExecutableObject:](self, "setExecutableObject:");
    id v4 = v6;
  }
}

- (NSString)anchorType
{
  return self->_anchorType;
}

- (void)setAnchorType:(id)a3
{
}

- (double)score
{
  return self->_score;
}

- (NSString)candidateType
{
  return self->_candidateType;
}

- (void)setCandidateType:(id)a3
{
}

- (int)secondsAfterAnchorStart
{
  return self->_secondsAfterAnchorStart;
}

- (int)secondsAfterAnchorEnd
{
  return self->_secondsAfterAnchorEnd;
}

- (NSString)abGroup
{
  return self->_abGroup;
}

- (void)setAbGroup:(id)a3
{
}

- (NSString)executableObject
{
  return self->_executableObject;
}

- (void)setExecutableObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executableObject, 0);
  objc_storeStrong((id *)&self->_candidateType, 0);
  objc_storeStrong((id *)&self->_anchorType, 0);
  objc_storeStrong((id *)&self->_abGroup, 0);
}

@end