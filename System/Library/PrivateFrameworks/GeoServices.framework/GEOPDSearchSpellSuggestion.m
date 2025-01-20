@interface GEOPDSearchSpellSuggestion
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (unint64_t)hash;
- (void)setSuggestion:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSearchSpellSuggestion

- (void)setSuggestion:(uint64_t)a1
{
  id v4 = a2;
  objc_storeStrong((id *)(a1 + 16), a2);
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchSpellSuggestion;
  id v4 = [(GEOPDSearchSpellSuggestion *)&v8 description];
  v5 = [(GEOPDSearchSpellSuggestion *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchSpellSuggestion _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_20;
  }
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = *(id *)(a1 + 16);
  v6 = v5;
  if (v5)
  {
    if (a2) {
      [v5 jsonRepresentation];
    }
    else {
    v7 = [v5 dictionaryRepresentation];
    }
    [v4 setObject:v7 forKey:@"suggestion"];
  }
  char v9 = *(unsigned char *)(a1 + 32);
  if ((v9 & 1) == 0)
  {
    if ((*(unsigned char *)(a1 + 32) & 2) == 0) {
      goto LABEL_9;
    }
LABEL_12:
    v11 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
    if (a2) {
      v12 = @"editDistance";
    }
    else {
      v12 = @"edit_distance";
    }
    [v4 setObject:v11 forKey:v12];

    if ((*(unsigned char *)(a1 + 32) & 4) == 0) {
      goto LABEL_20;
    }
    goto LABEL_16;
  }
  v10 = [NSNumber numberWithDouble:*(double *)(a1 + 8)];
  [v4 setObject:v10 forKey:@"score"];

  char v9 = *(unsigned char *)(a1 + 32);
  if ((v9 & 2) != 0) {
    goto LABEL_12;
  }
LABEL_9:
  if ((v9 & 4) != 0)
  {
LABEL_16:
    LODWORD(v8) = *(_DWORD *)(a1 + 28);
    v13 = [NSNumber numberWithFloat:v8];
    if (a2) {
      v14 = @"rawScore";
    }
    else {
      v14 = @"raw_score";
    }
    [v4 setObject:v13 forKey:v14];
  }
LABEL_20:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchSpellSuggestion _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = [(id)a1 init];
    if (a1)
    {
      v6 = [v5 objectForKeyedSubscript:@"suggestion"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = [GEOPDSearchTokenSet alloc];
        if (v7) {
          double v8 = (void *)-[GEOPDSearchTokenSet _initWithDictionary:isJSON:](v7, v6, a3);
        }
        else {
          double v8 = 0;
        }
        -[GEOPDSearchSpellSuggestion setSuggestion:](a1, v8);
      }
      char v9 = [v5 objectForKeyedSubscript:@"score"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v9 doubleValue];
        *(unsigned char *)(a1 + 32) |= 1u;
        *(void *)(a1 + 8) = v10;
      }

      if (a3) {
        v11 = @"editDistance";
      }
      else {
        v11 = @"edit_distance";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v13 = [v12 unsignedIntValue];
        *(unsigned char *)(a1 + 32) |= 2u;
        *(_DWORD *)(a1 + 24) = v13;
      }

      if (a3) {
        v14 = @"rawScore";
      }
      else {
        v14 = @"raw_score";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v15 floatValue];
        *(unsigned char *)(a1 + 32) |= 4u;
        *(_DWORD *)(a1 + 28) = v16;
      }
    }
  }

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchSpellSuggestionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_suggestion)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char flags = (char)self->_flags;
  if (flags)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_5:
      if ((flags & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_6:
    PBDataWriterWriteFloatField();
    id v4 = v6;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(GEOPDSearchTokenSet *)self->_suggestion copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(v5 + 24) = self->_editDistance;
    *(unsigned char *)(v5 + 32) |= 2u;
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      return (id)v5;
    }
    goto LABEL_4;
  }
  *(double *)(v5 + 8) = self->_score;
  *(unsigned char *)(v5 + 32) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((flags & 4) != 0)
  {
LABEL_4:
    *(float *)(v5 + 28) = self->_rawScore;
    *(unsigned char *)(v5 + 32) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  suggestion = self->_suggestion;
  if ((unint64_t)suggestion | *((void *)v4 + 2))
  {
    if (!-[GEOPDSearchTokenSet isEqual:](suggestion, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_score != *((double *)v4 + 1)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_18:
    BOOL v6 = 0;
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_editDistance != *((_DWORD *)v4 + 6)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_18;
  }
  BOOL v6 = (*((unsigned char *)v4 + 32) & 4) == 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_rawScore != *((float *)v4 + 7)) {
      goto LABEL_18;
    }
    BOOL v6 = 1;
  }
LABEL_19:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(GEOPDSearchTokenSet *)self->_suggestion hash];
  char flags = (char)self->_flags;
  if (flags)
  {
    double score = self->_score;
    double v7 = -score;
    if (score >= 0.0) {
      double v7 = self->_score;
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
  if ((flags & 2) != 0)
  {
    uint64_t v10 = 2654435761 * self->_editDistance;
    if ((flags & 4) != 0) {
      goto LABEL_11;
    }
LABEL_16:
    unint64_t v15 = 0;
    return v5 ^ v3 ^ v10 ^ v15;
  }
  uint64_t v10 = 0;
  if ((flags & 4) == 0) {
    goto LABEL_16;
  }
LABEL_11:
  float rawScore = self->_rawScore;
  double v12 = rawScore;
  if (rawScore < 0.0) {
    double v12 = -rawScore;
  }
  long double v13 = floor(v12 + 0.5);
  double v14 = (v12 - v13) * 1.84467441e19;
  unint64_t v15 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
  if (v14 >= 0.0)
  {
    if (v14 > 0.0) {
      v15 += (unint64_t)v14;
    }
  }
  else
  {
    v15 -= (unint64_t)fabs(v14);
  }
  return v5 ^ v3 ^ v10 ^ v15;
}

- (void).cxx_destruct
{
}

@end