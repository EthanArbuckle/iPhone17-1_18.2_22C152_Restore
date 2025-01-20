@interface GEOTFCompactRoadSpeeds
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTFCompactRoadSpeeds)init;
- (GEOTFCompactRoadSpeeds)initWithData:(id)a3;
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

@implementation GEOTFCompactRoadSpeeds

- (GEOTFCompactRoadSpeeds)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTFCompactRoadSpeeds;
  v2 = [(GEOTFCompactRoadSpeeds *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTFCompactRoadSpeeds)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTFCompactRoadSpeeds;
  v3 = [(GEOTFCompactRoadSpeeds *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOTFCompactRoadSpeeds;
  [(GEOTFCompactRoadSpeeds *)&v3 dealloc];
}

- (void)addPredictedSpeed:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 96) & 0x200) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOTFCompactRoadSpeedsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPredictedSpeeds_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    -[GEOTFCompactRoadSpeeds _addNoFlagsPredictedSpeed:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 96) |= 0x200u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(_WORD *)(a1 + 96) |= 0x400u;
  }
}

- (void)_addNoFlagsPredictedSpeed:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTFCompactRoadSpeeds;
  v4 = [(GEOTFCompactRoadSpeeds *)&v8 description];
  id v5 = [(GEOTFCompactRoadSpeeds *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTFCompactRoadSpeeds _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOTFCompactRoadSpeeds readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 24))
    {
      objc_super v6 = PBRepeatedInt64NSArray();
      if (a2) {
        id v7 = @"geoIds";
      }
      else {
        id v7 = @"geo_ids";
      }
      [v4 setObject:v6 forKey:v7];
    }
    __int16 v8 = *(_WORD *)(a1 + 96);
    if ((v8 & 0x20) != 0)
    {
      LODWORD(v5) = *(_DWORD *)(a1 + 88);
      v9 = [NSNumber numberWithFloat:v5];
      if (a2) {
        v10 = @"startOffset";
      }
      else {
        v10 = @"start_offset";
      }
      [v4 setObject:v9 forKey:v10];

      __int16 v8 = *(_WORD *)(a1 + 96);
    }
    if ((v8 & 8) != 0)
    {
      LODWORD(v5) = *(_DWORD *)(a1 + 80);
      v11 = [NSNumber numberWithFloat:v5];
      if (a2) {
        v12 = @"endOffset";
      }
      else {
        v12 = @"end_offset";
      }
      [v4 setObject:v11 forKey:v12];

      __int16 v8 = *(_WORD *)(a1 + 96);
    }
    if ((v8 & 0x40) != 0)
    {
      v13 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 92)];
      [v4 setObject:v13 forKey:@"hidden"];
    }
    if ([*(id *)(a1 + 48) count])
    {
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v16 = *(id *)(a1 + 48);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v38 != v18) {
              objc_enumerationMutation(v16);
            }
            v20 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            if (a2) {
              [v20 jsonRepresentation];
            }
            else {
            v21 = [v20 dictionaryRepresentation];
            }
            [v15 addObject:v21];
          }
          uint64_t v17 = [v16 countByEnumeratingWithState:&v37 objects:v41 count:16];
        }
        while (v17);
      }

      if (a2) {
        v22 = @"predictedSpeed";
      }
      else {
        v22 = @"predicted_speed";
      }
      [v4 setObject:v15 forKey:v22];
    }
    __int16 v23 = *(_WORD *)(a1 + 96);
    if (v23)
    {
      uint64_t v24 = *(int *)(a1 + 68);
      if (v24 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 68));
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v25 = off_1E53DA478[v24];
      }
      [v4 setObject:v25 forKey:@"color"];

      __int16 v23 = *(_WORD *)(a1 + 96);
    }
    if ((v23 & 0x10) != 0)
    {
      v26 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 84)];
      if (a2) {
        v27 = @"speedKph";
      }
      else {
        v27 = @"speed_kph";
      }
      [v4 setObject:v26 forKey:v27];

      __int16 v23 = *(_WORD *)(a1 + 96);
    }
    if ((v23 & 4) != 0)
    {
      v28 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 76)];
      if (a2) {
        v29 = @"decayTimeWindowInMinutes";
      }
      else {
        v29 = @"decay_time_window_in_minutes";
      }
      [v4 setObject:v28 forKey:v29];

      __int16 v23 = *(_WORD *)(a1 + 96);
    }
    if ((v23 & 2) != 0)
    {
      LODWORD(v14) = *(_DWORD *)(a1 + 72);
      v30 = [NSNumber numberWithFloat:v14];
      [v4 setObject:v30 forKey:@"confidence"];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 96) & 0x100) == 0)
    {
      v31 = *(void **)(a1 + 8);
      if (v31)
      {
        id v32 = v31;
        objc_sync_enter(v32);
        GEOTFCompactRoadSpeedsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOpenlr_tags);
        objc_sync_exit(v32);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v33 = *(id *)(a1 + 40);
    v34 = v33;
    if (v33)
    {
      if (a2)
      {
        v35 = [v33 base64EncodedStringWithOptions:0];
        [v4 setObject:v35 forKey:@"openlr"];
      }
      else
      {
        [v4 setObject:v33 forKey:@"openlr"];
      }
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTFCompactRoadSpeeds _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_1;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_1;
      }
      GEOTFCompactRoadSpeedsReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOTFCompactRoadSpeedsCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOTFCompactRoadSpeedsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x780) == 0))
  {
    v13 = self->_reader;
    objc_sync_enter(v13);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    double v14 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v14];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v13);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOTFCompactRoadSpeeds readAll:]((uint64_t)self, 0);
    if (self->_geoIds.count)
    {
      uint64_t v19 = 0;
      PBDataWriterPlaceMark();
      if (self->_geoIds.count)
      {
        unint64_t v6 = 0;
        do
        {
          PBDataWriterWriteSint64Field();
          ++v6;
        }
        while (v6 < self->_geoIds.count);
      }
      PBDataWriterRecallMark();
    }
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x20) != 0)
    {
      PBDataWriterWriteFloatField();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 8) != 0)
    {
      PBDataWriterWriteFloatField();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 0x40) != 0) {
      PBDataWriterWriteBOOLField();
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    __int16 v8 = self->_predictedSpeeds;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v8);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v9);
    }

    __int16 v12 = (__int16)self->_flags;
    if (v12)
    {
      PBDataWriterWriteInt32Field();
      __int16 v12 = (__int16)self->_flags;
    }
    if ((v12 & 0x10) != 0)
    {
      PBDataWriterWriteUint32Field();
      __int16 v12 = (__int16)self->_flags;
    }
    if ((v12 & 4) != 0)
    {
      PBDataWriterWriteUint32Field();
      __int16 v12 = (__int16)self->_flags;
    }
    if ((v12 & 2) != 0) {
      PBDataWriterWriteFloatField();
    }
    if (self->_openlr) {
      PBDataWriterWriteDataField();
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOTFCompactRoadSpeeds readAll:]((uint64_t)self, 0);
    PBRepeatedInt64Copy();
    __int16 flags = (__int16)self->_flags;
    if ((flags & 0x20) != 0)
    {
      *(float *)(v5 + 88) = self->_startOffset;
      *(_WORD *)(v5 + 96) |= 0x20u;
      __int16 flags = (__int16)self->_flags;
      if ((flags & 8) == 0)
      {
LABEL_7:
        if ((flags & 0x40) == 0) {
          goto LABEL_9;
        }
        goto LABEL_8;
      }
    }
    else if ((flags & 8) == 0)
    {
      goto LABEL_7;
    }
    *(float *)(v5 + 80) = self->_endOffset;
    *(_WORD *)(v5 + 96) |= 8u;
    if ((*(_WORD *)&self->_flags & 0x40) == 0)
    {
LABEL_9:
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      uint64_t v10 = self->_predictedSpeeds;
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v10);
            }
            double v14 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (void)v18);
            -[GEOTFCompactRoadSpeeds addPredictedSpeed:](v5, v14);
          }
          uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v11);
      }

      __int16 v15 = (__int16)self->_flags;
      if (v15)
      {
        *(_DWORD *)(v5 + 68) = self->_color;
        *(_WORD *)(v5 + 96) |= 1u;
        __int16 v15 = (__int16)self->_flags;
        if ((v15 & 0x10) == 0)
        {
LABEL_18:
          if ((v15 & 4) == 0) {
            goto LABEL_19;
          }
          goto LABEL_28;
        }
      }
      else if ((v15 & 0x10) == 0)
      {
        goto LABEL_18;
      }
      *(_DWORD *)(v5 + 84) = self->_speedKph;
      *(_WORD *)(v5 + 96) |= 0x10u;
      __int16 v15 = (__int16)self->_flags;
      if ((v15 & 4) == 0)
      {
LABEL_19:
        if ((v15 & 2) == 0)
        {
LABEL_21:
          uint64_t v16 = -[NSData copyWithZone:](self->_openlr, "copyWithZone:", a3, (void)v18);
          id v8 = *(id *)(v5 + 40);
          *(void *)(v5 + 40) = v16;
          goto LABEL_22;
        }
LABEL_20:
        *(float *)(v5 + 72) = self->_confidence;
        *(_WORD *)(v5 + 96) |= 2u;
        goto LABEL_21;
      }
LABEL_28:
      *(_DWORD *)(v5 + 76) = self->_decayTimeWindowInMinutes;
      *(_WORD *)(v5 + 96) |= 4u;
      if ((*(_WORD *)&self->_flags & 2) == 0) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
LABEL_8:
    *(unsigned char *)(v5 + 92) = self->_hidden;
    *(_WORD *)(v5 + 96) |= 0x40u;
    goto LABEL_9;
  }
  id v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x400) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOTFCompactRoadSpeedsReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_22:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_46;
  }
  -[GEOTFCompactRoadSpeeds readAll:]((uint64_t)self, 1);
  -[GEOTFCompactRoadSpeeds readAll:]((uint64_t)v4, 1);
  if (!PBRepeatedInt64IsEqual()) {
    goto LABEL_46;
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 48);
  if ((flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_startOffset != *((float *)v4 + 22)) {
      goto LABEL_46;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_46;
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_endOffset != *((float *)v4 + 20)) {
      goto LABEL_46;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_46;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0) {
      goto LABEL_46;
    }
    if (self->_hidden)
    {
      if (!*((unsigned char *)v4 + 92)) {
        goto LABEL_46;
      }
    }
    else if (*((unsigned char *)v4 + 92))
    {
      goto LABEL_46;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_46;
  }
  predictedSpeeds = self->_predictedSpeeds;
  if (!((unint64_t)predictedSpeeds | *((void *)v4 + 6))) {
    goto LABEL_24;
  }
  if (!-[NSMutableArray isEqual:](predictedSpeeds, "isEqual:"))
  {
LABEL_46:
    char v9 = 0;
    goto LABEL_47;
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 48);
LABEL_24:
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_color != *((_DWORD *)v4 + 17)) {
      goto LABEL_46;
    }
  }
  else if (v6)
  {
    goto LABEL_46;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_speedKph != *((_DWORD *)v4 + 21)) {
      goto LABEL_46;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_46;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_decayTimeWindowInMinutes != *((_DWORD *)v4 + 19)) {
      goto LABEL_46;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_46;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_confidence != *((float *)v4 + 18)) {
      goto LABEL_46;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_46;
  }
  openlr = self->_openlr;
  if ((unint64_t)openlr | *((void *)v4 + 5)) {
    char v9 = -[NSData isEqual:](openlr, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_47:

  return v9;
}

- (unint64_t)hash
{
  -[GEOTFCompactRoadSpeeds readAll:]((uint64_t)self, 1);
  uint64_t v3 = PBRepeatedInt64Hash();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0x20) != 0)
  {
    float startOffset = self->_startOffset;
    double v7 = startOffset;
    if (startOffset < 0.0) {
      double v7 = -startOffset;
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
  if ((flags & 8) != 0)
  {
    float endOffset = self->_endOffset;
    double v12 = endOffset;
    if (endOffset < 0.0) {
      double v12 = -endOffset;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  if ((flags & 0x40) != 0) {
    uint64_t v15 = 2654435761 * self->_hidden;
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t v16 = [(NSMutableArray *)self->_predictedSpeeds hash];
  __int16 v17 = (__int16)self->_flags;
  if (v17)
  {
    uint64_t v18 = 2654435761 * self->_color;
    if ((v17 & 0x10) != 0)
    {
LABEL_22:
      uint64_t v19 = 2654435761 * self->_speedKph;
      if ((v17 & 4) != 0) {
        goto LABEL_23;
      }
LABEL_30:
      uint64_t v20 = 0;
      if ((v17 & 2) != 0) {
        goto LABEL_24;
      }
LABEL_31:
      unint64_t v25 = 0;
      return v5 ^ v3 ^ v10 ^ v15 ^ v18 ^ v16 ^ v19 ^ v20 ^ v25 ^ [(NSData *)self->_openlr hash];
    }
  }
  else
  {
    uint64_t v18 = 0;
    if ((v17 & 0x10) != 0) {
      goto LABEL_22;
    }
  }
  uint64_t v19 = 0;
  if ((v17 & 4) == 0) {
    goto LABEL_30;
  }
LABEL_23:
  uint64_t v20 = 2654435761 * self->_decayTimeWindowInMinutes;
  if ((v17 & 2) == 0) {
    goto LABEL_31;
  }
LABEL_24:
  float confidence = self->_confidence;
  double v22 = confidence;
  if (confidence < 0.0) {
    double v22 = -confidence;
  }
  long double v23 = floor(v22 + 0.5);
  double v24 = (v22 - v23) * 1.84467441e19;
  unint64_t v25 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
  if (v24 >= 0.0)
  {
    if (v24 > 0.0) {
      v25 += (unint64_t)v24;
    }
  }
  else
  {
    v25 -= (unint64_t)fabs(v24);
  }
  return v5 ^ v3 ^ v10 ^ v15 ^ v18 ^ v16 ^ v19 ^ v20 ^ v25 ^ [(NSData *)self->_openlr hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictedSpeeds, 0);
  objc_storeStrong((id *)&self->_openlr, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end