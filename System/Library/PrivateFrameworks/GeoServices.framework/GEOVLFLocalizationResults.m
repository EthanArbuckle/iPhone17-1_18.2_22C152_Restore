@interface GEOVLFLocalizationResults
+ (BOOL)isValid:(id)a3;
+ (Class)localizationDetailsType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasPositionContextClassification;
- (BOOL)hasVlfCorrection;
- (BOOL)hasVlfFinalState;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOVLFCorrection)vlfCorrection;
- (GEOVLFLocalizationResults)init;
- (GEOVLFLocalizationResults)initWithData:(id)a3;
- (GEOVLFLocalizationResults)initWithDictionary:(id)a3;
- (GEOVLFLocalizationResults)initWithJSON:(id)a3;
- (GEOVLFPositionContextClassification)positionContextClassification;
- (NSMutableArray)localizationDetails;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)localizationDetailsAtIndex:(unint64_t)a3;
- (id)vlfFinalStateAsString:(int)a3;
- (int)StringAsVlfFinalState:(id)a3;
- (int)vlfFinalState;
- (unint64_t)hash;
- (unint64_t)localizationDetailsCount;
- (void)_addNoFlagsLocalizationDetails:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readLocalizationDetails;
- (void)_readVlfCorrection;
- (void)addLocalizationDetails:(id)a3;
- (void)clearLocalizationDetails;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasPositionContextClassification:(BOOL)a3;
- (void)setHasVlfFinalState:(BOOL)a3;
- (void)setLocalizationDetails:(id)a3;
- (void)setPositionContextClassification:(GEOVLFPositionContextClassification *)a3;
- (void)setVlfCorrection:(id)a3;
- (void)setVlfFinalState:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOVLFLocalizationResults

- (GEOVLFLocalizationResults)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOVLFLocalizationResults;
  v2 = [(GEOVLFLocalizationResults *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOVLFLocalizationResults)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOVLFLocalizationResults;
  v3 = [(GEOVLFLocalizationResults *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readVlfCorrection
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVLFLocalizationResultsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVlfCorrection_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasVlfCorrection
{
  return self->_vlfCorrection != 0;
}

- (GEOVLFCorrection)vlfCorrection
{
  -[GEOVLFLocalizationResults _readVlfCorrection]((uint64_t)self);
  vlfCorrection = self->_vlfCorrection;

  return vlfCorrection;
}

- (void)setVlfCorrection:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_vlfCorrection, a3);
}

- (int)vlfFinalState
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_vlfFinalState;
  }
  else {
    return 0;
  }
}

- (void)setVlfFinalState:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x12u;
  self->_vlfFinalState = a3;
}

- (void)setHasVlfFinalState:(BOOL)a3
{
  if (a3) {
    char v3 = 18;
  }
  else {
    char v3 = 16;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasVlfFinalState
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)vlfFinalStateAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53F8E00[a3];
  }

  return v3;
}

- (int)StringAsVlfFinalState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"VLFFinalState_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"VLFFinalState_FAILED_TO_INITIALIZE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"VLFFinalState_USER_ABANDONED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"VLFFinalState_FAILED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"VLFFinalState_SUCCEEDED"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readLocalizationDetails
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVLFLocalizationResultsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocalizationDetails_tags_12074);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)localizationDetails
{
  -[GEOVLFLocalizationResults _readLocalizationDetails]((uint64_t)self);
  localizationDetails = self->_localizationDetails;

  return localizationDetails;
}

- (void)setLocalizationDetails:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  localizationDetails = self->_localizationDetails;
  self->_localizationDetails = v4;
}

- (void)clearLocalizationDetails
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  localizationDetails = self->_localizationDetails;

  [(NSMutableArray *)localizationDetails removeAllObjects];
}

- (void)addLocalizationDetails:(id)a3
{
  id v4 = a3;
  -[GEOVLFLocalizationResults _readLocalizationDetails]((uint64_t)self);
  -[GEOVLFLocalizationResults _addNoFlagsLocalizationDetails:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsLocalizationDetails:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      id v4 = *(void **)(a1 + 40);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)localizationDetailsCount
{
  -[GEOVLFLocalizationResults _readLocalizationDetails]((uint64_t)self);
  localizationDetails = self->_localizationDetails;

  return [(NSMutableArray *)localizationDetails count];
}

- (id)localizationDetailsAtIndex:(unint64_t)a3
{
  -[GEOVLFLocalizationResults _readLocalizationDetails]((uint64_t)self);
  localizationDetails = self->_localizationDetails;

  return (id)[(NSMutableArray *)localizationDetails objectAtIndex:a3];
}

+ (Class)localizationDetailsType
{
  return (Class)objc_opt_class();
}

- (GEOVLFPositionContextClassification)positionContextClassification
{
  *retstr = *(GEOVLFPositionContextClassification *)&self->_type;
  return self;
}

- (void)setPositionContextClassification:(GEOVLFPositionContextClassification *)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  uint64_t v3 = *(void *)&a3->_type;
  *(_OWORD *)&self->_positionContextClassification._indoorProbability = *(_OWORD *)&a3->_indoorProbability;
  *(void *)&self->_positionContextClassification._type = v3;
}

- (void)setHasPositionContextClassification:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasPositionContextClassification
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOVLFLocalizationResults;
  id v4 = [(GEOVLFLocalizationResults *)&v8 description];
  id v5 = [(GEOVLFLocalizationResults *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVLFLocalizationResults _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 vlfCorrection];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        id v7 = [v5 jsonRepresentation];
        objc_super v8 = @"vlfCorrection";
      }
      else
      {
        id v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"vlf_correction";
      }
      [v4 setObject:v7 forKey:v8];
    }
    if ((*(unsigned char *)(a1 + 72) & 2) != 0)
    {
      uint64_t v9 = *(int *)(a1 + 68);
      if (v9 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 68));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = off_1E53F8E00[v9];
      }
      if (a2) {
        v11 = @"vlfFinalState";
      }
      else {
        v11 = @"vlf_final_state";
      }
      [v4 setObject:v10 forKey:v11];
    }
    if ([*(id *)(a1 + 40) count])
    {
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v13 = *(id *)(a1 + 40);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v25 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            if (a2) {
              [v18 jsonRepresentation];
            }
            else {
            v19 = [v18 dictionaryRepresentation];
            }
            [v12 addObject:v19];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v15);
      }

      if (a2) {
        v20 = @"localizationDetails";
      }
      else {
        v20 = @"localization_details";
      }
      [v4 setObject:v12 forKey:v20];
    }
    if (*(unsigned char *)(a1 + 72))
    {
      v21 = _GEOVLFPositionContextClassificationDictionaryRepresentation(a1 + 16);
      if (a2) {
        v22 = @"positionContextClassification";
      }
      else {
        v22 = @"position_context_classification";
      }
      [v4 setObject:v21 forKey:v22];
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
  return -[GEOVLFLocalizationResults _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOVLFLocalizationResults)initWithDictionary:(id)a3
{
  return (GEOVLFLocalizationResults *)-[GEOVLFLocalizationResults _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_53;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_53;
  }
  if (a3) {
    objc_super v6 = @"vlfCorrection";
  }
  else {
    objc_super v6 = @"vlf_correction";
  }
  id v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = [GEOVLFCorrection alloc];
    if (a3) {
      uint64_t v9 = [(GEOVLFCorrection *)v8 initWithJSON:v7];
    }
    else {
      uint64_t v9 = [(GEOVLFCorrection *)v8 initWithDictionary:v7];
    }
    v10 = (void *)v9;
    [a1 setVlfCorrection:v9];
  }
  if (a3) {
    v11 = @"vlfFinalState";
  }
  else {
    v11 = @"vlf_final_state";
  }
  v12 = [v5 objectForKeyedSubscript:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v12;
    if ([v13 isEqualToString:@"VLFFinalState_UNKNOWN"])
    {
      uint64_t v14 = 0;
    }
    else if ([v13 isEqualToString:@"VLFFinalState_FAILED_TO_INITIALIZE"])
    {
      uint64_t v14 = 1;
    }
    else if ([v13 isEqualToString:@"VLFFinalState_USER_ABANDONED"])
    {
      uint64_t v14 = 2;
    }
    else if ([v13 isEqualToString:@"VLFFinalState_FAILED"])
    {
      uint64_t v14 = 3;
    }
    else if ([v13 isEqualToString:@"VLFFinalState_SUCCEEDED"])
    {
      uint64_t v14 = 4;
    }
    else
    {
      uint64_t v14 = 0;
    }

    goto LABEL_29;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = [v12 intValue];
LABEL_29:
    [a1 setVlfFinalState:v14];
  }

  if (a3) {
    uint64_t v15 = @"localizationDetails";
  }
  else {
    uint64_t v15 = @"localization_details";
  }
  uint64_t v16 = [v5 objectForKeyedSubscript:v15];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v29 = v5;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v17 = v16;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v35 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v23 = [GEOVLFLocalizationDetails alloc];
            if (a3) {
              uint64_t v24 = [(GEOVLFLocalizationDetails *)v23 initWithJSON:v22];
            }
            else {
              uint64_t v24 = [(GEOVLFLocalizationDetails *)v23 initWithDictionary:v22];
            }
            long long v25 = (void *)v24;
            [a1 addLocalizationDetails:v24];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v19);
    }

    id v5 = v29;
  }

  if (a3) {
    long long v26 = @"positionContextClassification";
  }
  else {
    long long v26 = @"position_context_classification";
  }
  long long v27 = [v5 objectForKeyedSubscript:v26];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v32 = 0uLL;
    uint64_t v33 = 0;
    _GEOVLFPositionContextClassificationFromDictionaryRepresentation(v27, (uint64_t)&v32);
    long long v30 = v32;
    uint64_t v31 = v33;
    [a1 setPositionContextClassification:&v30];
  }

LABEL_53:
  return a1;
}

- (GEOVLFLocalizationResults)initWithJSON:(id)a3
{
  return (GEOVLFLocalizationResults *)-[GEOVLFLocalizationResults _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_12090;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_12091;
    }
    GEOVLFLocalizationResultsReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOVLFLocalizationResultsCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLFLocalizationResultsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLFLocalizationResultsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOVLFLocalizationResultsIsDirty((uint64_t)self) & 1) == 0)
  {
    v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOVLFLocalizationResults *)self readAll:0];
    if (self->_vlfCorrection) {
      PBDataWriterWriteSubmessage();
    }
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_localizationDetails;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    if (*(unsigned char *)&self->_flags)
    {
      PBDataWriterPlaceMark();
      GEOVLFPositionContextClassificationWriteTo((uint64_t)&self->_positionContextClassification);
      PBDataWriterRecallMark();
    }
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  -[GEOVLFLocalizationResults _readLocalizationDetails]((uint64_t)self);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_localizationDetails;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (void)v12))
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (void)copyTo:(id)a3
{
  uint64_t v9 = (id *)a3;
  [(GEOVLFLocalizationResults *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 14) = self->_readerMarkPos;
  *((_DWORD *)v9 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_vlfCorrection) {
    objc_msgSend(v9, "setVlfCorrection:");
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v9 + 17) = self->_vlfFinalState;
    *((unsigned char *)v9 + 72) |= 2u;
  }
  if ([(GEOVLFLocalizationResults *)self localizationDetailsCount])
  {
    [v9 clearLocalizationDetails];
    unint64_t v4 = [(GEOVLFLocalizationResults *)self localizationDetailsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOVLFLocalizationResults *)self localizationDetailsAtIndex:i];
        [v9 addLocalizationDetails:v7];
      }
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v8 = *(void **)&self->_positionContextClassification._type;
    *((_OWORD *)v9 + 1) = *(_OWORD *)&self->_positionContextClassification._indoorProbability;
    v9[4] = v8;
    *((unsigned char *)v9 + 72) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOVLFLocalizationResultsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOVLFLocalizationResults *)self readAll:0];
  id v9 = [(GEOVLFCorrection *)self->_vlfCorrection copyWithZone:a3];
  BOOL v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_vlfFinalState;
    *(unsigned char *)(v5 + 72) |= 2u;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v11 = self->_localizationDetails;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v11);
        }
        long long v15 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (void)v18);
        [(id)v5 addLocalizationDetails:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }

  if (*(unsigned char *)&self->_flags)
  {
    uint64_t v16 = *(void *)&self->_positionContextClassification._type;
    *(_OWORD *)(v5 + 16) = *(_OWORD *)&self->_positionContextClassification._indoorProbability;
    *(void *)(v5 + 32) = v16;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  [(GEOVLFLocalizationResults *)self readAll:1];
  [v4 readAll:1];
  vlfCorrection = self->_vlfCorrection;
  if ((unint64_t)vlfCorrection | *((void *)v4 + 6))
  {
    if (!-[GEOVLFCorrection isEqual:](vlfCorrection, "isEqual:")) {
      goto LABEL_21;
    }
  }
  char flags = (char)self->_flags;
  char v7 = *((unsigned char *)v4 + 72);
  if ((flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 2) == 0 || self->_vlfFinalState != *((_DWORD *)v4 + 17)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 2) != 0)
  {
    goto LABEL_21;
  }
  localizationDetails = self->_localizationDetails;
  if ((unint64_t)localizationDetails | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](localizationDetails, "isEqual:"))
    {
LABEL_21:
      BOOL v9 = 0;
      goto LABEL_22;
    }
    char flags = (char)self->_flags;
    char v7 = *((unsigned char *)v4 + 72);
  }
  BOOL v9 = (v7 & 1) == 0;
  if (flags)
  {
    if (v7)
    {
      BOOL v10 = *(void *)&self->_positionContextClassification._indoorProbability == *((void *)v4 + 2)
         && *(void *)&self->_positionContextClassification._outdoorProbability == *((void *)v4 + 3);
      if (v10 && *(void *)&self->_positionContextClassification._type == *((void *)v4 + 4))
      {
        BOOL v9 = 1;
        goto LABEL_22;
      }
    }
    goto LABEL_21;
  }
LABEL_22:

  return v9;
}

- (unint64_t)hash
{
  [(GEOVLFLocalizationResults *)self readAll:1];
  unint64_t v3 = [(GEOVLFCorrection *)self->_vlfCorrection hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v4 = 2654435761 * self->_vlfFinalState;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [(NSMutableArray *)self->_localizationDetails hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v6 = PBHashBytes();
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  vlfCorrection = self->_vlfCorrection;
  uint64_t v6 = *((void *)v4 + 6);
  if (vlfCorrection)
  {
    if (v6) {
      -[GEOVLFCorrection mergeFrom:](vlfCorrection, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEOVLFLocalizationResults setVlfCorrection:](self, "setVlfCorrection:");
  }
  if ((*((unsigned char *)v4 + 72) & 2) != 0)
  {
    self->_vlfFinalState = *((_DWORD *)v4 + 17);
    *(unsigned char *)&self->_flags |= 2u;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = *((id *)v4 + 5);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        -[GEOVLFLocalizationResults addLocalizationDetails:](self, "addLocalizationDetails:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  if (*((unsigned char *)v4 + 72))
  {
    uint64_t v12 = *((void *)v4 + 4);
    *(_OWORD *)&self->_positionContextClassification._indoorProbability = *((_OWORD *)v4 + 1);
    *(void *)&self->_positionContextClassification._type = v12;
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vlfCorrection, 0);
  objc_storeStrong((id *)&self->_localizationDetails, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end