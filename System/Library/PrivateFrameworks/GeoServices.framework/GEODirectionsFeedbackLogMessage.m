@interface GEODirectionsFeedbackLogMessage
+ (BOOL)isValid:(id)a3;
+ (Class)directionsFeedbackType;
- (BOOL)arrivedAtDestination;
- (BOOL)hasArrivedAtDestination;
- (BOOL)hasDurationOfTrip;
- (BOOL)hasFinalLocation;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasNavigationAudioFeedback;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEODirectionsFeedbackLogMessage)init;
- (GEODirectionsFeedbackLogMessage)initWithData:(id)a3;
- (GEODirectionsFeedbackLogMessage)initWithDictionary:(id)a3;
- (GEODirectionsFeedbackLogMessage)initWithJSON:(id)a3;
- (GEOLocation)finalLocation;
- (GEONavigationAudioFeedback)navigationAudioFeedback;
- (NSMutableArray)directionsFeedbacks;
- (double)durationOfTrip;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)directionsFeedbackAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (unint64_t)directionsFeedbacksCount;
- (unint64_t)hash;
- (void)_addNoFlagsDirectionsFeedback:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readDirectionsFeedbacks;
- (void)_readFinalLocation;
- (void)addDirectionsFeedback:(id)a3;
- (void)clearDirectionsFeedbacks;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setArrivedAtDestination:(BOOL)a3;
- (void)setDirectionsFeedbacks:(id)a3;
- (void)setDurationOfTrip:(double)a3;
- (void)setFinalLocation:(id)a3;
- (void)setHasArrivedAtDestination:(BOOL)a3;
- (void)setHasDurationOfTrip:(BOOL)a3;
- (void)setHasNavigationAudioFeedback:(BOOL)a3;
- (void)setNavigationAudioFeedback:(GEONavigationAudioFeedback *)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEODirectionsFeedbackLogMessage

- (GEODirectionsFeedbackLogMessage)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEODirectionsFeedbackLogMessage;
  v2 = [(GEODirectionsFeedbackLogMessage *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEODirectionsFeedbackLogMessage)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEODirectionsFeedbackLogMessage;
  v3 = [(GEODirectionsFeedbackLogMessage *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDirectionsFeedbacks
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(unsigned char *)(a1 + 104) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsFeedbackLogMessageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDirectionsFeedbacks_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (NSMutableArray)directionsFeedbacks
{
  -[GEODirectionsFeedbackLogMessage _readDirectionsFeedbacks]((uint64_t)self);
  directionsFeedbacks = self->_directionsFeedbacks;

  return directionsFeedbacks;
}

- (void)setDirectionsFeedbacks:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  directionsFeedbacks = self->_directionsFeedbacks;
  self->_directionsFeedbacks = v4;
}

- (void)clearDirectionsFeedbacks
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  directionsFeedbacks = self->_directionsFeedbacks;

  [(NSMutableArray *)directionsFeedbacks removeAllObjects];
}

- (void)addDirectionsFeedback:(id)a3
{
  id v4 = a3;
  -[GEODirectionsFeedbackLogMessage _readDirectionsFeedbacks]((uint64_t)self);
  -[GEODirectionsFeedbackLogMessage _addNoFlagsDirectionsFeedback:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsDirectionsFeedback:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 64);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v5;

      id v4 = *(void **)(a1 + 64);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)directionsFeedbacksCount
{
  -[GEODirectionsFeedbackLogMessage _readDirectionsFeedbacks]((uint64_t)self);
  directionsFeedbacks = self->_directionsFeedbacks;

  return [(NSMutableArray *)directionsFeedbacks count];
}

- (id)directionsFeedbackAtIndex:(unint64_t)a3
{
  -[GEODirectionsFeedbackLogMessage _readDirectionsFeedbacks]((uint64_t)self);
  directionsFeedbacks = self->_directionsFeedbacks;

  return (id)[(NSMutableArray *)directionsFeedbacks objectAtIndex:a3];
}

+ (Class)directionsFeedbackType
{
  return (Class)objc_opt_class();
}

- (void)_readFinalLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(unsigned char *)(a1 + 104) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsFeedbackLogMessageReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFinalLocation_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasFinalLocation
{
  return self->_finalLocation != 0;
}

- (GEOLocation)finalLocation
{
  -[GEODirectionsFeedbackLogMessage _readFinalLocation]((uint64_t)self);
  finalLocation = self->_finalLocation;

  return finalLocation;
}

- (void)setFinalLocation:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_finalLocation, a3);
}

- (BOOL)arrivedAtDestination
{
  return self->_arrivedAtDestination;
}

- (void)setArrivedAtDestination:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x24u;
  self->_arrivedAtDestination = a3;
}

- (void)setHasArrivedAtDestination:(BOOL)a3
{
  if (a3) {
    char v3 = 36;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasArrivedAtDestination
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (GEONavigationAudioFeedback)navigationAudioFeedback
{
  long long v3 = *(_OWORD *)&self->_spokenPromptsCount;
  *(_OWORD *)&retstr->_bTHFPAvailableAtEndOfNav = *(_OWORD *)&self->_manuallyChangedRouteCount;
  *(_OWORD *)&retstr->_manuallyChangedRouteCount = v3;
  *(_OWORD *)&retstr->_pauseSpokenAudioEnabled = *(_OWORD *)&self[1]._bTHFPAvailableAtEndOfNav;
  return self;
}

- (void)setNavigationAudioFeedback:(GEONavigationAudioFeedback *)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  long long v4 = *(_OWORD *)&a3->_bTHFPAvailableAtEndOfNav;
  long long v3 = *(_OWORD *)&a3->_manuallyChangedRouteCount;
  *(_OWORD *)&self->_navigationAudioFeedback._pauseSpokenAudioEnabled = *(_OWORD *)&a3->_pauseSpokenAudioEnabled;
  *(_OWORD *)&self->_navigationAudioFeedback._bTHFPAvailableAtEndOfNav = v4;
  *(_OWORD *)&self->_navigationAudioFeedback._manuallyChangedRouteCount = v3;
}

- (void)setHasNavigationAudioFeedback:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasNavigationAudioFeedback
{
  return *(unsigned char *)&self->_flags & 1;
}

- (double)durationOfTrip
{
  return self->_durationOfTrip;
}

- (void)setDurationOfTrip:(double)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  self->_durationOfTrip = a3;
}

- (void)setHasDurationOfTrip:(BOOL)a3
{
  if (a3) {
    char v3 = 34;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasDurationOfTrip
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEODirectionsFeedbackLogMessage;
  long long v4 = [(GEODirectionsFeedbackLogMessage *)&v8 description];
  id v5 = [(GEODirectionsFeedbackLogMessage *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEODirectionsFeedbackLogMessage _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    long long v4 = 0;
    goto LABEL_38;
  }
  [(id)a1 readAll:1];
  long long v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([*(id *)(a1 + 64) count])
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v6 = *(id *)(a1 + 64);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if (a2) {
            [v11 jsonRepresentation];
          }
          else {
          v12 = objc_msgSend(v11, "dictionaryRepresentation", (void)v26);
          }
          objc_msgSend(v5, "addObject:", v12, (void)v26);
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v8);
    }

    if (a2) {
      v13 = @"directionsFeedback";
    }
    else {
      v13 = @"directions_feedback";
    }
    objc_msgSend(v4, "setObject:forKey:", v5, v13, (void)v26);
  }
  v14 = [(id)a1 finalLocation];
  v15 = v14;
  if (v14)
  {
    if (a2)
    {
      v16 = [v14 jsonRepresentation];
      v17 = @"finalLocation";
    }
    else
    {
      v16 = [v14 dictionaryRepresentation];
      v17 = @"final_location";
    }
    [v4 setObject:v16 forKey:v17];
  }
  char v18 = *(unsigned char *)(a1 + 104);
  if ((v18 & 4) == 0)
  {
    if ((*(unsigned char *)(a1 + 104) & 1) == 0) {
      goto LABEL_24;
    }
LABEL_30:
    if (a2) {
      v21 = @"navigationAudioFeedback";
    }
    else {
      v21 = @"navigation_audio_feedback";
    }
    v22 = _GEONavigationAudioFeedbackDictionaryRepresentation((unsigned __int8 *)(a1 + 16), a2);
    [v4 setObject:v22 forKey:v21];

    if ((*(unsigned char *)(a1 + 104) & 2) == 0) {
      goto LABEL_38;
    }
    goto LABEL_34;
  }
  v19 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 100)];
  if (a2) {
    v20 = @"arrivedAtDestination";
  }
  else {
    v20 = @"arrived_at_destination";
  }
  [v4 setObject:v19 forKey:v20];

  char v18 = *(unsigned char *)(a1 + 104);
  if (v18) {
    goto LABEL_30;
  }
LABEL_24:
  if ((v18 & 2) != 0)
  {
LABEL_34:
    v23 = [NSNumber numberWithDouble:*(double *)(a1 + 72)];
    if (a2) {
      v24 = @"durationOfTrip";
    }
    else {
      v24 = @"duration_of_trip";
    }
    [v4 setObject:v23 forKey:v24];
  }
LABEL_38:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEODirectionsFeedbackLogMessage _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEODirectionsFeedbackLogMessage)initWithDictionary:(id)a3
{
  return (GEODirectionsFeedbackLogMessage *)-[GEODirectionsFeedbackLogMessage _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        id v6 = @"directionsFeedback";
      }
      else {
        id v6 = @"directions_feedback";
      }
      uint64_t v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v29 = v5;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v34 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void *)(*((void *)&v33 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v14 = [GEODirectionsFeedback alloc];
                if (a3) {
                  uint64_t v15 = [(GEODirectionsFeedback *)v14 initWithJSON:v13];
                }
                else {
                  uint64_t v15 = [(GEODirectionsFeedback *)v14 initWithDictionary:v13];
                }
                v16 = (void *)v15;
                [a1 addDirectionsFeedback:v15];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
          }
          while (v10);
        }

        id v5 = v29;
      }

      if (a3) {
        v17 = @"finalLocation";
      }
      else {
        v17 = @"final_location";
      }
      char v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v19 = [GEOLocation alloc];
        if (a3) {
          uint64_t v20 = [(GEOLocation *)v19 initWithJSON:v18];
        }
        else {
          uint64_t v20 = [(GEOLocation *)v19 initWithDictionary:v18];
        }
        v21 = (void *)v20;
        [a1 setFinalLocation:v20];
      }
      if (a3) {
        v22 = @"arrivedAtDestination";
      }
      else {
        v22 = @"arrived_at_destination";
      }
      v23 = [v5 objectForKeyedSubscript:v22];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setArrivedAtDestination:", objc_msgSend(v23, "BOOLValue"));
      }

      if (a3) {
        v24 = @"navigationAudioFeedback";
      }
      else {
        v24 = @"navigation_audio_feedback";
      }
      v25 = [v5 objectForKeyedSubscript:v24];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        memset(v32, 0, 44);
        _GEONavigationAudioFeedbackFromDictionaryRepresentation(v25, (uint64_t)v32, a3);
        long long v30 = v32[0];
        v31[0] = v32[1];
        *(_OWORD *)((char *)v31 + 12) = *(_OWORD *)((char *)&v32[1] + 12);
        [a1 setNavigationAudioFeedback:&v30];
      }

      if (a3) {
        long long v26 = @"durationOfTrip";
      }
      else {
        long long v26 = @"duration_of_trip";
      }
      long long v27 = [v5 objectForKeyedSubscript:v26];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v27 doubleValue];
        objc_msgSend(a1, "setDurationOfTrip:");
      }
    }
  }

  return a1;
}

- (GEODirectionsFeedbackLogMessage)initWithJSON:(id)a3
{
  return (GEODirectionsFeedbackLogMessage *)-[GEODirectionsFeedbackLogMessage _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_3;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_3;
    }
    GEODirectionsFeedbackLogMessageReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEODirectionsFeedbackLogMessageCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEODirectionsFeedbackLogMessageIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEODirectionsFeedbackLogMessageReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEODirectionsFeedbackLogMessageIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v11 = self->_reader;
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
    [(GEODirectionsFeedbackLogMessage *)self readAll:0];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = self->_directionsFeedbacks;
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

    if (self->_finalLocation) {
      PBDataWriterWriteSubmessage();
    }
    char flags = (char)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      char flags = (char)self->_flags;
    }
    if (flags)
    {
      PBDataWriterPlaceMark();
      GEONavigationAudioFeedbackWriteTo((uint64_t)&self->_navigationAudioFeedback);
      PBDataWriterRecallMark();
      char flags = (char)self->_flags;
    }
    if ((flags & 2) != 0) {
      PBDataWriterWriteDoubleField();
    }
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  -[GEODirectionsFeedbackLogMessage _readDirectionsFeedbacks]((uint64_t)self);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_directionsFeedbacks;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9), "hasGreenTeaWithValue:", v3, (void)v11))
        {

          return 1;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  -[GEODirectionsFeedbackLogMessage _readFinalLocation]((uint64_t)self);
  return [(GEOLocation *)self->_finalLocation hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  long long v11 = (char *)a3;
  [(GEODirectionsFeedbackLogMessage *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)v11 + 1, self->_reader);
  *((_DWORD *)v11 + 22) = self->_readerMarkPos;
  *((_DWORD *)v11 + 23) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEODirectionsFeedbackLogMessage *)self directionsFeedbacksCount])
  {
    [v11 clearDirectionsFeedbacks];
    unint64_t v4 = [(GEODirectionsFeedbackLogMessage *)self directionsFeedbacksCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEODirectionsFeedbackLogMessage *)self directionsFeedbackAtIndex:i];
        [v11 addDirectionsFeedback:v7];
      }
    }
  }
  if (self->_finalLocation) {
    objc_msgSend(v11, "setFinalLocation:");
  }
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    v11[100] = self->_arrivedAtDestination;
    v11[104] |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_9:
      if ((flags & 2) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_9;
  }
  long long v9 = *(_OWORD *)&self->_navigationAudioFeedback._pauseSpokenAudioEnabled;
  long long v10 = *(_OWORD *)&self->_navigationAudioFeedback._manuallyChangedRouteCount;
  *((_OWORD *)v11 + 1) = *(_OWORD *)&self->_navigationAudioFeedback._bTHFPAvailableAtEndOfNav;
  *((_OWORD *)v11 + 2) = v10;
  *(_OWORD *)(v11 + 44) = v9;
  v11[104] |= 1u;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
LABEL_10:
    *((void *)v11 + 9) = *(void *)&self->_durationOfTrip;
    v11[104] |= 2u;
  }
LABEL_11:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEODirectionsFeedbackLogMessage *)self readAll:0];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v9 = self->_directionsFeedbacks;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v9);
          }
          long long v13 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "copyWithZone:", a3, (void)v20);
          [(id)v5 addDirectionsFeedback:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v10);
    }

    id v14 = [(GEOLocation *)self->_finalLocation copyWithZone:a3];
    long long v15 = *(void **)(v5 + 80);
    *(void *)(v5 + 80) = v14;

    char flags = (char)self->_flags;
    if ((flags & 4) != 0)
    {
      *(unsigned char *)(v5 + 100) = self->_arrivedAtDestination;
      *(unsigned char *)(v5 + 104) |= 4u;
      char flags = (char)self->_flags;
      if ((flags & 1) == 0)
      {
LABEL_14:
        if ((flags & 2) == 0) {
          return (id)v5;
        }
LABEL_15:
        *(double *)(v5 + 72) = self->_durationOfTrip;
        *(unsigned char *)(v5 + 104) |= 2u;
        return (id)v5;
      }
    }
    else if ((*(unsigned char *)&self->_flags & 1) == 0)
    {
      goto LABEL_14;
    }
    long long v18 = *(_OWORD *)&self->_navigationAudioFeedback._pauseSpokenAudioEnabled;
    long long v19 = *(_OWORD *)&self->_navigationAudioFeedback._manuallyChangedRouteCount;
    *(_OWORD *)(v5 + 16) = *(_OWORD *)&self->_navigationAudioFeedback._bTHFPAvailableAtEndOfNav;
    *(_OWORD *)(v5 + 32) = v19;
    *(_OWORD *)(v5 + 44) = v18;
    *(unsigned char *)(v5 + 104) |= 1u;
    if ((*(unsigned char *)&self->_flags & 2) == 0) {
      return (id)v5;
    }
    goto LABEL_15;
  }
  uint64_t v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEODirectionsFeedbackLogMessageReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  id v8 = (id)v5;
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  [(GEODirectionsFeedbackLogMessage *)self readAll:1];
  [v4 readAll:1];
  directionsFeedbacks = self->_directionsFeedbacks;
  if ((unint64_t)directionsFeedbacks | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](directionsFeedbacks, "isEqual:")) {
      goto LABEL_23;
    }
  }
  finalLocation = self->_finalLocation;
  if ((unint64_t)finalLocation | *((void *)v4 + 10))
  {
    if (!-[GEOLocation isEqual:](finalLocation, "isEqual:")) {
      goto LABEL_23;
    }
  }
  $E433E743BDDBF5A76DA75B10F34169DC flags = self->_flags;
  int v8 = v4[104];
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((v8 & 4) == 0) {
      goto LABEL_23;
    }
    if (self->_arrivedAtDestination)
    {
      if (!v4[100]) {
        goto LABEL_23;
      }
    }
    else if (v4[100])
    {
      goto LABEL_23;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_23;
  }
  if ((*(unsigned char *)&flags & 1) == 0 || (v8 & 1) == 0)
  {
    if (((*(_DWORD *)&flags | v8) & 1) == 0) {
      goto LABEL_19;
    }
LABEL_23:
    BOOL v9 = 0;
    goto LABEL_24;
  }
  if (memcmp(&self->_navigationAudioFeedback, v4 + 16, 0x2CuLL)) {
    goto LABEL_23;
  }
LABEL_19:
  BOOL v9 = (v8 & 2) == 0;
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_durationOfTrip != *((double *)v4 + 9)) {
      goto LABEL_23;
    }
    BOOL v9 = 1;
  }
LABEL_24:

  return v9;
}

- (unint64_t)hash
{
  [(GEODirectionsFeedbackLogMessage *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_directionsFeedbacks hash];
  unint64_t v4 = [(GEOLocation *)self->_finalLocation hash];
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    uint64_t v5 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v11;
  }
  uint64_t v5 = 2654435761 * self->_arrivedAtDestination;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v6 = PBHashBytes();
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  double durationOfTrip = self->_durationOfTrip;
  double v8 = -durationOfTrip;
  if (durationOfTrip >= 0.0) {
    double v8 = self->_durationOfTrip;
  }
  long double v9 = floor(v8 + 0.5);
  double v10 = (v8 - v9) * 1.84467441e19;
  unint64_t v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0) {
      v11 += (unint64_t)v10;
    }
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (char *)a3;
  [v4 readAll:0];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = *((id *)v4 + 8);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEODirectionsFeedbackLogMessage addDirectionsFeedback:](self, "addDirectionsFeedback:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  finalLocation = self->_finalLocation;
  uint64_t v11 = *((void *)v4 + 10);
  if (finalLocation)
  {
    if (v11) {
      -[GEOLocation mergeFrom:](finalLocation, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[GEODirectionsFeedbackLogMessage setFinalLocation:](self, "setFinalLocation:");
  }
  char v12 = v4[104];
  if ((v12 & 4) == 0)
  {
    if ((v4[104] & 1) == 0) {
      goto LABEL_15;
    }
LABEL_19:
    long long v13 = *(_OWORD *)(v4 + 44);
    long long v14 = *((_OWORD *)v4 + 2);
    *(_OWORD *)&self->_navigationAudioFeedback._bTHFPAvailableAtEndOfNav = *((_OWORD *)v4 + 1);
    *(_OWORD *)&self->_navigationAudioFeedback._manuallyChangedRouteCount = v14;
    *(_OWORD *)&self->_navigationAudioFeedback._pauseSpokenAudioEnabled = v13;
    *(unsigned char *)&self->_flags |= 1u;
    if ((v4[104] & 2) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  self->_arrivedAtDestination = v4[100];
  *(unsigned char *)&self->_flags |= 4u;
  char v12 = v4[104];
  if (v12) {
    goto LABEL_19;
  }
LABEL_15:
  if ((v12 & 2) != 0)
  {
LABEL_16:
    self->_double durationOfTrip = *((double *)v4 + 9);
    *(unsigned char *)&self->_flags |= 2u;
  }
LABEL_17:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalLocation, 0);
  objc_storeStrong((id *)&self->_directionsFeedbacks, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end