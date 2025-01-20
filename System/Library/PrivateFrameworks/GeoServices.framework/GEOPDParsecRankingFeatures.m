@interface GEOPDParsecRankingFeatures
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDistanceFromContainment;
- (BOOL)hasDistanceFromDeviceLocation;
- (BOOL)hasExpectedCtr;
- (BOOL)hasIsRecallMismatch;
- (BOOL)hasIsSpellCorrected;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRecallMismatch;
- (BOOL)isSpellCorrected;
- (BOOL)readFrom:(id)a3;
- (GEOPDParsecRankingFeatures)initWithDictionary:(id)a3;
- (GEOPDParsecRankingFeatures)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (double)distanceFromContainment;
- (double)distanceFromDeviceLocation;
- (double)expectedCtr;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDistanceFromContainment:(double)a3;
- (void)setDistanceFromDeviceLocation:(double)a3;
- (void)setExpectedCtr:(double)a3;
- (void)setHasDistanceFromContainment:(BOOL)a3;
- (void)setHasDistanceFromDeviceLocation:(BOOL)a3;
- (void)setHasExpectedCtr:(BOOL)a3;
- (void)setHasIsRecallMismatch:(BOOL)a3;
- (void)setHasIsSpellCorrected:(BOOL)a3;
- (void)setIsRecallMismatch:(BOOL)a3;
- (void)setIsSpellCorrected:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDParsecRankingFeatures

- (double)expectedCtr
{
  return self->_expectedCtr;
}

- (void)setExpectedCtr:(double)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_expectedCtr = a3;
}

- (void)setHasExpectedCtr:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasExpectedCtr
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (double)distanceFromDeviceLocation
{
  return self->_distanceFromDeviceLocation;
}

- (void)setDistanceFromDeviceLocation:(double)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_distanceFromDeviceLocation = a3;
}

- (void)setHasDistanceFromDeviceLocation:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasDistanceFromDeviceLocation
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (double)distanceFromContainment
{
  return self->_distanceFromContainment;
}

- (void)setDistanceFromContainment:(double)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_distanceFromContainment = a3;
}

- (void)setHasDistanceFromContainment:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasDistanceFromContainment
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)isSpellCorrected
{
  return self->_isSpellCorrected;
}

- (void)setIsSpellCorrected:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_isSpellCorrected = a3;
}

- (void)setHasIsSpellCorrected:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xEF | v3;
}

- (BOOL)hasIsSpellCorrected
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (BOOL)isRecallMismatch
{
  return self->_isRecallMismatch;
}

- (void)setIsRecallMismatch:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_isRecallMismatch = a3;
}

- (void)setHasIsRecallMismatch:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasIsRecallMismatch
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDParsecRankingFeatures;
  v4 = [(GEOPDParsecRankingFeatures *)&v8 description];
  v5 = [(GEOPDParsecRankingFeatures *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDParsecRankingFeatures _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_15;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 44);
  if ((v5 & 4) != 0)
  {
    v15 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
    if (a2) {
      v16 = @"expectedCtr";
    }
    else {
      v16 = @"expected_ctr";
    }
    [v4 setObject:v15 forKey:v16];

    char v5 = *(unsigned char *)(a1 + 44);
    if ((v5 & 2) == 0)
    {
LABEL_4:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_26;
    }
  }
  else if ((*(unsigned char *)(a1 + 44) & 2) == 0)
  {
    goto LABEL_4;
  }
  v17 = [NSNumber numberWithDouble:*(double *)(a1 + 24)];
  if (a2) {
    v18 = @"distanceFromDeviceLocation";
  }
  else {
    v18 = @"distance_from_device_location";
  }
  [v4 setObject:v17 forKey:v18];

  char v5 = *(unsigned char *)(a1 + 44);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_30;
  }
LABEL_26:
  v19 = [NSNumber numberWithDouble:*(double *)(a1 + 16)];
  if (a2) {
    v20 = @"distanceFromContainment";
  }
  else {
    v20 = @"distance_from_containment";
  }
  [v4 setObject:v19 forKey:v20];

  char v5 = *(unsigned char *)(a1 + 44);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_7;
  }
LABEL_30:
  v21 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 41)];
  if (a2) {
    v22 = @"isSpellCorrected";
  }
  else {
    v22 = @"is_spell_corrected";
  }
  [v4 setObject:v21 forKey:v22];

  if ((*(unsigned char *)(a1 + 44) & 8) != 0)
  {
LABEL_7:
    v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
    if (a2) {
      v7 = @"isRecallMismatch";
    }
    else {
      v7 = @"is_recall_mismatch";
    }
    [v4 setObject:v6 forKey:v7];
  }
LABEL_11:
  objc_super v8 = *(void **)(a1 + 8);
  if (v8)
  {
    v9 = [v8 dictionaryRepresentation];
    v10 = v9;
    if (a2)
    {
      v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __56__GEOPDParsecRankingFeatures__dictionaryRepresentation___block_invoke;
      v23[3] = &unk_1E53D8860;
      id v12 = v11;
      id v24 = v12;
      [v10 enumerateKeysAndObjectsUsingBlock:v23];
      id v13 = v12;

      v10 = v13;
    }
    [v4 setObject:v10 forKey:@"Unknown Fields"];
  }
LABEL_15:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDParsecRankingFeatures _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __56__GEOPDParsecRankingFeatures__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOPDParsecRankingFeatures)initWithDictionary:(id)a3
{
  return (GEOPDParsecRankingFeatures *)-[GEOPDParsecRankingFeatures _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        v6 = @"expectedCtr";
      }
      else {
        v6 = @"expected_ctr";
      }
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v7 doubleValue];
        objc_msgSend(a1, "setExpectedCtr:");
      }

      if (a3) {
        objc_super v8 = @"distanceFromDeviceLocation";
      }
      else {
        objc_super v8 = @"distance_from_device_location";
      }
      v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v9 doubleValue];
        objc_msgSend(a1, "setDistanceFromDeviceLocation:");
      }

      if (a3) {
        id v10 = @"distanceFromContainment";
      }
      else {
        id v10 = @"distance_from_containment";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v11 doubleValue];
        objc_msgSend(a1, "setDistanceFromContainment:");
      }

      if (a3) {
        id v12 = @"isSpellCorrected";
      }
      else {
        id v12 = @"is_spell_corrected";
      }
      id v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsSpellCorrected:", objc_msgSend(v13, "BOOLValue"));
      }

      if (a3) {
        v14 = @"isRecallMismatch";
      }
      else {
        v14 = @"is_recall_mismatch";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsRecallMismatch:", objc_msgSend(v15, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEOPDParsecRankingFeatures)initWithJSON:(id)a3
{
  return (GEOPDParsecRankingFeatures *)-[GEOPDParsecRankingFeatures _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDParsecRankingFeaturesIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDParsecRankingFeaturesReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_4:
    if ((flags & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteDoubleField();
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_5:
    if ((flags & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
LABEL_6:
  }
    PBDataWriterWriteBOOLField();
LABEL_7:
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOPDParsecRankingFeatures *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    v5[4] = *(void *)&self->_expectedCtr;
    *((unsigned char *)v5 + 44) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  v5[3] = *(void *)&self->_distanceFromDeviceLocation;
  *((unsigned char *)v5 + 44) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_4:
    if ((flags & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v5[2] = *(void *)&self->_distanceFromContainment;
  *((unsigned char *)v5 + 44) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 0x10) == 0)
  {
LABEL_5:
    if ((flags & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  *((unsigned char *)v5 + 41) = self->_isSpellCorrected;
  *((unsigned char *)v5 + 44) |= 0x10u;
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
LABEL_6:
    *((unsigned char *)v5 + 40) = self->_isRecallMismatch;
    *((unsigned char *)v5 + 44) |= 8u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *(double *)(v4 + 32) = self->_expectedCtr;
    *(unsigned char *)(v4 + 44) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v4 + 24) = self->_distanceFromDeviceLocation;
  *(unsigned char *)(v4 + 44) |= 2u;
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_4:
    if ((flags & 0x10) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    *(unsigned char *)(v4 + 41) = self->_isSpellCorrected;
    *(unsigned char *)(v4 + 44) |= 0x10u;
    if ((*(unsigned char *)&self->_flags & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_10:
  *(double *)(v4 + 16) = self->_distanceFromContainment;
  *(unsigned char *)(v4 + 44) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 0x10) != 0) {
    goto LABEL_11;
  }
LABEL_5:
  if ((flags & 8) != 0)
  {
LABEL_6:
    *(unsigned char *)(v4 + 40) = self->_isRecallMismatch;
    *(unsigned char *)(v4 + 44) |= 8u;
  }
LABEL_7:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  [(GEOPDParsecRankingFeatures *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0 || self->_expectedCtr != *((double *)v4 + 4)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_distanceFromDeviceLocation != *((double *)v4 + 3)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_27;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_distanceFromContainment != *((double *)v4 + 2)) {
      goto LABEL_27;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 0x10) == 0) {
      goto LABEL_27;
    }
    if (self->_isSpellCorrected)
    {
      if (!*((unsigned char *)v4 + 41)) {
        goto LABEL_27;
      }
    }
    else if (*((unsigned char *)v4 + 41))
    {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 0x10) != 0)
  {
    goto LABEL_27;
  }
  BOOL v5 = (*((unsigned char *)v4 + 44) & 8) == 0;
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 8) != 0)
    {
      if (self->_isRecallMismatch)
      {
        if (!*((unsigned char *)v4 + 40)) {
          goto LABEL_27;
        }
      }
      else if (*((unsigned char *)v4 + 40))
      {
        goto LABEL_27;
      }
      BOOL v5 = 1;
      goto LABEL_28;
    }
LABEL_27:
    BOOL v5 = 0;
  }
LABEL_28:

  return v5;
}

- (unint64_t)hash
{
  [(GEOPDParsecRankingFeatures *)self readAll:1];
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    double expectedCtr = self->_expectedCtr;
    double v6 = -expectedCtr;
    if (expectedCtr >= 0.0) {
      double v6 = self->_expectedCtr;
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
  if ((flags & 2) != 0)
  {
    double distanceFromDeviceLocation = self->_distanceFromDeviceLocation;
    double v11 = -distanceFromDeviceLocation;
    if (distanceFromDeviceLocation >= 0.0) {
      double v11 = self->_distanceFromDeviceLocation;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if (flags)
  {
    double distanceFromContainment = self->_distanceFromContainment;
    double v16 = -distanceFromContainment;
    if (distanceFromContainment >= 0.0) {
      double v16 = self->_distanceFromContainment;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((flags & 0x10) != 0)
  {
    uint64_t v19 = 2654435761 * self->_isSpellCorrected;
    if ((flags & 8) != 0) {
      goto LABEL_27;
    }
LABEL_29:
    uint64_t v20 = 0;
    return v9 ^ v4 ^ v14 ^ v19 ^ v20;
  }
  uint64_t v19 = 0;
  if ((flags & 8) == 0) {
    goto LABEL_29;
  }
LABEL_27:
  uint64_t v20 = 2654435761 * self->_isRecallMismatch;
  return v9 ^ v4 ^ v14 ^ v19 ^ v20;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 44);
  if ((v4 & 4) != 0)
  {
    self->_double expectedCtr = *((double *)v5 + 4);
    *(unsigned char *)&self->_flags |= 4u;
    char v4 = *((unsigned char *)v5 + 44);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v5 + 44) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_double distanceFromDeviceLocation = *((double *)v5 + 3);
  *(unsigned char *)&self->_flags |= 2u;
  char v4 = *((unsigned char *)v5 + 44);
  if ((v4 & 1) == 0)
  {
LABEL_4:
    if ((v4 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_double distanceFromContainment = *((double *)v5 + 2);
  *(unsigned char *)&self->_flags |= 1u;
  char v4 = *((unsigned char *)v5 + 44);
  if ((v4 & 0x10) == 0)
  {
LABEL_5:
    if ((v4 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  self->_isSpellCorrected = *((unsigned char *)v5 + 41);
  *(unsigned char *)&self->_flags |= 0x10u;
  if ((*((unsigned char *)v5 + 44) & 8) != 0)
  {
LABEL_6:
    self->_isRecallMismatch = *((unsigned char *)v5 + 40);
    *(unsigned char *)&self->_flags |= 8u;
  }
LABEL_7:
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOPDParsecRankingFeatures *)self readAll:0];
  }
}

- (void).cxx_destruct
{
}

@end