@interface GEOTFRoadSpeed
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTFRoadSpeed)init;
- (GEOTFRoadSpeed)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_addNoFlagsPredictedSpeed:(uint64_t)a1;
- (void)addPredictedSpeed:(uint64_t)a1;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOTFRoadSpeed

- (void)writeTo:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x3F80) == 0)
    {
      v16 = self->_reader;
      objc_sync_enter(v16);
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      v17 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
      [v4 writeData:v17];
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v16);
      goto LABEL_43;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOTFRoadSpeed readAll:]((uint64_t)self, 0);
  PBDataWriterWriteSint64Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
    if ((flags & 8) == 0) {
      goto LABEL_5;
    }
LABEL_40:
    PBDataWriterWriteFloatField();
    if ((*(_WORD *)&self->_flags & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  PBDataWriterWriteFloatField();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) != 0) {
    goto LABEL_40;
  }
LABEL_5:
  if ((flags & 0x40) != 0) {
LABEL_6:
  }
    PBDataWriterWriteBOOLField();
LABEL_7:
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v7 = self->_predictedSpeeds;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  __int16 v11 = (__int16)self->_flags;
  if (v11)
  {
    PBDataWriterWriteInt32Field();
    __int16 v11 = (__int16)self->_flags;
  }
  if ((v11 & 0x10) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_zilch) {
    PBDataWriterWriteDataField();
  }
  __int16 v12 = (__int16)self->_flags;
  if ((v12 & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v12 = (__int16)self->_flags;
  }
  if ((v12 & 2) != 0) {
    PBDataWriterWriteFloatField();
  }
  if (self->_latitudeCoordinates.count)
  {
    PBDataWriterPlaceMark();
    if (self->_latitudeCoordinates.count)
    {
      unint64_t v13 = 0;
      do
      {
        PBDataWriterWriteFloatField();
        ++v13;
      }
      while (v13 < self->_latitudeCoordinates.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_longitudeCoordinates.count)
  {
    PBDataWriterPlaceMark();
    if (self->_longitudeCoordinates.count)
    {
      unint64_t v14 = 0;
      do
      {
        PBDataWriterWriteFloatField();
        ++v14;
      }
      while (v14 < self->_longitudeCoordinates.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_geoIds.count)
  {
    unint64_t v15 = 0;
    do
    {
      PBDataWriterWriteSint64Field();
      ++v15;
    }
    while (v15 < self->_geoIds.count);
  }
  if (self->_openlr) {
    PBDataWriterWriteDataField();
  }
LABEL_43:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x2000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOTFRoadSpeedReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_25;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOTFRoadSpeed readAll:]((uint64_t)self, 0);
  *(void *)(v5 + 88) = self->_geoid;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
    if ((flags & 8) == 0) {
      goto LABEL_7;
    }
LABEL_27:
    *(float *)(v5 + 144) = self->_endOffset;
    *(_WORD *)(v5 + 160) |= 8u;
    if ((*(_WORD *)&self->_flags & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  *(float *)(v5 + 152) = self->_startOffset;
  *(_WORD *)(v5 + 160) |= 0x20u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) != 0) {
    goto LABEL_27;
  }
LABEL_7:
  if ((flags & 0x40) != 0)
  {
LABEL_8:
    *(unsigned char *)(v5 + 156) = self->_hidden;
    *(_WORD *)(v5 + 160) |= 0x40u;
  }
LABEL_9:
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v10 = self->_predictedSpeeds;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v10);
        }
        unint64_t v14 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "copyWithZone:", a3, (void)v21);
        -[GEOTFRoadSpeed addPredictedSpeed:](v5, v14);
      }
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }

  __int16 v15 = (__int16)self->_flags;
  if (v15)
  {
    *(_DWORD *)(v5 + 132) = self->_color;
    *(_WORD *)(v5 + 160) |= 1u;
    __int16 v15 = (__int16)self->_flags;
  }
  if ((v15 & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 148) = self->_speedKph;
    *(_WORD *)(v5 + 160) |= 0x10u;
  }
  uint64_t v16 = -[NSData copyWithZone:](self->_zilch, "copyWithZone:", a3, (void)v21);
  v17 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v16;

  __int16 v18 = (__int16)self->_flags;
  if ((v18 & 4) != 0)
  {
    *(_DWORD *)(v5 + 140) = self->_decayTimeWindowInMinutes;
    *(_WORD *)(v5 + 160) |= 4u;
    __int16 v18 = (__int16)self->_flags;
  }
  if ((v18 & 2) != 0)
  {
    *(float *)(v5 + 136) = self->_confidence;
    *(_WORD *)(v5 + 160) |= 2u;
  }
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  PBRepeatedInt64Copy();
  uint64_t v19 = [(NSData *)self->_openlr copyWithZone:a3];
  id v8 = *(id *)(v5 + 96);
  *(void *)(v5 + 96) = v19;
LABEL_25:

  return (id)v5;
}

- (BOOL)readFrom:(id)a3
{
  return GEOTFRoadSpeedReadAllFrom((uint64_t)self, a3, 0);
}

- (unint64_t)hash
{
  -[GEOTFRoadSpeed readAll:]((uint64_t)self, 1);
  int64_t geoid = self->_geoid;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x20) != 0)
  {
    float startOffset = self->_startOffset;
    double v6 = startOffset;
    if (startOffset < 0.0) {
      double v6 = -startOffset;
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
  if ((flags & 8) != 0)
  {
    float endOffset = self->_endOffset;
    double v11 = endOffset;
    if (endOffset < 0.0) {
      double v11 = -endOffset;
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
  if ((flags & 0x40) != 0) {
    uint64_t v14 = 2654435761 * self->_hidden;
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t v15 = [(NSMutableArray *)self->_predictedSpeeds hash];
  __int16 v16 = (__int16)self->_flags;
  if (v16)
  {
    uint64_t v17 = 2654435761 * self->_color;
    if ((v16 & 0x10) != 0) {
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v17 = 0;
    if ((v16 & 0x10) != 0)
    {
LABEL_22:
      uint64_t v18 = 2654435761 * self->_speedKph;
      goto LABEL_25;
    }
  }
  uint64_t v18 = 0;
LABEL_25:
  uint64_t v19 = [(NSData *)self->_zilch hash];
  __int16 v20 = (__int16)self->_flags;
  if ((v20 & 4) != 0)
  {
    uint64_t v21 = 2654435761 * self->_decayTimeWindowInMinutes;
    if ((v20 & 2) != 0) {
      goto LABEL_27;
    }
LABEL_32:
    unint64_t v26 = 0;
    goto LABEL_35;
  }
  uint64_t v21 = 0;
  if ((v20 & 2) == 0) {
    goto LABEL_32;
  }
LABEL_27:
  float confidence = self->_confidence;
  double v23 = confidence;
  if (confidence < 0.0) {
    double v23 = -confidence;
  }
  long double v24 = floor(v23 + 0.5);
  double v25 = (v23 - v24) * 1.84467441e19;
  unint64_t v26 = 2654435761u * (unint64_t)fmod(v24, 1.84467441e19);
  if (v25 >= 0.0)
  {
    if (v25 > 0.0) {
      v26 += (unint64_t)v25;
    }
  }
  else
  {
    v26 -= (unint64_t)fabs(v25);
  }
LABEL_35:
  uint64_t v27 = v26 ^ PBRepeatedFloatHash();
  uint64_t v28 = v27 ^ PBRepeatedFloatHash();
  uint64_t v29 = v28 ^ PBRepeatedInt64Hash();
  return v4 ^ v9 ^ v14 ^ v15 ^ v17 ^ v18 ^ v19 ^ v21 ^ (2654435761 * geoid) ^ v29 ^ [(NSData *)self->_openlr hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zilch, 0);
  objc_storeStrong((id *)&self->_predictedSpeeds, 0);
  objc_storeStrong((id *)&self->_openlr, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOTFRoadSpeed)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTFRoadSpeed;
  v2 = [(GEOTFRoadSpeed *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    unint64_t v4 = v2;
  }

  return v3;
}

- (GEOTFRoadSpeed)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTFRoadSpeed;
  v3 = [(GEOTFRoadSpeed *)&v7 initWithData:a3];
  unint64_t v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOTFRoadSpeed;
  [(GEOTFRoadSpeed *)&v3 dealloc];
}

- (void)addPredictedSpeed:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 160) & 0x800) == 0)
    {
      unint64_t v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOTFRoadSpeedReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPredictedSpeeds_tags_310);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
    -[GEOTFRoadSpeed _addNoFlagsPredictedSpeed:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 160) |= 0x800u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
    *(_WORD *)(a1 + 160) |= 0x2000u;
  }
}

- (void)_addNoFlagsPredictedSpeed:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    unint64_t v4 = *(void **)(a1 + 104);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 104);
      *(void *)(a1 + 104) = v5;

      unint64_t v4 = *(void **)(a1 + 104);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTFRoadSpeed;
  unint64_t v4 = [(GEOTFRoadSpeed *)&v8 description];
  id v5 = [(GEOTFRoadSpeed *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTFRoadSpeed _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOTFRoadSpeed readAll:](a1, 1);
    unint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [NSNumber numberWithLongLong:*(void *)(a1 + 88)];
    [v4 setObject:v5 forKey:@"geoid"];

    __int16 v7 = *(_WORD *)(a1 + 160);
    if ((v7 & 0x20) != 0)
    {
      LODWORD(v6) = *(_DWORD *)(a1 + 152);
      objc_super v8 = [NSNumber numberWithFloat:v6];
      if (a2) {
        unint64_t v9 = @"startOffset";
      }
      else {
        unint64_t v9 = @"start_offset";
      }
      [v4 setObject:v8 forKey:v9];

      __int16 v7 = *(_WORD *)(a1 + 160);
    }
    if ((v7 & 8) != 0)
    {
      LODWORD(v6) = *(_DWORD *)(a1 + 144);
      v10 = [NSNumber numberWithFloat:v6];
      if (a2) {
        double v11 = @"endOffset";
      }
      else {
        double v11 = @"end_offset";
      }
      [v4 setObject:v10 forKey:v11];

      __int16 v7 = *(_WORD *)(a1 + 160);
    }
    if ((v7 & 0x40) != 0)
    {
      long double v12 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 156)];
      [v4 setObject:v12 forKey:@"hidden"];
    }
    if ([*(id *)(a1 + 104) count])
    {
      double v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 104), "count"));
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v14 = *(id *)(a1 + 104);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v48 objects:v52 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v49;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v49 != v16) {
              objc_enumerationMutation(v14);
            }
            uint64_t v18 = *(void **)(*((void *)&v48 + 1) + 8 * i);
            if (a2) {
              [v18 jsonRepresentation];
            }
            else {
            uint64_t v19 = [v18 dictionaryRepresentation];
            }
            [v13 addObject:v19];
          }
          uint64_t v15 = [v14 countByEnumeratingWithState:&v48 objects:v52 count:16];
        }
        while (v15);
      }

      if (a2) {
        __int16 v20 = @"predictedSpeed";
      }
      else {
        __int16 v20 = @"predicted_speed";
      }
      [v4 setObject:v13 forKey:v20];
    }
    __int16 v21 = *(_WORD *)(a1 + 160);
    if (v21)
    {
      uint64_t v22 = *(int *)(a1 + 132);
      if (v22 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 132));
        double v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        double v23 = off_1E53DA478[v22];
      }
      [v4 setObject:v23 forKey:@"color"];

      __int16 v21 = *(_WORD *)(a1 + 160);
    }
    if ((v21 & 0x10) != 0)
    {
      long double v24 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 148)];
      if (a2) {
        double v25 = @"speedKph";
      }
      else {
        double v25 = @"speed_kph";
      }
      [v4 setObject:v24 forKey:v25];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 160) & 0x1000) == 0)
    {
      unint64_t v26 = *(void **)(a1 + 8);
      if (v26)
      {
        id v27 = v26;
        objc_sync_enter(v27);
        GEOTFRoadSpeedReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readZilch_tags_312);
        objc_sync_exit(v27);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
    id v28 = *(id *)(a1 + 112);
    uint64_t v29 = v28;
    if (v28)
    {
      if (a2)
      {
        v30 = [v28 base64EncodedStringWithOptions:0];
        [v4 setObject:v30 forKey:@"zilch"];
      }
      else
      {
        [v4 setObject:v28 forKey:@"zilch"];
      }
    }

    __int16 v32 = *(_WORD *)(a1 + 160);
    if ((v32 & 4) != 0)
    {
      v33 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 140)];
      if (a2) {
        v34 = @"decayTimeWindowInMinutes";
      }
      else {
        v34 = @"decay_time_window_in_minutes";
      }
      [v4 setObject:v33 forKey:v34];

      __int16 v32 = *(_WORD *)(a1 + 160);
    }
    if ((v32 & 2) != 0)
    {
      LODWORD(v31) = *(_DWORD *)(a1 + 136);
      v35 = [NSNumber numberWithFloat:v31];
      [v4 setObject:v35 forKey:@"confidence"];
    }
    if (*(void *)(a1 + 48))
    {
      v36 = PBRepeatedFloatNSArray();
      if (a2) {
        v37 = @"latitudeCoordinates";
      }
      else {
        v37 = @"latitude_coordinates";
      }
      [v4 setObject:v36 forKey:v37];
    }
    if (*(void *)(a1 + 72))
    {
      v38 = PBRepeatedFloatNSArray();
      if (a2) {
        v39 = @"longitudeCoordinates";
      }
      else {
        v39 = @"longitude_coordinates";
      }
      [v4 setObject:v38 forKey:v39];
    }
    if (*(void *)(a1 + 24))
    {
      v40 = PBRepeatedInt64NSArray();
      if (a2) {
        v41 = @"geoIds";
      }
      else {
        v41 = @"geo_ids";
      }
      [v4 setObject:v40 forKey:v41];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 160) & 0x400) == 0)
    {
      v42 = *(void **)(a1 + 8);
      if (v42)
      {
        id v43 = v42;
        objc_sync_enter(v43);
        GEOTFRoadSpeedReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOpenlr_tags_314);
        objc_sync_exit(v43);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
    id v44 = *(id *)(a1 + 96);
    v45 = v44;
    if (v44)
    {
      if (a2)
      {
        v46 = [v44 base64EncodedStringWithOptions:0];
        [v4 setObject:v46 forKey:@"openlr"];
      }
      else
      {
        [v4 setObject:v44 forKey:@"openlr"];
      }
    }
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTFRoadSpeed _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    unint64_t v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        double v6 = (int *)&readAll__recursiveTag_327;
      }
      else {
        double v6 = (int *)&readAll__nonRecursiveTag_328;
      }
      GEOTFRoadSpeedReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOTFRoadSpeedCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_52;
  }
  -[GEOTFRoadSpeed readAll:]((uint64_t)self, 1);
  -[GEOTFRoadSpeed readAll:]((uint64_t)v4, 1);
  if (self->_geoid != *((void *)v4 + 11)) {
    goto LABEL_52;
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 80);
  if ((flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_startOffset != *((float *)v4 + 38)) {
      goto LABEL_52;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_52;
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_endOffset != *((float *)v4 + 36)) {
      goto LABEL_52;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_52;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0) {
      goto LABEL_52;
    }
    if (self->_hidden)
    {
      if (!*((unsigned char *)v4 + 156)) {
        goto LABEL_52;
      }
    }
    else if (*((unsigned char *)v4 + 156))
    {
      goto LABEL_52;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_52;
  }
  predictedSpeeds = self->_predictedSpeeds;
  if ((unint64_t)predictedSpeeds | *((void *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](predictedSpeeds, "isEqual:")) {
      goto LABEL_52;
    }
    __int16 flags = (__int16)self->_flags;
    __int16 v6 = *((_WORD *)v4 + 80);
  }
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_color != *((_DWORD *)v4 + 33)) {
      goto LABEL_52;
    }
  }
  else if (v6)
  {
    goto LABEL_52;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_speedKph != *((_DWORD *)v4 + 37)) {
      goto LABEL_52;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_52;
  }
  zilch = self->_zilch;
  if ((unint64_t)zilch | *((void *)v4 + 14))
  {
    if (-[NSData isEqual:](zilch, "isEqual:"))
    {
      __int16 flags = (__int16)self->_flags;
      __int16 v6 = *((_WORD *)v4 + 80);
      goto LABEL_37;
    }
LABEL_52:
    char v10 = 0;
    goto LABEL_53;
  }
LABEL_37:
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_decayTimeWindowInMinutes != *((_DWORD *)v4 + 35)) {
      goto LABEL_52;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_52;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_confidence != *((float *)v4 + 34)) {
      goto LABEL_52;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_52;
  }
  if (!PBRepeatedFloatIsEqual()
    || !PBRepeatedFloatIsEqual()
    || !PBRepeatedInt64IsEqual())
  {
    goto LABEL_52;
  }
  openlr = self->_openlr;
  if ((unint64_t)openlr | *((void *)v4 + 12)) {
    char v10 = -[NSData isEqual:](openlr, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_53:

  return v10;
}

@end