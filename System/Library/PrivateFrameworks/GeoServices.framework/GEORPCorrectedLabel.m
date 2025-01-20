@interface GEORPCorrectedLabel
+ (BOOL)isValid:(id)a3;
+ (Class)featureHandleType;
- (BOOL)hasCoordinate;
- (BOOL)hasCorrectedValue;
- (BOOL)hasFeatureRegion;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasLocalizedLabels;
- (BOOL)hasOriginalValue;
- (BOOL)hasUid;
- (BOOL)isEqual:(id)a3;
- (BOOL)localizedLabels;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)coordinate;
- (GEOMapRegion)featureRegion;
- (GEORPCorrectedLabel)init;
- (GEORPCorrectedLabel)initWithData:(id)a3;
- (GEORPCorrectedLabel)initWithDictionary:(id)a3;
- (GEORPCorrectedLabel)initWithJSON:(id)a3;
- (NSMutableArray)featureHandles;
- (NSString)correctedValue;
- (NSString)originalValue;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)featureHandleAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (unint64_t)featureHandlesCount;
- (unint64_t)hash;
- (unint64_t)uid;
- (void)_addNoFlagsFeatureHandle:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readCoordinate;
- (void)_readCorrectedValue;
- (void)_readFeatureHandles;
- (void)_readFeatureRegion;
- (void)_readOriginalValue;
- (void)addFeatureHandle:(id)a3;
- (void)clearFeatureHandles;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCoordinate:(id)a3;
- (void)setCorrectedValue:(id)a3;
- (void)setFeatureHandles:(id)a3;
- (void)setFeatureRegion:(id)a3;
- (void)setHasLocalizedLabels:(BOOL)a3;
- (void)setHasUid:(BOOL)a3;
- (void)setLocalizedLabels:(BOOL)a3;
- (void)setOriginalValue:(id)a3;
- (void)setUid:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPCorrectedLabel

- (GEORPCorrectedLabel)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPCorrectedLabel;
  v2 = [(GEORPCorrectedLabel *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPCorrectedLabel)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPCorrectedLabel;
  v3 = [(GEORPCorrectedLabel *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readOriginalValue
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPCorrectedLabelReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginalValue_tags_396);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasOriginalValue
{
  return self->_originalValue != 0;
}

- (NSString)originalValue
{
  -[GEORPCorrectedLabel _readOriginalValue]((uint64_t)self);
  originalValue = self->_originalValue;

  return originalValue;
}

- (void)setOriginalValue:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_originalValue, a3);
}

- (void)_readCorrectedValue
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPCorrectedLabelReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCorrectedValue_tags_397);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasCorrectedValue
{
  return self->_correctedValue != 0;
}

- (NSString)correctedValue
{
  -[GEORPCorrectedLabel _readCorrectedValue]((uint64_t)self);
  correctedValue = self->_correctedValue;

  return correctedValue;
}

- (void)setCorrectedValue:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_correctedValue, a3);
}

- (void)_readFeatureRegion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPCorrectedLabelReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFeatureRegion_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasFeatureRegion
{
  return self->_featureRegion != 0;
}

- (GEOMapRegion)featureRegion
{
  -[GEORPCorrectedLabel _readFeatureRegion]((uint64_t)self);
  featureRegion = self->_featureRegion;

  return featureRegion;
}

- (void)setFeatureRegion:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_featureRegion, a3);
}

- (void)_readFeatureHandles
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPCorrectedLabelReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFeatureHandles_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)featureHandles
{
  -[GEORPCorrectedLabel _readFeatureHandles]((uint64_t)self);
  featureHandles = self->_featureHandles;

  return featureHandles;
}

- (void)setFeatureHandles:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  featureHandles = self->_featureHandles;
  self->_featureHandles = v4;
}

- (void)clearFeatureHandles
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
  featureHandles = self->_featureHandles;

  [(NSMutableArray *)featureHandles removeAllObjects];
}

- (void)addFeatureHandle:(id)a3
{
  id v4 = a3;
  -[GEORPCorrectedLabel _readFeatureHandles]((uint64_t)self);
  -[GEORPCorrectedLabel _addNoFlagsFeatureHandle:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsFeatureHandle:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      id v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)featureHandlesCount
{
  -[GEORPCorrectedLabel _readFeatureHandles]((uint64_t)self);
  featureHandles = self->_featureHandles;

  return [(NSMutableArray *)featureHandles count];
}

- (id)featureHandleAtIndex:(unint64_t)a3
{
  -[GEORPCorrectedLabel _readFeatureHandles]((uint64_t)self);
  featureHandles = self->_featureHandles;

  return (id)[(NSMutableArray *)featureHandles objectAtIndex:a3];
}

+ (Class)featureHandleType
{
  return (Class)objc_opt_class();
}

- (void)_readCoordinate
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 80) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPCorrectedLabelReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCoordinate_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasCoordinate
{
  return self->_coordinate != 0;
}

- (GEOLatLng)coordinate
{
  -[GEORPCorrectedLabel _readCoordinate]((uint64_t)self);
  coordinate = self->_coordinate;

  return coordinate;
}

- (void)setCoordinate:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x84u;
  objc_storeStrong((id *)&self->_coordinate, a3);
}

- (unint64_t)uid
{
  return self->_uid;
}

- (void)setUid:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 0x81u;
  self->_uid = a3;
}

- (void)setHasUid:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasUid
{
  return *(unsigned char *)&self->_flags & 1;
}

- (BOOL)localizedLabels
{
  return self->_localizedLabels;
}

- (void)setLocalizedLabels:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x82u;
  self->_localizedLabels = a3;
}

- (void)setHasLocalizedLabels:(BOOL)a3
{
  if (a3) {
    char v3 = -126;
  }
  else {
    char v3 = 0x80;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasLocalizedLabels
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPCorrectedLabel;
  id v4 = [(GEORPCorrectedLabel *)&v8 description];
  id v5 = [(GEORPCorrectedLabel *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPCorrectedLabel _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 originalValue];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"originalValue";
      }
      else {
        objc_super v6 = @"original_value";
      }
      [v4 setObject:v5 forKey:v6];
    }

    id v7 = [(id)a1 correctedValue];
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"correctedValue";
      }
      else {
        objc_super v8 = @"corrected_value";
      }
      [v4 setObject:v7 forKey:v8];
    }

    v9 = [(id)a1 featureRegion];
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"featureRegion";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"feature_region";
      }
      [v4 setObject:v11 forKey:v12];
    }
    if ([*(id *)(a1 + 32) count])
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v14 = *(id *)(a1 + 32);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v31 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            if (a2) {
              [v19 jsonRepresentation];
            }
            else {
            v20 = objc_msgSend(v19, "dictionaryRepresentation", (void)v30);
            }
            objc_msgSend(v13, "addObject:", v20, (void)v30);
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v16);
      }

      if (a2) {
        v21 = @"featureHandle";
      }
      else {
        v21 = @"feature_handle";
      }
      objc_msgSend(v4, "setObject:forKey:", v13, v21, (void)v30);
    }
    v22 = [(id)a1 coordinate];
    v23 = v22;
    if (v22)
    {
      if (a2) {
        [v22 jsonRepresentation];
      }
      else {
      v24 = [v22 dictionaryRepresentation];
      }
      [v4 setObject:v24 forKey:@"coordinate"];
    }
    char v25 = *(unsigned char *)(a1 + 80);
    if (v25)
    {
      v26 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
      [v4 setObject:v26 forKey:@"uid"];

      char v25 = *(unsigned char *)(a1 + 80);
    }
    if ((v25 & 2) != 0)
    {
      v27 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 76)];
      if (a2) {
        v28 = @"localizedLabels";
      }
      else {
        v28 = @"localized_labels";
      }
      [v4 setObject:v27 forKey:v28];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPCorrectedLabel _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPCorrectedLabel)initWithDictionary:(id)a3
{
  return (GEORPCorrectedLabel *)-[GEORPCorrectedLabel _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"originalValue";
      }
      else {
        objc_super v6 = @"original_value";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setOriginalValue:v8];
      }
      if (a3) {
        v9 = @"correctedValue";
      }
      else {
        v9 = @"corrected_value";
      }
      v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = (void *)[v10 copy];
        [a1 setCorrectedValue:v11];
      }
      if (a3) {
        v12 = @"featureRegion";
      }
      else {
        v12 = @"feature_region";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = [GEOMapRegion alloc];
        if (a3) {
          uint64_t v15 = [(GEOMapRegion *)v14 initWithJSON:v13];
        }
        else {
          uint64_t v15 = [(GEOMapRegion *)v14 initWithDictionary:v13];
        }
        uint64_t v16 = (void *)v15;
        [a1 setFeatureRegion:v15];
      }
      if (a3) {
        uint64_t v17 = @"featureHandle";
      }
      else {
        uint64_t v17 = @"feature_handle";
      }
      v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v36 = v5;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v19 = v18;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v37 objects:v41 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v38;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v38 != v22) {
                objc_enumerationMutation(v19);
              }
              uint64_t v24 = *(void *)(*((void *)&v37 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                char v25 = [GEORPFeatureHandle alloc];
                if (a3) {
                  uint64_t v26 = [(GEORPFeatureHandle *)v25 initWithJSON:v24];
                }
                else {
                  uint64_t v26 = [(GEORPFeatureHandle *)v25 initWithDictionary:v24];
                }
                v27 = (void *)v26;
                [a1 addFeatureHandle:v26];
              }
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v37 objects:v41 count:16];
          }
          while (v21);
        }

        id v5 = v36;
      }

      v28 = [v5 objectForKeyedSubscript:@"coordinate"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v29 = [GEOLatLng alloc];
        if (a3) {
          uint64_t v30 = [(GEOLatLng *)v29 initWithJSON:v28];
        }
        else {
          uint64_t v30 = [(GEOLatLng *)v29 initWithDictionary:v28];
        }
        long long v31 = (void *)v30;
        [a1 setCoordinate:v30];
      }
      long long v32 = [v5 objectForKeyedSubscript:@"uid"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setUid:", objc_msgSend(v32, "unsignedLongLongValue"));
      }

      if (a3) {
        long long v33 = @"localizedLabels";
      }
      else {
        long long v33 = @"localized_labels";
      }
      v34 = [v5 objectForKeyedSubscript:v33];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setLocalizedLabels:", objc_msgSend(v34, "BOOLValue"));
      }
    }
  }

  return a1;
}

- (GEORPCorrectedLabel)initWithJSON:(id)a3
{
  return (GEORPCorrectedLabel *)-[GEORPCorrectedLabel _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_426;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_427;
    }
    GEORPCorrectedLabelReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPCorrectedLabelCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPCorrectedLabelIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPCorrectedLabelReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(unsigned char *)&self->_flags <= 3u))
  {
    v11 = self->_reader;
    objc_sync_enter(v11);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v12 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v12];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPCorrectedLabel *)self readAll:0];
    if (self->_originalValue) {
      PBDataWriterWriteStringField();
    }
    if (self->_correctedValue) {
      PBDataWriterWriteStringField();
    }
    if (self->_featureRegion) {
      PBDataWriterWriteSubmessage();
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    objc_super v6 = self->_featureHandles;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    if (self->_coordinate) {
      PBDataWriterWriteSubmessage();
    }
    char flags = (char)self->_flags;
    if (flags)
    {
      PBDataWriterWriteUint64Field();
      char flags = (char)self->_flags;
    }
    if ((flags & 2) != 0) {
      PBDataWriterWriteBOOLField();
    }
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEORPCorrectedLabel _readCoordinate]((uint64_t)self);
  if ([(GEOLatLng *)self->_coordinate hasGreenTeaWithValue:v3]) {
    return 1;
  }
  -[GEORPCorrectedLabel _readFeatureRegion]((uint64_t)self);
  featureRegion = self->_featureRegion;

  return [(GEOMapRegion *)featureRegion hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  v9 = (id *)a3;
  [(GEORPCorrectedLabel *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 16) = self->_readerMarkPos;
  *((_DWORD *)v9 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_originalValue) {
    objc_msgSend(v9, "setOriginalValue:");
  }
  if (self->_correctedValue) {
    objc_msgSend(v9, "setCorrectedValue:");
  }
  if (self->_featureRegion) {
    objc_msgSend(v9, "setFeatureRegion:");
  }
  if ([(GEORPCorrectedLabel *)self featureHandlesCount])
  {
    [v9 clearFeatureHandles];
    unint64_t v4 = [(GEORPCorrectedLabel *)self featureHandlesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPCorrectedLabel *)self featureHandleAtIndex:i];
        [v9 addFeatureHandle:v7];
      }
    }
  }
  if (self->_coordinate) {
    objc_msgSend(v9, "setCoordinate:");
  }
  char flags = (char)self->_flags;
  if (flags)
  {
    v9[7] = self->_uid;
    *((unsigned char *)v9 + 80) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((unsigned char *)v9 + 76) = self->_localizedLabels;
    *((unsigned char *)v9 + 80) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPCorrectedLabelReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPCorrectedLabel *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_originalValue copyWithZone:a3];
  v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  uint64_t v11 = [(NSString *)self->_correctedValue copyWithZone:a3];
  v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  id v13 = [(GEOMapRegion *)self->_featureRegion copyWithZone:a3];
  long long v14 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v13;

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v15 = self->_featureHandles;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v15);
        }
        id v19 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * i), "copyWithZone:", a3, (void)v24);
        [(id)v5 addFeatureHandle:v19];
      }
      uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v16);
  }

  id v20 = [(GEOLatLng *)self->_coordinate copyWithZone:a3];
  uint64_t v21 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v20;

  char flags = (char)self->_flags;
  if (flags)
  {
    *(void *)(v5 + 56) = self->_uid;
    *(unsigned char *)(v5 + 80) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 76) = self->_localizedLabels;
    *(unsigned char *)(v5 + 80) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  [(GEORPCorrectedLabel *)self readAll:1];
  [v4 readAll:1];
  originalValue = self->_originalValue;
  if ((unint64_t)originalValue | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](originalValue, "isEqual:")) {
      goto LABEL_19;
    }
  }
  correctedValue = self->_correctedValue;
  if ((unint64_t)correctedValue | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](correctedValue, "isEqual:")) {
      goto LABEL_19;
    }
  }
  featureRegion = self->_featureRegion;
  if ((unint64_t)featureRegion | *((void *)v4 + 5))
  {
    if (!-[GEOMapRegion isEqual:](featureRegion, "isEqual:")) {
      goto LABEL_19;
    }
  }
  featureHandles = self->_featureHandles;
  if ((unint64_t)featureHandles | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](featureHandles, "isEqual:")) {
      goto LABEL_19;
    }
  }
  coordinate = self->_coordinate;
  if ((unint64_t)coordinate | *((void *)v4 + 2))
  {
    if (!-[GEOLatLng isEqual:](coordinate, "isEqual:")) {
      goto LABEL_19;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0 || self->_uid != *((void *)v4 + 7)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 80))
  {
    goto LABEL_19;
  }
  BOOL v10 = (*((unsigned char *)v4 + 80) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 2) == 0)
    {
LABEL_19:
      BOOL v10 = 0;
      goto LABEL_20;
    }
    if (self->_localizedLabels)
    {
      if (!*((unsigned char *)v4 + 76)) {
        goto LABEL_19;
      }
    }
    else if (*((unsigned char *)v4 + 76))
    {
      goto LABEL_19;
    }
    BOOL v10 = 1;
  }
LABEL_20:

  return v10;
}

- (unint64_t)hash
{
  [(GEORPCorrectedLabel *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_originalValue hash];
  NSUInteger v4 = [(NSString *)self->_correctedValue hash];
  unint64_t v5 = [(GEOMapRegion *)self->_featureRegion hash];
  uint64_t v6 = [(NSMutableArray *)self->_featureHandles hash];
  unint64_t v7 = [(GEOLatLng *)self->_coordinate hash];
  if (*(unsigned char *)&self->_flags)
  {
    unint64_t v8 = 2654435761u * self->_uid;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
  unint64_t v8 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v9 = 2654435761 * self->_localizedLabels;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((void *)v4 + 6)) {
    -[GEORPCorrectedLabel setOriginalValue:](self, "setOriginalValue:");
  }
  if (*((void *)v4 + 3)) {
    -[GEORPCorrectedLabel setCorrectedValue:](self, "setCorrectedValue:");
  }
  featureRegion = self->_featureRegion;
  uint64_t v6 = *((void *)v4 + 5);
  if (featureRegion)
  {
    if (v6) {
      -[GEOMapRegion mergeFrom:](featureRegion, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEORPCorrectedLabel setFeatureRegion:](self, "setFeatureRegion:");
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = *((id *)v4 + 4);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        -[GEORPCorrectedLabel addFeatureHandle:](self, "addFeatureHandle:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  coordinate = self->_coordinate;
  uint64_t v13 = *((void *)v4 + 2);
  if (coordinate)
  {
    if (v13) {
      -[GEOLatLng mergeFrom:](coordinate, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[GEORPCorrectedLabel setCoordinate:](self, "setCoordinate:");
  }
  char v14 = *((unsigned char *)v4 + 80);
  if (v14)
  {
    self->_uid = *((void *)v4 + 7);
    *(unsigned char *)&self->_flags |= 1u;
    char v14 = *((unsigned char *)v4 + 80);
  }
  if ((v14 & 2) != 0)
  {
    self->_localizedLabels = *((unsigned char *)v4 + 76);
    *(unsigned char *)&self->_flags |= 2u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalValue, 0);
  objc_storeStrong((id *)&self->_featureRegion, 0);
  objc_storeStrong((id *)&self->_featureHandles, 0);
  objc_storeStrong((id *)&self->_correctedValue, 0);
  objc_storeStrong((id *)&self->_coordinate, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end