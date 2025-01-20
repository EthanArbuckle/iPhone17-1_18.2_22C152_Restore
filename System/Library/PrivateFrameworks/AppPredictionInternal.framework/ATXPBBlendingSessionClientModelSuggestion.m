@interface ATXPBBlendingSessionClientModelSuggestion
- (BOOL)hasExecutableId;
- (BOOL)hasRawScore;
- (BOOL)hasSuggestedConfidenceCategory;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)executableId;
- (double)rawScore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)suggestedConfidenceCategoryAsString:(int)a3;
- (int)StringAsSuggestedConfidenceCategory:(id)a3;
- (int)suggestedConfidenceCategory;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setExecutableId:(id)a3;
- (void)setHasRawScore:(BOOL)a3;
- (void)setHasSuggestedConfidenceCategory:(BOOL)a3;
- (void)setRawScore:(double)a3;
- (void)setSuggestedConfidenceCategory:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBBlendingSessionClientModelSuggestion

- (BOOL)hasExecutableId
{
  return self->_executableId != 0;
}

- (void)setRawScore:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_rawScore = a3;
}

- (void)setHasRawScore:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRawScore
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)suggestedConfidenceCategory
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_suggestedConfidenceCategory;
  }
  else {
    return 0;
  }
}

- (void)setSuggestedConfidenceCategory:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_suggestedConfidenceCategory = a3;
}

- (void)setHasSuggestedConfidenceCategory:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSuggestedConfidenceCategory
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)suggestedConfidenceCategoryAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E68AD448[a3];
  }
  return v3;
}

- (int)StringAsSuggestedConfidenceCategory:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Fallback"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Low"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Medium"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"High"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBBlendingSessionClientModelSuggestion;
  int v4 = [(ATXPBBlendingSessionClientModelSuggestion *)&v8 description];
  v5 = [(ATXPBBlendingSessionClientModelSuggestion *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = v3;
  executableId = self->_executableId;
  if (executableId) {
    [v3 setObject:executableId forKey:@"executableId"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v7 = [NSNumber numberWithDouble:self->_rawScore];
    [v4 setObject:v7 forKey:@"rawScore"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t suggestedConfidenceCategory = self->_suggestedConfidenceCategory;
    if (suggestedConfidenceCategory >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_suggestedConfidenceCategory);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E68AD448[suggestedConfidenceCategory];
    }
    [v4 setObject:v9 forKey:@"suggestedConfidenceCategory"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBBlendingSessionClientModelSuggestionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_executableId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_executableId)
  {
    id v6 = v4;
    objc_msgSend(v4, "setExecutableId:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_rawScore;
    *((unsigned char *)v4 + 28) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_suggestedConfidenceCategory;
    *((unsigned char *)v4 + 28) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_executableId copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 8) = self->_rawScore;
    *(unsigned char *)(v5 + 28) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_suggestedConfidenceCategory;
    *(unsigned char *)(v5 + 28) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  executableId = self->_executableId;
  if ((unint64_t)executableId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](executableId, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_rawScore != *((double *)v4 + 1)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_13:
    BOOL v6 = 0;
    goto LABEL_14;
  }
  BOOL v6 = (*((unsigned char *)v4 + 28) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_suggestedConfidenceCategory != *((_DWORD *)v4 + 6)) {
      goto LABEL_13;
    }
    BOOL v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_executableId hash];
  char has = (char)self->_has;
  if (has)
  {
    double rawScore = self->_rawScore;
    double v7 = -rawScore;
    if (rawScore >= 0.0) {
      double v7 = self->_rawScore;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((has & 2) != 0) {
    uint64_t v10 = 2654435761 * self->_suggestedConfidenceCategory;
  }
  else {
    uint64_t v10 = 0;
  }
  return v5 ^ v3 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 2))
  {
    id v6 = v4;
    -[ATXPBBlendingSessionClientModelSuggestion setExecutableId:](self, "setExecutableId:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 28);
  if (v5)
  {
    self->_double rawScore = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 28);
  }
  if ((v5 & 2) != 0)
  {
    self->_uint64_t suggestedConfidenceCategory = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSString)executableId
{
  return self->_executableId;
}

- (void)setExecutableId:(id)a3
{
}

- (double)rawScore
{
  return self->_rawScore;
}

- (void).cxx_destruct
{
}

@end