@interface GEOPredictedCommuteDestination
+ (BOOL)isValid:(id)a3;
- (BOOL)chosen;
- (BOOL)hasChosen;
- (BOOL)hasConfidenceScore;
- (BOOL)hasDestinationType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPredictedCommuteDestination)initWithDictionary:(id)a3;
- (GEOPredictedCommuteDestination)initWithJSON:(id)a3;
- (double)confidenceScore;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)destinationTypeAsString:(int)a3;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)StringAsDestinationType:(id)a3;
- (int)destinationType;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChosen:(BOOL)a3;
- (void)setConfidenceScore:(double)a3;
- (void)setDestinationType:(int)a3;
- (void)setHasChosen:(BOOL)a3;
- (void)setHasConfidenceScore:(BOOL)a3;
- (void)setHasDestinationType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPredictedCommuteDestination

- (int)destinationType
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_destinationType;
  }
  else {
    return 0;
  }
}

- (void)setDestinationType:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_destinationType = a3;
}

- (void)setHasDestinationType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasDestinationType
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)destinationTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F89E0[a3];
  }

  return v3;
}

- (int)StringAsDestinationType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_COMMUTE_LOCATION_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"COMMUTE_WINDOW_LOCATION_OTHER"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"COMMUTE_WINDOW_LOCATION_HOME"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"COMMUTE_WINDOW_LOCATION_WORK"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"COMMUTE_WINDOW_LOCATION_SCHOOL"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (double)confidenceScore
{
  return self->_confidenceScore;
}

- (void)setConfidenceScore:(double)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_confidenceScore = a3;
}

- (void)setHasConfidenceScore:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasConfidenceScore
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)chosen
{
  return self->_chosen;
}

- (void)setChosen:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_chosen = a3;
}

- (void)setHasChosen:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasChosen
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPredictedCommuteDestination;
  int v4 = [(GEOPredictedCommuteDestination *)&v8 description];
  v5 = [(GEOPredictedCommuteDestination *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPredictedCommuteDestination _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 24);
    if ((v5 & 2) != 0)
    {
      uint64_t v6 = *(int *)(a1 + 16);
      if (v6 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 16));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = off_1E53F89E0[v6];
      }
      if (a2) {
        objc_super v8 = @"destinationType";
      }
      else {
        objc_super v8 = @"destination_type";
      }
      [v4 setObject:v7 forKey:v8];

      char v5 = *(unsigned char *)(a1 + 24);
    }
    if (v5)
    {
      v9 = [NSNumber numberWithDouble:*(double *)(a1 + 8)];
      if (a2) {
        v10 = @"confidenceScore";
      }
      else {
        v10 = @"confidence_score";
      }
      [v4 setObject:v9 forKey:v10];

      char v5 = *(unsigned char *)(a1 + 24);
    }
    if ((v5 & 4) != 0)
    {
      v11 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 20)];
      [v4 setObject:v11 forKey:@"chosen"];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPredictedCommuteDestination _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPredictedCommuteDestination)initWithDictionary:(id)a3
{
  return (GEOPredictedCommuteDestination *)-[GEOPredictedCommuteDestination _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_30;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_30;
  }
  if (a3) {
    uint64_t v6 = @"destinationType";
  }
  else {
    uint64_t v6 = @"destination_type";
  }
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"UNKNOWN_COMMUTE_LOCATION_TYPE"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"COMMUTE_WINDOW_LOCATION_OTHER"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"COMMUTE_WINDOW_LOCATION_HOME"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"COMMUTE_WINDOW_LOCATION_WORK"])
    {
      uint64_t v9 = 3;
    }
    else if ([v8 isEqualToString:@"COMMUTE_WINDOW_LOCATION_SCHOOL"])
    {
      uint64_t v9 = 4;
    }
    else
    {
      uint64_t v9 = 0;
    }

    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v7 intValue];
LABEL_21:
    [a1 setDestinationType:v9];
  }

  if (a3) {
    v10 = @"confidenceScore";
  }
  else {
    v10 = @"confidence_score";
  }
  v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v11 doubleValue];
    objc_msgSend(a1, "setConfidenceScore:");
  }

  v12 = [v5 objectForKeyedSubscript:@"chosen"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setChosen:", objc_msgSend(v12, "BOOLValue"));
  }

LABEL_30:
  return a1;
}

- (GEOPredictedCommuteDestination)initWithJSON:(id)a3
{
  return (GEOPredictedCommuteDestination *)-[GEOPredictedCommuteDestination _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPredictedCommuteDestinationIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPredictedCommuteDestinationReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_5:
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOPredictedCommuteDestination *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    v5[4] = self->_destinationType;
    *((unsigned char *)v5 + 24) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)v5 + 1) = *(void *)&self->_confidenceScore;
  *((unsigned char *)v5 + 24) |= 1u;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_4:
    *((unsigned char *)v5 + 20) = self->_chosen;
    *((unsigned char *)v5 + 24) |= 4u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)result + 4) = self->_destinationType;
    *((unsigned char *)result + 24) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 1) = *(void *)&self->_confidenceScore;
  *((unsigned char *)result + 24) |= 1u;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    return result;
  }
LABEL_4:
  *((unsigned char *)result + 20) = self->_chosen;
  *((unsigned char *)result + 24) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  [(GEOPredictedCommuteDestination *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_destinationType != *((_DWORD *)v4 + 4)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
    goto LABEL_14;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_confidenceScore != *((double *)v4 + 1)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_14;
  }
  BOOL v5 = (*((unsigned char *)v4 + 24) & 4) == 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 4) == 0)
    {
LABEL_14:
      BOOL v5 = 0;
      goto LABEL_15;
    }
    if (self->_chosen)
    {
      if (!*((unsigned char *)v4 + 20)) {
        goto LABEL_14;
      }
    }
    else if (*((unsigned char *)v4 + 20))
    {
      goto LABEL_14;
    }
    BOOL v5 = 1;
  }
LABEL_15:

  return v5;
}

- (unint64_t)hash
{
  [(GEOPredictedCommuteDestination *)self readAll:1];
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_destinationType;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    goto LABEL_11;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double confidenceScore = self->_confidenceScore;
  double v6 = -confidenceScore;
  if (confidenceScore >= 0.0) {
    double v6 = self->_confidenceScore;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  if ((flags & 4) != 0) {
    uint64_t v10 = 2654435761 * self->_chosen;
  }
  else {
    uint64_t v10 = 0;
  }
  return v9 ^ v4 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 24);
  if ((v4 & 2) != 0)
  {
    self->_destinationType = *((_DWORD *)v5 + 4);
    *(unsigned char *)&self->_flags |= 2u;
    char v4 = *((unsigned char *)v5 + 24);
    if ((v4 & 1) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v5 + 24) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_double confidenceScore = *((double *)v5 + 1);
  *(unsigned char *)&self->_flags |= 1u;
  if ((*((unsigned char *)v5 + 24) & 4) != 0)
  {
LABEL_4:
    self->_chosen = *((unsigned char *)v5 + 20);
    *(unsigned char *)&self->_flags |= 4u;
  }
LABEL_5:
}

@end