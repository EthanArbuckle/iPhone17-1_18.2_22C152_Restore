@interface GEOPDHikeSummary
+ (BOOL)isValid:(id)a3;
+ (GEOPDHikeSummary)hikeSummaryWithPlaceData:(id)a3;
- (BOOL)hasExpectedDurationSeconds;
- (BOOL)hasHikeTypeName;
- (BOOL)hasLengthMeters;
- (BOOL)hasSumElevationGainCm;
- (BOOL)hasSumElevationLossCm;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOFormattedString)hikeTypeName;
- (GEOPDHikeSummary)initWithDictionary:(id)a3;
- (GEOPDHikeSummary)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)expectedDurationSeconds;
- (unsigned)lengthMeters;
- (unsigned)sumElevationGainCm;
- (unsigned)sumElevationLossCm;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setExpectedDurationSeconds:(unsigned int)a3;
- (void)setHasExpectedDurationSeconds:(BOOL)a3;
- (void)setHasLengthMeters:(BOOL)a3;
- (void)setHasSumElevationGainCm:(BOOL)a3;
- (void)setHasSumElevationLossCm:(BOOL)a3;
- (void)setHikeTypeName:(id)a3;
- (void)setLengthMeters:(unsigned int)a3;
- (void)setSumElevationGainCm:(unsigned int)a3;
- (void)setSumElevationLossCm:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDHikeSummary

+ (GEOPDHikeSummary)hikeSummaryWithPlaceData:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__37;
  v11 = __Block_byref_object_dispose__37;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__GEOPDHikeSummary_PlaceDataExtras__hikeSummaryWithPlaceData___block_invoke;
  v6[3] = &unk_1E53E16F0;
  v6[4] = &v7;
  [v3 enumerateValidComponentValuesOfType:105 usingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (GEOPDHikeSummary *)v4;
}

void __62__GEOPDHikeSummary_PlaceDataExtras__hikeSummaryWithPlaceData___block_invoke(uint64_t a1, id *a2, unsigned char *a3)
{
  v5 = -[GEOPDComponentValue hikeSummary](a2);
  if (v5)
  {
    v6 = v5;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v5);
    v5 = v6;
    *a3 = 1;
  }
}

- (unsigned)lengthMeters
{
  return self->_lengthMeters;
}

- (void)setLengthMeters:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_lengthMeters = a3;
}

- (void)setHasLengthMeters:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasLengthMeters
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (unsigned)expectedDurationSeconds
{
  return self->_expectedDurationSeconds;
}

- (void)setExpectedDurationSeconds:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_expectedDurationSeconds = a3;
}

- (void)setHasExpectedDurationSeconds:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasExpectedDurationSeconds
{
  return *(unsigned char *)&self->_flags & 1;
}

- (unsigned)sumElevationGainCm
{
  return self->_sumElevationGainCm;
}

- (void)setSumElevationGainCm:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_sumElevationGainCm = a3;
}

- (void)setHasSumElevationGainCm:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasSumElevationGainCm
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (unsigned)sumElevationLossCm
{
  return self->_sumElevationLossCm;
}

- (void)setSumElevationLossCm:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_sumElevationLossCm = a3;
}

- (void)setHasSumElevationLossCm:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasSumElevationLossCm
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (BOOL)hasHikeTypeName
{
  return self->_hikeTypeName != 0;
}

- (GEOFormattedString)hikeTypeName
{
  return self->_hikeTypeName;
}

- (void)setHikeTypeName:(id)a3
{
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDHikeSummary;
  id v4 = [(GEOPDHikeSummary *)&v8 description];
  v5 = [(GEOPDHikeSummary *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDHikeSummary _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_32;
  }
  [(id)a1 readAll:1];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 40);
  if ((v5 & 2) != 0)
  {
    id v12 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 28)];
    if (a2) {
      v13 = @"lengthMeters";
    }
    else {
      v13 = @"length_meters";
    }
    [v4 setObject:v12 forKey:v13];

    char v5 = *(unsigned char *)(a1 + 40);
    if ((v5 & 1) == 0)
    {
LABEL_4:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
LABEL_21:
      v16 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 32)];
      if (a2) {
        v17 = @"sumElevationGainCm";
      }
      else {
        v17 = @"sum_elevation_gain_cm";
      }
      [v4 setObject:v16 forKey:v17];

      if ((*(unsigned char *)(a1 + 40) & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)(a1 + 40) & 1) == 0)
  {
    goto LABEL_4;
  }
  v14 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
  if (a2) {
    v15 = @"expectedDurationSeconds";
  }
  else {
    v15 = @"expected_duration_seconds";
  }
  [v4 setObject:v14 forKey:v15];

  char v5 = *(unsigned char *)(a1 + 40);
  if ((v5 & 4) != 0) {
    goto LABEL_21;
  }
LABEL_5:
  if ((v5 & 8) != 0)
  {
LABEL_6:
    v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 36)];
    if (a2) {
      uint64_t v7 = @"sumElevationLossCm";
    }
    else {
      uint64_t v7 = @"sum_elevation_loss_cm";
    }
    [v4 setObject:v6 forKey:v7];
  }
LABEL_10:
  objc_super v8 = [(id)a1 hikeTypeName];
  uint64_t v9 = v8;
  if (v8)
  {
    if (a2)
    {
      v10 = [v8 jsonRepresentation];
      v11 = @"hikeTypeName";
    }
    else
    {
      v10 = [v8 dictionaryRepresentation];
      v11 = @"hike_type_name";
    }
    [v4 setObject:v10 forKey:v11];
  }
  v18 = *(void **)(a1 + 8);
  if (v18)
  {
    v19 = [v18 dictionaryRepresentation];
    v20 = v19;
    if (a2)
    {
      v21 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v19, "count"));
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __46__GEOPDHikeSummary__dictionaryRepresentation___block_invoke;
      v25[3] = &unk_1E53D8860;
      id v22 = v21;
      id v26 = v22;
      [v20 enumerateKeysAndObjectsUsingBlock:v25];
      id v23 = v22;

      v20 = v23;
    }
    [v4 setObject:v20 forKey:@"Unknown Fields"];
  }
LABEL_32:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDHikeSummary _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOPDHikeSummary__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOPDHikeSummary)initWithDictionary:(id)a3
{
  return (GEOPDHikeSummary *)-[GEOPDHikeSummary _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"lengthMeters";
      }
      else {
        v6 = @"length_meters";
      }
      uint64_t v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLengthMeters:", objc_msgSend(v7, "unsignedIntValue"));
      }

      if (a3) {
        objc_super v8 = @"expectedDurationSeconds";
      }
      else {
        objc_super v8 = @"expected_duration_seconds";
      }
      uint64_t v9 = [v5 objectForKeyedSubscript:v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setExpectedDurationSeconds:", objc_msgSend(v9, "unsignedIntValue"));
      }

      if (a3) {
        id v10 = @"sumElevationGainCm";
      }
      else {
        id v10 = @"sum_elevation_gain_cm";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSumElevationGainCm:", objc_msgSend(v11, "unsignedIntValue"));
      }

      if (a3) {
        id v12 = @"sumElevationLossCm";
      }
      else {
        id v12 = @"sum_elevation_loss_cm";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSumElevationLossCm:", objc_msgSend(v13, "unsignedIntValue"));
      }

      if (a3) {
        v14 = @"hikeTypeName";
      }
      else {
        v14 = @"hike_type_name";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v17 = [(GEOFormattedString *)v16 initWithJSON:v15];
        }
        else {
          uint64_t v17 = [(GEOFormattedString *)v16 initWithDictionary:v15];
        }
        v18 = (void *)v17;
        [a1 setHikeTypeName:v17];
      }
    }
  }

  return a1;
}

- (GEOPDHikeSummary)initWithJSON:(id)a3
{
  return (GEOPDHikeSummary *)-[GEOPDHikeSummary _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDHikeSummaryIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDHikeSummaryReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char flags = (char)self->_flags;
  id v6 = v4;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
LABEL_5:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_6:
  if (self->_hikeTypeName)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v6 = a3;
  [(GEOPDHikeSummary *)self readAll:0];
  id v4 = v6;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 7) = self->_lengthMeters;
    *((unsigned char *)v6 + 40) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v6 + 6) = self->_expectedDurationSeconds;
  *((unsigned char *)v6 + 40) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_13:
  *((_DWORD *)v6 + 8) = self->_sumElevationGainCm;
  *((unsigned char *)v6 + 40) |= 4u;
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
LABEL_5:
    *((_DWORD *)v6 + 9) = self->_sumElevationLossCm;
    *((unsigned char *)v6 + 40) |= 8u;
  }
LABEL_6:
  if (self->_hikeTypeName)
  {
    objc_msgSend(v6, "setHikeTypeName:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_lengthMeters;
    *(unsigned char *)(v5 + 40) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 4) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(_DWORD *)(v5 + 32) = self->_sumElevationGainCm;
      *(unsigned char *)(v5 + 40) |= 4u;
      if ((*(unsigned char *)&self->_flags & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 24) = self->_expectedDurationSeconds;
  *(unsigned char *)(v5 + 40) |= 1u;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((flags & 8) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 36) = self->_sumElevationLossCm;
    *(unsigned char *)(v5 + 40) |= 8u;
  }
LABEL_6:
  id v8 = [(GEOFormattedString *)self->_hikeTypeName copyWithZone:a3];
  uint64_t v9 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v8;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  [(GEOPDHikeSummary *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_lengthMeters != *((_DWORD *)v4 + 7)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
LABEL_24:
    char v6 = 0;
    goto LABEL_25;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_expectedDurationSeconds != *((_DWORD *)v4 + 6)) {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_sumElevationGainCm != *((_DWORD *)v4 + 8)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 8) == 0 || self->_sumElevationLossCm != *((_DWORD *)v4 + 9)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 8) != 0)
  {
    goto LABEL_24;
  }
  hikeTypeName = self->_hikeTypeName;
  if ((unint64_t)hikeTypeName | *((void *)v4 + 2)) {
    char v6 = -[GEOFormattedString isEqual:](hikeTypeName, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_25:

  return v6;
}

- (unint64_t)hash
{
  [(GEOPDHikeSummary *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_lengthMeters;
    if (*(unsigned char *)&self->_flags)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_expectedDurationSeconds;
      if ((*(unsigned char *)&self->_flags & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v5 = 0;
      if ((*(unsigned char *)&self->_flags & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v6 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ [(GEOFormattedString *)self->_hikeTypeName hash];
    }
  }
  else
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_sumElevationGainCm;
  if ((*(unsigned char *)&self->_flags & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v6 = 2654435761 * self->_sumElevationLossCm;
  return v4 ^ v3 ^ v5 ^ v6 ^ [(GEOFormattedString *)self->_hikeTypeName hash];
}

- (void)mergeFrom:(id)a3
{
  id v8 = (unsigned int *)a3;
  [v8 readAll:0];
  uint64_t v4 = v8;
  char v5 = *((unsigned char *)v8 + 40);
  if ((v5 & 2) != 0)
  {
    self->_lengthMeters = v8[7];
    *(unsigned char *)&self->_flags |= 2u;
    char v5 = *((unsigned char *)v8 + 40);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((v8[10] & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_expectedDurationSeconds = v8[6];
  *(unsigned char *)&self->_flags |= 1u;
  char v5 = *((unsigned char *)v8 + 40);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_sumElevationGainCm = v8[8];
  *(unsigned char *)&self->_flags |= 4u;
  if ((v8[10] & 8) != 0)
  {
LABEL_5:
    self->_sumElevationLossCm = v8[9];
    *(unsigned char *)&self->_flags |= 8u;
  }
LABEL_6:
  hikeTypeName = self->_hikeTypeName;
  uint64_t v7 = *((void *)v8 + 2);
  if (hikeTypeName)
  {
    if (!v7) {
      goto LABEL_16;
    }
    -[GEOFormattedString mergeFrom:](hikeTypeName, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_16;
    }
    -[GEOPDHikeSummary setHikeTypeName:](self, "setHikeTypeName:");
  }
  uint64_t v4 = v8;
LABEL_16:
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
    [(GEOPDHikeSummary *)self readAll:0];
    hikeTypeName = self->_hikeTypeName;
    [(GEOFormattedString *)hikeTypeName clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hikeTypeName, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end