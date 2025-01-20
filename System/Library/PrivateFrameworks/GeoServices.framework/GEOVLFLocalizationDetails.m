@interface GEOVLFLocalizationDetails
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAlgorithmDetails;
- (BOOL)hasExposureTargetOffset;
- (BOOL)hasFailureDetails;
- (BOOL)hasGravityVector;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasLocation;
- (BOOL)hasPositionContextClassification;
- (BOOL)hasRelativeTimestampMs;
- (BOOL)hasRunTimeMs;
- (BOOL)hasSuccessDetails;
- (BOOL)hasTileDetails;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOVLFFailureDetails)failureDetails;
- (GEOVLFGravityVector)gravityVector;
- (GEOVLFLocalizationAlgorithmDetails)algorithmDetails;
- (GEOVLFLocalizationDetails)init;
- (GEOVLFLocalizationDetails)initWithData:(id)a3;
- (GEOVLFLocalizationDetails)initWithDictionary:(id)a3;
- (GEOVLFLocalizationDetails)initWithJSON:(id)a3;
- (GEOVLFLocation)location;
- (GEOVLFPositionContextClassification)positionContextClassification;
- (GEOVLFSuccessDetails)successDetails;
- (GEOVLFTileDetails)tileDetails;
- (double)exposureTargetOffset;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (unsigned)relativeTimestampMs;
- (unsigned)runTimeMs;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAlgorithmDetails;
- (void)_readFailureDetails;
- (void)_readGravityVector;
- (void)_readLocation;
- (void)_readSuccessDetails;
- (void)_readTileDetails;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAlgorithmDetails:(id)a3;
- (void)setExposureTargetOffset:(double)a3;
- (void)setFailureDetails:(id)a3;
- (void)setGravityVector:(id)a3;
- (void)setHasExposureTargetOffset:(BOOL)a3;
- (void)setHasPositionContextClassification:(BOOL)a3;
- (void)setHasRelativeTimestampMs:(BOOL)a3;
- (void)setHasRunTimeMs:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setPositionContextClassification:(GEOVLFPositionContextClassification *)a3;
- (void)setRelativeTimestampMs:(unsigned int)a3;
- (void)setRunTimeMs:(unsigned int)a3;
- (void)setSuccessDetails:(id)a3;
- (void)setTileDetails:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOVLFLocalizationDetails

- (GEOVLFLocalizationDetails)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOVLFLocalizationDetails;
  v2 = [(GEOVLFLocalizationDetails *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOVLFLocalizationDetails)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOVLFLocalizationDetails;
  v3 = [(GEOVLFLocalizationDetails *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readTileDetails
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVLFLocalizationDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTileDetails_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasTileDetails
{
  return self->_tileDetails != 0;
}

- (GEOVLFTileDetails)tileDetails
{
  -[GEOVLFLocalizationDetails _readTileDetails]((uint64_t)self);
  tileDetails = self->_tileDetails;

  return tileDetails;
}

- (void)setTileDetails:(id)a3
{
  *(_WORD *)&self->_flags |= 0x600u;
  objc_storeStrong((id *)&self->_tileDetails, a3);
}

- (unsigned)relativeTimestampMs
{
  return self->_relativeTimestampMs;
}

- (void)setRelativeTimestampMs:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x404u;
  self->_relativeTimestampMs = a3;
}

- (void)setHasRelativeTimestampMs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1028;
  }
  else {
    __int16 v3 = 1024;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasRelativeTimestampMs
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (unsigned)runTimeMs
{
  return self->_runTimeMs;
}

- (void)setRunTimeMs:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x408u;
  self->_runTimeMs = a3;
}

- (void)setHasRunTimeMs:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1032;
  }
  else {
    __int16 v3 = 1024;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasRunTimeMs
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (void)_readAlgorithmDetails
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVLFLocalizationDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAlgorithmDetails_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasAlgorithmDetails
{
  return self->_algorithmDetails != 0;
}

- (GEOVLFLocalizationAlgorithmDetails)algorithmDetails
{
  -[GEOVLFLocalizationDetails _readAlgorithmDetails]((uint64_t)self);
  algorithmDetails = self->_algorithmDetails;

  return algorithmDetails;
}

- (void)setAlgorithmDetails:(id)a3
{
  *(_WORD *)&self->_flags |= 0x410u;
  objc_storeStrong((id *)&self->_algorithmDetails, a3);
}

- (void)_readSuccessDetails
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVLFLocalizationDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSuccessDetails_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasSuccessDetails
{
  return self->_successDetails != 0;
}

- (GEOVLFSuccessDetails)successDetails
{
  -[GEOVLFLocalizationDetails _readSuccessDetails]((uint64_t)self);
  successDetails = self->_successDetails;

  return successDetails;
}

- (void)setSuccessDetails:(id)a3
{
  *(_WORD *)&self->_flags |= 0x500u;
  objc_storeStrong((id *)&self->_successDetails, a3);
}

- (void)_readFailureDetails
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVLFLocalizationDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFailureDetails_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasFailureDetails
{
  return self->_failureDetails != 0;
}

- (GEOVLFFailureDetails)failureDetails
{
  -[GEOVLFLocalizationDetails _readFailureDetails]((uint64_t)self);
  failureDetails = self->_failureDetails;

  return failureDetails;
}

- (void)setFailureDetails:(id)a3
{
  *(_WORD *)&self->_flags |= 0x420u;
  objc_storeStrong((id *)&self->_failureDetails, a3);
}

- (void)_readGravityVector
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVLFLocalizationDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGravityVector_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasGravityVector
{
  return self->_gravityVector != 0;
}

- (GEOVLFGravityVector)gravityVector
{
  -[GEOVLFLocalizationDetails _readGravityVector]((uint64_t)self);
  gravityVector = self->_gravityVector;

  return gravityVector;
}

- (void)setGravityVector:(id)a3
{
  *(_WORD *)&self->_flags |= 0x440u;
  objc_storeStrong((id *)&self->_gravityVector, a3);
}

- (void)_readLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOVLFLocalizationDetailsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocation_tags_11953);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (GEOVLFLocation)location
{
  -[GEOVLFLocalizationDetails _readLocation]((uint64_t)self);
  location = self->_location;

  return location;
}

- (void)setLocation:(id)a3
{
  *(_WORD *)&self->_flags |= 0x480u;
  objc_storeStrong((id *)&self->_location, a3);
}

- (double)exposureTargetOffset
{
  return self->_exposureTargetOffset;
}

- (void)setExposureTargetOffset:(double)a3
{
  *(_WORD *)&self->_flags |= 0x402u;
  self->_exposureTargetOffset = a3;
}

- (void)setHasExposureTargetOffset:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1026;
  }
  else {
    __int16 v3 = 1024;
  }
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasExposureTargetOffset
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (GEOVLFPositionContextClassification)positionContextClassification
{
  *retstr = *(GEOVLFPositionContextClassification *)&self->_type;
  return self;
}

- (void)setPositionContextClassification:(GEOVLFPositionContextClassification *)a3
{
  *(_WORD *)&self->_flags |= 0x401u;
  uint64_t v3 = *(void *)&a3->_type;
  *(_OWORD *)&self->_positionContextClassification._indoorProbability = *(_OWORD *)&a3->_indoorProbability;
  *(void *)&self->_positionContextClassification._type = v3;
}

- (void)setHasPositionContextClassification:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x400;
}

- (BOOL)hasPositionContextClassification
{
  return *(_WORD *)&self->_flags & 1;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOVLFLocalizationDetails;
  v4 = [(GEOVLFLocalizationDetails *)&v8 description];
  v5 = [(GEOVLFLocalizationDetails *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVLFLocalizationDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 tileDetails];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"tileDetails";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"tile_details";
      }
      [v4 setObject:v7 forKey:v8];
    }
    __int16 v9 = *(_WORD *)(a1 + 116);
    if ((v9 & 4) != 0)
    {
      v10 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 108)];
      if (a2) {
        v11 = @"relativeTimestampMs";
      }
      else {
        v11 = @"relative_timestamp_ms";
      }
      [v4 setObject:v10 forKey:v11];

      __int16 v9 = *(_WORD *)(a1 + 116);
    }
    if ((v9 & 8) != 0)
    {
      v12 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 112)];
      if (a2) {
        v13 = @"runTimeMs";
      }
      else {
        v13 = @"run_time_ms";
      }
      [v4 setObject:v12 forKey:v13];
    }
    v14 = [(id)a1 algorithmDetails];
    v15 = v14;
    if (v14)
    {
      if (a2)
      {
        v16 = [v14 jsonRepresentation];
        v17 = @"algorithmDetails";
      }
      else
      {
        v16 = [v14 dictionaryRepresentation];
        v17 = @"algorithm_details";
      }
      [v4 setObject:v16 forKey:v17];
    }
    v18 = [(id)a1 successDetails];
    v19 = v18;
    if (v18)
    {
      if (a2)
      {
        v20 = [v18 jsonRepresentation];
        v21 = @"successDetails";
      }
      else
      {
        v20 = [v18 dictionaryRepresentation];
        v21 = @"success_details";
      }
      [v4 setObject:v20 forKey:v21];
    }
    v22 = [(id)a1 failureDetails];
    v23 = v22;
    if (v22)
    {
      if (a2)
      {
        v24 = [v22 jsonRepresentation];
        v25 = @"failureDetails";
      }
      else
      {
        v24 = [v22 dictionaryRepresentation];
        v25 = @"failure_details";
      }
      [v4 setObject:v24 forKey:v25];
    }
    v26 = [(id)a1 gravityVector];
    v27 = v26;
    if (v26)
    {
      if (a2)
      {
        v28 = [v26 jsonRepresentation];
        v29 = @"gravityVector";
      }
      else
      {
        v28 = [v26 dictionaryRepresentation];
        v29 = @"gravity_vector";
      }
      [v4 setObject:v28 forKey:v29];
    }
    v30 = [(id)a1 location];
    v31 = v30;
    if (v30)
    {
      if (a2) {
        [v30 jsonRepresentation];
      }
      else {
      v32 = [v30 dictionaryRepresentation];
      }
      [v4 setObject:v32 forKey:@"location"];
    }
    __int16 v33 = *(_WORD *)(a1 + 116);
    if ((v33 & 2) != 0)
    {
      v34 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
      [v4 setObject:v34 forKey:@"exposureTargetOffset"];

      __int16 v33 = *(_WORD *)(a1 + 116);
    }
    if (v33)
    {
      v35 = _GEOVLFPositionContextClassificationDictionaryRepresentation(a1 + 16);
      [v4 setObject:v35 forKey:@"positionContextClassification"];
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
  return -[GEOVLFLocalizationDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOVLFLocalizationDetails)initWithDictionary:(id)a3
{
  return (GEOVLFLocalizationDetails *)-[GEOVLFLocalizationDetails _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"tileDetails";
      }
      else {
        objc_super v6 = @"tile_details";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOVLFTileDetails alloc];
        if (a3) {
          uint64_t v9 = [(GEOVLFTileDetails *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOVLFTileDetails *)v8 initWithDictionary:v7];
        }
        v10 = (void *)v9;
        [a1 setTileDetails:v9];
      }
      if (a3) {
        v11 = @"relativeTimestampMs";
      }
      else {
        v11 = @"relative_timestamp_ms";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setRelativeTimestampMs:", objc_msgSend(v12, "unsignedIntValue"));
      }

      if (a3) {
        v13 = @"runTimeMs";
      }
      else {
        v13 = @"run_time_ms";
      }
      v14 = [v5 objectForKeyedSubscript:v13];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setRunTimeMs:", objc_msgSend(v14, "unsignedIntValue"));
      }

      if (a3) {
        v15 = @"algorithmDetails";
      }
      else {
        v15 = @"algorithm_details";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = [GEOVLFLocalizationAlgorithmDetails alloc];
        if (a3) {
          uint64_t v18 = [(GEOVLFLocalizationAlgorithmDetails *)v17 initWithJSON:v16];
        }
        else {
          uint64_t v18 = [(GEOVLFLocalizationAlgorithmDetails *)v17 initWithDictionary:v16];
        }
        v19 = (void *)v18;
        [a1 setAlgorithmDetails:v18];
      }
      if (a3) {
        v20 = @"successDetails";
      }
      else {
        v20 = @"success_details";
      }
      v21 = [v5 objectForKeyedSubscript:v20];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v22 = [GEOVLFSuccessDetails alloc];
        if (a3) {
          uint64_t v23 = [(GEOVLFSuccessDetails *)v22 initWithJSON:v21];
        }
        else {
          uint64_t v23 = [(GEOVLFSuccessDetails *)v22 initWithDictionary:v21];
        }
        v24 = (void *)v23;
        [a1 setSuccessDetails:v23];
      }
      if (a3) {
        v25 = @"failureDetails";
      }
      else {
        v25 = @"failure_details";
      }
      v26 = [v5 objectForKeyedSubscript:v25];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v27 = [GEOVLFFailureDetails alloc];
        if (a3) {
          uint64_t v28 = [(GEOVLFFailureDetails *)v27 initWithJSON:v26];
        }
        else {
          uint64_t v28 = [(GEOVLFFailureDetails *)v27 initWithDictionary:v26];
        }
        v29 = (void *)v28;
        [a1 setFailureDetails:v28];
      }
      if (a3) {
        v30 = @"gravityVector";
      }
      else {
        v30 = @"gravity_vector";
      }
      v31 = [v5 objectForKeyedSubscript:v30];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v32 = [GEOVLFGravityVector alloc];
        if (a3) {
          uint64_t v33 = [(GEOVLFGravityVector *)v32 initWithJSON:v31];
        }
        else {
          uint64_t v33 = [(GEOVLFGravityVector *)v32 initWithDictionary:v31];
        }
        v34 = (void *)v33;
        [a1 setGravityVector:v33];
      }
      v35 = [v5 objectForKeyedSubscript:@"location"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v36 = [GEOVLFLocation alloc];
        if (a3) {
          uint64_t v37 = [(GEOVLFLocation *)v36 initWithJSON:v35];
        }
        else {
          uint64_t v37 = [(GEOVLFLocation *)v36 initWithDictionary:v35];
        }
        v38 = (void *)v37;
        [a1 setLocation:v37];
      }
      v39 = [v5 objectForKeyedSubscript:@"exposureTargetOffset"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v39 doubleValue];
        objc_msgSend(a1, "setExposureTargetOffset:");
      }

      v40 = [v5 objectForKeyedSubscript:@"positionContextClassification"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v44 = 0uLL;
        uint64_t v45 = 0;
        _GEOVLFPositionContextClassificationFromDictionaryRepresentation(v40, (uint64_t)&v44);
        long long v42 = v44;
        uint64_t v43 = v45;
        [a1 setPositionContextClassification:&v42];
      }
    }
  }

  return a1;
}

- (GEOVLFLocalizationDetails)initWithJSON:(id)a3
{
  return (GEOVLFLocalizationDetails *)-[GEOVLFLocalizationDetails _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_12001;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_12002;
    }
    GEOVLFLocalizationDetailsReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOVLFLocalizationDetailsCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLFLocalizationDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLFLocalizationDetailsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOVLFLocalizationDetailsIsDirty((uint64_t)self) & 1) == 0)
  {
    objc_super v8 = self->_reader;
    objc_sync_enter(v8);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v9 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v9];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v8);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOVLFLocalizationDetails *)self readAll:0];
    if (self->_tileDetails) {
      PBDataWriterWriteSubmessage();
    }
    __int16 flags = (__int16)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteUint32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 8) != 0) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_algorithmDetails) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_successDetails) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_failureDetails) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_gravityVector) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_location) {
      PBDataWriterWriteSubmessage();
    }
    __int16 v7 = (__int16)self->_flags;
    if ((v7 & 2) != 0)
    {
      PBDataWriterWriteDoubleField();
      __int16 v7 = (__int16)self->_flags;
    }
    if (v7)
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
  -[GEOVLFLocalizationDetails _readLocation]((uint64_t)self);
  location = self->_location;

  return [(GEOVLFLocation *)location hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  objc_super v8 = (id *)a3;
  [(GEOVLFLocalizationDetails *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 24) = self->_readerMarkPos;
  *((_DWORD *)v8 + 25) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_tileDetails) {
    objc_msgSend(v8, "setTileDetails:");
  }
  __int16 flags = (__int16)self->_flags;
  id v5 = v8;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)v8 + 27) = self->_relativeTimestampMs;
    *((_WORD *)v8 + 58) |= 4u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 8) != 0)
  {
    *((_DWORD *)v8 + 28) = self->_runTimeMs;
    *((_WORD *)v8 + 58) |= 8u;
  }
  if (self->_algorithmDetails)
  {
    objc_msgSend(v8, "setAlgorithmDetails:");
    id v5 = v8;
  }
  if (self->_successDetails)
  {
    objc_msgSend(v8, "setSuccessDetails:");
    id v5 = v8;
  }
  if (self->_failureDetails)
  {
    objc_msgSend(v8, "setFailureDetails:");
    id v5 = v8;
  }
  if (self->_gravityVector)
  {
    objc_msgSend(v8, "setGravityVector:");
    id v5 = v8;
  }
  if (self->_location)
  {
    objc_msgSend(v8, "setLocation:");
    id v5 = v8;
  }
  __int16 v6 = (__int16)self->_flags;
  if ((v6 & 2) != 0)
  {
    v5[6] = *(id *)&self->_exposureTargetOffset;
    *((_WORD *)v5 + 58) |= 2u;
    __int16 v6 = (__int16)self->_flags;
  }
  if (v6)
  {
    __int16 v7 = *(void **)&self->_positionContextClassification._type;
    *((_OWORD *)v5 + 1) = *(_OWORD *)&self->_positionContextClassification._indoorProbability;
    v5[4] = v7;
    *((_WORD *)v5 + 58) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    __int16 v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x400) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOVLFLocalizationDetailsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOVLFLocalizationDetails *)self readAll:0];
  id v9 = [(GEOVLFTileDetails *)self->_tileDetails copyWithZone:a3];
  v10 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v9;

  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 108) = self->_relativeTimestampMs;
    *(_WORD *)(v5 + 116) |= 4u;
    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 112) = self->_runTimeMs;
    *(_WORD *)(v5 + 116) |= 8u;
  }
  id v12 = [(GEOVLFLocalizationAlgorithmDetails *)self->_algorithmDetails copyWithZone:a3];
  v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  id v14 = [(GEOVLFSuccessDetails *)self->_successDetails copyWithZone:a3];
  v15 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v14;

  id v16 = [(GEOVLFFailureDetails *)self->_failureDetails copyWithZone:a3];
  v17 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v16;

  id v18 = [(GEOVLFGravityVector *)self->_gravityVector copyWithZone:a3];
  v19 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v18;

  id v20 = [(GEOVLFLocation *)self->_location copyWithZone:a3];
  v21 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v20;

  __int16 v22 = (__int16)self->_flags;
  if ((v22 & 2) != 0)
  {
    *(double *)(v5 + 48) = self->_exposureTargetOffset;
    *(_WORD *)(v5 + 116) |= 2u;
    __int16 v22 = (__int16)self->_flags;
  }
  if (v22)
  {
    uint64_t v23 = *(void *)&self->_positionContextClassification._type;
    *(_OWORD *)(v5 + 16) = *(_OWORD *)&self->_positionContextClassification._indoorProbability;
    *(void *)(v5 + 32) = v23;
    *(_WORD *)(v5 + 116) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_38;
  }
  [(GEOVLFLocalizationDetails *)self readAll:1];
  [v4 readAll:1];
  tileDetails = self->_tileDetails;
  if ((unint64_t)tileDetails | *((void *)v4 + 11))
  {
    if (!-[GEOVLFTileDetails isEqual:](tileDetails, "isEqual:")) {
      goto LABEL_38;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v7 = *((_WORD *)v4 + 58);
  if ((flags & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_relativeTimestampMs != *((_DWORD *)v4 + 27)) {
      goto LABEL_38;
    }
  }
  else if ((v7 & 4) != 0)
  {
LABEL_38:
    BOOL v15 = 0;
    goto LABEL_39;
  }
  if ((flags & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_runTimeMs != *((_DWORD *)v4 + 28)) {
      goto LABEL_38;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_38;
  }
  algorithmDetails = self->_algorithmDetails;
  if ((unint64_t)algorithmDetails | *((void *)v4 + 5)
    && !-[GEOVLFLocalizationAlgorithmDetails isEqual:](algorithmDetails, "isEqual:"))
  {
    goto LABEL_38;
  }
  successDetails = self->_successDetails;
  if ((unint64_t)successDetails | *((void *)v4 + 10))
  {
    if (!-[GEOVLFSuccessDetails isEqual:](successDetails, "isEqual:")) {
      goto LABEL_38;
    }
  }
  failureDetails = self->_failureDetails;
  if ((unint64_t)failureDetails | *((void *)v4 + 7))
  {
    if (!-[GEOVLFFailureDetails isEqual:](failureDetails, "isEqual:")) {
      goto LABEL_38;
    }
  }
  gravityVector = self->_gravityVector;
  if ((unint64_t)gravityVector | *((void *)v4 + 8))
  {
    if (!-[GEOVLFGravityVector isEqual:](gravityVector, "isEqual:")) {
      goto LABEL_38;
    }
  }
  location = self->_location;
  if ((unint64_t)location | *((void *)v4 + 9))
  {
    if (!-[GEOVLFLocation isEqual:](location, "isEqual:")) {
      goto LABEL_38;
    }
  }
  __int16 v13 = (__int16)self->_flags;
  __int16 v14 = *((_WORD *)v4 + 58);
  if ((v13 & 2) != 0)
  {
    if ((v14 & 2) == 0 || self->_exposureTargetOffset != *((double *)v4 + 6)) {
      goto LABEL_38;
    }
  }
  else if ((v14 & 2) != 0)
  {
    goto LABEL_38;
  }
  BOOL v15 = (v14 & 1) == 0;
  if (v13)
  {
    if (v14)
    {
      BOOL v16 = *(void *)&self->_positionContextClassification._indoorProbability == *((void *)v4 + 2)
         && *(void *)&self->_positionContextClassification._outdoorProbability == *((void *)v4 + 3);
      if (v16 && *(void *)&self->_positionContextClassification._type == *((void *)v4 + 4))
      {
        BOOL v15 = 1;
        goto LABEL_39;
      }
    }
    goto LABEL_38;
  }
LABEL_39:

  return v15;
}

- (unint64_t)hash
{
  [(GEOVLFLocalizationDetails *)self readAll:1];
  unint64_t v20 = [(GEOVLFTileDetails *)self->_tileDetails hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    uint64_t v18 = 2654435761 * self->_relativeTimestampMs;
    if ((flags & 8) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v18 = 0;
    if ((flags & 8) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_runTimeMs;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  unint64_t v5 = [(GEOVLFLocalizationAlgorithmDetails *)self->_algorithmDetails hash];
  unint64_t v6 = [(GEOVLFSuccessDetails *)self->_successDetails hash];
  unint64_t v7 = [(GEOVLFFailureDetails *)self->_failureDetails hash];
  unint64_t v8 = [(GEOVLFGravityVector *)self->_gravityVector hash];
  unint64_t v9 = [(GEOVLFLocation *)self->_location hash];
  __int16 v10 = (__int16)self->_flags;
  if ((v10 & 2) != 0)
  {
    double exposureTargetOffset = self->_exposureTargetOffset;
    double v13 = -exposureTargetOffset;
    if (exposureTargetOffset >= 0.0) {
      double v13 = self->_exposureTargetOffset;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v11 += (unint64_t)v15;
      }
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  if (v10) {
    uint64_t v16 = PBHashBytes();
  }
  else {
    uint64_t v16 = 0;
  }
  return v19 ^ v20 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v20 = a3;
  [v20 readAll:0];
  uint64_t v4 = v20;
  tileDetails = self->_tileDetails;
  uint64_t v6 = v20[11];
  if (tileDetails)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOVLFTileDetails mergeFrom:](tileDetails, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOVLFLocalizationDetails setTileDetails:](self, "setTileDetails:");
  }
  uint64_t v4 = v20;
LABEL_7:
  __int16 v7 = *((_WORD *)v4 + 58);
  if ((v7 & 4) != 0)
  {
    self->_relativeTimestampMs = *((_DWORD *)v4 + 27);
    *(_WORD *)&self->_flags |= 4u;
    __int16 v7 = *((_WORD *)v4 + 58);
  }
  if ((v7 & 8) != 0)
  {
    self->_runTimeMs = *((_DWORD *)v4 + 28);
    *(_WORD *)&self->_flags |= 8u;
  }
  algorithmDetails = self->_algorithmDetails;
  uint64_t v9 = v4[5];
  if (algorithmDetails)
  {
    if (!v9) {
      goto LABEL_17;
    }
    -[GEOVLFLocalizationAlgorithmDetails mergeFrom:](algorithmDetails, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_17;
    }
    -[GEOVLFLocalizationDetails setAlgorithmDetails:](self, "setAlgorithmDetails:");
  }
  uint64_t v4 = v20;
LABEL_17:
  successDetails = self->_successDetails;
  uint64_t v11 = v4[10];
  if (successDetails)
  {
    if (!v11) {
      goto LABEL_23;
    }
    -[GEOVLFSuccessDetails mergeFrom:](successDetails, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_23;
    }
    -[GEOVLFLocalizationDetails setSuccessDetails:](self, "setSuccessDetails:");
  }
  uint64_t v4 = v20;
LABEL_23:
  failureDetails = self->_failureDetails;
  uint64_t v13 = v4[7];
  if (failureDetails)
  {
    if (!v13) {
      goto LABEL_29;
    }
    -[GEOVLFFailureDetails mergeFrom:](failureDetails, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_29;
    }
    -[GEOVLFLocalizationDetails setFailureDetails:](self, "setFailureDetails:");
  }
  uint64_t v4 = v20;
LABEL_29:
  gravityVector = self->_gravityVector;
  uint64_t v15 = v4[8];
  if (gravityVector)
  {
    if (!v15) {
      goto LABEL_35;
    }
    -[GEOVLFGravityVector mergeFrom:](gravityVector, "mergeFrom:");
  }
  else
  {
    if (!v15) {
      goto LABEL_35;
    }
    -[GEOVLFLocalizationDetails setGravityVector:](self, "setGravityVector:");
  }
  uint64_t v4 = v20;
LABEL_35:
  location = self->_location;
  uint64_t v17 = v4[9];
  if (location)
  {
    if (!v17) {
      goto LABEL_41;
    }
    -[GEOVLFLocation mergeFrom:](location, "mergeFrom:");
  }
  else
  {
    if (!v17) {
      goto LABEL_41;
    }
    -[GEOVLFLocalizationDetails setLocation:](self, "setLocation:");
  }
  uint64_t v4 = v20;
LABEL_41:
  __int16 v18 = *((_WORD *)v4 + 58);
  if ((v18 & 2) != 0)
  {
    self->_double exposureTargetOffset = (double)v4[6];
    *(_WORD *)&self->_flags |= 2u;
    __int16 v18 = *((_WORD *)v4 + 58);
  }
  if (v18)
  {
    uint64_t v19 = v4[4];
    *(_OWORD *)&self->_positionContextClassification._indoorProbability = *((_OWORD *)v4 + 1);
    *(void *)&self->_positionContextClassification._type = v19;
    *(_WORD *)&self->_flags |= 1u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileDetails, 0);
  objc_storeStrong((id *)&self->_successDetails, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_gravityVector, 0);
  objc_storeStrong((id *)&self->_failureDetails, 0);
  objc_storeStrong((id *)&self->_algorithmDetails, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end