@interface GEORPPoiActivityFeedback
+ (BOOL)isValid:(id)a3;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIsDataCorrect;
- (BOOL)hasIsDataUseful;
- (BOOL)hasIsVisualRepresentationValid;
- (BOOL)hasMapsId;
- (BOOL)isDataCorrect;
- (BOOL)isDataUseful;
- (BOOL)isEqual:(id)a3;
- (BOOL)isVisualRepresentationValid;
- (BOOL)readFrom:(id)a3;
- (GEOPDMapsIdentifier)mapsId;
- (GEORPPoiActivityFeedback)init;
- (GEORPPoiActivityFeedback)initWithData:(id)a3;
- (GEORPPoiActivityFeedback)initWithDictionary:(id)a3;
- (GEORPPoiActivityFeedback)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unint64_t)representativeHoursCount;
- (unsigned)representativeHours;
- (unsigned)representativeHoursAtIndex:(unint64_t)a3;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readMapsId;
- (void)_readRepresentativeHours;
- (void)addRepresentativeHours:(unsigned int)a3;
- (void)clearRepresentativeHours;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasIsDataCorrect:(BOOL)a3;
- (void)setHasIsDataUseful:(BOOL)a3;
- (void)setHasIsVisualRepresentationValid:(BOOL)a3;
- (void)setIsDataCorrect:(BOOL)a3;
- (void)setIsDataUseful:(BOOL)a3;
- (void)setIsVisualRepresentationValid:(BOOL)a3;
- (void)setMapsId:(id)a3;
- (void)setRepresentativeHours:(unsigned int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation GEORPPoiActivityFeedback

- (GEORPPoiActivityFeedback)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPPoiActivityFeedback;
  v2 = [(GEORPPoiActivityFeedback *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPPoiActivityFeedback)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPPoiActivityFeedback;
  v3 = [(GEORPPoiActivityFeedback *)&v7 initWithData:a3];
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
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEORPPoiActivityFeedback;
  [(GEORPPoiActivityFeedback *)&v3 dealloc];
}

- (void)_readMapsId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiActivityFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapsId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasMapsId
{
  return self->_mapsId != 0;
}

- (GEOPDMapsIdentifier)mapsId
{
  -[GEORPPoiActivityFeedback _readMapsId]((uint64_t)self);
  mapsId = self->_mapsId;

  return mapsId;
}

- (void)setMapsId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_mapsId, a3);
}

- (void)_readRepresentativeHours
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiActivityFeedbackReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRepresentativeHours_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (unint64_t)representativeHoursCount
{
  return self->_representativeHours.count;
}

- (unsigned)representativeHours
{
  return self->_representativeHours.list;
}

- (void)clearRepresentativeHours
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;

  PBRepeatedUInt32Clear();
}

- (void)addRepresentativeHours:(unsigned int)a3
{
  if (self) {
    PBRepeatedUInt32Add();
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;
}

- (unsigned)representativeHoursAtIndex:(unint64_t)a3
{
  -[GEORPPoiActivityFeedback _readRepresentativeHours]((uint64_t)self);
  p_representativeHours = &self->_representativeHours;
  unint64_t count = self->_representativeHours.count;
  if (count <= a3)
  {
    objc_super v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a3, count);
    v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];
    [v10 raise];
  }
  return p_representativeHours->list[a3];
}

- (void)setRepresentativeHours:(unsigned int *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x40u;

  MEMORY[0x1F4147400](&self->_representativeHours, a3, a4);
}

- (BOOL)isDataUseful
{
  return self->_isDataUseful;
}

- (void)setIsDataUseful:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x42u;
  self->_isDataUseful = a3;
}

- (void)setHasIsDataUseful:(BOOL)a3
{
  if (a3) {
    char v3 = 66;
  }
  else {
    char v3 = 64;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIsDataUseful
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (BOOL)isDataCorrect
{
  return self->_isDataCorrect;
}

- (void)setIsDataCorrect:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x41u;
  self->_isDataCorrect = a3;
}

- (void)setHasIsDataCorrect:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasIsDataCorrect
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)isVisualRepresentationValid
{
  return self->_isVisualRepresentationValid;
}

- (void)setIsVisualRepresentationValid:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x44u;
  self->_isVisualRepresentationValid = a3;
}

- (void)setHasIsVisualRepresentationValid:(BOOL)a3
{
  if (a3) {
    char v3 = 68;
  }
  else {
    char v3 = 64;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasIsVisualRepresentationValid
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPPoiActivityFeedback;
  v4 = [(GEORPPoiActivityFeedback *)&v8 description];
  v5 = [(GEORPPoiActivityFeedback *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPPoiActivityFeedback _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_23;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = [(id)a1 mapsId];
  objc_super v6 = v5;
  if (v5)
  {
    if (a2)
    {
      objc_super v7 = [v5 jsonRepresentation];
      objc_super v8 = @"mapsId";
    }
    else
    {
      objc_super v7 = [v5 dictionaryRepresentation];
      objc_super v8 = @"maps_id";
    }
    [v4 setObject:v7 forKey:v8];
  }
  if (*(void *)(a1 + 32))
  {
    v9 = PBRepeatedUInt32NSArray();
    if (a2) {
      v10 = @"representativeHours";
    }
    else {
      v10 = @"representative_hours";
    }
    [v4 setObject:v9 forKey:v10];
  }
  char v11 = *(unsigned char *)(a1 + 72);
  if ((v11 & 2) != 0)
  {
    v21 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 69)];
    if (a2) {
      v22 = @"isDataUseful";
    }
    else {
      v22 = @"is_data_useful";
    }
    [v4 setObject:v21 forKey:v22];

    char v11 = *(unsigned char *)(a1 + 72);
    if ((v11 & 1) == 0)
    {
LABEL_14:
      if ((v11 & 4) == 0) {
        goto LABEL_19;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)(a1 + 72) & 1) == 0)
  {
    goto LABEL_14;
  }
  v23 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 68)];
  if (a2) {
    v24 = @"isDataCorrect";
  }
  else {
    v24 = @"is_data_correct";
  }
  [v4 setObject:v23 forKey:v24];

  if ((*(unsigned char *)(a1 + 72) & 4) != 0)
  {
LABEL_15:
    v12 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 70)];
    if (a2) {
      v13 = @"isVisualRepresentationValid";
    }
    else {
      v13 = @"is_visual_representation_valid";
    }
    [v4 setObject:v12 forKey:v13];
  }
LABEL_19:
  v14 = *(void **)(a1 + 16);
  if (v14)
  {
    v15 = [v14 dictionaryRepresentation];
    v16 = v15;
    if (a2)
    {
      v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __54__GEORPPoiActivityFeedback__dictionaryRepresentation___block_invoke;
      v25[3] = &unk_1E53D8860;
      id v18 = v17;
      id v26 = v18;
      [v16 enumerateKeysAndObjectsUsingBlock:v25];
      id v19 = v18;

      v16 = v19;
    }
    [v4 setObject:v16 forKey:@"Unknown Fields"];
  }
LABEL_23:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPPoiActivityFeedback _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __54__GEORPPoiActivityFeedback__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
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

- (GEORPPoiActivityFeedback)initWithDictionary:(id)a3
{
  return (GEORPPoiActivityFeedback *)-[GEORPPoiActivityFeedback _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"mapsId";
      }
      else {
        objc_super v6 = @"maps_id";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOPDMapsIdentifier alloc];
        if (a3) {
          uint64_t v9 = [(GEOPDMapsIdentifier *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOPDMapsIdentifier *)v8 initWithDictionary:v7];
        }
        id v10 = (void *)v9;
        [a1 setMapsId:v9];
      }
      if (a3) {
        char v11 = @"representativeHours";
      }
      else {
        char v11 = @"representative_hours";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v27;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v27 != v16) {
                objc_enumerationMutation(v13);
              }
              id v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(a1, "addRepresentativeHours:", objc_msgSend(v18, "unsignedIntValue", (void)v26));
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
          }
          while (v15);
        }
      }
      if (a3) {
        id v19 = @"isDataUseful";
      }
      else {
        id v19 = @"is_data_useful";
      }
      v20 = objc_msgSend(v5, "objectForKeyedSubscript:", v19, (void)v26);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsDataUseful:", objc_msgSend(v20, "BOOLValue"));
      }

      if (a3) {
        v21 = @"isDataCorrect";
      }
      else {
        v21 = @"is_data_correct";
      }
      v22 = [v5 objectForKeyedSubscript:v21];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsDataCorrect:", objc_msgSend(v22, "BOOLValue"));
      }

      if (a3) {
        v23 = @"isVisualRepresentationValid";
      }
      else {
        v23 = @"is_visual_representation_valid";
      }
      v24 = [v5 objectForKeyedSubscript:v23];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setIsVisualRepresentationValid:", objc_msgSend(v24, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEORPPoiActivityFeedback)initWithJSON:(id)a3
{
  return (GEORPPoiActivityFeedback *)-[GEORPPoiActivityFeedback _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_2933;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_2934;
    }
    GEORPPoiActivityFeedbackReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOPDMapsIdentifier *)self->_mapsId readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPPoiActivityFeedbackIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPPoiActivityFeedbackReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader || (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x70) != 0))
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPPoiActivityFeedback *)self readAll:0];
    if (self->_mapsId) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v10;
    if (self->_representativeHours.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        id v5 = v10;
        ++v6;
      }
      while (v6 < self->_representativeHours.count);
    }
    char flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteBOOLField();
      id v5 = v10;
      char flags = (char)self->_flags;
      if ((flags & 1) == 0)
      {
LABEL_10:
        if ((flags & 4) == 0)
        {
LABEL_12:
          [(PBUnknownFields *)self->_unknownFields writeTo:v5];
          goto LABEL_17;
        }
LABEL_11:
        PBDataWriterWriteBOOLField();
        id v5 = v10;
        goto LABEL_12;
      }
    }
    else if ((*(unsigned char *)&self->_flags & 1) == 0)
    {
      goto LABEL_10;
    }
    PBDataWriterWriteBOOLField();
    id v5 = v10;
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  objc_super v8 = self->_reader;
  objc_sync_enter(v8);
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  uint64_t v9 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
  [v10 writeData:v9];
  os_unfair_lock_unlock(p_readerLock);

  objc_sync_exit(v8);
LABEL_17:
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORPPoiActivityFeedback _readMapsId]((uint64_t)self);
  mapsId = self->_mapsId;

  return [(GEOPDMapsIdentifier *)mapsId hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  objc_super v8 = (id *)a3;
  [(GEORPPoiActivityFeedback *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 14) = self->_readerMarkPos;
  *((_DWORD *)v8 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_mapsId) {
    objc_msgSend(v8, "setMapsId:");
  }
  if ([(GEORPPoiActivityFeedback *)self representativeHoursCount])
  {
    [v8 clearRepresentativeHours];
    unint64_t v4 = [(GEORPPoiActivityFeedback *)self representativeHoursCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v8, "addRepresentativeHours:", -[GEORPPoiActivityFeedback representativeHoursAtIndex:](self, "representativeHoursAtIndex:", i));
    }
  }
  char flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((unsigned char *)v8 + 69) = self->_isDataUseful;
    *((unsigned char *)v8 + 72) |= 2u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_9:
      if ((flags & 4) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_9;
  }
  *((unsigned char *)v8 + 68) = self->_isDataCorrect;
  *((unsigned char *)v8 + 72) |= 1u;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
LABEL_10:
    *((unsigned char *)v8 + 70) = self->_isVisualRepresentationValid;
    *((unsigned char *)v8 + 72) |= 4u;
  }
LABEL_11:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPPoiActivityFeedback *)self readAll:0];
    id v9 = [(GEOPDMapsIdentifier *)self->_mapsId copyWithZone:a3];
    id v10 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v9;

    PBRepeatedUInt32Copy();
    char flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      *(unsigned char *)(v5 + 69) = self->_isDataUseful;
      *(unsigned char *)(v5 + 72) |= 2u;
      char flags = (char)self->_flags;
      if ((flags & 1) == 0)
      {
LABEL_7:
        if ((flags & 4) == 0)
        {
LABEL_9:
          v12 = self->_unknownFields;
          id v8 = *(id *)(v5 + 16);
          *(void *)(v5 + 16) = v12;
          goto LABEL_10;
        }
LABEL_8:
        *(unsigned char *)(v5 + 70) = self->_isVisualRepresentationValid;
        *(unsigned char *)(v5 + 72) |= 4u;
        goto LABEL_9;
      }
    }
    else if ((*(unsigned char *)&self->_flags & 1) == 0)
    {
      goto LABEL_7;
    }
    *(unsigned char *)(v5 + 68) = self->_isDataCorrect;
    *(unsigned char *)(v5 + 72) |= 1u;
    if ((*(unsigned char *)&self->_flags & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPPoiActivityFeedbackReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_10:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  [(GEORPPoiActivityFeedback *)self readAll:1];
  [v4 readAll:1];
  mapsId = self->_mapsId;
  if ((unint64_t)mapsId | *((void *)v4 + 6))
  {
    if (!-[GEOPDMapsIdentifier isEqual:](mapsId, "isEqual:")) {
      goto LABEL_23;
    }
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_23;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 2) == 0) {
      goto LABEL_23;
    }
    if (self->_isDataUseful)
    {
      if (!*((unsigned char *)v4 + 69)) {
        goto LABEL_23;
      }
    }
    else if (*((unsigned char *)v4 + 69))
    {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 2) != 0)
  {
    goto LABEL_23;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0) {
      goto LABEL_23;
    }
    if (self->_isDataCorrect)
    {
      if (!*((unsigned char *)v4 + 68)) {
        goto LABEL_23;
      }
    }
    else if (*((unsigned char *)v4 + 68))
    {
      goto LABEL_23;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
    goto LABEL_23;
  }
  BOOL v6 = (*((unsigned char *)v4 + 72) & 4) == 0;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 4) != 0)
    {
      if (self->_isVisualRepresentationValid)
      {
        if (!*((unsigned char *)v4 + 70)) {
          goto LABEL_23;
        }
      }
      else if (*((unsigned char *)v4 + 70))
      {
        goto LABEL_23;
      }
      BOOL v6 = 1;
      goto LABEL_24;
    }
LABEL_23:
    BOOL v6 = 0;
  }
LABEL_24:

  return v6;
}

- (unint64_t)hash
{
  [(GEORPPoiActivityFeedback *)self readAll:1];
  unint64_t v3 = [(GEOPDMapsIdentifier *)self->_mapsId hash];
  uint64_t v4 = PBRepeatedUInt32Hash();
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    uint64_t v5 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  uint64_t v5 = 2654435761 * self->_isDataUseful;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_isDataCorrect;
  if ((*(unsigned char *)&self->_flags & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v7 = 2654435761 * self->_isVisualRepresentationValid;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v10 = (BOOL *)a3;
  [v10 readAll:0];
  mapsId = self->_mapsId;
  uint64_t v5 = *((void *)v10 + 6);
  if (mapsId)
  {
    if (v5) {
      -[GEOPDMapsIdentifier mergeFrom:](mapsId, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEORPPoiActivityFeedback setMapsId:](self, "setMapsId:");
  }
  uint64_t v6 = [v10 representativeHoursCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[GEORPPoiActivityFeedback addRepresentativeHours:](self, "addRepresentativeHours:", [v10 representativeHoursAtIndex:i]);
  }
  BOOL v9 = v10[72];
  if ((v9 & 2) != 0)
  {
    self->_isDataUseful = v10[69];
    *(unsigned char *)&self->_flags |= 2u;
    BOOL v9 = v10[72];
    if (!v9)
    {
LABEL_11:
      if ((v9 & 4) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if (!v10[72])
  {
    goto LABEL_11;
  }
  self->_isDataCorrect = v10[68];
  *(unsigned char *)&self->_flags |= 1u;
  if ((v10[72] & 4) != 0)
  {
LABEL_12:
    self->_isVisualRepresentationValid = v10[70];
    *(unsigned char *)&self->_flags |= 4u;
  }
LABEL_13:
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 8) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEORPPoiActivityFeedbackReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2938);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x48u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORPPoiActivityFeedback *)self readAll:0];
    mapsId = self->_mapsId;
    [(GEOPDMapsIdentifier *)mapsId clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end