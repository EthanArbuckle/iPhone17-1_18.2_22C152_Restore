@interface GEOModality
+ (BOOL)isValid:(id)a3;
- (BOOL)expectedModality;
- (BOOL)hasConfidence;
- (BOOL)hasExpectedModality;
- (BOOL)hasNotMoving;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)notMoving;
- (BOOL)readFrom:(id)a3;
- (GEOModality)initWithDictionary:(id)a3;
- (GEOModality)initWithJSON:(id)a3;
- (double)timestamp;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)confidenceAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)StringAsConfidence:(id)a3;
- (int)confidence;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfidence:(int)a3;
- (void)setExpectedModality:(BOOL)a3;
- (void)setHasConfidence:(BOOL)a3;
- (void)setHasExpectedModality:(BOOL)a3;
- (void)setHasNotMoving:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setNotMoving:(BOOL)a3;
- (void)setTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOModality

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)expectedModality
{
  return self->_expectedModality;
}

- (void)setExpectedModality:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_expectedModality = a3;
}

- (void)setHasExpectedModality:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasExpectedModality
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (BOOL)notMoving
{
  return self->_notMoving;
}

- (void)setNotMoving:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_notMoving = a3;
}

- (void)setHasNotMoving:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasNotMoving
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (int)confidence
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_confidence;
  }
  else {
    return 0;
  }
}

- (void)setConfidence:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_confidence = a3;
}

- (void)setHasConfidence:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasConfidence
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)confidenceAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E4AA0[a3];
  }

  return v3;
}

- (int)StringAsConfidence:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"MODALITY_CONFIDENCE_LOW"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MODALITY_CONFIDENCE_MEDIUM"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"MODALITY_CONFIDENCE_HIGH"])
  {
    int v4 = 2;
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
  v8.super_class = (Class)GEOModality;
  int v4 = [(GEOModality *)&v8 description];
  v5 = [(GEOModality *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOModality _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_20;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 24);
  if (v5)
  {
    v6 = [NSNumber numberWithDouble:*(double *)(a1 + 8)];
    [v4 setObject:v6 forKey:@"timestamp"];

    char v5 = *(unsigned char *)(a1 + 24);
  }
  if ((v5 & 4) == 0)
  {
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
LABEL_12:
    v9 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 21)];
    if (a2) {
      v10 = @"notMoving";
    }
    else {
      v10 = @"not_moving";
    }
    [v4 setObject:v9 forKey:v10];

    if ((*(unsigned char *)(a1 + 24) & 2) == 0) {
      goto LABEL_20;
    }
    goto LABEL_16;
  }
  v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 20)];
  if (a2) {
    objc_super v8 = @"expectedModality";
  }
  else {
    objc_super v8 = @"expected_modality";
  }
  [v4 setObject:v7 forKey:v8];

  char v5 = *(unsigned char *)(a1 + 24);
  if ((v5 & 8) != 0) {
    goto LABEL_12;
  }
LABEL_6:
  if ((v5 & 2) != 0)
  {
LABEL_16:
    uint64_t v11 = *(int *)(a1 + 16);
    if (v11 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 16));
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E53E4AA0[v11];
    }
    [v4 setObject:v12 forKey:@"confidence"];
  }
LABEL_20:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOModality _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOModality)initWithDictionary:(id)a3
{
  return (GEOModality *)-[GEOModality _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v6 = [v5 objectForKeyedSubscript:@"timestamp"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v6 doubleValue];
        objc_msgSend(a1, "setTimestamp:");
      }

      if (a3) {
        v7 = @"expectedModality";
      }
      else {
        v7 = @"expected_modality";
      }
      objc_super v8 = [v5 objectForKeyedSubscript:v7];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setExpectedModality:", objc_msgSend(v8, "BOOLValue"));
      }

      if (a3) {
        v9 = @"notMoving";
      }
      else {
        v9 = @"not_moving";
      }
      v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setNotMoving:", objc_msgSend(v10, "BOOLValue"));
      }

      uint64_t v11 = [v5 objectForKeyedSubscript:@"confidence"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = v11;
        if ([v12 isEqualToString:@"MODALITY_CONFIDENCE_LOW"])
        {
          uint64_t v13 = 0;
        }
        else if ([v12 isEqualToString:@"MODALITY_CONFIDENCE_MEDIUM"])
        {
          uint64_t v13 = 1;
        }
        else if ([v12 isEqualToString:@"MODALITY_CONFIDENCE_HIGH"])
        {
          uint64_t v13 = 2;
        }
        else
        {
          uint64_t v13 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_27:

          goto LABEL_28;
        }
        uint64_t v13 = [v11 intValue];
      }
      [a1 setConfidence:v13];
      goto LABEL_27;
    }
  }
LABEL_28:

  return a1;
}

- (GEOModality)initWithJSON:(id)a3
{
  return (GEOModality *)-[GEOModality _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOModalityIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOModalityReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if (flags)
  {
    PBDataWriterWriteDoubleField();
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
LABEL_5:
  }
    PBDataWriterWriteInt32Field();
LABEL_6:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOModality *)self readAll:0];
  char flags = (char)self->_flags;
  if (flags)
  {
    v5[1] = *(void *)&self->_timestamp;
    *((unsigned char *)v5 + 24) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)v5 + 20) = self->_expectedModality;
  *((unsigned char *)v5 + 24) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  *((unsigned char *)v5 + 21) = self->_notMoving;
  *((unsigned char *)v5 + 24) |= 8u;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
LABEL_5:
    *((_DWORD *)v5 + 4) = self->_confidence;
    *((unsigned char *)v5 + 24) |= 2u;
  }
LABEL_6:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if (flags)
  {
    *((void *)result + 1) = *(void *)&self->_timestamp;
    *((unsigned char *)result + 24) |= 1u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 20) = self->_expectedModality;
  *((unsigned char *)result + 24) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 2) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((unsigned char *)result + 21) = self->_notMoving;
  *((unsigned char *)result + 24) |= 8u;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    return result;
  }
LABEL_5:
  *((_DWORD *)result + 4) = self->_confidence;
  *((unsigned char *)result + 24) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  [(GEOModality *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_timestamp != *((double *)v4 + 1)) {
      goto LABEL_27;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 4) == 0) {
      goto LABEL_27;
    }
    if (self->_expectedModality)
    {
      if (!*((unsigned char *)v4 + 20)) {
        goto LABEL_27;
      }
    }
    else if (*((unsigned char *)v4 + 20))
    {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) != 0)
  {
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 8) != 0)
    {
      if (self->_notMoving)
      {
        if (!*((unsigned char *)v4 + 21)) {
          goto LABEL_27;
        }
        goto LABEL_23;
      }
      if (!*((unsigned char *)v4 + 21)) {
        goto LABEL_23;
      }
    }
LABEL_27:
    BOOL v5 = 0;
    goto LABEL_28;
  }
  if ((*((unsigned char *)v4 + 24) & 8) != 0) {
    goto LABEL_27;
  }
LABEL_23:
  BOOL v5 = (*((unsigned char *)v4 + 24) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_confidence != *((_DWORD *)v4 + 4)) {
      goto LABEL_27;
    }
    BOOL v5 = 1;
  }
LABEL_28:

  return v5;
}

- (unint64_t)hash
{
  [(GEOModality *)self readAll:1];
  char flags = (char)self->_flags;
  if (flags)
  {
    double timestamp = self->_timestamp;
    double v6 = -timestamp;
    if (timestamp >= 0.0) {
      double v6 = self->_timestamp;
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
  if ((flags & 4) == 0)
  {
    uint64_t v9 = 0;
    if ((flags & 8) != 0) {
      goto LABEL_11;
    }
LABEL_14:
    uint64_t v10 = 0;
    if ((flags & 2) != 0) {
      goto LABEL_12;
    }
LABEL_15:
    uint64_t v11 = 0;
    return v9 ^ v4 ^ v10 ^ v11;
  }
  uint64_t v9 = 2654435761 * self->_expectedModality;
  if ((flags & 8) == 0) {
    goto LABEL_14;
  }
LABEL_11:
  uint64_t v10 = 2654435761 * self->_notMoving;
  if ((flags & 2) == 0) {
    goto LABEL_15;
  }
LABEL_12:
  uint64_t v11 = 2654435761 * self->_confidence;
  return v9 ^ v4 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 24);
  if (v4)
  {
    self->_double timestamp = *((double *)v5 + 1);
    *(unsigned char *)&self->_flags |= 1u;
    char v4 = *((unsigned char *)v5 + 24);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v5 + 24) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_expectedModality = *((unsigned char *)v5 + 20);
  *(unsigned char *)&self->_flags |= 4u;
  char v4 = *((unsigned char *)v5 + 24);
  if ((v4 & 8) == 0)
  {
LABEL_4:
    if ((v4 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_notMoving = *((unsigned char *)v5 + 21);
  *(unsigned char *)&self->_flags |= 8u;
  if ((*((unsigned char *)v5 + 24) & 2) != 0)
  {
LABEL_5:
    self->_confidence = *((_DWORD *)v5 + 4);
    *(unsigned char *)&self->_flags |= 2u;
  }
LABEL_6:
}

@end